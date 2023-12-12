Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 57DAF80EABF
	for <lists+xen-devel@lfdr.de>; Tue, 12 Dec 2023 12:47:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.652974.1019190 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rD1Dt-0003BT-Gt; Tue, 12 Dec 2023 11:46:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 652974.1019190; Tue, 12 Dec 2023 11:46:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rD1Dt-000396-Cj; Tue, 12 Dec 2023 11:46:49 +0000
Received: by outflank-mailman (input) for mailman id 652974;
 Tue, 12 Dec 2023 11:46:48 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1rD1Ds-000390-4v
 for xen-devel@lists.xenproject.org; Tue, 12 Dec 2023 11:46:48 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rD1Dr-0005V5-7g; Tue, 12 Dec 2023 11:46:47 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.240])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rD1Dr-0006rT-2Y; Tue, 12 Dec 2023 11:46:47 +0000
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
	bh=pJqnNvefVm93hOJgIQyEO7ib5GhgBU7NeedcXtSlBI4=; b=iq/358+/9WvZha9ei0yidkvh9W
	CX3v7h1qs7HTGVgEQj7qaZz0lB8SE5PCtDoSJAmpv6L+TATNP+7tohpMWQGVOyRQ/gUqUvN8dqtmP
	brfG44Kuu2o1tAjpwOzV3+yRMIsaPabXhnJWr9nWfzVX2roRylPkDp5/+/qmqg6O7/8I=;
Message-ID: <c86608cc-7dfc-4ccd-bd85-62d17c72a2cc@xen.org>
Date: Tue, 12 Dec 2023 11:46:45 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] MAINTAINERS: Hand over the release manager role to
 Oleksii Kurochko
Content-Language: en-GB
From: Julien Grall <julien@xen.org>
To: Henry Wang <Henry.Wang@arm.com>, xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>
References: <20231207162036.1921323-1-Henry.Wang@arm.com>
 <90575ebd-4b09-47bd-a4ee-2f081020b2ad@xen.org>
In-Reply-To: <90575ebd-4b09-47bd-a4ee-2f081020b2ad@xen.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 07/12/2023 18:46, Julien Grall wrote:
> Hi,
> 
> On 07/12/2023 16:20, Henry Wang wrote:
>> I've finished the opportunity to do two releases (4.17 and 4.18)
>> and Oleksii Kurochko has volunteered to be the next release manager.
> 
> Henry, thanks for your time as release manager.
> Oleksii, thanks for stepping up and good luck for the role!
> 
>> Hand over the role to him by changing the maintainership of the
>> CHANGELOG.md.
>>
>> Signed-off-by: Henry Wang <Henry.Wang@arm.com>
> 
> Acked-by: Julien Grall <jgrall@amazon.com>
> 
> I didn't hear any objection during the community call. But I will give 
> until Tuesday morning (UK time) just in case. If there are none, then I 
> will commit it.

I haven't heard any objection. So this is now committed.

Cheers,

-- 
Julien Grall

