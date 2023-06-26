Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EE0A073E1CE
	for <lists+xen-devel@lfdr.de>; Mon, 26 Jun 2023 16:16:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.555543.867394 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qDn0m-0000Jr-3r; Mon, 26 Jun 2023 14:16:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 555543.867394; Mon, 26 Jun 2023 14:16:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qDn0m-0000Hc-08; Mon, 26 Jun 2023 14:16:12 +0000
Received: by outflank-mailman (input) for mailman id 555543;
 Mon, 26 Jun 2023 14:16:10 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qDn0k-0000HU-Qo
 for xen-devel@lists.xenproject.org; Mon, 26 Jun 2023 14:16:10 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qDn0k-00036Y-65; Mon, 26 Jun 2023 14:16:10 +0000
Received: from [193.85.242.128] (helo=[192.168.148.103])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qDn0j-0005Pr-WA; Mon, 26 Jun 2023 14:16:10 +0000
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
	bh=8PgEWNFxeFPY/09ttZMAQ0sVqLHuUKS5hKvExuSbXe8=; b=iXff8gYA8yJx22yBz7Gg1mLaN6
	Zc59rzvEHPkgItDEjJS6hsygKDJTITDqksXhQge9rX7Xc+woknZgAUaO6q1ixNuz6NBHGLiKaX75X
	p6qh9WhaFWTH7QlINcpAMuWP1xrZU9lsbm1TJKumC0fNV7pHc+uhDtk4K9ppGj7FSitc=;
Message-ID: <c115ffe4-3e87-db8c-a0d8-29474bad83bf@xen.org>
Date: Mon, 26 Jun 2023 15:16:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.12.0
Subject: Re: [XEN PATCH v3 5/6] xen/arm: make parameter names of function
 declarations consistent.
Content-Language: en-US
To: Federico Serafini <federico.serafini@bugseng.com>,
 xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com, Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Xenia Ragiadakou <xenia.ragiadakou@amd.com>,
 Ayan Kumar Halder <ayan.kumar.halder@amd.com>
References: <cover.1687771796.git.federico.serafini@bugseng.com>
 <5d0075418f0674e0ca1f63744b87b27085a0d865.1687771796.git.federico.serafini@bugseng.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <5d0075418f0674e0ca1f63744b87b27085a0d865.1687771796.git.federico.serafini@bugseng.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 26/06/2023 10:52, Federico Serafini wrote:
> Change the parameter names of function declarations to be consistent
> with the names used in the corresponding function definitions, thus
> fixing violations of MISRA C:2012 Rule 8.3.
> 
> Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>

Reviewed-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall

