Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 09A0663592A
	for <lists+xen-devel@lfdr.de>; Wed, 23 Nov 2022 11:07:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.447494.703777 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oxmfO-0007U0-IS; Wed, 23 Nov 2022 10:07:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 447494.703777; Wed, 23 Nov 2022 10:07:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oxmfO-0007Qu-Fh; Wed, 23 Nov 2022 10:07:42 +0000
Received: by outflank-mailman (input) for mailman id 447494;
 Wed, 23 Nov 2022 10:07:40 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1oxmfM-0007Qi-P9
 for xen-devel@lists.xenproject.org; Wed, 23 Nov 2022 10:07:40 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oxmfM-00015m-JZ; Wed, 23 Nov 2022 10:07:40 +0000
Received: from [54.239.6.185] (helo=[192.168.17.134])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oxmfM-0002lU-CL; Wed, 23 Nov 2022 10:07:40 +0000
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
	bh=7BuRn4gN86YI+c+d6nd7UfoXB0hglny3yAPYefRYuh4=; b=Lp5YrTLLUcPUTFo4FdNuLGoPWH
	XUhW8De4f+4sj9ZfM5IopcWpKlUm/Czaa0uyxfEfvWCPB1qumnH6F4PgR5PaU7ZkcCSZOMbXa+9tq
	yIvoIWcmAjh4jz5GVPkr1ZHzMkOaCyj9AjGuL2wtCOFN09DYVfiABefi9js9Ro2xnX6c=;
Message-ID: <6017d143-72b4-e6f0-14d9-332dbcade7c9@xen.org>
Date: Wed, 23 Nov 2022 11:07:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.0
Subject: Re: [PATCH v4 3/3] CHANGELOG: Start new "unstable" section
Content-Language: en-US
To: Henry Wang <Henry.Wang@arm.com>, xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>, George Dunlap
 <george.dunlap@citrix.com>,
 Community Manager <community.manager@xenproject.org>
References: <20221123040315.1480112-1-Henry.Wang@arm.com>
 <20221123040315.1480112-4-Henry.Wang@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20221123040315.1480112-4-Henry.Wang@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Henry,

On 23/11/2022 04:03, Henry Wang wrote:
> Signed-off-by: Henry Wang <Henry.Wang@arm.com>

Reviewed-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall

