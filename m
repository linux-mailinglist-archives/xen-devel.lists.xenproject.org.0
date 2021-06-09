Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D3B293A1C61
	for <lists+xen-devel@lfdr.de>; Wed,  9 Jun 2021 19:53:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.139511.257948 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lr2O3-0001Tb-Ep; Wed, 09 Jun 2021 17:53:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 139511.257948; Wed, 09 Jun 2021 17:53:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lr2O3-0001QV-BM; Wed, 09 Jun 2021 17:53:07 +0000
Received: by outflank-mailman (input) for mailman id 139511;
 Wed, 09 Jun 2021 17:53:05 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1lr2O1-0001QP-RL
 for xen-devel@lists.xenproject.org; Wed, 09 Jun 2021 17:53:05 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lr2O0-0004yL-KW; Wed, 09 Jun 2021 17:53:04 +0000
Received: from [54.239.6.186] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lr2O0-000368-E9; Wed, 09 Jun 2021 17:53:04 +0000
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
	bh=N7fqOEJI6vy3tiWAIRn0BxUEzWFvHVPSCYtJGaFrZBg=; b=RElgDiIz73+mm9sODkKxqyyOjm
	AVNFG42+Dtuis6eIqq8p3GCcvZN2FRp27L49Do1BacUoUyXOLriYH551mJ0xGdrO9+qtDRg8TGAe0
	2IaRlcx09m2Nqg7YCqzFq7VgAS4f8/WVPD+mnJ0wyreTvmyR7N4kX31pZ8qMIS4GcA2A=;
Subject: Re: [PATCH] xen/arm32: SPSR_hyp/SPSR
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Volodymyr_Babchuk@epam.com, xen-devel@lists.xenproject.org,
 Bertrand.Marquis@arm.com, Michal.Orzel@arm.com, edgar.iglesias@xilinx.com,
 Stefano Stabellini <stefano.stabellini@xilinx.com>
References: <20210609174324.6621-1-sstabellini@kernel.org>
From: Julien Grall <julien@xen.org>
Message-ID: <712da7a7-2c1f-fd24-398d-27966335618a@xen.org>
Date: Wed, 9 Jun 2021 18:53:02 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210609174324.6621-1-sstabellini@kernel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Stefano,

On 09/06/2021 18:43, Stefano Stabellini wrote:
> SPSR_hyp is not meant to be accessed from Hyp mode (EL2); accesses
> trigger UNPREDICTABLE behaviour. Xen should read/write SPSR instead.

Please provide a reference to the spec. This helps reviewer and/or 
future developper to figure out quickly where this comes from.

> 
> This fixes booting Xen/arm32 on QEMU.
> 
> Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>

With the reference added:

Reviewed-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall

