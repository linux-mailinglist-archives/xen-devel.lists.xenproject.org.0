Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E48023E92C8
	for <lists+xen-devel@lfdr.de>; Wed, 11 Aug 2021 15:35:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.166067.303285 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mDoO8-0003zp-Ad; Wed, 11 Aug 2021 13:35:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 166067.303285; Wed, 11 Aug 2021 13:35:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mDoO8-0003x8-7b; Wed, 11 Aug 2021 13:35:20 +0000
Received: by outflank-mailman (input) for mailman id 166067;
 Wed, 11 Aug 2021 13:35:19 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1mDoO6-0003x2-Vp
 for xen-devel@lists.xenproject.org; Wed, 11 Aug 2021 13:35:18 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mDoO6-0006f1-Qx; Wed, 11 Aug 2021 13:35:18 +0000
Received: from [54.239.6.188] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mDoO6-0004UN-Km; Wed, 11 Aug 2021 13:35:18 +0000
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
	bh=ggsBGaK8kKN5q833VK3TF/BRHDnBU5gHpAvHmIMQDNM=; b=5NTU1FHg6uUwoFwePluL+wq3MM
	44twdJbSyDSylWc9hGUmOaOrnz+CE9DvXIs8TzFvpbFftTLIlQn4Dd65wqfHsphWof5WWG7Nmcmmw
	RaeC7nWJ/s6c+M9uGWCqR9AJQhwFU7X+kMfmq2QJ1b698VLJy+TDNK+LrcS4XuKyB3uw=;
Subject: Re: [PATCH V4 02/10] xen/arm: introduce new helper
 device_tree_get_meminfo
To: Penny Zheng <penny.zheng@arm.com>, xen-devel@lists.xenproject.org,
 sstabellini@kernel.org
Cc: Bertrand.Marquis@arm.com, Wei.Chen@arm.com, nd@arm.com
References: <20210728102758.3269446-1-penny.zheng@arm.com>
 <20210728102758.3269446-3-penny.zheng@arm.com>
From: Julien Grall <julien@xen.org>
Message-ID: <9c4ca259-1a9d-be2c-dd5b-8456f1caaf6e@xen.org>
Date: Wed, 11 Aug 2021 14:35:16 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <20210728102758.3269446-3-penny.zheng@arm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Penny,

On 28/07/2021 11:27, Penny Zheng wrote:
> A few functions iterate over the device tree property to get memory info,
> like "reg" or "xen,static-mem", so this commit creates a new helper
> device_tree_get_meminfo to extract the
> common codes.
> 
> Signed-off-by: Penny Zheng <penny.zheng@arm.com>

Ah, this is where you did the consolidation. Sorry, I didn't notice this 
patch.

In general, we are avoiding to introduce code and then rework it in the 
same series. Instead, the rework is done first and then the function is 
used.

So can you move this patch first?

Cheers,

-- 
Julien Grall

