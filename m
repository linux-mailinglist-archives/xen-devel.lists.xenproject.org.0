Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E1CC666241
	for <lists+xen-devel@lfdr.de>; Wed, 11 Jan 2023 18:46:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.475671.737438 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pFfAH-00088g-FP; Wed, 11 Jan 2023 17:45:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 475671.737438; Wed, 11 Jan 2023 17:45:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pFfAH-00086Q-Ch; Wed, 11 Jan 2023 17:45:29 +0000
Received: by outflank-mailman (input) for mailman id 475671;
 Wed, 11 Jan 2023 17:45:27 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1pFfAF-00086I-MW
 for xen-devel@lists.xenproject.org; Wed, 11 Jan 2023 17:45:27 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pFfAE-0006eP-VP; Wed, 11 Jan 2023 17:45:26 +0000
Received: from 54-240-197-234.amazon.com ([54.240.197.234]
 helo=[192.168.5.208]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pFfAE-0000Pa-Pp; Wed, 11 Jan 2023 17:45:26 +0000
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
	bh=a7QlcAv1z/+JZ8qrnZpz/POOL4amY4nEQ0WiQriXJG0=; b=YzmBMgq9bQ0gAKVpfTR/6CRZZQ
	Q6DrYuFUms0C/GOU31dBdYFRj9UmemBjdBTHKIjPjG3maRNDRoiTylzrj2oqKYZIzu//A5Cjx39cq
	0d5VH6vtFuLHR1Y91aMdv6eBUI34kUuncpKr8Gw8o6Kcxw+EsE+5Ek9V+dwFf7hetYkw=;
Message-ID: <4715f53c-ace8-5f45-edea-4391cc308524@xen.org>
Date: Wed, 11 Jan 2023 17:45:25 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH v2 04/19] tools/xenstore: remove all watches when a domain
 has stopped
Content-Language: en-US
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
References: <20221213160045.28170-1-jgross@suse.com>
 <20221213160045.28170-5-jgross@suse.com>
 <831c0e75-1a23-6210-9f5b-7212a6763dc3@xen.org>
 <27c0f7bd-b548-17f4-d675-7143e218fd65@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <27c0f7bd-b548-17f4-d675-7143e218fd65@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Juergen,

On 11/01/2023 06:36, Juergen Gross wrote:
> On 20.12.22 20:01, Julien Grall wrote:
>> On 13/12/2022 16:00, Juergen Gross wrote:
>>> When a domain has been released by Xen tools, remove all its
>>> registered watches. This avoids sending watch events to the dead domain
>>> when all the nodes related to it are being removed by the Xen tools.
>>
>> AFAICT, the only user of the command in the tree is softreset. Would 
>> you be able to check this is still working as expected?
> 
> Seems to work fine.

Thanks for the confirmation! You can add my reviewed-by:

Reviewed-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall

