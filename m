Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 447B4ABBF6A
	for <lists+xen-devel@lfdr.de>; Mon, 19 May 2025 15:44:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.989854.1373814 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uH0mR-0000fS-SX; Mon, 19 May 2025 13:43:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 989854.1373814; Mon, 19 May 2025 13:43:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uH0mR-0000dW-Pl; Mon, 19 May 2025 13:43:47 +0000
Received: by outflank-mailman (input) for mailman id 989854;
 Mon, 19 May 2025 13:43:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4+Ui=YD=3mdeb.com=sergii.dmytruk@srs-se1.protection.inumbo.net>)
 id 1uH0mP-0000dQ-Cj
 for xen-devel@lists.xenproject.org; Mon, 19 May 2025 13:43:46 +0000
Received: from 5.mo584.mail-out.ovh.net (5.mo584.mail-out.ovh.net
 [188.165.44.50]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 47de116a-34b7-11f0-a2fa-13f23c93f187;
 Mon, 19 May 2025 15:43:44 +0200 (CEST)
Received: from director8.ghost.mail-out.ovh.net (unknown [10.109.148.103])
 by mo584.mail-out.ovh.net (Postfix) with ESMTP id 4b1Jmv2wv5z1WFX
 for <xen-devel@lists.xenproject.org>; Mon, 19 May 2025 13:43:43 +0000 (UTC)
Received: from ghost-submission-5b5ff79f4f-jlhst (unknown [10.110.96.141])
 by director8.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 28D541FE78;
 Mon, 19 May 2025 13:43:41 +0000 (UTC)
Received: from 3mdeb.com ([37.59.142.107])
 by ghost-submission-5b5ff79f4f-jlhst with ESMTPSA
 id HNuoAI01K2gX0wAA+5S5jQ
 (envelope-from <sergii.dmytruk@3mdeb.com>); Mon, 19 May 2025 13:43:41 +0000
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
X-Inumbo-ID: 47de116a-34b7-11f0-a2fa-13f23c93f187
Authentication-Results:garm.ovh; auth=pass (GARM-107S00143373b8b-0648-41e1-bff3-41c18edd9b75,
                    FE7BE141BF42593818D4E9FBE246C5489A14F897) smtp.auth=sergii.dmytruk@3mdeb.com
X-OVh-ClientIp:176.111.184.221
Date: Mon, 19 May 2025 16:43:37 +0300
From: Sergii Dmytruk <sergii.dmytruk@3mdeb.com>
To: Rich Persaud <persaur@gmail.com>
Cc: Andrew Cooper <Andrew.Cooper3@citrix.com>,
	xen-devel@lists.xenproject.org,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>,
	Ross Philipson <ross.philipson@oracle.com>,
	Jan Beulich <jbeulich@suse.com>,
	Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
	Lukasz Hawrylko <lukasz@hawrylko.pl>,
	Mateusz =?iso-8859-1?Q?M=F3wka?= <mateusz.mowka@intel.com>,
	trenchboot-devel@googlegroups.com
Subject: Re: [PATCH v2 01/22] x86/include/asm/intel-txt.h: constants and
 accessors for TXT registers and heap
Message-ID: <aCs1iQp6AH0pNaKH@MjU3Nj>
References: <aCoohV1Ue0NBKmSL@MjU3Nj>
 <29FDCB46-CA92-4A30-B96C-3851414902EF@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <29FDCB46-CA92-4A30-B96C-3851414902EF@gmail.com>
X-Ovh-Tracer-Id: 3859303408682120348
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdefvdduheefucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepufgvrhhgihhiucffmhihthhruhhkuceoshgvrhhgihhirdgumhihthhruhhkseefmhguvggsrdgtohhmqeenucggtffrrghtthgvrhhnpedtgfeuudevuefgtdejffelgfefvddtgfeffeeuhfefvdefvdfftdfhtedviefhkeenucffohhmrghinhepihhnthgvlhdrtghomhenucfkphepuddvjedrtddrtddruddpudejiedrudduuddrudekgedrvddvuddpfeejrdehledrudegvddruddtjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeduvdejrddtrddtrddupdhmrghilhhfrhhomhepshgvrhhgihhirdgumhihthhruhhkseefmhguvggsrdgtohhmpdhnsggprhgtphhtthhopedupdhrtghpthhtohepgigvnhdquggvvhgvlheslhhishhtshdrgigvnhhprhhojhgvtghtrdhorhhgpdfovfetjfhoshhtpehmohehkeegmgdpmhhouggvpehsmhhtphhouhht
DKIM-Signature: a=rsa-sha256; bh=TYHtPGPtfed8FBcL1Nga6Um7NXyWctjrCYFBVDWqkQw=;
 c=relaxed/relaxed; d=3mdeb.com; h=From; s=ovhmo3617313-selector1;
 t=1747662223; v=1;
 b=N0708t/jKX5YspetJPdyWon3mS0wJEM/XWDrWUyw1VEQLy9s6F6BStdG5BLBDcC+JycPjFzP
 Qzj1oFx/nldbS87Zhu7vjWsNQ3GU+bBV3KCMjPg1a1LpWuW08KM9/Gwv5oSsFtUJNhhx4euos+g
 954BBLPse78L076EOLLapsW0Ei5D9ZIe0vaEKmucZ1Gkea/kNwOh+LR1QaNVORq8LlfaTIsLJ93
 Dn6BsAa4KbTNyXW4QcgS7WWXtLBfI7XZoqdtx7MR1vog2zmI/R3tFT4nZAR8Ok1Qkk4fpiAcBps
 KjQFjAbLFms4zC+jnqP0MOcsTj03IK5jPsEUdIfTv2t2g==

On Sun, May 18, 2025 at 07:31:49PM -0400, Rich Persaud wrote:
> If there's no stable URL for the TXT spec, can we mirror the relevant
> doc(s) somewhere in the Xen docs tree? A trusted archive of the spec
> for trusted execution.
>
> Rich

By "unversioned link to Software Development Guide" I meant
https://www.intel.com/content/www/us/en/content-details/315168/
which always provides the latest version.

Regards

