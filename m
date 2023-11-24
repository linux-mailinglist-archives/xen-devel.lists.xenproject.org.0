Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 01DC17F7269
	for <lists+xen-devel@lfdr.de>; Fri, 24 Nov 2023 12:07:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.640552.998956 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r6U1X-0007z9-AE; Fri, 24 Nov 2023 11:07:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 640552.998956; Fri, 24 Nov 2023 11:07:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r6U1X-0007wo-6q; Fri, 24 Nov 2023 11:07:03 +0000
Received: by outflank-mailman (input) for mailman id 640552;
 Fri, 24 Nov 2023 11:07:02 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1r6U1W-0007wi-Ik
 for xen-devel@lists.xenproject.org; Fri, 24 Nov 2023 11:07:02 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1r6U1V-0002Mt-EV; Fri, 24 Nov 2023 11:07:01 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.240])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1r6U1V-0007Zk-8b; Fri, 24 Nov 2023 11:07:01 +0000
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
	bh=uCXT407aJFzBYuPLWhJ8Vs2AanqBM67+tnHcgEzfvXw=; b=4E3K87hTbGcY4GYxdkNm08TvNh
	JMk5V6Ga4iFYiDTVCB3SMsnxnFMZpUldix5tsc4SOZ3OumKWuLyZ49iFaP7WrPpV8Q8p0JTGeCaqs
	MytSNoZYlav1pWD/fodSUU+Uyt4ttoELFjiaN/EkEXE70kYL+JGHK2LBfNe103ZIjK3Y=;
Message-ID: <7a698287-d6d6-40d7-8376-07d870a7eb4a@xen.org>
Date: Fri, 24 Nov 2023 11:06:59 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 05/14] xen/asm-generic: introduce stub header
 <asm/random.h>
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
 <9a2b8920df291915ac6be0d14e6e9896e81ea9bd.1700221559.git.oleksii.kurochko@gmail.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <9a2b8920df291915ac6be0d14e6e9896e81ea9bd.1700221559.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Oleksii,

On 17/11/2023 12:24, Oleksii Kurochko wrote:
> <asm/random.h> is common for Arm, PPC and RISC-V thereby it
> is moved to asm-generic.
> 
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

Acked-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall

