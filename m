Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EAEF377265E
	for <lists+xen-devel@lfdr.de>; Mon,  7 Aug 2023 15:46:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.578455.905974 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qT0YV-0003B5-S1; Mon, 07 Aug 2023 13:45:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 578455.905974; Mon, 07 Aug 2023 13:45:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qT0YV-00038B-P7; Mon, 07 Aug 2023 13:45:55 +0000
Received: by outflank-mailman (input) for mailman id 578455;
 Mon, 07 Aug 2023 13:45:55 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qT0YV-00037l-0B
 for xen-devel@lists.xenproject.org; Mon, 07 Aug 2023 13:45:55 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qT0YU-0008E3-I3; Mon, 07 Aug 2023 13:45:54 +0000
Received: from [54.239.6.189] (helo=[192.168.12.178])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qT0YU-00017W-Bj; Mon, 07 Aug 2023 13:45:54 +0000
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
	bh=NsiXcLbhtBqUYUJLtE6UTIICCBzMcUPY8ousQ7D2gbI=; b=afSOqzES+nuYH9mvwJMua04zls
	ubIdPZI1ojRiVCXOgXjo//ZjMK3z1fJjrXazx585zKWSj3M+BNG1WhV7Dwt9mfwYKazegD5Oi5z9V
	2oCqbTpfae1Q+qFak+SRHs62cW/Kb2j7RxtN35fdLYPs7u6K28b/BHAfS+MH/DvSXOVg=;
Message-ID: <0b74b4a8-29a9-491a-9961-43487d95b1eb@xen.org>
Date: Mon, 7 Aug 2023 14:45:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/5] arm/mm: Document the differences between arm32 and
 arm64 directmaps
Content-Language: en-GB
From: Julien Grall <julien@xen.org>
To: Alejandro Vallejo <alejandro.vallejo@cloud.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20230728075903.7838-1-alejandro.vallejo@cloud.com>
 <20230728075903.7838-2-alejandro.vallejo@cloud.com>
 <cf80a7f3-758f-6a49-1353-44303bad0e7f@xen.org>
In-Reply-To: <cf80a7f3-758f-6a49-1353-44303bad0e7f@xen.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 28/07/2023 10:05, Julien Grall wrote:
> On 28/07/2023 08:58, Alejandro Vallejo wrote:
>> arm32 merely covers the XENHEAP, whereas arm64 currently covers 
>> anything in
>> the frame table. These comments highlight why arm32 doesn't need to 
>> account for PDX
>> compression in its __va() implementation while arm64 does.
>>
>> Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>
> 
> Reviewed-by: Julien Grall <jgrall@amazon.com>

I have committed the patch.

Cheers,

-- 
Julien Grall

