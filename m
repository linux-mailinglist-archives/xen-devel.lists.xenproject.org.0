Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D5DC76EF2D
	for <lists+xen-devel@lfdr.de>; Thu,  3 Aug 2023 18:14:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.576494.902694 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRaxG-0001AE-Uj; Thu, 03 Aug 2023 16:13:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 576494.902694; Thu, 03 Aug 2023 16:13:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRaxG-00017L-S2; Thu, 03 Aug 2023 16:13:38 +0000
Received: by outflank-mailman (input) for mailman id 576494;
 Thu, 03 Aug 2023 16:13:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1bzA=DU=m5p.com=ehem@srs-se1.protection.inumbo.net>)
 id 1qRaxE-00017F-VQ
 for xen-devel@lists.xenproject.org; Thu, 03 Aug 2023 16:13:36 +0000
Received: from mailhost.m5p.com (mailhost.m5p.com [74.104.188.4])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b14c09b2-3218-11ee-8613-37d641c3527e;
 Thu, 03 Aug 2023 18:13:34 +0200 (CEST)
Received: from m5p.com (mailhost.m5p.com [IPv6:2001:470:1f07:15ff:0:0:0:f7])
 by mailhost.m5p.com (8.16.1/8.15.2) with ESMTPS id 373GDIOM012990
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
 Thu, 3 Aug 2023 12:13:24 -0400 (EDT) (envelope-from ehem@m5p.com)
Received: (from ehem@localhost)
 by m5p.com (8.16.1/8.15.2/Submit) id 373GDINx012989;
 Thu, 3 Aug 2023 09:13:18 -0700 (PDT) (envelope-from ehem)
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
X-Inumbo-ID: b14c09b2-3218-11ee-8613-37d641c3527e
Date: Thu, 3 Aug 2023 09:13:18 -0700
From: Elliott Mitchell <ehem+xen@m5p.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>,
        Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Subject: Re: [PATCH 00/22] Cleanup and splitting of xl.cfg parsing
Message-ID: <ZMvSHuEQzGYyVJ49@mattapan.m5p.com>
References: <cover.1690990427.git.ehem+xen@m5p.com>
 <673c6ba4-6d1e-6e51-0da4-fb8996cde4a2@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <673c6ba4-6d1e-6e51-0da4-fb8996cde4a2@suse.com>
X-Spam-Status: No, score=0.4 required=10.0 tests=KHOP_HELO_FCRDNS autolearn=no
	autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on mattapan.m5p.com

On Thu, Aug 03, 2023 at 10:35:53AM +0200, Jan Beulich wrote:
> 
> Some of the patches looks to have been posted previously as a 7-patch
> series. It would have been nice if therefore this one was marked as
> v2, indicating in a revision log what the differences are. It appears
> as if at least one out of those 7 earlier patches was dropped (or
> maybe assimilated into another one).

Indeed.  Problem is several tags could potentially have been used.
Should I have used all of them simultaneously?  Should I have used only
some of them?  Which subset?

Several were mildly adjusted, so it could have been marked "v2".

No one responded at all to the previous round, so this could have been
marked "RESEND".

Yet the refinements and general changes are large enough for the series
to be pretty distinct.

I didn't know which way to go, so with no idea which option to choose the
last one ended up winning out.  Perhaps that was wrong yet I've still no
feedback on the actual patches.


-- 
(\___(\___(\______          --=> 8-) EHM <=--          ______/)___/)___/)
 \BS (    |         ehem+sigmsg@m5p.com  PGP 87145445         |    )   /
  \_CS\   |  _____  -O #include <stddisclaimer.h> O-   _____  |   /  _/
8A19\___\_|_/58D2 7E3D DDF4 7BA6 <-PGP-> 41D1 B375 37D0 8714\_|_/___/5445



