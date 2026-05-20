Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EOSaKucjDmr26QUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 20 May 2026 23:13:11 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 87DBA59A8FB
	for <lists+xen-devel@lfdr.de>; Wed, 20 May 2026 23:13:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1314393.1584343 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wPoDi-0003uO-OH; Wed, 20 May 2026 21:12:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1314393.1584343; Wed, 20 May 2026 21:12:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wPoDi-0003rl-LX; Wed, 20 May 2026 21:12:50 +0000
Received: by outflank-mailman (input) for mailman id 1314393;
 Wed, 20 May 2026 21:12:49 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <mfo@igalia.com>) id 1wPoDf-0003rf-5c
 for xen-devel@lists.xenproject.org; Wed, 20 May 2026 21:12:49 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wPoDe-00EDfE-4R
 for xen-devel@lists.xenproject.org; Wed, 20 May 2026 23:12:46 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <mfo@igalia.com>)
 id 6a0e23a3-e002-0a2a0a5209dd-0a2a450ad53a-38
 for <xen-devel@lists.xenproject.org>; Wed, 20 May 2026 23:12:45 +0200
Received: from [213.97.179.56] (helo=fanzine2.igalia.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <mfo@igalia.com>)
 id 6a0e23cd-56b3-0a2a450a0019-d561b338982c-3
 for <xen-devel@lists.xenproject.org>; Wed, 20 May 2026 23:12:45 +0200
Received: from 186-249-145-161.shared.desktop.com.br ([186.249.145.161]
 helo=[192.168.1.68]) by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1wPoDX-0041Tq-LQ; Wed, 20 May 2026 23:12:39 +0200
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
	bh=jkpwXdcnHe1Zv/dlRDcrtsBOp/xquKy8TUTUHmBcL1U=; b=dUzRobAH+mthZRI7uJWLVNLyzp
	VzF6Bb3s2HtliD6A5H1iVmP+juxYJyBrAKi0u3b6IzPD7xxn3tJZu4+pTkKVyHx1iGbbiFQi3kPAN
	ugqtXjeWMYGekFisfkeO73ZivU9lMcTqya+RfRgfeJPR0vT/yjy06/PAV9vdtl6rDJ9MTXpjC88wl
	USF3MRMam86DLoz+EQfXXgXdrkyE9L7F71NTIl54eAbnR9PDlu56Sz2bGugTotwnjUh4bdTiOo5K5
	j1UmrI8ZtiOuItOS8zCt+derjk76bYCwNfRFr4pU//xD+jHew5EmJsng1KBijgbHnAuAv39pt+MfK
	XlQFtNZA==;
From: Mauricio Faria de Oliveira <mfo@igalia.com>
Date: Wed, 20 May 2026 18:12:06 -0300
Subject: [PATCH v3 2/4] x86/asm, x86/boot: expose inline memcmp
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260520-pvh-kasan-inline-v3-2-bede769c6ec7@igalia.com>
References: <20260520-pvh-kasan-inline-v3-0-bede769c6ec7@igalia.com>
In-Reply-To: <20260520-pvh-kasan-inline-v3-0-bede769c6ec7@igalia.com>
To: Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, 
 x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>, 
 Juergen Gross <jgross@suse.com>, Alexey Dobriyan <adobriyan@gmail.com>, 
 Boris Ostrovsky <boris.ostrovsky@oracle.com>
Cc: kernel-dev@igalia.com, linux-kernel@vger.kernel.org, 
 xen-devel@lists.xenproject.org, Mauricio Faria de Oliveira <mfo@igalia.com>
X-Mailer: b4 0.14.2
X-purgate-ID: tlsNG-4011c0/1779311565-7196E8B7-FCAD2D12/0/0
X-purgate-type: clean
X-purgate-size: 2056
X-Spamd-Result: default: False [0.61 / 15.00];
	R_DKIM_REJECT(1.00)[igalia.com:s=20170329];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[igalia.com : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:tglx@kernel.org,m:mingo@redhat.com,m:bp@alien8.de,m:dave.hansen@linux.intel.com,m:x86@kernel.org,m:hpa@zytor.com,m:jgross@suse.com,m:adobriyan@gmail.com,m:boris.ostrovsky@oracle.com,m:kernel-dev@igalia.com,m:linux-kernel@vger.kernel.org,m:xen-devel@lists.xenproject.org,m:mfo@igalia.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,redhat.com,alien8.de,linux.intel.com,zytor.com,suse.com,gmail.com,oracle.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:rdns,lists.xenproject.org:helo,igalia.com:mid,igalia.com:email];
	FORGED_SENDER(0.00)[mfo@igalia.com,xen-devel-bounces@lists.xenproject.org];
	RCPT_COUNT_TWELVE(0.00)[13];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
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
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Queue-Id: 87DBA59A8FB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Move the inline memcmp function currently only available in 'boot/string.c'
and its users (eg, 'boot/compressed/string.c' and 'purgatory/purgatory.ro')
into the inline string functions header <asm/string_inline.h> to be reused.

Note that the inline memcmp() returns 0/1, not -1/0/1 as regular memcmp()
(reported by David Laight <david.laight.linux@gmail.com>), which is not
caused or changed by this commit; this will be addressed separately.

Signed-off-by: Mauricio Faria de Oliveira <mfo@igalia.com>
---
 arch/x86/boot/string.c               |  6 ++----
 arch/x86/include/asm/string_inline.h | 11 +++++++++++
 2 files changed, 13 insertions(+), 4 deletions(-)

diff --git a/arch/x86/boot/string.c b/arch/x86/boot/string.c
index ac0f900ebc47efa81c92e1bb2010ea41677899c4..544681d046c3f87101309ffaca0c90512a244856 100644
--- a/arch/x86/boot/string.c
+++ b/arch/x86/boot/string.c
@@ -15,6 +15,7 @@
 #include <linux/errno.h>
 #include <linux/limits.h>
 #include <asm/asm.h>
+#include <asm/string_inline.h>
 #include "ctype.h"
 #include "string.h"
 
@@ -31,10 +32,7 @@
 
 int memcmp(const void *s1, const void *s2, size_t len)
 {
-	bool diff;
-	asm("repe cmpsb"
-	    : "=@ccnz" (diff), "+D" (s1), "+S" (s2), "+c" (len));
-	return diff;
+	return __inline_memcmp(s1, s2, len);
 }
 
 /*
diff --git a/arch/x86/include/asm/string_inline.h b/arch/x86/include/asm/string_inline.h
index ffcfa6583d2bc7b91d078888518d0e80248af940..91ed89bfdfa9b148002441e94f48039b17f70391 100644
--- a/arch/x86/include/asm/string_inline.h
+++ b/arch/x86/include/asm/string_inline.h
@@ -23,4 +23,15 @@ static __always_inline void *__inline_memset(void *s, int v, size_t n)
 	return ret;
 }
 
+/* Note: this memcmp() returns 0/1, not -1/0/1 as regular memcmp(). */
+static __always_inline int __inline_memcmp(const void *s1, const void *s2, size_t len)
+{
+	bool diff;
+
+	asm("repe cmpsb"
+	    : "=@ccnz" (diff), "+D" (s1), "+S" (s2), "+c" (len));
+
+	return diff;
+}
+
 #endif /* _ASM_X86_STRING_INLINE_H */

-- 
2.51.0


