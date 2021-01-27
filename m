Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1690E3065D2
	for <lists+xen-devel@lfdr.de>; Wed, 27 Jan 2021 22:16:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.76453.137985 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l4sAm-00065P-As; Wed, 27 Jan 2021 21:16:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 76453.137985; Wed, 27 Jan 2021 21:16:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l4sAm-000650-7k; Wed, 27 Jan 2021 21:16:20 +0000
Received: by outflank-mailman (input) for mailman id 76453;
 Wed, 27 Jan 2021 21:16:19 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5d38=G6=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1l4sAl-00064v-Ht
 for xen-devel@lists.xenproject.org; Wed, 27 Jan 2021 21:16:19 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 974d2025-6537-49d1-8811-d0661bca35f3;
 Wed, 27 Jan 2021 21:16:18 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7B58D64DA1;
 Wed, 27 Jan 2021 21:16:17 +0000 (UTC)
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
X-Inumbo-ID: 974d2025-6537-49d1-8811-d0661bca35f3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1611782178;
	bh=mrI/wQjfA020uccYIAh4Pd1rMHuGfeGLM+Ss0mmowjI=;
	h=Date:From:To:cc:Subject:From;
	b=elfRF6Ew8oYu29KqwlkpkVCglmktjDY4OfQjsHhi8QTlIWDD0ubo2PlfF/RuzldT4
	 j/V0uXSHKP4kV9soA375FnryRHwUe0lq7sK0yWLL1opYeaQzHxjIL8ngbhw0eiqEB5
	 9bU0s8pLmyUCEY67ZIXCedqepfWekbKzHsXxtz4wXqPr+UGO/R7aVTZoWwpYoe7eM5
	 hdJlVBnDgKrUJVbGid5oaS9DEZNaGpz29DWVBtovgc8obJY/4W028uugHBBVd+NSVd
	 Sf0EycBtKgDCzbu9yZFANFhddBTVxkp/p83OnVE8yj/4RYHCF0OSk7FT47CPuoJg1W
	 dGzoR1woorEHg==
Date: Wed, 27 Jan 2021 13:16:16 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Doug Goldstein <cardoe@cardoe.com>, "fam@euphon.net" <fam@euphon.net>, 
    andrew.cooper3@citrix.com, Bertrand.Marquis@arm.com, famzheng@amazon.com, 
    wl@xen.org, julien@xen.org, jbeulich@suse.com
cc: sstabellini@kernel.org, xen-devel@lists.xenproject.org
Subject: more randconfig failures
Message-ID: <alpine.DEB.2.21.2101271311470.9684@sstabellini-ThinkPad-T480s>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

Hi all,

These are two recent randconfig build failures reported by gitlab (the
two patches that triggered the CI-loop are two patches to the
MAINTAINERS file -- certainly not the cause of the build issues):

x86 randconfig failure:
https://gitlab.com/xen-project/patchew/xen/-/jobs/990347647

arm randconfig failure:
https://gitlab.com/xen-project/patchew/xen/-/jobs/990335472

Cheers,

Stefano

