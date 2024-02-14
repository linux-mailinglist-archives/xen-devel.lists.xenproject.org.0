Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B253854CB3
	for <lists+xen-devel@lfdr.de>; Wed, 14 Feb 2024 16:29:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.680998.1059498 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1raHC2-0006pC-M2; Wed, 14 Feb 2024 15:29:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 680998.1059498; Wed, 14 Feb 2024 15:29:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1raHC2-0006na-JF; Wed, 14 Feb 2024 15:29:02 +0000
Received: by outflank-mailman (input) for mailman id 680998;
 Wed, 14 Feb 2024 15:29:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zwwQ=JX=gmail.com=breno.debian@srs-se1.protection.inumbo.net>)
 id 1raHC1-0006nU-4K
 for xen-devel@lists.xenproject.org; Wed, 14 Feb 2024 15:29:01 +0000
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com
 [209.85.218.49]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c5df4c39-cb4d-11ee-98f5-efadbce2ee36;
 Wed, 14 Feb 2024 16:28:59 +0100 (CET)
Received: by mail-ej1-f49.google.com with SMTP id
 a640c23a62f3a-a3d6d160529so31590766b.0
 for <xen-devel@lists.xenproject.org>; Wed, 14 Feb 2024 07:28:58 -0800 (PST)
Received: from localhost (fwdproxy-lla-003.fbsv.net.
 [2a03:2880:30ff:3::face:b00c]) by smtp.gmail.com with ESMTPSA id
 kt19-20020a1709079d1300b00a3d6b13c4efsm189745ejc.180.2024.02.14.07.28.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Feb 2024 07:28:57 -0800 (PST)
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
X-Inumbo-ID: c5df4c39-cb4d-11ee-98f5-efadbce2ee36
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707924538; x=1708529338;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ywgijd0AB1UdEP/G8o0p2+lNq+pzPJZCGntMh1zrtqQ=;
        b=qHN7Cy8VeXkEibg6UGca7oMwefPJ7NIRMaKueODpspre6p4YGCjbpUoeW+xNM/Sc9T
         CT5MZJYqo1LR9D7/XFdgC3IDKsmCixu+vJNESd0/SVGF8EjEEMT3mUi1KWa5f1jWKNeo
         x5HAkWPm/Xt/2joOowT4W56mrw1oMbO8Q6q4hZaBsvwIwEOTQtktudCXdLP8vtLDPw19
         pFJ6DkaImJ7h+aPQsihXJswjPkqkQ0qt2fioy7ziTyqdxEmEDfH4FeQKG3bqEzWdFuvi
         YYsfgdiwjdv0TXeRxxMk3/9s9Zi/cOnty7gD+t6GbOLM2Ed8RH13TB7Q9P/sPjiJAbWp
         OCXg==
X-Forwarded-Encrypted: i=1; AJvYcCWrnINzW2chnuFJhWaSUOSqEDVdlRRHa1ATsSOGgU9kTg8G63sIuL4GKivHgeqCmzOy6L5jF03nSd4wqJ164S3V/7HSmajtgf2UFq6fsfI=
X-Gm-Message-State: AOJu0Yw5WIx0PPRlrXhiH4UzkgFWikRz4F64D86JimImyrDphcKJX2Bk
	OC9iTxBhVkAkb/juE/GCQqa6kxnTkcIBfYItMcm2SCKE7tBqfqwH
X-Google-Smtp-Source: AGHT+IFtJU0LK8XMLjaJSuQ2WCKqrywmYokSm2MZ7f9DhVf79vcqxli9RGGYxwNOsedtO8MxADI7CQ==
X-Received: by 2002:a17:906:bc59:b0:a38:916e:a4fe with SMTP id s25-20020a170906bc5900b00a38916ea4femr2111177ejv.39.1707924538262;
        Wed, 14 Feb 2024 07:28:58 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVfMLVUFkbuHzQC2OC9s91+gjpxuK1mhdiXAmM1GCwrXLwkEtoLQ/eAjQgNpnuenBaafZecJiI+fj5O3FrEWMo0RdLIhaRBa7Gbwp0QJMtysEWtRtMjhGoi78wZDfEfd6cEWMKtsajM97m0ienpP+djQBkIXcvGXSudvpg3bh519cHjBM3u//oK/24GkJejh+fTi9dUaiVhQMEz3DsLuY0YCPDocCexAJA50AtvWEgi0O6d5eyyQjOviJzqjcuAHP3vSiov30OMzy57ODllVpl5L5sQz5oWHB7SBaPP9g==
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
Subject: [PATCH net v2 1/7] net: fill in MODULE_DESCRIPTION()s for xen-netback
Date: Wed, 14 Feb 2024 07:27:35 -0800
Message-Id: <20240214152741.670178-2-leitao@debian.org>
X-Mailer: git-send-email 2.39.3
In-Reply-To: <20240214152741.670178-1-leitao@debian.org>
References: <20240214152741.670178-1-leitao@debian.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

W=1 builds now warn if module is built without a MODULE_DESCRIPTION().
Add descriptions to the Xen backend network module.

Signed-off-by: Breno Leitao <leitao@debian.org>
Acked-by: Paul Durrant <paul@xen.org>
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


