Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FEE69E0D28
	for <lists+xen-devel@lfdr.de>; Mon,  2 Dec 2024 21:41:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.847075.1262212 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tIDEH-0006kO-DQ; Mon, 02 Dec 2024 20:41:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 847075.1262212; Mon, 02 Dec 2024 20:41:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tIDEH-0006hA-AL; Mon, 02 Dec 2024 20:41:13 +0000
Received: by outflank-mailman (input) for mailman id 847075;
 Mon, 02 Dec 2024 20:41:11 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1tIDEF-0006h4-Sb
 for xen-devel@lists.xenproject.org; Mon, 02 Dec 2024 20:41:11 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1tIDEF-000OkB-19;
 Mon, 02 Dec 2024 20:41:11 +0000
Received: from [2a02:8012:3a1:0:c6e:c614:26eb:b495]
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1tIDEF-00B8gp-1U;
 Mon, 02 Dec 2024 20:41:11 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID;
	bh=IwjUOjUCOLRRP5/usm2FAj4h21fTUA/W25Y3l5SSqDE=; b=R+lRUJ6CbzBPtntmGqT6nqFlOo
	Y0OmqK044uyaTklTNTrOlOfDsolSI6vHfhIRq4AyGUgWmM8tkCvV6atqd1+UmgbBLY1/6atpm3UvX
	c3h4rr3vDHNUJ2B05YaPu+DmIMmzBXO3rKzJjwpq7ctIncNcAwTbX6Tc19/juthrnxhY=;
Message-ID: <02cfc279-bac3-47f7-b2dc-859eb1573e2d@xen.org>
Date: Mon, 2 Dec 2024 20:41:09 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/5] arm/setup: Move MMU specific extern declarations
 to mmu/setup.h
Content-Language: en-GB
To: Luca Fancellu <luca.fancellu@arm.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20241129091237.3409304-1-luca.fancellu@arm.com>
 <20241129091237.3409304-3-luca.fancellu@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20241129091237.3409304-3-luca.fancellu@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Luca,

On 29/11/2024 09:12, Luca Fancellu wrote:
> Move some extern declarations related to MMU structures and define
> from asm/setup.h to asm/mmu/setup.h, in order to increase encapsulation
> and allow the MPU part to build, since it has no clue about them.
> 
> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>

Acked-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall


