Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 15F0DA97A56
	for <lists+xen-devel@lfdr.de>; Wed, 23 Apr 2025 00:20:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.963717.1354671 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u7Lyo-0002hf-Cn; Tue, 22 Apr 2025 22:20:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 963717.1354671; Tue, 22 Apr 2025 22:20:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u7Lyo-0002ew-AA; Tue, 22 Apr 2025 22:20:38 +0000
Received: by outflank-mailman (input) for mailman id 963717;
 Tue, 22 Apr 2025 22:20:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BiSK=XI=3mdeb.com=sergii.dmytruk@srs-se1.protection.inumbo.net>)
 id 1u7Lyn-0002ep-2R
 for xen-devel@lists.xenproject.org; Tue, 22 Apr 2025 22:20:37 +0000
Received: from 2.mo583.mail-out.ovh.net (2.mo583.mail-out.ovh.net
 [178.33.109.111]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 02ca4b4e-1fc8-11f0-9ffb-bf95429c2676;
 Wed, 23 Apr 2025 00:20:35 +0200 (CEST)
Received: from director7.ghost.mail-out.ovh.net (unknown [10.108.17.88])
 by mo583.mail-out.ovh.net (Postfix) with ESMTP id 4ZhxWk3g79z1d8F
 for <xen-devel@lists.xenproject.org>; Tue, 22 Apr 2025 22:20:34 +0000 (UTC)
Received: from ghost-submission-5b5ff79f4f-g4n6d (unknown [10.110.113.153])
 by director7.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 7156D1FE5A;
 Tue, 22 Apr 2025 22:20:33 +0000 (UTC)
Received: from 3mdeb.com ([37.59.142.96])
 by ghost-submission-5b5ff79f4f-g4n6d with ESMTPSA
 id RYJNDDEWCGgZCgsAXdXU8Q
 (envelope-from <sergii.dmytruk@3mdeb.com>); Tue, 22 Apr 2025 22:20:33 +0000
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
X-Inumbo-ID: 02ca4b4e-1fc8-11f0-9ffb-bf95429c2676
Authentication-Results:garm.ovh; auth=pass (GARM-96R001f2a1d7d1-30d0-4ccc-a361-6b7b42468a05,
                    E44920665798B4DCDE3BF656E3E0060933CCD35A) smtp.auth=sergii.dmytruk@3mdeb.com
X-OVh-ClientIp:176.111.181.178
Date: Wed, 23 Apr 2025 01:20:27 +0300
From: Sergii Dmytruk <sergii.dmytruk@3mdeb.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: xen-devel@lists.xenproject.org,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	trenchboot-devel@googlegroups.com
Subject: Re: [PATCH 10/21] lib/sha256.c: add file
Message-ID: <aAgWK7GhHw3oFel-@MjU3Nj>
References: <cover.1745172094.git.sergii.dmytruk@3mdeb.com>
 <92b461c8d5981a523293341346274b6cc1b76d9b.1745172094.git.sergii.dmytruk@3mdeb.com>
 <233f9fd0-b531-4373-998e-1e7295357ae2@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <233f9fd0-b531-4373-998e-1e7295357ae2@citrix.com>
X-Ovh-Tracer-Id: 1599340821330637980
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvgeegleduucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggugfgjsehtkeertddttddunecuhfhrohhmpefuvghrghhiihcuffhmhihtrhhukhcuoehsvghrghhiihdrughmhihtrhhukhesfehmuggvsgdrtghomheqnecuggftrfgrthhtvghrnhepueeiudeuveffkeetveelgeehhffgheehgfegjeekleffgeelffetjeefieetleeknecukfhppeduvdejrddtrddtrddupddujeeirdduuddurddukedurddujeekpdefjedrheelrddugedvrdelieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeduvdejrddtrddtrddupdhmrghilhhfrhhomhepshgvrhhgihhirdgumhihthhruhhkseefmhguvggsrdgtohhmpdhnsggprhgtphhtthhopedupdhrtghpthhtohepgigvnhdquggvvhgvlheslhhishhtshdrgigvnhhprhhojhgvtghtrdhorhhgpdfovfetjfhoshhtpehmohehkeefmgdpmhhouggvpehsmhhtphhouhht
DKIM-Signature: a=rsa-sha256; bh=mz9QouMr9hCMdijmlJGXuoPiKE2mobEEixq3BIjpuQY=;
 c=relaxed/relaxed; d=3mdeb.com; h=From; s=ovhmo3617313-selector1;
 t=1745360434; v=1;
 b=ImqZB+cvBT6K/xVfa4X0l/oE/a8zQuDcuvY83t/FIES3n10fHb1/67Px6YopSrqaejnLGTjp
 MEFb+MXmSIrU9wapGbJuzIsNKYPCMHcL/JBZC1D8cQXTM88bweS0ZaBC/nxpgqxxCvMmk5fqGJ9
 MjhiqXaoRyZkMrF9yTs1zQfIF8yxVCrn8gy+fgiQM/1nINCYgJCxqNfVRqrrOYxhRQA3yDRc/Wa
 pOQ7gy5nlTwp29KGprcN2jdtKSu7WL4fiNB3NvGVHSWqPyPx4Y7TOU14tbUpGVbE1iD4sbjPsBk
 bkFwY/disMCOw/rBpHhbPNx3u0SyV388Jw7gCySt7fQ5w==

On Tue, Apr 22, 2025 at 04:37:10PM +0100, Andrew Cooper wrote:
> On 22/04/2025 4:06 pm, Sergii Dmytruk wrote:
> >  xen/include/xen/sha256.h |  12 ++
> >  xen/lib/Makefile         |   1 +
> >  xen/lib/sha256.c         | 238 +++++++++++++++++++++++++++++++++++++++
> >  3 files changed, 251 insertions(+)
> >  create mode 100644 xen/include/xen/sha256.h
> >  create mode 100644 xen/lib/sha256.c
> 
> I added SHA2 a little while back, derived from the Trenchboot tree.
> 
> See 372af524411f5a013bcb0b117073d8d07c026563 (and a few follow-up fixes).
> 
> It should have everything needed, but we can adjust if necessary.
> 
> We need to integrate SHA1 in a similar way.  Xen now has various MISRA
> requirements to adhere to, which requires some adjustments, but I can
> advise if it isn't clear from the sha2 work I already did.
> 
> ~Andrew

Oh, I actually checked for existing hash implementations before sending
the patches...  Need to remove untracked files which made it hard to see
the new file.

Thanks, I think I figured out the modifications you've made for SHA256
and almost done getting rid of macros for SHA1.

