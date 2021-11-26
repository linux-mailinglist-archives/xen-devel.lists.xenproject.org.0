Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AD3D445EB02
	for <lists+xen-devel@lfdr.de>; Fri, 26 Nov 2021 11:05:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.232477.403078 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mqY5p-00057D-AH; Fri, 26 Nov 2021 10:04:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 232477.403078; Fri, 26 Nov 2021 10:04:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mqY5p-000541-6d; Fri, 26 Nov 2021 10:04:33 +0000
Received: by outflank-mailman (input) for mailman id 232477;
 Fri, 26 Nov 2021 10:04:31 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1mqY5n-0004oJ-AM
 for xen-devel@lists.xenproject.org; Fri, 26 Nov 2021 10:04:31 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mqY5k-00041P-2E; Fri, 26 Nov 2021 10:04:28 +0000
Received: from 54-240-197-228.amazon.com ([54.240.197.228]
 helo=[192.168.23.115]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mqY5j-0006sE-RZ; Fri, 26 Nov 2021 10:04:27 +0000
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
	bh=MlRYbGiR2f+L6kIx2bzJDdgc+MmHyad5LFQJzA1tOvs=; b=YjRu6fNbMnEA99x85jLSZYZi1z
	uvfCGnt0S401Ho+aOULEgtLV0SPVhurLqoi5uLaRjh66nzbxYFsXciPBAsTRh6O6f1NyW8AkQLfly
	hcxNYApqEa1b7FXWoKhfv1yBTZhrw0o8WcWOkVJPSp6QamlXynvxecmwFcF8TU70ZoXY=;
Message-ID: <6bcd1555-ee0d-dd6d-55ca-0ca0e64c3623@xen.org>
Date: Fri, 26 Nov 2021 10:04:25 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.3.2
Subject: Re: [PATCH 1/7] xz: add fall-through comments to a switch statement
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <f96f014c-057a-80a7-b19d-04d7234d3f64@suse.com>
 <0ed245fa-58a7-a5f6-b82e-48f9ed0b6970@suse.com>
 <a36df6b5-9f55-a199-e8d3-3f6cd58a054d@xen.org>
 <b28ec75a-f5e5-cd3d-12b5-20338c7c88e0@xen.org>
 <0c0e67f3-5e0a-f047-ca09-1cf078e6b094@suse.com>
 <71ef250c-be92-2b2f-0f07-ce32c17d8050@xen.org>
 <ceec5b56-65fc-8bb4-b9e0-1e16aea8c412@suse.com>
 <c2d312c2-c413-4e07-1c0c-8652cab40784@xen.org>
 <0b808ce0-23a2-65ae-dfb3-b167d5565b31@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <0b808ce0-23a2-65ae-dfb3-b167d5565b31@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Jan,

On 26/11/2021 09:12, Jan Beulich wrote:
>> Anyway, I think it would save time for everyone (you had to manually
>> delete signed-off-by after all) if you just copy the commit (including
>> all the signed-off-by) message as-is.
> 
> I don't think I see why you found it necessary to verify the S-o-b set.

This is a list of difference with the Linux commit that was unexplained 
to me.

> 
> Also note that, for things to be useful in our tree, I may also edit
> commit messages in mechanical ways (e.g. to change file or function
> names). I don't think you can expect a 1:1 match in any event.

I am fully aware that I can't expect a 1:1 match. However, if I see a 
difference, then I need to be able to explain it.

For this case, you provided some sort of an explanation but so far, I am 
still waiting for a link to confirm that the signed-off-by match the one 
on the ML.

Cheers,

-- 
Julien Grall

