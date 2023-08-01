Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BF1F676AB16
	for <lists+xen-devel@lfdr.de>; Tue,  1 Aug 2023 10:31:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.573821.898766 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qQklz-0000fN-HZ; Tue, 01 Aug 2023 08:30:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 573821.898766; Tue, 01 Aug 2023 08:30:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qQklz-0000cF-Dm; Tue, 01 Aug 2023 08:30:31 +0000
Received: by outflank-mailman (input) for mailman id 573821;
 Tue, 01 Aug 2023 08:30:29 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qQklx-0000c4-6S
 for xen-devel@lists.xenproject.org; Tue, 01 Aug 2023 08:30:29 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qQklw-0002Zu-O9; Tue, 01 Aug 2023 08:30:28 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.240])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qQklw-00031x-DE; Tue, 01 Aug 2023 08:30:28 +0000
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
	bh=TqoozpqwtYlI+Cg7N5cwNpfE/d12kuDYjR33SyYgq+M=; b=OK8xo31NTfxJu+T1ynhos4h3Hg
	V4YJ+Jyjg5yGkFdxdnUN/kY4EZIu7I6xL5kpEYla97zoGYMABCjECYwBlT6ZAuD849R3hp0taM6/X
	kFKl0Wjhe7c55ZOxdLnHZp5xFNxLkeWKbL4vTwZP8zxKpC0QUaEh3gwzPn8X/bh7Wy1I=;
Message-ID: <4f43b069-cb78-f356-628e-29b8ca8e595a@xen.org>
Date: Tue, 1 Aug 2023 09:30:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 00/13] xen/arm: Split MMU code as the prepration of MPU
 work
Content-Language: en-GB
To: Henry Wang <Henry.Wang@arm.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>, Wei Chen <wei.chen@arm.com>,
 Penny Zheng <penny.zheng@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Jan Beulich <jbeulich@suse.com>, Paul Durrant <paul@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <20230801034419.2047541-1-Henry.Wang@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20230801034419.2047541-1-Henry.Wang@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 01/08/2023 04:44, Henry Wang wrote:
> Based on the discussion in the Xen Summit [1], sending this series out after
> addressing the comments in v3 [2] as the preparation work to add MPU support.
> 
> Mostly code movement, with some of Kconfig and build system (mainly Makefiles)
> adjustment. No functional change expected.

I can't really review this series without knowing how this will 
integrate with the rest of the MPU work. Can you at least provide a tree 
with all the patches applied (including the MPU one)?

Cheers,

-- 
Julien Grall

