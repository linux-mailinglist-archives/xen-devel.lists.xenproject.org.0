Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ECCE89E0D64
	for <lists+xen-devel@lfdr.de>; Mon,  2 Dec 2024 21:54:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.847103.1262241 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tIDQw-0001au-RP; Mon, 02 Dec 2024 20:54:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 847103.1262241; Mon, 02 Dec 2024 20:54:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tIDQw-0001YG-Ns; Mon, 02 Dec 2024 20:54:18 +0000
Received: by outflank-mailman (input) for mailman id 847103;
 Mon, 02 Dec 2024 20:54:17 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1tIDQu-0001Y7-Vu
 for xen-devel@lists.xenproject.org; Mon, 02 Dec 2024 20:54:16 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1tIDQu-000P2m-0o;
 Mon, 02 Dec 2024 20:54:16 +0000
Received: from [2a02:8012:3a1:0:c6e:c614:26eb:b495]
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1tIDQu-00BA3n-1E;
 Mon, 02 Dec 2024 20:54:16 +0000
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
	bh=ioq9OyZDefqv6t4xRQ1lsI3jBQW2cIv/HXVKr5OmBHY=; b=ltTkyIlkX9rd9pJ8SIYCCmOlJo
	AQ3PCng+RJ3NiPH9Zbq3dxLUwlU/pEwSn/2gZbSnarXOISWQgqRrvVN7CR6B8DXMhvCAQJ32kKVmh
	8iRd7zs2lKWG+IKd02fZGxweom0nBtzGaRSjU7rfrx+A53UP6aMlkBc1Tktdhs6Z6XcY=;
Message-ID: <12c66d02-49e2-4912-80ba-412ddebcb081@xen.org>
Date: Mon, 2 Dec 2024 20:54:14 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] xen/mmu: enable SMMU subsystem only in MMU
Content-Language: en-GB
To: Ayan Kumar Halder <ayan.kumar.halder@amd.com>,
 xen-devel@lists.xenproject.org
Cc: Penny Zheng <Penny.Zheng@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20241127183906.485824-1-ayan.kumar.halder@amd.com>
 <20241127183906.485824-3-ayan.kumar.halder@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20241127183906.485824-3-ayan.kumar.halder@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Ayan,

On 27/11/2024 18:39, Ayan Kumar Halder wrote:
> From: Penny Zheng <Penny.Zheng@arm.com>
> 
> In Xen, SMMU subsystem is supported for MMU system only. The reason being SMMU
> driver uses the same page tables as MMU.
> Thus, we make it dependent on CONFIG_MMU.
> 
> Signed-off-by: Penny Zheng <Penny.Zheng@arm.com>
> Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>

Acked-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall


