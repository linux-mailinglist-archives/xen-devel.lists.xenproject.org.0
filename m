Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D5913254FE
	for <lists+xen-devel@lfdr.de>; Thu, 25 Feb 2021 18:58:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.89921.169903 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lFKtq-0008He-Q4; Thu, 25 Feb 2021 17:58:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 89921.169903; Thu, 25 Feb 2021 17:58:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lFKtq-0008HF-Mb; Thu, 25 Feb 2021 17:58:06 +0000
Received: by outflank-mailman (input) for mailman id 89921;
 Thu, 25 Feb 2021 17:58:05 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1lFKtp-0008H9-31
 for xen-devel@lists.xenproject.org; Thu, 25 Feb 2021 17:58:05 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lFKtl-00068I-BO; Thu, 25 Feb 2021 17:58:01 +0000
Received: from 54-240-197-238.amazon.com ([54.240.197.238]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lFKtl-0004AD-31; Thu, 25 Feb 2021 17:58:01 +0000
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
	bh=3n9vVZeN9zT7qYBwHJw/YRFdCo4omBMafa8x+45549o=; b=EUmMsZ5kELnsjJexTht27mhvzQ
	XGSNy3RucZhIgY0TpbuR6BHgEsg4F53vHp6sL95aehX+Whsg781DUWSLvCwPoHV4xGwrHIkyMSf5W
	RXTxsyiBbOUgrvXnn6bddr+0dZMshUn9QwszWmoi7dswI9+yhYTvQCtVfZ7lPU3swrik=;
Subject: Re: [PATCH for-4.15 0/5] xenstore: Address coverity issues in the
 LiveUpdate code
To: Ian Jackson <iwj@xenproject.org>
Cc: xen-devel@lists.xenproject.org, raphning@amazon.co.uk,
 Julien Grall <jgrall@amazon.com>, Wei Liu <wl@xen.org>,
 Juergen Gross <jgross@suse.com>
References: <20210225174131.10115-1-julien@xen.org>
 <24631.58442.167560.663929@mariner.uk.xensource.com>
From: Julien Grall <julien@xen.org>
Message-ID: <ef866801-27f1-245c-74c6-0b1e08c627af@xen.org>
Date: Thu, 25 Feb 2021 17:57:59 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <24631.58442.167560.663929@mariner.uk.xensource.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Ian,

On 25/02/2021 17:54, Ian Jackson wrote:
> Julien Grall writes ("[PATCH for-4.15 0/5] xenstore: Address coverity issues in the LiveUpdate code"):
>>    tools/xenstored: Avoid unnecessary talloc_strdup() in do_control_lu()
>>    tools/xenstored: Avoid unnecessary talloc_strdup() in do_lu_start()
>>    tools/xenstored: control: Store the save filename in lu_dump_state
>>    tools/xenstore-control: Don't leak buf in live_update_start()
> 
> These four are actual bugfixes:
> 
> Release-Acked-by: Ian Jackson <iwj@xenproject.org>

Thanks!

> 
>>    tools/xenstored: Silence coverity when using xs_state_* structures
> 
> For this I can't see a reason to give a release ack ?  See also Andy's
> comments.

I don't have a reason for this one as it is so far just silencing 
Coverity. Sorry I should have mention that this one is not really 4.15 
material.

Cheers,

-- 
Julien Grall

