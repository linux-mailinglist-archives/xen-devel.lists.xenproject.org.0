Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 1YJ/DHm66WlqiwIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 23 Apr 2026 08:21:45 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ACE0444D911
	for <lists+xen-devel@lfdr.de>; Thu, 23 Apr 2026 08:21:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1291094.1570455 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wFnRI-0004GN-EF; Thu, 23 Apr 2026 06:21:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1291094.1570455; Thu, 23 Apr 2026 06:21:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wFnRI-0004BJ-AH; Thu, 23 Apr 2026 06:21:28 +0000
Received: by outflank-mailman (input) for mailman id 1291094;
 Wed, 22 Apr 2026 20:08:36 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <mfo@igalia.com>) id 1wFdsB-0007sW-Uv
 for xen-devel@lists.xenproject.org; Wed, 22 Apr 2026 20:08:35 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wFdsB-008IiL-Bq
 for xen-devel@lists.xenproject.org; Wed, 22 Apr 2026 22:08:35 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <mfo@igalia.com>)
 id 69e92ac1-2eae-0a2a0a5409dd-0a2a4507c2ea-6
 for <xen-devel@lists.xenproject.org>; Wed, 22 Apr 2026 22:08:35 +0200
Received: from [213.97.179.56] (helo=fanzine2.igalia.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <mfo@igalia.com>)
 id 69e92ac2-229c-0a2a45070019-d561b338b3d2-3
 for <xen-devel@lists.xenproject.org>; Wed, 22 Apr 2026 22:08:35 +0200
Received: from 186-249-145-131.shared.desktop.com.br ([186.249.145.131]
 helo=[192.168.1.66]) by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1wFdrw-000QN6-VY; Wed, 22 Apr 2026 22:08:20 +0200
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20170329 header.d=igalia.com header.i="@igalia.com" header.h="Cc:To:In-Reply-To:References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Cc:To:In-Reply-To:References:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=ugLYSHBb5Q9RwOF8EB3ofOp/JXnqmVAR7KYDCMKM5ok=; b=eA7Kx7ySJ0fQcyxXseR3wwYRQu
	BaEOoFBaNOeh2tfFgcRa50/ij6NjkDTNHHLPE/MI4ZVUjkoRfNxSHFT67t5yp85A1LceddlEU1pgW
	xktLdlpLLYEu6lKePNxiWQb5UERyLw64kBiutUmbe3ozGTvFOf1C3nsFc2RKL6wnDxtMhbooPjHey
	OE1+WLBHxqaAOcceUEPEgpjPgilanir0vWxXJ1ZR2lw0UHtCgaK7Fs7+6lhmZejMVzzuJCtPq5bcN
	PDxEaalcmUl8q1AYY5W10ZTFDQ4HUSsdZbRGOohFirJk5AE4JeizDZRrtyCwdzA3WDpFQJvqwi9J0
	0siPg/ow==;
From: Mauricio Faria de Oliveira <mfo@igalia.com>
Date: Wed, 22 Apr 2026 17:07:47 -0300
Subject: [PATCH 3/3] x86/pvh: fix unbootable VMs by really inlining
 memset() in xen_prepare_pvh()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260422-pvh-kasan-inline-v1-3-7e6194344c92@igalia.com>
References: <20260422-pvh-kasan-inline-v1-0-7e6194344c92@igalia.com>
In-Reply-To: <20260422-pvh-kasan-inline-v1-0-7e6194344c92@igalia.com>
To: Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, 
 x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>, 
 Juergen Gross <jgross@suse.com>, Alexey Dobriyan <adobriyan@gmail.com>, 
 Boris Ostrovsky <boris.ostrovsky@oracle.com>
Cc: kernel-dev@igalia.com, linux-kernel@vger.kernel.org, 
 xen-devel@lists.xenproject.org, Mauricio Faria de Oliveira <mfo@igalia.com>
X-Mailer: b4 0.14.2
X-purgate-ID: tlsNG-ef75cf/1776888515-AC961C48-D89686DA/0/0
X-purgate-type: clean
X-purgate-size: 1428
X-Spamd-Result: default: False [0.61 / 15.00];
	R_DKIM_REJECT(1.00)[igalia.com:s=20170329];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[igalia.com : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:tglx@kernel.org,m:mingo@redhat.com,m:bp@alien8.de,m:dave.hansen@linux.intel.com,m:x86@kernel.org,m:hpa@zytor.com,m:jgross@suse.com,m:adobriyan@gmail.com,m:boris.ostrovsky@oracle.com,m:kernel-dev@igalia.com,m:linux-kernel@vger.kernel.org,m:xen-devel@lists.xenproject.org,m:mfo@igalia.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,redhat.com,alien8.de,linux.intel.com,zytor.com,suse.com,gmail.com,oracle.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FORGED_SENDER(0.00)[mfo@igalia.com,xen-devel-bounces@lists.xenproject.org];
	RCPT_COUNT_TWELVE(0.00)[13];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[igalia.com:-];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mfo@igalia.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-0.874];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Queue-Id: ACE0444D911
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Even with __builtin the compiler may decide to use the out of line function
instead of the inline implementation.

This particular one (still) generated the inline implementation as expected
(at least in these compiler versions), but this is not guaranteed to remain
the case, as seen with the previous commit.

Switch the builtin to the inline implementation to prevent a similar issue.

Fixes: fbe5a6dfe492 ("xen, pvh: fix unbootable VMs by inlining memset() in xen_prepare_pvh()")
Signed-off-by: Mauricio Faria de Oliveira <mfo@igalia.com>
---
 arch/x86/platform/pvh/enlighten.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/x86/platform/pvh/enlighten.c b/arch/x86/platform/pvh/enlighten.c
index f2053cbe9b0ce3d2178938269607c652ae8f528e..cb442cbd9d828619421babb281bfe9759edbca8a 100644
--- a/arch/x86/platform/pvh/enlighten.c
+++ b/arch/x86/platform/pvh/enlighten.c
@@ -8,6 +8,7 @@
 #include <asm/hypervisor.h>
 #include <asm/e820/api.h>
 #include <asm/x86_init.h>
+#include <asm/string.h>
 
 #include <asm/xen/interface.h>
 
@@ -129,7 +130,7 @@ void __init xen_prepare_pvh(void)
 	 * This must not compile to "call memset" because memset() may be
 	 * instrumented.
 	 */
-	__builtin_memset(&pvh_bootparams, 0, sizeof(pvh_bootparams));
+	__inline_memset(&pvh_bootparams, 0, sizeof(pvh_bootparams));
 
 	hypervisor_specific_init(xen_guest);
 

-- 
2.51.0


