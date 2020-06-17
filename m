Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F9DF1FC9B9
	for <lists+xen-devel@lfdr.de>; Wed, 17 Jun 2020 11:21:51 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jlUFu-0007ZU-0q; Wed, 17 Jun 2020 09:21:14 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jIsh=76=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1jlUFs-0007ZP-CN
 for xen-devel@lists.xenproject.org; Wed, 17 Jun 2020 09:21:12 +0000
X-Inumbo-ID: e216d2da-b07b-11ea-bca7-bc764e2007e4
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e216d2da-b07b-11ea-bca7-bc764e2007e4;
 Wed, 17 Jun 2020 09:21:11 +0000 (UTC)
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: QTHvT4+wjw8k8S/o0nb4H+k3beeiN6CrswUQWjCGDmVPBmFDnKn4RziYsXwS3M8fLhka54ezPT
 T1He5jaDeLIgC2LEGIXyzZ9EVunhgEsJl+5G9rNoopBNTmpIR7id4VeQwQ9BNEKBmldTjgHHKd
 EyRcYg36xtr2pX09FptE9LM85AmkqRyHUT1z4QxCn1kclSFlhzL2Pnl/Pq2Wdea61xbYdJ8nHT
 iiARxx0MYapjnShPoQVjI+pRMXvRc005ejVqzm390KJkp5k9+2FQwl2HGFyqMADj3DY0Um9+rA
 N4Q=
X-SBRS: 2.7
X-MesageID: 20264108
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,522,1583211600"; d="scan'208";a="20264108"
Date: Wed, 17 Jun 2020 11:21:03 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: "Kang, Luwei" <luwei.kang@intel.com>
Subject: Re: [PATCH v1 0/7] Implement support for external IPT monitoring
Message-ID: <20200617092103.GZ735@Air-de-Roger>
References: <1548605014.8764792.1592320576239.JavaMail.zimbra@cert.pl>
 <cb530abc-bef6-23b9-86d8-f43167e14736@citrix.com>
 <1555629278.8787770.1592333278517.JavaMail.zimbra@cert.pl>
 <MWHPR11MB1645D9EFF209C6733C4DC5018C9A0@MWHPR11MB1645.namprd11.prod.outlook.com>
 <DM5PR1101MB22669C0DD0A5AA455681A08D809A0@DM5PR1101MB2266.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <DM5PR1101MB22669C0DD0A5AA455681A08D809A0@DM5PR1101MB2266.namprd11.prod.outlook.com>
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
Cc: "Tian, Kevin" <kevin.tian@intel.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien
 Grall <julien@xen.org>, "Nakajima, Jun" <jun.nakajima@intel.com>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?utf-8?Q?Micha=C5=82_Leszczy=C5=84ski?= <michal.leszczynski@cert.pl>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Wed, Jun 17, 2020 at 06:45:22AM +0000, Kang, Luwei wrote:
> > -----Original Message-----
> > From: Tian, Kevin <kevin.tian@intel.com>
> > Sent: Wednesday, June 17, 2020 9:35 AM
> > To: Michał Leszczyński <michal.leszczynski@cert.pl>; Andrew Cooper
> > <andrew.cooper3@citrix.com>
> > Cc: Xen-devel <xen-devel@lists.xenproject.org>; Jan Beulich
> > <jbeulich@suse.com>; Wei Liu <wl@xen.org>; Roger Pau Monné
> > <roger.pau@citrix.com>; Nakajima, Jun <jun.nakajima@intel.com>; George
> > Dunlap <george.dunlap@citrix.com>; Ian Jackson <ian.jackson@eu.citrix.com>;
> > Julien Grall <julien@xen.org>; Stefano Stabellini <sstabellini@kernel.org>;
> > Kang, Luwei <luwei.kang@intel.com>
> > Subject: RE: [PATCH v1 0/7] Implement support for external IPT monitoring
> > 
> > +Luwei, who developed PT for KVM and is the best one who can help
> > review VMX changes from Intel side. Please include him in future post or
> > discussion.
> > 
> > > -----Original Message-----
> > > From: Michał Leszczyński <michal.leszczynski@cert.pl>
> > > Sent: Wednesday, June 17, 2020 2:48 AM
> > > To: Andrew Cooper <andrew.cooper3@citrix.com>
> > > Cc: Xen-devel <xen-devel@lists.xenproject.org>; Jan Beulich
> > > <jbeulich@suse.com>; Wei Liu <wl@xen.org>; Roger Pau Monné
> > > <roger.pau@citrix.com>; Nakajima, Jun <jun.nakajima@intel.com>; Tian,
> > > Kevin <kevin.tian@intel.com>; George Dunlap
> > > <george.dunlap@citrix.com>; Ian Jackson <ian.jackson@eu.citrix.com>;
> > > Julien Grall <julien@xen.org>; Stefano Stabellini
> > > <sstabellini@kernel.org>
> > > Subject: Re: [PATCH v1 0/7] Implement support for external IPT
> > > monitoring
> > >
> > > ----- 16 cze 2020 o 20:17, Andrew Cooper andrew.cooper3@citrix.com
> > > napisał(a):
> > >
> > > > On 16/06/2020 16:16, Michał Leszczyński wrote:
> > > > When this subject was broached on xen-devel before, one issue was
> > > > the fact that all actions which are intercepted don't end up writing
> > > > any appropriate packets.  This is perhaps less of an issue for this
> > > > example, where the external agent can see VMExits in the trace, but
> > > > it still results in missing information.  (It is a major problem for
> > > > PT within the guest, and needs Xen's intercept/emulation framework
> > > > being updated to be PT-aware so it can fill in the same packets
> > > > which hardware would have done for equivalent actions.)
> > >
> > > Ok, this sounds like a hard issue. Could you point out what could be
> > > the particular problematic cases? For instance, if something would
> > > alter EIP/RIP or CR3 then I belive it would still be recorded in PT
> > > trace (i.e. these values will be logged on VM entry).
> 
> e.g. If a VM exit is taken on a guest write to CR3 (including “MOV CR3” as well as task switches), the PIP packet
> normally generated on the CR3 write will be missing. The PIP packet needs to be written to the PT buffer by software. Another example is VM-exit taken on RDTSC. 
> 
> For VM introspection, all the Intel PT packets may need to emulated by software. Some description in SDM as below:
> If a VMM emulates an element of processor state by taking a VM exit on reads and/or writes to that piece of state, and the state element impacts Intel PT packet generation or values, it may be incumbent upon the VMM to insert or modify the output trace data.

I got the impression that IPT was mostly useful together with
introspection, as you can then get events from trapped instructions
(and likely emulated) from the introspection interface, while being
able to get the processor trace for non-trapped events.

I'm not sure whether there would be corner cases with trapped
instructions not being handled by the introspection framework.

How does KVM deal with this, do they insert/modify trace packets on
trapped and emulated instructions by the VMM?

Roger.

