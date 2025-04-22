Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 90360A97A42
	for <lists+xen-devel@lfdr.de>; Wed, 23 Apr 2025 00:15:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.963694.1354651 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u7Ltl-0000bs-Nd; Tue, 22 Apr 2025 22:15:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 963694.1354651; Tue, 22 Apr 2025 22:15:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u7Ltl-0000Zz-Kn; Tue, 22 Apr 2025 22:15:25 +0000
Received: by outflank-mailman (input) for mailman id 963694;
 Tue, 22 Apr 2025 22:15:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BiSK=XI=3mdeb.com=sergii.dmytruk@srs-se1.protection.inumbo.net>)
 id 1u7Ltj-0000Zt-RY
 for xen-devel@lists.xenproject.org; Tue, 22 Apr 2025 22:15:24 +0000
Received: from 9.mo575.mail-out.ovh.net (9.mo575.mail-out.ovh.net
 [46.105.78.111]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4777a149-1fc7-11f0-9ffb-bf95429c2676;
 Wed, 23 Apr 2025 00:15:20 +0200 (CEST)
Received: from director6.ghost.mail-out.ovh.net (unknown [10.108.9.148])
 by mo575.mail-out.ovh.net (Postfix) with ESMTP id 4ZhxPh1cNCz1nZ4
 for <xen-devel@lists.xenproject.org>; Tue, 22 Apr 2025 22:15:20 +0000 (UTC)
Received: from ghost-submission-5b5ff79f4f-wxqb8 (unknown [10.111.174.155])
 by director6.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 5ED371FD1E;
 Tue, 22 Apr 2025 22:15:18 +0000 (UTC)
Received: from 3mdeb.com ([37.59.142.97])
 by ghost-submission-5b5ff79f4f-wxqb8 with ESMTPSA
 id XYn9BPYUCGgZaQIAj6qUzw
 (envelope-from <sergii.dmytruk@3mdeb.com>); Tue, 22 Apr 2025 22:15:18 +0000
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
X-Inumbo-ID: 4777a149-1fc7-11f0-9ffb-bf95429c2676
Authentication-Results:garm.ovh; auth=pass (GARM-97G00297444c32-6e75-4c2b-82dc-193c2c9f8288,
                    E44920665798B4DCDE3BF656E3E0060933CCD35A) smtp.auth=sergii.dmytruk@3mdeb.com
X-OVh-ClientIp:176.111.181.178
Date: Wed, 23 Apr 2025 01:15:08 +0300
From: Sergii Dmytruk <sergii.dmytruk@3mdeb.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Krystian Hebel <krystian.hebel@3mdeb.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
	Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	trenchboot-devel@googlegroups.com, xen-devel@lists.xenproject.org
Subject: Re: [PATCH 09/21] lib/sha1.c: add file
Message-ID: <aAgU7Oy_wkNYmgBF@MjU3Nj>
References: <cover.1745172094.git.sergii.dmytruk@3mdeb.com>
 <8dec423182ed60e2233ed87d98066fed6dc20caf.1745172094.git.sergii.dmytruk@3mdeb.com>
 <a0dcf27e-a066-4e5f-97b2-e5f178e1b941@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a0dcf27e-a066-4e5f-97b2-e5f178e1b941@suse.com>
X-Ovh-Tracer-Id: 1510676202228397145
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvgeegledtucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepufgvrhhgihhiucffmhihthhruhhkuceoshgvrhhgihhirdgumhihthhruhhkseefmhguvggsrdgtohhmqeenucggtffrrghtthgvrhhnpedvgfevgedtfffhudegveeiheekteduveeffeegtdeljeelvdefuedtteduieevleenucfkphepuddvjedrtddrtddruddpudejiedrudduuddrudekuddrudejkedpfeejrdehledrudegvddrleejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepuddvjedrtddrtddruddpmhgrihhlfhhrohhmpehsvghrghhiihdrughmhihtrhhukhesfehmuggvsgdrtghomhdpnhgspghrtghpthhtohepuddprhgtphhtthhopeigvghnqdguvghvvghlsehlihhsthhsrdigvghnphhrohhjvggtthdrohhrghdpoffvtefjohhsthepmhhoheejhegmpdhmohguvgepshhmthhpohhuth
DKIM-Signature: a=rsa-sha256; bh=osNLxsaFq2SShPgkGKDtrQZzGauLYum/aG085GmJLN0=;
 c=relaxed/relaxed; d=3mdeb.com; h=From; s=ovhmo3617313-selector1;
 t=1745360120; v=1;
 b=Z10R59jeAQYmApd14Qg2mFnVGWZUE58hmoUDTVgLxg82z/o2QawKlXkVedepTQEWwqb4Ddv7
 hCC3JwBfGO6ShT+4PUxA3+8K+S+uPNkqfhE3eFPrJU6T/2Af0bHMPqRhBr9zuUeSthb7yBxT6U3
 KnQaM8D7K2e2AHF5jc0426t43+CfRzWM1OIfKTxNnQjnDHp2DhR7A2xn/esD/Sq3hjTuIFWPV6T
 /pxRhud4X/tLYCb2+nfdbImTG5ZvqqnWkZ7T+vrJ9UEx5lPU4iv+qjvlQ660nWrsIskGX5SNjCN
 WwX3AVPR3Y7kNNomN0ZlGGsBRRj1wQUKFugWUVXHWRblg==

On Tue, Apr 22, 2025 at 05:36:22PM +0200, Jan Beulich wrote:
> On 22.04.2025 17:06, Sergii Dmytruk wrote:
> > From: Krystian Hebel <krystian.hebel@3mdeb.com>
> >
> > The code comes from [1] and is licensed under GPL-2.0 license.
> > It's a combination of:
> >  - include/crypto/sha1.h
> >  - include/crypto/sha1_base.h
> >  - lib/crypto/sha1.c
> >  - crypto/sha1_generic.c
> >
> > Changes:
> >  - includes
> >  - formatting
> >  - renames and splicing of some trivial functions that are called once
> >  - dropping of `int` return values (only zero was ever returned)
> >  - getting rid of references to `struct shash_desc`
>
> Since you did move the code to (largely) Xen style, a few further requests
> in that direction:

Rewriting the patch due to a comment by Andrew Cooper obsoletes most of
your comments, but thanks for them anyway.

>
> Jan

