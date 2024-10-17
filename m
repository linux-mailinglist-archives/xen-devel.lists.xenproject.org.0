Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E546D9A2986
	for <lists+xen-devel@lfdr.de>; Thu, 17 Oct 2024 18:49:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.820794.1234402 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t1TgJ-0001n7-IL; Thu, 17 Oct 2024 16:48:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 820794.1234402; Thu, 17 Oct 2024 16:48:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t1TgJ-0001ks-Dk; Thu, 17 Oct 2024 16:48:59 +0000
Received: by outflank-mailman (input) for mailman id 820794;
 Thu, 17 Oct 2024 16:48:58 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1t1TgI-0001km-7Y
 for xen-devel@lists.xenproject.org; Thu, 17 Oct 2024 16:48:58 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1t1TgG-00078I-HB; Thu, 17 Oct 2024 16:48:56 +0000
Received: from [15.248.2.232] (helo=[10.24.67.20])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1t1TgG-0006Tl-7b; Thu, 17 Oct 2024 16:48:56 +0000
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
	bh=Odz8lSXl2+Hf9YX92bPts2jH/5omdeFVBrfw8Jnbm7o=; b=O4evCxqd3Di4KPpNjwY2Z4c1ew
	FXrt0R1rkUMgygAGdrV7DKAMbc0J84/r0uZSAMS059tplsYu9VjfWEty6G13eTTloz5MMuCZEDrd3
	RwwtnkoFZG1IBO/Dhw3qCs8QpjWEkq2rGQJ6TceNXa1sVIquQLxtL8UMyXcg2zhHVoNs=;
Message-ID: <52741def-249f-4565-9f42-629e3c758dfc@xen.org>
Date: Thu, 17 Oct 2024 17:48:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] MAINTAINERS: minor file line update
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>,
 Frediano Ziglio <frediano.ziglio@cloud.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>
References: <20241004111127.897937-1-frediano.ziglio@cloud.com>
 <2a020197-e061-4d8d-9d49-df7878153d85@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <2a020197-e061-4d8d-9d49-df7878153d85@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Jan,

On 08/10/2024 12:48, Jan Beulich wrote:
> On 04.10.2024 13:11, Frediano Ziglio wrote:
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -517,7 +517,7 @@ F:	stubdom/
>>   TEE MEDIATORS
>>   M:	Volodymyr Babchuk <volodymyr_babchuk@epam.com>
>>   S:	Supported
>> -F:	xen/arch/arm/include/asm/tee
>> +F:	xen/arch/arm/include/asm/tee/
>>   F:	xen/arch/arm/tee/
> 
> I think this is a change which actually wants ack-ing by the maintainer
> named here, not THE REST. Cc-ing Volodymyr.

I would agree if this is significantly changing the list of files 
maintained. However, from testing, it doesn't change anything. So I 
don't think it is necessary to require the actual maintainer named in 
this section...

Also Bertrand is now a co-maintainer. So CCing him. I will give both of 
them another day to answer. If there are no answer, I will commit by end 
of my day tomorrow with:

Acked-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall


