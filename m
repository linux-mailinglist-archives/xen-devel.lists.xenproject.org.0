Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E3ED75B3405
	for <lists+xen-devel@lfdr.de>; Fri,  9 Sep 2022 11:33:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.404024.646336 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oWaNu-0004Lh-QD; Fri, 09 Sep 2022 09:33:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 404024.646336; Fri, 09 Sep 2022 09:33:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oWaNu-0004JT-NK; Fri, 09 Sep 2022 09:33:14 +0000
Received: by outflank-mailman (input) for mailman id 404024;
 Fri, 09 Sep 2022 09:33:13 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1oWaNt-0004JI-4i
 for xen-devel@lists.xenproject.org; Fri, 09 Sep 2022 09:33:13 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oWaNs-00063M-SK; Fri, 09 Sep 2022 09:33:12 +0000
Received: from 54-240-197-231.amazon.com ([54.240.197.231]
 helo=[192.168.11.73]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oWaNs-0000Go-Kv; Fri, 09 Sep 2022 09:33:12 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	References:Cc:To:From:Subject:MIME-Version:Date:Message-ID;
	bh=i8D8d5q/5gBssAo4Jm9hIilkoUju3HSkErG1YCEYVpc=; b=N2WmzCKQJFjLW+WoRf4ndrpvkR
	OpiWU8PdVqnPS4M19Qc4DjgDlkS89Bmhly+Uk4AmtGO4XC9HObCoWFyD1eofQj00M6oICuibaJ+Hv
	qMXoUmmZicpJHU5tQ7BO6Nh2JE3gEhbiyHFlFpPH+AuOMSBnLperzV15yRWD+VxhK7YQ=;
Message-ID: <807c0fad-cf2b-7fcd-97b2-b49d026926c0@xen.org>
Date: Fri, 9 Sep 2022 10:33:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.2.1
Subject: Re: [PATCH] docs/device-tree: Place the static-heap dt-binding in
 proper place
Content-Language: en-US
From: Julien Grall <julien@xen.org>
To: Henry Wang <Henry.Wang@arm.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20220908120728.8290-1-Henry.Wang@arm.com>
 <b1fe6526-6d30-bf39-a0e0-5040cb4ee20d@xen.org>
In-Reply-To: <b1fe6526-6d30-bf39-a0e0-5040cb4ee20d@xen.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 08/09/2022 14:05, Julien Grall wrote:
> Hi Henry,
> 
> On 08/09/2022 13:07, Henry Wang wrote:
>> The static-heap dt-binding should be placed after the last feature,
>> namely static-evtchn.
>>
>> Fixes: 4596329291f5 ("docs, xen/arm: Introduce static heap memory")
>> Signed-off-by: Henry Wang <Henry.Wang@arm.com>
> 
> Thanks for fixing the mistake I did while committing the patch :).
> 
> Acked-by: Julien Grall <jgrall@amazon.com>

And committed.

Cheers,

-- 
Julien Grall

