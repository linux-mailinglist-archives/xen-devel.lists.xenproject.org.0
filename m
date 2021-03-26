Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AD62734A6F5
	for <lists+xen-devel@lfdr.de>; Fri, 26 Mar 2021 13:15:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.101764.194818 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lPlNC-0005Hf-IU; Fri, 26 Mar 2021 12:15:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 101764.194818; Fri, 26 Mar 2021 12:15:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lPlNC-0005HF-Ev; Fri, 26 Mar 2021 12:15:30 +0000
Received: by outflank-mailman (input) for mailman id 101764;
 Fri, 26 Mar 2021 12:15:28 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1lPlNA-0005H4-AK
 for xen-devel@lists.xenproject.org; Fri, 26 Mar 2021 12:15:28 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lPlN6-0006KI-GL; Fri, 26 Mar 2021 12:15:24 +0000
Received: from [54.239.6.186] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lPlN6-0001Zo-AY; Fri, 26 Mar 2021 12:15:24 +0000
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
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=LfvwKyVj0+Cko72N9E7erksqyOZgqlmrcWrG6f29bvE=; b=PJbDpeBGbeiVKvwoVuQ0xm5NZA
	P3KRfci1uGD3rfkhONNtm6ufqq7vCeI8gYWZR+1lhr/nSeO6NsQAiieB2+x6ZC6gK/8xbaCizORPa
	OrZ4Evdvsji3Ve+3F7ZdwqZjANyCpsL5lu9tFxWJG0jeN/OaZT3i+YvMaRtloxNgTiP0=;
Subject: Re: [PATCH for-4.15?] docs/misc: xenstored: Re-instate and tweak the
 documentation for XS_RESUME
To: Ian Jackson <iwj@xenproject.org>
Cc: xen-devel@lists.xenproject.org, Julien Grall <jgrall@amazon.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 raphning@gmail.com, jgross@suse.com, paul@xen.org
References: <20210325180607.13158-1-julien@xen.org>
 <24669.52724.843848.16707@mariner.uk.xensource.com>
From: Julien Grall <julien@xen.org>
Message-ID: <5167ebbb-aa44-6cb8-583f-2356442bf004@xen.org>
Date: Fri, 26 Mar 2021 12:15:21 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <24669.52724.843848.16707@mariner.uk.xensource.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Ian,

On 26/03/2021 12:05, Ian Jackson wrote:
> Julien Grall writes ("[PATCH for-4.15?] docs/misc: xenstored: Re-instate and tweak the documentation for XS_RESUME"):
>> From: Julien Grall <jgrall@amazon.com>
>>
>> Commit 13dd372834a4 removed the documentation for XS_RESUME, however
>> this command is still implemented (at least in C Xenstored) and used by
>> libxl when resuming a domain.
>>
>> So re-instate the documentation for the XS_RESUME. Take the opportunity
>> to update it as there is a user of the command.
> 
> This is just docs, so:
> 
> Release-Acked-by: Ian Jackson <iwj@xenproject.org>
> Reviewed-by: Ian Jackson <iwj@xenproject.org>

Thanks! I have committed the patch to staging and cherry-pick in 
staging-4.15.

Cheers,

-- 
Julien Grall

