Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 67332809085
	for <lists+xen-devel@lfdr.de>; Thu,  7 Dec 2023 19:47:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.650114.1015367 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rBJOO-0001qF-Iz; Thu, 07 Dec 2023 18:46:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 650114.1015367; Thu, 07 Dec 2023 18:46:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rBJOO-0001oG-GL; Thu, 07 Dec 2023 18:46:36 +0000
Received: by outflank-mailman (input) for mailman id 650114;
 Thu, 07 Dec 2023 18:46:35 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1rBJON-0001oA-6T
 for xen-devel@lists.xenproject.org; Thu, 07 Dec 2023 18:46:35 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rBJOM-0001fm-4k; Thu, 07 Dec 2023 18:46:34 +0000
Received: from 54-240-197-234.amazon.com ([54.240.197.234]
 helo=[192.168.14.186]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rBJOL-0002yX-UA; Thu, 07 Dec 2023 18:46:34 +0000
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
	bh=ZiqSKexo2Dz6zUWbB35dNAnR/EMUDJk1m+ZnUKSxA94=; b=iLxWQ7sTP/nlfd5QzxJwL1K2MY
	uOHJgwe/l5Lm/0t77O1I4HDqHMwN6Rv7nbLir8vsehzZ3dlE1sEn44abAnyKqUET/E27l7fuI0Mxv
	obasoLl5JIWHwkt/zexo88uk1L7KsRKzTNOViWKSYjZJMr2AfsPzebyX0PZ09DHFJtjQ=;
Message-ID: <90575ebd-4b09-47bd-a4ee-2f081020b2ad@xen.org>
Date: Thu, 7 Dec 2023 18:46:31 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] MAINTAINERS: Hand over the release manager role to
 Oleksii Kurochko
Content-Language: en-GB
To: Henry Wang <Henry.Wang@arm.com>, xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>
References: <20231207162036.1921323-1-Henry.Wang@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20231207162036.1921323-1-Henry.Wang@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 07/12/2023 16:20, Henry Wang wrote:
> I've finished the opportunity to do two releases (4.17 and 4.18)
> and Oleksii Kurochko has volunteered to be the next release manager.

Henry, thanks for your time as release manager.
Oleksii, thanks for stepping up and good luck for the role!

> Hand over the role to him by changing the maintainership of the
> CHANGELOG.md.
> 
> Signed-off-by: Henry Wang <Henry.Wang@arm.com>

Acked-by: Julien Grall <jgrall@amazon.com>

I didn't hear any objection during the community call. But I will give 
until Tuesday morning (UK time) just in case. If there are none, then I 
will commit it.

Cheers,

-- 
Julien Grall

