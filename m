Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 67738702807
	for <lists+xen-devel@lfdr.de>; Mon, 15 May 2023 11:13:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.534677.831938 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pyUGf-0007mQ-AU; Mon, 15 May 2023 09:13:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 534677.831938; Mon, 15 May 2023 09:13:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pyUGf-0007jm-7I; Mon, 15 May 2023 09:13:21 +0000
Received: by outflank-mailman (input) for mailman id 534677;
 Mon, 15 May 2023 09:13:20 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1pyUGe-0007je-30
 for xen-devel@lists.xenproject.org; Mon, 15 May 2023 09:13:20 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pyUGd-0002EJ-S5; Mon, 15 May 2023 09:13:19 +0000
Received: from 54-240-197-226.amazon.com ([54.240.197.226]
 helo=[192.168.27.136]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pyUGd-000384-MB; Mon, 15 May 2023 09:13:19 +0000
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
	bh=tI181xTvQCTnO2XrVULMeFyujQcoBT3EagprPcJm1Zc=; b=lYz68YA1/EQsRfHAzIV2oeNgXp
	NRo+LL1laSN/13JHi0ulPpeVY0CjXwUnk7iOR5Qw3G1FwnFM7ZnRXTA4px1o0/6t5/kor7TFdegD4
	TQt09k3lDWdTohK+zKpw8gNmtQxZnOLY5B9YVo0VAmBoF2ErjUWb9QxmoXqHuwFbIN9Y=;
Message-ID: <5c5b3924-57f4-284e-d1b4-d7de8c143bb9@xen.org>
Date: Mon, 15 May 2023 10:13:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.10.0
Subject: Re: [PATCH v2 0/2] xen/arm: domain_build: map_{dt_}irq_to_domain()
 fixes
Content-Language: en-US
To: Michal Orzel <michal.orzel@amd.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20230511130218.22606-1-michal.orzel@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20230511130218.22606-1-michal.orzel@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Michal,

On 11/05/2023 14:02, Michal Orzel wrote:
> Propagate return code correctly + fix the format specifiers.
> 
> Michal Orzel (2):
>    xen/arm: domain_build: Propagate return code of map_irq_to_domain()
>    xen/arm: domain_build: Fix format specifiers in
>      map_{dt_}irq_to_domain()

I have committed the series.

Cheers,

-- 
Julien Grall

