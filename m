Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 119A26B9457
	for <lists+xen-devel@lfdr.de>; Tue, 14 Mar 2023 13:44:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.509580.785596 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pc40F-000398-15; Tue, 14 Mar 2023 12:43:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 509580.785596; Tue, 14 Mar 2023 12:43:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pc40E-00035l-UJ; Tue, 14 Mar 2023 12:43:42 +0000
Received: by outflank-mailman (input) for mailman id 509580;
 Tue, 14 Mar 2023 12:43:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Jlvw=7G=ilande.co.uk=mark.cave-ayland@srs-se1.protection.inumbo.net>)
 id 1pc40C-00035f-Jk
 for xen-devel@lists.xenproject.org; Tue, 14 Mar 2023 12:43:40 +0000
Received: from mail.ilande.co.uk (mail.ilande.co.uk [2001:41c9:1:41f::167])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d590f97e-c265-11ed-b464-930f4c7d94ae;
 Tue, 14 Mar 2023 13:43:35 +0100 (CET)
Received: from host86-163-239-161.range86-163.btcentralplus.com
 ([86.163.239.161] helo=[10.8.0.6])
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1pc3zA-0004h1-Sb; Tue, 14 Mar 2023 12:42:41 +0000
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
X-Inumbo-ID: d590f97e-c265-11ed-b464-930f4c7d94ae
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:Content-Type:
	In-Reply-To:References:Cc:To:From:MIME-Version:Date:Message-ID:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=O5zCB1k2FdYUY9A+/YbV/9tfJVsNytKUjXn99hzuQrI=; b=T5gl8ugKxyFxp7CAOpT7W7YPdW
	d1HVLOEnxwRdw6qDuE4k+1pi3L2hk8senh9fHvFDHJwixrmZELulKCDMhn7TQwvLPMeieYEMdYkbl
	R3r+jw1gGk3Ee83AcUOnM5S/+RtWdIIgZAXrr++swM3aangyCP5+gDh+B0RXzQp4ioc9B+QvRAkIs
	fYxU2cncF+H8j6p8z6GzgDOOCJgoMd84zmUTeWT8ccBDOiYlZ0JkEetFZpSq/tqyI87kbEdoxh4az
	F4HDaZ9PC9MEq8RmrnypKa/cyQ5ao6786riogJDnhXPQLkatn1kdB9fJ7RPg43IKq/k9MVbFTSV7l
	+leSCTbH7cMUNGg0FLBeno3ijAfVBc+bXI8cviFUmI0dyZ0lJU22YcN9NkFPHkECfb3MytlAQYHP+
	G/roYxd2FZV2A6MInhE+0AtlE1qG0Zz+r2GF+HggLncWupjuc75f+1l62+QX7L08n1yao4wniW98C
	GaExflts9xht5ltBN936lcAFxiyKojbJPCcZBvBKiFFLCTL23MmmYTTpaf4J5OdDU1Gmr9EYkglM4
	msEh5oYyDXmqb9PxxNffuw1nEA/fWw/Aun2Nuqkt/KM2L69xYomy0g/HI4Dg9FO3gn3S/AWRuHLC4
	ji1EHxDUp3PzO7eIWvjkKnb8jdjjT8vI4rk6qnoiY=;
Message-ID: <0c8ee7e9-dd23-262f-f67e-359e14abf6f2@ilande.co.uk>
Date: Tue, 14 Mar 2023 12:43:12 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: "Michael S. Tsirkin" <mst@redhat.com>, Chuck Zmudzinski <brchuckz@aol.com>
Cc: qemu-devel@nongnu.org, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony Perard <anthony.perard@citrix.com>, Paul Durrant <paul@xen.org>,
 xen-devel@lists.xenproject.org
References: <cover.1678763217.git.brchuckz@aol.com>
 <d9ae459b2814425c2d9e756e45d993c824da150a.1678763217.git.brchuckz@aol.com>
 <20230314023148-mutt-send-email-mst@kernel.org>
Content-Language: en-US
In-Reply-To: <20230314023148-mutt-send-email-mst@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 86.163.239.161
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on
	mail.default.ilande.bv.iomart.io
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=5.0 tests=ALL_TRUSTED,BAYES_00,
	URIBL_BLOCKED,URIBL_SBL_A autolearn=no autolearn_force=no version=3.4.2
Subject: Re: [PATCH v2 2/2] pci: allow slot_reserved_mask to be ignored with
 manual slot assignment
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.ilande.co.uk)

On 14/03/2023 06:33, Michael S. Tsirkin wrote:

> On Tue, Mar 14, 2023 at 12:01:09AM -0400, Chuck Zmudzinski wrote:
>> Commit 4f67543bb8c5 ("xen/pt: reserve PCI slot 2 for Intel igd-passthru")
>> uses slot_reserved_mask to reserve slot 2 for the Intel IGD for the
>> xenfv machine when the guest is configured for igd-passthru.
>>
>> A desired extension to that commit is to allow use of the reserved slot
>> if the administrator manually configures a device to use the reserved
>> slot. Currently, slot_reserved_mask is enforced unconditionally. With
>> this patch, the pci bus can be configured so the slot is only reserved
>> if the pci device to be added to the bus is configured for automatic
>> slot assignment.
>>
>> To enable the desired behavior of slot_reserved_mask machine, add a
>> boolean member enforce_slot_reserved_mask_manual to struct PCIBus and
>> add a function pci_bus_ignore_slot_reserved_mask_manual which can be
>> called to change the default behavior of always enforcing
>> slot_reserved_mask so, in that case, slot_reserved_mask is only enforced
>> when the pci device being added is configured for automatic slot
>> assignment.
>>
>> Call the new pci_bus_ignore_slot_reserved_mask_manual function after
>> creating the pci bus for the pc/i440fx/xenfv machine type to implement
>> the desired behavior of causing slot_reserved_mask to only apply when
>> the pci device to be added to a pc/i440fx/xenfv machine is configured
>> for automatic slot assignment.
>>
>> Link: https://lore.kernel.org/qemu-devel/20230106064838-mutt-send-email-mst@kernel.org/
>> Signed-off-by: Chuck Zmudzinski <brchuckz@aol.com>
> 
> I really dislike this.
> It seems that xen should not have used slot_reserved_mask,
> and instead needs something new like slot_manual_mask.
> No?

My suggestion was to move the validation logic to a separate callback function in 
PCIBus (see https://lists.gnu.org/archive/html/qemu-devel/2023-03/msg03988.html) but 
perhaps I wasn't clear enough in pointing out that I was thinking this could 
*replace* the existing slot_reserved_mask mechanism, rather than providing a hook to 
allow it to be manipulated.

Here's a very rough patch put together over lunch that attempts this for 
pci_bus_devfn_reserved(): the idea is that sun4u and Xen would call 
pci_bus_set_slot_reserved_fn() with a suitable pci_slot_reserved_fn implementation, 
and slot_reserved_mask gets removed completely i.e.:


diff --git a/hw/pci/pci.c b/hw/pci/pci.c
index def5000e7b..30b856499a 100644
--- a/hw/pci/pci.c
+++ b/hw/pci/pci.c
@@ -493,6 +493,13 @@ bool pci_bus_bypass_iommu(PCIBus *bus)
      return host_bridge->bypass_iommu;
  }

+static bool pci_bus_default_slot_reserved(PCISlotReservationType restype,
+                                          int devfn)
+{
+    /* All slots accessible by default */
+    return false;
+}
+
  static void pci_root_bus_internal_init(PCIBus *bus, DeviceState *parent,
                                         MemoryRegion *address_space_mem,
                                         MemoryRegion *address_space_io,
@@ -500,7 +507,7 @@ static void pci_root_bus_internal_init(PCIBus *bus, DeviceState 
*parent,
  {
      assert(PCI_FUNC(devfn_min) == 0);
      bus->devfn_min = devfn_min;
-    bus->slot_reserved_mask = 0x0;
+    bus->slot_reserved_fn = pci_bus_default_slot_reserved;
      bus->address_space_mem = address_space_mem;
      bus->address_space_io = address_space_io;
      bus->flags |= PCI_BUS_IS_ROOT;
@@ -1111,9 +1118,15 @@ static bool pci_bus_devfn_available(PCIBus *bus, int devfn)
      return !(bus->devices[devfn]);
  }

-static bool pci_bus_devfn_reserved(PCIBus *bus, int devfn)
+static bool pci_bus_devfn_reserved(PCIBus *bus, int devfn,
+                                   PCISlotReservationType restype)
+{
+    return bus->slot_reserved_fn(restype, devfn);
+}
+
+void pci_bus_set_slot_reserved_fn(PCIBus *bus, pci_slot_reserved_fn fn)
  {
-    return bus->slot_reserved_mask & (1UL << PCI_SLOT(devfn));
+    bus->slot_reserved_fn = fn;
  }

  /* -1 for devfn means auto assign */
@@ -1141,7 +1154,7 @@ static PCIDevice *do_pci_register_device(PCIDevice *pci_dev,
          for(devfn = bus->devfn_min ; devfn < ARRAY_SIZE(bus->devices);
              devfn += PCI_FUNC_MAX) {
              if (pci_bus_devfn_available(bus, devfn) &&
-                   !pci_bus_devfn_reserved(bus, devfn)) {
+                   !pci_bus_devfn_reserved(bus, devfn, PCI_SLOT_RESERVATION_AUTO)) {
                  goto found;
              }
          }
@@ -1149,7 +1162,7 @@ static PCIDevice *do_pci_register_device(PCIDevice *pci_dev,
                     "or reserved", name);
          return NULL;
      found: ;
-    } else if (pci_bus_devfn_reserved(bus, devfn)) {
+    } else if (pci_bus_devfn_reserved(bus, devfn, PCI_SLOT_RESERVATION_MANUAL)) {
          error_setg(errp, "PCI: slot %d function %d not available for %s,"
                                         MemoryRegion *address_space_io,
@@ -500,7 +507,7 @@ static void pci_root_bus_internal_init(PCIBus *bus, DeviceState 
*parent,
  {
      assert(PCI_FUNC(devfn_min) == 0);
      bus->devfn_min = devfn_min;
-    bus->slot_reserved_mask = 0x0;
+    bus->slot_reserved_fn = pci_bus_default_slot_reserved;
      bus->address_space_mem = address_space_mem;
      bus->address_space_io = address_space_io;
      bus->flags |= PCI_BUS_IS_ROOT;
@@ -1111,9 +1118,15 @@ static bool pci_bus_devfn_available(PCIBus *bus, int devfn)
      return !(bus->devices[devfn]);
  }

-static bool pci_bus_devfn_reserved(PCIBus *bus, int devfn)
+static bool pci_bus_devfn_reserved(PCIBus *bus, int devfn,
+                                   PCISlotReservationType restype)
+{
+    return bus->slot_reserved_fn(restype, devfn);
+}
+
+void pci_bus_set_slot_reserved_fn(PCIBus *bus, pci_slot_reserved_fn fn)
  {
-    return bus->slot_reserved_mask & (1UL << PCI_SLOT(devfn));
+    bus->slot_reserved_fn = fn;
  }

  /* -1 for devfn means auto assign */
@@ -1141,7 +1154,7 @@ static PCIDevice *do_pci_register_device(PCIDevice *pci_dev,
          for(devfn = bus->devfn_min ; devfn < ARRAY_SIZE(bus->devices);
              devfn += PCI_FUNC_MAX) {
              if (pci_bus_devfn_available(bus, devfn) &&
-                   !pci_bus_devfn_reserved(bus, devfn)) {
+                   !pci_bus_devfn_reserved(bus, devfn, PCI_SLOT_RESERVATION_AUTO)) {
                  goto found;
              }
          }
@@ -1149,7 +1162,7 @@ static PCIDevice *do_pci_register_device(PCIDevice *pci_dev,
                     "or reserved", name);
          return NULL;
      found: ;
-    } else if (pci_bus_devfn_reserved(bus, devfn)) {
+    } else if (pci_bus_devfn_reserved(bus, devfn, PCI_SLOT_RESERVATION_MANUAL)) {
          error_setg(errp, "PCI: slot %d function %d not available for %s,"
                     " reserved",
                     PCI_SLOT(devfn), PCI_FUNC(devfn), name);
diff --git a/include/hw/pci/pci.h b/include/hw/pci/pci.h
index d5a40cd058..8a949f7ae1 100644
--- a/include/hw/pci/pci.h
+++ b/include/hw/pci/pci.h
@@ -257,10 +257,18 @@ MemoryRegion *pci_address_space_io(PCIDevice *dev);
   */
  int pci_bar(PCIDevice *d, int reg);

+typedef enum PCISlotReservationType {
+    PCI_SLOT_RESERVATION_AUTO,
+    PCI_SLOT_RESERVATION_MANUAL
+} PCISlotReservationType;
+
+typedef bool (*pci_slot_reserved_fn)(PCISlotReservationType restype, int devfn);
  typedef void (*pci_set_irq_fn)(void *opaque, int irq_num, int level);
  typedef int (*pci_map_irq_fn)(PCIDevice *pci_dev, int irq_num);
  typedef PCIINTxRoute (*pci_route_irq_fn)(void *opaque, int pin);

+void pci_bus_set_slot_reserved_fn(PCIBus *bus, pci_slot_reserved_fn fn);
+
  #define TYPE_PCI_BUS "PCI"
  OBJECT_DECLARE_TYPE(PCIBus, PCIBusClass, PCI_BUS)
  #define TYPE_PCIE_BUS "PCIE"
diff --git a/include/hw/pci/pci_bus.h b/include/hw/pci/pci_bus.h
index 5653175957..d68ea1418d 100644
--- a/include/hw/pci/pci_bus.h
+++ b/include/hw/pci/pci_bus.h
@@ -36,7 +36,7 @@ struct PCIBus {
      PCIIOMMUFunc iommu_fn;
      void *iommu_opaque;
      uint8_t devfn_min;
-    uint32_t slot_reserved_mask;
+    pci_slot_reserved_fn slot_reserved_fn;
      pci_set_irq_fn set_irq;
      pci_map_irq_fn map_irq;
      pci_route_irq_fn route_intx_to_irq;


If this approach seems reasonable, I'm happy for someone else to take this over and 
turn it into a proper series.


ATB,

Mark.

