Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C21BF5766E5
	for <lists+xen-devel@lfdr.de>; Fri, 15 Jul 2022 20:45:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.368481.599786 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oCQJ3-0000FA-Rx; Fri, 15 Jul 2022 18:44:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 368481.599786; Fri, 15 Jul 2022 18:44:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oCQJ3-0000Cy-Os; Fri, 15 Jul 2022 18:44:53 +0000
Received: by outflank-mailman (input) for mailman id 368481;
 Fri, 15 Jul 2022 18:44:52 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1oCQJ2-0000Cl-7i
 for xen-devel@lists.xenproject.org; Fri, 15 Jul 2022 18:44:52 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oCQJ1-00034q-UG; Fri, 15 Jul 2022 18:44:51 +0000
Received: from [54.239.6.188] (helo=[192.168.17.116])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oCQJ1-0004eh-Oe; Fri, 15 Jul 2022 18:44:51 +0000
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
	bh=Af8ynqGLd69VSdZ+W1LoA6Il0jjZC9ZL8koWvQJc4T8=; b=t5ygL2m7b8o1qJuNS+wLmvg4zP
	gwAQ1uBXlZ7fiaGQQo57DmvCD9JoE+UzZEwTwWMyTLHHJ1CkfKuMD0PgQh7CHu/0/aw8iqUfs9Xvt
	C1Py2xQIy83V24tle6U9Hq9St0uYQbwipjVNfnl4oj9nmuXE5lLs8U382dPcpvxtJzXI=;
Message-ID: <e4c963c4-ccf3-f864-471f-7be7f37d710f@xen.org>
Date: Fri, 15 Jul 2022 19:44:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.11.0
Subject: Re: [PATCH v8 1/9] xen/arm: rename PGC_reserved to PGC_static
To: Penny Zheng <Penny.Zheng@arm.com>, xen-devel@lists.xenproject.org
Cc: wei.chen@arm.com, Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Wei Liu <wl@xen.org>
References: <20220707092244.485936-1-Penny.Zheng@arm.com>
 <20220707092244.485936-2-Penny.Zheng@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20220707092244.485936-2-Penny.Zheng@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Penny,

On 07/07/2022 10:22, Penny Zheng wrote:
> PGC_reserved could be ambiguous, and we have to tell what the pages are
> reserved for, so this commit intends to rename PGC_reserved to
> PGC_static, which clearly indicates the page is reserved for static
> memory.
> 
> Signed-off-by: Penny Zheng <penny.zheng@arm.com>
> Acked-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall

