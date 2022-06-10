Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F8D45462A9
	for <lists+xen-devel@lfdr.de>; Fri, 10 Jun 2022 11:41:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.346284.572052 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nzb97-0003hH-V1; Fri, 10 Jun 2022 09:41:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 346284.572052; Fri, 10 Jun 2022 09:41:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nzb97-0003e4-RN; Fri, 10 Jun 2022 09:41:37 +0000
Received: by outflank-mailman (input) for mailman id 346284;
 Fri, 10 Jun 2022 09:41:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7j0Q=WR=arm.com=michal.orzel@srs-se1.protection.inumbo.net>)
 id 1nzb95-0003du-PI
 for xen-devel@lists.xenproject.org; Fri, 10 Jun 2022 09:41:35 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id 83ad0b02-e8a1-11ec-bd2c-47488cf2e6aa;
 Fri, 10 Jun 2022 11:41:34 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7D18012FC;
 Fri, 10 Jun 2022 02:41:33 -0700 (PDT)
Received: from [10.57.4.71] (unknown [10.57.4.71])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 523753F73B;
 Fri, 10 Jun 2022 02:41:32 -0700 (PDT)
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
X-Inumbo-ID: 83ad0b02-e8a1-11ec-bd2c-47488cf2e6aa
Message-ID: <d740022d-5e96-bd82-765a-9d5c517ad54c@arm.com>
Date: Fri, 10 Jun 2022 11:41:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH 2/3] xen/arm: gicv2: Rename
 gicv2_map_hwdown_extra_mappings
Content-Language: en-US
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20220610083358.101412-1-michal.orzel@arm.com>
 <20220610083358.101412-3-michal.orzel@arm.com>
 <ef705e00-17da-a8df-9a0f-27eb7ef686ed@xen.org>
From: Michal Orzel <michal.orzel@arm.com>
In-Reply-To: <ef705e00-17da-a8df-9a0f-27eb7ef686ed@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Julien,

On 10.06.2022 11:07, Julien Grall wrote:
> Hi,
> 
> On 10/06/2022 09:33, Michal Orzel wrote:
>> ... to gicv2_map_hwdom_extra_mappings as the former clearly contains
>> a typo.
>>
>> Fixes: 86b93e00c0b6 ("xen/arm: gicv2: Export GICv2m register frames to Dom0 by device tree"
> 
> NIT: In general, fixes tag are used for bug (i.e. Xen would not function properly without it and likely need backports). Even if the name is incorrect, there is no bug here. So my preference is to drop this tag.
> 
Thanks, I will keep it in mind.

> Other than that:
> 
> Acked-by; Julien Grall <jgrall@amazon.com>
NIT: s/;/:

> 
> Cheers,
> 

Cheers,
Michal

