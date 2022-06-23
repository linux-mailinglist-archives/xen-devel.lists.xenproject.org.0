Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DB7A5587F2
	for <lists+xen-devel@lfdr.de>; Thu, 23 Jun 2022 20:56:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.355170.582677 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o4S0B-0003Dv-TL; Thu, 23 Jun 2022 18:56:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 355170.582677; Thu, 23 Jun 2022 18:56:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o4S0B-0003C0-Py; Thu, 23 Jun 2022 18:56:27 +0000
Received: by outflank-mailman (input) for mailman id 355170;
 Thu, 23 Jun 2022 18:56:26 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1o4S0A-0003Bu-75
 for xen-devel@lists.xenproject.org; Thu, 23 Jun 2022 18:56:26 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1o4S09-0003eS-J3; Thu, 23 Jun 2022 18:56:25 +0000
Received: from 54-240-197-234.amazon.com ([54.240.197.234]
 helo=[192.168.0.239]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1o4S09-0003Il-DM; Thu, 23 Jun 2022 18:56:25 +0000
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
	bh=u0VfwaeWhaBIPwVjcu6HcW3tM4iS8ZTgV5gppUHPras=; b=0kRIFaThqTY4jZyXRRe3qUk2RJ
	t+29rI+kDifBX9/FhPddgPVXTh++CTELTGjtWXCJ2aJ9ZkUztUBhqeUWDfCDnYemd7/2s5/sPvKMY
	0BWBS+YTX7+8GgNtE3f48q7//tErjfrv5MW2JSW8Lu6w35hRXA6VImucRREwSxK+UlPw=;
Message-ID: <4b24526f-6816-209e-e64e-7a08381b6002@xen.org>
Date: Thu, 23 Jun 2022 19:56:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.10.0
Subject: Re: [PATCH 1/2] xen/arm: vtimer: Fix MISRA C 2012 Rule 8.4 violation
To: Stefano Stabellini <sstabellini@kernel.org>,
 Xenia Ragiadakou <burzalodowa@gmail.com>
Cc: xen-devel@lists.xenproject.org,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20220621154402.482857-1-burzalodowa@gmail.com>
 <alpine.DEB.2.22.394.2206211644210.788376@ubuntu-linux-20-04-desktop>
From: Julien Grall <julien@xen.org>
In-Reply-To: <alpine.DEB.2.22.394.2206211644210.788376@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Xenia,

On 22/06/2022 00:44, Stefano Stabellini wrote:
> On Tue, 21 Jun 2022, Xenia Ragiadakou wrote:
>> Include vtimer.h so that the declarations of vtimer functions with external
>> linkage are visible before the function definitions.
>>
>> Signed-off-by: Xenia Ragiadakou <burzalodowa@gmail.com>
> 
> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

Like your other series, I wasn't able to find a cover letter so replying 
here.

I have now committed it. But in the future, please create a cover letter.

Cheers,

-- 
Julien Grall

