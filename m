Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B72A9646243
	for <lists+xen-devel@lfdr.de>; Wed,  7 Dec 2022 21:17:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.456592.714366 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p30qX-0000eH-Ia; Wed, 07 Dec 2022 20:16:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 456592.714366; Wed, 07 Dec 2022 20:16:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p30qX-0000bh-FO; Wed, 07 Dec 2022 20:16:49 +0000
Received: by outflank-mailman (input) for mailman id 456592;
 Wed, 07 Dec 2022 20:16:48 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1p30qW-0000bb-B2
 for xen-devel@lists.xenproject.org; Wed, 07 Dec 2022 20:16:48 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1p30qU-0002kt-5G; Wed, 07 Dec 2022 20:16:46 +0000
Received: from [15.248.2.156] (helo=[10.24.67.23])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1p30qT-0007Kg-Vi; Wed, 07 Dec 2022 20:16:46 +0000
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
	bh=dI0mo9z6D8dGUJF6r+EjmJe1cgN1Kjh0sCGnT6gA2EM=; b=aqNmU4HbkP21lzeTkFK2o7E0dm
	rSJwiEL4ZepgXR0Y5I7sfJDW/jpAx89eYS3DP01FsBendJFBTrdXPj5h+NdVob/vV3u/z2ubZYQZZ
	ExB+rDJN0nmn+jIMkexq5YDY+/FvSJ3HFE/Fqx3oZut2Z0BHpyfRv1IiAIvAveKrAqao=;
Message-ID: <7724f0e2-4e38-9c49-b49b-16df28743d8a@xen.org>
Date: Wed, 7 Dec 2022 20:16:43 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.1
Subject: Re: [PATCH v6 0/2] Final changelog changes for 4.17
Content-Language: en-US
To: Henry Wang <Henry.Wang@arm.com>, xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Community Manager <community.manager@xenproject.org>
References: <20221201113910.1984744-1-Henry.Wang@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20221201113910.1984744-1-Henry.Wang@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 01/12/2022 11:39, Henry Wang wrote:
> Hi all,
> 
> These two patches should be the final changelog changes for 4.17.
> 
> The first patch sets the release date and tag of 4.17 release and
> should be "backported" to the staging/stable-4.17.
> 
> The second patch starts a new unstable section, so should be in
> unstable master/staging only.
> 
> Thanks.
> 
> Henry
> 
> Henry Wang (2):
>    CHANGELOG: Set 4.17 release date and tag
>    CHANGELOG: Start new "unstable" section

I have committed the two to staging and only the first one to staging-4.17.

I have also tagged all QEMU-trad, QEMU and Mini-OS tree in preparation 
for the release.

The Xen tree only need the patch [1] and then I can tag after a last 
push to stable.

Cheers,

[1] 
https://lore.kernel.org/xen-devel/20221207195907.23606-1-julien@xen.org/T/#u


-- 
Julien Grall

