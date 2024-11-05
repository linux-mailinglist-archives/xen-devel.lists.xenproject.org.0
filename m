Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4023A9BCDB0
	for <lists+xen-devel@lfdr.de>; Tue,  5 Nov 2024 14:21:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.830217.1245147 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t8JUH-0006H8-Aw; Tue, 05 Nov 2024 13:20:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 830217.1245147; Tue, 05 Nov 2024 13:20:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t8JUH-0006Em-8J; Tue, 05 Nov 2024 13:20:49 +0000
Received: by outflank-mailman (input) for mailman id 830217;
 Tue, 05 Nov 2024 13:09:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wqyn=SA=gmail.com=chenqiuji666@srs-se1.protection.inumbo.net>)
 id 1t8JJQ-0003vg-1O
 for xen-devel@lists.xenproject.org; Tue, 05 Nov 2024 13:09:36 +0000
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com
 [2607:f8b0:4864:20::641])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3137e59e-9b77-11ef-a0c5-8be0dac302b0;
 Tue, 05 Nov 2024 14:09:32 +0100 (CET)
Received: by mail-pl1-x641.google.com with SMTP id
 d9443c01a7336-21116b187c4so37268915ad.3
 for <xen-devel@lists.xenproject.org>; Tue, 05 Nov 2024 05:09:30 -0800 (PST)
Received: from tom-QiTianM540-A739.. ([106.39.42.118])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-211057a306esm77998805ad.144.2024.11.05.05.09.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Nov 2024 05:09:28 -0800 (PST)
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
X-Inumbo-ID: 3137e59e-9b77-11ef-a0c5-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjI2MDc6ZjhiMDo0ODY0OjIwOjo2NDEiLCJoZWxvIjoibWFpbC1wbDEteDY0MS5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjMxMzdlNTllLTliNzctMTFlZi1hMGM1LThiZTBkYWMzMDJiMCIsInRzIjoxNzMwODEyMTcyLjc0ODA1OSwic2VuZGVyIjoiY2hlbnFpdWppNjY2QGdtYWlsLmNvbSIsInJlY2lwaWVudCI6Inhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZyJ9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730812169; x=1731416969; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=UDWyygav+8muC3u5fmkiDyo/AKuSKyI9CkFr65axGHk=;
        b=IuyUkSq81B37Xw1s8Tx6Tuvihp0Pu+yT7JY1+q6hUNCE823mcgFTPH1ZzoNSHi8lFD
         Es8OCNeLKsp+F/iUvTR4PSa+oyztuhorpv8iZZ4SZdUB0X6yaIl46sIUYjaV+CfOZccE
         z3UQVxoZPPNAkfBc2rLlUqDHLA53zcmdJq8gWf7e/++a0A2xZSx65qpJLnTg2BJapz99
         LizqavuatJIa8SZD3y+iXmhJeCkATWrWXr6yA7cPhEE6TJl3KFu2WnJ1gJUiFSWO7ETy
         JBYLO15B7nRgG1P/7RrofaVkX7zcP7e8Tj9ukpWZt93/HSodV6GXwVf69Sz7eRkqOHTa
         7V5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730812169; x=1731416969;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UDWyygav+8muC3u5fmkiDyo/AKuSKyI9CkFr65axGHk=;
        b=qfMSZND5HvqAT02tRd/epdnxAsOqwZ3L65H8noMnP3qt0BCrwcOtVGN3Xrx596AdSI
         0eNvVGan7SzoohyD5qAjCKM/KtvwaWD07Eh3bFwbZ9JZlaK2nbPmEylVzg+iYfZxrWPm
         fHrQY4qSQtDjb6FwcrnoCgOm70wozjSGuIh+DWeGYdUI9vPvMtWHGmlnCeSOXwq5fJeD
         2gipCxqO9USxVuyI3b7wnhkpkzm3PR6NYBQMwIcQc54XDGzeIMhAZ+1dsC8ohMeIByHa
         GkjOoA+TPDty6c0p7rimLJIsRHWF3RBaGJuiKcnmcf8Hw39nr1yKhKZIeMLVNEtWZoSW
         NC1A==
X-Gm-Message-State: AOJu0YybaRMEUWzXJPBkncJJ/USfsN3B+SDDeDYYY06iXuoSGlffqqGY
	YZSJjsEvooAaNTzKyLWO8b42RboqMXBUTLYIMSD3S/VBB89WplaK
X-Google-Smtp-Source: AGHT+IF1g8Nn9YJy/sRBPmJnKRunRLCLlieuQkXJ2jxt8P/MMM6nEAY++N1OmI759/YFFuLeFvjT3A==
X-Received: by 2002:a17:903:440d:b0:20e:55b0:3607 with SMTP id d9443c01a7336-2111af1cbbcmr199687325ad.2.1730812169318;
        Tue, 05 Nov 2024 05:09:29 -0800 (PST)
From: Qiu-ji Chen <chenqiuji666@gmail.com>
To: jgross@suse.com,
	sstabellini@kernel.org,
	oleksandr_tyshchenko@epam.com,
	gregkh@linuxfoundation.org,
	sumit.garg@linaro.org,
	xin.wang2@amd.com
Cc: xen-devel@lists.xenproject.org,
	linux-kernel@vger.kernel.org,
	baijiaju1990@gmail.com,
	Qiu-ji Chen <chenqiuji666@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] xen: Fix the issue of resource not being properly released in xenbus_dev_probe()
Date: Tue,  5 Nov 2024 21:09:19 +0800
Message-Id: <20241105130919.4621-1-chenqiuji666@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch fixes an issue in the function xenbus_dev_probe(). In the 
xenbus_dev_probe() function, within the if (err) branch at line 313, the 
program incorrectly returns err directly without releasing the resources 
allocated by err = drv->probe(dev, id). As the return value is non-zero, 
the upper layers assume the processing logic has failed. However, the probe
operation was performed earlier without a corresponding remove operation. 
Since the probe actually allocates resources, failing to perform the remove
operation could lead to problems.

To fix this issue, we followed the resource release logic of the 
xenbus_dev_remove() function by adding a new block fail_remove before the 
fail_put block. After entering the branch if (err) at line 313, the 
function will use a goto statement to jump to the fail_remove block, 
ensuring that the previously acquired resources are correctly released, 
thus preventing the reference count leak.

This bug was identified by an experimental static analysis tool developed
by our team. The tool specializes in analyzing reference count operations
and detecting potential issues where resources are not properly managed.
In this case, the tool flagged the missing release operation as a
potential problem, which led to the development of this patch.

Fixes: 4bac07c993d0 ("xen: add the Xenbus sysfs and virtual device hotplug driver")
Cc: stable@vger.kernel.org
Signed-off-by: Qiu-ji Chen <chenqiuji666@gmail.com>
---
 drivers/xen/xenbus/xenbus_probe.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/xen/xenbus/xenbus_probe.c b/drivers/xen/xenbus/xenbus_probe.c
index 9f097f1f4a4c..6d32ffb01136 100644
--- a/drivers/xen/xenbus/xenbus_probe.c
+++ b/drivers/xen/xenbus/xenbus_probe.c
@@ -313,7 +313,7 @@ int xenbus_dev_probe(struct device *_dev)
 	if (err) {
 		dev_warn(&dev->dev, "watch_otherend on %s failed.\n",
 		       dev->nodename);
-		return err;
+		goto fail_remove;
 	}
 
 	dev->spurious_threshold = 1;
@@ -322,6 +322,12 @@ int xenbus_dev_probe(struct device *_dev)
 			 dev->nodename);
 
 	return 0;
+fail_remove:
+	if (drv->remove) {
+		down(&dev->reclaim_sem);
+		drv->remove(dev);
+		up(&dev->reclaim_sem);
+	}
 fail_put:
 	module_put(drv->driver.owner);
 fail:
-- 
2.34.1


