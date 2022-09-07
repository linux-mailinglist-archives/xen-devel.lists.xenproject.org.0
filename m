Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EF30C5B0143
	for <lists+xen-devel@lfdr.de>; Wed,  7 Sep 2022 12:06:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.401101.642796 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVrwO-00066L-KO; Wed, 07 Sep 2022 10:05:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 401101.642796; Wed, 07 Sep 2022 10:05:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVrwO-00063l-Hc; Wed, 07 Sep 2022 10:05:52 +0000
Received: by outflank-mailman (input) for mailman id 401101;
 Wed, 07 Sep 2022 10:05:50 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1oVrwM-00063c-LG
 for xen-devel@lists.xenproject.org; Wed, 07 Sep 2022 10:05:50 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oVrwM-0002Mu-CE; Wed, 07 Sep 2022 10:05:50 +0000
Received: from 54-240-197-233.amazon.com ([54.240.197.233]
 helo=[192.168.17.46]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oVrwM-0001K3-57; Wed, 07 Sep 2022 10:05:50 +0000
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
	bh=8+p+6F/gV+1wEgBnS1/386cg6eA4og+z2f8gmL4oLgo=; b=oeFoo9gUOSqBlR22nKVvlQawAt
	TWhumSGXSDpZDET0rBB58G7c1mmoa1i21hRn4vAXctmrU8IoETTh60h0pfLM5MDIAi+yojPnljHC+
	mfc25e7t9wpPfBLm3PPuYGBjtYd7Qw7sUWRIu7OtogrljBl7lFE3jdA2kcQ+pLkpAk28=;
Message-ID: <d96d2de1-bb6f-2ce2-9c11-12e9a99fa98b@xen.org>
Date: Wed, 7 Sep 2022 11:05:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.2.1
Subject: Re: [PATCH v3 1/4] xen/arm: bootfdt: Make process_chosen_node()
 return int
Content-Language: en-US
To: Michal Orzel <michal.orzel@amd.com>, Henry Wang <Henry.Wang@arm.com>,
 xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>, Wei Chen <wei.chen@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20220907083643.20152-1-Henry.Wang@arm.com>
 <20220907083643.20152-2-Henry.Wang@arm.com>
 <cac1453a-d61c-deb0-121c-f49ecaee5423@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <cac1453a-d61c-deb0-121c-f49ecaee5423@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 07/09/2022 10:19, Michal Orzel wrote:
> Hi Henry,
> 
> On 07/09/2022 10:36, Henry Wang wrote:
>>
>> At the boot time, it is saner to stop booting early if an error occurs
>> when parsing the device tree chosen node, rather than seeing random
>> behavior afterwards. Therefore, this commit changes the return type of
>> the process_chosen_node() from void to int, and return correct errno
>> based on the error type.
>>
>> Signed-off-by: Henry Wang <Henry.Wang@arm.com>
> 
> Reviewed-by: Michal Orzel <michal.orzel@amd.com>

Acked-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall

