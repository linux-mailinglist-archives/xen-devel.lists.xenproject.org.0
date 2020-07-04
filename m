Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A2C02147AE
	for <lists+xen-devel@lfdr.de>; Sat,  4 Jul 2020 19:20:12 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jrlpU-0002Mp-5i; Sat, 04 Jul 2020 17:19:56 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jWGQ=AP=eik.bme.hu=balaton@srs-us1.protection.inumbo.net>)
 id 1jrlpT-0002Mk-CZ
 for xen-devel@lists.xenproject.org; Sat, 04 Jul 2020 17:19:55 +0000
X-Inumbo-ID: 937dab56-be1a-11ea-bb8b-bc764e2007e4
Received: from zero.eik.bme.hu (unknown [2001:738:2001:2001::2001])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 937dab56-be1a-11ea-bb8b-bc764e2007e4;
 Sat, 04 Jul 2020 17:19:54 +0000 (UTC)
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id B1BEA74632C;
 Sat,  4 Jul 2020 19:19:53 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 8799B745702; Sat,  4 Jul 2020 19:19:53 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 84B7A7456F8;
 Sat,  4 Jul 2020 19:19:53 +0200 (CEST)
Date: Sat, 4 Jul 2020 19:19:53 +0200 (CEST)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: =?ISO-8859-15?Q?Philippe_Mathieu-Daud=E9?= <f4bug@amsat.org>
Subject: Re: [PATCH 25/26] hw/usb/usb-hcd: Use XHCI type definitions
In-Reply-To: <20200704144943.18292-26-f4bug@amsat.org>
Message-ID: <alpine.BSF.2.22.395.2007041918320.92265@zero.eik.bme.hu>
References: <20200704144943.18292-1-f4bug@amsat.org>
 <20200704144943.18292-26-f4bug@amsat.org>
User-Agent: Alpine 2.22 (BSF 395 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="3866299591-100065408-1593883193=:92265"
X-Spam-Checker-Version: Sophos PMX: 6.4.8.2820816,
 Antispam-Engine: 2.7.2.2107409, Antispam-Data: 2020.7.4.171217,
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

--3866299591-100065408-1593883193=:92265
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8BIT

On Sat, 4 Jul 2020, Philippe Mathieu-Daudé wrote:
> Various machine/board/soc models create XHCI device instances
> with the generic QDEV API, and don't need to access USB internals.
>
> Simplify header inclusions by moving the QOM type names into a
> simple header, with no need to include other "hw/usb" headers.
>
> Suggested-by: BALATON Zoltan <balaton@eik.bme.hu>
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
> hw/usb/hcd-xhci.h        | 2 +-
> include/hw/usb/usb-hcd.h | 3 +++
> hw/ppc/spapr.c           | 2 +-
> 3 files changed, 5 insertions(+), 2 deletions(-)
>
> diff --git a/hw/usb/hcd-xhci.h b/hw/usb/hcd-xhci.h
> index f9a3aaceec..b6c54e38a6 100644
> --- a/hw/usb/hcd-xhci.h
> +++ b/hw/usb/hcd-xhci.h
> @@ -23,9 +23,9 @@
> #define HW_USB_HCD_XHCI_H
>
> #include "usb-internal.h"
> +#include "hw/usb/usb-hcd.h"
>
> #define TYPE_XHCI "base-xhci"
> -#define TYPE_NEC_XHCI "nec-usb-xhci"
> #define TYPE_QEMU_XHCI "qemu-xhci"

Why is qemu-xhci left here? Should that be moved to public header too? 
(Maybe no machine adds it but that's a public type too I think.)

Regards.
BALATON Zoltan

> #define XHCI(obj) \
> diff --git a/include/hw/usb/usb-hcd.h b/include/hw/usb/usb-hcd.h
> index c9d0a88984..56107fca62 100644
> --- a/include/hw/usb/usb-hcd.h
> +++ b/include/hw/usb/usb-hcd.h
> @@ -30,4 +30,7 @@
> #define TYPE_VT82C686B_USB_UHCI     "vt82c686b-usb-uhci"
> #define TYPE_ICH9_USB_UHCI(n)       "ich9-usb-uhci" #n
>
> +/* XHCI */
> +#define TYPE_NEC_XHCI "nec-usb-xhci"
> +
> #endif
> diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
> index db1706a66c..d8b3978f24 100644
> --- a/hw/ppc/spapr.c
> +++ b/hw/ppc/spapr.c
> @@ -2961,7 +2961,7 @@ static void spapr_machine_init(MachineState *machine)
>         if (smc->use_ohci_by_default) {
>             pci_create_simple(phb->bus, -1, TYPE_PCI_OHCI);
>         } else {
> -            pci_create_simple(phb->bus, -1, "nec-usb-xhci");
> +            pci_create_simple(phb->bus, -1, TYPE_NEC_XHCI);
>         }
>
>         if (spapr->has_graphics) {
>
--3866299591-100065408-1593883193=:92265--

