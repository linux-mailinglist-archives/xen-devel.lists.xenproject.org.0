Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 204B47D4D65
	for <lists+xen-devel@lfdr.de>; Tue, 24 Oct 2023 12:12:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.621794.968592 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvEOh-00073B-OG; Tue, 24 Oct 2023 10:12:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 621794.968592; Tue, 24 Oct 2023 10:12:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvEOh-00070s-Lh; Tue, 24 Oct 2023 10:12:27 +0000
Received: by outflank-mailman (input) for mailman id 621794;
 Tue, 24 Oct 2023 10:12:26 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qvEOg-00070m-FL
 for xen-devel@lists.xenproject.org; Tue, 24 Oct 2023 10:12:26 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qvEOg-0004kt-4r; Tue, 24 Oct 2023 10:12:26 +0000
Received: from 54-240-197-227.amazon.com ([54.240.197.227]
 helo=[192.168.12.80]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qvEOf-00064N-V9; Tue, 24 Oct 2023 10:12:26 +0000
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
	bh=WW7KyOF0YYzYrFAS6L8+3C/I5C2dRsyUWj2AVPlfGDw=; b=tXg7vfVei/Mb1DeWphM7h0TZin
	+XfZfkrNfM66ZeK0FvrhC+GEL/cl1VJ7LFzpUJkXwoWgiDShfRIBhNkqshmIZx6xpDnExloAv4k16
	NxHvsMsOHo9O1rZh8bn0NEOLcp+pNoPxXlqynLYh4V6HGHsjKuTW34yKCLBxKtHHFvBQ=;
Message-ID: <70726f92-51d5-42c9-9eeb-422ca8eecd79@xen.org>
Date: Tue, 24 Oct 2023 11:12:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.19] docs/arm: Document where Xen should be loaded in
 memory
Content-Language: en-GB
To: xen-devel@lists.xenproject.org
Cc: Henry.Wang@arm.com, michal.orzel@amd.com, Julien Grall
 <jgrall@amazon.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20231024100923.12724-1-julien@xen.org>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20231024100923.12724-1-julien@xen.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 24/10/2023 11:09, Julien Grall wrote:
> From: Julien Grall <jgrall@amazon.com>
> 
> In commit 9d267c049d92 ("xen/arm64: Rework the memory layout"),
> we decided to require Xen to be loaded below 5 TiB to simplify
> the logic to enable the MMU. The limit was decided based on
> how known platform boot plus some slack.
> 
> We had a recent report that this is not sufficient on the AVA
> platform with a old firmware [1]. But the restriction is not
> going to change in Xen 4.18. So document the limit clearly
> in docs/misc/arm/booting.txt

I forgot to add a link to

[1] 20231013122658.1270506-3-leo.yan@linaro.org

Cheers,

-- 
Julien Grall

