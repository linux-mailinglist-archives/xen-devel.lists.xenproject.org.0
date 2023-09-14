Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B0E857A0117
	for <lists+xen-devel@lfdr.de>; Thu, 14 Sep 2023 12:01:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.602189.938605 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qgjA1-0000qu-K8; Thu, 14 Sep 2023 10:01:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 602189.938605; Thu, 14 Sep 2023 10:01:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qgjA1-0000pB-Gw; Thu, 14 Sep 2023 10:01:21 +0000
Received: by outflank-mailman (input) for mailman id 602189;
 Thu, 14 Sep 2023 10:01:20 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qgjA0-0000p4-74
 for xen-devel@lists.xenproject.org; Thu, 14 Sep 2023 10:01:20 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qgj9z-0003Xe-S4; Thu, 14 Sep 2023 10:01:19 +0000
Received: from [15.248.3.3] (helo=[10.24.67.35])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qgj9z-0005AW-Kk; Thu, 14 Sep 2023 10:01:19 +0000
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
	bh=QBB7IcN/xMPzZxTPUcTa0/Ki6TlaNWWap2QVcxneY3M=; b=OxiSvzNyC5nLCyyH6hGDx8bVC7
	1JNIxa4HGzs+VFHpjuWJK5obEumEvDCdcxTNXIoS/zwyeIoyk7vPL7RkAhvcMXkBdKCotwPfAe2ij
	Rmvi36TevEzPQ2R5zBOJlwTbjj0jT5aaO9a3enafP/dKB/Xd1h4BauY16oWY6OFQZayA=;
Message-ID: <2563c6a3-54cf-46f5-aa93-d583e21d4ec0@xen.org>
Date: Thu, 14 Sep 2023 11:01:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] xen/arm: Add macro XEN_VM_MAPPING
Content-Language: en-GB
To: Leo Yan <leo.yan@linaro.org>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Alexey Klimov <alexey.klimov@linaro.org>
References: <20230914021734.1395472-1-leo.yan@linaro.org>
 <20230914021734.1395472-2-leo.yan@linaro.org>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20230914021734.1395472-2-leo.yan@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 14/09/2023 03:17, Leo Yan wrote:
> Xen maps the virtual memory space starting from L0 slot 4, so it's open
> coded for macros with the offset '4'.
> 
> For more readable, add a new macro XEN_VM_MAPPING which defines the
> start slot for Xen virtual memory mapping, and all virtual memory
> regions are defined based on it.
> 
> Signed-off-by: Leo Yan <leo.yan@linaro.org>

Acked-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall

