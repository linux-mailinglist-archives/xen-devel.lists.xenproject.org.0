Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0397279E8E3
	for <lists+xen-devel@lfdr.de>; Wed, 13 Sep 2023 15:15:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.601294.937286 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qgPhm-0001yU-EZ; Wed, 13 Sep 2023 13:14:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 601294.937286; Wed, 13 Sep 2023 13:14:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qgPhm-0001wE-Ba; Wed, 13 Sep 2023 13:14:54 +0000
Received: by outflank-mailman (input) for mailman id 601294;
 Wed, 13 Sep 2023 13:14:53 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qgPhl-0001w8-A3
 for xen-devel@lists.xenproject.org; Wed, 13 Sep 2023 13:14:53 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qgPhk-0006eY-LD; Wed, 13 Sep 2023 13:14:52 +0000
Received: from [15.248.2.159] (helo=[10.24.67.43])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qgPhk-00084O-Eb; Wed, 13 Sep 2023 13:14:52 +0000
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
	bh=T4mkSz5emr2I51xjB1yvKgAyalcP7Ht/tLdQzFglMlM=; b=Ie+tv1qlYngpWAPEbJ/1LVlTBD
	kHbGksC1kYZ/l2otaa5uhL1MUXvyI0ySBNarpdzQXv5U4GThlKwQoiBYdJYLR46P+lOHY4TlW1bbT
	RGVwXXxlmn9pxSVPurCiiKM3pCQHpmTS9jJMSKn/uFqcH/ZJCSKggBjZbiFJYEUnJVn8=;
Message-ID: <78e45fa1-7273-45f4-bac5-45c4e0772a0d@xen.org>
Date: Wed, 13 Sep 2023 14:14:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH] xen/libelf: address violations of MISRA C:2012 RUles
 8.2 and 8.3
Content-Language: en-GB
To: Federico Serafini <federico.serafini@bugseng.com>,
 xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <e4d28b9b78e84260feea6bdbcb4ecdd815af5db3.1694591513.git.federico.serafini@bugseng.com>
 <9acf798a-9d08-4940-d8e0-20b423294d2e@bugseng.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <9acf798a-9d08-4940-d8e0-20b423294d2e@bugseng.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 13/09/2023 13:41, Federico Serafini wrote:
> On 13/09/23 14:29, Federico Serafini wrote:
>> Add missing parameter names and make function declarations and
>> definitions consistent. No functional change.
>>
>> Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
> 
> There is a typo in the patch title (RUles), please correct on commit.

That can be done so long there are no other comments.

> 
> Reviewed-by: Federico Serafini <federico.serafini@bugseng.com>

I am bit confused. Why do you provide a reviewed-by on a patch you wrote?

Cheers,

-- 
Julien Grall

