Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A929667DB3
	for <lists+xen-devel@lfdr.de>; Thu, 12 Jan 2023 19:16:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.476347.738466 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pG26g-0002LX-ML; Thu, 12 Jan 2023 18:15:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 476347.738466; Thu, 12 Jan 2023 18:15:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pG26g-0002Id-J0; Thu, 12 Jan 2023 18:15:18 +0000
Received: by outflank-mailman (input) for mailman id 476347;
 Thu, 12 Jan 2023 18:15:16 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1pG26e-0002IX-9I
 for xen-devel@lists.xenproject.org; Thu, 12 Jan 2023 18:15:16 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pG26d-000845-4z; Thu, 12 Jan 2023 18:15:15 +0000
Received: from 54-240-197-233.amazon.com ([54.240.197.233]
 helo=[192.168.11.96]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pG26c-00013C-U6; Thu, 12 Jan 2023 18:15:15 +0000
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
	bh=0T6CmS7Lj1GKJYo6rIwFronkiooLLAtVG9BDyYYAS1E=; b=Y7UtwD7uT2UscZgSumLEQvRnSX
	Rri3vynsOQIGbRL3mH3YyYuSnXyQFINTykD2NkIG9YerZz8IIjjRR1zxeXW76hOwYQpRUxy40tnnH
	dMZQIaPGEpgvMGfWMJkpJy1YdbLfpws/+7AGOGioQ4hpw5em90p6vmvamOT68VaSGaU4=;
Message-ID: <cb03bc33-48d3-c41c-b383-b3a2c5a57def@xen.org>
Date: Thu, 12 Jan 2023 18:15:12 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH] include/types: move stdlib.h-kind types to common header
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>
References: <5a0a9e2a-c116-21b5-8081-db75fe4178d7@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <5a0a9e2a-c116-21b5-8081-db75fe4178d7@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Jan,

On 12/01/2023 14:01, Jan Beulich wrote:
> size_t, ssize_t, and ptrdiff_t are all expected to be uniformly defined
> on any ports Xen might gain. In particular I hope new ports can rely on
> __SIZE_TYPE__ and __PTRDIFF_TYPE__ being made available by the compiler.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Julien Grall <jgrall@amazon.com>

I also don't have any strong opinion either way about continuing to use 
types.h or introduce stddef.h.

Cheers,

-- 
Julien Grall

