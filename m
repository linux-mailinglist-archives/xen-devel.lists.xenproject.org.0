Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 924DD28916B
	for <lists+xen-devel@lfdr.de>; Fri,  9 Oct 2020 20:50:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.5042.12873 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kQxSf-0003Dm-RO; Fri, 09 Oct 2020 18:49:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 5042.12873; Fri, 09 Oct 2020 18:49:49 +0000
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
	id 1kQxSf-0003DN-O8; Fri, 09 Oct 2020 18:49:49 +0000
Received: by outflank-mailman (input) for mailman id 5042;
 Fri, 09 Oct 2020 18:49:47 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=bBQf=DQ=m5p.com=ehem@srs-us1.protection.inumbo.net>)
 id 1kQxSd-0003DI-HR
 for xen-devel@lists.xenproject.org; Fri, 09 Oct 2020 18:49:47 +0000
Received: from mailhost.m5p.com (unknown [74.104.188.4])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d54be095-8c5d-4dcb-aa91-2d191ac625c7;
 Fri, 09 Oct 2020 18:49:46 +0000 (UTC)
Received: from m5p.com (mailhost.m5p.com [IPv6:2001:470:1f07:15ff:0:0:0:f7])
 by mailhost.m5p.com (8.15.2/8.15.2) with ESMTPS id 099InWg3065261
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
 Fri, 9 Oct 2020 14:49:38 -0400 (EDT) (envelope-from ehem@m5p.com)
Received: (from ehem@localhost)
 by m5p.com (8.15.2/8.15.2/Submit) id 099InUbs065260;
 Fri, 9 Oct 2020 11:49:30 -0700 (PDT) (envelope-from ehem)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=bBQf=DQ=m5p.com=ehem@srs-us1.protection.inumbo.net>)
	id 1kQxSd-0003DI-HR
	for xen-devel@lists.xenproject.org; Fri, 09 Oct 2020 18:49:47 +0000
X-Inumbo-ID: d54be095-8c5d-4dcb-aa91-2d191ac625c7
Received: from mailhost.m5p.com (unknown [74.104.188.4])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id d54be095-8c5d-4dcb-aa91-2d191ac625c7;
	Fri, 09 Oct 2020 18:49:46 +0000 (UTC)
Received: from m5p.com (mailhost.m5p.com [IPv6:2001:470:1f07:15ff:0:0:0:f7])
	by mailhost.m5p.com (8.15.2/8.15.2) with ESMTPS id 099InWg3065261
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
	Fri, 9 Oct 2020 14:49:38 -0400 (EDT)
	(envelope-from ehem@m5p.com)
Received: (from ehem@localhost)
	by m5p.com (8.15.2/8.15.2/Submit) id 099InUbs065260;
	Fri, 9 Oct 2020 11:49:30 -0700 (PDT)
	(envelope-from ehem)
Date: Fri, 9 Oct 2020 11:49:30 -0700
From: Elliott Mitchell <ehem+xen@m5p.com>
To: Julien Grall <julien@xen.org>
Cc: Ian Jackson <iwj@xenproject.org>, Jan Beulich <jbeulich@suse.com>,
        "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
        Bertrand Marquis <bertrand.marquis@arm.com>, ba1020@protonmail.ch
Subject: Re: Tools backport request for Xen 4.14
Message-ID: <20201009184930.GA65219@mattapan.m5p.com>
References: <54fcf6ea-f400-c96a-cde6-4f55f909c2d6@xen.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <54fcf6ea-f400-c96a-cde6-4f55f909c2d6@xen.org>
X-Spam-Status: No, score=0.0 required=10.0 tests=KHOP_HELO_FCRDNS
	autolearn=unavailable autolearn_force=no version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on mattapan.m5p.com

On Fri, Oct 09, 2020 at 06:47:22PM +0100, Julien Grall wrote:
> Would it be possible to consider backporting to 4.14 the following tools 
> commit:
> 
> d25cc3ec93eb "libxl: workaround gcc 10.2 maybe-uninitialized warning"
> 
> This would help to build Xen tools on Debian Testing with GCC 10. I 
> haven't build itself myself, so I can't promise this is only one :).

From Debian's repository:
https://salsa.debian.org/xen-team/debian-xen.git

The master and knorrie/4.14 branches include that commit.  They will
hopefully soon include all the Debian-specific bits for cross-building
too.


-- 
(\___(\___(\______          --=> 8-) EHM <=--          ______/)___/)___/)
 \BS (    |         ehem+sigmsg@m5p.com  PGP 87145445         |    )   /
  \_CS\   |  _____  -O #include <stddisclaimer.h> O-   _____  |   /  _/
8A19\___\_|_/58D2 7E3D DDF4 7BA6 <-PGP-> 41D1 B375 37D0 8714\_|_/___/5445



