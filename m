Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 52D3C26444D
	for <lists+xen-devel@lfdr.de>; Thu, 10 Sep 2020 12:41:39 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kGK0x-0007e2-VQ; Thu, 10 Sep 2020 10:41:15 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5vjA=CT=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1kGK0w-0007dx-QP
 for xen-devel@lists.xenproject.org; Thu, 10 Sep 2020 10:41:14 +0000
X-Inumbo-ID: 2cf96d59-b5b0-4977-a6de-9434f06320d5
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2cf96d59-b5b0-4977-a6de-9434f06320d5;
 Thu, 10 Sep 2020 10:41:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1599734472;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=XFCyc0EO2YM3C3f9FfCgLYu25PfyLFX9mfIB6yuSYHo=;
 b=ZR2AjoQ4oelai8aQt4ALCkKoGoES8zOqQKym0vtAjVyLDuSIxSmEEVRb
 goKQ/4tW1WDRUeV/a0WOmKmccXj7XzmYdcWJueOuUZbwns7yZplEDvk9s
 ciDwuQc5TRzsNq8Mugr+TRx4ywQSG988k1fiNh+EGBS2yrvdk6u4dywdn E=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: HbPuYwMaEC1+KrcnxajZ57r/mMJNfBR1plUNB/Gv960Fikb2XHL9jL5v3MMgt2h/MLI1e1gIdf
 T9T9uL4GevT6XR48Ru6kcCz5HKiNMl4DDCGmXvH3/TZQ4/uxHqA96pHA6/SP4I0RKFSAERxGOT
 /WuJxoJxY2Q3PVaO4NK1OdC6l2DjoUQBJJ2sDPVjExF6oK3cTTx6/9ABu9Lv7PsAHKoUxotnzL
 sGsl22nOMhXjlVltICa7RRca9b3KiuBoaH41PusQuy6MLEoGz3zsgMllV4ddxctLzDYxlLprSP
 aZs=
X-SBRS: 2.7
X-MesageID: 27358803
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.76,412,1592884800"; d="scan'208";a="27358803"
Date: Thu, 10 Sep 2020 12:41:04 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, Ian Jackson <ian.jackson@eu.citrix.com>,
 Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
CC: xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: libxl - b_info.{acpi,apic} behaves differently than
 b_info.u.hvm.{acpi,apic}
Message-ID: <20200910104104.GW753@Air-de-Roger>
References: <20200910035723.GY1626@mail-itl>
 <20200910085148.GU753@Air-de-Roger>
 <20200910102921.GZ1626@mail-itl>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200910102921.GZ1626@mail-itl>
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 FTLPEX02CL06.citrite.net (10.13.108.179)
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Adding toolstack maintainers.

On Thu, Sep 10, 2020 at 12:29:21PM +0200, Marek Marczykowski-Górecki wrote:
> On Thu, Sep 10, 2020 at 10:51:48AM +0200, Roger Pau Monné wrote:
> > On Thu, Sep 10, 2020 at 05:57:23AM +0200, Marek Marczykowski-Górecki wrote:
> > > Hi,
> > > 
> > > After updating from Xen 4.13 to Xen 4.14 I have troubles starting any
> > > HVM: just after hvmloader saying "Invoking SeaBIOS" I get "(XEN) MMIO
> > > emulation failed (1): d29v0 32bit @ 0008:fffeedf d -> "
> > > 
> > > I come to a situation where seemingly the same domU started via xl
> > > works, while when started via libvirt it crashes. This seems to be
> > > related to xl setting b_info.{acpi,apic}, while libvirt setting
> > > b_info.u.hvm.{acpi,apic}. Modifying libvirt to use the former fixes the
> > > issue.
> > 
> > Could you print the values of the involved fields at the end of
> > libxl__domain_build_info_setdefault in both cases?
> > 
> > I'm not able to spot what changed between 4.13 and 4.14 that could
> > alter the behavior, but knowing the values at that point might make
> > it easier.
> 
> Sure, will do.
> It may be also something else: maybe it acpi/apic settings were broken
> before, but did not results in a domU crash this way.
> FWIW when looking into /var/lib/xen/*-libxl-json I clearly see
> difference between b_info.{acpi,apic} and b_info.u.hvm.{acpi,apic}.

I think libxl__domain_build_info_setdefault should check whether
b_info.u.hvm.{acpi,apic} is set and copy those into b_info.{acpi,apic}
if those are not set?

Toolstack people is more likely to have an opinion here, or to help
debug the issue.

> > > So, handling the old option got broken sometime between 4.13 and 4.14.
> > > Or perhaps it is some other related side effect.
> > 
> > Libvirt master tests seem to have been failing for some time (60 days)
> > in the build phase [0], maybe you are using a newer version of libvirt
> > than what osstest is currently testing? (Xen flights are currently
> > stuck at libvirt commit 2c846fa6bcc11929c9fb857a22430fb9945654ad).
> 
> I use libvirt 6.6.0, so even older one, and in fact updated it from
> 6.4.0 together with Xen 4.14. But I don't see relevant change between
> those two versions.
> 
> BTW The libvirt build may require more attention, they've changed build
> system... Now it is built with meson/ninja (haven't figured it out yet).

If you can figure out and send a patch to fix oostest that would be
great!

Thanks, Roger.

