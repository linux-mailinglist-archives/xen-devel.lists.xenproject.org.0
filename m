Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 20DC1743C58
	for <lists+xen-devel@lfdr.de>; Fri, 30 Jun 2023 15:05:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.557484.870849 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qFDoR-0004lx-4L; Fri, 30 Jun 2023 13:05:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 557484.870849; Fri, 30 Jun 2023 13:05:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qFDoR-0004kE-1f; Fri, 30 Jun 2023 13:05:23 +0000
Received: by outflank-mailman (input) for mailman id 557484;
 Fri, 30 Jun 2023 13:05:21 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qFDoP-0004k8-7H
 for xen-devel@lists.xenproject.org; Fri, 30 Jun 2023 13:05:21 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qFDoO-0006Mp-Rz; Fri, 30 Jun 2023 13:05:20 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.240])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qFDoO-0002fz-JQ; Fri, 30 Jun 2023 13:05:20 +0000
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
	bh=YxevsJt9haXTnO9jSG/kuuNkfvjc1lcPowPjB3zFFX4=; b=gYH0DYWKLuXxetJ+G9riLzIHOt
	cvHI1Go/BBnJEGaRh6uUrixFHElxwCcu2zeD0hbvSu20j4Fz/i4I2ToGTyunSbDNGkeaKaeNJOwjV
	RqkBoQdUZdY7a8QyH8k1gTjD/ALb5KoazULEma0NpNmoxLuxlKT1zmT1GahDj2Ln9szY=;
Message-ID: <9ea987c3-e5d4-59dc-c9a9-8227b26ab2f7@xen.org>
Date: Fri, 30 Jun 2023 14:05:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.12.0
Subject: Re: [PATCH] {x86,arm}/mm.c: Make populate_pt_range __init
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@cloud.com>, xen-devel@lists.xenproject.org
Cc: George Dunlap <george.dunlap@citrix.com>, Jan Beulich
 <jbeulich@suse.com>, Roger Pau Monne <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <20230630124509.730368-1-george.dunlap@cloud.com>
 <35b638ae-782e-f0e0-3962-2936f617b9e4@citrix.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <35b638ae-782e-f0e0-3962-2936f617b9e4@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 30/06/2023 13:57, Andrew Cooper wrote:
> On 30/06/2023 1:45 pm, George Dunlap wrote:
>> From: George Dunlap <george.dunlap@citrix.com>
>>
>> It's only called from another __init function.
>>
>> Signed-off-by: George Dunlap <george.dunlap@citrix.com>
>> ---
>> This is a random patch I found in a branch named "xsa345-post".
> 
> I have far too many branches like that...

Same here :).

> 
> Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

Acked-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall

