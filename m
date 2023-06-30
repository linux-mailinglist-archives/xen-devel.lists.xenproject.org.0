Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 12280744407
	for <lists+xen-devel@lfdr.de>; Fri, 30 Jun 2023 23:43:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.557635.871161 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qFLti-00046z-GO; Fri, 30 Jun 2023 21:43:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 557635.871161; Fri, 30 Jun 2023 21:43:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qFLti-00044a-Da; Fri, 30 Jun 2023 21:43:22 +0000
Received: by outflank-mailman (input) for mailman id 557635;
 Fri, 30 Jun 2023 21:43:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=WRqj=CS=m5p.com=ehem@srs-se1.protection.inumbo.net>)
 id 1qFLtg-00044U-P0
 for xen-devel@lists.xenproject.org; Fri, 30 Jun 2023 21:43:20 +0000
Received: from mailhost.m5p.com (mailhost.m5p.com [74.104.188.4])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1e605650-178f-11ee-b237-6b7b168915f2;
 Fri, 30 Jun 2023 23:43:18 +0200 (CEST)
Received: from m5p.com (mailhost.m5p.com [IPv6:2001:470:1f07:15ff:0:0:0:f7])
 by mailhost.m5p.com (8.16.1/8.15.2) with ESMTPS id 35ULgfXV032356
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
 Fri, 30 Jun 2023 17:42:47 -0400 (EDT) (envelope-from ehem@m5p.com)
Received: (from ehem@localhost)
 by m5p.com (8.16.1/8.15.2/Submit) id 35ULgfcv032355;
 Fri, 30 Jun 2023 14:42:41 -0700 (PDT) (envelope-from ehem)
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
X-Inumbo-ID: 1e605650-178f-11ee-b237-6b7b168915f2
Date: Fri, 30 Jun 2023 14:42:41 -0700
From: Elliott Mitchell <ehem+xen@m5p.com>
To: Luca Fancellu <luca.fancellu@arm.com>
Cc: xen-devel@lists.xenproject.org, wei.chen@arm.com,
        Andrew Cooper <andrew.cooper3@citrix.com>,
        George Dunlap <george.dunlap@citrix.com>,
        Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
        Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
        Henry Wang <Henry.Wang@arm.com>,
        Community Manager <community.manager@xenproject.org>,
        Doug Goldstein <cardoe@cardoe.com>,
        Bertrand Marquis <bertrand.marquis@arm.com>,
        Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
        Anthony PERARD <anthony.perard@citrix.com>
Subject: Re: [RFC PATCH] xen/arm: Rebranding dom0less feature
Message-ID: <ZJ9MUTsCx9cRLIne@mattapan.m5p.com>
References: <20230630091210.3742121-1-luca.fancellu@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230630091210.3742121-1-luca.fancellu@arm.com>
X-Spam-Status: No, score=0.4 required=10.0 tests=KHOP_HELO_FCRDNS autolearn=no
	autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on mattapan.m5p.com

On Fri, Jun 30, 2023 at 10:12:10AM +0100, Luca Fancellu wrote:
> This is an RFC to get the feeling of the community about the name
> change, for now it's everything in one patch just to see how it
> will look like, if there is interest on proceeding into it, I can
> split in more commit.

I seem to recall something else using the term "hyperlaunch".  I'm though
unable to find the reference.

"dom0less" might be a poor name choice, but my initial feeling is to
prefer it to "hyperlaunch".

Perhaps "dom0--", "dom0decrement" or "dom0alternative" since it is
providing an alternative approach to services previously offered by
Domain 0?


-- 
(\___(\___(\______          --=> 8-) EHM <=--          ______/)___/)___/)
 \BS (    |         ehem+sigmsg@m5p.com  PGP 87145445         |    )   /
  \_CS\   |  _____  -O #include <stddisclaimer.h> O-   _____  |   /  _/
8A19\___\_|_/58D2 7E3D DDF4 7BA6 <-PGP-> 41D1 B375 37D0 8714\_|_/___/5445



