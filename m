Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 53DBC297294
	for <lists+xen-devel@lfdr.de>; Fri, 23 Oct 2020 17:42:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.11094.29439 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kVzCr-00026X-Fa; Fri, 23 Oct 2020 15:42:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 11094.29439; Fri, 23 Oct 2020 15:42:17 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kVzCr-00025g-Bd; Fri, 23 Oct 2020 15:42:17 +0000
Received: by outflank-mailman (input) for mailman id 11094;
 Fri, 23 Oct 2020 15:42:16 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=nEE3=D6=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1kVzCq-000207-Gj
 for xen-devel@lists.xenproject.org; Fri, 23 Oct 2020 15:42:16 +0000
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id bfc2abb2-916e-40ab-af75-851762a3b815;
 Fri, 23 Oct 2020 15:42:14 +0000 (UTC)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kVzCo-0006rJ-1R; Fri, 23 Oct 2020 15:42:14 +0000
Received: from 54-240-197-235.amazon.com ([54.240.197.235]
 helo=ufe34d9ed68d054.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kVzCn-0007wb-Nx; Fri, 23 Oct 2020 15:42:14 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=nEE3=D6=xen.org=julien@srs-us1.protection.inumbo.net>)
	id 1kVzCq-000207-Gj
	for xen-devel@lists.xenproject.org; Fri, 23 Oct 2020 15:42:16 +0000
X-Inumbo-ID: bfc2abb2-916e-40ab-af75-851762a3b815
Received: from mail.xenproject.org (unknown [104.130.215.37])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id bfc2abb2-916e-40ab-af75-851762a3b815;
	Fri, 23 Oct 2020 15:42:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From;
	 bh=0dMZlXEOpL//B8eU1LrZwd4fsJbSpHy+FuAFJFAQtlc=; b=o9ZBsOfjpCE2qodp6iwnSik+u
	/G+MLIopOzwOuzu2Lmno4MWQQrO/cZynUbVEs63UAVkSCM3fyYYmzXokXvilQ/c7IGOwK5U1wAekT
	Dw5d1ThSe8xhB6wIYvxxmtDzs58TvYrwgfq3h64UMsEF8rZ+hLoV91zXPlh9d7iNpHS7k=;
Received: from xenbits.xenproject.org ([104.239.192.120])
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <julien@xen.org>)
	id 1kVzCo-0006rJ-1R; Fri, 23 Oct 2020 15:42:14 +0000
Received: from 54-240-197-235.amazon.com ([54.240.197.235] helo=ufe34d9ed68d054.ant.amazon.com)
	by xenbits.xenproject.org with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <julien@xen.org>)
	id 1kVzCn-0007wb-Nx; Fri, 23 Oct 2020 15:42:14 +0000
From: Julien Grall <julien@xen.org>
To: xen-devel@lists.xenproject.org
Cc: alex.bennee@linaro.org,
	masami.hiramatsu@linaro.org,
	ehem+xen@m5p.com,
	bertrand.marquis@arm.com,
	andre.przywara@arm.com,
	Rahul.Singh@arm.com,
	Julien Grall <julien.grall@arm.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Julien Grall <jgrall@amazon.com>
Subject: [PATCH v2 6/7] xen/arm: gic-v2: acpi: Use the correct length for the GICC structure
Date: Fri, 23 Oct 2020 16:41:55 +0100
Message-Id: <20201023154156.6593-7-julien@xen.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201023154156.6593-1-julien@xen.org>
References: <20201023154156.6593-1-julien@xen.org>

From: Julien Grall <julien.grall@arm.com>

The length of the GICC structure in the MADT ACPI table differs between
version 5.1 and 6.0, although there are no other relevant differences.

Use the BAD_MADT_GICC_ENTRY macro, which was specifically designed to
overcome this issue.

Signed-off-by: Julien Grall <julien.grall@arm.com>
Signed-off-by: Andre Przywara <andre.przywara@arm.com>
Signed-off-by: Julien Grall <jgrall@amazon.com>

---
    Changes in v2:
        - Patch added
---
 xen/arch/arm/acpi/boot.c | 2 +-
 xen/arch/arm/gic-v2.c    | 5 +++--
 xen/arch/arm/gic-v3.c    | 2 +-
 3 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/xen/arch/arm/acpi/boot.c b/xen/arch/arm/acpi/boot.c
index 30e4bd1bc5a7..55c3e5cbc834 100644
--- a/xen/arch/arm/acpi/boot.c
+++ b/xen/arch/arm/acpi/boot.c
@@ -131,7 +131,7 @@ acpi_parse_gic_cpu_interface(struct acpi_subtable_header *header,
     struct acpi_madt_generic_interrupt *processor =
                container_of(header, struct acpi_madt_generic_interrupt, header);
 
-    if ( BAD_MADT_ENTRY(processor, end) )
+    if ( BAD_MADT_GICC_ENTRY(processor, end) )
         return -EINVAL;
 
     acpi_table_print_madt_entry(header);
diff --git a/xen/arch/arm/gic-v2.c b/xen/arch/arm/gic-v2.c
index 0f747538dbcd..0e5f23201974 100644
--- a/xen/arch/arm/gic-v2.c
+++ b/xen/arch/arm/gic-v2.c
@@ -1136,7 +1136,8 @@ static int gicv2_make_hwdom_madt(const struct domain *d, u32 offset)
 
     host_gicc = container_of(header, struct acpi_madt_generic_interrupt,
                              header);
-    size = sizeof(struct acpi_madt_generic_interrupt);
+
+    size = ACPI_MADT_GICC_LENGTH;
     /* Add Generic Interrupt */
     for ( i = 0; i < d->max_vcpus; i++ )
     {
@@ -1165,7 +1166,7 @@ gic_acpi_parse_madt_cpu(struct acpi_subtable_header *header,
     struct acpi_madt_generic_interrupt *processor =
                container_of(header, struct acpi_madt_generic_interrupt, header);
 
-    if ( BAD_MADT_ENTRY(processor, end) )
+    if ( BAD_MADT_GICC_ENTRY(processor, end) )
         return -EINVAL;
 
     /* Read from APIC table and fill up the GIC variables */
diff --git a/xen/arch/arm/gic-v3.c b/xen/arch/arm/gic-v3.c
index 0f6cbf6224e9..ce202402c0ed 100644
--- a/xen/arch/arm/gic-v3.c
+++ b/xen/arch/arm/gic-v3.c
@@ -1558,7 +1558,7 @@ gic_acpi_parse_madt_cpu(struct acpi_subtable_header *header,
     struct acpi_madt_generic_interrupt *processor =
                container_of(header, struct acpi_madt_generic_interrupt, header);
 
-    if ( BAD_MADT_ENTRY(processor, end) )
+    if ( BAD_MADT_GICC_ENTRY(processor, end) )
         return -EINVAL;
 
     /* Read from APIC table and fill up the GIC variables */
-- 
2.17.1


