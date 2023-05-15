Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EF86D7027AE
	for <lists+xen-devel@lfdr.de>; Mon, 15 May 2023 10:57:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.534638.831838 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pyU1L-0000Ay-En; Mon, 15 May 2023 08:57:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 534638.831838; Mon, 15 May 2023 08:57:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pyU1L-00008X-BJ; Mon, 15 May 2023 08:57:31 +0000
Received: by outflank-mailman (input) for mailman id 534638;
 Mon, 15 May 2023 08:57:30 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1pyU1K-00008N-7N
 for xen-devel@lists.xenproject.org; Mon, 15 May 2023 08:57:30 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pyU1J-0001ik-Uz; Mon, 15 May 2023 08:57:29 +0000
Received: from 54-240-197-234.amazon.com ([54.240.197.234]
 helo=[192.168.27.136]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pyU1J-0002CP-PW; Mon, 15 May 2023 08:57:29 +0000
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
	bh=oTue8a0mb1TBWg6DI4lRQ4+KAw6+2kS14JA+Yw/GkrE=; b=eUKBtEJfaW69mjueqllSJjEz3o
	/PPZ+1I+HdiUzbMCQTnKvWhSecPxNHM6aQ/Bm+2fRlybkZca/WlPCD0YXoxZdqpRJrWyyPzjAEjYe
	MHE/Vg9CLyfyrly/38R3c0pYXRX3wJNINTd24kzFUqp3qlvCLlDMZKww7ME2ik81rUw8=;
Message-ID: <320a1d9f-886e-d2b6-b483-1bb07e5899cd@xen.org>
Date: Mon, 15 May 2023 09:57:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.10.0
Subject: Re: [PATCH 0/2] xen/arm: smmuv3: Advertise coherent table walk
Content-Language: en-US
To: Michal Orzel <michal.orzel@amd.com>, xen-devel@lists.xenproject.org
Cc: Bertrand Marquis <bertrand.marquis@arm.com>,
 Rahul Singh <rahul.singh@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20230512143535.29679-1-michal.orzel@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20230512143535.29679-1-michal.orzel@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Michal,

On 12/05/2023 15:35, Michal Orzel wrote:
> Based on the work done for SMMU v1,v2 by commit:
> 080dcb781e1bc3bb22f55a9dfdecb830ccbabe88
> 
> Michal Orzel (2):
>    xen/arm: smmuv3: Constify arm_smmu_get_by_dev() parameter

I have committed this patch.

>    xen/arm: smmuv3: Advertise coherent table walk if supported

For this one, I would like on extra change to harden the code (see my 
reply to the patch).

Cheers,

-- 
Julien Grall

