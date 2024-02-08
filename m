Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C99B384E5B4
	for <lists+xen-devel@lfdr.de>; Thu,  8 Feb 2024 17:58:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.678372.1055653 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rY7j0-0003v3-8v; Thu, 08 Feb 2024 16:58:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 678372.1055653; Thu, 08 Feb 2024 16:58:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rY7j0-0003tI-4O; Thu, 08 Feb 2024 16:58:10 +0000
Received: by outflank-mailman (input) for mailman id 678372;
 Thu, 08 Feb 2024 16:58:08 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1rY7iy-0003so-Mp
 for xen-devel@lists.xenproject.org; Thu, 08 Feb 2024 16:58:08 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rY7is-0002rV-7l; Thu, 08 Feb 2024 16:58:02 +0000
Received: from [15.248.3.89] (helo=[10.24.67.25])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rY7is-0007xl-2K; Thu, 08 Feb 2024 16:58:02 +0000
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
	bh=RENPLmjSW3ld/feJjMbCFg7nhfYb8CIKzF6PBoHCtBg=; b=3OJAITkVafby8TiHw9Dk77/yOy
	henoFtHGg+khlhHpRTrfsaTXTskkdb44TOR+PpYi3fmNHQW7jj/glgQXeJtavAqXD4/l8CAZR3bvQ
	5+qSHoj5j93WWXf4X0Bi9AU96DyML1Li95psdPtgGxkjmEKRwu86AslbdU5ljQd42pxw=;
Message-ID: <e18cf10d-0531-4b11-8ead-a65c853a7a90@xen.org>
Date: Thu, 8 Feb 2024 16:58:00 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Xen 4.19 release status tracking list
Content-Language: en-GB
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: committers@xenproject.org, community.manager@xenproject.org,
 Kelly Choi <kelly.choi@cloud.com>
References: <CAMacjJzio2EDwudCUHoL6psKYztkHZOWwLNDknATvpN6Y0im=Q@mail.gmail.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <CAMacjJzio2EDwudCUHoL6psKYztkHZOWwLNDknATvpN6Y0im=Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Oleksii,

On 05/02/2024 19:23, Oleksii Kurochko wrote:
> Hello everyone,
> 
> I would like to share with you a list for status tracking based on Xen ML:
> 
> Arm:
>    * [PATCH v5 00/13] Arm cache coloring [
> https://lore.kernel.org/xen-devel/20240102095138.17933-1-carlo.nonato@minervasys.tech/
> ]
>    * [PATCH v1 repost 0/4] xen/arm64: Rework the MMU-off code (idmap)
> so it is self-contained [
> https://lore.kernel.org/xen-devel/20240116143709.86584-1-julien@xen.org/
> ]

This has been committed. You can mark it as resolved.

Cheers,

-- 
Julien Grall

