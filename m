Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D713F9D9FA0
	for <lists+xen-devel@lfdr.de>; Wed, 27 Nov 2024 00:23:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.844060.1259676 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tG4tq-0001vA-O9; Tue, 26 Nov 2024 23:23:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 844060.1259676; Tue, 26 Nov 2024 23:23:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tG4tq-0001hF-4S; Tue, 26 Nov 2024 23:23:18 +0000
Received: by outflank-mailman (input) for mailman id 844060;
 Tue, 26 Nov 2024 23:22:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rasV=SV=kernel.org=devnull+dmukhin.ford.com@srs-se1.protection.inumbo.net>)
 id 1tG4sg-0000Ao-Lb
 for xen-devel@lists.xenproject.org; Tue, 26 Nov 2024 23:22:06 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3d87a499-ac4d-11ef-a0cd-8be0dac302b0;
 Wed, 27 Nov 2024 00:22:02 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 550B45C5CF1;
 Tue, 26 Nov 2024 23:21:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 83748C4CEDD;
 Tue, 26 Nov 2024 23:21:56 +0000 (UTC)
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id 7C9CCD66B8E;
 Tue, 26 Nov 2024 23:21:56 +0000 (UTC)
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
X-Inumbo-ID: 3d87a499-ac4d-11ef-a0cd-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjI2MDQ6MTM4MDo0NjQxOmM1MDA6OjEiLCJoZWxvIjoiZGZ3LnNvdXJjZS5rZXJuZWwub3JnIn0=
X-Custom-Transaction: eyJpZCI6IjNkODdhNDk5LWFjNGQtMTFlZi1hMGNkLThiZTBkYWMzMDJiMCIsInRzIjoxNzMyNjYzMzIyLjg5ODM2Miwic2VuZGVyIjoiZGV2bnVsbCtkbXVraGluLmZvcmQuY29tQGtlcm5lbC5vcmciLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732663316;
	bh=Cap5cSdXQnJhIWZIJycGmw66XTO7q8HjNlh67Jy7JB4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=Roi4bnO89HuQscE/mllmZ4di8KrGNkAEgaFCrZwspwH1JCGP7EeSelMhqJp3FtN2p
	 1vmqcBEY6PtxBqWJW1VUHMpW/bPH5B+YC80zhJx30UowTy+ZgCQQnJEd0hnAn1Hlkt
	 XcGKUReaRSPFHSjEvr5WInFgGkBvQkKepHz1F2TNg2MZxcNVm5HUfJxwzd27u0Wdt2
	 DjdOJziJugSXgtF7Jn3f6bo30Ln6l01S2E8qR9nY0G4TFpac36FqwR/86tOFX/ts/x
	 nKhPwQFQosdNK6Bir87YPHUpd+Dfu25EOC3kfrmlu72LVexy+/k0LtMpla4qGDvOj8
	 CoRT7AHq/AL0A==
From: Denis Mukhin via B4 Relay <devnull+dmukhin.ford.com@kernel.org>
Date: Tue, 26 Nov 2024 15:22:07 -0800
Subject: [PATCH 17/36] xen/console: rename switch_serial_input() to
 console_find_owner()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241126-vuart-ns8250-v1-v1-17-87b9a8375b7a@ford.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1732663312; l=1478;
 i=dmukhin@ford.com; s=20241125; h=from:subject:message-id;
 bh=kkv+AJB+iT69SEANPtdQ4jOx6o8Fe+p28DiGHObsMCE=;
 b=34yyRPfAwR5Xa4Xuz4/BOFOrcATMDRQQnnZ5y9UsR0hdVr18qx/Zq/l4GCrf/HFvgLYIzpxwv
 YVD7bNrxNZHCYCzTZGhZp5eE+8zkM7+FIcjsbE+IX79uUTZFrdW6EHP
X-Developer-Key: i=dmukhin@ford.com; a=ed25519;
 pk=SsDZ9p39s0fqcpUKQuqKqrbn0rq6EtEAClvpOpzx6+U=
X-Endpoint-Received: by B4 Relay for dmukhin@ford.com/20241125 with
 auth_id=287
X-Original-From: Denis Mukhin <dmukhin@ford.com>
Reply-To: dmukhin@ford.com

From: Denis Mukhin <dmukhin@ford.com>

Updated the name to highlight the logic of selection the physical console
owner: existing code does not switch only serial console, it also switches
video console and debugging console (debug I/O port and console hypercall).

Signed-off-by: Denis Mukhin <dmukhin@ford.com>
---
 xen/drivers/char/console.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/xen/drivers/char/console.c b/xen/drivers/char/console.c
index 01fcbd5581d11f8f4f2b23592255b5c744430a3e..f8a7db385c9525cabc69ceb1a84d73f57863aa45 100644
--- a/xen/drivers/char/console.c
+++ b/xen/drivers/char/console.c
@@ -485,7 +485,7 @@ struct domain *rcu_lock_domain_console_owner(void)
 }
 #endif
 
-static void switch_serial_input(void)
+static void console_find_owner(void)
 {
     unsigned int next_rx = console_rx;
 
@@ -588,7 +588,7 @@ static void cf_check serial_rx(char c)
         /* We eat CTRL-<switch_char> in groups of 3 to switch console input. */
         if ( ++switch_code_count == 3 )
         {
-            switch_serial_input();
+            console_find_owner();
             switch_code_count = 0;
         }
         return;
@@ -1128,7 +1128,7 @@ void __init console_endboot(void)
                             "toggle host/guest log level adjustment", 0);
 
     /* Serial input is directed to DOM0 by default. */
-    switch_serial_input();
+    console_find_owner();
 }
 
 int __init console_has(const char *device)

-- 
2.34.1



