Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A75341FEBD6
	for <lists+xen-devel@lfdr.de>; Thu, 18 Jun 2020 09:01:43 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jloXZ-0003eD-A0; Thu, 18 Jun 2020 07:00:49 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HRl3=77=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1jloXY-0003e8-7U
 for xen-devel@lists.xenproject.org; Thu, 18 Jun 2020 07:00:48 +0000
X-Inumbo-ID: 6f38d2e8-b131-11ea-bb8b-bc764e2007e4
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6f38d2e8-b131-11ea-bb8b-bc764e2007e4;
 Thu, 18 Jun 2020 07:00:47 +0000 (UTC)
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: BaySQT8b1hKl0fkjL+lkUs3P1OxEcaeZTre6McMWNud+f3RNJskv9tlaBBtYkHLwBYG8JAardi
 UpgY8wsfKK0oaioTxdAfPRghFbVArxrGLfLhAZPDlXKyTirGQOz/7Rw9Ydy2V/zVk9q2Q8NJWk
 v0AziURMk/BI6jSr1+NQ4K8Zg8ZQwgcXl+VGSk1i26lNYYpZK7jCX/6gUZb+puhKSjSJbbz2HL
 DjsIXlTZ0LcwACripx81wFY0uaXpBMP/a5vSZaEwUrJ3U16D6ynNSAFSei6dHA+XYuNFVgg0py
 /Wg=
X-SBRS: 2.7
X-MesageID: 20569672
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,525,1583211600"; d="scan'208";a="20569672"
Date: Thu, 18 Jun 2020 09:00:35 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: =?utf-8?Q?Micha=C5=82_Leszczy=C5=84ski?= <michal.leszczynski@cert.pl>
Subject: Re: [PATCH v1 0/7] Implement support for external IPT monitoring
Message-ID: <20200618070035.GD735@Air-de-Roger>
References: <1548605014.8764792.1592320576239.JavaMail.zimbra@cert.pl>
 <1555629278.8787770.1592333278517.JavaMail.zimbra@cert.pl>
 <MWHPR11MB1645D9EFF209C6733C4DC5018C9A0@MWHPR11MB1645.namprd11.prod.outlook.com>
 <DM5PR1101MB22669C0DD0A5AA455681A08D809A0@DM5PR1101MB2266.namprd11.prod.outlook.com>
 <20200617092103.GZ735@Air-de-Roger>
 <DM5PR1101MB22669E5CB0C4384B1005A58E809A0@DM5PR1101MB2266.namprd11.prod.outlook.com>
 <20200617125339.GB735@Air-de-Roger>
 <DM5PR1101MB22662FC744E519062C941A40809A0@DM5PR1101MB2266.namprd11.prod.outlook.com>
 <1683804232.9278740.1592441777496.JavaMail.zimbra@cert.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1683804232.9278740.1592441777496.JavaMail.zimbra@cert.pl>
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
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
Cc: Julien Grall <julien@xen.org>, "Tian, Kevin" <kevin.tian@intel.com>,
 Stefano Stabellini <sstabellini@kernel.org>, "Kang,
 Luwei" <luwei.kang@intel.com>, "Nakajima, Jun" <jun.nakajima@intel.com>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Tamas K Lengyel <tamas.k.lengyel@gmail.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Thu, Jun 18, 2020 at 02:56:17AM +0200, Michał Leszczyński wrote:
> ----- 18 cze 2020 o 1:29, Kang, Luwei luwei.kang@intel.com napisał(a):
> 
> >> > > How does KVM deal with this, do they insert/modify trace packets on
> >> > > trapped and emulated instructions by the VMM?
> >> >
> >> > The KVM includes instruction decoder and
> >> emulator(arch/x86/kvm/emulate.c), and the guest's memory can be set to
> >> write-protect as well. But it doesn't support Intel PT packets software
> >> emulator.
> >> For KVM, the Intel PT feature will be exposed to KVM guest and KVM guest can
> >> use Intel PT feature like native.
> >> 
> >> But if such feature is exposed to the guest for it's own usage, won't it be
> >> missing packets for instructions emulated by the VMM?
> > 
> > If setting the guest's memory write-protect, I think yes.
> 
> 
> Thus, I propose to leave it as it is right now. If somebody is purposely altering the VM state then he/she should consult not only the IPT but also understand what was done "in the meantime" by additional features, e.g. when something was altered by vm_event callback. As Tamas said previously, we usually just want to see certain path leading to vmexit.
> 
> Please also note that there is a PTWRITE instruction that could be used in the future in order to add custom payloads/hints to the PT trace, when needed.

Yes, I think the usage of IPT by a third party against a guest is
fine, as such third party can also use introspection and get the
information about the emulated instructions.

OTOH exposing the feature to the guest itself for it's own usage seems
wrong without adding the packets related to the instructions emulated.

I understand the current series only cares about the first option, so
that's perfectly fine.

Roger.

