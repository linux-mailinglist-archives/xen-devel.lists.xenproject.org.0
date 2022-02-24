Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B199A4C33C8
	for <lists+xen-devel@lfdr.de>; Thu, 24 Feb 2022 18:32:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.278550.475851 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nNHxa-0008SG-NW; Thu, 24 Feb 2022 17:31:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 278550.475851; Thu, 24 Feb 2022 17:31:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nNHxa-0008PO-JP; Thu, 24 Feb 2022 17:31:22 +0000
Received: by outflank-mailman (input) for mailman id 278550;
 Thu, 24 Feb 2022 17:31:21 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1nNHxZ-0008PI-Kv
 for xen-devel@lists.xenproject.org; Thu, 24 Feb 2022 17:31:21 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nNHxZ-0002tn-1v; Thu, 24 Feb 2022 17:31:21 +0000
Received: from 54-240-197-225.amazon.com ([54.240.197.225] helo=[10.7.239.15])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nNHxY-0008Ky-Sa; Thu, 24 Feb 2022 17:31:21 +0000
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
	bh=ojvJAQ1tcL/hurWNURfex0LQ6xzJ51lAC+TUn+DhejM=; b=c0v+qPBRBr0lf/5/tzJ+wSrqvZ
	y/L4CbzB8Ghuya2d5SHQqai14DR3rGrjj6logUEGHW3w0ZSytJJYeIlc0WlQK+8tMGJ790XoUev3n
	lTkz5mo8x/gGVqq5hPZ/PCEUgNerUuv+wpDOqQkhbEPKsK2ozjFOcWXAVFpApSNG/q1c=;
Message-ID: <9bc0efe0-cf2c-1146-854f-300578412ff7@xen.org>
Date: Thu, 24 Feb 2022 17:31:19 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.6.1
Subject: Re: [PATCH v2] xen/mm: pg_offlined can be defined as bool in
 free_heap_pages()
To: Andrew Cooper <Andrew.Cooper3@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Julien Grall <jgrall@amazon.com>
References: <20220223190833.24710-1-julien@xen.org>
 <27fd5c5f-591c-42c4-abed-95a9e5829d56@citrix.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <27fd5c5f-591c-42c4-abed-95a9e5829d56@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Andrew,

On 23/02/2022 19:38, Andrew Cooper wrote:
> On 23/02/2022 19:08, Julien Grall wrote:
>> From: Julien Grall <jgrall@amazon.com>
>>
>> The local variable pg_offlined in free_heap_pages() can only take two
>> values. So switch it to a bool.
>>
>> Signed-off-by: Julien Grall <jgrall@amazon.com>
> 
> I'd argue this might want to go as far as declaring Fixes: 289610483fc43
> which really did introduce one bool pg_offlined and one unsigned int
> pg_offlined which were the same thing.

I am OK with that. I will add it while committing the patch.

> 
> Either way, Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

Thanks!

Cheers,

-- 
Julien Grall

