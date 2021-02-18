Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B94C731E87B
	for <lists+xen-devel@lfdr.de>; Thu, 18 Feb 2021 11:35:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.86529.162566 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lCgdl-0001Th-3Q; Thu, 18 Feb 2021 10:34:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 86529.162566; Thu, 18 Feb 2021 10:34:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lCgdl-0001TI-0B; Thu, 18 Feb 2021 10:34:33 +0000
Received: by outflank-mailman (input) for mailman id 86529;
 Thu, 18 Feb 2021 10:34:30 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1lCgdi-0001TD-Sp
 for xen-devel@lists.xenproject.org; Thu, 18 Feb 2021 10:34:30 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lCgdh-0003cD-RC; Thu, 18 Feb 2021 10:34:29 +0000
Received: from [54.239.6.188] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lCgdh-0003KJ-Ja; Thu, 18 Feb 2021 10:34:29 +0000
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
	bh=/thO9y/7clmp/qafZw7NmxL30/2KKyrk1CbITDs9Fx8=; b=0L2RFhHHuDdjx5lhgg1O06vmsg
	8cpJ1mjnKsh1YdqqLzKQSREaXvCumixWy3ccu9XA6Q8IP1k1jqmdnsXMjq5gQxWPoE4LsgxnlE8i4
	mciCWg8zxwMnYacKrpWIKQxvpdh5PN6Qz2bOUDCeCJpwnDgUGH3Y3Ub5Scvrl1myUxG8=;
Subject: Re: [RFC] xen/arm: introduce XENFEAT_ARM_dom0_iommu
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org, Bertrand.Marquis@arm.com,
 Volodymyr_Babchuk@epam.com, rahul.singh@arm.com
References: <alpine.DEB.2.21.2102161333090.3234@sstabellini-ThinkPad-T480s>
 <2d22d5b8-6cda-f27b-e938-4806b65794a5@xen.org>
 <alpine.DEB.2.21.2102171233270.3234@sstabellini-ThinkPad-T480s>
From: Julien Grall <julien@xen.org>
Message-ID: <b9ffc8ac-e87a-253e-0658-8e27c5cc046e@xen.org>
Date: Thu, 18 Feb 2021 10:34:27 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.2102171233270.3234@sstabellini-ThinkPad-T480s>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Stefano,

On 17/02/2021 23:54, Stefano Stabellini wrote:
> On Wed, 17 Feb 2021, Julien Grall wrote:
>> On 17/02/2021 02:00, Stefano Stabellini wrote:
> 
> I saw that the topic has generated quite a bit of discussion. I suggest
> we keep gathering data and do brainstorming on the thread for a few days
> and in the meantime schedule a call for late next week to figure out a
> way forward?

I forgot to answer to this bit, sorry. I am happy to have a call about this.

Cheers,

-- 
Julien Grall

