Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AA1DE97A88B
	for <lists+xen-devel@lfdr.de>; Mon, 16 Sep 2024 22:57:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.799702.1209673 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sqImO-0001uO-2b; Mon, 16 Sep 2024 20:57:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 799702.1209673; Mon, 16 Sep 2024 20:57:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sqImN-0001rD-VZ; Mon, 16 Sep 2024 20:57:03 +0000
Received: by outflank-mailman (input) for mailman id 799702;
 Mon, 16 Sep 2024 20:57:02 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1sqImM-0001r7-Qx
 for xen-devel@lists.xenproject.org; Mon, 16 Sep 2024 20:57:02 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1sqImL-0004OT-A7; Mon, 16 Sep 2024 20:57:01 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.244])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1sqImL-0004EU-34; Mon, 16 Sep 2024 20:57:01 +0000
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
	bh=LfUKB8mro/PRcU74Akj223ozEwPlqNdlvgxfSJWX5EY=; b=YQD0tarmq2I7weKnlmf1kUVo/l
	eNZdf8l6s6GX8e1tW6slCWclTLl9FMmkttgByAmZV1f/0b+yZdu7D2BOpIRUkoO+Mse4UcetRTx4V
	DQ2YnRYeR/pU+M4ytL5bW8gREdPXYOvTKwoHHqmK+r/YKzFjUnaXDoxAlgWPwRk3L2CI=;
Message-ID: <aa08b100-9177-4298-9377-e6428952213a@xen.org>
Date: Mon, 16 Sep 2024 21:56:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm: Drop deprecated early printk platform options
Content-Language: en-GB
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Michal Orzel <michal.orzel@amd.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20240913061529.213002-1-michal.orzel@amd.com>
 <000a8290-3e3a-4e2f-85a9-afa05c01a34e@citrix.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <000a8290-3e3a-4e2f-85a9-afa05c01a34e@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 13/09/2024 09:26, Andrew Cooper wrote:
> On 13/09/2024 7:15 am, Michal Orzel wrote:
>> The predefined configurations for early printk have been deprecated for
>> a sufficient amount of time. Let's finally remove them.
>>
>> Note:
>> In order not to loose these predefined configurations, I wrote a wiki
>> page: https://wiki.xenproject.org/wiki/Xen_on_ARM_Early_Printk
> 
> Minor point. "lose" here; "loose" is a quite-different word.

I fixed it on commit.

Cheers,

-- 
Julien Grall

