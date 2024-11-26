Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 61F9C9D9F97
	for <lists+xen-devel@lfdr.de>; Wed, 27 Nov 2024 00:23:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.844068.1259706 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tG4tt-0002ld-IT; Tue, 26 Nov 2024 23:23:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 844068.1259706; Tue, 26 Nov 2024 23:23:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tG4ts-0002TT-Ol; Tue, 26 Nov 2024 23:23:20 +0000
Received: by outflank-mailman (input) for mailman id 844068;
 Tue, 26 Nov 2024 23:22:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rasV=SV=kernel.org=devnull+dmukhin.ford.com@srs-se1.protection.inumbo.net>)
 id 1tG4si-0000At-DM
 for xen-devel@lists.xenproject.org; Tue, 26 Nov 2024 23:22:08 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3aeb9b32-ac4d-11ef-99a3-01e77a169b0f;
 Wed, 27 Nov 2024 00:21:58 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id A67CF5C5C12;
 Tue, 26 Nov 2024 23:21:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9C951C4CEE1;
 Tue, 26 Nov 2024 23:21:55 +0000 (UTC)
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id 91754D66B8E;
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
X-Inumbo-ID: 3aeb9b32-ac4d-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjI2MDQ6MTM4MDo0NjQxOmM1MDA6OjEiLCJoZWxvIjoiZGZ3LnNvdXJjZS5rZXJuZWwub3JnIn0=
X-Custom-Transaction: eyJpZCI6IjNhZWI5YjMyLWFjNGQtMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMyNjYzMzE4LjcxNjY0OSwic2VuZGVyIjoiZGV2bnVsbCtkbXVraGluLmZvcmQuY29tQGtlcm5lbC5vcmciLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732663315;
	bh=8N48N7tGzPRpnph3uUKQy0qYgM/g5Ojg1QgMgxF7sN8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=dQiHVyRBD3LqER6trrKd4fXaZH8LcYXwkYaUFmwAtsRvWkUpfzaFPNcbGuWwY3qtQ
	 KIsoAI7ZpG7hFxf4VVZYEzhnKLDc94M6d5MWJaGYY6Az3Zmy5qknWXM1Pfc/ofXujB
	 5RlFU/FCcQ8FGcp/draW5YzykDszNR3OtbUJXAhL3gaWwx+dnnitntd5kjnVork2S+
	 6+GWfxNpFIUQbhpl1GTRowa4SSO7qGVRFLCb8VFyep5knS7OwsWP3SldGvoZ/xTX7j
	 T9UA5CppELRY1zoph6nxxN+pf99VedH5EZyN+F4wg2ua8y/9czMsjMd4GSzY+bUsJl
	 AXlTrmRxvg01w==
From: Denis Mukhin via B4 Relay <devnull+dmukhin.ford.com@kernel.org>
Date: Tue, 26 Nov 2024 15:21:57 -0800
Subject: [PATCH 07/36] arm/vuart: use guest_printk()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241126-vuart-ns8250-v1-v1-7-87b9a8375b7a@ford.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1732663312; l=1513;
 i=dmukhin@ford.com; s=20241125; h=from:subject:message-id;
 bh=6dwRL08Xk+9xlKPfi6ImA8lNmAhhTdKU8a+CgXv8hC0=;
 b=qZPve2qjLwadK8wGOIbj7Nd8nbym1+viKPOUXFNAuXOLAB6VxWO9OyEzQ4wvq/o0cAjeApBl8
 nHNN9lxCnELAb4T5ICI1vgTq6DKGkT2jX3/kAZwDT0rQ5syNYVP7mm8
X-Developer-Key: i=dmukhin@ford.com; a=ed25519;
 pk=SsDZ9p39s0fqcpUKQuqKqrbn0rq6EtEAClvpOpzx6+U=
X-Endpoint-Received: by B4 Relay for dmukhin@ford.com/20241125 with
 auth_id=287
X-Original-From: Denis Mukhin <dmukhin@ford.com>
Reply-To: dmukhin@ford.com

From: Denis Mukhin <dmukhin@ford.com>

Use guest_printk() in all current in-hypervisor UART emulators.

That slightly improves the logging as guest_printk() already prints the
domain ID.

Signed-off-by: Denis Mukhin <dmukhin@ford.com>
---
 xen/arch/arm/vpl011.c | 2 +-
 xen/arch/arm/vuart.c  | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/xen/arch/arm/vpl011.c b/xen/arch/arm/vpl011.c
index 1fc3114cce9ddb48cf199834c8e9abe8cfba92b5..8ade6f2588b8bbcc58fb0f9edc324502a1992ce7 100644
--- a/xen/arch/arm/vpl011.c
+++ b/xen/arch/arm/vpl011.c
@@ -107,7 +107,7 @@ static void vpl011_write_data_xen(struct domain *d, uint8_t data)
             if ( data != '\n' )
                 intf->out[intf->out_prod++] = '\n';
             intf->out[intf->out_prod++] = '\0';
-            printk("DOM%u: %s", d->domain_id, intf->out);
+            guest_printk(d, "%s", intf->out);
             intf->out_prod = 0;
         }
     }
diff --git a/xen/arch/arm/vuart.c b/xen/arch/arm/vuart.c
index ac76e2327bb84f05ea5716c6f5550f94812d2827..38ce8cc14fac4132578059b696be952b29fab809 100644
--- a/xen/arch/arm/vuart.c
+++ b/xen/arch/arm/vuart.c
@@ -89,7 +89,7 @@ static void vuart_print_char(struct vcpu *v, char c)
         if ( c != '\n' )
             uart->buf[uart->idx++] = '\n';
         uart->buf[uart->idx] = '\0';
-        printk(XENLOG_G_DEBUG "DOM%u: %s", d->domain_id, uart->buf);
+        guest_printk(d, "%s", uart->buf);
         uart->idx = 0;
     }
     spin_unlock(&uart->lock);

-- 
2.34.1



