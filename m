Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F348421D9C9
	for <lists+xen-devel@lfdr.de>; Mon, 13 Jul 2020 17:08:54 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jv04F-0007rB-6Y; Mon, 13 Jul 2020 15:08:31 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=GBjS=AY=arndb.de=arnd@srs-us1.protection.inumbo.net>)
 id 1jv04E-0007r6-Cm
 for xen-devel@lists.xenproject.org; Mon, 13 Jul 2020 15:08:30 +0000
X-Inumbo-ID: b4d8d04e-c51a-11ea-8496-bc764e2007e4
Received: from mout.kundenserver.de (unknown [212.227.17.13])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b4d8d04e-c51a-11ea-8496-bc764e2007e4;
 Mon, 13 Jul 2020 15:08:28 +0000 (UTC)
Received: from mail-lf1-f49.google.com ([209.85.167.49]) by
 mrelayeu.kundenserver.de (mreue108 [212.227.15.145]) with ESMTPSA (Nemesis)
 id 1Mg6i8-1kVxun2WkA-00hbxs for <xen-devel@lists.xenproject.org>; Mon, 13 Jul
 2020 17:08:27 +0200
Received: by mail-lf1-f49.google.com with SMTP id m26so9270820lfo.13
 for <xen-devel@lists.xenproject.org>; Mon, 13 Jul 2020 08:08:27 -0700 (PDT)
X-Gm-Message-State: AOAM530bBuQ9F/0yVaZQJIjtDI25LVnq8n4YNuGbZjFgSwCTqWw7vf5G
 vp1ANJSyLo8lvPxr+OI/+PE7G0P3N1GeomYHuAo=
X-Google-Smtp-Source: ABdhPJwTQltR//Qoy7CJjbYFWf5SE8su8bBzApvuOmTDy/uiiaL5a6kEWZGPL3gOs+ATNW8dGkRO2Pf0imsPrOKn0vM=
X-Received: by 2002:ac2:51a1:: with SMTP id f1mr53585665lfk.173.1594652906936; 
 Mon, 13 Jul 2020 08:08:26 -0700 (PDT)
MIME-Version: 1.0
References: <20200713122247.10985-1-refactormyself@gmail.com>
In-Reply-To: <20200713122247.10985-1-refactormyself@gmail.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Mon, 13 Jul 2020 17:08:10 +0200
X-Gmail-Original-Message-ID: <CAK8P3a3NWSZw6678k1O2eJ6-c5GuW7484PRvEzU9MEPPrCD-yw@mail.gmail.com>
Message-ID: <CAK8P3a3NWSZw6678k1O2eJ6-c5GuW7484PRvEzU9MEPPrCD-yw@mail.gmail.com>
Subject: Re: [RFC PATCH 00/35] Move all PCIBIOS* definitions into arch/x86
To: "Saheed O. Bolarinwa" <refactormyself@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:XFtXGoka/3tyw1FhbSmnONvaU+vzKLgXjQqTD9l5k8YtAsjujNv
 Pa8T3ZAGZ9La16GpeF5i++nkqzF/44rTyq/p/jK5AiQykuJ3U+hXctfd/SnZunVKYSki2JQ
 Hxeg0FnhVpvdtueHmN6S3RKp7WWC+K5Z9qADkSDwcwWj0LJsP15CD2R8dIwV3xY3CCW76rw
 O7DHMWHP30fvFmJKrfFig==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:rTCVYQ6W/II=:+iAUCRNTn1Fv7kzF7ZV35d
 Lm2gmW7hIihPGowNRuTixmNL5gWx/8kG84dbJGgPBbfGuEeTgBJqdE7Ep8hoU+GHo5nzMsIhe
 GovCT4Vpzuk9o4n1QDg7lHxKmvEVj5bo4Sjva4CBDYFC0cKPgHrlPj5ON1m2W+pGO8I55nVw4
 h/Q0J/jS5RM3Eh87PjzLX8qjRsgoM+T5hVCkRg737Z8scCWGJjF2urvAjaAOuvINV6NFsujKr
 DUMtv3bTfRv2L4qRK2fSSwypbaRGbJrnqY711cUEvGPwq1C9vBQOznwfRiCf9XSNeGHeXINQq
 IOItU2efwRyt/u1l/uRdSNeXEpnxhm0v6K6vN2BO/8eJFZSdHfMB0HAFDBgs2u3Rz7ZFZ2w0c
 B+NDUHrKlRcKjEHqDwF1xN+u2ct6ZMthxQ3jWvsS/RZCC/vOjR+OwWbmG4C7hB5hsBI9kCexx
 AAVsNeFjaYgON0F2zt2xI6PGz49KAB0YH1pjvRa/Nlin9SGoFvnZxlx+UPSHJNaAhm8rQdWfV
 U924BhNUGR++szjgZZ0Z6ZCTuW0b+iVxoAyL4dBD830QoSyoJLYt5HjuC/5eG9aQt1beFiNo3
 VUiy8lPurJ/wIuAhIfV7meuaJNXyny9kJjY61qv1WNdB9PPnEKl64Rggk9aQ7JeqGIsacBwOw
 kCyqAYN6hjMWv+YZVZrI2gQhFAhQLhXwKeP0W1jotwxsHj9NGJ6/QuDPVFKje5uye0mYY/eQ8
 nCtC7k+J2ijlWZ0Y/Jo/zsSKTKCvV2EZWdB3+RFPBe66mbnrI029hF6pLfIJ3IUOH7niiKeDk
 jLZkbFQMvg/H252cEsMDeeFZvoeJNHLAsy1GgN1A99HQmsWeCzjIjf25XbRPtGMwZvkNSAt
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
Cc: Rich Felker <dalias@libc.org>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 Linux-sh list <linux-sh@vger.kernel.org>,
 linux-pci <linux-pci@vger.kernel.org>, linux-nvme@lists.infradead.org,
 Yicong Yang <yangyicong@hisilicon.com>,
 sparclinux <sparclinux@vger.kernel.org>,
 Realtek linux nic maintainers <nic_swsd@realtek.com>,
 Paul Mackerras <paulus@samba.org>, Linux I2C <linux-i2c@vger.kernel.org>,
 bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>,
 Bjorn Helgaas <helgaas@kernel.org>, rfi@lists.rocketboards.org,
 Toan Le <toan@os.amperecomputing.com>, Greg Ungerer <gerg@linux-m68k.org>,
 Marek Vasut <marek.vasut+renesas@gmail.com>, Rob Herring <robh@kernel.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Sagi Grimberg <sagi@grimberg.me>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 linux-scsi <linux-scsi@vger.kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Michael Ellerman <mpe@ellerman.id.au>, linux-atm-general@lists.sourceforge.net,
 Russell King <linux@armlinux.org.uk>, Ley Foon Tan <ley.foon.tan@intel.com>,
 Christoph Hellwig <hch@lst.de>, Geert Uytterhoeven <geert@linux-m68k.org>,
 =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
 Chas Williams <3chas3@gmail.com>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 xen-devel <xen-devel@lists.xenproject.org>, Matt Turner <mattst88@gmail.com>,
 "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
 linux-kernel-mentees@lists.linuxfoundation.org,
 Kevin Hilman <khilman@baylibre.com>, Guenter Roeck <linux@roeck-us.net>,
 linux-hwmon@vger.kernel.org, Jean Delvare <jdelvare@suse.com>,
 Andrew Donnellan <ajd@linux.ibm.com>, Ray Jui <rjui@broadcom.com>,
 "James E.J. Bottomley" <jejb@linux.ibm.com>,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 Yue Wang <yue.wang@amlogic.com>, Jens Axboe <axboe@fb.com>,
 Jakub Kicinski <kuba@kernel.org>, linux-m68k <linux-m68k@lists.linux-m68k.org>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Michael Buesch <m@bues.ch>,
 Shuah Khan <skhan@linuxfoundation.org>, bjorn@helgaas.com,
 "open list:ARM/Amlogic Meson SoC support" <linux-amlogic@lists.infradead.org>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, Guan Xuetao <gxt@pku.edu.cn>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Richard Henderson <rth@twiddle.net>, Juergen Gross <jgross@suse.com>,
 Michal Simek <monstr@monstr.eu>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Scott Branden <sbranden@broadcom.com>, Bjorn Helgaas <bhelgaas@google.com>,
 Jingoo Han <jingoohan1@gmail.com>, Networking <netdev@vger.kernel.org>,
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
 linux-wireless <linux-wireless@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Keith Busch <kbusch@kernel.org>, Brian King <brking@us.ibm.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, alpha <linux-alpha@vger.kernel.org>,
 Frederic Barrat <fbarrat@linux.ibm.com>,
 Gustavo Pimentel <gustavo.pimentel@synopsys.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 "David S. Miller" <davem@davemloft.net>,
 Heiner Kallweit <hkallweit1@gmail.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Mon, Jul 13, 2020 at 3:22 PM Saheed O. Bolarinwa
<refactormyself@gmail.com> wrote:
> This goal of these series is to move the definition of *all* PCIBIOS* from
> include/linux/pci.h to arch/x86 and limit their use within there.
> All other tree specific definition will be left for intact. Maybe they can
> be renamed.
>
> PCIBIOS* is an x86 concept as defined by the PCI spec. The returned error
> codes of PCIBIOS* are positive values and this introduces some complexities
> which other archs need not incur.

I think the intention is good, but I find the series in its current
form very hard
to review, in particular the way you touch some functions three times with
trivial changes. Instead of

1) replace PCIBIOS_SUCCESSFUL with 0
2) drop pointless 0-comparison
3) reformat whitespace

I would suggest to combine the first two steps into one patch per
subsystem and drop the third step.

> PLAN:
>
> 1.   [PATCH v0 1-36] Replace all PCIBIOS_SUCCESSFUL with 0
>
> 2a.  Audit all functions returning PCIBIOS_* error values directly or
>      indirectly and prevent possible bug coming in (2b)
>
> 2b.  Make all functions returning PCIBIOS_* error values call
>      pcibios_err_to_errno(). *This will change their behaviour, for good.*
>
> 3.   Clone a pcibios_err_to_errno() into arch/x86/pci/pcbios.c as _v2.
>      This handles the positive error codes directly and will not use any
>      PCIBIOS* definitions. So calls to it have no outside dependence.
>
> 4.   Make all x86 codes that needs to convert to -E* values call the
>      cloned version - pcibios_err_to_errno_v2()
>
> 5.   Assign PCIBIOS_* errors values directly to generic -E* errors
>
> 6.   Refactor pcibios_err_to_errno() and mark it deprecated
>
> 7.   Replace all calls to pcibios_err_to_errno() with the proper -E* value
>      or 0.
>
> 8.   Remove all PCIBIOS* definitions in include/linux/pci.h and
>      pcibios_err_to_errno() too.
>
> 9.   Redefine all PCIBIOS* definitions with original values inside
>      arch/x86/pci/pcbios.c
>
> 10.  Redefine pcibios_err_to_errno() inside arch/x86/pci/pcbios.c
>
> 11.  Replace pcibios_err_to_errno_v2() calls with pcibios_err_to_errno()
>
> 12.  Remove pcibios_err_to_errno_v2()
>
> Suggested-by: Bjorn Helgaas <bjorn@helgaas.com>
> Suggested-by: Yicong Yang <yangyicong@hisilicon.com>
> Signed-off-by: "Saheed O. Bolarinwa" <refactormyself@gmail.com>

I would hope that there is a simpler procedure to get to good
code than 12 steps that rename the same things multiple times.

Maybe the work can be split up differently, with a similar end result
but fewer and easier reviewed patches. The way I'd look at the
problem, there are three main areas that can be dealt with one at
a time:

a) callers of the high-level config space accessors
   pci_{write,read}_config_{byte,word,dword}, mostly in device
   drivers.
b) low-level implementation of the config space accessors
    through struct pci_ops
c) all other occurrences of these constants

Starting with a), my first question is whether any high-level drivers
even need to care about errors from these functions. I see 4913
callers that ignore the return code, and 576 that actually
check it, and almost none care about the specific error (as you
found as well). Unless we conclude that most PCI drivers are
wrong, could we just change the return type to 'void' and assume
they never fail for valid arguments on a valid pci_device* ?

For b), it might be nice to also change other aspects of the interface,
e.g. passing a pci_host_bridge pointer plus bus number instead of
a pci_bus pointer, or having the callback in the pci_host_bridge
structure.

> Bolarinwa Olayemi Saheed (35):
>   Change PCIBIOS_SUCCESSFUL to 0
>   Change PCIBIOS_SUCCESSFUL to 0
>   Change PCIBIOS_SUCCESSFUL to 0
>   Tidy Success/Failure checks
>   Change PCIBIOS_SUCCESSFUL to 0
>   Tidy Success/Failure checks
>   Change PCIBIOS_SUCCESSFUL to 0

Some patches have identical subject lines including the subsystem
prefix, which you should avoid. Try to also fix the git request-pull
output to not drop that prefix here so the list makes more sense.

        Arnd

