Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7400955AB28
	for <lists+xen-devel@lfdr.de>; Sat, 25 Jun 2022 16:54:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.356005.583987 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o57Aq-0007ZM-3f; Sat, 25 Jun 2022 14:54:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 356005.583987; Sat, 25 Jun 2022 14:54:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o57Aq-0007WZ-0A; Sat, 25 Jun 2022 14:54:12 +0000
Received: by outflank-mailman (input) for mailman id 356005;
 Sat, 25 Jun 2022 14:54:11 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1o57Ao-0007WT-Tq
 for xen-devel@lists.xenproject.org; Sat, 25 Jun 2022 14:54:10 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1o57Ao-0002d5-BV; Sat, 25 Jun 2022 14:54:10 +0000
Received: from gw1.octic.net ([81.187.162.82] helo=[10.0.1.102])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1o57Ao-0005df-3m; Sat, 25 Jun 2022 14:54:10 +0000
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
	bh=mx+q6vjinJPOnrfjfjmTtfqcA4rOHuZtQOZl9+9SNv0=; b=z0qk+llQTP/ohVvvCqQPqB3k0w
	sKbuOy00tjJ5v7z2lrmchBwNfPIjYuORH8UWqPL7+mLCzqmpqSRHeecBbh69L8WsObGHCCXl8ovzl
	YrLqmC9/wiQAlNfEc1LlfknwpXeMKDYsnc3rKmc+by8vm75esIdwwb61U5A9YZgAT2Ww=;
Message-ID: <96825a61-9c97-2ea8-519e-bf70de30237d@xen.org>
Date: Sat, 25 Jun 2022 15:54:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.10.0
Subject: Re: [PATCH] xen/arm: irq: Initialize the per-CPU IRQs while preparing
 the CPU
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <jgrall@amazon.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20220614094157.95631-1-julien@xen.org>
 <29AAB4EF-6326-41F2-BB51-EED5FFDB26EA@arm.com>
 <E71E0034-ED75-4783-9A8B-01D6BBF293A9@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <E71E0034-ED75-4783-9A8B-01D6BBF293A9@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Bertrand,

On 24/06/2022 11:01, Bertrand Marquis wrote:
> Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>
> Tested-by: Bertrand Marquis <bertrand.marquis@arm.com>

Thanks! I have committed the patch.

Cheers,

-- 
Julien Grall

