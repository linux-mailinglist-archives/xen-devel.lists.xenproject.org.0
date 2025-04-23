Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 24B80A98D64
	for <lists+xen-devel@lfdr.de>; Wed, 23 Apr 2025 16:41:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.964843.1355537 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u7bHX-0006Uu-QP; Wed, 23 Apr 2025 14:40:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 964843.1355537; Wed, 23 Apr 2025 14:40:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u7bHX-0006Sf-NL; Wed, 23 Apr 2025 14:40:59 +0000
Received: by outflank-mailman (input) for mailman id 964843;
 Wed, 23 Apr 2025 14:40:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Oonq=XJ=3mdeb.com=sergii.dmytruk@srs-se1.protection.inumbo.net>)
 id 1u7bHV-0006SZ-EN
 for xen-devel@lists.xenproject.org; Wed, 23 Apr 2025 14:40:58 +0000
Received: from 6.mo582.mail-out.ovh.net (6.mo582.mail-out.ovh.net
 [87.98.177.69]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f6b75f6a-2050-11f0-9eb0-5ba50f476ded;
 Wed, 23 Apr 2025 16:40:56 +0200 (CEST)
Received: from director6.ghost.mail-out.ovh.net (unknown [10.108.17.1])
 by mo582.mail-out.ovh.net (Postfix) with ESMTP id 4ZjMGv2N8Kz1W0d
 for <xen-devel@lists.xenproject.org>; Wed, 23 Apr 2025 14:40:55 +0000 (UTC)
Received: from ghost-submission-5b5ff79f4f-zn847 (unknown [10.110.164.38])
 by director6.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 0FD0C1FD68;
 Wed, 23 Apr 2025 14:40:53 +0000 (UTC)
Received: from 3mdeb.com ([37.59.142.98])
 by ghost-submission-5b5ff79f4f-zn847 with ESMTPSA
 id vwIvLvX7CGg+igEA20Vi8Q
 (envelope-from <sergii.dmytruk@3mdeb.com>); Wed, 23 Apr 2025 14:40:53 +0000
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
X-Inumbo-ID: f6b75f6a-2050-11f0-9eb0-5ba50f476ded
Authentication-Results:garm.ovh; auth=pass (GARM-98R002be13997d-0a89-4925-a797-54a9fae4682a,
                    E44920665798B4DCDE3BF656E3E0060933CCD35A) smtp.auth=sergii.dmytruk@3mdeb.com
X-OVh-ClientIp:176.111.181.178
Date: Wed, 23 Apr 2025 17:40:44 +0300
From: Sergii Dmytruk <sergii.dmytruk@3mdeb.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: xen-devel@lists.xenproject.org,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	ross.philipson@oracle.com, trenchboot-devel@googlegroups.com
Subject: Re: [PATCH 02/21] include/xen/slr_table.h: Secure Launch Resource
 Table definitions
Message-ID: <aAj77DAIofkTJ6Dm@MjU3Nj>
References: <cover.1745172094.git.sergii.dmytruk@3mdeb.com>
 <1cf5d940e666b2b292fc84ed1fbb8a95cd57f027.1745172094.git.sergii.dmytruk@3mdeb.com>
 <6bd0a24d-4f16-4d21-a660-c29407952bb2@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6bd0a24d-4f16-4d21-a660-c29407952bb2@citrix.com>
X-Ovh-Tracer-Id: 18155980426681103516
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvgeeikeeiucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggugfgjsehtkeertddttddunecuhfhrohhmpefuvghrghhiihcuffhmhihtrhhukhcuoehsvghrghhiihdrughmhihtrhhukhesfehmuggvsgdrtghomheqnecuggftrfgrthhtvghrnhepueeiudeuveffkeetveelgeehhffgheehgfegjeekleffgeelffetjeefieetleeknecukfhppeduvdejrddtrddtrddupddujeeirdduuddurddukedurddujeekpdefjedrheelrddugedvrdelkeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeduvdejrddtrddtrddupdhmrghilhhfrhhomhepshgvrhhgihhirdgumhihthhruhhkseefmhguvggsrdgtohhmpdhnsggprhgtphhtthhopedupdhrtghpthhtohepgigvnhdquggvvhgvlheslhhishhtshdrgigvnhhprhhojhgvtghtrdhorhhgpdfovfetjfhoshhtpehmohehkedvmgdpmhhouggvpehsmhhtphhouhht
DKIM-Signature: a=rsa-sha256; bh=YQ5EvYS0UX2BxNPaB09EH3dTnNR9Dl+4R3DL3BrOTVI=;
 c=relaxed/relaxed; d=3mdeb.com; h=From; s=ovhmo3617313-selector1;
 t=1745419255; v=1;
 b=kbxR1eD51RqHUa/SWWyEA0iqvX5+VHya2hVXuUY4y4xQV0r5bVRGvVHxXSpeeC+nFjHY+Eej
 DPfEAyUCYRmiNSMXhskxg4ksrdekd2j75GM+EkT7GmixRzrHJsrZDSLMukCX/t8xIvcAIg9rbhD
 NDbrMntrzWvwqYGSv1+BucsK1r4psd5G5rjNV+i1E7uKvj0LG9P1rDgX1LF5LwEO9t8MstTlwA4
 3iX+MG6ozLywo15VvX0yl7H5c7Btf1cnFXf3ITeRyt/zHvZfIU2Y5AUMJ/QuMS9izmhLeEZvx4k
 JeBq+Gid7+IoKgWZTnL1lLgF4Cy7LuqHp/4SJZ3kne2Vg==

On Tue, Apr 22, 2025 at 09:23:02PM +0100, Andrew Cooper wrote:
> On 22/04/2025 4:06 pm, Sergii Dmytruk wrote:
> > diff --git a/xen/include/xen/slr_table.h b/xen/include/xen/slr_table.h
> > new file mode 100644
> > index 0000000000..e9dbac5d0a
> > --- /dev/null
> > +++ b/xen/include/xen/slr_table.h
> > @@ -0,0 +1,274 @@
> > +/* SPDX-License-Identifier: GPL-3.0-or-later */
>
> I'm sorry, but we cannot accept this submission.
>
> Xen is GPL-2-only, and can only accept source code compatible with this
> license.  Everything else in this series appears to be compatible (and
> therefore is fine), but this patch is not.
>
> ~Andrew

I think the license comes from GRUB's version which is GPL-3-or-later
while the original Linux header file is GPL-2.  Linux patches is really
the source here.  I don't think anything prevents use of the header
under GPL-2, so I'll change the license in v2.  Adding Ross Philipson to
CC as the original author of both Linux and GRUB versions just in case.

