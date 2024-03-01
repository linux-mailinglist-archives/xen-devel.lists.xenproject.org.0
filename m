Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AE58986DEB1
	for <lists+xen-devel@lfdr.de>; Fri,  1 Mar 2024 10:57:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.687597.1071260 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rfzd2-0001Nv-Il; Fri, 01 Mar 2024 09:56:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 687597.1071260; Fri, 01 Mar 2024 09:56:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rfzd2-0001Lm-GB; Fri, 01 Mar 2024 09:56:32 +0000
Received: by outflank-mailman (input) for mailman id 687597;
 Fri, 01 Mar 2024 09:56:30 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1rfzd0-0001Lg-LY
 for xen-devel@lists.xenproject.org; Fri, 01 Mar 2024 09:56:30 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rfzcz-0008Vy-JE; Fri, 01 Mar 2024 09:56:29 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.240])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rfzcz-000153-4S; Fri, 01 Mar 2024 09:56:29 +0000
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
	bh=rbTrwl3BY9ZyXkcvo/le8kgvFrsWpOqK/cak/CaBn64=; b=Zksstf9rRio+GHP8QpHqh3CrQI
	2n5SisEkLFQHiz64tpHnN4eH5UHQX0AYAt+w5qy1vAXmHCRmySqf3+kFBXwvJHEe4LlyVn29gb0xA
	oZbI/7JyFD1zuhmxUqoSzO/iUhy8FodzMyRUcr/DQ5mL9P4bdT44csZuET4Yiqc6yibA=;
Message-ID: <4bd44ce1-87ee-4426-a693-c82e6a25edb5@xen.org>
Date: Fri, 1 Mar 2024 09:56:27 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arch: move array_index_mask_nospec()
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>
References: <239f2a0a-f1da-4c25-af43-dfac51bb1bd8@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <239f2a0a-f1da-4c25-af43-dfac51bb1bd8@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Jan,

On 26/02/2024 10:34, Jan Beulich wrote:
> At the time they were introduced, there were no asm/nospec.h yet, so
> they were placed in system.h. Move them to nospec.h and drop
> xen/nospec.h's including of asm/system.h; there's one unrelated #include
> that needs adding in exchange, on x86.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall

