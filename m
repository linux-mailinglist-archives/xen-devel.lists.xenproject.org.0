Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 46E58AC96D9
	for <lists+xen-devel@lfdr.de>; Fri, 30 May 2025 23:02:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1001546.1381674 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uL6rV-0004w3-IC; Fri, 30 May 2025 21:01:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1001546.1381674; Fri, 30 May 2025 21:01:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uL6rV-0004uT-Ex; Fri, 30 May 2025 21:01:57 +0000
Received: by outflank-mailman (input) for mailman id 1001546;
 Fri, 30 May 2025 21:01:56 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1uL6rU-0004uL-Jr
 for xen-devel@lists.xenproject.org; Fri, 30 May 2025 21:01:56 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1uL6rU-00AEVU-0F;
 Fri, 30 May 2025 21:01:56 +0000
Received: from [2a02:8012:3a1:0:ec4a:d3ec:7374:b46c]
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1uL6rU-00AAk9-18;
 Fri, 30 May 2025 21:01:56 +0000
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
	bh=xV1o0ahY4mMCJOm8FNODcYJvVLrXhzUekqxeoUkjYVs=; b=yLWvWZlR2mn/UujNKdpp6e+Oa4
	jSbSilcntf6v5SU1L0qnBW7YGaTJfA1HLbbrGU8NbQY4yP8gIzrm42z89Qen9Vo43tv8FfTE9r7Bq
	2omVIlAkrOZFbRI6jMrEdFz0nXzEskDpkzeS8cGDSm+71W4h9RTyoLksE8S+JDWVWIgA=;
Message-ID: <b7e43f46-cfc5-48ee-973d-c8263005964d@xen.org>
Date: Fri, 30 May 2025 22:01:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 4/6] xen/arm: ffa: Add buffer full notification support
Content-Language: en-GB
To: Bertrand Marquis <bertrand.marquis@arm.com>,
 xen-devel@lists.xenproject.org
Cc: jens.wiklander@linaro.org, Volodymyr Babchuk
 <volodymyr_babchuk@epam.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Michal Orzel <michal.orzel@amd.com>
References: <cover.1747925287.git.bertrand.marquis@arm.com>
 <7e206a2e4f093af965a134bda23e3c4104267826.1747925287.git.bertrand.marquis@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <7e206a2e4f093af965a134bda23e3c4104267826.1747925287.git.bertrand.marquis@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Bertrand,

On 22/05/2025 16:08, Bertrand Marquis wrote:
> Add support to raise a Rx buffer full notification to a VM.
> This function will be used for indirect message support between VM and
> is only activated if CONFIG_FFA_VM_TO_VM is selected.
> 
> Even if there are 32 framework notifications possible, right now only
> one is defined so the implementation is simplified to only handle the
> buffer full notification using a boolean. If other framework
> notifications have to be supported one day, the design will have to be
> modified to handle it properly.
> 
> Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
> Reviewed-by: Jens Wiklander <jens.wiklander@linaro.org>

Acked-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall


