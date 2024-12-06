Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 47EA39E7896
	for <lists+xen-devel@lfdr.de>; Fri,  6 Dec 2024 20:09:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.850408.1264816 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tJdhi-0004GQ-8F; Fri, 06 Dec 2024 19:09:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 850408.1264816; Fri, 06 Dec 2024 19:09:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tJdhi-0004E7-5B; Fri, 06 Dec 2024 19:09:30 +0000
Received: by outflank-mailman (input) for mailman id 850408;
 Fri, 06 Dec 2024 19:09:28 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1tJdhg-0004E1-Ag
 for xen-devel@lists.xenproject.org; Fri, 06 Dec 2024 19:09:28 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1tJdhf-0079r2-28;
 Fri, 06 Dec 2024 19:09:27 +0000
Received: from [2a02:8012:3a1:0:9908:37eb:1c5c:6583]
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1tJdhf-003171-2V;
 Fri, 06 Dec 2024 19:09:27 +0000
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
	bh=fTBCRPbagEzZ2cfi9thYQHAX2abjVhONVOob/e+nDh0=; b=ShIwP3fMvCewJc+AkFulFwoJoA
	msbMQAwH6rkzlwCMKfP2H4WbOBUH6E3jTkovLGsvEq1bz0uhwZrsgcFRTbLmfc7RlMHRIOCR5S+6q
	FWqWzvWMSB1+v+8DgM0oxxxEc1noSbnk2JMiAg0rnBQdiqFdJ33qonQpLcMhyv93so2E=;
Message-ID: <d7375d1e-4823-4d8a-9308-0f351a229091@xen.org>
Date: Fri, 6 Dec 2024 19:09:26 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/2] Enable early bootup of AArch64 MPU systems (Part
 2)
Content-Language: en-GB
To: Ayan Kumar Halder <ayan.kumar.halder@amd.com>,
 xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20241204172243.1229942-1-ayan.kumar.halder@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20241204172243.1229942-1-ayan.kumar.halder@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Ayan,

On 04/12/2024 17:22, Ayan Kumar Halder wrote:
> This patch serie concludes earlyboot support for Arm-v8R AArch64 MPU systems.
> 
> Ayan Kumar Halder (1):
>    xen/mpu: Map early uart when earlyprintk on
> 
> Penny Zheng (1):
>    xen/mmu: enable SMMU subsystem only in MMU

I have committed this series.

Cheers,

-- 
Julien Grall


