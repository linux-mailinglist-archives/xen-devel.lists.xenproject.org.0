Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E078819E6D
	for <lists+xen-devel@lfdr.de>; Wed, 20 Dec 2023 12:49:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.657734.1026794 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFv4Y-0000rl-45; Wed, 20 Dec 2023 11:49:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 657734.1026794; Wed, 20 Dec 2023 11:49:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFv4Y-0000pV-0q; Wed, 20 Dec 2023 11:49:10 +0000
Received: by outflank-mailman (input) for mailman id 657734;
 Wed, 20 Dec 2023 11:49:08 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1rFv4W-0000p6-8U
 for xen-devel@lists.xenproject.org; Wed, 20 Dec 2023 11:49:08 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rFv4V-0003R3-Fg; Wed, 20 Dec 2023 11:49:07 +0000
Received: from 82-132-247-3.dab.02.net ([82.132.247.3] helo=[172.20.10.6])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rFv4V-0002By-7O; Wed, 20 Dec 2023 11:49:07 +0000
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
	bh=4o35s/+1tpAvM3F16YfHO30B/qslnLTLpXwu3BgjKsU=; b=hEy4ErDdjI+Umhk8y1OK0N6teE
	I2Jw+YaZwCRvV7urgrZgBfF7/0OwpcbkwwvcFssxueAr7xAPITl1T0oSyqDWQSq5pFQCyrf0QXqJ7
	9acf7JY/JgOyGUBIkTpf5a8ON8+ctg0cDwQvXMds1piAvljWbuFOnjthjjY75Kba1H5s=;
Message-ID: <0b26cab9-8422-4f5f-ab96-b64a4afbdb24@xen.org>
Date: Wed, 20 Dec 2023 11:49:05 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH 7/7] xen/arm: smmu-v3: address violations of MISRA
 C:2012 Rule 16.3
Content-Language: en-GB
To: Federico Serafini <federico.serafini@bugseng.com>,
 xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com, Bertrand Marquis <bertrand.marquis@arm.com>,
 Rahul Singh <rahul.singh@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <cover.1703066935.git.federico.serafini@bugseng.com>
 <93d32bf20bb85b93618be5140edb1be527606b77.1703066935.git.federico.serafini@bugseng.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <93d32bf20bb85b93618be5140edb1be527606b77.1703066935.git.federico.serafini@bugseng.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Federico,

On 20/12/2023 11:03, Federico Serafini wrote:
> Add a break statement at the end of the switch-clauses to address
> violations of MISRA C:2012 Rule 16.3 ("An unconditional `break'
> statement shall terminate every switch-clause").
> No funtional change.
> 
> Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>

Acked-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall

