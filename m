Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BAFC04F9B9B
	for <lists+xen-devel@lfdr.de>; Fri,  8 Apr 2022 19:24:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.301719.514962 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ncsLS-0003eP-UF; Fri, 08 Apr 2022 17:24:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 301719.514962; Fri, 08 Apr 2022 17:24:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ncsLS-0003c7-RM; Fri, 08 Apr 2022 17:24:26 +0000
Received: by outflank-mailman (input) for mailman id 301719;
 Fri, 08 Apr 2022 17:24:25 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1ncsLR-0003c1-Iz
 for xen-devel@lists.xenproject.org; Fri, 08 Apr 2022 17:24:25 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1ncsLQ-0007ah-Mh; Fri, 08 Apr 2022 17:24:24 +0000
Received: from [54.239.6.190] (helo=[192.168.16.176])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1ncsLQ-0000VC-Gv; Fri, 08 Apr 2022 17:24:24 +0000
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
	bh=cZKIsOh8usOIMQnUhdiePQniy7HY4ZZBbtAP+Jccb4k=; b=UhddpBsZlTsw/d/PAAYCBg0ahS
	50mWcMYcxHo3gqGCNblAXXEJAGu+TzZJfQG7ylI8e80tLpEy2NGth0vpsREnwjejkzoeGd5kOeTF9
	mv8XM70d96ZCSaxhH5qEsD0NyMaSeIg/X0BjRCqhQy1bEvxwyWYtG3ncDW9DE732N/gw=;
Message-ID: <6c6c14a1-a070-0afe-fafd-0d219febb0d1@xen.org>
Date: Fri, 8 Apr 2022 18:24:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.7.0
Subject: Re: [PATCH v3] SUPPORT.md: add Dom0less as Supported
To: Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org
Cc: andrew.cooper3@citrix.com, george.dunlap@citrix.com, jbeulich@suse.com,
 wl@xen.org
References: <alpine.DEB.2.22.394.2204071706470.2910984@ubuntu-linux-20-04-desktop>
From: Julien Grall <julien@xen.org>
In-Reply-To: <alpine.DEB.2.22.394.2204071706470.2910984@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 08/04/2022 01:10, Stefano Stabellini wrote:
> Add Dom0less to SUPPORT.md to clarify its support status. The feature is
> mature enough and small enough to make it security supported.
> 
> Clarify that dom0less DomUs memory is not scrubbed at boot when
> bootscrub=on or bootscrub=off are passed as Xen command line parameters,
> and no XSAs will be issued for that.
> 
> Also see XSA-372: 371347c5b64da and fd5dc41ceaed.
> 
> Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
> Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>


Acked-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall

