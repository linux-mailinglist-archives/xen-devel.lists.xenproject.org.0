Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 81679446745
	for <lists+xen-devel@lfdr.de>; Fri,  5 Nov 2021 17:47:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.222550.384809 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mj2MQ-0004Do-H0; Fri, 05 Nov 2021 16:46:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 222550.384809; Fri, 05 Nov 2021 16:46:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mj2MQ-0004Al-Dr; Fri, 05 Nov 2021 16:46:38 +0000
Received: by outflank-mailman (input) for mailman id 222550;
 Fri, 05 Nov 2021 16:46:37 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1mj2MP-0004Af-0N
 for xen-devel@lists.xenproject.org; Fri, 05 Nov 2021 16:46:37 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mj2MN-0003P9-OO; Fri, 05 Nov 2021 16:46:35 +0000
Received: from 54-240-197-224.amazon.com ([54.240.197.224]
 helo=[192.168.21.75]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mj2MN-00016g-Hj; Fri, 05 Nov 2021 16:46:35 +0000
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
	bh=pOmkKuBgOvy/pXXr8VH1SFyPw02pwmcPyAMYHdnzDrs=; b=yrj3v9KDrteVS1v+Lg6tzpfcz0
	c9x+6onNY8q0fZTc+WGmHG3LzNm1rxT3ymF7RBZUIv1r0w0iOWpNiShALESl0X771K+h5O6kAeQ7R
	uip5Bk+H95xN3RgGoz0z+AxtbKGGc39nvncGaQwXNaJfT6HKebxmb5v9paLko+VNxtVk=;
Message-ID: <a19a844b-672e-8630-fc60-f41d20760b49@xen.org>
Date: Fri, 5 Nov 2021 16:46:32 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.3.0
Subject: Re: [PATCH v2] MAINTAINERS: add Bertrand to the ARM reviewers
To: Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org, Ian Jackson <iwj@xenproject.org>
Cc: bertrand.marquis@arm.com, Volodymyr_Babchuk@epam.com
References: <alpine.DEB.2.22.394.2111050843450.284830@ubuntu-linux-20-04-desktop>
From: Julien Grall <julien@xen.org>
In-Reply-To: <alpine.DEB.2.22.394.2111050843450.284830@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

(+ Ian)

On 05/11/2021 15:44, Stefano Stabellini wrote:
> Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>

Acked-by: Julien Grall <jgrall@amazon.com>

@Ian, do we need a release-acked-by for this?

Cheers,

> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 9be4ad653a..4956db1011 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -232,6 +232,7 @@ ARM (W/ VIRTUALISATION EXTENSIONS) ARCHITECTURE
>   M:	Stefano Stabellini <sstabellini@kernel.org>
>   M:	Julien Grall <julien@xen.org>
>   R:	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
> +R:	Bertrand Marquis <bertrand.marquis@arm.com>
>   S:	Supported
>   L:	xen-devel@lists.xenproject.org
>   F:	docs/misc/arm/
> 

-- 
Julien Grall

