Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A7E114CDEEA
	for <lists+xen-devel@lfdr.de>; Fri,  4 Mar 2022 21:55:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.284909.484148 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nQEwh-0005Af-SP; Fri, 04 Mar 2022 20:54:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 284909.484148; Fri, 04 Mar 2022 20:54:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nQEwh-000586-P2; Fri, 04 Mar 2022 20:54:39 +0000
Received: by outflank-mailman (input) for mailman id 284909;
 Fri, 04 Mar 2022 20:54:38 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1nQEwg-000580-RB
 for xen-devel@lists.xenproject.org; Fri, 04 Mar 2022 20:54:38 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nQEwg-0002yL-3I; Fri, 04 Mar 2022 20:54:38 +0000
Received: from [54.239.6.187] (helo=[192.168.25.28])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nQEwf-0002Ty-SR; Fri, 04 Mar 2022 20:54:38 +0000
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
	bh=vYRiq5Y5GKsgAmnffzmE2GqX91dQAzzALXoefxqMECY=; b=PKWZ3WNK/OnG9iDGDVBweI9fRk
	UEgWxv8QN/zUcn4remm8uhwhfHz5Kp8lM29iD5s31bakKdvjDQyqYDThpDPOp7nsfkTV5us7ft8ET
	yFDJJ03tuyIw6TJ9iTovnxz/1J5b5zPmVsA0Ps/MeypEuwgJuPZHCAvecggn7BB3Z8vs=;
Message-ID: <1bf96df3-3593-1c01-a571-a0ee6e63524e@xen.org>
Date: Fri, 4 Mar 2022 20:54:35 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.6.1
Subject: Re: [PATCH 16/36] xen/color alloc: implement color_from_page for
 ARM64
To: Marco Solieri <marco.solieri@minervasys.tech>,
 xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Marco Solieri <marco.solieri@unimore.it>,
 Andrea Bastoni <andrea.bastoni@minervasys.tech>,
 Luca Miccio <lucmiccio@gmail.com>
References: <20220304174701.1453977-1-marco.solieri@minervasys.tech>
 <20220304174701.1453977-17-marco.solieri@minervasys.tech>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20220304174701.1453977-17-marco.solieri@minervasys.tech>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 04/03/2022 17:46, Marco Solieri wrote:
> From: Luca Miccio <lucmiccio@gmail.com>
> 
> The colored allocator should not make any assumptions on how a color is
> defined, since the definition may change depending on the architecture.
IIUC, you are saying that the mapping between a physical address to a 
way is the same on every Armv8 processor.

Can you provide a reference from the Arm Arm which confirm this statement?

Cheers,

-- 
Julien Grall

