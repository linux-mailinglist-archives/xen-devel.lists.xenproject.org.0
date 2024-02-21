Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D84085EC72
	for <lists+xen-devel@lfdr.de>; Thu, 22 Feb 2024 00:02:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.684165.1063879 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rcvbn-0004J2-Um; Wed, 21 Feb 2024 23:02:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 684165.1063879; Wed, 21 Feb 2024 23:02:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rcvbn-0004GR-SE; Wed, 21 Feb 2024 23:02:35 +0000
Received: by outflank-mailman (input) for mailman id 684165;
 Wed, 21 Feb 2024 23:02:33 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1rcvbl-0004GG-Rr
 for xen-devel@lists.xenproject.org; Wed, 21 Feb 2024 23:02:33 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rcvbk-0007kp-OQ; Wed, 21 Feb 2024 23:02:32 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.193])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rcvbk-0005ze-IR; Wed, 21 Feb 2024 23:02:32 +0000
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
	bh=LyW+Ud3uGdVm+rDUBBEm/zt10hSu5jEXlATe7kRh9RI=; b=fpqYylFUY7en5+ZvQUYBNIOn04
	9nbQD5UC2f9Qit6vwJpHENKPcZBFMgeNhhcGs0gKWm/AFbeXC89VGox42Pdp4QbDValM8Q3j6ueNQ
	5zrak9B2DvzK3HJO2Rvu8BKJ9ro2I2HbJEPhFbgVNmYITa4f7Jy7S3pi+HvHTrFrFnfs=;
Message-ID: <801ed065-cdc1-491b-b34e-8cc4a964257d@xen.org>
Date: Wed, 21 Feb 2024 23:02:30 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 5/8] serial: drop serial_[rt]x_interrupt()'s regs
 parameter
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Michal Orzel <michal.orzel@amd.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>
References: <e5f62a45-5b68-404d-908e-909f84f87b44@suse.com>
 <6476a662-14f2-4206-83c6-a561c6c4aee5@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <6476a662-14f2-4206-83c6-a561c6c4aee5@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Jan,

On 20/02/2024 08:55, Jan Beulich wrote:
> They're simply not needed anymore.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>

Acked-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall

