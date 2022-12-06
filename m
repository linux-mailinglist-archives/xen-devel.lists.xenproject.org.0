Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 99FA4644B02
	for <lists+xen-devel@lfdr.de>; Tue,  6 Dec 2022 19:18:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.455446.712917 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p2cWK-0005cm-Pc; Tue, 06 Dec 2022 18:18:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 455446.712917; Tue, 06 Dec 2022 18:18:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p2cWK-0005ZG-Lv; Tue, 06 Dec 2022 18:18:20 +0000
Received: by outflank-mailman (input) for mailman id 455446;
 Tue, 06 Dec 2022 18:18:19 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1p2cWJ-0005ZA-Nh
 for xen-devel@lists.xenproject.org; Tue, 06 Dec 2022 18:18:19 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1p2cWH-0006y1-3E; Tue, 06 Dec 2022 18:18:17 +0000
Received: from [54.239.6.185] (helo=[192.168.22.87])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1p2cWG-0003SM-TX; Tue, 06 Dec 2022 18:18:17 +0000
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
	bh=GIxIjfPd7U4GxRGuEgO0YGWz1JnagpYLJBgXjghuzNI=; b=2w0Wrn9uXgRNdag3Kyzl+bm6fq
	YhPa8zzStG7MKWMfT/ZdkiSl6RZmAiB11PXyU/vQqg0F0Agcv7B8npxivbD7a9Ll/kT7oWOe3oRlm
	SQHR7HNlFiYWHj609aDENz7FEb2pM09XoJAaRioNcb4L2GwZfG1easIjox2YXtAwuoK0=;
Message-ID: <fc1de779-48e5-6526-02cc-f1fdc468e2bb@xen.org>
Date: Tue, 6 Dec 2022 18:18:15 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.1
Subject: Re: preparations for 4.16.3
Content-Language: en-US
From: Julien Grall <julien@xen.org>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 Anthony Perard <anthony.perard@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <2c4c605e-f8c5-abbb-db85-89465b7e10a6@suse.com>
 <1f3d3a05-fe11-b156-da93-03913be687de@xen.org>
In-Reply-To: <1f3d3a05-fe11-b156-da93-03913be687de@xen.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

@Stefano, gentle ping. Jan said he wanted to have 4.16 cut before the 
holidays.

On 01/12/2022 15:19, Julien Grall wrote:
> Hi Jan & Stefano,
> 
> On 28/11/2022 10:50, Jan Beulich wrote:
>> All,
>>
>> the release is due in a couple of weeks time; ideally we'd get it out
>> before the year end break.
>>
>> Please point out backports you find missing from the respective staging
>> branch, but which you consider relevant.
> 
> I have just one backport request:
> 
> db8fa01c61db0317a9ee947925226234c65d48e8 "xen/arm: Correct the p2m pool 
> size calculations"

Cheers,

-- 
Julien Grall

