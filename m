Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 46F6285EC6E
	for <lists+xen-devel@lfdr.de>; Thu, 22 Feb 2024 00:01:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.684160.1063870 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rcvaM-0003m8-MD; Wed, 21 Feb 2024 23:01:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 684160.1063870; Wed, 21 Feb 2024 23:01:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rcvaM-0003kc-IH; Wed, 21 Feb 2024 23:01:06 +0000
Received: by outflank-mailman (input) for mailman id 684160;
 Wed, 21 Feb 2024 23:01:05 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1rcvaL-0003kW-Ep
 for xen-devel@lists.xenproject.org; Wed, 21 Feb 2024 23:01:05 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rcvaK-0007jM-Ho; Wed, 21 Feb 2024 23:01:04 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.193])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rcvaK-0005ze-Aj; Wed, 21 Feb 2024 23:01:04 +0000
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
	bh=/UnwQ4f25YcwzxadFU1xxhOehoEUl+3dH/muFsfVpSo=; b=xC/hi43GphoZA/CjIWLlj7fRF3
	WM2m6MEeP2FSadT8o1MR4BqsD2uDf/QrQjmWhoqS8ZFLsLQH4ENYAeBuUztru6Sz/zJjpZ7ljG7xN
	35rVogJtMXhsVPLyq6DYYWKvPiuN17Drp3qP0JenE3igxCy0qNOc+UJwekNaoW3lMcr8=;
Message-ID: <f7a07d36-10ac-4f89-9ba7-cfa337eee13b@xen.org>
Date: Wed, 21 Feb 2024 23:01:02 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/8] serial: fake IRQ-regs context in poll handlers
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <e5f62a45-5b68-404d-908e-909f84f87b44@suse.com>
 <a3644326-7514-40f9-939c-2b6294dc5a8b@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <a3644326-7514-40f9-939c-2b6294dc5a8b@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Jan,

On 20/02/2024 08:52, Jan Beulich wrote:
> In preparation of dropping the register parameters from
> serial_[rt]x_interrupt() and in turn from IRQ handler functions,
> register state needs making available another way for the few key
> handlers which need it. Fake IRQ-like state.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall

