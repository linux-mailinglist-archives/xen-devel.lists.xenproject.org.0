Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BD7F4297AD3
	for <lists+xen-devel@lfdr.de>; Sat, 24 Oct 2020 06:36:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.11441.30352 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kWBGe-0005T5-4J; Sat, 24 Oct 2020 04:35:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 11441.30352; Sat, 24 Oct 2020 04:35:00 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kWBGe-0005Sj-1H; Sat, 24 Oct 2020 04:35:00 +0000
Received: by outflank-mailman (input) for mailman id 11441;
 Sat, 24 Oct 2020 04:34:58 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=+Iak=D7=m5p.com=ehem@srs-us1.protection.inumbo.net>)
 id 1kWBGc-0005Se-Nu
 for xen-devel@lists.xenproject.org; Sat, 24 Oct 2020 04:34:58 +0000
Received: from mailhost.m5p.com (unknown [74.104.188.4])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4b8c1b87-12b5-4c96-b5b6-a22715a1dad3;
 Sat, 24 Oct 2020 04:34:57 +0000 (UTC)
Received: from m5p.com (mailhost.m5p.com [IPv6:2001:470:1f07:15ff:0:0:0:f7])
 by mailhost.m5p.com (8.15.2/8.15.2) with ESMTPS id 09O4YlGZ097256
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
 Sat, 24 Oct 2020 00:34:53 -0400 (EDT) (envelope-from ehem@m5p.com)
Received: (from ehem@localhost)
 by m5p.com (8.15.2/8.15.2/Submit) id 09O4Yk1e097255;
 Fri, 23 Oct 2020 21:34:46 -0700 (PDT) (envelope-from ehem)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=+Iak=D7=m5p.com=ehem@srs-us1.protection.inumbo.net>)
	id 1kWBGc-0005Se-Nu
	for xen-devel@lists.xenproject.org; Sat, 24 Oct 2020 04:34:58 +0000
X-Inumbo-ID: 4b8c1b87-12b5-4c96-b5b6-a22715a1dad3
Received: from mailhost.m5p.com (unknown [74.104.188.4])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 4b8c1b87-12b5-4c96-b5b6-a22715a1dad3;
	Sat, 24 Oct 2020 04:34:57 +0000 (UTC)
Received: from m5p.com (mailhost.m5p.com [IPv6:2001:470:1f07:15ff:0:0:0:f7])
	by mailhost.m5p.com (8.15.2/8.15.2) with ESMTPS id 09O4YlGZ097256
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
	Sat, 24 Oct 2020 00:34:53 -0400 (EDT)
	(envelope-from ehem@m5p.com)
Received: (from ehem@localhost)
	by m5p.com (8.15.2/8.15.2/Submit) id 09O4Yk1e097255;
	Fri, 23 Oct 2020 21:34:46 -0700 (PDT)
	(envelope-from ehem)
Date: Fri, 23 Oct 2020 21:34:46 -0700
From: Elliott Mitchell <ehem+xen@m5p.com>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Julien Grall <julien@xen.org>, roman@zededa.com,
        xen-devel@lists.xenproject.org
Subject: Re: Xen on RP4
Message-ID: <20201024043446.GA97167@mattapan.m5p.com>
References: <20201012215751.GB89158@mattapan.m5p.com>
 <c38d78bd-c011-404b-5f59-d10cd7d7f006@xen.org>
 <20201016003024.GA13290@mattapan.m5p.com>
 <23885c28-dee5-4e9a-dc43-6ccf19a94df6@xen.org>
 <20201022021655.GA74011@mattapan.m5p.com>
 <alpine.DEB.2.21.2010221620230.12247@sstabellini-ThinkPad-T480s>
 <20201023005629.GA83870@mattapan.m5p.com>
 <alpine.DEB.2.21.2010221801490.12247@sstabellini-ThinkPad-T480s>
 <20201023211941.GA90171@mattapan.m5p.com>
 <alpine.DEB.2.21.2010231647290.12247@sstabellini-ThinkPad-T480s>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.21.2010231647290.12247@sstabellini-ThinkPad-T480s>
X-Spam-Status: No, score=0.0 required=10.0 tests=KHOP_HELO_FCRDNS
	autolearn=unavailable autolearn_force=no version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on mattapan.m5p.com

On Fri, Oct 23, 2020 at 04:59:30PM -0700, Stefano Stabellini wrote:
> On Fri, 23 Oct 2020, Elliott Mitchell wrote:
> > Finally came up with one detail of a change I'd made in the right time
> > frame to trigger this issue.  As such I can now control this behavior and
> > get it to occur or not.
> > 
> > I have some suspicion my planned workload approach differs from others.
> > 
> > During the runs where I was able to successfully boot a child domain,
> > domain 0 had been allocated 512MB of memory.  During the unsuccessful run
> > where the above message occurred, domain 0 had been allocated 2GB of
> > memory.  This appears to reliably control the occurrence of this bug.

> In your case, the allocation must fail, no_iotlb_memory is set, and I
> expect you see this warning among the boot messages:
> 
>   Cannot allocate buffer
> 
> Later during initialization swiotlb-xen comes in
> (drivers/xen/swiotlb-xen.c:xen_swiotlb_init) and given that io_tlb_start
> is != 0 it thinks the memory is ready to use when actually it is not.

Then I look at more copies of `dmesg` logs and discover I did have one
where that message occurred.  Then start playing a bit more and a
matching pattern emerges.

dom0_mem=1023M
=> "software IO TLB: mapped [mem 0x2c000000-0x30000000] (64MB)"

dom0_mem=1024M
=> "software IO TLB: Cannot allocate buffer"

That looks suspicious.  Really suspicious.  I don't know how many bugs
are combined together, nor where they are, but more data for you.

I see a possibility Tianocore marks a smaller region of memory as being
DMA-capable.  This though is speculation.


-- 
(\___(\___(\______          --=> 8-) EHM <=--          ______/)___/)___/)
 \BS (    |         ehem+sigmsg@m5p.com  PGP 87145445         |    )   /
  \_CS\   |  _____  -O #include <stddisclaimer.h> O-   _____  |   /  _/
8A19\___\_|_/58D2 7E3D DDF4 7BA6 <-PGP-> 41D1 B375 37D0 8714\_|_/___/5445



