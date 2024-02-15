Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B03F98562C0
	for <lists+xen-devel@lfdr.de>; Thu, 15 Feb 2024 13:12:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.681651.1060506 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1raaak-00021F-LV; Thu, 15 Feb 2024 12:11:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 681651.1060506; Thu, 15 Feb 2024 12:11:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1raaak-0001yW-Ii; Thu, 15 Feb 2024 12:11:50 +0000
Received: by outflank-mailman (input) for mailman id 681651;
 Thu, 15 Feb 2024 12:11:49 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1raaaj-0001yQ-1W
 for xen-devel@lists.xenproject.org; Thu, 15 Feb 2024 12:11:49 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1raaai-0005di-Os; Thu, 15 Feb 2024 12:11:48 +0000
Received: from [15.248.3.91] (helo=[10.24.67.27])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1raaai-0005x7-J6; Thu, 15 Feb 2024 12:11:48 +0000
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
	bh=M42jUP/j5z3T21luWg7PFpdiKZtAZkxU8jMCcx2Pb2w=; b=TrAnQPe9ddP4rtnV0FZFlhzmTq
	F5A4HCYZ4kaKHqG6EnpODkKdTa4KvZaBKzK7fDZ+bUr4lhqqzPFD6B49mJ3/AKLBdqczaImF3V0Hw
	QmMbKvewyrbFa0yamJaDq2yav93Uq/EFJ6eIp8MrIgMiD6i4G8skkuw35PQOD2mAEd4M=;
Message-ID: <d7ba7416-480b-4dbd-8a27-0cc44f589bb9@xen.org>
Date: Thu, 15 Feb 2024 12:11:46 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] docs: add a best practices coding guide
Content-Language: en-GB
From: Julien Grall <julien@xen.org>
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <20240208160515.9949-1-jgross@suse.com>
 <e090be7b-1ceb-4dc0-a664-089179236688@xen.org>
In-Reply-To: <e090be7b-1ceb-4dc0-a664-089179236688@xen.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 08/02/2024 16:27, Julien Grall wrote:
> Hi Juergen,
> 
> On 08/02/2024 16:05, Juergen Gross wrote:
>> Today the CODING_STYLE contains a section "Handling unexpected
>> conditions" specific to the hypervisor. This section is kind of
>> misplaced for a coding style. It should rather be part of a "Coding
>> best practices" guide.
>>
>> Add such a guide as docs/process/coding-best-practices.pandoc and
>> move the mentioned section from CODING_STYLE to the new file, while
>> converting the format to pandoc.
>>
>> Signed-off-by: Juergen Gross <jgross@suse.com>
> Acked-by: Julien Grall <jgrall@amazon.com>

There was no other feedbacks. So I have committed it.

Cheers,

> 
> Cheers,
> 

-- 
Julien Grall

