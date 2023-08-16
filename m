Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D966677E7C9
	for <lists+xen-devel@lfdr.de>; Wed, 16 Aug 2023 19:39:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.584839.915689 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qWKTh-0003yI-I7; Wed, 16 Aug 2023 17:38:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 584839.915689; Wed, 16 Aug 2023 17:38:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qWKTh-0003wE-FI; Wed, 16 Aug 2023 17:38:41 +0000
Received: by outflank-mailman (input) for mailman id 584839;
 Wed, 16 Aug 2023 17:38:40 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qWKTg-0003w8-GC
 for xen-devel@lists.xenproject.org; Wed, 16 Aug 2023 17:38:40 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qWKTe-0006aG-IR; Wed, 16 Aug 2023 17:38:38 +0000
Received: from 54-240-197-231.amazon.com ([54.240.197.231] helo=[192.168.5.61])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qWKTe-0006k7-Bk; Wed, 16 Aug 2023 17:38:38 +0000
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
	bh=svsk9oismRkD1EONKX7ZtEA2qSnk8Ofrtgj73++ho64=; b=13SgsYXs7DAGXHp3plMX9oMlyf
	Rn4ppGhBB6gdKF/pr6Y4g1H57S5JVVQYfluL9AzrAm6aqnFkwyBIuff/nSkUcRUc0lzTj3tk0FEkW
	EISN5u9Pbcn6XKn1DgYsMaqpyhh2VRC19GxFhpEinTnqLg2sf0RMGDPaDZsCdJcp7w+M=;
Message-ID: <4a28dd6a-3f7d-413f-8220-466ecb35a737@xen.org>
Date: Wed, 16 Aug 2023 18:38:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] docs: Drop warning about 2M limit for ARM
Content-Language: en-GB
To: Henry Wang <Henry.Wang@arm.com>, Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 George Dunlap <George.Dunlap@eu.citrix.com>, Jan Beulich
 <JBeulich@suse.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>
References: <20230815161425.2202782-1-andrew.cooper3@citrix.com>
 <F246E5B1-CDDA-4E2B-860A-F966E3096F7D@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <F246E5B1-CDDA-4E2B-860A-F966E3096F7D@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 16/08/2023 01:57, Henry Wang wrote:
> Hi Andrew,
> 
>> On Aug 16, 2023, at 00:14, Andrew Cooper <andrew.cooper3@citrix.com> wrote:
>>
>> This issue has been addressed in the 4.18 timeframe.

If you want a commit:

abb1522832bb ("xen/arm: Allow the user to build Xen with UBSAN")


>>
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> 
> Reviewed-by: Henry Wang <Henry.Wang@arm.com>
Acked-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall

