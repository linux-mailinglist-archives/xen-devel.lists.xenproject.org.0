Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id NgtXFUvVKmoexwMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 11 Jun 2026 17:33:31 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 04688673197
	for <lists+xen-devel@lfdr.de>; Thu, 11 Jun 2026 17:33:31 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=CmvnPSZJ;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=gmail.com
Received: from list by lists.xenproject.org with outflank-mailman.1335799.1598000 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wXhPC-0006S9-W2; Thu, 11 Jun 2026 15:33:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1335799.1598000; Thu, 11 Jun 2026 15:33:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wXhPC-0006QQ-Re; Thu, 11 Jun 2026 15:33:18 +0000
Received: by outflank-mailman (input) for mailman id 1335799;
 Thu, 11 Jun 2026 15:33:17 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <freddy77@gmail.com>) id 1wXhPB-0005z1-2K
 for xen-devel@lists.xenproject.org; Thu, 11 Jun 2026 15:33:17 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wXhPA-00GHRR-FM
 for xen-devel@lists.xenproject.org; Thu, 11 Jun 2026 17:33:16 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <freddy77@gmail.com>)
 id 6a2ad531-2eae-0a2a0a5409dd-0a2a45049ba6-20
 for <xen-devel@lists.xenproject.org>; Thu, 11 Jun 2026 17:33:16 +0200
Received: from [209.85.128.52] (helo=mail-wm1-f52.google.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <freddy77@gmail.com>)
 id 6a2ad53c-1dec-0a2a45040019-d1558034b42a-3
 for <xen-devel@lists.xenproject.org>; Thu, 11 Jun 2026 17:33:16 +0200
Received: by mail-wm1-f52.google.com with SMTP id
 5b1f17b1804b1-4908b92904fso92302075e9.0
 for <xen-devel@lists.xenproject.org>; Thu, 11 Jun 2026 08:33:16 -0700 (PDT)
Received: from localhost.localdomain (5.116.208.46.dyn.plus.net.
 [46.208.116.5]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4601f0a43e9sm80679900f8f.0.2026.06.11.08.33.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Jun 2026 08:33:15 -0700 (PDT)
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
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781191996; x=1781796796; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=33TPV9ua1J4veKgMgW4Ng7TdHJYDJOEyknwHEIMN6qs=;
        b=CmvnPSZJXxJ4+GxBIxW/MpyQgD2crML++DUAdp043y2HT4vFCVL/gzvHutDguyYQR0
         N0bb9G4mRGkETHn3aVkbfkAVlwG3McOCxMQzibiSXJNmgY+XaKJfASLFpwkIK6+Utpqp
         sTS6UwRZn/AeCBkxvBpkwqZuz0h3XexFmH81tZsFTEug6/fNEN01tyzWMYbvajsesNeN
         /LX/69yweUUUKlc11F1jTNeYupl3Q0teJ3qbdcU45NM5Ncpxb6CgqhiekTmUEipSpyZO
         T4gEumqtoEvJIf52AwfjLXPEiaUMtj5OWf+bf/cWemely2UwsAlEPh5YHWc7qGL4B8u6
         f7iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781191996; x=1781796796;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=33TPV9ua1J4veKgMgW4Ng7TdHJYDJOEyknwHEIMN6qs=;
        b=brJj7f+ObHf6sM0nUtLaTa4RaxX+kci6TkQkl5g6zOlyqQ6B0M1iSsT5lRAcD081Hz
         fcEjeemFFtvOfu42bVkyxusCRxU351Rc3O9CX3H9fs/nvP9nonbAQ9mVbUSaBAWSZTj5
         8kv5HC+C2a72E24CR38diahC1Ob/7/f0jpYzJLwI4EkizMseCBAhOcZTXasvPSx6VTkx
         wIoCbfpAZEK7Q7/1FJeeZgBE+KfWFBljKFB1amN6/4dSEqncFZcAKLKP70gpMeeA9O2a
         hVE3mE8UIFeLdc34UZ/RNAxJAI6a+0XCiEya7JBb+0O1H+XRYJq7qr+apaSvAL+V7riF
         IfLQ==
X-Gm-Message-State: AOJu0Yz4BZXfS2VqEni5U+H86CRlUTysOuit+3XHm8xg0vY727Yaheg7
	xDI3UWLt2zz49fSzIgUfx3cdusc8pW3NmQ37TEjwgdrJl3laVZMN6Azmm0QaykdBFW0=
X-Gm-Gg: Acq92OFuMjwkj2WqZmCGyezzY95YXSrSg7FmmSd3iJAPY+oyT5k8ahLOnzUcpT+OHSC
	frzlPTfbwhu6XuQ11mce8Hcvouv3g6Ne049Fi1s7CLpx4l5OJJh59nsb/+Va+9pk6RspiumTP7u
	0r+0mR2rJbKFZN0tpj/S/XpVnBNSJc4pmi+WHiiN/CUIS8E/iSc8GheoxD/pf/XSJjsFmFkPjaB
	h9ONsvtrrD4mCsX98jyndsJXenS5o1Of1JA7M7ZiFxjKNx/rjHrxXXgEQdRQ1XMlxahNRHUgyyU
	YD6z287pmJLkQjod1hVC3sdsXK0ftpwCMfMlF1OFvm1uJ23zflGsz67iJFSVJPRX8r7hMvCtwAR
	vFOrV2ZKiNKYCq0sGzivStCn6ngJ4gjuWBg93Pr1a6XAVKr4iGZpvNCGulULCRdJ4eYt4EqrnL9
	ZZlrBk/AwI3IHapJsaELvnI4qnGFkvQMXXFUNCFOCvQPwDSPoHInT+npqGH5R9cLsTZDjwpEUZf
	7v0CIClJEzyk9OKE1Knxh8n/1t3i+VyfWss
X-Received: by 2002:a05:600c:34c7:b0:490:44eb:c1dd with SMTP id 5b1f17b1804b1-490e563bdd3mr44657285e9.29.1781191995724;
        Thu, 11 Jun 2026 08:33:15 -0700 (PDT)
From: Frediano Ziglio <freddy77@gmail.com>
X-Google-Original-From: Frediano Ziglio <frediano.ziglio@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Frediano Ziglio <frediano.ziglio@cloud.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Teddy Astie <teddy.astie@vates.tech>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Frediano Ziglio <frediano.ziglio@citrix.com>
Subject: [PATCH v2 4/4] x86: Split .init section to satisfy UEFI CA memory mitigation
Date: Thu, 11 Jun 2026 16:32:57 +0100
Message-ID: <20260611153257.650054-5-frediano.ziglio@cloud.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260611153257.650054-1-frediano.ziglio@cloud.com>
References: <20260611153257.650054-1-frediano.ziglio@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-ebf023/1781191996-297793FF-1B629824/0/0
X-purgate-type: clean
X-purgate-size: 1707
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.69 / 15.00];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:frediano.ziglio@cloud.com,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,m:marmarek@invisiblethingslab.com,m:frediano.ziglio@citrix.com,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER(0.00)[freddy77@gmail.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[cloud.com:mid,citrix.com:email,lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp];
	FROM_NEQ_ENVFROM(0.00)[freddy77@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 04688673197

Currently .init section is both writeable and executable, split data and code
to have 2 sections satisfying W^X rule.

It is a requirement for NX_COMPAT so the PE can be loaded with W^X perms
in the pagetables.

NX_COMPAT is a requirement from shim-review,
https://github.com/rhboot/shim-review#do-you-have-the-nx-bit-set-in-your-shim-if-so-is-your-entire-boot-stack-nx-compatible-and-what-testing-have-you-done-to-ensure-such-compatibility

Signed-off-by: Frediano Ziglio <frediano.ziglio@citrix.com>
--
Change since v2:
- update comment style.
---
 xen/arch/x86/xen.lds.S | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/xen/arch/x86/xen.lds.S b/xen/arch/x86/xen.lds.S
index 749d9719cc..8fefda1816 100644
--- a/xen/arch/x86/xen.lds.S
+++ b/xen/arch/x86/xen.lds.S
@@ -193,11 +193,7 @@ SECTIONS
   __2M_init_start = .;         /* Start of 2M superpages, mapped RWX (boot only). */
   . = ALIGN(PAGE_SIZE);             /* Init code and data */
   __init_begin = .;
-#ifdef EFI /* EFI wants to merge all of .init.*  ELF doesn't. */
-  DECL_SECTION(.init) {
-#else
   DECL_SECTION(.init.text) {
-#endif
        _sinittext = .;
        *(.init.multiboot)
        *(.init.text)
@@ -210,12 +206,12 @@ SECTIONS
         */
        *(.altinstr_replacement)
 
-#ifdef EFI /* EFI wants to merge all of .init.*  ELF doesn't. */
-       . = ALIGN(SMP_CACHE_BYTES);
-#else
   } PHDR(text)
-  DECL_SECTION(.init.data) {
+#ifdef EFI
+  /* Align to satisfy UEFI CA memory mitigation. */
+  . = ALIGN(SECTION_ALIGN);
 #endif
+  DECL_SECTION(.init.data) {
        *(.init.bss.stack_aligned)
        *(.init.data.page_aligned)
 
-- 
2.43.0


