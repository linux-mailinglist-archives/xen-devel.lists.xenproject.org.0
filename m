Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E85B47320F3
	for <lists+xen-devel@lfdr.de>; Thu, 15 Jun 2023 22:36:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.549839.858616 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q9thN-0004n4-RO; Thu, 15 Jun 2023 20:36:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 549839.858616; Thu, 15 Jun 2023 20:36:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q9thN-0004ka-OS; Thu, 15 Jun 2023 20:36:05 +0000
Received: by outflank-mailman (input) for mailman id 549839;
 Thu, 15 Jun 2023 20:36:04 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1q9thM-0004kU-1J
 for xen-devel@lists.xenproject.org; Thu, 15 Jun 2023 20:36:04 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1q9thJ-0006im-Sl; Thu, 15 Jun 2023 20:36:01 +0000
Received: from 54-240-197-233.amazon.com ([54.240.197.233]
 helo=[192.168.16.225]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1q9thJ-0002AW-Ms; Thu, 15 Jun 2023 20:36:01 +0000
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
	bh=VmVT8gk0RY6hks+BhxH5eIwo8duHiKpnpc0sAjSGDQM=; b=dOrHR7Q6fveIlieGTKN8lOvMKl
	g7nz3rq1Gu6mL45a4XhBUOFTlRrzXmlWqwZoPa236VC2ZRTsjfH/svx0/b7LqD1MsYcYvdP7eXV+A
	caQZApdkeXqh5e4dTVJyUy05vFPbjq5JqrDGrkMrAV8Hd5wREhx6q+OMR1gxoyLH/N1Y=;
Message-ID: <e9df0abf-a417-0575-7f90-4a40034f8f25@xen.org>
Date: Thu, 15 Jun 2023 21:35:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.12.0
Subject: Re: [PATCH] xen/arm: Remove stray semicolon at
 VREG_REG_HELPERS/TLB_HELPER* callers
Content-Language: en-US
To: Stefano Stabellini <sstabellini@kernel.org>,
 Michal Orzel <michal.orzel@amd.com>
Cc: xen-devel@lists.xenproject.org,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20230614094144.9533-1-michal.orzel@amd.com>
 <alpine.DEB.2.22.394.2306141645190.897208@ubuntu-linux-20-04-desktop>
From: Julien Grall <julien@xen.org>
In-Reply-To: <alpine.DEB.2.22.394.2306141645190.897208@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 15/06/2023 00:46, Stefano Stabellini wrote:
> On Wed, 14 Jun 2023, Michal Orzel wrote:
>> This is inconsistent with the rest of the code where macros are used
>> to define functions, as it results in an empty declaration (i.e.
>> semicolon with nothing before it) after function definition. This is also
>> not allowed by C99.
>>
>> Take the opportunity to undefine TLB_HELPER* macros after last use.
>>
>> Signed-off-by: Michal Orzel <michal.orzel@amd.com>
> 
> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

I have committed the patch.

Cheers,

-- 
Julien Grall

