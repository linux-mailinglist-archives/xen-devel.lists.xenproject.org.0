Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 85FAB6D0EEB
	for <lists+xen-devel@lfdr.de>; Thu, 30 Mar 2023 21:33:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.516853.801639 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1phy0u-0004Ki-M8; Thu, 30 Mar 2023 19:32:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 516853.801639; Thu, 30 Mar 2023 19:32:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1phy0u-0004J0-Iz; Thu, 30 Mar 2023 19:32:48 +0000
Received: by outflank-mailman (input) for mailman id 516853;
 Thu, 30 Mar 2023 19:32:46 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1phy0s-0004Iu-SJ
 for xen-devel@lists.xenproject.org; Thu, 30 Mar 2023 19:32:46 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1phy0r-0007cp-V0; Thu, 30 Mar 2023 19:32:45 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.240])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1phy0r-0006sc-PV; Thu, 30 Mar 2023 19:32:45 +0000
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
	bh=oEWMyL4xPNjrp2kPqTBMtGWhBNXOeOfQgwSd65yL2aU=; b=JXjOPf6VVBOk72uyUDaHWd8dhN
	/5tMD3AcRlhg+j5FQIiLaqZIrwS3M2Dyc6YEZWRYfQG3pJPXLDnuOuq/AYjmUn0F5Egv48tQHJ051
	+mEix0jesuMD7NlvjdyA1AMo8Idy9/AEhllJVTqYI0P6H/uLDg80J+Pqn4veGQWmirS4=;
Message-ID: <c1dea62d-f0e9-6b8e-6476-6a0e501c8be4@xen.org>
Date: Thu, 30 Mar 2023 20:32:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.9.0
Subject: Re: [PATCH] bump default SeaBIOS version to 1.16.2
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <22a58367-6a7d-867a-348f-b2d18248f3f5@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <22a58367-6a7d-867a-348f-b2d18248f3f5@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Jan,

On 30/03/2023 11:38, Jan Beulich wrote:
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

FWIW:

Acked-by: Julien Grall <jgrall@amazon.com>

Cheers,

> 
> --- a/Config.mk
> +++ b/Config.mk
> @@ -225,7 +225,7 @@ MINIOS_UPSTREAM_URL ?= https://xenbits.x
>   MINIOS_UPSTREAM_REVISION ?= 5bcb28aaeba1c2506a82fab0cdad0201cd9b54b3
>   
>   SEABIOS_UPSTREAM_URL ?= https://xenbits.xen.org/git-http/seabios.git
> -SEABIOS_UPSTREAM_REVISION ?= rel-1.16.1
> +SEABIOS_UPSTREAM_REVISION ?= rel-1.16.2
>   
>   ETHERBOOT_NICS ?= rtl8139 8086100e
>   

-- 
Julien Grall

