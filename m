Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E9BC17AA27D
	for <lists+xen-devel@lfdr.de>; Thu, 21 Sep 2023 23:20:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.606565.944561 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qjR5O-0003im-0o; Thu, 21 Sep 2023 21:19:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 606565.944561; Thu, 21 Sep 2023 21:19:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qjR5N-0003ft-U4; Thu, 21 Sep 2023 21:19:45 +0000
Received: by outflank-mailman (input) for mailman id 606565;
 Thu, 21 Sep 2023 21:19:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=gWeo=FF=m5p.com=ehem@srs-se1.protection.inumbo.net>)
 id 1qjR5N-0003fn-5B
 for xen-devel@lists.xenproject.org; Thu, 21 Sep 2023 21:19:45 +0000
Received: from mailhost.m5p.com (mailhost.m5p.com [74.104.188.4])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 94b17868-58c4-11ee-878a-cb3800f73035;
 Thu, 21 Sep 2023 23:19:43 +0200 (CEST)
Received: from m5p.com (mailhost.m5p.com [IPv6:2001:470:1f07:15ff:0:0:0:f7])
 by mailhost.m5p.com (8.17.1/8.15.2) with ESMTPS id 38LLItlr073396
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
 Thu, 21 Sep 2023 17:19:01 -0400 (EDT) (envelope-from ehem@m5p.com)
Received: (from ehem@localhost)
 by m5p.com (8.17.1/8.15.2/Submit) id 38LLIsqq073395;
 Thu, 21 Sep 2023 14:18:54 -0700 (PDT) (envelope-from ehem)
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
X-Inumbo-ID: 94b17868-58c4-11ee-878a-cb3800f73035
Date: Thu, 21 Sep 2023 14:18:54 -0700
From: Elliott Mitchell <ehem+xen@m5p.com>
To: Borislav Petkov <bp@alien8.de>
Cc: "Luck, Tony" <tony.luck@intel.com>, Yazen Ghannam <yazen.ghannam@amd.com>,
        smita.koralahallichannabasappa@amd.com, linux-edac@vger.kernel.org,
        linux-kernel@vger.kernel.org, x86@kernel.org,
        xen-devel@lists.xenproject.org, rric@kernel.org, james.morse@arm.com
Subject: Re: [PATCH] Revert "EDAC/mce_amd: Do not load edac_mce_amd module on
 guests"
Message-ID: <ZQyzPncxg2HYzlQI@mattapan.m5p.com>
References: <20210628172740.245689-1-Smita.KoralahalliChannabasappa@amd.com>
 <ZPqQEHXgmak1LMNh@mattapan.m5p.com>
 <20230908035911.GAZPqcD/EjfKZ0ISrZ@fat_crate.local>
 <ZQM8jRx8uKEbEo00@mattapan.m5p.com>
 <20230915115631.GAZQRGb0vCmEnUcaZI@fat_crate.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230915115631.GAZQRGb0vCmEnUcaZI@fat_crate.local>
X-Spam-Status: No, score=0.4 required=10.0 tests=KHOP_HELO_FCRDNS autolearn=no
	autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on mattapan.m5p.com

On Fri, Sep 15, 2023 at 01:56:31PM +0200, Borislav Petkov wrote:
> On Thu, Sep 14, 2023 at 10:02:05AM -0700, Elliott Mitchell wrote:
> > Indeed.  At what point is the lack of information and response long
> > enough to simply commit a revert due to those lacks?
> 
> At no point.
> 
> > Even with the commit message having been rewritten and the link to:
> > https://lkml.kernel.org/r/20210628172740.245689-1-Smita.KoralahalliChannabasappa@amd.com
> > added, this still reads as roughly:
> > 
> > "A hypothetical bug on a hypothetivisor"
> 
> If "Hypervisors likely do not expose the SMCA feature to the guest"
> doesn't explain to you what the problem is this commit is fixing, then
> I can't help you.

Problem is you were objecting to 'probable hypothetical "may"
formulations' in what I wrote, yet the original patch message overtly
uses that word.

In order for the first patch to be correct, it is insufficient for the
condition to be unlikely.  Ideally it should be mathematically proven
impossible.

As such I was writing about known counter-examples from the real world.
Mainly at least one hypervisor (Xen) does tend to allow a particular VM
to access sensitive system registers.  Also it is entirely possible some
hypervisor could proxy access to the registers and thus properly simulate
the events.

Not only that, but in fact this very strategy was already actively
deployed:
https://bugs.debian.org/810964

I'm less than 100% certain this successfully retrieves EDAC events on Xen
right now, so I had been taking a look at the situation only to find
767f4b620eda.

Perhaps everyone should consult with large-scale system administrators
when doing things which effect them?


-- 
(\___(\___(\______          --=> 8-) EHM <=--          ______/)___/)___/)
 \BS (    |         ehem+sigmsg@m5p.com  PGP 87145445         |    )   /
  \_CS\   |  _____  -O #include <stddisclaimer.h> O-   _____  |   /  _/
8A19\___\_|_/58D2 7E3D DDF4 7BA6 <-PGP-> 41D1 B375 37D0 8714\_|_/___/5445



