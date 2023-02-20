Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 37A8E69D6ED
	for <lists+xen-devel@lfdr.de>; Tue, 21 Feb 2023 00:08:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.498447.769332 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pUFGS-00088V-Ik; Mon, 20 Feb 2023 23:08:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 498447.769332; Mon, 20 Feb 2023 23:08:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pUFGS-00086M-Fg; Mon, 20 Feb 2023 23:08:08 +0000
Received: by outflank-mailman (input) for mailman id 498447;
 Mon, 20 Feb 2023 23:08:07 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1pUFGR-00086G-9p
 for xen-devel@lists.xenproject.org; Mon, 20 Feb 2023 23:08:07 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pUFGP-0006WR-K2; Mon, 20 Feb 2023 23:08:05 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.102])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pUFGP-0000v2-CN; Mon, 20 Feb 2023 23:08:05 +0000
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
	bh=FafX2SClFS7Vpo8ixoyZ6ek+9GGkN8gzUr9K9rRrSLI=; b=Okv2MCSxKUXXQnKDpNmpyghZw9
	qEMt8FdlQBloLircu1oJGBjmv2mpfu2LBzcE8Vzwd1WA6fv62+dMEEXpQpQsAthfn/XJPQgm8J/Uh
	YT+4XrxbdSeswH2MhLk6jXJ5tN8RQFEQuN4u6JMuCfekDNDPyL8wC7yxhWOUkO9J7ECg=;
Message-ID: <02ec8fb6-3736-8113-6c8c-d9f76c74be2e@xen.org>
Date: Mon, 20 Feb 2023 23:08:03 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.7.2
Subject: Re: [PATCH] tools/xenstore: remove stale comment in create_node()
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
References: <20230220145706.15905-1-jgross@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20230220145706.15905-1-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 20/02/2023 14:57, Juergen Gross wrote:
> There is a part of a comment in create_node() which should have been
> deleted when modifying the related coding.

IIUC, you are referring to:

1cd3cc7ea27c ("tools/xenstore: create_node: Don't defer work to undo any 
changes on failure").

If so, then please mention it in the commit message. It can be done on 
commit so:

> 
> Signed-off-by: Juergen Gross <jgross@suse.com>

Reviewed-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall

