Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 91E924C6D39
	for <lists+xen-devel@lfdr.de>; Mon, 28 Feb 2022 13:52:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.280505.478461 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nOfVV-0007yn-HY; Mon, 28 Feb 2022 12:52:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 280505.478461; Mon, 28 Feb 2022 12:52:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nOfVV-0007wx-EU; Mon, 28 Feb 2022 12:52:05 +0000
Received: by outflank-mailman (input) for mailman id 280505;
 Mon, 28 Feb 2022 12:52:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=py4b=TL=arm.com=michal.orzel@srs-se1.protection.inumbo.net>)
 id 1nOfVU-0007wr-22
 for xen-devel@lists.xenproject.org; Mon, 28 Feb 2022 12:52:04 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id 384bae3a-9895-11ec-8539-5f4723681683;
 Mon, 28 Feb 2022 13:52:00 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A6F511042;
 Mon, 28 Feb 2022 04:52:01 -0800 (PST)
Received: from [10.57.19.230] (unknown [10.57.19.230])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 69B823F73D;
 Mon, 28 Feb 2022 04:52:00 -0800 (PST)
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
X-Inumbo-ID: 384bae3a-9895-11ec-8539-5f4723681683
Subject: Re: [PATCH] xen/arm64: head: Mark the end of subroutines with ENDPROC
 (take two)
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Julien Grall <jgrall@amazon.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20220228100805.60918-1-julien@xen.org>
From: Michal Orzel <michal.orzel@arm.com>
Message-ID: <3ba92d6d-07c4-f035-83a9-01175c4000d2@arm.com>
Date: Mon, 28 Feb 2022 13:51:58 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20220228100805.60918-1-julien@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Hi Julien,

On 28.02.2022 11:08, Julien Grall wrote:
> From: Julien Grall <jgrall@amazon.com>
> 
> Commit 13c03002c5df ("xen/arm64: head: Mark the end of subroutines
> with ENDPROC") intended to mark all the subroutines with ENDPROC.
> 
> Unfortunately, I missed fail(), switch_ttbr() and init_uart(). Add
> ENDPROC for the benefits of static analysis tools and the reader.
> 
> Signed-off-by: Julien Grall <jgrall@amazon.com>
> ---

Reviewed-by: Michal Orzel <michal.orzel@arm.com>

Cheers,
Michal

