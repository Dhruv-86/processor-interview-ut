package com.transaction.spay.Controller;

import com.transaction.spay.Model.Account;
import com.transaction.spay.Model.BadTransaction;
import com.transaction.spay.Model.Card;
import com.transaction.spay.Services.TransactionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

@Controller
public class TransactionController {

    @Autowired
    private TransactionService transactionService;

    @RequestMapping(value = "/", method = RequestMethod.GET)
    public ModelAndView loadUploadPage() {
        return new ModelAndView("upload");
    }

    @RequestMapping(value = "/upload", method = RequestMethod.POST)
    @ResponseBody
    public ResponseEntity<List<FileUploadResponse>> handleFileUpload(@RequestParam("files") MultipartFile[] files) {

        List<FileUploadResponse> uploadedFiles = new ArrayList<>();

        for (MultipartFile file : files) {
            if (!file.isEmpty()) {
                try {

                    File tempFile = File.createTempFile("upload-", "-" + file.getOriginalFilename());
                    file.transferTo(tempFile);


                    transactionService.processFile(tempFile);


                    tempFile.delete();


                    uploadedFiles.add(new FileUploadResponse(file.getOriginalFilename(), true));

                } catch (Exception e) {
                    e.printStackTrace();
                    uploadedFiles.add(new FileUploadResponse(file.getOriginalFilename(), false));
                }
            }
        }


        return ResponseEntity.ok(uploadedFiles);
    }

    @GetMapping("/accountDetails")
    public ModelAndView showAccountDetails() {
        List<Account> accounts = transactionService.getAllAccounts();

        ModelAndView mav = new ModelAndView("accountDetails");
        mav.addObject("accounts", accounts);
        return mav;
    }


    @GetMapping("/badTransaction")
    public ModelAndView showBadTransactions() {
        List<BadTransaction> badTransactions = transactionService.getBadTransactions();

        ModelAndView mav = new ModelAndView("badTransaction");
        mav.addObject("badTransactions", badTransactions);
        return mav;
    }


    @GetMapping("/collections")
    public ModelAndView showCollections() {
        List<Card> cardsInCollections = transactionService.getCardsInCollections();

        ModelAndView mav = new ModelAndView("collections");
        mav.addObject("cards", cardsInCollections);
        return mav;
    }


    @GetMapping("/reset")
    public String resetSystem() {
        transactionService.resetSystem();
        return "redirect:/";
    }


    public static class FileUploadResponse {
        private String name;
        private boolean success;

        public FileUploadResponse(String name, boolean success) {
            this.name = name;
            this.success = success;
        }


        public String getName() {
            return name;
        }

        public boolean isSuccess() {
            return success;
        }
    }
}
