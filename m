Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 09B9066DF67
	for <lists+xen-devel@lfdr.de>; Tue, 17 Jan 2023 14:52:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.479405.743229 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pHmOA-0007aS-Vs; Tue, 17 Jan 2023 13:52:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 479405.743229; Tue, 17 Jan 2023 13:52:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pHmOA-0007Xt-S3; Tue, 17 Jan 2023 13:52:34 +0000
Received: by outflank-mailman (input) for mailman id 479405;
 Tue, 17 Jan 2023 13:52:33 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1pHmO9-0007Xf-I4
 for xen-devel@lists.xenproject.org; Tue, 17 Jan 2023 13:52:33 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pHmO8-0000zn-Bh; Tue, 17 Jan 2023 13:52:32 +0000
Received: from 54-240-197-234.amazon.com ([54.240.197.234]
 helo=[192.168.7.198]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pHmO8-0007M3-6L; Tue, 17 Jan 2023 13:52:32 +0000
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
	bh=oBPWC3rQ8RWhxS2ur4J+eEU8B47Ku9t/BASpp8v21OU=; b=aEYJOvQDgDaIgUswLtydtowaOY
	Qmv/JAaxzSVbZXAtiwW8kwM5UyNBew+K2hhKH0Qu9YEsJtbkMFNwVTxjLscTfKguOKwDWT1pLeEG9
	DGYZuquq1ckQrKdds6WI41b6DuRf/FWKg1DtjslQFrVGuQDceC4+JR+oD6LFjIFner6Y=;
Message-ID: <37cfa6f0-9463-cf82-bac5-266e1f3c0c59@xen.org>
Date: Tue, 17 Jan 2023 13:52:30 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH v2 2/3] xen/arm32: Remove unused macro FRAMETABLE_VIRT_END
Content-Language: en-US
To: Michal Orzel <michal.orzel@amd.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20230117114332.25863-1-michal.orzel@amd.com>
 <20230117114332.25863-3-michal.orzel@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20230117114332.25863-3-michal.orzel@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Michal,

On 17/01/2023 11:43, Michal Orzel wrote:
> This macro is unused and the corresponding one for arm64 has already
> been removed as part of the commit 6dc9a1fe982f ("xen/arm: Remove most
> of the *_VIRT_END defines").
> 
> Signed-off-by: Michal Orzel <michal.orzel@amd.com>

Reviewed-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall

