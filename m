Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 02A6845DED9
	for <lists+xen-devel@lfdr.de>; Thu, 25 Nov 2021 17:57:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.231707.401117 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mqI3W-0006Pa-MD; Thu, 25 Nov 2021 16:57:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 231707.401117; Thu, 25 Nov 2021 16:57:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mqI3W-0006MN-J0; Thu, 25 Nov 2021 16:57:06 +0000
Received: by outflank-mailman (input) for mailman id 231707;
 Thu, 25 Nov 2021 16:57:05 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1mqI3V-0006MH-2O
 for xen-devel@lists.xenproject.org; Thu, 25 Nov 2021 16:57:05 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mqI3T-0007hU-SG; Thu, 25 Nov 2021 16:57:03 +0000
Received: from 54-240-197-227.amazon.com ([54.240.197.227]
 helo=[192.168.27.59]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mqI3T-0001Dy-M9; Thu, 25 Nov 2021 16:57:03 +0000
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
	bh=EzrXBEJ9mvv0LOaiulKQw6sfsANy8HX3PqIrAU8Wh4M=; b=DMaXXEP3luyLrhLqB6RZhzFYju
	8LavE4yR9ONS2iaHXEP9xsC+foyfxC1GDkQtP2bAmZY6DYuwpfO3VyA7WytbxTe9quBxQKkfGRSps
	4qCM5a2Hs9d2NygppJKrboPoyadJXD7GVJtrvyxTWWvDZTnheDTkXU76uv8mrsqPRKNY=;
Message-ID: <65530296-a6be-b3d9-7bde-cfd8028050c9@xen.org>
Date: Thu, 25 Nov 2021 16:57:01 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.3.2
Subject: Re: [PATCH 3/7] decompressors: fix spelling mistakes
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <f96f014c-057a-80a7-b19d-04d7234d3f64@suse.com>
 <c70932d2-f3c3-2b6d-c2db-69a0c3ab2b2c@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <c70932d2-f3c3-2b6d-c2db-69a0c3ab2b2c@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Jan,

On 19/11/2021 10:21, Jan Beulich wrote:
> From: Zhen Lei <thunder.leizhen@huawei.com>
> 
> Fix some spelling mistakes in comments:
> sentinal ==> sentinel
> compresed ==> compressed
> immediatelly ==> immediately
> dervied ==> derived
> splitted ==> split
> nore ==> not
> independed ==> independent
> asumed ==> assumed
> 
> Link: https://lkml.kernel.org/r/20210604085656.12257-1-thunder.leizhen@huawei.com
> Signed-off-by: Zhen Lei <thunder.leizhen@huawei.com>
> [Linux commit: 05911c5d964956442d17fe21db239de5a1dace4a]

Same question as the two previous patch for the missing signed-off-by. 
The rest looks fine to me.

Cheers,

-- 
Julien Grall

