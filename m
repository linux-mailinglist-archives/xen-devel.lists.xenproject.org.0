Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 445E644F05D
	for <lists+xen-devel@lfdr.de>; Sat, 13 Nov 2021 02:04:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.225481.389379 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mlhSP-0007CH-M8; Sat, 13 Nov 2021 01:03:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 225481.389379; Sat, 13 Nov 2021 01:03:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mlhSP-00079t-Iu; Sat, 13 Nov 2021 01:03:49 +0000
Received: by outflank-mailman (input) for mailman id 225481;
 Sat, 13 Nov 2021 01:03:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=22NN=QA=m5p.com=ehem@srs-se1.protection.inumbo.net>)
 id 1mlhSO-00079n-8r
 for xen-devel@lists.xenproject.org; Sat, 13 Nov 2021 01:03:48 +0000
Received: from mailhost.m5p.com (mailhost.m5p.com [74.104.188.4])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8cdc306f-441d-11ec-9787-a32c541c8605;
 Sat, 13 Nov 2021 02:03:46 +0100 (CET)
Received: from m5p.com (mailhost.m5p.com [IPv6:2001:470:1f07:15ff:0:0:0:f7])
 by mailhost.m5p.com (8.16.1/8.15.2) with ESMTPS id 1AD13Uar089364
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
 Fri, 12 Nov 2021 20:03:35 -0500 (EST) (envelope-from ehem@m5p.com)
Received: (from ehem@localhost)
 by m5p.com (8.16.1/8.15.2/Submit) id 1AD13Sl4089363;
 Fri, 12 Nov 2021 17:03:28 -0800 (PST) (envelope-from ehem)
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
X-Inumbo-ID: 8cdc306f-441d-11ec-9787-a32c541c8605
Date: Fri, 12 Nov 2021 17:03:28 -0800
From: Elliott Mitchell <ehem+xen@m5p.com>
To: Julien Grall <julien.grall.oss@gmail.com>
Cc: Henry Wang <Henry.Wang@arm.com>,
        Stefano Stabellini <sstabellini@kernel.org>,
        "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: ACPI/UEFI support for Xen/ARM status?
Message-ID: <YY8O4GOfYg4Bz2CW@mattapan.m5p.com>
References: <YY3tSAFTCR4r2FaI@mattapan.m5p.com>
 <AM9PR08MB62428F41C4F998AD676C027C92959@AM9PR08MB6242.eurprd08.prod.outlook.com>
 <YY6L5JQPn0s3c6Jp@mattapan.m5p.com>
 <1d3561ef-548a-ea13-d362-0f95d7dba33b@xen.org>
 <YY6bsu8/y/LeMfg3@mattapan.m5p.com>
 <40474f12-e269-f251-99b1-cb5b0a317bb2@xen.org>
 <YY7ZVPQSTapB7Jnj@mattapan.m5p.com>
 <CAJ=z9a0EooNfXyrNB82_4yT9qnz5fxEJtVN6oUbVyCzjU4hEKA@mail.gmail.com>
 <YY7rfIWPC1PwidMA@mattapan.m5p.com>
 <CAJ=z9a1=V+MKD0a9aTCBvy-1nxKj4TC7ZOg82oBYn1vmfsu23g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAJ=z9a1=V+MKD0a9aTCBvy-1nxKj4TC7ZOg82oBYn1vmfsu23g@mail.gmail.com>
X-Spam-Status: No, score=0.4 required=10.0 tests=KHOP_HELO_FCRDNS autolearn=no
	autolearn_force=no version=3.4.5
X-Spam-Checker-Version: SpamAssassin 3.4.5 (2021-03-20) on mattapan.m5p.com

On Fri, Nov 12, 2021 at 11:00:54PM +0000, Julien Grall wrote:
> On Fri, 12 Nov 2021 at 22:32, Elliott Mitchell <ehem+xen@m5p.com> wrote:
> > > My preference is to introduce a per-platform quirk (I believe Stefano was happy
> > > with this). The advantage is we could get ACPI support for your board hopefully
> > > merged quicker.
> >
> > This could be workable as a temporary workaround.  Longer term I suspect
> > it might well be rather better to *fully* tackle the issue *now*.
> > Otherwise this seems likely to turn into a database of board-specific
> > hacks for hundreds or thousands of devices.
> 
> As usual, you have to find a balance between cost vs benefits.
> 
> If you look at the Device-Tree side, we don' t have many platforms
> requiring quirks.
> In particular, the DMA is so far strictly limited to a single platform (RPI).
> So I would be surprised if we suddenly require tons of quirks when using
> ACPI.

Presently the DMA quirk would be the only consumer, but there will likely
be other consumers later.  Might there be few device-tree quirks due to a
short list of platforms?  Might full ACPI support vastly increase
Xen/ARM's target audience?  (partially ACPI so complex to support so many
varied devices)

I do concede a device-quirk is reasonable for the short-term.  Presently
I don't know where to look for better matching targets, so I'm trapped in
a cave with no light.


-- 
(\___(\___(\______          --=> 8-) EHM <=--          ______/)___/)___/)
 \BS (    |         ehem+sigmsg@m5p.com  PGP 87145445         |    )   /
  \_CS\   |  _____  -O #include <stddisclaimer.h> O-   _____  |   /  _/
8A19\___\_|_/58D2 7E3D DDF4 7BA6 <-PGP-> 41D1 B375 37D0 8714\_|_/___/5445



