Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B896AA6A913
	for <lists+xen-devel@lfdr.de>; Thu, 20 Mar 2025 15:51:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.922381.1326280 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tvHEm-0004aV-Mx; Thu, 20 Mar 2025 14:51:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 922381.1326280; Thu, 20 Mar 2025 14:51:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tvHEm-0004Yy-Jq; Thu, 20 Mar 2025 14:51:12 +0000
Received: by outflank-mailman (input) for mailman id 922381;
 Thu, 20 Mar 2025 14:51:11 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1tvHEl-0004Ys-9C
 for xen-devel@lists.xenproject.org; Thu, 20 Mar 2025 14:51:11 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1tvHEl-00F2Bz-0s;
 Thu, 20 Mar 2025 14:51:11 +0000
Received: from [2a02:8012:3a1:0:699c:37d:6a29:da07]
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1tvHEk-00BL5G-2m;
 Thu, 20 Mar 2025 14:51:10 +0000
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
	bh=zEZf0OtUR+cQjWS+fPQk1HeuBMNHxM2Z59FKh+Yw95g=; b=jsUz9vnl1Bx9nxQVYl33mcgX4Y
	6M/2d6NfB/OJ7YGCUHSaYslENrqVr7BO/SAnrWf1JLLMv9u79BJwf3me/8eLWDMLTjhqugOTbZRd/
	La/ElrsE/clm7k61auX23icxwV1BMfuftxKcQoGh9RduZKBIlI1yW/Va0KTZhUj9XavA=;
Message-ID: <b56ecfa0-c0e7-4f4c-8cb1-c148392343b7@xen.org>
Date: Thu, 20 Mar 2025 14:51:09 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.20 0/2] docs/process: Update the branching checklist
Content-Language: en-GB
To: xen-devel@lists.xenproject.org
Cc: Julien Grall <jgrall@amazon.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <20241206194025.31662-1-julien@xen.org>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20241206194025.31662-1-julien@xen.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 06/12/2024 19:40, Julien Grall wrote:
> From: Julien Grall <jgrall@amazon.com>
> 
> Hi all,
> 
> As we approach Xen 4.20, update the branching checklist to match
> the current state of affair.
> 
> Cheers,
> 
> Julien Grall (2):
>    docs/process: branching-checklist: Update the steps to generate the
>      docs
>    docs/process: branching-checklist: Remove any reference to OSSTest
> 
>   docs/process/branching-checklist.txt | 33 ++++------------------------
>   1 file changed, 4 insertions(+), 29 deletions(-)

Ping? It would be good to get the checklist a bit more accurate.

Cheers,


-- 
Julien Grall


