Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 96A2E92D8F8
	for <lists+xen-devel@lfdr.de>; Wed, 10 Jul 2024 21:20:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.757051.1165782 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sRcql-0000Kt-Co; Wed, 10 Jul 2024 19:19:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 757051.1165782; Wed, 10 Jul 2024 19:19:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sRcql-0000JP-AJ; Wed, 10 Jul 2024 19:19:35 +0000
Received: by outflank-mailman (input) for mailman id 757051;
 Wed, 10 Jul 2024 19:19:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=NRb1=OK=m5p.com=ehem@srs-se1.protection.inumbo.net>)
 id 1sRcqk-0000JJ-BI
 for xen-devel@lists.xenproject.org; Wed, 10 Jul 2024 19:19:34 +0000
Received: from mailhost.m5p.com (mailhost.m5p.com [74.104.188.4])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 557c0ff8-3ef1-11ef-8776-851b0ebba9a2;
 Wed, 10 Jul 2024 21:19:32 +0200 (CEST)
Received: from m5p.com (mailhost.m5p.com [IPv6:2001:470:8ac4:0:0:0:0:f7])
 by mailhost.m5p.com (8.18.1/8.17.1) with ESMTPS id 46AJJLh3032175
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
 Wed, 10 Jul 2024 15:19:27 -0400 (EDT) (envelope-from ehem@m5p.com)
Received: (from ehem@localhost)
 by m5p.com (8.18.1/8.15.2/Submit) id 46AJJK2k032174;
 Wed, 10 Jul 2024 12:19:20 -0700 (PDT) (envelope-from ehem)
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
X-Inumbo-ID: 557c0ff8-3ef1-11ef-8776-851b0ebba9a2
Date: Wed, 10 Jul 2024 12:19:20 -0700
From: Elliott Mitchell <ehem+xen@m5p.com>
To: Andrei Semenov <andrei.semenov@vates.tech>
Cc: xen-devel@lists.xenproject.org, Andrew Cooper <andrew.cooper3@citrix.com>,
        Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
        jgross@suse.com
Subject: Re: AMD EPYC virtual network performances
Message-ID: <Zo7euOa87jCNvjV8@mattapan.m5p.com>
References: <959bbf84-24da-4da3-a059-dc1aa32b27ef@vates.tech>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <959bbf84-24da-4da3-a059-dc1aa32b27ef@vates.tech>

On Tue, Jul 09, 2024 at 08:36:18AM +0000, Andrei Semenov wrote:
> 
> Does anybody notice this behavior on his side?  Can we do something 
> about it?

I hadn't previously noticed this manifestation, but now that I know where
to look seems I'm also seeing the issue.

It also effects other lines of AMD's offerings.

It also effects PVH domains, but may not have as much impact.

It also effects virtual block devices.


Right now I consider this highly speculative, but I am now wondering
whether the software RAID1 issue is related to this.


-- 
(\___(\___(\______          --=> 8-) EHM <=--          ______/)___/)___/)
 \BS (    |         ehem+sigmsg@m5p.com  PGP 87145445         |    )   /
  \_CS\   |  _____  -O #include <stddisclaimer.h> O-   _____  |   /  _/
8A19\___\_|_/58D2 7E3D DDF4 7BA6 <-PGP-> 41D1 B375 37D0 8714\_|_/___/5445



