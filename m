Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8944F805D66
	for <lists+xen-devel@lfdr.de>; Tue,  5 Dec 2023 19:34:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.648233.1012433 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rAaFQ-0006lb-76; Tue, 05 Dec 2023 18:34:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 648233.1012433; Tue, 05 Dec 2023 18:34:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rAaFQ-0006jh-3r; Tue, 05 Dec 2023 18:34:20 +0000
Received: by outflank-mailman (input) for mailman id 648233;
 Tue, 05 Dec 2023 18:34:18 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1rAaFO-0006iL-R0
 for xen-devel@lists.xenproject.org; Tue, 05 Dec 2023 18:34:18 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rAaFM-0004L6-7w; Tue, 05 Dec 2023 18:34:16 +0000
Received: from 54-240-197-228.amazon.com ([54.240.197.228]
 helo=[10.95.100.251]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rAaFM-0007R7-0a; Tue, 05 Dec 2023 18:34:16 +0000
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
	bh=b2mx82GWmiUxCkQpCz01WIFQ+/VD691RwByjXzdEUa0=; b=HC29peXOaMAXOHBMqeTxUMRefl
	jJ7ZMg96ud7giH8Q/qInTZ5t9EHf/bRBtSqj+vILIwrLMqXSEEYOisvlRnG6lu56mTTwP6QFp8WM6
	D8pAbvVVNE5sn0aUYWkgtmj7wMGSxNbsoT9xLaCcZ+p3jbSHzAfmN2V4hW3b2wKaeZRU=;
Message-ID: <a5909c02-7851-47ec-a401-f808ae3714d8@xen.org>
Date: Tue, 5 Dec 2023 18:34:13 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Config.mk: drop -Wdeclaration-after-statement
Content-Language: en-GB
To: Alexander Kanavin <alex@linutronix.de>, Jan Beulich <jbeulich@suse.com>,
 Anthony PERARD <anthony.perard@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org, Juergen Gross <jgross@suse.com>
References: <20231128174729.3880113-1-alex@linutronix.de>
 <fcb1cc57-b985-4711-a234-4aaa380b9abe@suse.com>
 <81043e30-c9fd-4c5e-ad63-0e42edea733d@linutronix.de>
 <5a469665-54b2-4904-9604-ad686fbbb05e@xen.org>
 <716b0ec4-adce-494d-b9b6-69dbb7e26000@perard>
 <890f54b5-9692-40b8-94fa-9a55268e29f5@suse.com>
 <da7a86ba-7f74-41bb-9540-76f4530ac7ac@xen.org>
 <da50a3db-b950-4a0e-a7e7-a715c1f74f4a@linutronix.de>
From: Julien Grall <julien@xen.org>
In-Reply-To: <da50a3db-b950-4a0e-a7e7-a715c1f74f4a@linutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Alexander.

On 04/12/2023 09:28, Alexander Kanavin wrote:
> On 12/1/23 20:14, Julien Grall wrote:
>>
>> So I agree that if we were to remove -Wdeclaration-after-statement 
>> then we should also update the CODING_STYLE. However, I am not 
>> entirely sure I would want to mix code and declaration in the hypervisor.
>>
>> Anyway, I think this is a separate discussion from resolving the 
>> immediate problem (i.e. building the python bindings).
>>
>> So for now, I think it would make sense to push the 
>> -Wdeclaration-after-statement to the tools.
>>
>> @Alexander, are you going to send a new version? If not, I would be 
>> happy to do it.
> 
> Please do it, as in the meantime, my attention has focused entirely 
> elsewhere, so I'd have to switch context and find time to study the xen 
> source. I don't have specific interest in xen, the reason I looked into 
> it is that we're updating python to 3.12 in yocto and this one was one 
> of the many issues that came up all over the userspace stack.

Thanks, I have sent a patch [1]. I decided to add a Reported-by tag 
rather than Signed-off-by on my version. I hope this is fine.

Cheers,

[1] https://lore.kernel.org/xen-devel/20231205183226.26636-1-julien@xen.org/

> 
> 

-- 
Julien Grall

