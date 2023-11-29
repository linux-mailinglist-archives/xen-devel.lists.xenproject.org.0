Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 94BFD7FDEF9
	for <lists+xen-devel@lfdr.de>; Wed, 29 Nov 2023 19:00:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.644150.1004797 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r8OrN-0006r3-Kj; Wed, 29 Nov 2023 18:00:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 644150.1004797; Wed, 29 Nov 2023 18:00:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r8OrN-0006ol-I4; Wed, 29 Nov 2023 18:00:29 +0000
Received: by outflank-mailman (input) for mailman id 644150;
 Wed, 29 Nov 2023 18:00:28 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1r8OrM-0006of-06
 for xen-devel@lists.xenproject.org; Wed, 29 Nov 2023 18:00:28 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1r8OrK-0000mr-MZ; Wed, 29 Nov 2023 18:00:26 +0000
Received: from 82-132-227-204.dab.02.net ([82.132.227.204] helo=[172.20.10.4])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1r8OrK-0005Ou-Dz; Wed, 29 Nov 2023 18:00:26 +0000
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
	bh=boEPgxBMzrY5J3zL8LvGgZ2C/aLN3G6VzKwCQqyvfdw=; b=LFeqRsn0Oq9gKkwhDLGbHNU2j0
	+mE08wmWxE69PxjVJ2uJAyYB82XcvTMucNUZUScVDu7lIK8vy5a6Hra7XBmFJBYt1BkPD2/mhpX2o
	EiyTKxo/9vxva+5Dn1YZQ8jFDYxZQtE7VGBpvmbFeQae3b780T0/sxwwDgTcvkUtbfwY=;
Message-ID: <a9012a64-638a-4960-817a-7ec4764ee2d6@xen.org>
Date: Wed, 29 Nov 2023 19:00:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] .gitignore: generalize *.new
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>
References: <40438252-0d54-47f0-aad8-e76d57508bc5@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <40438252-0d54-47f0-aad8-e76d57508bc5@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Jan,

On 28/11/2023 13:51, Jan Beulich wrote:
> It's not only in xen/include/xen/ that we generate (intermediate) *.new
> files.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall

