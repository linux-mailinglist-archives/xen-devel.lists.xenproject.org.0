Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 10BCC9A49B7
	for <lists+xen-devel@lfdr.de>; Sat, 19 Oct 2024 00:39:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.822235.1236228 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t1vci-00039V-NU; Fri, 18 Oct 2024 22:39:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 822235.1236228; Fri, 18 Oct 2024 22:39:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t1vci-00037l-K7; Fri, 18 Oct 2024 22:39:08 +0000
Received: by outflank-mailman (input) for mailman id 822235;
 Fri, 18 Oct 2024 22:39:07 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1t1vch-00037Z-Jk
 for xen-devel@lists.xenproject.org; Fri, 18 Oct 2024 22:39:07 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1t1vcf-0006i1-W4; Fri, 18 Oct 2024 22:39:05 +0000
Received: from [2a02:8012:3a1:0:11d8:dae4:636f:615c]
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1t1vcf-0000KI-Po; Fri, 18 Oct 2024 22:39:05 +0000
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
	bh=2q3wz2Vdz2J2dQlia8Ug/K2X83xQ0Sqq7GInLbcRvW4=; b=mHrHckzPpYTYC5abE4k4SURoan
	lSdRUqtsoIFmNQQ4y5QMatwZ525STTtN1EyeB45SyS3rCEPVFktDti6+hAOQ1897bGBvXy+Bv5mO7
	dFOrkAN72UTGnIAALhz26X74SjUgAXOgiQXcSQODa1Wbe7ZC5bAtr2Ohm69qCPOzPblA=;
Message-ID: <476e8715-5b4c-432f-a286-18b529008826@xen.org>
Date: Fri, 18 Oct 2024 23:39:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/8] xen/arm: Add support for S32CC platforms and
 LINFlexD UART
Content-Language: en-GB
To: "Andrei Cherechesu (OSS)" <andrei.cherechesu@oss.nxp.com>,
 xen-devel@lists.xenproject.org
Cc: S32@nxp.com, Andrei Cherechesu <andrei.cherechesu@nxp.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Community Manager <community.manager@xenproject.org>
References: <20240930114715.642978-1-andrei.cherechesu@oss.nxp.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20240930114715.642978-1-andrei.cherechesu@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 30/09/2024 12:47, Andrei Cherechesu (OSS) wrote:
> Andrei Cherechesu (8):
>    xen/arm: Add NXP LINFlexD UART Driver
>    xen/arm: Add NXP LINFlexD UART early printk support

I have committed the first two patches.

Cheers,


-- 
Julien Grall

