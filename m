Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 03D0D7F7286
	for <lists+xen-devel@lfdr.de>; Fri, 24 Nov 2023 12:17:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.640561.998985 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r6UB4-0007vZ-Mw; Fri, 24 Nov 2023 11:16:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 640561.998985; Fri, 24 Nov 2023 11:16:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r6UB4-0007s1-K0; Fri, 24 Nov 2023 11:16:54 +0000
Received: by outflank-mailman (input) for mailman id 640561;
 Fri, 24 Nov 2023 11:16:53 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1r6UB3-0007lo-ED
 for xen-devel@lists.xenproject.org; Fri, 24 Nov 2023 11:16:53 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1r6UB2-0002fC-Dt; Fri, 24 Nov 2023 11:16:52 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.240])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1r6UB2-000825-8P; Fri, 24 Nov 2023 11:16:52 +0000
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
	bh=SlBkh2m7H+8zDGwAzCSEeok6oXUYvWC0qldRnzIHdk0=; b=d4bzM3oxFnf0/mbISMWWXsHwhA
	s2yu9Jgru8Rynb1GmE2L2szyLTjA0v+2Lh2Hcve3/pxcIXKxHZB1zGLDZQQBDQWDVEyK0PJF82BZI
	gPrf8ZnszQwEkQrYzb46PykyXWog2pUtXynnQbxphSHY2/+F3RxESDWxOSzLBWF0zRGo=;
Message-ID: <bfd478d5-5d1c-4bec-9032-0ab57d2b1730@xen.org>
Date: Fri, 24 Nov 2023 11:16:51 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 07/14] xen/asm-generic: introduce generalized hardirq.h
Content-Language: en-GB
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Wei Liu <wl@xen.org>, Shawn Anastasio <sanastasio@raptorengineering.com>
References: <cover.1700221559.git.oleksii.kurochko@gmail.com>
 <3e5334809f5efa78eebe8e8ff342f10851f107f9.1700221559.git.oleksii.kurochko@gmail.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <3e5334809f5efa78eebe8e8ff342f10851f107f9.1700221559.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Oleksii,

On 17/11/2023 12:24, Oleksii Kurochko wrote:
> <asm/hardirq.h> is common through archs thereby it is moved
> to asm-generic.
> 
> Arm and PPC were switched to asm generic verstion of hardirq.h.
> 
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

Acked-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall

