Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F4C12147A7
	for <lists+xen-devel@lfdr.de>; Sat,  4 Jul 2020 19:16:03 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jrllb-00025E-9R; Sat, 04 Jul 2020 17:15:55 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jWGQ=AP=eik.bme.hu=balaton@srs-us1.protection.inumbo.net>)
 id 1jrllZ-000256-K3
 for xen-devel@lists.xenproject.org; Sat, 04 Jul 2020 17:15:53 +0000
X-Inumbo-ID: 01961bec-be1a-11ea-bca7-bc764e2007e4
Received: from zero.eik.bme.hu (unknown [152.66.115.2])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 01961bec-be1a-11ea-bca7-bc764e2007e4;
 Sat, 04 Jul 2020 17:15:50 +0000 (UTC)
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 035FC74632B;
 Sat,  4 Jul 2020 19:15:49 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id BA3BB745702; Sat,  4 Jul 2020 19:15:48 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id B74BF7456F8;
 Sat,  4 Jul 2020 19:15:48 +0200 (CEST)
Date: Sat, 4 Jul 2020 19:15:48 +0200 (CEST)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: =?ISO-8859-15?Q?Philippe_Mathieu-Daud=E9?= <f4bug@amsat.org>
Subject: Re: [PATCH 23/26] hw/usb/usb-hcd: Use EHCI type definitions
In-Reply-To: <20200704144943.18292-24-f4bug@amsat.org>
Message-ID: <alpine.BSF.2.22.395.2007041914490.92265@zero.eik.bme.hu>
References: <20200704144943.18292-1-f4bug@amsat.org>
 <20200704144943.18292-24-f4bug@amsat.org>
User-Agent: Alpine 2.22 (BSF 395 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="3866299591-1739992078-1593882948=:92265"
X-Spam-Checker-Version: Sophos PMX: 6.4.8.2820816,
 Antispam-Engine: 2.7.2.2107409, Antispam-Data: 2020.7.4.170918,
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
 "Michael S. Tsirkin" <mst@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Huacai Chen <chenhc@lemote.com>, Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org, Yoshinori Sato <ysato@users.sourceforge.jp>,
 Paul Durrant <paul@xen.org>, Magnus Damm <magnus.damm@gmail.com>,
 Markus Armbruster <armbru@redhat.com>,
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
 Niek Linnenbank <nieklinnenbank@gmail.com>, qemu-arm@nongnu.org,
 =?ISO-8859-15?Q?Marc-Andr=E9_Lureau?= <marcandre.lureau@redhat.com>,
 Richard Henderson <rth@twiddle.net>,
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

--3866299591-1739992078-1593882948=:92265
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8BIT

On Sat, 4 Jul 2020, Philippe Mathieu-Daudé wrote:
> Various machine/board/soc models create EHCI device instances
> with the generic QDEV API, and don't need to access USB internals.
>
> Simplify header inclusions by moving the QOM type names into a
> simple header, with no need to include other "hw/usb" headers.
>
> Suggested-by: BALATON Zoltan <balaton@eik.bme.hu>
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
> hw/usb/hcd-ehci.h         | 11 +----------
> include/hw/usb/chipidea.h |  2 +-
> include/hw/usb/usb-hcd.h  | 11 +++++++++++
> hw/arm/allwinner-h3.c     |  1 -
> hw/arm/exynos4210.c       |  2 +-
> hw/arm/sbsa-ref.c         |  3 ++-
> hw/arm/xilinx_zynq.c      |  2 +-
> hw/ppc/sam460ex.c         |  1 -
> hw/usb/chipidea.c         |  1 +
> hw/usb/hcd-ehci-sysbus.c  |  1 +
> 10 files changed, 19 insertions(+), 16 deletions(-)
>
> diff --git a/hw/usb/hcd-ehci.h b/hw/usb/hcd-ehci.h
> index 337b3ad05c..da70767409 100644
> --- a/hw/usb/hcd-ehci.h
> +++ b/hw/usb/hcd-ehci.h
> @@ -23,6 +23,7 @@
> #include "hw/pci/pci.h"
> #include "hw/sysbus.h"
> #include "usb-internal.h"
> +#include "hw/usb/usb-hcd.h"
>
> #define CAPA_SIZE        0x10
>
> @@ -316,7 +317,6 @@ void usb_ehci_realize(EHCIState *s, DeviceState *dev, Error **errp);
> void usb_ehci_unrealize(EHCIState *s, DeviceState *dev);
> void ehci_reset(void *opaque);
>
> -#define TYPE_PCI_EHCI "pci-ehci-usb"
> #define PCI_EHCI(obj) OBJECT_CHECK(EHCIPCIState, (obj), TYPE_PCI_EHCI)
>
> typedef struct EHCIPCIState {
> @@ -327,15 +327,6 @@ typedef struct EHCIPCIState {
>     EHCIState ehci;
> } EHCIPCIState;
>
> -
> -#define TYPE_SYS_BUS_EHCI "sysbus-ehci-usb"
> -#define TYPE_PLATFORM_EHCI "platform-ehci-usb"
> -#define TYPE_EXYNOS4210_EHCI "exynos4210-ehci-usb"
> -#define TYPE_AW_H3_EHCI "aw-h3-ehci-usb"
> -#define TYPE_TEGRA2_EHCI "tegra2-ehci-usb"
> -#define TYPE_PPC4xx_EHCI "ppc4xx-ehci-usb"
> -#define TYPE_FUSBH200_EHCI "fusbh200-ehci-usb"
> -
> #define SYS_BUS_EHCI(obj) \
>     OBJECT_CHECK(EHCISysBusState, (obj), TYPE_SYS_BUS_EHCI)
> #define SYS_BUS_EHCI_CLASS(class) \
> diff --git a/include/hw/usb/chipidea.h b/include/hw/usb/chipidea.h
> index 1ec2e9dbda..28f46291de 100644
> --- a/include/hw/usb/chipidea.h
> +++ b/include/hw/usb/chipidea.h
> @@ -2,6 +2,7 @@
> #define CHIPIDEA_H
>
> #include "hw/usb/hcd-ehci.h"
> +#include "hw/usb/usb-hcd.h"
>
> typedef struct ChipideaState {
>     /*< private >*/
> @@ -10,7 +11,6 @@ typedef struct ChipideaState {
>     MemoryRegion iomem[3];
> } ChipideaState;
>
> -#define TYPE_CHIPIDEA "usb-chipidea"
> #define CHIPIDEA(obj) OBJECT_CHECK(ChipideaState, (obj), TYPE_CHIPIDEA)
>
> #endif /* CHIPIDEA_H */
> diff --git a/include/hw/usb/usb-hcd.h b/include/hw/usb/usb-hcd.h
> index 21fdfaf22d..74af3a4533 100644
> --- a/include/hw/usb/usb-hcd.h
> +++ b/include/hw/usb/usb-hcd.h
> @@ -13,4 +13,15 @@
> #define TYPE_SYSBUS_OHCI            "sysbus-ohci"
> #define TYPE_PCI_OHCI               "pci-ohci"
>
> +/* EHCI */
> +#define TYPE_SYS_BUS_EHCI           "sysbus-ehci-usb"
> +#define TYPE_PCI_EHCI               "pci-ehci-usb"
> +#define TYPE_PLATFORM_EHCI          "platform-ehci-usb"
> +#define TYPE_EXYNOS4210_EHCI        "exynos4210-ehci-usb"
> +#define TYPE_AW_H3_EHCI             "aw-h3-ehci-usb"
> +#define TYPE_TEGRA2_EHCI            "tegra2-ehci-usb"
> +#define TYPE_PPC4xx_EHCI            "ppc4xx-ehci-usb"
> +#define TYPE_FUSBH200_EHCI          "fusbh200-ehci-usb"
> +#define TYPE_CHIPIDEA               "usb-chipidea"
> +
> #endif
> diff --git a/hw/arm/allwinner-h3.c b/hw/arm/allwinner-h3.c
> index d1d90ffa79..8b7adddc27 100644
> --- a/hw/arm/allwinner-h3.c
> +++ b/hw/arm/allwinner-h3.c
> @@ -29,7 +29,6 @@
> #include "hw/char/serial.h"
> #include "hw/misc/unimp.h"
> #include "hw/usb/usb-hcd.h"
> -#include "hw/usb/hcd-ehci.h"
> #include "hw/loader.h"
> #include "sysemu/sysemu.h"
> #include "hw/arm/allwinner-h3.h"
> diff --git a/hw/arm/exynos4210.c b/hw/arm/exynos4210.c
> index fa639806ec..692fb02159 100644
> --- a/hw/arm/exynos4210.c
> +++ b/hw/arm/exynos4210.c
> @@ -35,7 +35,7 @@
> #include "hw/qdev-properties.h"
> #include "hw/arm/exynos4210.h"
> #include "hw/sd/sdhci.h"
> -#include "hw/usb/hcd-ehci.h"
> +#include "hw/usb/usb-hcd.h"
>
> #define EXYNOS4210_CHIPID_ADDR         0x10000000
>
> diff --git a/hw/arm/sbsa-ref.c b/hw/arm/sbsa-ref.c
> index 021e7c1b8b..4e4c338ae9 100644
> --- a/hw/arm/sbsa-ref.c
> +++ b/hw/arm/sbsa-ref.c
> @@ -38,6 +38,7 @@
> #include "hw/loader.h"
> #include "hw/pci-host/gpex.h"
> #include "hw/qdev-properties.h"
> +#include "hw/usb/usb-hcd.h"
> #include "hw/char/pl011.h"
> #include "net/net.h"
>
> @@ -485,7 +486,7 @@ static void create_ehci(const SBSAMachineState *sms)
>     hwaddr base = sbsa_ref_memmap[SBSA_EHCI].base;
>     int irq = sbsa_ref_irqmap[SBSA_EHCI];
>
> -    sysbus_create_simple("platform-ehci-usb", base,
> +    sysbus_create_simple(TYPE_PLATFORM_EHCI, base,
>                          qdev_get_gpio_in(sms->gic, irq));
> }
>
> diff --git a/hw/arm/xilinx_zynq.c b/hw/arm/xilinx_zynq.c
> index ed970273f3..9ccdc03095 100644
> --- a/hw/arm/xilinx_zynq.c
> +++ b/hw/arm/xilinx_zynq.c
> @@ -29,7 +29,7 @@
> #include "hw/loader.h"
> #include "hw/misc/zynq-xadc.h"
> #include "hw/ssi/ssi.h"
> -#include "hw/usb/chipidea.h"
> +#include "hw/usb/usb-hcd.h"
> #include "qemu/error-report.h"
> #include "hw/sd/sdhci.h"
> #include "hw/char/cadence_uart.h"
> diff --git a/hw/ppc/sam460ex.c b/hw/ppc/sam460ex.c
> index ac60d17a86..3f7cf0d1ae 100644
> --- a/hw/ppc/sam460ex.c
> +++ b/hw/ppc/sam460ex.c
> @@ -37,7 +37,6 @@
> #include "hw/i2c/smbus_eeprom.h"
> #include "hw/usb/usb.h"
> #include "hw/usb/usb-hcd.h"
> -#include "hw/usb/hcd-ehci.h"
> #include "hw/ppc/fdt.h"
> #include "hw/qdev-properties.h"
> #include "hw/pci/pci.h"
> diff --git a/hw/usb/chipidea.c b/hw/usb/chipidea.c
> index 3dcd22ccba..e81f63295e 100644
> --- a/hw/usb/chipidea.c
> +++ b/hw/usb/chipidea.c
> @@ -11,6 +11,7 @@
>
> #include "qemu/osdep.h"
> #include "hw/usb/hcd-ehci.h"
> +#include "hw/usb/usb-hcd.h"
> #include "hw/usb/chipidea.h"
> #include "qemu/log.h"
> #include "qemu/module.h"
> diff --git a/hw/usb/hcd-ehci-sysbus.c b/hw/usb/hcd-ehci-sysbus.c
> index 3730736540..b7debc1934 100644
> --- a/hw/usb/hcd-ehci-sysbus.c
> +++ b/hw/usb/hcd-ehci-sysbus.c
> @@ -18,6 +18,7 @@
> #include "qemu/osdep.h"
> #include "hw/qdev-properties.h"
> #include "hw/usb/hcd-ehci.h"
> +#include "hw/usb/usb-hcd.h"
> #include "migration/vmstate.h"
> #include "qemu/module.h"

Do these last two still need hw/usb/hcd-ehci.h? If so do they get 
hw/usb/usb-hcd.h via that one so do they need to explicitely include it 
again?

Regards,
BALATON Zoltan
--3866299591-1739992078-1593882948=:92265--

