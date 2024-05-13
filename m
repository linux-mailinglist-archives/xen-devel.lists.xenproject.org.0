Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A4A98C4812
	for <lists+xen-devel@lfdr.de>; Mon, 13 May 2024 22:13:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.721067.1124194 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s6c1X-0000bJ-AF; Mon, 13 May 2024 20:11:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 721067.1124194; Mon, 13 May 2024 20:11:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s6c1X-0000Z2-7Y; Mon, 13 May 2024 20:11:51 +0000
Received: by outflank-mailman (input) for mailman id 721067;
 Mon, 13 May 2024 20:11:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=+RwE=MQ=m5p.com=ehem@srs-se1.protection.inumbo.net>)
 id 1s6c1W-0000Yu-8C
 for xen-devel@lists.xenproject.org; Mon, 13 May 2024 20:11:50 +0000
Received: from mailhost.m5p.com (mailhost.m5p.com [74.104.188.4])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 063e1dfd-1165-11ef-909d-e314d9c70b13;
 Mon, 13 May 2024 22:11:48 +0200 (CEST)
Received: from m5p.com (mailhost.m5p.com [IPv6:2001:470:1f07:15ff:0:0:0:f7])
 by mailhost.m5p.com (8.17.1/8.17.1) with ESMTPS id 44DKBXDR030651
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
 Mon, 13 May 2024 16:11:39 -0400 (EDT) (envelope-from ehem@m5p.com)
Received: (from ehem@localhost)
 by m5p.com (8.17.1/8.15.2/Submit) id 44DKBXe5030650;
 Mon, 13 May 2024 13:11:33 -0700 (PDT) (envelope-from ehem)
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
X-Inumbo-ID: 063e1dfd-1165-11ef-909d-e314d9c70b13
Date: Mon, 13 May 2024 13:11:33 -0700
From: Elliott Mitchell <ehem+xen@m5p.com>
To: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Cc: Jan Beulich <jbeulich@suse.com>, xen-devel@lists.xenproject.org,
        Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
        Kelly Choi <kelly.choi@cloud.com>
Subject: Re: Serious AMD-Vi(?) issue
Message-ID: <ZkJz9U2A/mVKnkjA@mattapan.m5p.com>
References: <ZgHwEGCsCLHiYU5J@mattapan.m5p.com>
 <ZgRXHQpamLIdu7dk@mattapan.m5p.com>
 <c2ce4002-58d5-48a3-949c-3c361c78c0ac@suse.com>
 <ZhdNxWNpM0KCzz8E@mattapan.m5p.com>
 <2aa4d1f4-ff37-4f12-bfbb-3ef5ad3f6fdd@suse.com>
 <ZiDBc3ye2wqmBAfq@mattapan.m5p.com>
 <f0bdb386-0870-4468-846c-6c8a91eaf806@suse.com>
 <ZiH0G5kN6m+wlNjn@mattapan.m5p.com>
 <Zj7vkp4r0EY9rxT4@mattapan.m5p.com>
 <ZkHTC4RpUSpKj4wf@macbook>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZkHTC4RpUSpKj4wf@macbook>
X-Spam-Status: No, score=0.0 required=10.0 tests=KHOP_HELO_FCRDNS
	autolearn=unavailable autolearn_force=no version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-14) on mattapan.m5p.com

On Mon, May 13, 2024 at 10:44:59AM +0200, Roger Pau Monné wrote:
> On Fri, May 10, 2024 at 09:09:54PM -0700, Elliott Mitchell wrote:
> > On Thu, Apr 18, 2024 at 09:33:31PM -0700, Elliott Mitchell wrote:
> > > 
> > > I suspect this is a case of there is some step which is missing from
> > > Xen's IOMMU handling.  Perhaps something which Linux does during an early
> > > DMA setup stage, but the current Xen implementation does lazily?
> > > Alternatively some flag setting or missing step?
> > > 
> > > I should be able to do another test approach in a few weeks, but I would
> > > love if something could be found sooner.
> > 
> > Turned out to be disturbingly easy to get the first entry when it
> > happened.  Didn't even need `dbench`, it simply showed once the OS was
> > fully loaded.  I did get some additional data points.
> > 
> > Appears this requires an AMD IOMMUv2.  A test system with known
> > functioning AMD IOMMUv1 didn't display the issue at all.
> > 
> > (XEN) AMD-Vi: IO_PAGE_FAULT: DDDD:bb:dd.f d0 addr fffffffdf8000000 flags 0x8 I
> 
> I would expect the address field to contain more information about the
> fault, but I'm not finding any information on the AMD-Vi specification
> apart from that it contains the DVA, which makes no sense when the
> fault is caused by an interrupt.
> 
> > (XEN) DDDD:bb:dd.f root @ 83b5f5 (3 levels) dfn=fffffffdf8000
> > (XEN)   L3[1f7] = 0 np
> 
> Attempting to print the page table walk for an Interrupt remapping
> fault is useless, we should likely avoid that when the I flag is set.

> > I find it surprising this required "iommu=debug" to get this level of
> > detail.  This amount of output seems more appropriate for "verbose".
> 
> "verbose" should also print this information.

Mostly I've noticed Xen's dmesg seems a bit sparse at default settings.
Confirming IOMMU was recognized and operational had been a challenge.  On
the flip side this does mean less potentially sensitive data gets in.

> > I strongly prefer to provide snippets.  There is a fair bit of output,
> > I'm unsure which portion is most pertinent.
> 
> I've already voiced my concern that I think what yo uare doing is not
> fair.  We are debugging this out of interest, and hence you refusing
> to provide all information just hampers our ability to debug, and
> makes us spend more time than required just thinking what snippets we
> need to ask for.
> 
> I will ask again, what's there in the Xen or the Linux dmesgs that you
> are so worried about leaking? Please provide an specific example.

I cannot point to specific data in Xen's dmesg which is known to be
sensitive.  On the flip side all the addresses could readily function as
a subliminal channel.

Might only be kernels from certain vendors, but hardware serial numbers
frequently make it into Linux's dmesg.  All the data coming from ACPI
tables could readily hide something.  Worse, data which seems harmless
now might later turn out to reveal things.

The usual approach is everyone has PGP keys and logs are kept private
on request.

> Why do you mask the device SBDF in the above snippet?  I would really
> like to understand what's so privacy relevant in a PCI SBDF number.

I doubt it reveals much.  Simply seems unlikely to help debugging and
therefore I prefer to mask it.  One more Xen dmesg line:

(XEN) AMD-Vi: Setup I/O page table: device id = 0xbbdd, type = 0x1, root table = 0xADDRADDR, domain = 0, paging mode = 3

> Does booting with `iommu=no-intremap` lead to any issues being
> reported?

I'll try that next time I restart the system.


Another viable approach.  I imagine one or more of the Xen developers
have computers with AMD processors.  I could send a pair of SATA devices
which are known to exhibit the behavior to someone.

The known reproductions have featured ASUS motherboards.  I doubt this is
a requirement, but if one of the main developers has such a system that
is a better target.  I also note these are plugged into motherboard SATA
ports.  It is possible add-on card SATA ports might not exhibit the
behavior.

Then you may discover not much log data is being provided simply due to
not much log data being generated.


-- 
(\___(\___(\______          --=> 8-) EHM <=--          ______/)___/)___/)
 \BS (    |         ehem+sigmsg@m5p.com  PGP 87145445         |    )   /
  \_CS\   |  _____  -O #include <stddisclaimer.h> O-   _____  |   /  _/
8A19\___\_|_/58D2 7E3D DDF4 7BA6 <-PGP-> 41D1 B375 37D0 8714\_|_/___/5445



