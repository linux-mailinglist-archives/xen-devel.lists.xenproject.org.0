Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 61B0E2C6EDB
	for <lists+xen-devel@lfdr.de>; Sat, 28 Nov 2020 05:57:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.39818.72845 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kisHX-0004nC-AF; Sat, 28 Nov 2020 04:56:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 39818.72845; Sat, 28 Nov 2020 04:56:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kisHX-0004mn-71; Sat, 28 Nov 2020 04:56:23 +0000
Received: by outflank-mailman (input) for mailman id 39818;
 Sat, 28 Nov 2020 04:56:21 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=3d2o=FC=m5p.com=ehem@srs-us1.protection.inumbo.net>)
 id 1kisHV-0004mi-QI
 for xen-devel@lists.xenproject.org; Sat, 28 Nov 2020 04:56:21 +0000
Received: from mailhost.m5p.com (unknown [74.104.188.4])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3b213de3-0ebe-446a-91d4-f87d3ec7ecb7;
 Sat, 28 Nov 2020 04:56:20 +0000 (UTC)
Received: from m5p.com (mailhost.m5p.com [IPv6:2001:470:1f07:15ff:0:0:0:f7])
 by mailhost.m5p.com (8.15.2/8.15.2) with ESMTPS id 0AS4u9Tf049715
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
 Fri, 27 Nov 2020 23:56:15 -0500 (EST) (envelope-from ehem@m5p.com)
Received: (from ehem@localhost)
 by m5p.com (8.15.2/8.15.2/Submit) id 0AS4u85e049714;
 Fri, 27 Nov 2020 20:56:08 -0800 (PST) (envelope-from ehem)
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
X-Inumbo-ID: 3b213de3-0ebe-446a-91d4-f87d3ec7ecb7
Date: Fri, 27 Nov 2020 20:56:08 -0800
From: Elliott Mitchell <ehem+xen@m5p.com>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Roman Shaposhnik <roman@zededa.com>, Julien Grall <julien@xen.org>,
        Xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: Xen on RP4
Message-ID: <X8HYaI/WjRFtM8As@mattapan.m5p.com>
References: <X73RfHfRfBRLKkvB@mattapan.m5p.com>
 <CAMmSBy8dtUQotUeX2MVke7d2nWS0shvKPL_S=4tUeF0UKh4vgA@mail.gmail.com>
 <X73ghKgQEXLv2z2p@mattapan.m5p.com>
 <CAMmSBy-Qdpj+6FAk9D15=+87_=68T80Y1NGnvyAB=tOFveifiQ@mail.gmail.com>
 <X73owDP0UXx+lvJd@mattapan.m5p.com>
 <alpine.DEB.2.21.2011251051240.7979@sstabellini-ThinkPad-T480s>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.21.2011251051240.7979@sstabellini-ThinkPad-T480s>
X-Spam-Status: No, score=0.0 required=10.0 tests=KHOP_HELO_FCRDNS
	autolearn=unavailable autolearn_force=no version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on mattapan.m5p.com

On Wed, Nov 25, 2020 at 10:57:31AM -0800, Stefano Stabellini wrote:
> On Tue, 24 Nov 2020, Elliott Mitchell wrote:
> > I've frankly got no idea how to ensure the correct device-tree is passed
> > to Xen.  Is GRUB's `devicetree` command correct when loading Xen?  Is a
> > device-tree matched to the Linux kernel appropriate for Xen?
> > 
> > (I'm guessing the second is "yes", but the first I don't have a clue)
> 
> Yes, devicetree is correct. I have not used the graphical output, so I
> cannot help you there but yes the best bet is to use the devicetree that
> comes with the kernel.
> 
> One thing I noticed is that you are missing some of the command line
> arguments for Xen and Linux in your grub config. For instance on the Xen
> line you want to have something like:
> 
>     dom0_mem=1024M console=dtuart sync_console
> 
> And on the Linux line you might want to have:
> 
>     console=tty0 console=hvc0

I was sending the bare minimum.  Some of the known bits were filtered
out.  After having spent several hours pounding on this and building
multiple kernels, I'm headed towards odd theories...

I'm wondering how Debian's kernel source trees have managed to remain
broken for the Raspberry PIs for over a year:
https://bugs.debian.org/939633

Right now that feels like conspiracy theory territory, but my mind is
wandering in odd directions...   Is someone at Intel trying to sabotage
device-trees so everyone moves to UEFI?

Could simply be Debian's kernel maintainers are very busy and the
original reporter of the bug failed to draw enough attention to a large
problem.  If that odd suspicion is true though, getting EFI to supported
status on ARM might be a major concern.

Alternatively I've been exploring an incorrect path, I should simply
stick with the device-trees which come from the Raspberry PI Foundation,
and not try to follow the Linux kernel's device-trees.


-- 
(\___(\___(\______          --=> 8-) EHM <=--          ______/)___/)___/)
 \BS (    |         ehem+sigmsg@m5p.com  PGP 87145445         |    )   /
  \_CS\   |  _____  -O #include <stddisclaimer.h> O-   _____  |   /  _/
8A19\___\_|_/58D2 7E3D DDF4 7BA6 <-PGP-> 41D1 B375 37D0 8714\_|_/___/5445



