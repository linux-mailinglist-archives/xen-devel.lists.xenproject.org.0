Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 788E3574B8E
	for <lists+xen-devel@lfdr.de>; Thu, 14 Jul 2022 13:09:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.367585.598648 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oBwi2-0005bR-1o; Thu, 14 Jul 2022 11:08:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 367585.598648; Thu, 14 Jul 2022 11:08:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oBwi1-0005Yz-VI; Thu, 14 Jul 2022 11:08:41 +0000
Received: by outflank-mailman (input) for mailman id 367585;
 Thu, 14 Jul 2022 11:08:40 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1oBwi0-0005Yl-Fq
 for xen-devel@lists.xenproject.org; Thu, 14 Jul 2022 11:08:40 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oBwhz-0002C5-Qy; Thu, 14 Jul 2022 11:08:39 +0000
Received: from 54-240-197-226.amazon.com ([54.240.197.226] helo=[10.7.239.30])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oBwhz-0007KP-LN; Thu, 14 Jul 2022 11:08:39 +0000
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
	bh=vrY0Op20dG3xf4WFqXZ3HrIBS3lGeXpOVlxhgZv8Db8=; b=TugnwwK46lxtBFCMFG35RwOoSv
	JFKyClScvEKMW+bn94B3DtLUjyyHDBDesR81XJYu+q3qljVcKPeDQdoLnuktA1qyoi9djuwaNyWUP
	A1dJcAawJOlRqibGC2BKekOvtbqhC8CnGuLABa9czde1unEsMjzuHZf10KZo6LNZ44gU=;
Message-ID: <aec6c0c9-c221-3f35-9e8a-851b0afc6bc3@xen.org>
Date: Thu, 14 Jul 2022 12:08:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.11.0
Subject: Re: [PATCH v2] xen/arm: traps: Fix MISRA C 2012 Rule 8.4 violation
To: Stefano Stabellini <sstabellini@kernel.org>,
 Xenia Ragiadakou <burzalodowa@gmail.com>
Cc: xen-devel@lists.xenproject.org, Volodymyr_Babchuk@epam.com,
 bertrand.marquis@arm.com
References: <20220706121156.666500-1-burzalodowa@gmail.com>
 <alpine.DEB.2.22.394.2207061642120.2354836@ubuntu-linux-20-04-desktop>
From: Julien Grall <julien@xen.org>
In-Reply-To: <alpine.DEB.2.22.394.2207061642120.2354836@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 07/07/2022 00:42, Stefano Stabellini wrote:
> On Wed, 6 Jul 2022, Xenia Ragiadakou wrote:
>> Add the function prototype of show_stack() in <asm/processor.h> header file
>> so that it is visible before its definition in traps.c.
>>
>> Although show_stack() is referenced only in traps.c, it is declared with
>> external linkage because, during development, it is often called also by
>> other files for debugging purposes. Declaring it static would increase
>> development effort. Add appropriate comment
>>
>> Signed-off-by: Xenia Ragiadakou <burzalodowa@gmail.com>
> 
> Acked-by: Stefano Stabellini <sstabellini@kernel.org>

Committed.

Cheers,

-- 
Julien Grall

