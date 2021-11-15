Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5018E451699
	for <lists+xen-devel@lfdr.de>; Mon, 15 Nov 2021 22:32:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.226025.390466 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mmjYr-0005Vi-UN; Mon, 15 Nov 2021 21:30:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 226025.390466; Mon, 15 Nov 2021 21:30:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mmjYr-0005TO-RP; Mon, 15 Nov 2021 21:30:45 +0000
Received: by outflank-mailman (input) for mailman id 226025;
 Mon, 15 Nov 2021 21:30:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=hqW4=QC=m5p.com=ehem@srs-se1.protection.inumbo.net>)
 id 1mmjYq-0005TI-HX
 for xen-devel@lists.xenproject.org; Mon, 15 Nov 2021 21:30:44 +0000
Received: from mailhost.m5p.com (mailhost.m5p.com [74.104.188.4])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 479be685-465b-11ec-a9d2-d9f7a1cc8784;
 Mon, 15 Nov 2021 22:30:41 +0100 (CET)
Received: from m5p.com (mailhost.m5p.com [IPv6:2001:470:1f07:15ff:0:0:0:f7])
 by mailhost.m5p.com (8.16.1/8.15.2) with ESMTPS id 1AFLUPjt005882
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
 Mon, 15 Nov 2021 16:30:31 -0500 (EST) (envelope-from ehem@m5p.com)
Received: (from ehem@localhost)
 by m5p.com (8.16.1/8.15.2/Submit) id 1AFLUPGj005881;
 Mon, 15 Nov 2021 13:30:25 -0800 (PST) (envelope-from ehem)
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
X-Inumbo-ID: 479be685-465b-11ec-a9d2-d9f7a1cc8784
Date: Mon, 15 Nov 2021 13:30:25 -0800
From: Elliott Mitchell <ehem+xen@m5p.com>
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
Cc: Julien Grall <julien.grall.oss@gmail.com>, Henry Wang <Henry.Wang@arm.com>,
        Stefano Stabellini <sstabellini@kernel.org>,
        "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: ACPI/UEFI support for Xen/ARM status?
Message-ID: <YZLRcaynroUgDKgW@mattapan.m5p.com>
References: <YY6L5JQPn0s3c6Jp@mattapan.m5p.com>
 <1d3561ef-548a-ea13-d362-0f95d7dba33b@xen.org>
 <YY6bsu8/y/LeMfg3@mattapan.m5p.com>
 <40474f12-e269-f251-99b1-cb5b0a317bb2@xen.org>
 <YY7ZVPQSTapB7Jnj@mattapan.m5p.com>
 <CAJ=z9a0EooNfXyrNB82_4yT9qnz5fxEJtVN6oUbVyCzjU4hEKA@mail.gmail.com>
 <YY7rfIWPC1PwidMA@mattapan.m5p.com>
 <CAJ=z9a1=V+MKD0a9aTCBvy-1nxKj4TC7ZOg82oBYn1vmfsu23g@mail.gmail.com>
 <YY8O4GOfYg4Bz2CW@mattapan.m5p.com>
 <E6611A60-F092-4D47-8756-7A6A33840B5F@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <E6611A60-F092-4D47-8756-7A6A33840B5F@arm.com>
X-Spam-Status: No, score=0.4 required=10.0 tests=KHOP_HELO_FCRDNS autolearn=no
	autolearn_force=no version=3.4.5
X-Spam-Checker-Version: SpamAssassin 3.4.5 (2021-03-20) on mattapan.m5p.com

On Mon, Nov 15, 2021 at 10:06:20AM +0000, Bertrand Marquis wrote:
> 
> > On 13 Nov 2021, at 01:03, Elliott Mitchell <ehem+xen@m5p.com> wrote:
> > 
> > On Fri, Nov 12, 2021 at 11:00:54PM +0000, Julien Grall wrote:
> >> On Fri, 12 Nov 2021 at 22:32, Elliott Mitchell <ehem+xen@m5p.com> wrote:
> >>>> My preference is to introduce a per-platform quirk (I believe Stefano was happy
> >>>> with this). The advantage is we could get ACPI support for your board hopefully
> >>>> merged quicker.
> >>> 
> >>> This could be workable as a temporary workaround.  Longer term I suspect
> >>> it might well be rather better to *fully* tackle the issue *now*.
> >>> Otherwise this seems likely to turn into a database of board-specific
> >>> hacks for hundreds or thousands of devices.
> >> 
> >> As usual, you have to find a balance between cost vs benefits.
> >> 
> >> If you look at the Device-Tree side, we don' t have many platforms
> >> requiring quirks.
> >> In particular, the DMA is so far strictly limited to a single platform (RPI).
> >> So I would be surprised if we suddenly require tons of quirks when using
> >> ACPI.
> > 
> > Presently the DMA quirk would be the only consumer, but there will likely
> > be other consumers later.  Might there be few device-tree quirks due to a
> > short list of platforms?  Might full ACPI support vastly increase
> > Xen/ARM's target audience?  (partially ACPI so complex to support so many
> > varied devices)
> 
> We have been looking at the possibility to have ACPI support in Xen.
> The main problem with that is the cost in lines of code in Xen which would be high
> and as a consequence the maintenance cost would be high.
> So if anything is done it must stay properly limited using ifdefs to make sure people
> needing a ???small??? xen can still have one.
> 
> Now I am on the same side as Julien, I would be very happy to help reviewing if you
> decide to do the work :-)

I'm getting the impression everyone knows Xen/ARM urgently needs full
ACPI/UEFI support, just everyone has figured out adequate short-term
workarounds.  As such everyone keeps making small investments into
keeping their short-term workarounds in place, hoping someone else will
fall on the ACPI/UEFI grenade and save everyone.

This sounds suspiciously like the classic Tragedy of the Commons
situation.


-- 
(\___(\___(\______          --=> 8-) EHM <=--          ______/)___/)___/)
 \BS (    |         ehem+sigmsg@m5p.com  PGP 87145445         |    )   /
  \_CS\   |  _____  -O #include <stddisclaimer.h> O-   _____  |   /  _/
8A19\___\_|_/58D2 7E3D DDF4 7BA6 <-PGP-> 41D1 B375 37D0 8714\_|_/___/5445



