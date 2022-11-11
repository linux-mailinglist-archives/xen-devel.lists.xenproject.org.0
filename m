Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 79225625D59
	for <lists+xen-devel@lfdr.de>; Fri, 11 Nov 2022 15:42:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.442623.696984 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1otVEU-0000Uz-Jd; Fri, 11 Nov 2022 14:42:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 442623.696984; Fri, 11 Nov 2022 14:42:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1otVEU-0000SP-Gg; Fri, 11 Nov 2022 14:42:14 +0000
Received: by outflank-mailman (input) for mailman id 442623;
 Fri, 11 Nov 2022 14:42:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GQiV=3L=cantab.net=dvrabel@srs-se1.protection.inumbo.net>)
 id 1otVET-0000SJ-0a
 for xen-devel@lists.xenproject.org; Fri, 11 Nov 2022 14:42:13 +0000
Received: from smarthost01c.sbp.mail.zen.net.uk
 (smarthost01c.sbp.mail.zen.net.uk [212.23.1.5])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 061abaac-61cf-11ed-91b6-6bf2151ebd3b;
 Fri, 11 Nov 2022 15:42:11 +0100 (CET)
Received: from [82.70.146.41] (helo=pear.davidvrabel.org.uk)
 by smarthost01c.sbp.mail.zen.net.uk with esmtps
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.90_1)
 (envelope-from <dvrabel@cantab.net>)
 id 1otVEO-0006Et-Mx; Fri, 11 Nov 2022 14:42:08 +0000
Received: from apple.davidvrabel.org.uk ([82.70.146.43])
 by pear.davidvrabel.org.uk with esmtp (Exim 4.94.2)
 (envelope-from <dvrabel@cantab.net>)
 id 1otVEE-000WAF-6k; Fri, 11 Nov 2022 14:42:07 +0000
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
X-Inumbo-ID: 061abaac-61cf-11ed-91b6-6bf2151ebd3b
Message-ID: <2991d69a-eb13-7044-d65f-14540676e642@cantab.net>
Date: Fri, 11 Nov 2022 14:41:58 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, David Vrabel <dvrabel@amazon.co.uk>,
 xen-devel@lists.xenproject.org
References: <20221110165935.106376-1-dvrabel@amazon.co.uk>
 <20221110165935.106376-3-dvrabel@amazon.co.uk>
 <29e6e6ca-ffb8-3719-5004-0cccaeb5578b@suse.com>
Content-Language: en-GB
From: David Vrabel <dvrabel@cantab.net>
In-Reply-To: <29e6e6ca-ffb8-3719-5004-0cccaeb5578b@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 82.70.146.43
X-SA-Exim-Mail-From: dvrabel@cantab.net
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	pear.davidvrabel.org.uk
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_SOFTFAIL autolearn=ham autolearn_force=no
	version=3.4.6
Subject: Re: [PATCH 2/3] x86/msi: remove return value from msi_set_mask_bit()
X-SA-Exim-Version: 4.2.1 (built Sat, 13 Feb 2021 17:57:42 +0000)
X-SA-Exim-Scanned: Yes (on pear.davidvrabel.org.uk)
X-Originating-smarthost01c-IP: [82.70.146.41]
Feedback-ID: 82.70.146.41



On 11/11/2022 09:44, Jan Beulich wrote:
> 
> The idea of the WARN() / BUG_ON() is to
> - not leave failed unmasking unrecorded,
> - not continue after failure to mask an entry.

Then lets make msi_set_mask_bit() unable to fail with something like 
this (untested) patch. Would this be acceptable?

David

 From 837649a70d44455f4fd98e2eaa46dcf35a56d00a Mon Sep 17 00:00:00 2001
From: David Vrabel <dvrabel@amazon.co.uk>
Date: Fri, 11 Nov 2022 14:30:16 +0000
Subject: [PATCH] x86: Always enable memory space decodes when using MSI-X

Instead of the numerous (racy) checks for memory space accesses being
enabled before writing the the MSI-X table, force Memory Space Enable
to be set in the Command register if MSI-X is used.

This allows the memory_decoded() function and the associated error
paths to be removed (since it will always return true). In particular,
msi_set_mask_bit() can no longer fail and its return value is removed.

Note that if the PCI device is a virtual function, the relevant
command register is in the corresponding physical function.

Signed-off-by: David Vrabel <dvrabel@amazon.co.uk>
---
  xen/arch/x86/include/asm/pci.h |   3 +
  xen/arch/x86/msi.c             | 116 +++++++++------------------------
  xen/arch/x86/pci.c             |  39 ++++++++++-
  3 files changed, 71 insertions(+), 87 deletions(-)

diff --git a/xen/arch/x86/include/asm/pci.h b/xen/arch/x86/include/asm/pci.h
index f4a58c8acf..4f59b70959 100644
--- a/xen/arch/x86/include/asm/pci.h
+++ b/xen/arch/x86/include/asm/pci.h
@@ -32,8 +32,11 @@ struct arch_pci_dev {
      domid_t pseudo_domid;
      mfn_t leaf_mfn;
      struct page_list_head pgtables_list;
+    uint16_t host_command;
+    uint16_t guest_command;
  };

+void pci_command_override(struct pci_dev *pdev, uint16_t val);
  int pci_conf_write_intercept(unsigned int seg, unsigned int bdf,
                               unsigned int reg, unsigned int size,
                               uint32_t *data);
diff --git a/xen/arch/x86/msi.c b/xen/arch/x86/msi.c
index d0bf63df1d..2f8667aa7b 100644
--- a/xen/arch/x86/msi.c
+++ b/xen/arch/x86/msi.c
@@ -124,27 +124,11 @@ static void msix_put_fixmap(struct arch_msix 
*msix, int idx)
      spin_unlock(&msix->table_lock);
  }

-static bool memory_decoded(const struct pci_dev *dev)
-{
-    pci_sbdf_t sbdf = dev->sbdf;
-
-    if ( dev->info.is_virtfn )
-    {
-        sbdf.bus = dev->info.physfn.bus;
-        sbdf.devfn = dev->info.physfn.devfn;
-    }
-
-    return pci_conf_read16(sbdf, PCI_COMMAND) & PCI_COMMAND_MEMORY;
-}
-
  static bool msix_memory_decoded(const struct pci_dev *dev, unsigned 
int pos)
  {
      uint16_t control = pci_conf_read16(dev->sbdf, msix_control_reg(pos));

-    if ( !(control & PCI_MSIX_FLAGS_ENABLE) )
-        return false;
-
-    return memory_decoded(dev);
+    return control & PCI_MSIX_FLAGS_ENABLE;
  }

  /*
@@ -314,7 +298,7 @@ int msi_maskable_irq(const struct msi_desc *entry)
             || entry->msi_attrib.maskbit;
  }

-static bool msi_set_mask_bit(struct irq_desc *desc, bool host, bool guest)
+static void msi_set_mask_bit(struct irq_desc *desc, bool host, bool guest)
  {
      struct msi_desc *entry = desc->msi_desc;
      struct pci_dev *pdev;
@@ -354,45 +338,26 @@ static bool msi_set_mask_bit(struct irq_desc 
*desc, bool host, bool guest)
                               control | (PCI_MSIX_FLAGS_ENABLE |
                                          PCI_MSIX_FLAGS_MASKALL));
          }
-        if ( likely(memory_decoded(pdev)) )
-        {
-            writel(flag, entry->mask_base + 
PCI_MSIX_ENTRY_VECTOR_CTRL_OFFSET);
-            readl(entry->mask_base + PCI_MSIX_ENTRY_VECTOR_CTRL_OFFSET);

-            if ( likely(control & PCI_MSIX_FLAGS_ENABLE) )
-                break;
-
-            entry->msi_attrib.host_masked = host;
-            entry->msi_attrib.guest_masked = guest;
+        writel(flag, entry->mask_base + PCI_MSIX_ENTRY_VECTOR_CTRL_OFFSET);
+        readl(entry->mask_base + PCI_MSIX_ENTRY_VECTOR_CTRL_OFFSET);

-            flag = true;
-        }
-        else if ( flag && !(control & PCI_MSIX_FLAGS_MASKALL) )
+        if ( unlikely(!(control & PCI_MSIX_FLAGS_ENABLE)) )
          {
-            domid_t domid = pdev->domain->domain_id;
-
-            maskall = true;
-            if ( pdev->msix->warned != domid )
-            {
-                pdev->msix->warned = domid;
-                printk(XENLOG_G_WARNING
-                       "cannot mask IRQ %d: masking MSI-X on Dom%d's 
%pp\n",
-                       desc->irq, domid, &pdev->sbdf);
-            }
+            pdev->msix->host_maskall = maskall;
+            if ( maskall || pdev->msix->guest_maskall )
+                control |= PCI_MSIX_FLAGS_MASKALL;
+            pci_conf_write16(pdev->sbdf,
+                             msix_control_reg(entry->msi_attrib.pos), 
control);
          }
-        pdev->msix->host_maskall = maskall;
-        if ( maskall || pdev->msix->guest_maskall )
-            control |= PCI_MSIX_FLAGS_MASKALL;
-        pci_conf_write16(pdev->sbdf,
-                         msix_control_reg(entry->msi_attrib.pos), control);
-        return flag;
+        break;
      default:
-        return 0;
+        ASSERT_UNREACHABLE();
+        break;
      }
+
      entry->msi_attrib.host_masked = host;
      entry->msi_attrib.guest_masked = guest;
-
-    return 1;
  }

  static int msi_get_mask_bit(const struct msi_desc *entry)
@@ -418,16 +383,12 @@ static int msi_get_mask_bit(const struct msi_desc 
*entry)

  void cf_check mask_msi_irq(struct irq_desc *desc)
  {
-    if ( unlikely(!msi_set_mask_bit(desc, 1,
- 
desc->msi_desc->msi_attrib.guest_masked)) )
-        BUG_ON(!(desc->status & IRQ_DISABLED));
+    msi_set_mask_bit(desc, 1, desc->msi_desc->msi_attrib.guest_masked);
  }

  void cf_check unmask_msi_irq(struct irq_desc *desc)
  {
-    if ( unlikely(!msi_set_mask_bit(desc, 0,
- 
desc->msi_desc->msi_attrib.guest_masked)) )
-        WARN();
+    msi_set_mask_bit(desc, 0, desc->msi_desc->msi_attrib.guest_masked);
  }

  void guest_mask_msi_irq(struct irq_desc *desc, bool mask)
@@ -437,15 +398,13 @@ void guest_mask_msi_irq(struct irq_desc *desc, 
bool mask)

  static unsigned int cf_check startup_msi_irq(struct irq_desc *desc)
  {
-    if ( unlikely(!msi_set_mask_bit(desc, 0, !!(desc->status & 
IRQ_GUEST))) )
-        WARN();
+    msi_set_mask_bit(desc, 0, !!(desc->status & IRQ_GUEST));
      return 0;
  }

  static void cf_check shutdown_msi_irq(struct irq_desc *desc)
  {
-    if ( unlikely(!msi_set_mask_bit(desc, 1, 1)) )
-        BUG_ON(!(desc->status & IRQ_DISABLED));
+    msi_set_mask_bit(desc, 1, 1);
  }

  void cf_check ack_nonmaskable_msi_irq(struct irq_desc *desc)
@@ -785,6 +744,12 @@ static int msix_capability_init(struct pci_dev *dev,

      ASSERT(pcidevs_locked());

+    /*
+     * Force enable access to the MSI-X tables, so access to the
+     * per-vector mask bits always works.
+     */
+    pci_command_override(dev, PCI_COMMAND_MEMORY);
+
      control = pci_conf_read16(dev->sbdf, msix_control_reg(pos));
      /*
       * Ensure MSI-X interrupts are masked during setup. Some devices 
require
@@ -797,13 +762,6 @@ static int msix_capability_init(struct pci_dev *dev,
                       control | (PCI_MSIX_FLAGS_ENABLE |
                                  PCI_MSIX_FLAGS_MASKALL));

-    if ( unlikely(!memory_decoded(dev)) )
-    {
-        pci_conf_write16(dev->sbdf, msix_control_reg(pos),
-                         control & ~PCI_MSIX_FLAGS_ENABLE);
-        return -ENXIO;
-    }
-
      if ( desc )
      {
          entry = alloc_msi_entry(1);
@@ -1122,19 +1080,15 @@ static void __pci_disable_msix(struct msi_desc 
*entry)

      BUG_ON(list_empty(&dev->msi_list));

-    if ( likely(memory_decoded(dev)) )
-        writel(1, entry->mask_base + PCI_MSIX_ENTRY_VECTOR_CTRL_OFFSET);
-    else if ( !(control & PCI_MSIX_FLAGS_MASKALL) )
-    {
-        printk(XENLOG_WARNING "cannot disable IRQ %d: masking MSI-X on 
%pp\n",
-               entry->irq, &dev->sbdf);
-        maskall = true;
-    }
+    writel(1, entry->mask_base + PCI_MSIX_ENTRY_VECTOR_CTRL_OFFSET);
+
      dev->msix->host_maskall = maskall;
      if ( maskall || dev->msix->guest_maskall )
          control |= PCI_MSIX_FLAGS_MASKALL;
      pci_conf_write16(dev->sbdf, msix_control_reg(pos), control);

+    pci_command_override(dev, 0);
+
      _pci_cleanup_msix(dev->msix);
  }

@@ -1353,13 +1307,6 @@ int pci_restore_msi_state(struct pci_dev *pdev)
              pci_conf_write16(pdev->sbdf, msix_control_reg(pos),
                               control | (PCI_MSIX_FLAGS_ENABLE |
                                          PCI_MSIX_FLAGS_MASKALL));
-            if ( unlikely(!memory_decoded(pdev)) )
-            {
-                spin_unlock_irqrestore(&desc->lock, flags);
-                pci_conf_write16(pdev->sbdf, msix_control_reg(pos),
-                                 control & ~PCI_MSIX_FLAGS_ENABLE);
-                return -ENXIO;
-            }
          }
          type = entry->msi_attrib.type;

@@ -1368,10 +1315,9 @@ int pci_restore_msi_state(struct pci_dev *pdev)

          for ( i = 0; ; )
          {
-            if ( unlikely(!msi_set_mask_bit(desc,
- 
entry[i].msi_attrib.host_masked,
- 
entry[i].msi_attrib.guest_masked)) )
-                BUG();
+            msi_set_mask_bit(desc,
+                             entry[i].msi_attrib.host_masked,
+                             entry[i].msi_attrib.guest_masked);

              if ( !--nr )
                  break;
diff --git a/xen/arch/x86/pci.c b/xen/arch/x86/pci.c
index 97b792e578..0c4b49f042 100644
--- a/xen/arch/x86/pci.c
+++ b/xen/arch/x86/pci.c
@@ -69,6 +69,24 @@ void pci_conf_write(uint32_t cf8, uint8_t offset, 
uint8_t bytes, uint32_t data)
      spin_unlock_irqrestore(&pci_config_lock, flags);
  }

+void pci_command_override(struct pci_dev *pdev, uint16_t val)
+{
+    pci_sbdf_t sbdf = pdev->sbdf;
+
+    ASSERT(pcidevs_locked());
+
+    if ( pdev->info.is_virtfn )
+    {
+        sbdf.bus = pdev->info.physfn.bus;
+        sbdf.devfn = pdev->info.physfn.devfn;
+
+        pdev = pci_get_pdev(NULL, sbdf);
+    }
+
+    pdev->arch.host_command = val;
+    pci_conf_write16(sbdf, PCI_COMMAND, pdev->arch.host_command | 
pdev->arch.guest_command);
+}
+
  int pci_conf_write_intercept(unsigned int seg, unsigned int bdf,
                               unsigned int reg, unsigned int size,
                               uint32_t *data)
@@ -85,14 +103,31 @@ int pci_conf_write_intercept(unsigned int seg, 
unsigned int bdf,
       * Avoid expensive operations when no hook is going to do anything
       * for the access anyway.
       */
-    if ( reg < 64 || reg >= 256 )
+    if ( reg != PCI_COMMAND && (reg < 64 || reg >= 256) )
          return 0;

      pcidevs_lock();

      pdev = pci_get_pdev(NULL, PCI_SBDF(seg, bdf));
      if ( pdev )
-        rc = pci_msi_conf_write_intercept(pdev, reg, size, data);
+    {
+        switch ( reg )
+        {
+        case PCI_COMMAND:
+            if ( size == 2 )
+            {
+                pdev->arch.guest_command = *data;
+                *data |= pdev->arch.host_command;
+            }
+            else
+                rc = -EACCESS;
+            break;
+
+        default:
+            rc = pci_msi_conf_write_intercept(pdev, reg, size, data);
+            break;
+        }
+    }

      pcidevs_unlock();

-- 
2.37.1


