Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C548652A965
	for <lists+xen-devel@lfdr.de>; Tue, 17 May 2022 19:37:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.331355.554852 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nr17Q-0008Jd-Ck; Tue, 17 May 2022 17:36:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 331355.554852; Tue, 17 May 2022 17:36:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nr17Q-0008Ga-9C; Tue, 17 May 2022 17:36:24 +0000
Received: by outflank-mailman (input) for mailman id 331355;
 Tue, 17 May 2022 17:36:22 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1nr17O-0008GU-HA
 for xen-devel@lists.xenproject.org; Tue, 17 May 2022 17:36:22 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nr17O-0000ql-93; Tue, 17 May 2022 17:36:22 +0000
Received: from 54-240-197-227.amazon.com ([54.240.197.227] helo=[10.95.147.55])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nr17O-00081g-35; Tue, 17 May 2022 17:36:22 +0000
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
	bh=3B0YNS3PO+dtYpj8Bp26EOPM7Kfk5wGjr5am+RBP9BE=; b=BHOGaR3FRZhnF+R0eLvSpiarGS
	q70MNiUIuya1vYKsaJ65CBNg/OLtm1QT3QU9db6tHpq++aHfRC2UWfqRSHV2Jv1XyFVF8pni/fVpb
	uaIFNNlFcjxiHqwT0PeELcEh7BcYCXv0h2EgfC3XWYy2OvD3+KWJjrrxurZ7zipzmlOk=;
Message-ID: <949cdc03-608e-2d9c-1e00-86d7cddc67eb@xen.org>
Date: Tue, 17 May 2022 18:36:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.9.0
Subject: Re: [XEN][RFC PATCH v3 03/14] libfdt: Keep fdt functions after init
 for CONFIG_OVERLAY_DTB.
To: Vikram Garhwal <fnu.vikram@xilinx.com>, xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org, bertrand.marquis@arm.com,
 volodymyr_babchuk@epam.com
References: <20220308194704.14061-1-fnu.vikram@xilinx.com>
 <20220308194704.14061-4-fnu.vikram@xilinx.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20220308194704.14061-4-fnu.vikram@xilinx.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Vikram,

On 08/03/2022 19:46, Vikram Garhwal wrote:
> This is done to access fdt library function which are required for adding device
> tree overlay nodes for dynamic programming of nodes.
> 
> Acked-by: Julien Grall <jgrall@amazon.com>
> Signed-off-by: Vikram Garhwal <fnu.vikram@xilinx.com>

The tags usually are usually ordered chronogically. You first wrote the 
patch and then I provided a review. So your Signed-off-by should come 
first and then my Acked-by.

Cheers,

-- 
Julien Grall

