Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GA77KWPw4GnfngAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 16 Apr 2026 16:21:23 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1983840F7F3
	for <lists+xen-devel@lfdr.de>; Thu, 16 Apr 2026 16:21:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1283530.1565743 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wDNal-0005LD-18; Thu, 16 Apr 2026 14:21:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1283530.1565743; Thu, 16 Apr 2026 14:21:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wDNak-0005Jl-TB; Thu, 16 Apr 2026 14:21:14 +0000
Received: by outflank-mailman (input) for mailman id 1283530;
 Thu, 16 Apr 2026 14:21:13 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wDNaj-00052Y-4L
 for xen-devel@lists.xenproject.org; Thu, 16 Apr 2026 14:21:13 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wDNai-00EKYV-HA
 for xen-devel@lists.xenproject.org; Thu, 16 Apr 2026 16:21:12 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 69e0f052-2eae-0a2a0a5409dd-0a2a4509bd4e-30
 for <xen-devel@lists.xenproject.org>; Thu, 16 Apr 2026 16:21:12 +0200
Received: from [209.85.128.44] (helo=mail-wm1-f44.google.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 69e0f058-2497-0a2a45090019-d155802cb11a-3
 for <xen-devel@lists.xenproject.org>; Thu, 16 Apr 2026 16:21:12 +0200
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-4888375f735so80629695e9.3
 for <xen-devel@lists.xenproject.org>; Thu, 16 Apr 2026 07:21:12 -0700 (PDT)
Received: from fedora (user-109-243-69-121.play-internet.pl. [109.243.69.121])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-488f096d110sm59803515e9.11.2026.04.16.07.21.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Apr 2026 07:21:11 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776349272; x=1776954072; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s8Y9SzzS4bvv10F/vEf37vbkhG/m9fzH1k9xycRPAmo=;
        b=KsedUVEYmAPLDSnr7VQAL8KARAQobm6zXx+3qL/+1546osO1H1FnX/BUIUgXziBZ6n
         tpSmYL7FE3wa0Er7slIHzZ5TnPp132gAVm/Ko46CWEZdN/0bj+IWI8KurQ5GXWz/p5Lf
         UGmWMdNSWhIVS1HE7mRdjxCpnSAiLMPPx2Hk1ahuYJUf3EhWdbGXm7bde0ts0Z1jOnHR
         KDzh2DeGDw9B3iuyMv8VyVg/uPstdqgkIv4aQDbLgGCXqZMXUHoE50rWPk/k9pFKE9I4
         iNJlG76OdV+bTjRsr9YuoV+lEKoN+uxDQLPHK6PQbCrC5hyew5hYPkmQd6kzb6dYrGe4
         nXwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776349272; x=1776954072;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=s8Y9SzzS4bvv10F/vEf37vbkhG/m9fzH1k9xycRPAmo=;
        b=BTItFXrr7mEbAjI6ZteRH0vwJdt3R+FP1B2rab1zhtbxoxCfri2Vu7UWxAlSsOfvSa
         CmZwDXuvOwu6L2Dw1gifqnJomfbl44iIOD4K1ybZbFFtOThwzrQ/b03EVrrpTsw0pNk2
         x+somUiAg2Cj3n5ZObbx1Qp8fyDzJqMPI7lLpeqX2YGdWS1/T0Xlgt/+f2K7YqR1VjPK
         A5xTp1eT5G79qztU02FpmYzZCqtNtOrUsMHX9EZPuY2ayjwrLwxO7iJ2+g0fBuky/Q/8
         93YLPf9f7KRxBGia+cpTdwuIm7wxQMV1H/pVbTAnrIctUq1bIUzSvvr7ZeZd0m7NY9UH
         FPrA==
X-Gm-Message-State: AOJu0YxJtGlx9k0ClEfufeG+Hw4CwLEjRYeV6xL3UD9rIusJwOvCHOkl
	NKMgmzwJZmAWR3AzLu+GDKLGbkFPM6aIU4M4Ooe8ddeIA3piASrvzr1N7SDzIw==
X-Gm-Gg: AeBDiethoCL2ynJxyvFNcQOn5FwFRHcgmjX24BjdaqsJG3MIGZYfcflHKgb5bl43gAq
	/+pikjh8EofX0I3FWUwVyzfpyZoj16qTRABVC/R1JIk1dy8zYJ5465w/DZv7GtLgyjJSarBKcms
	3GoMLsoaV57+ZHvLFC/6CCW/pHdZruOtjeprLORrVSExiQTm9nqE9uCsmc72GM7YC/tdCTkpS1z
	eyErNkc3nsUZIdsobl2p4EkUmOxCsgBi2U9Lv2Nmd3Uuy0ODuko2kru1grfWUkRKiecTr9TowGK
	sAB/pCkNzKKJRgNf1AG79C+WvWqojk81p4hf9GV57TFB0J3zGgRIbPhB+rmE6DzKj8YEkCRVUei
	JJtJRFUnkK9AnXiOvoWjyeWLHI+q6lc3iYsuJwtIsxj/n+JaaHcwLDwAyBYNGeyBfHJWSNhA/lP
	XgjnOeP3hLG1Agm14dBThMK6IEwSdAGS3iACFC/XZr1bk98ekmZCOcIzkWqImaSdjU25x0g2gtW
	RaQ
X-Received: by 2002:a05:600c:c10d:b0:488:ae4e:51a5 with SMTP id 5b1f17b1804b1-488d683d633mr253284465e9.15.1776349271643;
        Thu, 16 Apr 2026 07:21:11 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Jan Beulich <jbeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v1 2/3] xen/dom0less: pass kernel_info struct instead of fdt to make_cpus_node()
Date: Thu, 16 Apr 2026 16:20:59 +0200
Message-ID: <a897d880738f5b3be2d6fc5ec2b6cab1fd8b9dc4.1776340422.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1776340422.git.oleksii.kurochko@gmail.com>
References: <cover.1776340422.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-bad1c0/1776349272-92573A53-93FA7BC1/10/73395122804
X-purgate-type: spam
X-purgate-size: 2867
X-Spamd-Result: default: False [0.81 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:oleksii.kurochko@gmail.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:jbeulich@suse.com,m:roger.pau@citrix.com,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,xen.org,arm.com,amd.com,epam.com,citrix.com,vates.tech,suse.com];
	ARC_NA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	NEURAL_HAM(-0.00)[-0.914];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 1983840F7F3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

There are two reasons of this change:
1. Align prototype with what other make_*_node() are passed.
2. A follow-up RISC-V patch will call get_next_free_phandle() inside
   make_cpus_node(), requiring mutable access to kinfo->free_phandle.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
 xen/arch/arm/domain_build.c             | 5 +++--
 xen/common/device-tree/dom0less-build.c | 2 +-
 xen/include/xen/fdt-domain-build.h      | 2 +-
 3 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index 60a7cbf915a5..6740da3d324b 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -1164,7 +1164,7 @@ int __init make_psci_node(void *fdt)
     return res;
 }
 
-int __init make_cpus_node(const struct domain *d, void *fdt)
+int __init make_cpus_node(const struct domain *d, struct kernel_info *kinfo)
 {
     int res;
     const struct dt_device_node *cpus = dt_find_node_by_path("/cpus");
@@ -1178,6 +1178,7 @@ int __init make_cpus_node(const struct domain *d, void *fdt)
     /* Keep the compiler happy with -Og */
     bool clock_valid = false;
     uint64_t mpidr_aff;
+    void *fdt = kinfo;
 
     dt_dprintk("Create cpus node\n");
 
@@ -1626,7 +1627,7 @@ static int __init handle_node(struct domain *d, struct kernel_info *kinfo,
         if ( res )
             return res;
 
-        res = make_cpus_node(d, kinfo->fdt);
+        res = make_cpus_node(d, kinfo);
         if ( res )
             return res;
 
diff --git a/xen/common/device-tree/dom0less-build.c b/xen/common/device-tree/dom0less-build.c
index 9205f01f0a49..64b12d6aec62 100644
--- a/xen/common/device-tree/dom0less-build.c
+++ b/xen/common/device-tree/dom0less-build.c
@@ -535,7 +535,7 @@ static int __init prepare_dtb_domU(struct domain *d, struct kernel_info *kinfo)
     if ( ret )
         goto err;
 
-    ret = make_cpus_node(d, kinfo->fdt);
+    ret = make_cpus_node(d, kinfo);
     if ( ret )
         goto err;
 
diff --git a/xen/include/xen/fdt-domain-build.h b/xen/include/xen/fdt-domain-build.h
index 220ae46ddbe1..2349baba3427 100644
--- a/xen/include/xen/fdt-domain-build.h
+++ b/xen/include/xen/fdt-domain-build.h
@@ -25,7 +25,7 @@ int construct_domain(struct domain *d, struct kernel_info *kinfo);
 int construct_hwdom(struct kernel_info *kinfo,
                     const struct dt_device_node *node);
 int make_chosen_node(const struct kernel_info *kinfo);
-int make_cpus_node(const struct domain *d, void *fdt);
+int make_cpus_node(const struct domain *d, struct kernel_info *kinfo);
 int make_hypervisor_node(struct domain *d, const struct kernel_info *kinfo,
                          int addrcells, int sizecells);
 int make_memory_node(const struct kernel_info *kinfo, int addrcells,
-- 
2.53.0


