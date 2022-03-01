Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A41C24C867B
	for <lists+xen-devel@lfdr.de>; Tue,  1 Mar 2022 09:28:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.280978.479105 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nOxrq-0005OF-3M; Tue, 01 Mar 2022 08:28:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 280978.479105; Tue, 01 Mar 2022 08:28:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nOxrq-0005LT-0E; Tue, 01 Mar 2022 08:28:22 +0000
Received: by outflank-mailman (input) for mailman id 280978;
 Tue, 01 Mar 2022 08:28:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TZGk=TM=arm.com=michal.orzel@srs-se1.protection.inumbo.net>)
 id 1nOxro-0005LN-F4
 for xen-devel@lists.xenproject.org; Tue, 01 Mar 2022 08:28:20 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id 8c0f8799-9939-11ec-8539-5f4723681683;
 Tue, 01 Mar 2022 09:28:19 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E68941042;
 Tue,  1 Mar 2022 00:28:17 -0800 (PST)
Received: from [10.57.5.142] (unknown [10.57.5.142])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6A5B13F66F;
 Tue,  1 Mar 2022 00:28:16 -0800 (PST)
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
X-Inumbo-ID: 8c0f8799-9939-11ec-8539-5f4723681683
Subject: Re: [PATCH] xen/arm: Remove unused BOOT_RELOC_VIRT_START
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Julien Grall <julien.grall@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Julien Grall <jgrall@amazon.com>
References: <20220228100633.57593-1-julien@xen.org>
From: Michal Orzel <michal.orzel@arm.com>
Message-ID: <ca501104-4563-d9ca-ffb1-ca4fdb1dd084@arm.com>
Date: Tue, 1 Mar 2022 09:28:09 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20220228100633.57593-1-julien@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Hi Julien,

On 28.02.2022 11:06, Julien Grall wrote:
> From: Julien Grall <julien.grall@arm.com>
> 
> We stopped relocating Xen since commit f60658c6ae "xen/arm: Stop
> relocating Xen".
> 
> At the same time, update the memory layout description.
> 
> Signed-off-by: Julien Grall <julien.grall@arm.com>
> Signed-off-by: Julien Grall <jgrall@amazon.com>
Are these two entries needed? I'd say one is enough.
> ---

Apart from that:
Reviewed-by: Michal Orzel <michal.orzel@arm.com>

Cheers,
Michal

