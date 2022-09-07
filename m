Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 380BD5B059B
	for <lists+xen-devel@lfdr.de>; Wed,  7 Sep 2022 15:47:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.401796.643736 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVvOA-00086q-SI; Wed, 07 Sep 2022 13:46:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 401796.643736; Wed, 07 Sep 2022 13:46:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVvOA-00084v-PH; Wed, 07 Sep 2022 13:46:46 +0000
Received: by outflank-mailman (input) for mailman id 401796;
 Wed, 07 Sep 2022 13:46:46 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1oVvOA-00084m-8y
 for xen-devel@lists.xenproject.org; Wed, 07 Sep 2022 13:46:46 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oVvO9-0006kl-5Q; Wed, 07 Sep 2022 13:46:45 +0000
Received: from 54-240-197-233.amazon.com ([54.240.197.233]
 helo=[192.168.17.46]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oVvO8-0004Sd-Uv; Wed, 07 Sep 2022 13:46:45 +0000
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
	bh=7DPAg9FSzc/NagJ0J89yzzeBSRqn1A2dUyGNtxgtRQ0=; b=ObD6ve7zSKfu5uGr5Igk9nRi2r
	7qPwXI5o6YQDkt2nPvlE5KVv+HD/8OMsXWfKs3sKWCGWAyOZ26RkMUFFapFeFljrxadk+k/xnxve8
	T7f9toPK6FSuF83zqDp7iMhiOhs3hpCNuz8b9xn/uGQ4hdTbEiqy5ptHOZzhrhK6IHsU=;
Message-ID: <ae5710d2-b3ea-2d80-d0be-f262c322a098@xen.org>
Date: Wed, 7 Sep 2022 14:46:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.2.1
Subject: Re: [PATCH v7 9/9] xen: Add static memory sharing in SUPPORT.md
Content-Language: en-US
To: Michal Orzel <michal.orzel@amd.com>, Penny Zheng <Penny.Zheng@arm.com>,
 xen-devel@lists.xenproject.org
Cc: wei.chen@arm.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <20220906085941.944592-1-Penny.Zheng@arm.com>
 <20220906085941.944592-10-Penny.Zheng@arm.com>
 <55154517-40ac-691c-74ed-7ce2504f6c07@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <55154517-40ac-691c-74ed-7ce2504f6c07@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 06/09/2022 12:59, Michal Orzel wrote:
> On 06/09/2022 10:59, Penny Zheng wrote:
>>
>> on ARM, static memory sharing is tech preview, which shall be documented
>> in SUPPORT.md
>>
>> Signed-off-by: Penny Zheng <penny.zheng@arm.com>
> 
> Reviewed-by: Michal Orzel <michal.orzel@amd.com>

Acked-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall

