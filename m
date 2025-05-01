Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 00A9EAA5D8A
	for <lists+xen-devel@lfdr.de>; Thu,  1 May 2025 13:03:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.974067.1362026 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uARhM-0004YB-Bq; Thu, 01 May 2025 11:03:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 974067.1362026; Thu, 01 May 2025 11:03:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uARhM-0004Wh-8i; Thu, 01 May 2025 11:03:24 +0000
Received: by outflank-mailman (input) for mailman id 974067;
 Thu, 01 May 2025 11:03:22 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1uARhK-0004WU-4l
 for xen-devel@lists.xenproject.org; Thu, 01 May 2025 11:03:22 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1uARhJ-000xQl-1F;
 Thu, 01 May 2025 11:03:21 +0000
Received: from [15.248.2.31] (helo=[10.24.66.15])
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1uARhJ-00G80t-0E;
 Thu, 01 May 2025 11:03:21 +0000
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
	bh=2bfAWTc3WSg1t/aQgSpvC/keNzvKcxaROH18zymswN0=; b=eDv/qbMY0UOLQMmPoGVwjJ/oqr
	CtE41BjxJGyZp1r+8/qclMxufwDEa/hQ+9JhnX0uSU/ldOm3r9DwnOs0Kwz9A69s0+h6uA7CaR0QF
	fNhxTSG0qPR/bgLZTYmJwIQXGzHG8POx2wkUNj/RjIYbhK3V+SHCHpIncBFJldJr8I38=;
Message-ID: <1ab8612c-b47c-4b61-b9cf-d90b2363b19b@xen.org>
Date: Thu, 1 May 2025 12:03:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mm: move paddr_to_pdx()
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Shawn Anastasio <sanastasio@raptorengineering.com>
References: <262b9929-5cbd-4bb1-ac2a-35916273cba5@suse.com>
Content-Language: en-GB
From: Julien Grall <julien@xen.org>
In-Reply-To: <262b9929-5cbd-4bb1-ac2a-35916273cba5@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Jan,

On 30/04/2025 16:56, Jan Beulich wrote:
> There's nothing arch-specific about it.
> 
> While there, on x86 visually separate the vmap_to_*() macros from those
> covered by the earlier comment.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall


