Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C9BB8297AF1
	for <lists+xen-devel@lfdr.de>; Sat, 24 Oct 2020 07:36:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.11451.30380 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kWCDa-0003Xo-UE; Sat, 24 Oct 2020 05:35:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 11451.30380; Sat, 24 Oct 2020 05:35:54 +0000
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
	id 1kWCDa-0003XS-Qa; Sat, 24 Oct 2020 05:35:54 +0000
Received: by outflank-mailman (input) for mailman id 11451;
 Sat, 24 Oct 2020 05:35:53 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=+Iak=D7=m5p.com=ehem@srs-us1.protection.inumbo.net>)
 id 1kWCDZ-0003XN-QT
 for xen-devel@lists.xenproject.org; Sat, 24 Oct 2020 05:35:53 +0000
Received: from mailhost.m5p.com (unknown [74.104.188.4])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4b8561f3-1386-4cf9-8494-0455bc26722f;
 Sat, 24 Oct 2020 05:35:52 +0000 (UTC)
Received: from m5p.com (mailhost.m5p.com [IPv6:2001:470:1f07:15ff:0:0:0:f7])
 by mailhost.m5p.com (8.15.2/8.15.2) with ESMTPS id 09O5ZfwU097466
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
 Sat, 24 Oct 2020 01:35:47 -0400 (EDT) (envelope-from ehem@m5p.com)
Received: (from ehem@localhost)
 by m5p.com (8.15.2/8.15.2/Submit) id 09O5Zeol097465;
 Fri, 23 Oct 2020 22:35:40 -0700 (PDT) (envelope-from ehem)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=+Iak=D7=m5p.com=ehem@srs-us1.protection.inumbo.net>)
	id 1kWCDZ-0003XN-QT
	for xen-devel@lists.xenproject.org; Sat, 24 Oct 2020 05:35:53 +0000
X-Inumbo-ID: 4b8561f3-1386-4cf9-8494-0455bc26722f
Received: from mailhost.m5p.com (unknown [74.104.188.4])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 4b8561f3-1386-4cf9-8494-0455bc26722f;
	Sat, 24 Oct 2020 05:35:52 +0000 (UTC)
Received: from m5p.com (mailhost.m5p.com [IPv6:2001:470:1f07:15ff:0:0:0:f7])
	by mailhost.m5p.com (8.15.2/8.15.2) with ESMTPS id 09O5ZfwU097466
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
	Sat, 24 Oct 2020 01:35:47 -0400 (EDT)
	(envelope-from ehem@m5p.com)
Received: (from ehem@localhost)
	by m5p.com (8.15.2/8.15.2/Submit) id 09O5Zeol097465;
	Fri, 23 Oct 2020 22:35:40 -0700 (PDT)
	(envelope-from ehem)
Date: Fri, 23 Oct 2020 22:35:40 -0700
From: Elliott Mitchell <ehem+xen@m5p.com>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Julien Grall <julien@xen.org>, roman@zededa.com,
        xen-devel@lists.xenproject.org
Subject: Re: Xen on RP4
Message-ID: <20201024053540.GA97417@mattapan.m5p.com>
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
> Note that I tried to repro the issue here at my end but it works for me
> with device tree. So the swiotlb_init memory allocation failure probably
> only shows on ACPI, maybe because ACPI is reserving too much low memory.

Found it.  Take a look at 437b0aa06a014ce174e24c0d3530b3e9ab19b18b

 PLATFORM_START(rpi4, "Raspberry Pi 4")
     .compatible     = rpi4_dt_compat,
     .blacklist_dev  = rpi4_blacklist_dev,
+    .dma_bitsize    = 30,
 PLATFORM_END

Where this is used to match against a *device-tree*.  ACPI has a distinct
means of specifying a limited DMA-width; the above fails, because it
assumes a *device-tree*.


-- 
(\___(\___(\______          --=> 8-) EHM <=--          ______/)___/)___/)
 \BS (    |         ehem+sigmsg@m5p.com  PGP 87145445         |    )   /
  \_CS\   |  _____  -O #include <stddisclaimer.h> O-   _____  |   /  _/
8A19\___\_|_/58D2 7E3D DDF4 7BA6 <-PGP-> 41D1 B375 37D0 8714\_|_/___/5445



