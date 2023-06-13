Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5585772E9DD
	for <lists+xen-devel@lfdr.de>; Tue, 13 Jun 2023 19:33:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.548336.856240 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q97sn-0007JH-2P; Tue, 13 Jun 2023 17:32:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 548336.856240; Tue, 13 Jun 2023 17:32:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q97sm-0007Fg-Vm; Tue, 13 Jun 2023 17:32:40 +0000
Received: by outflank-mailman (input) for mailman id 548336;
 Tue, 13 Jun 2023 17:32:39 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1q97sl-0007Fa-NC
 for xen-devel@lists.xenproject.org; Tue, 13 Jun 2023 17:32:39 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1q97sl-0008CP-6k; Tue, 13 Jun 2023 17:32:39 +0000
Received: from 54-240-197-238.amazon.com ([54.240.197.238]
 helo=[192.168.9.244]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1q97sk-0004z0-VH; Tue, 13 Jun 2023 17:32:39 +0000
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
	bh=fabbaoZWSW6cElsdjmySxu1cmpNCrxHv6EC737CLbtI=; b=xcXlLflfbksJrfUilDAUKE/Hz7
	z5Gh2ZrcXwF9E5D0uMgjlyiIMEznMFxxP268FgNnp2xBWlaILFZz7hhodM4w5XArtlANvItyslhna
	AokvczEzz/cgOGOaqDnMxgbh7UYGEmSAu7KokKX4erFj6NsT6yU2Wj09gN4AeKHJZ9Rg=;
Message-ID: <5967fb0f-0647-c8ff-d485-33e33266e9f6@xen.org>
Date: Tue, 13 Jun 2023 18:32:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.12.0
Subject: Re: [PATCH] xen/gnttab: Purge PIN_FAIL()
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: Jan Beulich <JBeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>
References: <20230613165209.3121038-1-andrew.cooper3@citrix.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20230613165209.3121038-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 13/06/2023 17:52, Andrew Cooper wrote:
> This is disliked specifically by MISRA, but it also interferes with code
> legibility by hiding control flow.  Expand and drop it. >
>   * Drop redundant "rc = rc" assignment
>   * Rework gnttab_copy_buf() to be simpler by dropping the rc variable
> 
> No functional change.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall

