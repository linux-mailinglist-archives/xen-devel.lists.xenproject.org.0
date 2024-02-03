Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E73A784888F
	for <lists+xen-devel@lfdr.de>; Sat,  3 Feb 2024 20:30:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.675438.1050845 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rWLi8-0004kD-CE; Sat, 03 Feb 2024 19:29:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 675438.1050845; Sat, 03 Feb 2024 19:29:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rWLi8-0004g3-6t; Sat, 03 Feb 2024 19:29:56 +0000
Received: by outflank-mailman (input) for mailman id 675438;
 Sat, 03 Feb 2024 18:53:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WIqD=JM=gmail.com=rbmarliere@srs-se1.protection.inumbo.net>)
 id 1rWL8i-0000aF-Bf
 for xen-devel@lists.xenproject.org; Sat, 03 Feb 2024 18:53:20 +0000
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com
 [2607:f8b0:4864:20::62f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7e4fe044-c2c5-11ee-98f5-efadbce2ee36;
 Sat, 03 Feb 2024 19:53:18 +0100 (CET)
Received: by mail-pl1-x62f.google.com with SMTP id
 d9443c01a7336-1d746ce7d13so26478225ad.0
 for <xen-devel@lists.xenproject.org>; Sat, 03 Feb 2024 10:53:18 -0800 (PST)
Received: from mail.marliere.net ([24.199.118.162])
 by smtp.gmail.com with ESMTPSA id
 l5-20020a170902e2c500b001d974ffa1fcsm3058420plc.173.2024.02.03.10.53.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 03 Feb 2024 10:53:16 -0800 (PST)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: 7e4fe044-c2c5-11ee-98f5-efadbce2ee36
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706986397; x=1707591197;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:dkim-signature:from:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UMK6uKXfNz/nsGcon/C8VrTPd2Ab3T3BTLt2EsWBnyE=;
        b=saFRPwXInioejC9THgb1GFaYjwXfKwzzx3foD7cVpDbopbriM/v9ZFu5Q3Ejh4zO8n
         DTh72HFCjeZcLJzSDs2mJNGWVaXjZaWJ+n72mh7Flt2U8weOVnLllUp2OG0enPXC/xrO
         Z2UB/VoZJlFNPGl0Rne9gSYIimAB1dMphhAmrCJGO6Uj4FVfAaOaIdSP/asCul+K9DMv
         TnAc3V/KsIgbmi6YXOCptcn4eJsFXr6hl/KHoAHJmqYToT0+uU8WQWYWAgdCI24hFq5H
         sK5yuc/PY1NNBfimXngFzI8cFRdyqKPWiQLjEpuGko6E2QQm/Zhu1QkrOQGYLXqvSJmE
         p20A==
X-Gm-Message-State: AOJu0YzAEmtXHMPyiph74d9yUzLMM7lcXoT50wkAW1eG39HfggOE0V8k
	YLmDmyFK2x7H0dotAq9ZdxXgSfmKwkQdxiat+Sgsv0Th2C56+rjN
X-Google-Smtp-Source: AGHT+IGbH6ZYJYqCyLdLrsDa8OizYNf648PZ/HHOu7tx8iYG0Ii4xFkddglDF0dNTfItn0AvcwNOSw==
X-Received: by 2002:a17:903:249:b0:1d4:e208:9b0 with SMTP id j9-20020a170903024900b001d4e20809b0mr11130471plh.44.1706986397240;
        Sat, 03 Feb 2024 10:53:17 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCW2Fadp/SGhL3HK6yTH0lKP3rfGEbv8/GAi3tzKf8/aeB0by5STQsj+r3op+wDEmYIuRn3Y/pBERUwnHxVAj4AYKwjYXs2RMwgg8oZjWyGFLFfGNnYidF/TBcQMLaYr33BdKR1jQVFG4GsnUWg1Hw7QkEcXLBHAY2zOJza4ElNmpOGKSOReeWllojdyhoXBArdQTvK9HvU0OGd8+ruzpG4=
From: "Ricardo B. Marliere" <ricardo@marliere.net>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=marliere.net;
	s=2023; t=1706986395;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UMK6uKXfNz/nsGcon/C8VrTPd2Ab3T3BTLt2EsWBnyE=;
	b=d/b91IH79JyEKl4lTtvPDJZkgOP3vWmmAkRT4CCuLWZ0q0cM4YSYxO5x90ynhmRNqoGAb2
	MX5rNMnI6UgqZnWkeyWxjhJFxu6toynOA6u1Xf39buDCaFsawntbhwVEJp4N+4J3Ac2VGr
	5JhntPbRQe4HHwF5nDA3tPxH7mRIfY9eC35llsvDKa1lKbPx5tocjZGIlRdh4fmxIRP4dz
	lDNqKI/O8JqdQhhFkkGn7Ql88HC6qMjbRvdMxfjHIwzMEgQ1Pv8KMtRVhdEHMuj4oHrKqI
	4GnnRAarZ2sl5RD64TTF9uXul3GTgCxT+M5jvICQ2/zjXOW1oyqh6CeYlAXRYw==
Authentication-Results: ORIGINATING;
	auth=pass smtp.auth=ricardo@marliere.net smtp.mailfrom=ricardo@marliere.net
Date: Sat, 03 Feb 2024 15:53:38 -0300
Subject: [PATCH 2/2] xen: balloon: make balloon_subsys const
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240203-bus_cleanup-xen-v1-2-c2f5fe89ed95@marliere.net>
References: <20240203-bus_cleanup-xen-v1-0-c2f5fe89ed95@marliere.net>
In-Reply-To: <20240203-bus_cleanup-xen-v1-0-c2f5fe89ed95@marliere.net>
To: Juergen Gross <jgross@suse.com>, 
 Stefano Stabellini <sstabellini@kernel.org>, 
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Cc: xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Ricardo B. Marliere" <ricardo@marliere.net>
X-Developer-Signature: v=1; a=openpgp-sha256; l=931; i=ricardo@marliere.net;
 h=from:subject:message-id; bh=a15mtQr01yfWQWLF5/5WsbY/2R7o79ghPTBzDCe5X0Y=;
 b=owEBbQKS/ZANAwAKAckLinxjhlimAcsmYgBlvouxq6eiZcwBEfL0eKDgR/Tsw3cuRwc1xJx6s
 WHMrCFJCRGJAjMEAAEKAB0WIQQDCo6eQk7jwGVXh+HJC4p8Y4ZYpgUCZb6LsQAKCRDJC4p8Y4ZY
 poA/EACY3HzoQHClLbpnthOER522MUTZO2lQJLXt+WNqaobWySLeseiDeex2CGxWdeGsn4gzV3s
 SCD7J00yLWCX29j3M/BvDTPmePA+mavHsyQ8rQielbuNnr3B5iXLYmHFaBEHd4D2+LC7NolXmwA
 XDAa2sLewEnr7rvIk2PMjlmcHa/KIOh6G7Ls/12Q95339qmdPhDIbZk4NjH2KY8Pr8OAzRw4DpW
 UptByEzu3k1kS59uBT7FfrjvIU4fWmEmlJAWU/LoXKt+AlkbrOoNcKRsXX0Z174cxZlT6u3EHeA
 I2zaEzpITAelotRc53pJpVw4pzdKJoodaRIIF0+Tnolc3K2iclnHCHLVP4ZzSdP4cuSd5yaD/Me
 yyS84r5wQksXW4aqTvmhHDVz/YVK/N2O9wGRo/hQiDzT5LZKnBuXJWYc0zDIrLdI/Bint4kKJDm
 ygxa+XRL8U7KhpMsuSe2vrNMlvt5+r6SVeqQ+3PyxjSEIHm5A6Tlq87EC3InHuN7v+bv6ciEkb6
 WMn5YKTe/VR9rmjUqqIs9KaSOzg5EBPrU5KJAi+EPyEBuUOOYUoNxAaea7dJMRdHqRIhcyvb40J
 khD83wKupnXtMRyuSG2iGRp64bsE1ep9J/UU27/ZdmANXs+kxoaU0PnFf1APqUm18cS3GHxwLRs
 PWecp9qGUFo1M6g==
X-Developer-Key: i=ricardo@marliere.net; a=openpgp;
 fpr=030A8E9E424EE3C0655787E1C90B8A7C638658A6

Now that the driver core can properly handle constant struct bus_type,
move the balloon_subsys variable to be a constant structure as well,
placing it into read-only memory which can not be modified at runtime.

Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Suggested-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Signed-off-by: Ricardo B. Marliere <ricardo@marliere.net>
---
 drivers/xen/xen-balloon.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/xen/xen-balloon.c b/drivers/xen/xen-balloon.c
index 8cd583db20b1..b293d7652f15 100644
--- a/drivers/xen/xen-balloon.c
+++ b/drivers/xen/xen-balloon.c
@@ -237,7 +237,7 @@ static const struct attribute_group *balloon_groups[] = {
 	NULL
 };
 
-static struct bus_type balloon_subsys = {
+static const struct bus_type balloon_subsys = {
 	.name = BALLOON_CLASS_NAME,
 	.dev_name = BALLOON_CLASS_NAME,
 };

-- 
2.43.0


