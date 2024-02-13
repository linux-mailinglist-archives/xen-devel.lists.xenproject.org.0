Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D8C7853056
	for <lists+xen-devel@lfdr.de>; Tue, 13 Feb 2024 13:17:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.679850.1057662 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rZrjK-0000Gh-TY; Tue, 13 Feb 2024 12:17:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 679850.1057662; Tue, 13 Feb 2024 12:17:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rZrjK-0000EE-Q8; Tue, 13 Feb 2024 12:17:42 +0000
Received: by outflank-mailman (input) for mailman id 679850;
 Tue, 13 Feb 2024 11:21:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DGbd=JW=gmail.com=breno.debian@srs-se1.protection.inumbo.net>)
 id 1rZqr2-0004Sn-SF
 for xen-devel@lists.xenproject.org; Tue, 13 Feb 2024 11:21:36 +0000
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com
 [209.85.208.53]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0b931cc6-ca62-11ee-98f5-efadbce2ee36;
 Tue, 13 Feb 2024 12:21:34 +0100 (CET)
Received: by mail-ed1-f53.google.com with SMTP id
 4fb4d7f45d1cf-55a5e7fa471so5527101a12.1
 for <xen-devel@lists.xenproject.org>; Tue, 13 Feb 2024 03:21:34 -0800 (PST)
Received: from localhost (fwdproxy-lla-005.fbsv.net.
 [2a03:2880:30ff:5::face:b00c]) by smtp.gmail.com with ESMTPSA id
 vw3-20020a170907a70300b00a3c66ac512asm1191224ejc.214.2024.02.13.03.21.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Feb 2024 03:21:33 -0800 (PST)
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
X-Inumbo-ID: 0b931cc6-ca62-11ee-98f5-efadbce2ee36
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707823294; x=1708428094;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cuiaVQ6xHYwzgr9cteCqN0D6TVSa51dvKVi3pXWKJaE=;
        b=iYT59SR82LjDRbcm+rFHvSLwzipnK53Fg/PhBv2zOF2sfUeb45KK+XF4nql6rrjZEh
         d0H9tb9ud6SgmC+dhtGYWHRIIaNVyGuAXCaVHQMNKdSxqpbJacbn/frkADZIbbIb7OwD
         3mnAJaQZjD4UhxXzjrqyDDZgzIuDAApFHVmIbHwDyCC1ufoWML8lkiqU5ptk2iA3+8ot
         fgmDarmv18Ssbhu5C3Z6ibuh5K6f3VaslwBMf0obkCyFr897Wj3FonDDm5pCIhhRW3Rx
         2JsYdW4xFywtE9/IiVafuyYc+bCUZ71PQvYLGYMihziaHThdJsWPX8pU0IkktaNGbDNR
         2ZQA==
X-Gm-Message-State: AOJu0Yzn/VvlilsCaX/14+IPJhZYt39/wmEHUwNbUlUAJxTah2nWa47t
	KydpEC0+29D8OP+7ckSJCNHPGoPlGBeoj8ZcyLb6hGgaQZEP7w+c
X-Google-Smtp-Source: AGHT+IEv53qb/jU/q9VIX3Gx9EPG0zlDnaS4y/im5dQM+F2RnxQvedrUeNJK514EezeM/+8URcxAEw==
X-Received: by 2002:a17:906:4144:b0:a3c:82ed:5b46 with SMTP id l4-20020a170906414400b00a3c82ed5b46mr5065767ejk.59.1707823293939;
        Tue, 13 Feb 2024 03:21:33 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUz0v9+Mi6zmFUyJoPQn8nNZKJnBjRetK0SFlIJ9CNm4LQ1UNy0UiKtLBlEEtGLEbzUxs3YRg/JptpG2rh0DJINfUNyx2noHYPNlsDiQmwFHDXWKoZSgsnQ4RZtu7I6wjLW58bcNXhXpRMADteqtr+y93bZTemChK1U2JwCroTv22PFl2FuYECkpkBvL7i0HoO2Ut3SJY1eF7os1cD1p9uRly8yNiU0MyAMaMNhc1e7QX9TrPkHGBrPIq/r0sV6P1rBiw2HpoB8NIQE0rfgYl/BO201iAj6M7U5m2OsRA==
From: Breno Leitao <leitao@debian.org>
To: kuba@kernel.org,
	davem@davemloft.net,
	pabeni@redhat.com,
	edumazet@google.com,
	Wei Liu <wei.liu@kernel.org>,
	Paul Durrant <paul@xen.org>
Cc: netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	horms@kernel.org,
	xen-devel@lists.xenproject.org (moderated list:XEN NETWORK BACKEND DRIVER)
Subject: [PATCH net 1/7] net: fill in MODULE_DESCRIPTION()s for xen-netback
Date: Tue, 13 Feb 2024 03:21:16 -0800
Message-Id: <20240213112122.404045-2-leitao@debian.org>
X-Mailer: git-send-email 2.39.3
In-Reply-To: <20240213112122.404045-1-leitao@debian.org>
References: <20240213112122.404045-1-leitao@debian.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

W=1 builds now warn if module is built without a MODULE_DESCRIPTION().
Add descriptions to the Xen backend network module.

Signed-off-by: Breno Leitao <leitao@debian.org>
---
 drivers/net/xen-netback/netback.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/xen-netback/netback.c b/drivers/net/xen-netback/netback.c
index fab361a250d6..ef76850d9bcd 100644
--- a/drivers/net/xen-netback/netback.c
+++ b/drivers/net/xen-netback/netback.c
@@ -1778,5 +1778,6 @@ static void __exit netback_fini(void)
 }
 module_exit(netback_fini);
 
+MODULE_DESCRIPTION("Xen backend network device module");
 MODULE_LICENSE("Dual BSD/GPL");
 MODULE_ALIAS("xen-backend:vif");
-- 
2.39.3


