Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B405D5F78EA
	for <lists+xen-devel@lfdr.de>; Fri,  7 Oct 2022 15:26:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.417998.662748 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ognMu-0000XD-9q; Fri, 07 Oct 2022 13:26:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 417998.662748; Fri, 07 Oct 2022 13:26:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ognMu-0000Uz-6w; Fri, 07 Oct 2022 13:26:24 +0000
Received: by outflank-mailman (input) for mailman id 417998;
 Fri, 07 Oct 2022 13:26:22 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1ognMs-0000Ut-E7
 for xen-devel@lists.xenproject.org; Fri, 07 Oct 2022 13:26:22 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1ognMn-0002Rt-2k; Fri, 07 Oct 2022 13:26:17 +0000
Received: from 54-240-197-232.amazon.com ([54.240.197.232]
 helo=[192.168.20.83]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1ognMm-0004XD-SD; Fri, 07 Oct 2022 13:26:17 +0000
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
	bh=IugBXtSL5iOmReNBqMdYlDqxxMplhQSbtLeEQmZUcRs=; b=hJWQdwfsAhwmzF7R61MDDHa7ol
	WM9Nale6iZi+ihf1IvkbcIjO/5l/TNNuR47iZKwg6CQucoDmlQi+vsrXZ/HxSt8sVIlw6qQjpMRn3
	ZyMk3Ly1dxAVFQXiI8gB25+uAl3Q5w4uOgjGFE0ZwP9VncQKYJkJ/TKOEE1+JOPL0Fhc=;
Message-ID: <53a2e52f-05f9-da86-218a-3046d1b1ca71@xen.org>
Date: Fri, 7 Oct 2022 14:26:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.3.1
Subject: Re: [PATCH 3/3] Update Xen version to 4.17-rc
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>
Cc: Henry.Wang@arm.com, Julien Grall <jgrall@amazon.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20221007091341.58542-1-julien@xen.org>
 <20221007091341.58542-4-julien@xen.org>
 <304f4bbf-3598-2f42-5cee-83e58c1909cc@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <304f4bbf-3598-2f42-5cee-83e58c1909cc@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Jan,

On 07/10/2022 12:06, Jan Beulich wrote:
> On 07.10.2022 11:13, Julien Grall wrote:
>> From: Julien Grall <jgrall@amazon.com>
>>
>> Signed-off-by: Julien Grall <jgrall@amazon.com>
>> ---
>>   README       | 16 ++++++++--------
>>   SUPPORT.md   |  2 +-
>>   xen/Makefile |  2 +-
>>   3 files changed, 10 insertions(+), 10 deletions(-)
> 
> I assume CHANGELOG.md is then going to be updated only once for the actual
> release? (Not that I think that the -rc is relevant to have there, but the
> version could as well be changed to 4.17.0 already now.)

In the past, this was updated once we are ready to release 4.17. I would 
prefer if we follow the same approach as it will be less error-prone and 
work.

I would otherwise have to temporarily remove the section "unstable" (to 
avoid someone mistakenly updating the changelog) and then re-introduce it.

Cheers,

-- 
Julien Grall

