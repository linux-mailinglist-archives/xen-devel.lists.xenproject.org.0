Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CD16184888E
	for <lists+xen-devel@lfdr.de>; Sat,  3 Feb 2024 20:30:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.675436.1050841 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rWLi8-0004hb-71; Sat, 03 Feb 2024 19:29:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 675436.1050841; Sat, 03 Feb 2024 19:29:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rWLi8-0004e4-0n; Sat, 03 Feb 2024 19:29:56 +0000
Received: by outflank-mailman (input) for mailman id 675436;
 Sat, 03 Feb 2024 18:53:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WIqD=JM=gmail.com=rbmarliere@srs-se1.protection.inumbo.net>)
 id 1rWL8h-0000aF-1I
 for xen-devel@lists.xenproject.org; Sat, 03 Feb 2024 18:53:19 +0000
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com
 [2607:f8b0:4864:20::1035])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7c572b2b-c2c5-11ee-98f5-efadbce2ee36;
 Sat, 03 Feb 2024 19:53:15 +0100 (CET)
Received: by mail-pj1-x1035.google.com with SMTP id
 98e67ed59e1d1-295c8b795e2so2334082a91.0
 for <xen-devel@lists.xenproject.org>; Sat, 03 Feb 2024 10:53:15 -0800 (PST)
Received: from mail.marliere.net ([24.199.118.162])
 by smtp.gmail.com with ESMTPSA id
 s15-20020a17090ad48f00b0029636e02c83sm2143181pju.35.2024.02.03.10.53.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 03 Feb 2024 10:53:13 -0800 (PST)
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
X-Inumbo-ID: 7c572b2b-c2c5-11ee-98f5-efadbce2ee36
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706986394; x=1707591194;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:dkim-signature:from:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xhpVXJ+IMs5n5HNm3DBIJeHeLpAjHMNMhg7tgPyvFRk=;
        b=H5XMAFxaQQWmOt17FbGQZka99oeOhDcMJW07MlOBMrFbTqjfr2DkU1e6nX/f0kh8Rb
         zYQF9SPAUR3pY5OtscgkqpS+7aBuCVAXeu0M23UtDnSAr8SWc5WOCYkI7ruui72vBxI7
         S4yMq3WeLFORSPqC8jl8g0HMckUXF01IoizEbmhVNgrdSJINO+ckopijq2Y/sJcbBnK1
         TD6BquEk9HJv51Qrm4+jmdPmiATpeSiJ3500f2VgFK6U1OApHJgCJymIy+kX3ijv+imX
         PAuybluVSogJnrJeMsh5vLYIc5W6/J35XysbLZHPAEv/bQoTPNVK3p8oGRnhpe9lQbQK
         MWYg==
X-Gm-Message-State: AOJu0YzEOHLeDnu5cI7rYBH7zB5wWhG6dg9JcTfQKuk+fnBdojhQWgmc
	X4T32Qo/eUPb1u+5eGByY20EfbYaxD/UGEngY/kWZ6XF19vyElDr
X-Google-Smtp-Source: AGHT+IHNiV9m9PnT9NfWWTLKS5PfvHJH3YAPWwmMb5gceIQF3VaO+pK7Qdw5HKIhnVCxyVRzaLS1KA==
X-Received: by 2002:a17:90a:fd84:b0:295:ab00:e9b9 with SMTP id cx4-20020a17090afd8400b00295ab00e9b9mr8137370pjb.5.1706986393946;
        Sat, 03 Feb 2024 10:53:13 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCXU3F//e13WRqDNIvePL9ElC+L1hOrpM9eXVNU4WUyGNILtV/P/hwWPIxHcY/Hvjec4tjvqzgBxTPCeEAppBqwINIMrDzRToVZ0tb5Z/wj6qHZyi4NVR1xqob4Xsz+T70MOVp0cAogc/podyejn4uFBRbE4r4EOOtlGtaKY7e2jZh8oi3f3/uNG4PgqC+bs/xyOW6UAaWOlg2fGjiWqRkI=
From: "Ricardo B. Marliere" <ricardo@marliere.net>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=marliere.net;
	s=2023; t=1706986392;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xhpVXJ+IMs5n5HNm3DBIJeHeLpAjHMNMhg7tgPyvFRk=;
	b=HgpwLjLE+5IojjaDPw5lVDBUECMPSExHUMPhE++AL5xcGmYR3TeDz16MbH7zvVuZcuV5RZ
	4CNrmHvySWMapk0sZFaMJeQB6tvCEaW0NIrF7d4w6ZrmiMrby4BgZAvN9+tjz2G++u4r4w
	g1WohaDiXSkJ1PbbGFjguIfXcDkazNeuHAmnsCs4+TAQfGKlZ7bW55I1mz//fZzFDUowaB
	tk1ydtFuveiyVSiNX44BG98XUe9QjlUuP2GlA8LuzUTVUjJx+In/cmZUhiecYr1pC45nAL
	G5A49wyLaW2gu6Xab/A/hPxI/xxjRRLzA32U6yU+UZiHTQntU4nRd9xKIoQPuQ==
Authentication-Results: ORIGINATING;
	auth=pass smtp.auth=ricardo@marliere.net smtp.mailfrom=ricardo@marliere.net
Date: Sat, 03 Feb 2024 15:53:37 -0300
Subject: [PATCH 1/2] xen: pcpu: make xen_pcpu_subsys const
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240203-bus_cleanup-xen-v1-1-c2f5fe89ed95@marliere.net>
References: <20240203-bus_cleanup-xen-v1-0-c2f5fe89ed95@marliere.net>
In-Reply-To: <20240203-bus_cleanup-xen-v1-0-c2f5fe89ed95@marliere.net>
To: Juergen Gross <jgross@suse.com>, 
 Stefano Stabellini <sstabellini@kernel.org>, 
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Cc: xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Ricardo B. Marliere" <ricardo@marliere.net>
X-Developer-Signature: v=1; a=openpgp-sha256; l=846; i=ricardo@marliere.net;
 h=from:subject:message-id; bh=uVbAr2jHnQr3MqspyOfEzRc9k0HTklRcQDcrLwrPX2E=;
 b=owEBbQKS/ZANAwAKAckLinxjhlimAcsmYgBlvouxTV6WmgHhD2cBPYK/XUfsjwDH4uwBWaCje
 UD7Ddr2uBiJAjMEAAEKAB0WIQQDCo6eQk7jwGVXh+HJC4p8Y4ZYpgUCZb6LsQAKCRDJC4p8Y4ZY
 pqGCEACkMVwx/dvxAGqkTeMv3vt97i5rt0L9zEHqvNbgGvxqXH7vIcUCDiuX+ziP0EpEUVdYV7k
 lpXpbodhjS9FFsFGFz+otupP0ETTWlykpYf/fV0R6CVcDHTGeh0KsvlBE7wUod6gN+x3+70cpxV
 EUX/Gy7KTHd/1RUYtnvcWjdNXky9qsWIHZ2gUY29UljGu+pWgXXM0y6N0bWUdI8jOVr/O08mscj
 NWZMFj6l0KmP/xmu/YZtnsvmmG59BTE+1TDPZMwWv8Bc0NBN/Crf+cdpOUHf4Ttp8Pm2kGuarNT
 epDpJ5MtH4kwMI2VrQfnzo7rBSHjPn0o2n1LofwAcPMkcJ8dP6YA9/p3MC+hfScuRVo3pmo44En
 zjZwz2RoD2zzRhDoj1uJqjWwVl6bsxnTOgHp+FRHWnCzFb5QBWGpGYD6RskC7YyrywFqE5cr7cW
 pU4zo1L7Cx+k2hvWPt20+Q6fuF4zike1ItHUAfV1yGVnk5vMDQYUMgYzaDanTJInoosriAsw0mi
 OpefvNjEidNZXxXHfsem3ZpKpUonrVqErVqmKcEgeaT2BKa4DoqQMwyubVpOD8pSA2KOMZyWWpQ
 IBegfAdUOBd2Jv+Tf2UkaszcT1FEawY0F5HjWONwE5U2joStmRWirRS/yA3lTCeB2laJlFHBY9L
 waKgnT3rwMWDgAg==
X-Developer-Key: i=ricardo@marliere.net; a=openpgp;
 fpr=030A8E9E424EE3C0655787E1C90B8A7C638658A6

Now that the driver core can properly handle constant struct bus_type,
move the xen_pcpu_subsys variable to be a constant structure as well,
placing it into read-only memory which can not be modified at runtime.

Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Suggested-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Signed-off-by: Ricardo B. Marliere <ricardo@marliere.net>
---
 drivers/xen/pcpu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/xen/pcpu.c b/drivers/xen/pcpu.c
index 508655273145..c63f317e3df3 100644
--- a/drivers/xen/pcpu.c
+++ b/drivers/xen/pcpu.c
@@ -65,7 +65,7 @@ struct pcpu {
 	uint32_t flags;
 };
 
-static struct bus_type xen_pcpu_subsys = {
+static const struct bus_type xen_pcpu_subsys = {
 	.name = "xen_cpu",
 	.dev_name = "xen_cpu",
 };

-- 
2.43.0


