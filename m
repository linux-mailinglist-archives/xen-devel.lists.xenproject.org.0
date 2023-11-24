Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5243B7F7258
	for <lists+xen-devel@lfdr.de>; Fri, 24 Nov 2023 12:03:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.640547.998945 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r6Txx-0006sy-Qh; Fri, 24 Nov 2023 11:03:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 640547.998945; Fri, 24 Nov 2023 11:03:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r6Txx-0006qP-OA; Fri, 24 Nov 2023 11:03:21 +0000
Received: by outflank-mailman (input) for mailman id 640547;
 Fri, 24 Nov 2023 11:03:20 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1r6Txw-0006qJ-4R
 for xen-devel@lists.xenproject.org; Fri, 24 Nov 2023 11:03:20 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1r6Txv-0002I4-2c; Fri, 24 Nov 2023 11:03:19 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.240])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1r6Txu-0007MQ-Qc; Fri, 24 Nov 2023 11:03:18 +0000
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
	bh=UBvgsQUQeRI/mEWFLHJg8o0fkT6Bw+bIo6Qg9q4le5U=; b=ieCEbUUh39H/35wRZ165JGM1y3
	cm6t/5E0VsGTU8SQNqFh0BkQSeiwLSnG0mmEw7GvcCxUK6fh6VC00u4HVjwVtOEJRSpP4qbUmkFrf
	EL89Vimdv3gGwtAqQYOi72wZPP9QDqzmUXxEYvz2Z74M3Aptc5BuA/iLOBaS7eLIwRiI=;
Message-ID: <ee40d478-9e0b-43bc-a9ee-0764ad948ab7@xen.org>
Date: Fri, 24 Nov 2023 11:03:17 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 04/14] xen/asm-generic: introduce generic header
 iocap.h
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
 <3f6a80241a2c98477eaca5fa3bf80ff6c0df3f39.1700221559.git.oleksii.kurochko@gmail.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <3f6a80241a2c98477eaca5fa3bf80ff6c0df3f39.1700221559.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Oleksii,

On 17/11/2023 12:24, Oleksii Kurochko wrote:
> iocap.h is common for Arm, PPC and RISC-V architectures thereby
> it was moved to asm-generic.
> 
> Also Arm and PPC were switched to asm-generic version of iocap.h.
> 
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

Acked-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall

