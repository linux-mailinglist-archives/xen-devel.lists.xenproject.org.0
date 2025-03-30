Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 133BBA75C4C
	for <lists+xen-devel@lfdr.de>; Sun, 30 Mar 2025 23:08:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.931760.1333947 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tyzss-00054q-5N; Sun, 30 Mar 2025 21:07:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 931760.1333947; Sun, 30 Mar 2025 21:07:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tyzss-00052d-2l; Sun, 30 Mar 2025 21:07:58 +0000
Received: by outflank-mailman (input) for mailman id 931760;
 Sun, 30 Mar 2025 21:07:56 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1tyzsq-00052V-Ub
 for xen-devel@lists.xenproject.org; Sun, 30 Mar 2025 21:07:56 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1tyzsq-000VR4-2J;
 Sun, 30 Mar 2025 21:07:56 +0000
Received: from [2a02:8012:3a1:0:51d5:4bad:16b9:5cff]
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1tyzsq-00APMO-1o;
 Sun, 30 Mar 2025 21:07:56 +0000
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
	bh=U0oXwGyaa2su5ku7euA5QjccO/6jwyhCWREBXzzNYeo=; b=cPEmmdTx+A9th+LR28aRod5Hkp
	dKFWEdcFZDQKjowU5A3H53XAnNocWcTOwveeyr4LwhGutfWrqDObSsKdelYZi/m0tBsVJbQBtxjXN
	ysqqU+UPQefhoQ95u/yOzGRCaLSF03/l4d1sQO62vE8E+LfY0/cTlB2ofwbU+RQl/crc=;
Message-ID: <bae05e96-7258-4722-9f41-41ac05b2bcdd@xen.org>
Date: Sun, 30 Mar 2025 22:07:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/5] xen/arm32: Allow ARM_PA_BITS_40 only if !MPU
Content-Language: en-GB
To: Ayan Kumar Halder <ayan.kumar.halder@amd.com>,
 xen-devel@lists.xenproject.org
Cc: Michal Orzel <michal.orzel@amd.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20250330180308.2551195-1-ayan.kumar.halder@amd.com>
 <20250330180308.2551195-5-ayan.kumar.halder@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20250330180308.2551195-5-ayan.kumar.halder@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 30/03/2025 19:03, Ayan Kumar Halder wrote:
> From: Michal Orzel <michal.orzel@amd.com>
> 
> ArmV8-R AArch32 does not support LPAE. The reason being PMSAv8-32
> supports 32-bit physical address only.
> 
> Signed-off-by: Michal Orzel <michal.orzel@amd.com>
> Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>

Acked-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall


