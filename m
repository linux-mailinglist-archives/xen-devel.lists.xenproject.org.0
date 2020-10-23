Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 10ED1297291
	for <lists+xen-devel@lfdr.de>; Fri, 23 Oct 2020 17:42:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.11090.29393 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kVzCi-0001v0-VE; Fri, 23 Oct 2020 15:42:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 11090.29393; Fri, 23 Oct 2020 15:42:08 +0000
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
	id 1kVzCi-0001uT-Pv; Fri, 23 Oct 2020 15:42:08 +0000
Received: by outflank-mailman (input) for mailman id 11090;
 Fri, 23 Oct 2020 15:42:06 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=nEE3=D6=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1kVzCg-0001tF-NH
 for xen-devel@lists.xenproject.org; Fri, 23 Oct 2020 15:42:06 +0000
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b82c153b-1e68-4902-b1fc-9280c714a7cb;
 Fri, 23 Oct 2020 15:42:05 +0000 (UTC)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kVzCd-0006qO-Oh; Fri, 23 Oct 2020 15:42:03 +0000
Received: from 54-240-197-235.amazon.com ([54.240.197.235]
 helo=ufe34d9ed68d054.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kVzCd-0007wb-E2; Fri, 23 Oct 2020 15:42:03 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=nEE3=D6=xen.org=julien@srs-us1.protection.inumbo.net>)
	id 1kVzCg-0001tF-NH
	for xen-devel@lists.xenproject.org; Fri, 23 Oct 2020 15:42:06 +0000
X-Inumbo-ID: b82c153b-1e68-4902-b1fc-9280c714a7cb
Received: from mail.xenproject.org (unknown [104.130.215.37])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id b82c153b-1e68-4902-b1fc-9280c714a7cb;
	Fri, 23 Oct 2020 15:42:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From;
	 bh=5sAqH1p7E9o/e3huPMn1JHSLfgrcyUzmCSK/8SVUy1U=; b=nwHVoFWswujMk2ZQTQyCNN4bd
	NuokyUNJAPDY8glIgM1ehxPo2tRO6ZlkbldJpeTiD+3Oe6kqdQ2h86fHpkARJneWsZu6P0NxBmUfW
	Kz63m2Irep3sVriPLjeObGK7tS0nCs3OVNUNbEWBqcVno3un9BX+8nRmToKvsqx5eN6pY=;
Received: from xenbits.xenproject.org ([104.239.192.120])
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <julien@xen.org>)
	id 1kVzCd-0006qO-Oh; Fri, 23 Oct 2020 15:42:03 +0000
Received: from 54-240-197-235.amazon.com ([54.240.197.235] helo=ufe34d9ed68d054.ant.amazon.com)
	by xenbits.xenproject.org with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <julien@xen.org>)
	id 1kVzCd-0007wb-E2; Fri, 23 Oct 2020 15:42:03 +0000
From: Julien Grall <julien@xen.org>
To: xen-devel@lists.xenproject.org
Cc: alex.bennee@linaro.org,
	masami.hiramatsu@linaro.org,
	ehem+xen@m5p.com,
	bertrand.marquis@arm.com,
	andre.przywara@arm.com,
	Rahul.Singh@arm.com,
	Julien Grall <jgrall@amazon.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Ian Jackson <iwj@xenproject.org>,
	Jan Beulich <jbeulich@suse.com>,
	Wei Liu <wl@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Rahul Singh <rahul.singh@arm.com>
Subject: [PATCH v2 1/7] xen/acpi: Rework acpi_os_map_memory() and acpi_os_unmap_memory()
Date: Fri, 23 Oct 2020 16:41:50 +0100
Message-Id: <20201023154156.6593-2-julien@xen.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201023154156.6593-1-julien@xen.org>
References: <20201023154156.6593-1-julien@xen.org>

From: Julien Grall <jgrall@amazon.com>

The functions acpi_os_{un,}map_memory() are meant to be arch-agnostic
while the __acpi_os_{un,}map_memory() are meant to be arch-specific.

Currently, the former are still containing x86 specific code.

To avoid this rather strange split, the generic helpers are reworked so
they are arch-agnostic. This requires the introduction of a new helper
__acpi_os_unmap_memory() that will undo any mapping done by
__acpi_os_map_memory().

Currently, the arch-helper for unmap is basically a no-op so it only
returns whether the mapping was arch specific. But this will change
in the future.

Note that the x86 version of acpi_os_map_memory() was already able to
able the 1MB region. Hence why there is no addition of new code.

Signed-off-by: Julien Grall <jgrall@amazon.com>
Reviewed-by: Rahul Singh <rahul.singh@arm.com>
Tested-by: Rahul Singh <rahul.singh@arm.com>

---
    Changes in v2:
        - Constify ptr in __acpi_unmap_table()
        - Coding style fixes
        - Fix build on arm64
        - Use PAGE_OFFSET() rather than open-coding it
        - Add Rahul's tested-by and reviewed-by
---
 xen/arch/arm/acpi/lib.c | 12 ++++++++++++
 xen/arch/x86/acpi/lib.c | 18 ++++++++++++++++++
 xen/drivers/acpi/osl.c  | 34 ++++++++++++++++++----------------
 xen/include/xen/acpi.h  |  1 +
 4 files changed, 49 insertions(+), 16 deletions(-)

diff --git a/xen/arch/arm/acpi/lib.c b/xen/arch/arm/acpi/lib.c
index 4fc6e17322c1..fcc186b03399 100644
--- a/xen/arch/arm/acpi/lib.c
+++ b/xen/arch/arm/acpi/lib.c
@@ -30,6 +30,10 @@ char *__acpi_map_table(paddr_t phys, unsigned long size)
     unsigned long base, offset, mapped_size;
     int idx;
 
+    /* No arch specific implementation after early boot */
+    if ( system_state >= SYS_STATE_boot )
+        return NULL;
+
     offset = phys & (PAGE_SIZE - 1);
     mapped_size = PAGE_SIZE - offset;
     set_fixmap(FIXMAP_ACPI_BEGIN, maddr_to_mfn(phys), PAGE_HYPERVISOR);
@@ -49,6 +53,14 @@ char *__acpi_map_table(paddr_t phys, unsigned long size)
     return ((char *) base + offset);
 }
 
+bool __acpi_unmap_table(const void *ptr, unsigned long size)
+{
+    vaddr_t vaddr = (vaddr_t)ptr;
+
+    return ((vaddr >= FIXMAP_ADDR(FIXMAP_ACPI_BEGIN)) &&
+            (vaddr < (FIXMAP_ADDR(FIXMAP_ACPI_END) + PAGE_SIZE)));
+}
+
 /* True to indicate PSCI 0.2+ is implemented */
 bool __init acpi_psci_present(void)
 {
diff --git a/xen/arch/x86/acpi/lib.c b/xen/arch/x86/acpi/lib.c
index 265b9ad81905..a22414a05c13 100644
--- a/xen/arch/x86/acpi/lib.c
+++ b/xen/arch/x86/acpi/lib.c
@@ -46,6 +46,10 @@ char *__acpi_map_table(paddr_t phys, unsigned long size)
 	if ((phys + size) <= (1 * 1024 * 1024))
 		return __va(phys);
 
+	/* No further arch specific implementation after early boot */
+	if (system_state >= SYS_STATE_boot)
+		return NULL;
+
 	offset = phys & (PAGE_SIZE - 1);
 	mapped_size = PAGE_SIZE - offset;
 	set_fixmap(FIX_ACPI_END, phys);
@@ -66,6 +70,20 @@ char *__acpi_map_table(paddr_t phys, unsigned long size)
 	return ((char *) base + offset);
 }
 
+bool __acpi_unmap_table(const void *ptr, unsigned long size)
+{
+	unsigned long vaddr = (unsigned long)ptr;
+
+	if ((vaddr >= DIRECTMAP_VIRT_START) &&
+	    (vaddr < DIRECTMAP_VIRT_END)) {
+		ASSERT(!((__pa(ptr) + size - 1) >> 20));
+		return true;
+	}
+
+	return ((vaddr >= __fix_to_virt(FIX_ACPI_END)) &&
+		(vaddr < (__fix_to_virt(FIX_ACPI_BEGIN) + PAGE_SIZE)));
+}
+
 unsigned int acpi_get_processor_id(unsigned int cpu)
 {
 	unsigned int acpiid, apicid;
diff --git a/xen/drivers/acpi/osl.c b/xen/drivers/acpi/osl.c
index 4c8bb7839eda..389505f78666 100644
--- a/xen/drivers/acpi/osl.c
+++ b/xen/drivers/acpi/osl.c
@@ -92,27 +92,29 @@ acpi_physical_address __init acpi_os_get_root_pointer(void)
 void __iomem *
 acpi_os_map_memory(acpi_physical_address phys, acpi_size size)
 {
-	if (system_state >= SYS_STATE_boot) {
-		mfn_t mfn = _mfn(PFN_DOWN(phys));
-		unsigned int offs = phys & (PAGE_SIZE - 1);
-
-		/* The low first Mb is always mapped on x86. */
-		if (IS_ENABLED(CONFIG_X86) && !((phys + size - 1) >> 20))
-			return __va(phys);
-		return __vmap(&mfn, PFN_UP(offs + size), 1, 1,
-			      ACPI_MAP_MEM_ATTR, VMAP_DEFAULT) + offs;
-	}
-	return __acpi_map_table(phys, size);
+	void *ptr;
+	mfn_t mfn = _mfn(PFN_DOWN(phys));
+	unsigned int offs = PAGE_OFFSET(phys);
+
+	/* Try the arch specific implementation first */
+	ptr = __acpi_map_table(phys, size);
+	if (ptr)
+		return ptr;
+
+	/* No common implementation for early boot map */
+	if (unlikely(system_state < SYS_STATE_boot))
+		return NULL;
+
+	ptr = __vmap(&mfn, PFN_UP(offs + size), 1, 1,
+		     ACPI_MAP_MEM_ATTR, VMAP_DEFAULT);
+
+	return !ptr ? NULL : (ptr + offs);
 }
 
 void acpi_os_unmap_memory(void __iomem * virt, acpi_size size)
 {
-	if (IS_ENABLED(CONFIG_X86) &&
-	    (unsigned long)virt >= DIRECTMAP_VIRT_START &&
-	    (unsigned long)virt < DIRECTMAP_VIRT_END) {
-		ASSERT(!((__pa(virt) + size - 1) >> 20));
+	if (__acpi_unmap_table(virt, size))
 		return;
-	}
 
 	if (system_state >= SYS_STATE_boot)
 		vunmap((void *)((unsigned long)virt & PAGE_MASK));
diff --git a/xen/include/xen/acpi.h b/xen/include/xen/acpi.h
index c945ab05c864..21d5e9feb5ae 100644
--- a/xen/include/xen/acpi.h
+++ b/xen/include/xen/acpi.h
@@ -68,6 +68,7 @@ typedef int (*acpi_table_entry_handler) (struct acpi_subtable_header *header, co
 
 unsigned int acpi_get_processor_id (unsigned int cpu);
 char * __acpi_map_table (paddr_t phys_addr, unsigned long size);
+bool __acpi_unmap_table(const void *ptr, unsigned long size);
 int acpi_boot_init (void);
 int acpi_boot_table_init (void);
 int acpi_numa_init (void);
-- 
2.17.1


