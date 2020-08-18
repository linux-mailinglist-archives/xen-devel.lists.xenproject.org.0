Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B4482486C3
	for <lists+xen-devel@lfdr.de>; Tue, 18 Aug 2020 16:11:06 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k82KH-00031o-AQ; Tue, 18 Aug 2020 14:10:57 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ffgU=B4=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1k82KF-00031b-C6
 for xen-devel@lists.xenproject.org; Tue, 18 Aug 2020 14:10:55 +0000
X-Inumbo-ID: 86699ee7-48f0-450d-863f-fc4ab182929d
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 86699ee7-48f0-450d-863f-fc4ab182929d;
 Tue, 18 Aug 2020 14:10:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
 bh=aL4Rg8K5HNIGuYExzkkI06tvJt9tK7eOfI+6xbri5Jk=; b=L3KyVaBkh3h7hD1tspJ7tzDUOG
 EpF1m9m/YvymQKX7q00hipKZFIXsjBKI04TaXtC1Nr9npNo7q+oMnpGS/ge6npyqKbyMLTAMJv7oZ
 26lch82fdzPL1joAFW/S+6XfI1ar2yRCDeClsLHxxLQt+joorqcqp2pcdlQ9uVqFHo/M=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1k82KC-0005ob-N4; Tue, 18 Aug 2020 14:10:52 +0000
Received: from [54.239.6.185] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1k82KC-0005qe-Gm; Tue, 18 Aug 2020 14:10:52 +0000
Subject: Re: [PATCH 2/2] xen/arm: Enable CPU Errata 1165522 for Neoverse
To: Bertrand Marquis <bertrand.marquis@arm.com>, xen-devel@lists.xenproject.org
Cc: nd@arm.com, Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Wei Chen <wei.chen@arm.com>,
 Andre Przywara <andre.przywara@arm.com>
References: <cover.1597740876.git.bertrand.marquis@arm.com>
 <8680961067334f6049eb5215b3939195d3da00d8.1597740876.git.bertrand.marquis@arm.com>
From: Julien Grall <julien@xen.org>
Message-ID: <dde51d6b-faf8-02af-9b84-ba665538a3b5@xen.org>
Date: Tue, 18 Aug 2020 15:10:50 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <8680961067334f6049eb5215b3939195d3da00d8.1597740876.git.bertrand.marquis@arm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Hi Bertrand,

There is only one. So it should be erratum :).

On 18/08/2020 14:47, Bertrand Marquis wrote:
> Enable CPU errata of Speculative AT on the Neoverse N1 processor

Ditto.

> versions r0p0 to r2p0.
> Also Fix Cortex A76 Errata string which had a wrong errata number.

Ditto.

And good catch for the typo :).

> 
> Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>

All the NITs can be fixed during commit:

Acked-by: Julien Grall <jgrall@amazon.com>

Cheers,

> ---
>   xen/arch/arm/cpuerrata.c | 8 +++++++-
>   1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/xen/arch/arm/cpuerrata.c b/xen/arch/arm/cpuerrata.c
> index 0248893de0..6c09017515 100644
> --- a/xen/arch/arm/cpuerrata.c
> +++ b/xen/arch/arm/cpuerrata.c
> @@ -476,9 +476,15 @@ static const struct arm_cpu_capabilities arm_errata[] = {
>           .matches = has_ssbd_mitigation,
>       },
>   #endif
> +    {
> +        /* Neoverse r0p0 - r2p0 */
> +        .desc = "ARM erratum 1165522",
> +        .capability = ARM64_WORKAROUND_AT_SPECULATE,
> +        MIDR_RANGE(MIDR_NEOVERSE_N1, 0, 2 << MIDR_VARIANT_SHIFT),
> +    },
>       {
>           /* Cortex-A76 r0p0 - r2p0 */
> -        .desc = "ARM erratum 116522",
> +        .desc = "ARM erratum 1165522",
>           .capability = ARM64_WORKAROUND_AT_SPECULATE,
>           MIDR_RANGE(MIDR_CORTEX_A76, 0, 2 << MIDR_VARIANT_SHIFT),
>       },
> 

-- 
Julien Grall

