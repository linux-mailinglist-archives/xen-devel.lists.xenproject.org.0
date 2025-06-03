Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DADBACC7B0
	for <lists+xen-devel@lfdr.de>; Tue,  3 Jun 2025 15:24:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1004443.1384161 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uMRcZ-0004Y6-T9; Tue, 03 Jun 2025 13:24:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1004443.1384161; Tue, 03 Jun 2025 13:24:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uMRcZ-0004WF-QE; Tue, 03 Jun 2025 13:24:03 +0000
Received: by outflank-mailman (input) for mailman id 1004443;
 Tue, 03 Jun 2025 13:24:02 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1uMRcY-0004W9-DO
 for xen-devel@lists.xenproject.org; Tue, 03 Jun 2025 13:24:02 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1uMRcX-000D7j-2Z;
 Tue, 03 Jun 2025 13:24:01 +0000
Received: from [15.248.2.27] (helo=[10.24.67.31])
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1uMRcY-005hsN-09;
 Tue, 03 Jun 2025 13:24:01 +0000
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
	bh=QmqSn5+WAmGAIFaqmuiQXcfbuRfcZR+Kud7b6Lkqq04=; b=VBKDRDJcpYjJn0LLbKydGTWwNm
	IfGpKDdKS2R0KY9wxcs4YkY7ABMIvLoXbG8HWPzKWHdLxTerr3J17zv4fO+gTdbLox5XpVUo+0gub
	NLWU4N4IoviAengtIECGNCiDwR28BwM/sQPpMaICbpzzTziT2Mmu43uZxijHaz5GCSJE=;
Message-ID: <c7d1490d-729d-4894-8d4d-88565f76d802@xen.org>
Date: Tue, 3 Jun 2025 14:23:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] device-tree: Move domain_fdt_begin_node() to common
Content-Language: en-GB
To: Michal Orzel <michal.orzel@amd.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20250603100329.149851-1-michal.orzel@amd.com>
 <20250603100329.149851-3-michal.orzel@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20250603100329.149851-3-michal.orzel@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Michal,

On 03/06/2025 11:03, Michal Orzel wrote:
> This is just a wrapper around fdt_begin_node(). Move it to common and
> remove asm/domain_build.h inclusion from static-shmem.c.
> 
> Signed-off-by: Michal Orzel <michal.orzel@amd.com>

Acked-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall


