Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 82AE4775B13
	for <lists+xen-devel@lfdr.de>; Wed,  9 Aug 2023 13:14:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.580974.909481 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTh8X-00065l-De; Wed, 09 Aug 2023 11:13:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 580974.909481; Wed, 09 Aug 2023 11:13:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTh8X-00062u-AR; Wed, 09 Aug 2023 11:13:57 +0000
Received: by outflank-mailman (input) for mailman id 580974;
 Wed, 09 Aug 2023 11:13:56 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qTh8W-00062o-12
 for xen-devel@lists.xenproject.org; Wed, 09 Aug 2023 11:13:56 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qTh8U-0006FW-My; Wed, 09 Aug 2023 11:13:54 +0000
Received: from 54-240-197-235.amazon.com ([54.240.197.235]
 helo=[192.168.16.102]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qTh8U-0003DF-Gn; Wed, 09 Aug 2023 11:13:54 +0000
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
	bh=yciX83DpxqrFk9CyGdNw2PmMRLfLuq1v2HCUB9ydSXw=; b=kk0AfUlGwtPInjlqadg6jgkDWS
	yUWSJTVYTKU5zuAljIhbygMXUuCPQZx/Am3+/TWPQoCNgKaLhgjn48R+EQ69dyH5xDAdsDoXEh+gf
	yGvGtCzloc2LTuy37Oh8YUGyGV4sxOF2VgLsrUBj0F2lg9FVbQ8qWxQphDSYM+xAiKok=;
Message-ID: <94a5862e-d1c0-432b-9864-90a43945bc9b@xen.org>
Date: Wed, 9 Aug 2023 12:13:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] common: asm/desc.h is an x86-only header
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
 Shawn Anastasio <sanastasio@raptorengineering.com>
References: <1ea0cd2e-1821-541d-068f-a18309d1823c@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <1ea0cd2e-1821-541d-068f-a18309d1823c@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Jan,

On 08/08/2023 10:42, Jan Beulich wrote:
>  From briefly going over 9062553a0dc1 it looks like the #include in what
> was ac_timer.c was added there for no reason. It's unneeded now in any
> event, and it is the sole reason for Arm to have that dummy header.
> Purge that, thus avoiding PPC to also gain one.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall

