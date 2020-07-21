Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 07857228293
	for <lists+xen-devel@lfdr.de>; Tue, 21 Jul 2020 16:44:54 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jxtVJ-0005J1-I3; Tue, 21 Jul 2020 14:44:25 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=RsL2=BA=m5p.com=ehem@srs-us1.protection.inumbo.net>)
 id 1jxtVH-0005Iv-Da
 for xen-devel@lists.xen.org; Tue, 21 Jul 2020 14:44:23 +0000
X-Inumbo-ID: aa2f1918-cb60-11ea-8542-bc764e2007e4
Received: from mailhost.m5p.com (unknown [74.104.188.4])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id aa2f1918-cb60-11ea-8542-bc764e2007e4;
 Tue, 21 Jul 2020 14:44:22 +0000 (UTC)
Received: from m5p.com (mailhost.m5p.com [IPv6:2001:470:1f07:15ff:0:0:0:f7])
 by mailhost.m5p.com (8.15.2/8.15.2) with ESMTPS id 06LEiAVK023881
 (version=TLSv1.2 cipher=DHE-RSA-AES128-GCM-SHA256 bits=128 verify=NO);
 Tue, 21 Jul 2020 10:44:16 -0400 (EDT) (envelope-from ehem@m5p.com)
Received: (from ehem@localhost)
 by m5p.com (8.15.2/8.15.2/Submit) id 06LEiA67023880;
 Tue, 21 Jul 2020 07:44:10 -0700 (PDT) (envelope-from ehem)
Date: Tue, 21 Jul 2020 07:44:10 -0700
From: Elliott Mitchell <ehem+xen@m5p.com>
To: Wei Liu <wl@xen.org>
Subject: Re: [PATCH 1/2] Partially revert "Cross-compilation fixes."
Message-ID: <20200721144410.GA23640@mattapan.m5p.com>
References: <20200718033121.GA88869@mattapan.m5p.com>
 <20200721122645.qcens4lqq5vcnmz4@liuwe-devbox-debian-v2>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200721122645.qcens4lqq5vcnmz4@liuwe-devbox-debian-v2>
X-Spam-Status: No, score=0.4 required=10.0 tests=KHOP_HELO_FCRDNS autolearn=no
 autolearn_force=no version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on mattapan.m5p.com
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: dave@recoil.org, ian.jackson@eu.citrix.com, christian.lindig@citrix.com,
 xen-devel@lists.xen.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Tue, Jul 21, 2020 at 12:26:45PM +0000, Wei Liu wrote:
> On Fri, Jul 17, 2020 at 08:31:21PM -0700, Elliott Mitchell wrote:
> > This partially reverts commit 16504669c5cbb8b195d20412aadc838da5c428f7.
> 
> Ok, so this commit is really old.

Yup.  It will still be visible in `git blame tools/examples/Makefile`,
but everywhere else has had commits stacked on top.

> > Signed-off-by: Elliott Mitchell <ehem+xen@m5p.com>
> > ---
> > Doesn't look like much of 16504669c5cbb8b195d20412aadc838da5c428f7
> > actually remains due to passage of time.
> > 
> > Of the 3, both Python and pygrub appear to mostly be building just fine
> > cross-compiling.  The OCAML portion is being troublesome, this is going
> > to cause bug reports elsewhere soon.  The OCAML portion though can
> > already be disabled by setting OCAML_TOOLS=n and shouldn't have this
> > extra form of disabling.
> 
> The reasoning here is fine by me. And it should be part of the commit
> message.
> 
> I would like to also add "tools: prefix to the subject line:
> 
>   tools: Partially revert "Cross-compilation fixes."
> 
> If you agree with these changes, no action is required from you. I can
> handle everything while committing.

Fine by me.


-- 
(\___(\___(\______          --=> 8-) EHM <=--          ______/)___/)___/)
 \BS (    |         ehem+sigmsg@m5p.com  PGP 87145445         |    )   /
  \_CS\   |  _____  -O #include <stddisclaimer.h> O-   _____  |   /  _/
8A19\___\_|_/58D2 7E3D DDF4 7BA6 <-PGP-> 41D1 B375 37D0 8714\_|_/___/5445



