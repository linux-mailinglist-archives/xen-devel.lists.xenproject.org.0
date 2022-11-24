Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DB509637F56
	for <lists+xen-devel@lfdr.de>; Thu, 24 Nov 2022 19:52:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.448020.704793 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oyHKX-0005D4-P9; Thu, 24 Nov 2022 18:52:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 448020.704793; Thu, 24 Nov 2022 18:52:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oyHKX-0005AP-MI; Thu, 24 Nov 2022 18:52:13 +0000
Received: by outflank-mailman (input) for mailman id 448020;
 Thu, 24 Nov 2022 18:52:12 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1oyHKW-0005AJ-83
 for xen-devel@lists.xenproject.org; Thu, 24 Nov 2022 18:52:12 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oyHKV-0003QJ-Sk; Thu, 24 Nov 2022 18:52:11 +0000
Received: from [54.239.6.186] (helo=[192.168.1.238])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oyHKV-0006GZ-Lz; Thu, 24 Nov 2022 18:52:11 +0000
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
	bh=4hm5ltLUskAzu5oJuQnbEyKp5mV9SegUzVCWODnvs9U=; b=D/VR1u/tQG0Fb4Sm4J9+2lTukj
	1zzEiKw8CbRprMx5Eb+t92i93EOooUlmQjZIn5XrfV3DuRUEq3RWQ9KbOmaJPIhrF+DYV5ROCU7VN
	R0w0BhTgxQ0s+4Qdj+834tGNnAF1zFYbrM6aI/dBOl0sySSokOiy6C13vihOixcbdtX8=;
Message-ID: <4d50f93d-4811-ab44-0022-44d4832c6618@xen.org>
Date: Thu, 24 Nov 2022 19:52:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.0
Subject: Re: [PATCH 0/3] Early printk code cleanup
Content-Language: en-US
To: Michal Orzel <michal.orzel@amd.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20221118114618.20754-1-michal.orzel@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20221118114618.20754-1-michal.orzel@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 18/11/2022 12:46, Michal Orzel wrote:
> This patch series performs simple early printk code cleanup around PL011.
> No functional changes has been made.
> 
> Michal Orzel (3):
>    xen/arm: Drop early_uart_init macro from debug-meson.inc
>    xen/arm: debug-pl011.inc: Use macros instead of hardcoded values
>    xen/arm: Define WLEN_8 macro and use it in debug-pl011

I have committed everything in a branch for-next/4.18 which will be 
merged once the tree re-open.

Cheers,

-- 
Julien Grall

