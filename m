Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AAFBAAAC30D
	for <lists+xen-devel@lfdr.de>; Tue,  6 May 2025 13:50:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.977105.1364175 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uCGop-0006v9-1r; Tue, 06 May 2025 11:50:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 977105.1364175; Tue, 06 May 2025 11:50:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uCGoo-0006tU-V1; Tue, 06 May 2025 11:50:38 +0000
Received: by outflank-mailman (input) for mailman id 977105;
 Tue, 06 May 2025 11:50:37 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1uCGon-0006rk-6Z
 for xen-devel@lists.xenproject.org; Tue, 06 May 2025 11:50:37 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1uCGom-00Cev0-2Q;
 Tue, 06 May 2025 11:50:36 +0000
Received: from [2a02:8012:3a1:0:7157:32ca:2aea:33a3]
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1uCGom-00HQf8-1u;
 Tue, 06 May 2025 11:50:36 +0000
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
	bh=hUm4V1VJtY8bczQ2XY/vIcjHvWnQG7osgCGsS9uiIb4=; b=Wn58r2j2i6E1UQWm5k9nm5GhgR
	ivbfx0qgMp0faHcUScNwNWAW8jq9pvuj3AKOoCwldu5MOOXivpqyUdhLHONSIMKu06jqYPxHtUcM2
	+BeO65qqaqu9V7FAMYIZank+3MzOcmW0r4ucTvOhK/ndZrFST05kuYkCgtXyK21Z0x4Q=;
Message-ID: <c11f9f66-ddf0-4dd8-8504-0ac5f4d1e0f0@xen.org>
Date: Tue, 6 May 2025 12:50:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/7] arm/mpu: Introduce MPU memory region map structure
Content-Language: en-GB
To: Luca Fancellu <luca.fancellu@arm.com>, xen-devel@lists.xenproject.org
Cc: Penny Zheng <Penny.Zheng@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Wei Chen <wei.chen@arm.com>
References: <20250429152057.2380536-1-luca.fancellu@arm.com>
 <20250429152057.2380536-3-luca.fancellu@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20250429152057.2380536-3-luca.fancellu@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 29/04/2025 16:20, Luca Fancellu wrote:
> From: Penny Zheng <Penny.Zheng@arm.com>
> 
> Introduce pr_t typedef which is a structure having the prbar
> and prlar members, each being structured as the registers of
> the aarch64 armv8-r architecture.

Typo: AArch64 Armv8-R

> 
> Signed-off-by: Penny Zheng <penny.zheng@arm.com>
> Signed-off-by: Wei Chen <wei.chen@arm.com>
> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>

Acked-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall


