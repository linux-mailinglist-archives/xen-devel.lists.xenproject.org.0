Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 91A519C5CE4
	for <lists+xen-devel@lfdr.de>; Tue, 12 Nov 2024 17:11:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.834776.1250609 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tAtUI-0001pQ-HK; Tue, 12 Nov 2024 16:11:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 834776.1250609; Tue, 12 Nov 2024 16:11:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tAtUI-0001n4-EV; Tue, 12 Nov 2024 16:11:30 +0000
Received: by outflank-mailman (input) for mailman id 834776;
 Tue, 12 Nov 2024 16:11:29 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1tAtUH-0001my-Qj
 for xen-devel@lists.xenproject.org; Tue, 12 Nov 2024 16:11:29 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1tAtUH-001jJ4-0v;
 Tue, 12 Nov 2024 16:11:29 +0000
Received: from [15.248.2.232] (helo=[10.24.67.20])
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1tAtUH-001kJf-0r;
 Tue, 12 Nov 2024 16:11:29 +0000
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
	bh=AZ8OqXc6YwUQaN5MGr8PdPIryfPI/9W6Ei845rikZew=; b=A81r5ai0Wg2yk7VzsaFjtBYZb0
	KnO++epEr2dd9A2VP6A6Id1dWztvWMpglrQUzltAKJZfRd9fsrfTre6FXIYD2FJmDpCLJm1ONUEqx
	GFd0pPbAxNg0gQrFSlGuPbBBMUTbwhnkbZoUhS+n3+q24VTgZcM4ajidtAX8O0hAg4Qg=;
Message-ID: <718c2a9c-15b0-4f21-941a-5094c06787c7@xen.org>
Date: Tue, 12 Nov 2024 16:11:27 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [ARM] Re: preparations for 4.19.1
Content-Language: en-GB
To: Stewart Hildebrand <stewart.hildebrand@amd.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Kelly Choi <kelly.choi@cloud.com>, Anthony PERARD
 <anthony.perard@vates.tech>, Jan Beulich <jbeulich@suse.com>
References: <ddc41c9d-9754-4fde-bac0-6389511a7f7c@suse.com>
 <4aa24b39-5734-4b0a-8969-dc3eb4942975@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <4aa24b39-5734-4b0a-8969-dc3eb4942975@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 12/11/2024 16:00, Stewart Hildebrand wrote:
> On 11/12/24 08:00, Jan Beulich wrote:
>> All,
>>
>> the release is due by the end of the month. Please point out backports you find
>> missing from the respective staging branch, but which you consider relevant.
>>
>> Advance notice: 4.18.4 ought to follow about two weeks later.
>>
>> Jan
>>
> 
> Looking for Julien's input on this one:
> 
> 35c64c3dce01 ("xen/arm64: entry: Actually skip do_trap_*() when an SError is triggered")
> 
> As mentioned in the post-commit notes [0] it's a candidate for backport.

In the past, Stefano handled backports for Arm. I am not sure if this is 
still case. Stefano?

> 
> [0] https://lore.kernel.org/xen-devel/20240806124815.53492-1-julien@xen.org/

Cheers,

-- 
Julien Grall


