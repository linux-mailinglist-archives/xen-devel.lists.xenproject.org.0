Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D195250083
	for <lists+xen-devel@lfdr.de>; Mon, 24 Aug 2020 17:11:00 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kAE6o-0003Wg-1o; Mon, 24 Aug 2020 15:10:06 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=G0tX=CC=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1kAE6m-0003IX-4h
 for xen-devel@lists.xenproject.org; Mon, 24 Aug 2020 15:10:04 +0000
X-Inumbo-ID: 01e2b027-9a92-4308-b2b4-ecf513966c49
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 01e2b027-9a92-4308-b2b4-ecf513966c49;
 Mon, 24 Aug 2020 15:10:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:To:Subject;
 bh=eTepIyxh64FTMXOKFNpbgDupnh6u1h+b0WL1u2zJmlA=; b=r6SL9PVYFUG+VumhSAgisOAJlm
 I8R7n3GQWiKRWf8h+zvBO4O0xhzUpifKNK3iyxWF5W24DUeG3PUquF64AhJpp1Sx343IHuzeIPemY
 w5obyhbixiSqY32uzz1ZdTn/pkhqsjF6qlcCHxHxRvL0zgt7WK7tMvWbCLrMdbL7wWxI=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kAE6k-00051u-Vp; Mon, 24 Aug 2020 15:10:02 +0000
Received: from [54.239.6.186] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kAE6k-0001QW-Or; Mon, 24 Aug 2020 15:10:02 +0000
Subject: Re: MFN on ARM
To: luckybreak051779 <luckybreak051779@gmail.com>,
 xen-devel@lists.xenproject.org
References: <CAN00iyXLZXkXkq2Umg8K+hyJS=-+bzLeBVcaUEWOuMe-91T4eA@mail.gmail.com>
From: Julien Grall <julien@xen.org>
Message-ID: <aaf57295-0f13-2af6-650a-b9ccbf8d7733@xen.org>
Date: Mon, 24 Aug 2020 16:10:01 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <CAN00iyXLZXkXkq2Umg8K+hyJS=-+bzLeBVcaUEWOuMe-91T4eA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Hi,

On 24/08/2020 15:23, luckybreak051779 wrote:
> Xen Team:
> 
> I am running Xen 4.13.0 on a 32-bit ARM processor.  In a domU driver I 
> use the dma_map_single() function to obtain a DMA address.
> How can I get the MFN of that DMA address from inside the domU?

We don't provide a way to find the MFN from a Guest Physical Frame.

>  I need 
> the MFN to be able to differentiate between
> two identical domUs running the same driver code (e.g. both calling 
> dma_map_single() ).
Can you give more details of your setup? Are you trying to use the same 
physical device in two domUs?

Cheers,

-- 
Julien Grall

