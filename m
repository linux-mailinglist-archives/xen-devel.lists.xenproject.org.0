Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6081DA9748C
	for <lists+xen-devel@lfdr.de>; Tue, 22 Apr 2025 20:34:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.963404.1354415 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u7IR3-0006Vl-Pw; Tue, 22 Apr 2025 18:33:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 963404.1354415; Tue, 22 Apr 2025 18:33:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u7IR3-0006Sd-Mp; Tue, 22 Apr 2025 18:33:33 +0000
Received: by outflank-mailman (input) for mailman id 963404;
 Tue, 22 Apr 2025 18:33:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BiSK=XI=3mdeb.com=sergii.dmytruk@srs-se1.protection.inumbo.net>)
 id 1u7IR1-0006SX-81
 for xen-devel@lists.xenproject.org; Tue, 22 Apr 2025 18:33:32 +0000
Received: from 5.mo561.mail-out.ovh.net (5.mo561.mail-out.ovh.net
 [87.98.178.36]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 48e89b91-1fa8-11f0-9ffb-bf95429c2676;
 Tue, 22 Apr 2025 20:33:28 +0200 (CEST)
Received: from director1.ghost.mail-out.ovh.net (unknown [10.108.17.245])
 by mo561.mail-out.ovh.net (Postfix) with ESMTP id 4ZhrTh0ZcZz1TCg
 for <xen-devel@lists.xenproject.org>; Tue, 22 Apr 2025 18:33:27 +0000 (UTC)
Received: from ghost-submission-5b5ff79f4f-gtld4 (unknown [10.110.168.145])
 by director1.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 8DA4A1FD2D;
 Tue, 22 Apr 2025 18:33:25 +0000 (UTC)
Received: from 3mdeb.com ([37.59.142.101])
 by ghost-submission-5b5ff79f4f-gtld4 with ESMTPSA
 id o4ofGPXgB2jqkQMAtQ4H7w
 (envelope-from <sergii.dmytruk@3mdeb.com>); Tue, 22 Apr 2025 18:33:25 +0000
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
X-Inumbo-ID: 48e89b91-1fa8-11f0-9ffb-bf95429c2676
Authentication-Results:garm.ovh; auth=pass (GARM-101G0040c329dd6-f0cc-4c6a-8bff-12cdd1a88635,
                    7E508E014E7E7C169EB13C6E22C3C4EBF1F0FDD7) smtp.auth=sergii.dmytruk@3mdeb.com
X-OVh-ClientIp:176.111.181.178
Date: Tue, 22 Apr 2025 21:33:19 +0300
From: Sergii Dmytruk <sergii.dmytruk@3mdeb.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
	Lukasz Hawrylko <lukasz@hawrylko.pl>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>,
	Mateusz =?iso-8859-1?Q?M=F3wka?= <mateusz.mowka@intel.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Marek =?iso-8859-1?Q?Marczykowski-G=F3recki?= <marmarek@invisiblethingslab.com>,
	trenchboot-devel@googlegroups.com, xen-devel@lists.xenproject.org
Subject: Re: [PATCH 00/21] x86: Trenchboot Secure Launch DRTM (Xen)
Message-ID: <aAfg725PHN7z-tnm@MjU3Nj>
References: <cover.1745172094.git.sergii.dmytruk@3mdeb.com>
 <6929b073-6a5f-4b34-af5b-96b7b5ac62d6@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6929b073-6a5f-4b34-af5b-96b7b5ac62d6@suse.com>
X-Ovh-Tracer-Id: 16210425385970807897
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvgeeggeeiucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepufgvrhhgihhiucffmhihthhruhhkuceoshgvrhhgihhirdgumhihthhruhhkseefmhguvggsrdgtohhmqeenucggtffrrghtthgvrhhnpedvgfevgedtfffhudegveeiheekteduveeffeegtdeljeelvdefuedtteduieevleenucfkphepuddvjedrtddrtddruddpudejiedrudduuddrudekuddrudejkedpfeejrdehledrudegvddruddtudenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeduvdejrddtrddtrddupdhmrghilhhfrhhomhepshgvrhhgihhirdgumhihthhruhhkseefmhguvggsrdgtohhmpdhnsggprhgtphhtthhopedupdhrtghpthhtohepgigvnhdquggvvhgvlheslhhishhtshdrgigvnhhprhhojhgvtghtrdhorhhgpdfovfetjfhoshhtpehmohehiedumgdpmhhouggvpehsmhhtphhouhht
DKIM-Signature: a=rsa-sha256; bh=einFtMg4Z/CVJOKyceayt3o6jQlFZ4bZlgaRWZCXMUo=;
 c=relaxed/relaxed; d=3mdeb.com; h=From; s=ovhmo3617313-selector1;
 t=1745346808; v=1;
 b=TtH9FP4LvPh4nYj5SckqAEur3JBV9psGGllwK5skWoHbfaVNWaiJkOKD/wa2dz2i8nJxnJBN
 hTct/RRCL+Bkq/uq/sFR4tq3pL95ZSZIYnkgr8l9DAyf8wljFsgRNwJyJBs72HvvyxdsKg2KIuS
 aZJpUXqyJVRuu72UNrWWDxlwqCHdmGemFmISFvjOeW9eYnET7rtHuYVGnyFoO/dDhhdaEjPa91S
 VenuUYqOELg0okKL8abXeafmQ3ezOgsnhfYS1HuzT8QaRDpU/U2+EGypY6b0am6MSYpaNT1zMyn
 65TYBKG8XCEkwzfCM8uZuNR6aNGocTt3foxC/gBMXc3TA==

On Tue, Apr 22, 2025 at 05:23:30PM +0200, Jan Beulich wrote:
> Just one basic nit right here: In the names of new files you add, please
> prefer dashes over underscores.

I wasn't aware of this preference, will be updated in the next version.

> Jan

