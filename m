Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 408513DE9B7
	for <lists+xen-devel@lfdr.de>; Tue,  3 Aug 2021 11:33:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.163327.299202 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mAqnu-00052W-VO; Tue, 03 Aug 2021 09:33:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 163327.299202; Tue, 03 Aug 2021 09:33:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mAqnu-0004zm-RU; Tue, 03 Aug 2021 09:33:42 +0000
Received: by outflank-mailman (input) for mailman id 163327;
 Tue, 03 Aug 2021 09:33:42 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1mAqnt-0004zc-Vu
 for xen-devel@lists.xenproject.org; Tue, 03 Aug 2021 09:33:41 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mAqns-0000jN-HK; Tue, 03 Aug 2021 09:33:40 +0000
Received: from 54-240-197-226.amazon.com ([54.240.197.226]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mAqns-0007rD-BQ; Tue, 03 Aug 2021 09:33:40 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=aIx3aTemzVZUzV/gQCvSt6LORPD5qjQs5WYsyPBa3TU=; b=vFqZqvay0M4DId5Hae92u1DeIH
	KwdLv48IRqidPORpRSxu/W4+ZKbN1aUCEv8K6sKemd1P46aNzl7lbaMRSplYslIsFZw5TwtvZ3kCQ
	84lK4OvNSAAoPUFtVvkKlWswCNLHkRNN0BAFl/MMnmzUr0wt/Ffjo70B3xiufgXtvB88=;
Subject: Re: [PATCH v6 1/4] arm,smmu: switch to using iommu_fwspec functions
To: Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org
Cc: Bertrand.Marquis@arm.com, Volodymyr_Babchuk@epam.com,
 rahul.singh@arm.com, brian.woods@xilinx.com,
 Stefano Stabellini <stefano.stabellini@xilinx.com>
References: <alpine.DEB.2.21.2108021720560.10122@sstabellini-ThinkPad-T480s>
 <20210803002409.19406-1-sstabellini@kernel.org>
From: Julien Grall <julien@xen.org>
Message-ID: <033509d4-4bb0-3862-d371-fe413acfa350@xen.org>
Date: Tue, 3 Aug 2021 10:33:38 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <20210803002409.19406-1-sstabellini@kernel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Stefano,

On 03/08/2021 01:24, Stefano Stabellini wrote:
> From: Brian Woods <brian.woods@xilinx.com>
> 
> Modify the smmu driver so that it uses the iommu_fwspec helper
> functions.  This means both ARM IOMMU drivers will both use the
> iommu_fwspec helper functions, making enabling generic device tree
> bindings in the SMMU driver much cleaner.
> 
> Signed-off-by: Brian Woods <brian.woods@xilinx.com>
> Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
> Reviewed-by: Rahul Singh <rahul.singh@arm.com>

Acked-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall

