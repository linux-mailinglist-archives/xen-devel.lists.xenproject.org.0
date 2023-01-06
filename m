Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 82452660177
	for <lists+xen-devel@lfdr.de>; Fri,  6 Jan 2023 14:43:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.472612.732894 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pDmzi-00039L-Qz; Fri, 06 Jan 2023 13:42:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 472612.732894; Fri, 06 Jan 2023 13:42:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pDmzi-000375-O8; Fri, 06 Jan 2023 13:42:50 +0000
Received: by outflank-mailman (input) for mailman id 472612;
 Fri, 06 Jan 2023 13:42:50 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1pDmzh-00036z-Ve
 for xen-devel@lists.xenproject.org; Fri, 06 Jan 2023 13:42:49 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pDmzh-000861-L1; Fri, 06 Jan 2023 13:42:49 +0000
Received: from 54-240-197-234.amazon.com ([54.240.197.234]
 helo=[192.168.4.240]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pDmzh-0001I7-DC; Fri, 06 Jan 2023 13:42:49 +0000
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
	bh=1xSvn0wKkIrdDwdTQKVcoGlupvegRZ85iKM+1ckxPpQ=; b=xsEVc6FnI0VAfju6DbUu0t+GQh
	CK6v/X38FlZSPUut7OG28p28bZ+amJ3w/B2eUpcwYZZ6P6zMNGIO1AWXxyuxz2xI4JRwBH+FhsbHk
	LWnTpymxM+zq4XNt3N6exlFk0XV/KLf9e5xbP0BuegpY5E1VQCuvHjY+rNHidF5nEq8Q=;
Message-ID: <0da22900-63f0-b8fa-00b6-855e2a94485d@xen.org>
Date: Fri, 6 Jan 2023 13:42:47 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH v1 1/8] xen/riscv: introduce dummy asm/init.h
Content-Language: en-US
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Gianluca Guida <gianluca@rivosinc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>
References: <cover.1673009740.git.oleksii.kurochko@gmail.com>
 <cb2f0751d717774dfe065727c87b8f62f588ca17.1673009740.git.oleksii.kurochko@gmail.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <cb2f0751d717774dfe065727c87b8f62f588ca17.1673009740.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 06/01/2023 13:14, Oleksii Kurochko wrote:

I am guessing this is necessary because you will use <xen/init.h> will 
be used later on.

If so, then I think it would be useful for mention it in the commit message.

> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

Reviewed-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall

