Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D16FB5514B2
	for <lists+xen-devel@lfdr.de>; Mon, 20 Jun 2022 11:47:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.352642.579466 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o3E0U-0005Q4-Ox; Mon, 20 Jun 2022 09:47:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 352642.579466; Mon, 20 Jun 2022 09:47:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o3E0U-0005NT-LY; Mon, 20 Jun 2022 09:47:42 +0000
Received: by outflank-mailman (input) for mailman id 352642;
 Mon, 20 Jun 2022 09:47:41 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1o3E0T-0005NN-Gn
 for xen-devel@lists.xenproject.org; Mon, 20 Jun 2022 09:47:41 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1o3E0S-0000jN-Uz; Mon, 20 Jun 2022 09:47:40 +0000
Received: from 54-240-197-226.amazon.com ([54.240.197.226] helo=[192.168.1.39])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1o3E0S-0000XW-Op; Mon, 20 Jun 2022 09:47:40 +0000
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
	bh=/NnHuR2O7sfkCDEmvcgwPIix5vP58a2/KArTqE4jTPQ=; b=NzB/M27RkCVGsAMd8oNL7PVEFI
	EaMg5pf9mpbN+wEe+IMyXtD78LfArGYBJ7UVzOTWT8d+Ef2jKALQOyNJqTtqRhix+weFfY2a+82FA
	P81S4AmALm9/MbgQIxABrpe7kzS2450JjIJ0fZNRYF5m3E9a1P08Vc+gDfcfTd9yyLFs=;
Message-ID: <c6164f9a-cb00-2ad6-e831-b23a8e31a0e5@xen.org>
Date: Mon, 20 Jun 2022 10:47:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.10.0
Subject: Re: [PATCH 1/9] xen/arm: Use explicitly specified types
To: Michal Orzel <michal.orzel@arm.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20220620070245.77979-1-michal.orzel@arm.com>
 <20220620070245.77979-2-michal.orzel@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20220620070245.77979-2-michal.orzel@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Michal,

On 20/06/2022 08:02, Michal Orzel wrote:
> According to MISRA C 2012 Rule 8.1, types shall be explicitly
> specified. Fix all the findings reported by cppcheck with misra addon
> by substituting implicit type 'unsigned' to explicit 'unsigned int'.
> 
> Signed-off-by: Michal Orzel <michal.orzel@arm.com>

Reviewed-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall

