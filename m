Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 44527678A12
	for <lists+xen-devel@lfdr.de>; Mon, 23 Jan 2023 22:58:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.483267.749321 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pK4p7-0008G5-SU; Mon, 23 Jan 2023 21:57:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 483267.749321; Mon, 23 Jan 2023 21:57:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pK4p7-0008D5-Pf; Mon, 23 Jan 2023 21:57:53 +0000
Received: by outflank-mailman (input) for mailman id 483267;
 Mon, 23 Jan 2023 21:57:51 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1pK4p5-0008Cj-Pm
 for xen-devel@lists.xenproject.org; Mon, 23 Jan 2023 21:57:51 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pK4p4-0004iI-QV; Mon, 23 Jan 2023 21:57:50 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.102])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pK4p4-0000MS-Kp; Mon, 23 Jan 2023 21:57:50 +0000
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
	bh=P0z1hxn/ltkAJpHB2GWK5p0RpyMp/HeoKYGxTsOcH6I=; b=tucYJqFMb2RNn13rIQNb2TbRnh
	3PZLZsDzsveg+mmHeVxwK5OKXXEx0Nh8LX+yY9nkJvZTT2Cd/GV8eT7mEARiUpkYdLhiYZqLDpdAH
	kGED+9pd2i1qYevtPS4DtxUMsWrWNVx3aEJtPfAhks1NOTSpxZdWNQYi1YBen718JXmI=;
Message-ID: <e391f6d0-5288-2216-0d11-ef683fd7ebf8@xen.org>
Date: Mon, 23 Jan 2023 21:57:48 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH 01/22] xen/common: page_alloc: Re-order includes
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org, Julien Grall <jgrall@amazon.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Wei Liu <wl@xen.org>
References: <20221216114853.8227-1-julien@xen.org>
 <20221216114853.8227-2-julien@xen.org>
 <alpine.DEB.2.22.394.2301231327060.1978264@ubuntu-linux-20-04-desktop>
From: Julien Grall <julien@xen.org>
In-Reply-To: <alpine.DEB.2.22.394.2301231327060.1978264@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Stefano,

On 23/01/2023 21:29, Stefano Stabellini wrote:
> On Fri, 16 Dec 2022, Julien Grall wrote:
>> From: Julien Grall <jgrall@amazon.com>
>>
>> Order the includes with the xen headers first, then asm headers and
>> last public headers. Within each category, they are sorted alphabetically.
>>
>> Note that the includes in protected by CONFIG_X86 hasn't been sorted
>> to avoid adding multiple #ifdef.
>>
>> Signed-off-by: Julien Grall <jgrall@amazon.com>
> 
> This patch doesn't apply as is any longer.

That's expected given that I committed this patch a month ago (see my 
answer to Jan's e-mail on the 23rd December).

Cheers,

-- 
Julien Grall

