Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A1ABE9D9FAC
	for <lists+xen-devel@lfdr.de>; Wed, 27 Nov 2024 00:32:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.844257.1259855 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tG52h-0007NN-8o; Tue, 26 Nov 2024 23:32:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 844257.1259855; Tue, 26 Nov 2024 23:32:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tG52h-0007La-5l; Tue, 26 Nov 2024 23:32:27 +0000
Received: by outflank-mailman (input) for mailman id 844257;
 Tue, 26 Nov 2024 23:32:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rasV=SV=kernel.org=devnull+dmukhin.ford.com@srs-se1.protection.inumbo.net>)
 id 1tG4sp-0000At-EC
 for xen-devel@lists.xenproject.org; Tue, 26 Nov 2024 23:22:15 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3f7da23a-ac4d-11ef-99a3-01e77a169b0f;
 Wed, 27 Nov 2024 00:22:05 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 874FF5C5BF6;
 Tue, 26 Nov 2024 23:21:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id B79D1C4CED0;
 Tue, 26 Nov 2024 23:21:57 +0000 (UTC)
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id AB5C4D66B9D;
 Tue, 26 Nov 2024 23:21:57 +0000 (UTC)
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
X-Inumbo-ID: 3f7da23a-ac4d-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjEzOS4xNzguODQuMjE3IiwiaGVsbyI6ImRmdy5zb3VyY2Uua2VybmVsLm9yZyJ9
X-Custom-Transaction: eyJpZCI6IjNmN2RhMjNhLWFjNGQtMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMyNjYzMzI1LjM2NDIxLCJzZW5kZXIiOiJkZXZudWxsK2RtdWtoaW4uZm9yZC5jb21Aa2VybmVsLm9yZyIsInJlY2lwaWVudCI6Inhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZyJ9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732663317;
	bh=WDr/PwUo7NPVqK8vVCu/sN3ApYHaNVXqHBFVutTjEsg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=bkBhss7xSShP7C40xt01FhoPGq5cQEMVzQF4f2cY3ApbZPrWn7RayCwmhkqJRhEhj
	 d6yKiwYR+jFN1eG47mBUGxoEWMABee3dAqxyeK0yi/0MD+1Km5Ebt9i3+JdaS5RJu3
	 aw2qgl3uxapuufS+U+6DSi0HA2ElrQecaX47KVibJZSY+TAx0NohANkA9ZxMHdM7z6
	 jRCwe5WFfl6Ug2eaHwfbVtOur+sA67kkVw//QOvpq7ZQSqCdIM9EWMr3HLEuZuVjlq
	 XiZqAPJ26GgjnQ1c1Qyzc/jfAXYECd8GAN/u5bpwh465T4X/OnTnjuNlD67+T6SoGv
	 d16BKhnKRlEpg==
From: Denis Mukhin via B4 Relay <devnull+dmukhin.ford.com@kernel.org>
Date: Tue, 26 Nov 2024 15:22:22 -0800
Subject: [PATCH 32/36] x86/hvm: add helpers for raising guest IRQs
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241126-vuart-ns8250-v1-v1-32-87b9a8375b7a@ford.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1732663312; l=1876;
 i=dmukhin@ford.com; s=20241125; h=from:subject:message-id;
 bh=7BbjWtYddozrVOKtAkZI0QGQoqm6ofyyNdgxey+37YU=;
 b=ThSK3I1nGSONSUOI8mLhfE3bYgxEWNIeTGmqKGF4Wt0hASsaBfM9mvC9LGsCTP8xT/H1gbzAI
 1Ak2zfg3dNeDPlENUq8QeW8vsLJWhYmLYPD53ex/4VN5v6wLCj5aagQ
X-Developer-Key: i=dmukhin@ford.com; a=ed25519;
 pk=SsDZ9p39s0fqcpUKQuqKqrbn0rq6EtEAClvpOpzx6+U=
X-Endpoint-Received: by B4 Relay for dmukhin@ford.com/20241125 with
 auth_id=287
X-Original-From: Denis Mukhin <dmukhin@ford.com>
Reply-To: dmukhin@ford.com

From: Denis Mukhin <dmukhin@ford.com>

Added convenience wrappers for asserting/de-asserting interrupts in the
hardware emulation code.

That will be used for PCI-based NS8250 emulator.

Signed-off-by: Denis Mukhin <dmukhin@ford.com>
---
 xen/arch/x86/hvm/irq.c             | 24 ++++++++++++++++++++++++
 xen/arch/x86/include/asm/hvm/irq.h |  3 +++
 2 files changed, 27 insertions(+)

diff --git a/xen/arch/x86/hvm/irq.c b/xen/arch/x86/hvm/irq.c
index 1eab44defca4c82ec35769617c66c380cc07d1b6..9e3a50d21dcf281c1015116094e47795c51ed5d0 100644
--- a/xen/arch/x86/hvm/irq.c
+++ b/xen/arch/x86/hvm/irq.c
@@ -242,6 +242,30 @@ void hvm_isa_irq_deassert(
     spin_unlock(&d->arch.hvm.irq_lock);
 }
 
+void hvm_irq_raise(struct domain *d, unsigned int irq)
+{
+    if ( irq < NR_ISAIRQS )
+    {
+        hvm_isa_irq_assert(d, irq, NULL);
+    }
+    else
+    {
+        hvm_gsi_assert(d, irq);
+    }
+}
+
+void hvm_irq_lower(struct domain *d, unsigned int irq)
+{
+    if ( irq < NR_ISAIRQS )
+    {
+        hvm_isa_irq_deassert(d, irq);
+    }
+    else
+    {
+        hvm_gsi_deassert(d, irq);
+    }
+}
+
 static void hvm_set_callback_irq_level(struct vcpu *v)
 {
     struct domain *d = v->domain;
diff --git a/xen/arch/x86/include/asm/hvm/irq.h b/xen/arch/x86/include/asm/hvm/irq.h
index 87e89993a44f48f366fa84e851688f383cb562d4..27bb9f64171c1b8aac2cf119699e60c91e727177 100644
--- a/xen/arch/x86/include/asm/hvm/irq.h
+++ b/xen/arch/x86/include/asm/hvm/irq.h
@@ -210,6 +210,9 @@ void hvm_maybe_deassert_evtchn_irq(void);
 void hvm_assert_evtchn_irq(struct vcpu *v);
 void hvm_set_callback_via(struct domain *d, uint64_t via);
 
+void hvm_irq_raise(struct domain *d, unsigned int irq);
+void hvm_irq_lower(struct domain *d, unsigned int irq);
+
 struct pirq;
 bool hvm_domain_use_pirq(const struct domain *d, const struct pirq *pirq);
 

-- 
2.34.1



