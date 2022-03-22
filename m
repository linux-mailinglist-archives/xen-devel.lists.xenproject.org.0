Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 523F24E4779
	for <lists+xen-devel@lfdr.de>; Tue, 22 Mar 2022 21:26:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.293654.498932 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nWl5Q-0004rJ-5c; Tue, 22 Mar 2022 20:26:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 293654.498932; Tue, 22 Mar 2022 20:26:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nWl5Q-0004oH-1y; Tue, 22 Mar 2022 20:26:36 +0000
Received: by outflank-mailman (input) for mailman id 293654;
 Tue, 22 Mar 2022 20:26:35 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1nWl5O-0004o7-Uf
 for xen-devel@lists.xenproject.org; Tue, 22 Mar 2022 20:26:34 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nWl5O-00065O-AV; Tue, 22 Mar 2022 20:26:34 +0000
Received: from 54-240-197-233.amazon.com ([54.240.197.233]
 helo=[192.168.19.186]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nWl5O-0007Y1-4N; Tue, 22 Mar 2022 20:26:34 +0000
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
	bh=u0+XW/eAC0VZiMwML3/HlieFk362aOkW3LKCwS8oJI8=; b=cppVaLEZPw0DpIPef3pRts4WPe
	yR9vBNvNw34w3ZswtNzZs7EZ9+GQB3uxzufNeCDfkpbtzA7TQdd774M+DQnLiLi/WiOZo60Oq/syC
	7UKbiiVt/a7ahTgy79Mt2msAgCeop9MjwSQ2cxFXk2aZJMLlHG2Xs3neM6nj+QwTvAqM=;
Message-ID: <4a4504a0-abc1-86a8-a382-d6237e5d31a1@xen.org>
Date: Tue, 22 Mar 2022 20:26:31 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.7.0
Subject: Re: [PATCH v4 08/11] xen: use generated prototypes for hypercall
 handlers
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <20220310073420.15622-1-jgross@suse.com>
 <20220310073420.15622-9-jgross@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20220310073420.15622-9-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Juergen,

On 10/03/2022 07:34, Juergen Gross wrote:
> Remove the hypercall handler's prototypes in the related header files
> and use the generated ones instead.
> 
> Some handlers having been static before need to be made globally
> visible.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>
> Acked-by: Jan Beulich <jbeulich@suse.com>
> ---
>   xen/arch/arm/include/asm/hypercall.h |   1 -

Acked-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall

