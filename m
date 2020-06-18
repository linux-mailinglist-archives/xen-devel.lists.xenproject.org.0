Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 11AFD1FED8E
	for <lists+xen-devel@lfdr.de>; Thu, 18 Jun 2020 10:27:23 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jlprv-0002LS-87; Thu, 18 Jun 2020 08:25:55 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HRl3=77=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1jlpru-0002LN-Ah
 for xen-devel@lists.xenproject.org; Thu, 18 Jun 2020 08:25:54 +0000
X-Inumbo-ID: 529870ba-b13d-11ea-bb8b-bc764e2007e4
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 529870ba-b13d-11ea-bb8b-bc764e2007e4;
 Thu, 18 Jun 2020 08:25:53 +0000 (UTC)
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: aUzc8Ydkiseqfeq4nFLSZUDWWcmloLHuLBYYqBl0Io+PGkCEaQbMmNeBdQRwjcafxXNUqfR/mZ
 ZoJ2rdDztBdhKLIteYIiVvMYpmxHjxmuUgMYo04zGasWtZpiV7+rRVlV74XpEOqw2VPp6/BsL9
 A8RCFf4CipTWeWoIkF0SCJ5QZoa8vPBR1RDuQETD/K8M6rPbY+qxAsVVj1+iFzL4b2gZ/ukF9y
 b79mynIbqnzHHmt9CPVgF2cSSpLLIBjez+wsAxiP2Ti5fZ1kI+Mc+mj+0Fuz16PL3wK2uE/o3q
 kug=
X-SBRS: 2.7
X-MesageID: 20345651
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,526,1583211600"; d="scan'208";a="20345651"
Date: Thu, 18 Jun 2020 10:25:39 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: =?utf-8?Q?Micha=C5=82_Leszczy=C5=84ski?= <michal.leszczynski@cert.pl>
Subject: Re: [PATCH v1 0/7] Implement support for external IPT monitoring
Message-ID: <20200618082539.GE735@Air-de-Roger>
References: <1548605014.8764792.1592320576239.JavaMail.zimbra@cert.pl>
 <cb530abc-bef6-23b9-86d8-f43167e14736@citrix.com>
 <1555629278.8787770.1592333278517.JavaMail.zimbra@cert.pl>
 <d4e37559-bf23-36a4-41d9-a6a8bfc84ac3@citrix.com>
 <CABfawhnhLKEhJFqyH97YFNiHX6vNoLDR4x52gnaNK_5B1VyWOA@mail.gmail.com>
 <6da28899-25ae-7355-fa0a-70fac44f597e@citrix.com>
 <1348695738.9265003.1592425220928.JavaMail.zimbra@cert.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1348695738.9265003.1592425220928.JavaMail.zimbra@cert.pl>
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
Cc: Kevin Tian <kevin.tian@intel.com>, Stefano
 Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Jun
 Nakajima <jun.nakajima@intel.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan
 Beulich <jbeulich@suse.com>, Tamas K Lengyel <tamas.k.lengyel@gmail.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Wed, Jun 17, 2020 at 10:20:20PM +0200, Michał Leszczyński wrote:
> ----- 17 cze 2020 o 18:19, Andrew Cooper andrew.cooper3@citrix.com napisał(a):
> 
> > On 17/06/2020 04:02, Tamas K Lengyel wrote:
> >> On Tue, Jun 16, 2020 at 2:17 PM Andrew Cooper <andrew.cooper3@citrix.com> wrote:
> >>> On 16/06/2020 19:47, Michał Leszczyński wrote:
> >>>> ----- 16 cze 2020 o 20:17, Andrew Cooper andrew.cooper3@citrix.com napisał(a):
> >>>>
> >>>>> Are there any restrictions on EPT being enabled in the first place?  I'm
> >>>>> not aware of any, and in principle we could use this functionality for
> >>>>> PV guests as well (using the CPL filter).  Therefore, I think it would
> >>>>> be helpful to not tie the functionality to HVM guests, even if that is
> >>>>> the only option enabled to start with.
> >>>> I think at the moment it's not required to have EPT. This patch series doesn't
> >>>> use any translation feature flags, so the output address is always a machine
> >>>> physical address, regardless of context. I will check if it could be easily
> >>>> used with PV.
> >>> If its trivial to add PV support then please do.  If its not, then don't
> >>> feel obliged, but please do at least consider how PV support might look
> >>> in the eventual feature.
> >>>
> >>> (Generally speaking, considering "how would I make this work in other
> >>> modes where it is possible" leads to a better design.)
> >>>
> >>>>> The buffer mapping and creation logic is fairly problematic.  Instead of
> >>>>> fighting with another opencoded example, take a look at the IOREQ
> >>>>> server's use of "acquire resource" which is a mapping interface which
> >>>>> supports allocating memory on behalf of the guest, outside of the guest
> >>>>> memory, for use by control tools.
> >>>>>
> 
> 
> One thing that remains unclear to me is the "acquire resource" part. Could you give some more details on that?
> 
> Assuming that buffers are allocated right from the domain creation, what mechanism (instead of xc_map_foreign_range) should I use to map the IPT buffers into Dom0?

Take a look at demu's demu_initialize function [0] (and it's usage of
xenforeignmemory_map_resource), you likely need something similar for
the trace buffers, introducing a new XENMEM_resource_trace_data kind
of resource (naming subject to change), and use the id field in
xen_mem_acquire_resource to signal which vCPU buffer you want to
map.

That's usable by both PV and HVM guests.

Roger.

[0] http://xenbits.xen.org/gitweb/?p=people/pauldu/demu.git;a=blob;f=demu.c;h=f785b394d0cf141dffa05bdddecf338214358aea;hb=refs/heads/master#l453

