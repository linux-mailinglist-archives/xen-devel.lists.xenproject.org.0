Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C30F06B9825
	for <lists+xen-devel@lfdr.de>; Tue, 14 Mar 2023 15:39:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.509684.785931 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pc5oR-0000f9-RB; Tue, 14 Mar 2023 14:39:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 509684.785931; Tue, 14 Mar 2023 14:39:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pc5oR-0000d2-NY; Tue, 14 Mar 2023 14:39:39 +0000
Received: by outflank-mailman (input) for mailman id 509684;
 Tue, 14 Mar 2023 14:39:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Jlvw=7G=ilande.co.uk=mark.cave-ayland@srs-se1.protection.inumbo.net>)
 id 1pc5oP-0000cw-J8
 for xen-devel@lists.xenproject.org; Tue, 14 Mar 2023 14:39:37 +0000
Received: from mail.ilande.co.uk (mail.ilande.co.uk [2001:41c9:1:41f::167])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0ace75ab-c276-11ed-87f5-c1b5be75604c;
 Tue, 14 Mar 2023 15:39:36 +0100 (CET)
Received: from host86-163-239-161.range86-163.btcentralplus.com
 ([86.163.239.161] helo=[10.8.0.6])
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1pc5nX-0005Qr-Nu; Tue, 14 Mar 2023 14:38:47 +0000
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
X-Inumbo-ID: 0ace75ab-c276-11ed-87f5-c1b5be75604c
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:MIME-Version:Date:Message-ID:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=MHeqY/i8JTacdCm6spIoosz74dKHC7KWM8iUBqmIX20=; b=ASuuMXR2uuC+AL5d8Q4Y9Ejp5A
	SIb8FNXadeu1gMI9Ea6OrmLmjIQ7KXxKngtYicbAhFSUuXZX408Se6kGQLBfLGNQShOwDomOJICsL
	8c0QV821bGUWgSsDyNWXPgK9oh5GEuVntfhtv4LC0bBQiEqC2mQEwsKExCkwBIPD8gE5Sm3LgdAxC
	iIx6VOoAmJ+wdg1PUVq18UJ2F6jfFpGwPUolC+qM0EX2CnhwWz41XBP56UmR+CGStTp9L9Z14iZJJ
	XRTaSS3WSlrqMRCFVuer+NtZ9xRMBlnDRjEBIsvViuVd8nBO4/Jxi1y+jaeXo+elDH29Du+QPYAZO
	AZnHe/m31p4tRSMR/6O8l4utD7fFVSvqXKoZzBDipFwFph9wFJEx90SaVaIX3lepvzzliGSCi/d4K
	o6SmCdhVX1839ZXSOVmYohMkS+wu/tiiMGBZZ/8/i0LIfsxaYrcNnot7Biv3vp5ElWmBiVFTTxp22
	m+bTjCw5w60wqBB/j8MlXWaCHx00NEhbZyEV6we0ffdpeflLZfsEerrDeMj/ksnL8VsknoXO5xET9
	vKPrJ7AJJLif5yJ+KWzEF5BTIziXdqhyevkXjZPfQa8ITd7tx6I0I6Bdp74G7D9OM3h5FkllpeQtJ
	BqfaA5Simwtx9C7ax4EflrOsVXeDm6bgn2zDF32o0=;
Message-ID: <850cf67e-151a-b1c3-7265-1428659e3a6a@ilande.co.uk>
Date: Tue, 14 Mar 2023 14:39:22 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Content-Language: en-US
To: Chuck Zmudzinski <brchuckz@aol.com>, "Michael S. Tsirkin" <mst@redhat.com>
Cc: qemu-devel@nongnu.org, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony Perard <anthony.perard@citrix.com>, Paul Durrant <paul@xen.org>,
 xen-devel@lists.xenproject.org
References: <cover.1678763217.git.brchuckz@aol.com>
 <d9ae459b2814425c2d9e756e45d993c824da150a.1678763217.git.brchuckz@aol.com>
 <20230314023148-mutt-send-email-mst@kernel.org>
 <0c8ee7e9-dd23-262f-f67e-359e14abf6f2@ilande.co.uk>
 <20230314091653-mutt-send-email-mst@kernel.org>
 <34eda0c4-3d90-0e22-7888-81bf18e2a5f0@aol.com>
 <7b79ec08-064c-7940-0285-be8a96e2a144@ilande.co.uk>
 <7b822b6c-a0dc-63c9-722e-e1e0361a8d9d@aol.com>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
In-Reply-To: <7b822b6c-a0dc-63c9-722e-e1e0361a8d9d@aol.com>
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

On 14/03/2023 14:21, Chuck Zmudzinski wrote:

> On 3/14/2023 9:41 AM, Mark Cave-Ayland wrote:
>> On 14/03/2023 13:26, Chuck Zmudzinski wrote:
>>
>>> On 3/14/2023 9:17 AM, Michael S. Tsirkin wrote:
>>>> On Tue, Mar 14, 2023 at 12:43:12PM +0000, Mark Cave-Ayland wrote:
>>>>> On 14/03/2023 06:33, Michael S. Tsirkin wrote:
>>>>>
>>>>>> On Tue, Mar 14, 2023 at 12:01:09AM -0400, Chuck Zmudzinski wrote:
>>>>>>> Commit 4f67543bb8c5 ("xen/pt: reserve PCI slot 2 for Intel igd-passthru")
>>>>>>> uses slot_reserved_mask to reserve slot 2 for the Intel IGD for the
>>>>>>> xenfv machine when the guest is configured for igd-passthru.
>>>>>>>
>>>>>>> A desired extension to that commit is to allow use of the reserved slot
>>>>>>> if the administrator manually configures a device to use the reserved
>>>>>>> slot. Currently, slot_reserved_mask is enforced unconditionally. With
>>>>>>> this patch, the pci bus can be configured so the slot is only reserved
>>>>>>> if the pci device to be added to the bus is configured for automatic
>>>>>>> slot assignment.
>>>>>>>
>>>>>>> To enable the desired behavior of slot_reserved_mask machine, add a
>>>>>>> boolean member enforce_slot_reserved_mask_manual to struct PCIBus and
>>>>>>> add a function pci_bus_ignore_slot_reserved_mask_manual which can be
>>>>>>> called to change the default behavior of always enforcing
>>>>>>> slot_reserved_mask so, in that case, slot_reserved_mask is only enforced
>>>>>>> when the pci device being added is configured for automatic slot
>>>>>>> assignment.
>>>>>>>
>>>>>>> Call the new pci_bus_ignore_slot_reserved_mask_manual function after
>>>>>>> creating the pci bus for the pc/i440fx/xenfv machine type to implement
>>>>>>> the desired behavior of causing slot_reserved_mask to only apply when
>>>>>>> the pci device to be added to a pc/i440fx/xenfv machine is configured
>>>>>>> for automatic slot assignment.
>>>>>>>
>>>>>>> Link: https://lore.kernel.org/qemu-devel/20230106064838-mutt-send-email-mst@kernel.org/
>>>>>>> Signed-off-by: Chuck Zmudzinski <brchuckz@aol.com>
>>>>>>
>>>>>> I really dislike this.
>>>>>> It seems that xen should not have used slot_reserved_mask,
>>>>>> and instead needs something new like slot_manual_mask.
>>>>>> No?
>>>>>
>>>>> My suggestion was to move the validation logic to a separate callback
>>>>> function in PCIBus (see
>>>>> https://lists.gnu.org/archive/html/qemu-devel/2023-03/msg03988.html) but
>>>>> perhaps I wasn't clear enough in pointing out that I was thinking this could
>>>>> *replace* the existing slot_reserved_mask mechanism, rather than providing a
>>>>> hook to allow it to be manipulated.
>>>>>
>>>>> Here's a very rough patch put together over lunch that attempts this for
>>>>> pci_bus_devfn_reserved(): the idea is that sun4u and Xen would call
>>>>> pci_bus_set_slot_reserved_fn() with a suitable pci_slot_reserved_fn
>>>>> implementation, and slot_reserved_mask gets removed completely i.e.:
>>>>>
>>>>>
>>>>> diff --git a/hw/pci/pci.c b/hw/pci/pci.c
>>>>> index def5000e7b..30b856499a 100644
>>>>> --- a/hw/pci/pci.c
>>>>> +++ b/hw/pci/pci.c
>>>>> @@ -493,6 +493,13 @@ bool pci_bus_bypass_iommu(PCIBus *bus)
>>>>>        return host_bridge->bypass_iommu;
>>>>>    }
>>>>>
>>>>> +static bool pci_bus_default_slot_reserved(PCISlotReservationType restype,
>>>>> +                                          int devfn)
>>>>> +{
>>>>> +    /* All slots accessible by default */
>>>>> +    return false;
>>>>> +}
>>>>> +
>>>>>    static void pci_root_bus_internal_init(PCIBus *bus, DeviceState *parent,
>>>>>                                           MemoryRegion *address_space_mem,
>>>>>                                           MemoryRegion *address_space_io,
>>>>> @@ -500,7 +507,7 @@ static void pci_root_bus_internal_init(PCIBus *bus,
>>>>> DeviceState *parent,
>>>>>    {
>>>>>        assert(PCI_FUNC(devfn_min) == 0);
>>>>>        bus->devfn_min = devfn_min;
>>>>> -    bus->slot_reserved_mask = 0x0;
>>>>> +    bus->slot_reserved_fn = pci_bus_default_slot_reserved;
>>>>>        bus->address_space_mem = address_space_mem;
>>>>>        bus->address_space_io = address_space_io;
>>>>>        bus->flags |= PCI_BUS_IS_ROOT;
>>>>> @@ -1111,9 +1118,15 @@ static bool pci_bus_devfn_available(PCIBus *bus, int devfn)
>>>>>        return !(bus->devices[devfn]);
>>>>>    }
>>>>>
>>>>> -static bool pci_bus_devfn_reserved(PCIBus *bus, int devfn)
>>>>> +static bool pci_bus_devfn_reserved(PCIBus *bus, int devfn,
>>>>> +                                   PCISlotReservationType restype)
>>>>> +{
>>>>> +    return bus->slot_reserved_fn(restype, devfn);
>>>>> +}
>>>>> +
>>>>> +void pci_bus_set_slot_reserved_fn(PCIBus *bus, pci_slot_reserved_fn fn)
>>>>>    {
>>>>> -    return bus->slot_reserved_mask & (1UL << PCI_SLOT(devfn));
>>>>> +    bus->slot_reserved_fn = fn;
>>>>>    }
>>>>>
>>>>>    /* -1 for devfn means auto assign */
>>>>> @@ -1141,7 +1154,7 @@ static PCIDevice *do_pci_register_device(PCIDevice *pci_dev,
>>>>>            for(devfn = bus->devfn_min ; devfn < ARRAY_SIZE(bus->devices);
>>>>>                devfn += PCI_FUNC_MAX) {
>>>>>                if (pci_bus_devfn_available(bus, devfn) &&
>>>>> -                   !pci_bus_devfn_reserved(bus, devfn)) {
>>>>> +                   !pci_bus_devfn_reserved(bus, devfn, PCI_SLOT_RESERVATION_AUTO)) {
>>>>>                    goto found;
>>>>>                }
>>>>>            }
>>>>> @@ -1149,7 +1162,7 @@ static PCIDevice *do_pci_register_device(PCIDevice *pci_dev,
>>>>>                       "or reserved", name);
>>>>>            return NULL;
>>>>>        found: ;
>>>>> -    } else if (pci_bus_devfn_reserved(bus, devfn)) {
>>>>> +    } else if (pci_bus_devfn_reserved(bus, devfn, PCI_SLOT_RESERVATION_MANUAL)) {
>>>>>            error_setg(errp, "PCI: slot %d function %d not available for %s,"
>>>>>                                           MemoryRegion *address_space_io,
>>>>> @@ -500,7 +507,7 @@ static void pci_root_bus_internal_init(PCIBus *bus,
>>>>> DeviceState *parent,
>>>>>    {
>>>>>        assert(PCI_FUNC(devfn_min) == 0);
>>>>>        bus->devfn_min = devfn_min;
>>>>> -    bus->slot_reserved_mask = 0x0;
>>>>> +    bus->slot_reserved_fn = pci_bus_default_slot_reserved;
>>>>>        bus->address_space_mem = address_space_mem;
>>>>>        bus->address_space_io = address_space_io;
>>>>>        bus->flags |= PCI_BUS_IS_ROOT;
>>>>> @@ -1111,9 +1118,15 @@ static bool pci_bus_devfn_available(PCIBus *bus, int devfn)
>>>>>        return !(bus->devices[devfn]);
>>>>>    }
>>>>>
>>>>> -static bool pci_bus_devfn_reserved(PCIBus *bus, int devfn)
>>>>> +static bool pci_bus_devfn_reserved(PCIBus *bus, int devfn,
>>>>> +                                   PCISlotReservationType restype)
>>>>> +{
>>>>> +    return bus->slot_reserved_fn(restype, devfn);
>>>>> +}
>>>>> +
>>>>> +void pci_bus_set_slot_reserved_fn(PCIBus *bus, pci_slot_reserved_fn fn)
>>>>>    {
>>>>> -    return bus->slot_reserved_mask & (1UL << PCI_SLOT(devfn));
>>>>> +    bus->slot_reserved_fn = fn;
>>>>>    }
>>>>>
>>>>>    /* -1 for devfn means auto assign */
>>>>> @@ -1141,7 +1154,7 @@ static PCIDevice *do_pci_register_device(PCIDevice *pci_dev,
>>>>>            for(devfn = bus->devfn_min ; devfn < ARRAY_SIZE(bus->devices);
>>>>>                devfn += PCI_FUNC_MAX) {
>>>>>                if (pci_bus_devfn_available(bus, devfn) &&
>>>>> -                   !pci_bus_devfn_reserved(bus, devfn)) {
>>>>> +                   !pci_bus_devfn_reserved(bus, devfn, PCI_SLOT_RESERVATION_AUTO)) {
>>>>>                    goto found;
>>>>>                }
>>>>>            }
>>>>> @@ -1149,7 +1162,7 @@ static PCIDevice *do_pci_register_device(PCIDevice *pci_dev,
>>>>>                       "or reserved", name);
>>>>>            return NULL;
>>>>>        found: ;
>>>>> -    } else if (pci_bus_devfn_reserved(bus, devfn)) {
>>>>> +    } else if (pci_bus_devfn_reserved(bus, devfn, PCI_SLOT_RESERVATION_MANUAL)) {
>>>>>            error_setg(errp, "PCI: slot %d function %d not available for %s,"
>>>>>                       " reserved",
>>>>>                       PCI_SLOT(devfn), PCI_FUNC(devfn), name);
>>>>> diff --git a/include/hw/pci/pci.h b/include/hw/pci/pci.h
>>>>> index d5a40cd058..8a949f7ae1 100644
>>>>> --- a/include/hw/pci/pci.h
>>>>> +++ b/include/hw/pci/pci.h
>>>>> @@ -257,10 +257,18 @@ MemoryRegion *pci_address_space_io(PCIDevice *dev);
>>>>>     */
>>>>>    int pci_bar(PCIDevice *d, int reg);
>>>>>
>>>>> +typedef enum PCISlotReservationType {
>>>>> +    PCI_SLOT_RESERVATION_AUTO,
>>>>> +    PCI_SLOT_RESERVATION_MANUAL
>>>>> +} PCISlotReservationType;
>>>>> +
>>>>> +typedef bool (*pci_slot_reserved_fn)(PCISlotReservationType restype, int devfn);
>>>>>    typedef void (*pci_set_irq_fn)(void *opaque, int irq_num, int level);
>>>>>    typedef int (*pci_map_irq_fn)(PCIDevice *pci_dev, int irq_num);
>>>>>    typedef PCIINTxRoute (*pci_route_irq_fn)(void *opaque, int pin);
>>>>>
>>>>> +void pci_bus_set_slot_reserved_fn(PCIBus *bus, pci_slot_reserved_fn fn);
>>>>> +
>>>>>    #define TYPE_PCI_BUS "PCI"
>>>>>    OBJECT_DECLARE_TYPE(PCIBus, PCIBusClass, PCI_BUS)
>>>>>    #define TYPE_PCIE_BUS "PCIE"
>>>>> diff --git a/include/hw/pci/pci_bus.h b/include/hw/pci/pci_bus.h
>>>>> index 5653175957..d68ea1418d 100644
>>>>> --- a/include/hw/pci/pci_bus.h
>>>>> +++ b/include/hw/pci/pci_bus.h
>>>>> @@ -36,7 +36,7 @@ struct PCIBus {
>>>>>        PCIIOMMUFunc iommu_fn;
>>>>>        void *iommu_opaque;
>>>>>        uint8_t devfn_min;
>>>>> -    uint32_t slot_reserved_mask;
>>>>> +    pci_slot_reserved_fn slot_reserved_fn;
>>>>>        pci_set_irq_fn set_irq;
>>>>>        pci_map_irq_fn map_irq;
>>>>>        pci_route_irq_fn route_intx_to_irq;
>>>>>
>>>>>
>>>>> If this approach seems reasonable, I'm happy for someone else to take this
>>>>> over and turn it into a proper series.
>>>>>
>>>>>
>>>>> ATB,
>>>>>
>>>>> Mark.
>>>>
>>>> It's ok too though I think I like chuck's proposal better:
>>>> less callbacks to chase.
>>>>
>>>
>>> I would be willing to pursue this if there were more use cases for
>>> slot_reserved_mask than just the two cases we have now: xen and sun4u.
>>> Until there is a clear demand for a more general way to manipulate the
>>> mask, I agree with Michael that the KISS principle should apply here.
>>
>> No worries. The thinking behind this idea was that it feel like the Xen case is
>> special in that it has separate requirements for auto slot allocation and manual slot
>> allocation: if slot reservation were used in more places, I'd expect the sun4u case
>> to be more common, in which case it seems a bit more work for the common case to have
>> to set both slot_reserved_mask_auto and slot_reserved_mask_manual separately. Perhaps
>> a single accessor function can be used to set both mask values together for a PCIBus?
> 
> My immediate thought as a way to avoid needing to set both masks in the
> sun4u machine would be to add an initialization function that defines the
> relationship between the two masks. The sun4u machine would use a default
> function that simply sets the manual mask equal to the auto mask. In the
> special case of xen, the manual mask would be set to 0.

I must admit I wasn't too concerned about having two separate masks, more that in the 
common case you would have to remember to call two functions. I was thinking that 
instead of having separate pci_bus_set_slot_reserved_mask_auto() and 
pci_bus_set_slot_reserved_mask_manual() accessors, you could just have:

   pci_bus_set_slot_reserved_mask(uint32_t auto_mask, uint32_t manual_mask);

since that gives a single function call for all cases, and it seems fairly intuitive 
what pci_bus_set_slot_reserved_mask(foo, foo) is doing vs. 
pci_bus_set_slot_reserved_mask(foo, bar).


ATB,

Mark.

