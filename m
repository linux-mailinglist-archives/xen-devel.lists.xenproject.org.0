Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CA6D49D9F9B
	for <lists+xen-devel@lfdr.de>; Wed, 27 Nov 2024 00:23:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.844059.1259663 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tG4tp-0001en-Qx; Tue, 26 Nov 2024 23:23:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 844059.1259663; Tue, 26 Nov 2024 23:23:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tG4tp-0001UA-Dk; Tue, 26 Nov 2024 23:23:17 +0000
Received: by outflank-mailman (input) for mailman id 844059;
 Tue, 26 Nov 2024 23:22:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rasV=SV=kernel.org=devnull+dmukhin.ford.com@srs-se1.protection.inumbo.net>)
 id 1tG4sg-0000At-D7
 for xen-devel@lists.xenproject.org; Tue, 26 Nov 2024 23:22:06 +0000
Received: from nyc.source.kernel.org (nyc.source.kernel.org
 [2604:1380:45d1:ec00::3])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3b0f43ea-ac4d-11ef-99a3-01e77a169b0f;
 Wed, 27 Nov 2024 00:21:58 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 2BCF5A4166A;
 Tue, 26 Nov 2024 23:20:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8A7ACC4CEE0;
 Tue, 26 Nov 2024 23:21:55 +0000 (UTC)
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id 82931D66B8A;
 Tue, 26 Nov 2024 23:21:55 +0000 (UTC)
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
X-Inumbo-ID: 3b0f43ea-ac4d-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjI2MDQ6MTM4MDo0NWQxOmVjMDA6OjMiLCJoZWxvIjoibnljLnNvdXJjZS5rZXJuZWwub3JnIn0=
X-Custom-Transaction: eyJpZCI6IjNiMGY0M2VhLWFjNGQtMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMyNjYzMzE4LjQxOTIzNiwic2VuZGVyIjoiZGV2bnVsbCtkbXVraGluLmZvcmQuY29tQGtlcm5lbC5vcmciLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732663315;
	bh=Mz0LfCOOHYiw5/C9m9hW2cPDEp/vC7dK7lem4N02Sxg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=aIjU402cJH+SGngOO0S0c6Rj4bK3IJx5aoYni+Vmv0ttkiuk7zUgf5Ov6pmVlYuTq
	 lYMq+ThcZiAhepv24l0dj4PvMButU0KqFWFq3a5QvoK8JIHalQlmstew7fjhEIWmNC
	 hN/pAhCFchm71EpQV5lRA24sS+L9fwb609cOp4AGwbU3te+K+36l0k/X3Git4mCC99
	 VJYRZoUpuk36qiiXIWUYASWa/I09wo9NDWljCaO5a8wHutCFHL1aglM4QfNJUh8v/f
	 i0pulpTWshGNcmhixEmmpgdAJJilIR5OA1kcpyHHnlRVd/GlTj0Es8mPc/frREm3tW
	 LGaXIdaUo+r5Q==
From: Denis Mukhin via B4 Relay <devnull+dmukhin.ford.com@kernel.org>
Date: Tue, 26 Nov 2024 15:21:56 -0800
Subject: [PATCH 06/36] xen/ctype: introduce isconsole()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241126-vuart-ns8250-v1-v1-6-87b9a8375b7a@ford.com>
References: <20241126-vuart-ns8250-v1-v1-0-87b9a8375b7a@ford.com>
In-Reply-To: <20241126-vuart-ns8250-v1-v1-0-87b9a8375b7a@ford.com>
To: Jan Beulich <jbeulich@suse.com>, 
 Andrew Cooper <andrew.cooper3@citrix.com>, 
 =?utf-8?q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
 "Daniel P. Smith" <dpsmith@apertussolutions.com>, 
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
 Bertrand Marquis <bertrand.marquis@arm.com>, 
 Michal Orzel <michal.orzel@amd.com>, Rahul Singh <rahul.singh@arm.com>, 
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
 Alistair Francis <alistair.francis@wdc.com>, 
 Bob Eshleman <bobbyeshleman@gmail.com>, 
 Connor Davis <connojdavis@gmail.com>, 
 Oleksii Kurochko <oleksii.kurochko@gmail.com>, 
 Shawn Anastasio <sanastasio@raptorengineering.com>, 
 Anthony PERARD <anthony.perard@vates.tech>, Juergen Gross <jgross@suse.com>, 
 Christian Lindig <christian.lindig@citrix.com>, 
 David Scott <dave@recoil.org>, 
 =?utf-8?q?Marek_Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Cc: xen-devel@lists.xenproject.org, Denis Mukhin <dmukhin@ford.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1732663312; l=2961;
 i=dmukhin@ford.com; s=20241125; h=from:subject:message-id;
 bh=AiWQqLZufYvPF2BvW1MH1/m06BTcFm+ZjCUWxGGdDOM=;
 b=Nk3hSzmyiSciOxuFiqeHNmLM17vLHl4dm7GK5e+zTLBVctllzH40H0KiGU9Ltvtt8mndY72w/
 tHnwxiHyr2dCyF6c8DfKcqBWQiThwRjNDVBdSjU+V1SPC00i/smcg7U
X-Developer-Key: i=dmukhin@ford.com; a=ed25519;
 pk=SsDZ9p39s0fqcpUKQuqKqrbn0rq6EtEAClvpOpzx6+U=
X-Endpoint-Received: by B4 Relay for dmukhin@ford.com/20241125 with
 auth_id=287
X-Original-From: Denis Mukhin <dmukhin@ford.com>
Reply-To: dmukhin@ford.com

From: Denis Mukhin <dmukhin@ford.com>

There are several console drivers which have same checks w.r.t. printable
characters. The check is moved to new isconsole() macro and re-used in
the console drivers.

Signed-off-by: Denis Mukhin <dmukhin@ford.com>
---
 xen/arch/arm/vuart.c       | 3 +--
 xen/arch/x86/hvm/hvm.c     | 3 +--
 xen/drivers/char/console.c | 2 +-
 xen/include/xen/ctype.h    | 3 +++
 4 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/xen/arch/arm/vuart.c b/xen/arch/arm/vuart.c
index d5ba483f1e63245e545346ad5045098152b8c152..ac76e2327bb84f05ea5716c6f5550f94812d2827 100644
--- a/xen/arch/arm/vuart.c
+++ b/xen/arch/arm/vuart.c
@@ -79,8 +79,7 @@ static void vuart_print_char(struct vcpu *v, char c)
     struct domain *d = v->domain;
     struct vuart *uart = &d->arch.vuart;
 
-    /* Accept only printable characters, newline, and horizontal tab. */
-    if ( !isprint(c) && (c != '\n') && (c != '\t') )
+    if ( !isconsole(c) )
         return ;
 
     spin_lock(&uart->lock);
diff --git a/xen/arch/x86/hvm/hvm.c b/xen/arch/x86/hvm/hvm.c
index 74e58c653e6f697e7e563fd076bbbafaf257137d..493b699c708949b2109c26573a107565543f5d45 100644
--- a/xen/arch/x86/hvm/hvm.c
+++ b/xen/arch/x86/hvm/hvm.c
@@ -561,8 +561,7 @@ static int cf_check hvm_print_line(
     if ( dir != IOREQ_WRITE )
         return X86EMUL_UNHANDLEABLE;
 
-    /* Accept only printable characters, newline, and horizontal tab. */
-    if ( !isprint(c) && (c != '\n') && (c != '\t') )
+    if ( !isconsole(c) )
         return X86EMUL_OKAY;
 
     spin_lock(&cd->pbuf_lock);
diff --git a/xen/drivers/char/console.c b/xen/drivers/char/console.c
index 7da8c5296f3b62c6c45131c58fe5cf0e393e9ef3..bb56953bab681a13da8d41431aba4632f1919df9 100644
--- a/xen/drivers/char/console.c
+++ b/xen/drivers/char/console.c
@@ -674,7 +674,7 @@ static long guest_console_write(XEN_GUEST_HANDLE_PARAM(char) buffer,
                 c = *kin++;
                 if ( c == '\n' )
                     break;
-                if ( isprint(c) || c == '\t' )
+                if ( isconsole(c) )
                     *kout++ = c;
             } while ( --kcount > 0 );
 
diff --git a/xen/include/xen/ctype.h b/xen/include/xen/ctype.h
index 773ac27aa44ac65e76e87cdec960450804310249..741bea8ff7ae431e27b05e2b62402f64b3a9cacf 100644
--- a/xen/include/xen/ctype.h
+++ b/xen/include/xen/ctype.h
@@ -4,6 +4,8 @@
 /*
  * NOTE! This ctype does not handle EOF like the standard C
  * library is required to.
+ *
+ * See Rule 21.13 in docs/misra/rules.rst.
  */
 
 #define _U	0x01	/* upper */
@@ -30,6 +32,7 @@ extern const unsigned char _ctype[];
 #define isspace(c)	((__ismask(c)&(_S)) != 0)
 #define isupper(c)	((__ismask(c)&(_U)) != 0)
 #define isxdigit(c)	((__ismask(c)&(_D|_X)) != 0)
+#define isconsole(c)	(isprint(c) || c == '\n' || c == '\t')
 
 #define isascii(c) (((unsigned char)(c))<=0x7f)
 #define toascii(c) (((unsigned char)(c))&0x7f)

-- 
2.34.1



