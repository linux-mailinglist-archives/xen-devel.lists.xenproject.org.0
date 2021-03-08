Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0998E330CE0
	for <lists+xen-devel@lfdr.de>; Mon,  8 Mar 2021 12:59:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.94824.178609 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lJEXh-0001Vs-5Y; Mon, 08 Mar 2021 11:59:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 94824.178609; Mon, 08 Mar 2021 11:59:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lJEXh-0001VT-2H; Mon, 08 Mar 2021 11:59:21 +0000
Received: by outflank-mailman (input) for mailman id 94824;
 Mon, 08 Mar 2021 11:59:19 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1lJEXf-0001VO-PY
 for xen-devel@lists.xenproject.org; Mon, 08 Mar 2021 11:59:19 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lJEXe-0003Kr-M2; Mon, 08 Mar 2021 11:59:18 +0000
Received: from 54-240-197-239.amazon.com ([54.240.197.239]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lJEXe-0003Ht-EU; Mon, 08 Mar 2021 11:59:18 +0000
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
	bh=hqf3/yskXTCieLGbncjOKuMJyp2OzDxOvIKVA6wL09k=; b=DPL8mjgAqNLgn08PKEPNcyr7Xp
	r81M86c31Yx8ibiKOzH+zReCiewoiS2A38Tegx//RhP8Mc7H54MOM6YuBNsXuPJhor5yK2yGSdoiS
	pJsL+u3BBzTsN28Pj3rZMq8E+Qp05IZ7wqplWwlbg7NvzYrsVSwMuUq3FGOS5MqKNr/Y=;
Subject: Re: [PATCH] xen/arm: Prevent Dom0 to be loaded when using dom0less
To: Luca Fancellu <luca.fancellu@arm.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20210308115610.48203-1-luca.fancellu@arm.com>
From: Julien Grall <julien@xen.org>
Message-ID: <badc7db8-357d-3139-400a-c02fd6f29f6f@xen.org>
Date: Mon, 8 Mar 2021 11:59:16 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210308115610.48203-1-luca.fancellu@arm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Luca,

On 08/03/2021 11:56, Luca Fancellu wrote:
> This patch prevents the dom0 to be loaded skipping its
> building and going forward to build domUs when the dom0
> kernel is not found and at least one domU is present.
> 
> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
I have received 3 versions of this patch, can you clarify I should review?

If the modification is just the CC list, then we usually add RESEND in 
the subject. For all the other modifications, we bump the version (vX in 
suject) and provide a changelog.

Cheers,

-- 
Julien Grall

