Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 25168811944
	for <lists+xen-devel@lfdr.de>; Wed, 13 Dec 2023 17:26:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.654111.1020794 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rDS3E-0003JU-Aq; Wed, 13 Dec 2023 16:25:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 654111.1020794; Wed, 13 Dec 2023 16:25:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rDS3E-0003Gh-7o; Wed, 13 Dec 2023 16:25:36 +0000
Received: by outflank-mailman (input) for mailman id 654111;
 Wed, 13 Dec 2023 16:25:34 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1rDS3C-0003Gb-RQ
 for xen-devel@lists.xenproject.org; Wed, 13 Dec 2023 16:25:34 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rDS3C-000540-7L; Wed, 13 Dec 2023 16:25:34 +0000
Received: from 54-240-197-238.amazon.com ([54.240.197.238] helo=[192.168.3.12])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rDS3B-0005xh-TS; Wed, 13 Dec 2023 16:25:34 +0000
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
	bh=KQVQBYD9punWx/JFuIO9bxPLUotYPvGu70eUjPbbOs4=; b=RlER8AMaCMOdvBTv/aTxUBtU8K
	cjmyl7t2NEF/tnM6FI405GABBrsR6IOGSaycfbUldEI7+5LCAuvwmW2Q/S1mlQ6aEua2OiyxmjpMt
	aYPKiJ9xxV6o5/mPd1vVjOcgJzpZrHqAgcHaI7wxm7e/mnGy9Tmmnly5EN8hq7HpD1J8=;
Message-ID: <cb54c8c1-ad51-4718-8aa0-bee05e263fac@xen.org>
Date: Wed, 13 Dec 2023 16:25:30 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH] xen/arm: ffa: return FFA_RET_NOT_SUPPORTED on
 unhandled calls
Content-Language: en-GB
To: Michal Orzel <michal.orzel@amd.com>,
 Jens Wiklander <jens.wiklander@linaro.org>, xen-devel@lists.xenproject.org
Cc: patches@linaro.org, Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>
References: <20231213103241.2346813-1-jens.wiklander@linaro.org>
 <0b7a0a09-ac54-4ef0-b4bc-c86f744089ed@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <0b7a0a09-ac54-4ef0-b4bc-c86f744089ed@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 13/12/2023 13:06, Michal Orzel wrote:
> Hi,
> 
> On 13/12/2023 11:32, Jens Wiklander wrote:
>>
>>
>> Until now has an unsupported FF-A request been reported back with
> NIT: I think 'has' is in the wrong place

Indeed. I have updated the commit message and committed.

Cheers,

-- 
Julien Grall

