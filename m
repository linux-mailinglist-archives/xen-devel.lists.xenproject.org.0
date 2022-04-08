Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4250E4F9B7D
	for <lists+xen-devel@lfdr.de>; Fri,  8 Apr 2022 19:19:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.301714.514950 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ncsGj-00026m-BQ; Fri, 08 Apr 2022 17:19:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 301714.514950; Fri, 08 Apr 2022 17:19:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ncsGj-000240-8P; Fri, 08 Apr 2022 17:19:33 +0000
Received: by outflank-mailman (input) for mailman id 301714;
 Fri, 08 Apr 2022 17:19:31 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1ncsGh-00023u-B7
 for xen-devel@lists.xenproject.org; Fri, 08 Apr 2022 17:19:31 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1ncsGe-0007VH-SL; Fri, 08 Apr 2022 17:19:28 +0000
Received: from [54.239.6.190] (helo=[192.168.16.176])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1ncsGe-00008Y-MB; Fri, 08 Apr 2022 17:19:28 +0000
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
	bh=Qn3UzhhlOvXOZ1ANcSgA5LBCniAwrX0PiTAcl9iakWM=; b=3vEU047UpQWjx3i28xVWMqfIfB
	GgkA9FD5mcuDcxIlTkOyICKb6BSfCHzYWj2QmicZgV2pq8qKTgeaYHSsxesOuJlGC8M1tJJ8NcsZV
	v5rjZ4s8jQAVfEltNL96cdtxW52ob9iI+KFJ9DORjzznXgBfk7hvrgItqmACgQD0wGxw=;
Message-ID: <b8b62b5f-a643-2624-fa57-ad42d315b39e@xen.org>
Date: Fri, 8 Apr 2022 18:19:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.7.0
Subject: Re: [PATCH v3] SUPPORT.md: add Dom0less as Supported
To: Henry Wang <Henry.Wang@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
 "george.dunlap@citrix.com" <george.dunlap@citrix.com>,
 "jbeulich@suse.com" <jbeulich@suse.com>, "wl@xen.org" <wl@xen.org>
References: <alpine.DEB.2.22.394.2204071706470.2910984@ubuntu-linux-20-04-desktop>
 <PA4PR08MB6253660FF724000CFCD7A8C192E99@PA4PR08MB6253.eurprd08.prod.outlook.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <PA4PR08MB6253660FF724000CFCD7A8C192E99@PA4PR08MB6253.eurprd08.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Henry,

On 08/04/2022 01:50, Henry Wang wrote:
>> -----Original Message-----
>> From: Xen-devel <xen-devel-bounces@lists.xenproject.org> On Behalf Of
>> Stefano Stabellini
>> Sent: Friday, April 8, 2022 8:11 AM
>> To: xen-devel@lists.xenproject.org
>> Cc: sstabellini@kernel.org; julien@xen.org; andrew.cooper3@citrix.com;
>> george.dunlap@citrix.com; jbeulich@suse.com; wl@xen.org
>> Subject: [PATCH v3] SUPPORT.md: add Dom0less as Supported
>>
>> Add Dom0less to SUPPORT.md to clarify its support status. The feature is
>> mature enough and small enough to make it security supported.
>>
>> Clarify that dom0less DomUs memory is not scrubbed at boot when
>> bootscrub=on or bootscrub=off are passed as Xen command line parameters,
>> and no XSAs will be issued for that.
>>
>> Also see XSA-372: 371347c5b64da and fd5dc41ceaed.
>>
>> Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
>> Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>
>> ---
>> Changes in v3:
>> - improve commit messahe
> 
> For the patch I don't have any comments, but I think here we've got
> a typo: s/messahe/message. I think it is ok to fix while committing this
> patch so this is just a kind reminder :))

Anything after --- will be stripped by git am. So there is nothing to 
fix it on commit.

Cheers,

-- 
Julien Grall

