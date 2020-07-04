Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 662D1214877
	for <lists+xen-devel@lfdr.de>; Sat,  4 Jul 2020 21:45:04 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jro5D-00073O-1t; Sat, 04 Jul 2020 19:44:19 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jWGQ=AP=eik.bme.hu=balaton@srs-us1.protection.inumbo.net>)
 id 1jro5B-00073J-Os
 for xen-devel@lists.xenproject.org; Sat, 04 Jul 2020 19:44:17 +0000
X-Inumbo-ID: bd90b5aa-be2e-11ea-bb8b-bc764e2007e4
Received: from zero.eik.bme.hu (unknown [2001:738:2001:2001::2001])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id bd90b5aa-be2e-11ea-bb8b-bc764e2007e4;
 Sat, 04 Jul 2020 19:44:15 +0000 (UTC)
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 3DEE874633F;
 Sat,  4 Jul 2020 21:44:14 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id E5D1774633D; Sat,  4 Jul 2020 21:44:13 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id E33B574632B;
 Sat,  4 Jul 2020 21:44:13 +0200 (CEST)
Date: Sat, 4 Jul 2020 21:44:13 +0200 (CEST)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: =?ISO-8859-15?Q?Philippe_Mathieu-Daud=E9?= <f4bug@amsat.org>
Subject: Re: [PATCH 24/26] hw/usb/usb-hcd: Use UHCI type definitions
In-Reply-To: <f19dc1c9-8b72-695b-bce1-660e547e5658@amsat.org>
Message-ID: <alpine.BSF.2.22.395.2007042140380.45095@zero.eik.bme.hu>
References: <20200704144943.18292-1-f4bug@amsat.org>
 <20200704144943.18292-25-f4bug@amsat.org>
 <alpine.BSF.2.22.395.2007041916060.92265@zero.eik.bme.hu>
 <f19dc1c9-8b72-695b-bce1-660e547e5658@amsat.org>
User-Agent: Alpine 2.22 (BSF 395 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="3866299591-28275790-1593891853=:45095"
X-Spam-Checker-Version: Sophos PMX: 6.4.8.2820816,
 Antispam-Engine: 2.7.2.2107409, Antispam-Data: 2020.7.4.193917,
 AntiVirus-Engine: 5.74.0, AntiVirus-Data: 2020.7.3.5740002
X-Spam-Flag: NO
X-Spam-Probability: 9%
X-Spam-Level: 
X-Spam-Status: No, score=9% required=50%
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Huacai Chen <chenhc@lemote.com>, Eric Blake <eblake@redhat.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, Paul Durrant <paul@xen.org>,
 Magnus Damm <magnus.damm@gmail.com>, Markus Armbruster <armbru@redhat.com>,
 =?ISO-8859-15?Q?Herv=E9_Poussineau?= <hpoussin@reactos.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Anthony Perard <anthony.perard@citrix.com>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Leif Lindholm <leif@nuviainc.com>, Andrzej Zaborowski <balrogg@gmail.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Alistair Francis <alistair@alistair23.me>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Beniamino Galvani <b.galvani@gmail.com>,
 =?ISO-8859-15?Q?Marc-Andr=E9_Lureau?= <marcandre.lureau@redhat.com>,
 Niek Linnenbank <nieklinnenbank@gmail.com>, qemu-arm@nongnu.org,
 xen-devel@lists.xenproject.org, Richard Henderson <rth@twiddle.net>,
 Radoslaw Biernacki <radoslaw.biernacki@linaro.org>,
 Igor Mitsyanko <i.mitsyanko@gmail.com>,
 =?ISO-8859-15?Q?Philippe_Mathieu-Daud=E9?= <philmd@redhat.com>,
 Paul Zimmerman <pauldzim@gmail.com>, qemu-ppc@nongnu.org,
 David Gibson <david@gibson.dropbear.id.au>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--3866299591-28275790-1593891853=:45095
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8BIT

On Sat, 4 Jul 2020, Philippe Mathieu-Daudé wrote:
> On 7/4/20 7:17 PM, BALATON Zoltan wrote:
>> On Sat, 4 Jul 2020, Philippe Mathieu-Daudé wrote:
>>> Various machine/board/soc models create UHCI device instances
>>> with the generic QDEV API, and don't need to access USB internals.
>>>
>>> Simplify header inclusions by moving the QOM type names into a
>>> simple header, with no need to include other "hw/usb" headers.
>>>
>>> Suggested-by: BALATON Zoltan <balaton@eik.bme.hu>
>>> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>>> ---
>>> include/hw/usb/usb-hcd.h |  6 ++++++
>>> hw/i386/pc_piix.c        |  3 ++-
>>> hw/i386/pc_q35.c         | 13 +++++++------
>>> hw/isa/piix4.c           |  3 ++-
>>> hw/mips/fuloong2e.c      |  5 +++--
>>> hw/usb/hcd-uhci.c        | 19 ++++++++++---------
>>> 6 files changed, 30 insertions(+), 19 deletions(-)
>>>
>>> diff --git a/include/hw/usb/usb-hcd.h b/include/hw/usb/usb-hcd.h
>>> index 74af3a4533..c9d0a88984 100644
>>> --- a/include/hw/usb/usb-hcd.h
>>> +++ b/include/hw/usb/usb-hcd.h
>>> @@ -24,4 +24,10 @@
>>> #define TYPE_FUSBH200_EHCI          "fusbh200-ehci-usb"
>>> #define TYPE_CHIPIDEA               "usb-chipidea"
>>>
>>> +/* UHCI */
>>> +#define TYPE_PIIX3_USB_UHCI         "piix3-usb-uhci"
>>> +#define TYPE_PIIX4_USB_UHCI         "piix4-usb-uhci"
>>> +#define TYPE_VT82C686B_USB_UHCI     "vt82c686b-usb-uhci"
>>> +#define TYPE_ICH9_USB_UHCI(n)       "ich9-usb-uhci" #n
>>
>> What is that #n at the end? Looks like a typo. Does it break compilation?
>
> #n is a C preprocessor feature that expand the 'n' argument to a "n"
> string, so:
>
> TYPE_ICH9_USB_UHCI(1) = "ich9-usb-uhci" #1
>                      = "ich9-usb-uhci" "1"
>                      = "ich9-usb-uhci1"
>
> I'm pretty sure we use that elsewhere. If not, I can add a definition
> for each 1 ... 6 typenames.

No it's OK, no need to list all defines. I just did not notice the macro 
argument that's why I was wondering where it comes from. This seems to be 
used elsewhere at least here:

hw/audio/es1370.c:#define a(n) if (val & CTRL_##n) strcat (buf, " "#n)
hw/audio/es1370.c:#define a(n) if (val & SCTRL_##n) strcat (buf, " "#n)
hw/audio/es1370.c:#define b(n) if (!(val & SCTRL_##n)) strcat (buf, " "#n)

Maybe writing it without the space between "# is clearer as then it looks 
more like it's part of the value.

Regards,
BALATON Zoltan

>>> +
>>> #endif
>>> diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
>>> index 4d1de7cfab..0024c346c6 100644
>>> --- a/hw/i386/pc_piix.c
>>> +++ b/hw/i386/pc_piix.c
>>> @@ -37,6 +37,7 @@
>>> #include "hw/pci/pci.h"
>>> #include "hw/pci/pci_ids.h"
>>> #include "hw/usb/usb.h"
>>> +#include "hw/usb/usb-hcd.h"
>>> #include "net/net.h"
>>> #include "hw/ide/pci.h"
>>> #include "hw/irq.h"
>>> @@ -275,7 +276,7 @@ static void pc_init1(MachineState *machine,
>>> #endif
>>>
>>>     if (pcmc->pci_enabled && machine_usb(machine)) {
>>> -        pci_create_simple(pci_bus, piix3_devfn + 2, "piix3-usb-uhci");
>>> +        pci_create_simple(pci_bus, piix3_devfn + 2,
>>> TYPE_PIIX3_USB_UHCI);
>>>     }
>>>
>>>     if (pcmc->pci_enabled &&
>>> x86_machine_is_acpi_enabled(X86_MACHINE(pcms))) {
>>> diff --git a/hw/i386/pc_q35.c b/hw/i386/pc_q35.c
>>> index b985f5bea1..a80527e6ed 100644
>>> --- a/hw/i386/pc_q35.c
>>> +++ b/hw/i386/pc_q35.c
>>> @@ -51,6 +51,7 @@
>>> #include "hw/ide/pci.h"
>>> #include "hw/ide/ahci.h"
>>> #include "hw/usb/usb.h"
>>> +#include "hw/usb/usb-hcd.h"
>>> #include "qapi/error.h"
>>> #include "qemu/error-report.h"
>>> #include "sysemu/numa.h"
>>> @@ -68,15 +69,15 @@ struct ehci_companions {
>>> };
>>>
>>> static const struct ehci_companions ich9_1d[] = {
>>> -    { .name = "ich9-usb-uhci1", .func = 0, .port = 0 },
>>> -    { .name = "ich9-usb-uhci2", .func = 1, .port = 2 },
>>> -    { .name = "ich9-usb-uhci3", .func = 2, .port = 4 },
>>> +    { .name = TYPE_ICH9_USB_UHCI(1), .func = 0, .port = 0 },
>>> +    { .name = TYPE_ICH9_USB_UHCI(2), .func = 1, .port = 2 },
>>> +    { .name = TYPE_ICH9_USB_UHCI(3), .func = 2, .port = 4 },
>>> };
>>>
>>> static const struct ehci_companions ich9_1a[] = {
>>> -    { .name = "ich9-usb-uhci4", .func = 0, .port = 0 },
>>> -    { .name = "ich9-usb-uhci5", .func = 1, .port = 2 },
>>> -    { .name = "ich9-usb-uhci6", .func = 2, .port = 4 },
>>> +    { .name = TYPE_ICH9_USB_UHCI(4), .func = 0, .port = 0 },
>>> +    { .name = TYPE_ICH9_USB_UHCI(5), .func = 1, .port = 2 },
>>> +    { .name = TYPE_ICH9_USB_UHCI(6), .func = 2, .port = 4 },
>>> };
>>>
>>> static int ehci_create_ich9_with_companions(PCIBus *bus, int slot)
>>> diff --git a/hw/isa/piix4.c b/hw/isa/piix4.c
>>> index f634bcb2d1..e11e5fae21 100644
>>> --- a/hw/isa/piix4.c
>>> +++ b/hw/isa/piix4.c
>>> @@ -29,6 +29,7 @@
>>> #include "hw/southbridge/piix.h"
>>> #include "hw/pci/pci.h"
>>> #include "hw/isa/isa.h"
>>> +#include "hw/usb/usb-hcd.h"
>>> #include "hw/sysbus.h"
>>> #include "hw/intc/i8259.h"
>>> #include "hw/dma/i8257.h"
>>> @@ -255,7 +256,7 @@ DeviceState *piix4_create(PCIBus *pci_bus, ISABus
>>> **isa_bus, I2CBus **smbus)
>>>     pci = pci_create_simple(pci_bus, devfn + 1, "piix4-ide");
>>>     pci_ide_create_devs(pci);
>>>
>>> -    pci_create_simple(pci_bus, devfn + 2, "piix4-usb-uhci");
>>> +    pci_create_simple(pci_bus, devfn + 2, TYPE_PIIX4_USB_UHCI);
>>>     if (smbus) {
>>>         *smbus = piix4_pm_init(pci_bus, devfn + 3, 0x1100,
>>>                                isa_get_irq(NULL, 9), NULL, 0, NULL);
>>> diff --git a/hw/mips/fuloong2e.c b/hw/mips/fuloong2e.c
>>> index 8ca31e5162..b6d33dd2cd 100644
>>> --- a/hw/mips/fuloong2e.c
>>> +++ b/hw/mips/fuloong2e.c
>>> @@ -33,6 +33,7 @@
>>> #include "hw/mips/mips.h"
>>> #include "hw/mips/cpudevs.h"
>>> #include "hw/pci/pci.h"
>>> +#include "hw/usb/usb-hcd.h"
>>> #include "qemu/log.h"
>>> #include "hw/loader.h"
>>> #include "hw/ide/pci.h"
>>> @@ -258,8 +259,8 @@ static void vt82c686b_southbridge_init(PCIBus
>>> *pci_bus, int slot, qemu_irq intc,
>>>     dev = pci_create_simple(pci_bus, PCI_DEVFN(slot, 1), "via-ide");
>>>     pci_ide_create_devs(dev);
>>>
>>> -    pci_create_simple(pci_bus, PCI_DEVFN(slot, 2),
>>> "vt82c686b-usb-uhci");
>>> -    pci_create_simple(pci_bus, PCI_DEVFN(slot, 3),
>>> "vt82c686b-usb-uhci");
>>> +    pci_create_simple(pci_bus, PCI_DEVFN(slot, 2),
>>> TYPE_VT82C686B_USB_UHCI);
>>> +    pci_create_simple(pci_bus, PCI_DEVFN(slot, 3),
>>> TYPE_VT82C686B_USB_UHCI);
>>>
>>>     *i2c_bus = vt82c686b_pm_init(pci_bus, PCI_DEVFN(slot, 4), 0xeee1,
>>> NULL);
>>>
>>> diff --git a/hw/usb/hcd-uhci.c b/hw/usb/hcd-uhci.c
>>> index 1d4dd33b6c..da078dc3fa 100644
>>> --- a/hw/usb/hcd-uhci.c
>>> +++ b/hw/usb/hcd-uhci.c
>>> @@ -39,6 +39,7 @@
>>> #include "qemu/main-loop.h"
>>> #include "qemu/module.h"
>>> #include "usb-internal.h"
>>> +#include "hw/usb/usb-hcd.h"
>>>
>>> #define FRAME_TIMER_FREQ 1000
>>>
>>> @@ -1358,21 +1359,21 @@ static void uhci_data_class_init(ObjectClass
>>> *klass, void *data)
>>>
>>> static UHCIInfo uhci_info[] = {
>>>     {
>>> -        .name       = "piix3-usb-uhci",
>>> +        .name      = TYPE_PIIX3_USB_UHCI,
>>>         .vendor_id = PCI_VENDOR_ID_INTEL,
>>>         .device_id = PCI_DEVICE_ID_INTEL_82371SB_2,
>>>         .revision  = 0x01,
>>>         .irq_pin   = 3,
>>>         .unplug    = true,
>>>     },{
>>> -        .name      = "piix4-usb-uhci",
>>> +        .name      = TYPE_PIIX4_USB_UHCI,
>>>         .vendor_id = PCI_VENDOR_ID_INTEL,
>>>         .device_id = PCI_DEVICE_ID_INTEL_82371AB_2,
>>>         .revision  = 0x01,
>>>         .irq_pin   = 3,
>>>         .unplug    = true,
>>>     },{
>>> -        .name      = "vt82c686b-usb-uhci",
>>> +        .name      = TYPE_VT82C686B_USB_UHCI,
>>>         .vendor_id = PCI_VENDOR_ID_VIA,
>>>         .device_id = PCI_DEVICE_ID_VIA_UHCI,
>>>         .revision  = 0x01,
>>> @@ -1380,42 +1381,42 @@ static UHCIInfo uhci_info[] = {
>>>         .realize   = usb_uhci_vt82c686b_realize,
>>>         .unplug    = true,
>>>     },{
>>> -        .name      = "ich9-usb-uhci1", /* 00:1d.0 */
>>> +        .name      = TYPE_ICH9_USB_UHCI(1), /* 00:1d.0 */
>>>         .vendor_id = PCI_VENDOR_ID_INTEL,
>>>         .device_id = PCI_DEVICE_ID_INTEL_82801I_UHCI1,
>>>         .revision  = 0x03,
>>>         .irq_pin   = 0,
>>>         .unplug    = false,
>>>     },{
>>> -        .name      = "ich9-usb-uhci2", /* 00:1d.1 */
>>> +        .name      = TYPE_ICH9_USB_UHCI(2), /* 00:1d.1 */
>>>         .vendor_id = PCI_VENDOR_ID_INTEL,
>>>         .device_id = PCI_DEVICE_ID_INTEL_82801I_UHCI2,
>>>         .revision  = 0x03,
>>>         .irq_pin   = 1,
>>>         .unplug    = false,
>>>     },{
>>> -        .name      = "ich9-usb-uhci3", /* 00:1d.2 */
>>> +        .name      = TYPE_ICH9_USB_UHCI(3), /* 00:1d.2 */
>>>         .vendor_id = PCI_VENDOR_ID_INTEL,
>>>         .device_id = PCI_DEVICE_ID_INTEL_82801I_UHCI3,
>>>         .revision  = 0x03,
>>>         .irq_pin   = 2,
>>>         .unplug    = false,
>>>     },{
>>> -        .name      = "ich9-usb-uhci4", /* 00:1a.0 */
>>> +        .name      = TYPE_ICH9_USB_UHCI(4), /* 00:1a.0 */
>>>         .vendor_id = PCI_VENDOR_ID_INTEL,
>>>         .device_id = PCI_DEVICE_ID_INTEL_82801I_UHCI4,
>>>         .revision  = 0x03,
>>>         .irq_pin   = 0,
>>>         .unplug    = false,
>>>     },{
>>> -        .name      = "ich9-usb-uhci5", /* 00:1a.1 */
>>> +        .name      = TYPE_ICH9_USB_UHCI(5), /* 00:1a.1 */
>>>         .vendor_id = PCI_VENDOR_ID_INTEL,
>>>         .device_id = PCI_DEVICE_ID_INTEL_82801I_UHCI5,
>>>         .revision  = 0x03,
>>>         .irq_pin   = 1,
>>>         .unplug    = false,
>>>     },{
>>> -        .name      = "ich9-usb-uhci6", /* 00:1a.2 */
>>> +        .name      = TYPE_ICH9_USB_UHCI(6), /* 00:1a.2 */
>>>         .vendor_id = PCI_VENDOR_ID_INTEL,
>>>         .device_id = PCI_DEVICE_ID_INTEL_82801I_UHCI6,
>>>         .revision  = 0x03,
>>>
>
>
--3866299591-28275790-1593891853=:45095--

