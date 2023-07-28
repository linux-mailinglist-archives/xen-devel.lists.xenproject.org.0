Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 85B8676681E
	for <lists+xen-devel@lfdr.de>; Fri, 28 Jul 2023 11:05:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.571398.895128 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qPJPm-0005pn-WF; Fri, 28 Jul 2023 09:05:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 571398.895128; Fri, 28 Jul 2023 09:05:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qPJPm-0005nE-SI; Fri, 28 Jul 2023 09:05:38 +0000
Received: by outflank-mailman (input) for mailman id 571398;
 Fri, 28 Jul 2023 09:05:37 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qPJPl-0005n8-MF
 for xen-devel@lists.xenproject.org; Fri, 28 Jul 2023 09:05:37 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qPJPl-0008AK-CX; Fri, 28 Jul 2023 09:05:37 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.240])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qPJPl-00078H-6j; Fri, 28 Jul 2023 09:05:37 +0000
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
	bh=0T+6Sm4suejPd4WB7MugA13bV8goCwDaCafWOBMQoWQ=; b=0Z1Qth5jwV5CqHuNnvFfbz3/dm
	PE/SmXPrDQ84GYNGORrvMFVJRBLHeUpwDjFxeHlYCAo4Phh1Mpp79Yjfz7CKSPpTFXx4ZFELAAkJH
	ltxsBoOaJd/18/wNkguy98G7QVjwqK+teOU2clUzIvYtjRPU5QxLuOAqpmKW/MkLxyJY=;
Message-ID: <cf80a7f3-758f-6a49-1353-44303bad0e7f@xen.org>
Date: Fri, 28 Jul 2023 10:05:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/5] arm/mm: Document the differences between arm32 and
 arm64 directmaps
Content-Language: en-GB
To: Alejandro Vallejo <alejandro.vallejo@cloud.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20230728075903.7838-1-alejandro.vallejo@cloud.com>
 <20230728075903.7838-2-alejandro.vallejo@cloud.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20230728075903.7838-2-alejandro.vallejo@cloud.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Alex,

On 28/07/2023 08:58, Alejandro Vallejo wrote:
> arm32 merely covers the XENHEAP, whereas arm64 currently covers anything in
> the frame table. These comments highlight why arm32 doesn't need to account for PDX
> compression in its __va() implementation while arm64 does.
> 
> Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>

Reviewed-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall

