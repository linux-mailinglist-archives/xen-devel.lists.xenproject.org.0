Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 12B4672A1C8
	for <lists+xen-devel@lfdr.de>; Fri,  9 Jun 2023 20:04:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.546277.853025 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q7gTd-00043j-7a; Fri, 09 Jun 2023 18:04:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 546277.853025; Fri, 09 Jun 2023 18:04:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q7gTd-000414-4s; Fri, 09 Jun 2023 18:04:45 +0000
Received: by outflank-mailman (input) for mailman id 546277;
 Fri, 09 Jun 2023 18:04:43 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1q7gTb-00040w-AV
 for xen-devel@lists.xenproject.org; Fri, 09 Jun 2023 18:04:43 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1q7gTb-000385-45; Fri, 09 Jun 2023 18:04:43 +0000
Received: from 54-240-197-233.amazon.com ([54.240.197.233]
 helo=[192.168.17.204]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1q7gTa-00024r-VE; Fri, 09 Jun 2023 18:04:43 +0000
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
	bh=i9EmFInx3z5xyFf/FXXG5YbAdS+pjmAGe0EB3FDnTEI=; b=SCWKqgpYVA+yfhPpsOunNKQX/s
	c8SrfhJfEBcpHpQ3fz7sbqE3fzPkshartpKV7YYX+wVD07d4b1kSYfYZcg5mKe1hugDamAejSmtVY
	cQcvQ17CJwQemojbVZAMROiLTsjZA+MSHrBButkjyfjQaJa4bmwxp/bxdPMMKwqL2jyk=;
Message-ID: <86b55b3e-0677-5716-e221-05018e4559d4@xen.org>
Date: Fri, 9 Jun 2023 19:04:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.11.2
Subject: Re: [PATCH v3 09/16] tools/xenstore: remove support of file backed
 data base
Content-Language: en-US
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Anthony PERARD <anthony.perard@citrix.com>
References: <20230530085418.5417-1-jgross@suse.com>
 <20230530085418.5417-10-jgross@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20230530085418.5417-10-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Juergen,

On 30/05/2023 09:54, Juergen Gross wrote:
> In order to prepare the replacement of TDB with direct accessible nodes
> in memory, remove the support for a file backed data base.
> 
> This allows to remove xs_tdb_dump, too.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>

Acked-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall

