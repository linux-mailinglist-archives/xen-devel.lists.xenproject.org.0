Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A382644D74
	for <lists+xen-devel@lfdr.de>; Tue,  6 Dec 2022 21:47:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.455536.713026 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p2eqX-0005Tr-NN; Tue, 06 Dec 2022 20:47:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 455536.713026; Tue, 06 Dec 2022 20:47:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p2eqX-0005Rd-Kc; Tue, 06 Dec 2022 20:47:21 +0000
Received: by outflank-mailman (input) for mailman id 455536;
 Tue, 06 Dec 2022 20:47:20 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1p2eqW-0005RX-DS
 for xen-devel@lists.xenproject.org; Tue, 06 Dec 2022 20:47:20 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1p2eqV-00020Q-Ua; Tue, 06 Dec 2022 20:47:19 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.102])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1p2eqV-00019a-PS; Tue, 06 Dec 2022 20:47:19 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:Subject:
	From:References:Cc:To:MIME-Version:Date:Message-ID;
	bh=YKKNoXYa1p3wKYvI/2eMeNw1pASuWvWHlaHeQECnDwY=; b=6Zz9HxTaXsoWVOoaxxvasPCYOr
	6wMmPk4yq4vP3EWGAnUjM4db203mwg606M0Oj2R55Aj+YbjTABBZmp+DxziVlsD4DwHbtJ+SKvX5P
	R8P1BkfwkWZazN5qU3WpOr5APhsQlUIImK08gO+jffCbn6eD4eysUj3XtQIAFmXxOOIE=;
Message-ID: <b8bdb09b-5d27-1c9f-b805-d4906cec87f6@xen.org>
Date: Tue, 6 Dec 2022 20:47:18 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.1
To: Mykyta Poturai <Mykyta_Poturai@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Mirela Simonovic <mirela.simonovic@aggios.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Saeed Nowshadi <saeed.nowshadi@xilinx.com>
References: <cover.1665137247.git.mykyta_poturai@epam.com>
 <4cbdda3b5c6cce54724a505da14ce968010d0958.1665137247.git.mykyta_poturai@epam.com>
From: Julien Grall <julien@xen.org>
Subject: Re: [PATCH 06/19] xen/arm: Freeze domains on suspend and thaw them on
 resume
In-Reply-To: <4cbdda3b5c6cce54724a505da14ce968010d0958.1665137247.git.mykyta_poturai@epam.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 07/10/2022 11:32, Mykyta Poturai wrote:
> From: Mirela Simonovic <mirela.simonovic@aggios.com>
> 
> Freeze and thaw of domains is reused as implemented for x86. In
> addition, system_state variable is updated to represent the actual
> state of the system.
> 
> Signed-off-by: Mirela Simonovic <mirela.simonovic@aggios.com>
> Signed-off-by: Saeed Nowshadi <saeed.nowshadi@xilinx.com>

Your signed-off-by is missing.

> ---
>   xen/arch/arm/suspend.c | 8 ++++++++
>   1 file changed, 8 insertions(+)
> 
> diff --git a/xen/arch/arm/suspend.c b/xen/arch/arm/suspend.c
> index b09bf319d0..2b94816b63 100644
> --- a/xen/arch/arm/suspend.c
> +++ b/xen/arch/arm/suspend.c
> @@ -137,6 +137,14 @@ static long system_suspend(void *data)

So this is something I already hinted in the original series. But I will 
repeat here.

I find quite difficult to review the code in system_suspend() when this 
introduced in piece meal. For instance, patch #8 is fixing a bug 
introduced by patch #7.

Patch #7 adds barrier after code your added here...

So I would much prefer if we introduce the helpers in a few patches and 
then have one patch that will in system_suspend().

Cheers,

-- 
Julien Grall

