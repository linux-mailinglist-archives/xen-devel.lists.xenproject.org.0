Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 935535A9853
	for <lists+xen-devel@lfdr.de>; Thu,  1 Sep 2022 15:20:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.396604.636803 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oTk64-00025y-TA; Thu, 01 Sep 2022 13:19:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 396604.636803; Thu, 01 Sep 2022 13:19:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oTk64-00023K-Q4; Thu, 01 Sep 2022 13:19:04 +0000
Received: by outflank-mailman (input) for mailman id 396604;
 Thu, 01 Sep 2022 13:19:03 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1oTk63-00023D-Eg
 for xen-devel@lists.xenproject.org; Thu, 01 Sep 2022 13:19:03 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oTk62-0004Fi-MN; Thu, 01 Sep 2022 13:19:02 +0000
Received: from 54-240-197-233.amazon.com ([54.240.197.233]
 helo=[192.168.12.167]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oTk62-0001r1-D5; Thu, 01 Sep 2022 13:19:02 +0000
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
	bh=PIgjDASsgFiY/ElhawtJlG7/nm73P8f/6MDomhxjrEU=; b=b+ZjzHIaOrO6TVvCQu5r8X7jtK
	CbLNGlyDxCoLve3pxsaNE0OwmzWDjtiHwNplpFjEr/gontxtlztUnuBVvn8sPB7MwURW5dcz/rTYn
	kWBsCdcxiDEsUswPlq2I/kckamiHcY6TuWTiAwVSgCGn3SnqAZyPKK6r0gVhwAgfe548=;
Message-ID: <21e967e6-424e-d648-7bee-080e3d5185e9@xen.org>
Date: Thu, 1 Sep 2022 14:18:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.2.0
Subject: Re: [PATCH v11 5/6] xen: rename free_staticmem_pages to
 unprepare_staticmem_pages
Content-Language: en-US
To: Penny Zheng <Penny.Zheng@arm.com>, xen-devel@lists.xenproject.org
Cc: wei.chen@arm.com, Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Wei Liu <wl@xen.org>
References: <20220831024041.468757-1-Penny.Zheng@arm.com>
 <20220831024041.468757-6-Penny.Zheng@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20220831024041.468757-6-Penny.Zheng@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Penny,

On 31/08/2022 03:40, Penny Zheng wrote:
> The name of free_staticmem_pages is inappropriate, considering it is
> the opposite of function prepare_staticmem_pages.
> 
> Rename free_staticmem_pages to unprepare_staticmem_pages.
> 
> Signed-off-by: Penny Zheng <penny.zheng@arm.com>
> Acked-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall

