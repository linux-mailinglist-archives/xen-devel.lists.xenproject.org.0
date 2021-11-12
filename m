Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 62C0F44EF49
	for <lists+xen-devel@lfdr.de>; Fri, 12 Nov 2021 23:33:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.225457.389344 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mlf6H-0006uM-NZ; Fri, 12 Nov 2021 22:32:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 225457.389344; Fri, 12 Nov 2021 22:32:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mlf6H-0006rr-Jg; Fri, 12 Nov 2021 22:32:49 +0000
Received: by outflank-mailman (input) for mailman id 225457;
 Fri, 12 Nov 2021 22:32:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=cipi=P7=m5p.com=ehem@srs-se1.protection.inumbo.net>)
 id 1mlf6G-0006rl-5Z
 for xen-devel@lists.xenproject.org; Fri, 12 Nov 2021 22:32:48 +0000
Received: from mailhost.m5p.com (mailhost.m5p.com [74.104.188.4])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 74649e8b-4408-11ec-a9d2-d9f7a1cc8784;
 Fri, 12 Nov 2021 23:32:45 +0100 (CET)
Received: from m5p.com (mailhost.m5p.com [IPv6:2001:470:1f07:15ff:0:0:0:f7])
 by mailhost.m5p.com (8.16.1/8.15.2) with ESMTPS id 1ACMWTkQ087468
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
 Fri, 12 Nov 2021 17:32:35 -0500 (EST) (envelope-from ehem@m5p.com)
Received: (from ehem@localhost)
 by m5p.com (8.16.1/8.15.2/Submit) id 1ACMWSRw087466;
 Fri, 12 Nov 2021 14:32:28 -0800 (PST) (envelope-from ehem)
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
X-Inumbo-ID: 74649e8b-4408-11ec-a9d2-d9f7a1cc8784
Date: Fri, 12 Nov 2021 14:32:28 -0800
From: Elliott Mitchell <ehem+xen@m5p.com>
To: Julien Grall <julien.grall.oss@gmail.com>
Cc: Henry Wang <Henry.Wang@arm.com>,
        Stefano Stabellini <sstabellini@kernel.org>,
        "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: ACPI/UEFI support for Xen/ARM status?
Message-ID: <YY7rfIWPC1PwidMA@mattapan.m5p.com>
References: <YY3tSAFTCR4r2FaI@mattapan.m5p.com>
 <AM9PR08MB62428F41C4F998AD676C027C92959@AM9PR08MB6242.eurprd08.prod.outlook.com>
 <YY6L5JQPn0s3c6Jp@mattapan.m5p.com>
 <1d3561ef-548a-ea13-d362-0f95d7dba33b@xen.org>
 <YY6bsu8/y/LeMfg3@mattapan.m5p.com>
 <40474f12-e269-f251-99b1-cb5b0a317bb2@xen.org>
 <YY7ZVPQSTapB7Jnj@mattapan.m5p.com>
 <CAJ=z9a0EooNfXyrNB82_4yT9qnz5fxEJtVN6oUbVyCzjU4hEKA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAJ=z9a0EooNfXyrNB82_4yT9qnz5fxEJtVN6oUbVyCzjU4hEKA@mail.gmail.com>
X-Spam-Status: No, score=0.4 required=10.0 tests=KHOP_HELO_FCRDNS autolearn=no
	autolearn_force=no version=3.4.5
X-Spam-Checker-Version: SpamAssassin 3.4.5 (2021-03-20) on mattapan.m5p.com

On Fri, Nov 12, 2021 at 10:08:54PM +0000, Julien Grall wrote:
> 
> On Fri, 12 Nov 2021 at 21:15, Elliott Mitchell <ehem+xen@m5p.com> wrote:
> > > > I had been left with the impression the DSDT parsing was going to be
> > > > needed for Domain 0 to access the framebuffer.  This was found
> > > > unnecessary for framebuffer access for Domain 0?
> > >
> > > I thought you were asking for using framebuffer in Xen. There is no need
> > > for Xen to parse the DSDT if the framebuffer is solely used by Dom0.
> > >
> > > Your problem with the framebuffer is likely not related to the DSDT. But
> > > I can't really provide a lot of input until I see the logs.
> >
> > https://lists.xenproject.org/archives/html/xen-devel/2020-10/msg01841.html
> >
> > That is more or less a statement of handling of DSDT is the Right(tm)
> > solution for Domain 0 to have framebuffer on such a platform.
> 
> Reading through the thread, I agree this is the correct theoretical thing to do.
> However, as already pointed out back then, the effort seems quite big for the
> benefit of a single board (AFAIK none of the other SoC we support
> requires this).

Crucial word I would add to the end of the parenthsized sentence; "yet".
Seems entirely plausible other boards could end up needing this for one
reason or another.  Alternatively this could remove the need for many
platform-specific hacks or could simplify support for many boards all at
once.


> My preference is to introduce a per-platform quirk (I believe Stefano was happy
> with this). The advantage is we could get ACPI support for your board hopefully
> merged quicker.

This could be workable as a temporary workaround.  Longer term I suspect
it might well be rather better to *fully* tackle the issue *now*.
Otherwise this seems likely to turn into a database of board-specific
hacks for hundreds or thousands of devices.

I had left the discussion alone towards the end since I was unsure of
what exactly to target (or look at) for this goal.  I was also thinking
long-term planning pretty well required full support, the question was
merely "When?"


-- 
(\___(\___(\______          --=> 8-) EHM <=--          ______/)___/)___/)
 \BS (    |         ehem+sigmsg@m5p.com  PGP 87145445         |    )   /
  \_CS\   |  _____  -O #include <stddisclaimer.h> O-   _____  |   /  _/
8A19\___\_|_/58D2 7E3D DDF4 7BA6 <-PGP-> 41D1 B375 37D0 8714\_|_/___/5445



