Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 748FF64BB3D
	for <lists+xen-devel@lfdr.de>; Tue, 13 Dec 2022 18:41:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.461002.719023 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p59H0-0005fP-1a; Tue, 13 Dec 2022 17:40:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 461002.719023; Tue, 13 Dec 2022 17:40:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p59Gz-0005cC-Uy; Tue, 13 Dec 2022 17:40:57 +0000
Received: by outflank-mailman (input) for mailman id 461002;
 Tue, 13 Dec 2022 17:40:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lPgA=4L=infradead.org=rdunlap@srs-se1.protection.inumbo.net>)
 id 1p59Gy-0005c6-Lt
 for xen-devel@lists.xenproject.org; Tue, 13 Dec 2022 17:40:57 +0000
Received: from bombadil.infradead.org (bombadil.infradead.org
 [2607:7c80:54:3::133])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4ac89af9-7b0d-11ed-8fd2-01056ac49cbb;
 Tue, 13 Dec 2022 18:40:54 +0100 (CET)
Received: from [2601:1c2:d80:3110::a2e7]
 by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1p59Gm-003nu3-Vf; Tue, 13 Dec 2022 17:40:45 +0000
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
X-Inumbo-ID: 4ac89af9-7b0d-11ed-8fd2-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=j0UALbMgWQAz5SBhNk+ZMMQCCxLWBTsG/ugs2SigX6o=; b=vCmNDThnkvzF3Biq7JJkRv7Xcg
	aTFh6YkGjF35i1JLHTPvsrfPImXzCU7eOVVkI/ZQoHnryV9KObeBeF/Eco9A0EFzhx2sVqgfHikFN
	GFL8t6pu9lATlmlSrs1lodMlJxNjllhEH1o0R8Rky9dSL3CmoJTck11v2E+9/bZ8UmsissbqOmLhz
	IBbnVgBSTY6DLUII/lQ0zgx9PzhtML+pHEAH44iirFg7apYqSOtWv/rjVdw6/HhOHvJ3XTm0Eg1Yy
	6woAwfosCYydMeZ+y+A3knS3QIhyABCHUz1pXK/XMm0fVUtjihuxzZ5VANIsdS+ws3rdyMZ9hJoqR
	1jbBmqIA==;
Message-ID: <33fd0ddb-c2dc-c403-a742-bac32d24825c@infradead.org>
Date: Tue, 13 Dec 2022 09:40:44 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH] arch: change variable types to match those of what is
 assigned to them
Content-Language: en-US
To: "Seija K." <doremylover123@gmail.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Chris Zankel <chris@zankel.net>, Max Filippov <jcmvbkbc@gmail.com>
Cc: linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org,
 linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org
References: <CAA42iKx2f2LsAQ9C5rxnCTPhOB6n+L35Winc5WK1K2EySAjvXA@mail.gmail.com>
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <CAA42iKx2f2LsAQ9C5rxnCTPhOB6n+L35Winc5WK1K2EySAjvXA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

Please look at
  https://lore.kernel.org/lkml/CAA42iKx2f2LsAQ9C5rxnCTPhOB6n+L35Winc5WK1K2EySAjvXA@mail.gmail.com/T/#u

and see if that matches what you thought you sent as a patch.

The gmail web interface is notorious for dropping tabs in emails.


On 12/13/22 09:35, Seija K. wrote:
> There are many places where "int len = strlen(foo);" is written, just
> for len to be passed as a parameter of size_t. This causes truncation
> and then expansion back from int to size_t. Not to mention this is
> poor logic and needless truncations can add extra unneeded
> instructions.
> 
> This patch aims to fix the worst offenders.
> 
> Signed-off-by: Seija Kijin <doremylover123@gmail.com>
> ---
>  arch/arm/mm/mmu.c                      | 30 +++++++++++++-------------
>  arch/arm/probes/kprobes/test-core.c    |  8 +++----
>  arch/arm/vfp/vfpmodule.c               |  4 ++--
>  arch/arm/xen/p2m.c                     |  4 ++--
>  arch/mips/alchemy/common/irq.c         |  2 +-
>  arch/mips/alchemy/common/prom.c        |  2 +-
>  arch/mips/alchemy/devboards/bcsr.c     |  2 +-
>  arch/mips/alchemy/devboards/platform.c |  8 +++----
>  arch/mips/ar7/prom.c                   |  4 ++--
>  arch/mips/boot/compressed/dbg.c        | 14 +++++-------
>  arch/mips/fw/arc/cmdline.c             |  4 ++--
>  arch/xtensa/platforms/iss/console.c    |  4 ++--
>  12 files changed, 41 insertions(+), 45 deletions(-)
> 


-- 
~Randy

