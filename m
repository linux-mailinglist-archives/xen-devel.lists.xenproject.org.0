Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 88F71A78AB3
	for <lists+xen-devel@lfdr.de>; Wed,  2 Apr 2025 11:10:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.935303.1336724 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tzu6n-00046X-KM; Wed, 02 Apr 2025 09:10:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 935303.1336724; Wed, 02 Apr 2025 09:10:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tzu6n-00043T-Gn; Wed, 02 Apr 2025 09:10:05 +0000
Received: by outflank-mailman (input) for mailman id 935303;
 Wed, 02 Apr 2025 09:10:04 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1tzu6m-0003la-7o
 for xen-devel@lists.xenproject.org; Wed, 02 Apr 2025 09:10:04 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1tzu6l-007QTq-2C;
 Wed, 02 Apr 2025 09:10:03 +0000
Received: from [2a02:8012:3a1:0:9928:c7aa:a3ed:1d45]
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1tzu6l-003UYx-1e;
 Wed, 02 Apr 2025 09:10:03 +0000
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
	bh=IiUYA9wWEk3RqA3ZFseM7mr4K627FllFl5yqmwTYLzQ=; b=KbUZWghIMEx8AEU4hziQkHv1pV
	r0PyC6RmyH7R6Br9eEwINGgS05yXZjVG9V4PoQDCIEx/b8CNtNuG2TJmSB812i3jVHmXvJyGP4dgI
	/oATLex4DuX+Fg8xvrjsBwOjnDPw4t38kSN1grsZPJtk6HA7Z2PR5HNVX2i3Z89ZuUY4=;
Message-ID: <e9f0139b-957e-4223-a7c4-9547eaca1a50@xen.org>
Date: Wed, 2 Apr 2025 10:10:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/arm: mpu: Use new-style annotations
Content-Language: en-GB
To: Michal Orzel <michal.orzel@amd.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Jan Beulich <jbeulich@suse.com>
References: <20250402090229.161177-1-michal.orzel@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20250402090229.161177-1-michal.orzel@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Michal,

On 02/04/2025 10:02, Michal Orzel wrote:
> When purging old-style annotations, MPU code was left unmodified. Fix
> it.
> 
> Fixes: 221c66f4f2a4 ("Arm: purge ENTRY(), ENDPROC(), and ALIGN")
> Signed-off-by: Michal Orzel <michal.orzel@amd.com>

Acked-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall


