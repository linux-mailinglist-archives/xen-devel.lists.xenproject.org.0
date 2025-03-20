Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A033AA6A8D7
	for <lists+xen-devel@lfdr.de>; Thu, 20 Mar 2025 15:43:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.922336.1326187 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tvH7S-0001bb-20; Thu, 20 Mar 2025 14:43:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 922336.1326187; Thu, 20 Mar 2025 14:43:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tvH7R-0001Zx-Va; Thu, 20 Mar 2025 14:43:37 +0000
Received: by outflank-mailman (input) for mailman id 922336;
 Thu, 20 Mar 2025 14:43:36 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1tvH7Q-0001Zp-En
 for xen-devel@lists.xenproject.org; Thu, 20 Mar 2025 14:43:36 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1tvH7K-00F20k-2O;
 Thu, 20 Mar 2025 14:43:30 +0000
Received: from [2a02:8012:3a1:0:699c:37d:6a29:da07]
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1tvH7K-00BKEN-11;
 Thu, 20 Mar 2025 14:43:30 +0000
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
	bh=m930N92ftJa67I2/qZmEKZ4lwgy+5J2QE9o/rlmgI9Q=; b=E9NqT8IrxXoAjqYnM6YONdYa83
	EzEHe7W7rjS1+lrqAU3hm7JScpfJURQDGBmAuU59mfHoipFKnzbG+dMCI67Wnvw78oJLZ6bxMw/kY
	WIWKQkLRn+Qf48n0WnCLzsbZ+eycst9RQgoetr+soKa7nIiAYw5EASlvQr+1UprFtsZs=;
Message-ID: <e004d9cf-a663-4383-8318-8510c51c0ae9@xen.org>
Date: Thu, 20 Mar 2025 14:43:28 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] process/release: mention MAINTAINER adjustments
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <6cc3adc1-5d54-4880-b3f3-2f688c2f39fa@suse.com>
 <b11d8525-13b4-40a0-8e33-b37c7e0d85a2@citrix.com>
 <36ab0870-52ad-476a-ae9c-20ea8ea46066@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <36ab0870-52ad-476a-ae9c-20ea8ea46066@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Jan,

On 20/03/2025 13:45, Jan Beulich wrote:
> On 20.03.2025 13:47, Andrew Cooper wrote:
>> On 20/03/2025 12:12 pm, Jan Beulich wrote:
>>> For many major releases I've been updating ./MAINTAINERS _after_ the
>>> respective branch was handed over to me. That update, however, is
>>> relevant not only from the .1 minor release onwards, but right from the
>>> .0 release. Hence it ought to be done as one of the last things before
>>> tagging the tree for the new major release.
>>>
>>> See the seemingly unrelated parts (as far as the commit subject goes) of
>>> e.g. 9d465658b405 ("update Xen version to 4.20.1-pre") for an example.
>>>
>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>> ---
>>> As can also be seen from the referenced commit, the document already
>>> saying "drop any references to the specific commits, e.g. date or title"
>>> hasn't been honored in recent releases, at least as far as
>>> QEMU_TRADITIONAL_REVISION goes.
>>
>> Oh, lovely.  I wasn't even aware there was a necessary change like
>> this.  Also, I haven't made as much progress rewriting the checklist as
>> I would have liked, so it is probably best to insert into this doc for now.
>>
>> The qemu-trad comments I think we can just strip out of staging.  We
>> don't have equivalent comments for the other trees.
> 
> Right, I was wondering what else might be stale there.

There are a few more things [1] that are still waiting for a review... I 
think there might be other from Andrew as well which needs to be 
respinned/committed.

Although, I don't think we had one for QEMU trad.

Cheers,

[1] https://lore.kernel.org/xen-devel/20241206194025.31662-3-julien@xen.org/

-- 
Julien Grall


