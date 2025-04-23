Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DC613A98DA4
	for <lists+xen-devel@lfdr.de>; Wed, 23 Apr 2025 16:48:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.964857.1355550 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u7bOL-0007Yf-Fw; Wed, 23 Apr 2025 14:48:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 964857.1355550; Wed, 23 Apr 2025 14:48:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u7bOL-0007WM-DM; Wed, 23 Apr 2025 14:48:01 +0000
Received: by outflank-mailman (input) for mailman id 964857;
 Wed, 23 Apr 2025 14:48:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Oonq=XJ=3mdeb.com=sergii.dmytruk@srs-se1.protection.inumbo.net>)
 id 1u7bOK-0007WB-El
 for xen-devel@lists.xenproject.org; Wed, 23 Apr 2025 14:48:00 +0000
Received: from 15.mo582.mail-out.ovh.net (15.mo582.mail-out.ovh.net
 [188.165.39.161]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f32b11be-2051-11f0-9eb0-5ba50f476ded;
 Wed, 23 Apr 2025 16:47:59 +0200 (CEST)
Received: from director5.ghost.mail-out.ovh.net (unknown [10.108.9.217])
 by mo582.mail-out.ovh.net (Postfix) with ESMTP id 4ZjMR26cP6z1XpD
 for <xen-devel@lists.xenproject.org>; Wed, 23 Apr 2025 14:47:58 +0000 (UTC)
Received: from ghost-submission-5b5ff79f4f-sxg4f (unknown [10.110.178.62])
 by director5.ghost.mail-out.ovh.net (Postfix) with ESMTPS id BE1D41FEAC;
 Wed, 23 Apr 2025 14:47:57 +0000 (UTC)
Received: from 3mdeb.com ([37.59.142.108])
 by ghost-submission-5b5ff79f4f-sxg4f with ESMTPSA
 id DqReIJ39CGhFBAEAP1tegQ
 (envelope-from <sergii.dmytruk@3mdeb.com>); Wed, 23 Apr 2025 14:47:57 +0000
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
X-Inumbo-ID: f32b11be-2051-11f0-9eb0-5ba50f476ded
Authentication-Results:garm.ovh; auth=pass (GARM-108S002df50f58f-454b-4d95-ab4a-92a8a1f5825d,
                    E44920665798B4DCDE3BF656E3E0060933CCD35A) smtp.auth=sergii.dmytruk@3mdeb.com
X-OVh-ClientIp:176.111.181.178
Date: Wed, 23 Apr 2025 17:47:52 +0300
From: Sergii Dmytruk <sergii.dmytruk@3mdeb.com>
To: ross.philipson@oracle.com
Cc: xen-devel@lists.xenproject.org,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	trenchboot-devel@googlegroups.com
Subject: Re: [PATCH 02/21] include/xen/slr_table.h: Secure Launch Resource
 Table definitions
Message-ID: <aAj9mO3btAWZbOJp@MjU3Nj>
References: <cover.1745172094.git.sergii.dmytruk@3mdeb.com>
 <1cf5d940e666b2b292fc84ed1fbb8a95cd57f027.1745172094.git.sergii.dmytruk@3mdeb.com>
 <87ad3627-088c-442b-bc2b-89586a082599@oracle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87ad3627-088c-442b-bc2b-89586a082599@oracle.com>
X-Ovh-Tracer-Id: 18275044338899399836
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvgeeikeekucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepufgvrhhgihhiucffmhihthhruhhkuceoshgvrhhgihhirdgumhihthhruhhkseefmhguvggsrdgtohhmqeenucggtffrrghtthgvrhhnpedvgfevgedtfffhudegveeiheekteduveeffeegtdeljeelvdefuedtteduieevleenucfkphepuddvjedrtddrtddruddpudejiedrudduuddrudekuddrudejkedpfeejrdehledrudegvddruddtkeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeduvdejrddtrddtrddupdhmrghilhhfrhhomhepshgvrhhgihhirdgumhihthhruhhkseefmhguvggsrdgtohhmpdhnsggprhgtphhtthhopedupdhrtghpthhtohepgigvnhdquggvvhgvlheslhhishhtshdrgigvnhhprhhojhgvtghtrdhorhhgpdfovfetjfhoshhtpehmohehkedvmgdpmhhouggvpehsmhhtphhouhht
DKIM-Signature: a=rsa-sha256; bh=xmDgX+t7hWLL3GNBzsUxQaUa6SOlkP02w/6Pi8y0zG0=;
 c=relaxed/relaxed; d=3mdeb.com; h=From; s=ovhmo3617313-selector1;
 t=1745419679; v=1;
 b=gJG6CVAGgtTtLelo2p+9E2IA6K0Tn6QNt1ib/NRk44bv50tj69/XyBsiqsSFypnc6lzOI4jI
 l+zacRxXW88dVrVy23iboa8xb4XbM1SPdDBVP3dVRBZNTYhBzafkYgxLGBsQ5603EvT5jwT9vZ3
 gf74lsr+J/QUMFaUQWBmr1A/n6OZvS7VwJcER9DkaBMQyPhiAoX3CL4c+jTUaFsU6dlZj3LmHkB
 7e79fNZnJHLumDHE7dYbcp+ecBupVMvezDLJnOxn6n6Crzm1LKqWShJpg99WkVg2/hymaQImEXg
 1/DnNixVsFfBBLieCeg+5ZKjRy2uThZtmVUKWUAffY/ng==

On Tue, Apr 22, 2025 at 01:46:14PM -0700, ross.philipson@oracle.com wrote:
> > +
> > +/*
> > + * ARM DRTM Info table
> > + */
> > +struct slr_entry_arm_info
> > +{
> > +    struct slr_entry_hdr hdr;
> > +} __packed;
>
> You can probably ditch this for now.

Right, it has no value at this point.

> I am surprised you did not need the slr_add_entry() function. How do you add
> entries to the SLRT?

Xen doesn't add any SLRT entries.  It's also the final consumer of the
SLRT, at least at the moment, so no need to update something that won't
be used again.

> Thanks
> Ross

