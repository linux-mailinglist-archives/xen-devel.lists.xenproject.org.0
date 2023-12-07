Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D5BF808386
	for <lists+xen-devel@lfdr.de>; Thu,  7 Dec 2023 09:48:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.649607.1014310 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rBA3E-0004hD-8c; Thu, 07 Dec 2023 08:48:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 649607.1014310; Thu, 07 Dec 2023 08:48:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rBA3E-0004fV-5X; Thu, 07 Dec 2023 08:48:08 +0000
Received: by outflank-mailman (input) for mailman id 649607;
 Thu, 07 Dec 2023 08:48:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZB3o=HS=bugseng.com=federico.serafini@srs-se1.protection.inumbo.net>)
 id 1rBA3C-0004QV-VO
 for xen-devel@lists.xenproject.org; Thu, 07 Dec 2023 08:48:06 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 56230068-94dd-11ee-9b0f-b553b5be7939;
 Thu, 07 Dec 2023 09:48:05 +0100 (CET)
Received: from Dell.bugseng.com (unknown [78.210.131.21])
 by support.bugseng.com (Postfix) with ESMTPSA id A91F14EE073E;
 Thu,  7 Dec 2023 09:48:03 +0100 (CET)
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
X-Inumbo-ID: 56230068-94dd-11ee-9b0f-b553b5be7939
From: Federico Serafini <federico.serafini@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com,
	Federico Serafini <federico.serafini@bugseng.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [XEN PATCH v2 1/5] x86/acpi: remove acpi_pic_sci_set_trigger()
Date: Thu,  7 Dec 2023 09:47:50 +0100
Message-Id: <f0c7d42c12a0b89c61265cdfe67a35b07d220aa0.1701936906.git.federico.serafini@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1701936906.git.federico.serafini@bugseng.com>
References: <cover.1701936906.git.federico.serafini@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove apci_pic_set_trigger() declaration: there is no definition and there are
no calls to such function in the XEN project.

Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
---
 xen/arch/x86/include/asm/acpi.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/xen/arch/x86/include/asm/acpi.h b/xen/arch/x86/include/asm/acpi.h
index 0df92d3714..48b1d69946 100644
--- a/xen/arch/x86/include/asm/acpi.h
+++ b/xen/arch/x86/include/asm/acpi.h
@@ -81,7 +81,6 @@ extern bool acpi_lapic, acpi_ioapic, acpi_noirq;
 extern bool acpi_force, acpi_ht, acpi_disabled;
 extern u32 acpi_smi_cmd;
 extern u8 acpi_enable_value, acpi_disable_value;
-void acpi_pic_sci_set_trigger(unsigned int, u16);
 
 static inline void disable_acpi(void)
 {
-- 
2.34.1


