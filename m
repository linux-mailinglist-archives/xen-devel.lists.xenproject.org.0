Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D0BC2E9716
	for <lists+xen-devel@lfdr.de>; Mon,  4 Jan 2021 15:21:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.61259.107629 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kwQjK-0007Vx-IP; Mon, 04 Jan 2021 14:21:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 61259.107629; Mon, 04 Jan 2021 14:21:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kwQjK-0007Va-FP; Mon, 04 Jan 2021 14:21:06 +0000
Received: by outflank-mailman (input) for mailman id 61259;
 Mon, 04 Jan 2021 14:21:04 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=e1rq=GH=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kwQjI-0007VU-O6
 for xen-devel@lists.xenproject.org; Mon, 04 Jan 2021 14:21:04 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id abe5f214-7121-45a2-b11d-d1d3f0b2a418;
 Mon, 04 Jan 2021 14:21:04 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 35A95B27B;
 Mon,  4 Jan 2021 14:21:03 +0000 (UTC)
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
X-Inumbo-ID: abe5f214-7121-45a2-b11d-d1d3f0b2a418
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1609770063; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kVNSpd9R2xpuCdpgG+63iko2YaScpy4k1wYgOUL0ocU=;
	b=uMsbew3MWXzi4QOlcmA6O6Ol21ovxhxAaQBEshgevd0T0NX5gbp8NDhq3m0CjI3key2CaP
	A1UE4TB18cqsWs+x0PTLvOXBLL4MojwQJvGNY8fiiXr4LbwJ1gnKdxd09cDGIT/54pvHk4
	67mJuT8BkAUFru1qAIZQaFSVv+d6pPE=
Subject: Re: [PATCH] xen/iommu: smmu: Use 1UL << 31 rather than 1 << 31
To: Julien Grall <julien@xen.org>
Cc: bertrand.marquis@arm.com, Rahul.Singh@arm.com,
 Julien Grall <jgrall@amazon.com>, Stefano Stabellini
 <sstabellini@kernel.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 xen-devel@lists.xenproject.org
References: <20201224152419.22453-1-julien@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <b4323f4c-36f5-1d3b-6a46-09420ad6e47d@suse.com>
Date: Mon, 4 Jan 2021 15:21:11 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20201224152419.22453-1-julien@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 24.12.2020 16:24, Julien Grall wrote:
> From: Julien Grall <jgrall@amazon.com>
> 
> Replace all the use of 1 << 31 with 1UL << 31 to prevent undefined
> behavior in the SMMU driver.
> 
> Signed-off-by: Julien Grall <jgrall@amazon.com>

With, as already pointed out by Hans, 1UL replaced by 1U in
title and description
Reviewed-by: Jan Beulich <jbeulich@suse.com>

Jan

