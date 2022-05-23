Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E658B5309B4
	for <lists+xen-devel@lfdr.de>; Mon, 23 May 2022 09:01:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.335477.559650 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nt23y-0002aN-HM; Mon, 23 May 2022 07:01:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 335477.559650; Mon, 23 May 2022 07:01:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nt23y-0002Xi-De; Mon, 23 May 2022 07:01:10 +0000
Received: by outflank-mailman (input) for mailman id 335477;
 Mon, 23 May 2022 07:01:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=D6LT=V7=arm.com=michal.orzel@srs-se1.protection.inumbo.net>)
 id 1nt23x-0002Xc-8W
 for xen-devel@lists.xenproject.org; Mon, 23 May 2022 07:01:09 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id 1e58dca4-da66-11ec-bd2c-47488cf2e6aa;
 Mon, 23 May 2022 09:01:07 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BCBF5139F;
 Mon, 23 May 2022 00:01:06 -0700 (PDT)
Received: from [10.57.7.84] (unknown [10.57.7.84])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7C90A3F66F;
 Mon, 23 May 2022 00:01:05 -0700 (PDT)
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
X-Inumbo-ID: 1e58dca4-da66-11ec-bd2c-47488cf2e6aa
Message-ID: <ab74884e-9a16-a9cb-de57-9f2907e21f71@arm.com>
Date: Mon, 23 May 2022 09:00:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH] xen/iommu: dt: Check the return value of
 xsm_deassign_dtdevice()
Content-Language: en-US
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Julien Grall <jgrall@amazon.com>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <20220522165900.83104-1-julien@xen.org>
From: Michal Orzel <michal.orzel@arm.com>
In-Reply-To: <20220522165900.83104-1-julien@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Julien,

On 22.05.2022 18:59, Julien Grall wrote:
> From: Julien Grall <jgrall@amazon.com>
> 
> xsm_deasign_dtdevice() will indicate whether the caller is allowed
s/deasign/deassign/

> to issue the operation. So the return value has to be checked.
> 
> Spotted by clang static analyzer.
> 
> Fixes: fe36cccc483c ("xen/passthrough: Extend XEN_DOMCTL_*assign_device to support DT device")
> Signed-off-by: Julien Grall <jgrall@amazon.com>

Apart from that:
Reviewed-by: Michal Orzel <michal.orzel@arm.com>

