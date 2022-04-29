Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DFFD5515121
	for <lists+xen-devel@lfdr.de>; Fri, 29 Apr 2022 18:47:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.317542.536919 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nkTm9-0005x8-W7; Fri, 29 Apr 2022 16:47:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 317542.536919; Fri, 29 Apr 2022 16:47:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nkTm9-0005vK-SD; Fri, 29 Apr 2022 16:47:25 +0000
Received: by outflank-mailman (input) for mailman id 317542;
 Fri, 29 Apr 2022 16:47:24 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1nkTm8-0005vE-55
 for xen-devel@lists.xenproject.org; Fri, 29 Apr 2022 16:47:24 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nkTm5-0004TU-P4; Fri, 29 Apr 2022 16:47:21 +0000
Received: from [54.239.6.189] (helo=[192.168.23.31])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nkTm5-0005AP-IX; Fri, 29 Apr 2022 16:47:21 +0000
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
	bh=6WNeOAuoVJX4b2K3RXMDurWp1ef33gch2WL59XaXl+8=; b=w9B09G9uLvaaA7UhGGaicAs5BB
	o9Ha3ZiLALwLrybNdLGNZxCtEfIFN3qSiNKCvOKZynFCcLSy15HZ0WpD7Rq1kkt0jTOT0on6xowcS
	VCv836wVO1O3FbUctUJyWrVaDAZMCnGjcxLBBLRnecCB875T+We19m9ZEhN3JeVMmN0s=;
Message-ID: <b24e8250-1a69-3b1c-d535-b9f8ac02e2db@xen.org>
Date: Fri, 29 Apr 2022 17:47:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.8.1
Subject: Re: [xen-unstable-smoke test] 169781: regressions - FAIL
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Julien Grall <julien.grall.oss@gmail.com>,
 osstest service owner <osstest-admin@xenproject.org>,
 xen-devel <xen-devel@lists.xenproject.org>, Jan Beulich <jbeulich@suse.com>,
 David Vrabel <dvrabel@amazon.co.uk>,
 Bertrand Marquis <bertrand.marquis@arm.com>
References: <osstest-169781-mainreport@xen.org>
 <d1d3d81e-fe1d-fc1c-11b3-781263d8ba84@xen.org>
 <alpine.DEB.2.22.394.2204271556110.915916@ubuntu-linux-20-04-desktop>
 <CAJ=z9a1bu=3sX0rvWy+T-ey4363DMUEJvzkSqkQkTnvOQtT0=A@mail.gmail.com>
 <alpine.DEB.2.22.394.2204271622520.915916@ubuntu-linux-20-04-desktop>
 <ac0a0bf0-81a8-63c7-6a62-377672e24069@xen.org>
 <alpine.DEB.2.22.394.2204281647540.915916@ubuntu-linux-20-04-desktop>
 <cc097cb8-d04d-6441-d0f8-4027c7d0dc8e@xen.org>
 <alpine.DEB.2.22.394.2204290912150.1947187@ubuntu-linux-20-04-desktop>
From: Julien Grall <julien@xen.org>
In-Reply-To: <alpine.DEB.2.22.394.2204290912150.1947187@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 29/04/2022 17:15, Stefano Stabellini wrote:
>>> Which seems to be the right sequence to me. There must be an early boot
>>> phase where interrupts are disabled on a CPU but memory allocations are
>>> possible. If this was x86 with the tlbflush limitation, I would suggest
>>> to have per-cpu memory mapping areas so that we don't have to do any
>>> global tlb flushes with interrupts disabled.
>>>
>>> On ARM, we don't have the tlbflush limitation so we could do that but we
>>> wouldn't have much to gain from it.
>>>
>>> Also, this seems to be a bit of a special case, because in general we
>>> can move drivers initializations later after local_irq_enable(). But
>>> this is the interrupt controller driver itself -- we cannot move it
>>> after local_irq_enable().
>>>
>>> So maybe an ad-hoc solution could be acceptable?
>>
>> We don't need any ad-hoc solution here. We can register a CPU notifier that
>> will notify us when a CPU will be prepared. Something like below should work
>> (untested yet):
> 
> The CPU notifier is a good idea. It looks like the patch below got
> corrupted somehow by the mailer. If you send it as a proper patch I am
> happy to have a look.

Doh. I will send a proper patch once I have done some testing.

Cheers,

-- 
Julien Grall

