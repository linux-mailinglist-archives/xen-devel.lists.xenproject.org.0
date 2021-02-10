Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E58C315CC0
	for <lists+xen-devel@lfdr.de>; Wed, 10 Feb 2021 03:00:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.83473.155447 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l9enI-0005mw-E0; Wed, 10 Feb 2021 01:59:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 83473.155447; Wed, 10 Feb 2021 01:59:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l9enI-0005mX-Ay; Wed, 10 Feb 2021 01:59:52 +0000
Received: by outflank-mailman (input) for mailman id 83473;
 Wed, 10 Feb 2021 01:59:50 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=r83b=HM=m5p.com=ehem@srs-us1.protection.inumbo.net>)
 id 1l9enG-0005mS-E5
 for xen-devel@lists.xenproject.org; Wed, 10 Feb 2021 01:59:50 +0000
Received: from mailhost.m5p.com (unknown [74.104.188.4])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e47361b2-458a-4ba9-b835-6ec227bf5d8f;
 Wed, 10 Feb 2021 01:59:49 +0000 (UTC)
Received: from m5p.com (mailhost.m5p.com [IPv6:2001:470:1f07:15ff:0:0:0:f7])
 by mailhost.m5p.com (8.16.1/8.15.2) with ESMTPS id 11A1xXAD076972
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
 Tue, 9 Feb 2021 20:59:38 -0500 (EST) (envelope-from ehem@m5p.com)
Received: (from ehem@localhost)
 by m5p.com (8.16.1/8.15.2/Submit) id 11A1xWSQ076971;
 Tue, 9 Feb 2021 17:59:32 -0800 (PST) (envelope-from ehem)
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
X-Inumbo-ID: e47361b2-458a-4ba9-b835-6ec227bf5d8f
Date: Tue, 9 Feb 2021 17:59:32 -0800
From: Elliott Mitchell <ehem+xen@m5p.com>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org, julien@xen.org, Volodymyr_Babchuk@epam.com,
        Stefano Stabellini <stefano.stabellini@xilinx.com>,
        Jukka Kaartinen <jukka.kaartinen@unikie.com>
Subject: Re: [PATCH v2] xen: workaround missing device_type property in
 pci/pcie nodes
Message-ID: <YCM+BBvcMoloMXeT@mattapan.m5p.com>
References: <20210209195334.21206-1-sstabellini@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210209195334.21206-1-sstabellini@kernel.org>
X-Spam-Status: No, score=0.4 required=10.0 tests=KHOP_HELO_FCRDNS autolearn=no
	autolearn_force=no version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on mattapan.m5p.com

On Tue, Feb 09, 2021 at 11:53:34AM -0800, Stefano Stabellini wrote:
> This fixes Xen boot on RPi4. Some RPi4 kernels have the following node
> on their device trees:

IMO I like keeping the reference to Linux kernel d1ac0002dd29 in the
commit message.  The commit is distinctly informative and takes some
searching to find in the thread archive.  This though is merely /my/
opinion.

Two builds later to ensure I've got a build which doesn't work due to the
problematic device-tree and one with the patch to ensure it does fix the
issue and:

Tested-by: Elliott Mitchell <ehem+xen@m5p.com>


Note to Jukka Kaartinen, people who merely build from source are useful
for confirming proposed fixes work.  The above line gets added to commit
messages to note people have tried it and it works for them.


-- 
(\___(\___(\______          --=> 8-) EHM <=--          ______/)___/)___/)
 \BS (    |         ehem+sigmsg@m5p.com  PGP 87145445         |    )   /
  \_CS\   |  _____  -O #include <stddisclaimer.h> O-   _____  |   /  _/
8A19\___\_|_/58D2 7E3D DDF4 7BA6 <-PGP-> 41D1 B375 37D0 8714\_|_/___/5445



