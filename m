Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E6B34761D94
	for <lists+xen-devel@lfdr.de>; Tue, 25 Jul 2023 17:45:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.569803.890897 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qOKDj-0004Vv-IY; Tue, 25 Jul 2023 15:45:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 569803.890897; Tue, 25 Jul 2023 15:45:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qOKDj-0004Td-Fz; Tue, 25 Jul 2023 15:45:07 +0000
Received: by outflank-mailman (input) for mailman id 569803;
 Tue, 25 Jul 2023 15:45:05 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qOKDh-0004TV-RP
 for xen-devel@lists.xenproject.org; Tue, 25 Jul 2023 15:45:05 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qOKDh-0005Ve-H6; Tue, 25 Jul 2023 15:45:05 +0000
Received: from 54-240-197-238.amazon.com ([54.240.197.238]
 helo=[192.168.17.43]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qOKDh-0001yr-AA; Tue, 25 Jul 2023 15:45:05 +0000
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
	bh=PDTYKzN7S7kcIyhgQOHkR0Mk7BjSUmWeSQ/cy7y3oCE=; b=RNejiyDRg9bXxfWXuDeCK9BplW
	aKnVtZxqvDWVHtV2kBSKMoaPV7I2FABn3v3XVdz1MYHBqHpu1fO3mTHORV3Nlxs3g+zG7ujwfGNsS
	Mpo+c7V8KWrbHbNRmGnLo4SLxgF8j5VgKJVI/NGYOuq9ctObBph8yUs2DRhdGpxx9xNE=;
Message-ID: <bfa643fe-4b8f-c8bf-2b13-fd699c6816c5@xen.org>
Date: Tue, 25 Jul 2023 16:45:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.13.0
Subject: Re: [PATCH v3] xen/arm: Move TEE mediators in a kconfig submenu
Content-Language: en-US
To: Bertrand Marquis <bertrand.marquis@arm.com>,
 xen-devel@lists.xenproject.org
Cc: jens.wiklander@linaro.org, Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <5f10382a15ca7b221a052915347e4e59f66b001f.1690297570.git.bertrand.marquis@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <5f10382a15ca7b221a052915347e4e59f66b001f.1690297570.git.bertrand.marquis@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Bertrand,

On 25/07/2023 16:42, Bertrand Marquis wrote:
> Rework TEE mediators to put them under a submenu in Kconfig.
> The submenu is only visible if UNSUPPORTED is activated as all currently
> existing mediators are UNSUPPORTED.
> 
> While there rework a bit the configuration so that OP-TEE and FF-A
> mediators are selecting the generic TEE interface instead of depending
> on it.
> Make the TEE option hidden as it is of no interest for anyone to select
> it without one of the mediators so having them select it instead should
> be enough.
> 
> Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>

Reviewed-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall

