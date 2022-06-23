Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1017D5587D2
	for <lists+xen-devel@lfdr.de>; Thu, 23 Jun 2022 20:52:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.355158.582650 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o4Rw2-0002Lv-25; Thu, 23 Jun 2022 18:52:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 355158.582650; Thu, 23 Jun 2022 18:52:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o4Rw1-0002Jt-Ub; Thu, 23 Jun 2022 18:52:09 +0000
Received: by outflank-mailman (input) for mailman id 355158;
 Thu, 23 Jun 2022 18:52:09 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1o4Rw1-0002Jn-3U
 for xen-devel@lists.xenproject.org; Thu, 23 Jun 2022 18:52:09 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1o4Rw0-0003Yz-Av; Thu, 23 Jun 2022 18:52:08 +0000
Received: from 54-240-197-234.amazon.com ([54.240.197.234]
 helo=[192.168.0.239]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1o4Rw0-0002xF-2D; Thu, 23 Jun 2022 18:52:08 +0000
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
	bh=6HUAoMgu7OAuQziJOh1VskMn2fbI/nwiDwPyLEcVb6s=; b=upNUfFMS7CvBlDA0x6ldEAq2Fs
	XNId6BnGbg1tvPOuuIj3BFXXmjIyH/vFzttXAri+8xPBPldOQ0M2YyKHI3MAw3iVkwqvPigYwdPQZ
	kMYi7kbb6QXRICeckACrfCBfeUUc0YD/bGoiJdpDVqGtCKSfULJDEaLhsayCj0FSZD9w=;
Message-ID: <42ccc891-d56a-8928-c94b-911076ff7e85@xen.org>
Date: Thu, 23 Jun 2022 19:52:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.10.0
Subject: Re: [PATCH 1/3] xen/arm: shutdown: Fix MISRA C 2012 Rule 8.4
 violation
To: Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Xenia Ragiadakou <burzalodowa@gmail.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20220622151514.545850-1-burzalodowa@gmail.com>
 <50F8F42B-F82B-4F9C-87B4-6090A5BB2B57@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <50F8F42B-F82B-4F9C-87B4-6090A5BB2B57@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Xenia,

On 22/06/2022 16:19, Bertrand Marquis wrote:
>> On 22 Jun 2022, at 16:15, Xenia Ragiadakou <burzalodowa@gmail.com> wrote:
>>
>> Include header <xen/shutdown.h> so that the declarations of the functions
>> machine_halt() and machine_restart(), which have external linkage, are visible
>> before the function definitions.
>>
>> Signed-off-by: Xenia Ragiadakou <burzalodowa@gmail.com>
> Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

I couldn't find a cover letter. So replying here.

The series is now committed.

In the future, please create a cover letter when you send multiple 
patches (git-format-patch should already do that for you).

Cheers,

-- 
Julien Grall

