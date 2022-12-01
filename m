Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 04A1D63FA48
	for <lists+xen-devel@lfdr.de>; Thu,  1 Dec 2022 23:06:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.451271.708940 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p0rgx-0001Jw-Gi; Thu, 01 Dec 2022 22:06:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 451271.708940; Thu, 01 Dec 2022 22:06:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p0rgx-0001Hj-DW; Thu, 01 Dec 2022 22:06:03 +0000
Received: by outflank-mailman (input) for mailman id 451271;
 Thu, 01 Dec 2022 22:06:01 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1p0rgv-0001Hd-8K
 for xen-devel@lists.xenproject.org; Thu, 01 Dec 2022 22:06:01 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1p0rgu-0005Bm-EF; Thu, 01 Dec 2022 22:06:00 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.102])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1p0rgu-0002sD-7w; Thu, 01 Dec 2022 22:06:00 +0000
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
	bh=OmJswFBmcWPfKCzdaofrgc0EpIZQouYCL7rax589nrI=; b=4yTGniL6HAX4HPb9Qh6L9IHeq5
	VFpSfisZnUTARQo3dDMtrLmVGIJFowK/AtrrGiFAMRicraRfrCNFRLOUYEZN2bqBIVN8w9aK0zC5X
	qxq96pbl04H13LBE7QiBK/Si9t0p8KminU9Ej78+zPvOIkKHtPib5szp1a/la6yOy2jw=;
Message-ID: <872b4aae-34c1-be54-be58-6738ebd0537c@xen.org>
Date: Thu, 1 Dec 2022 22:05:58 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.0
Subject: Re: [PATCH 15/20] tools/xenstore: make domain_is_unprivileged() an
 inline function
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
References: <20221101152842.4257-1-jgross@suse.com>
 <20221101152842.4257-16-jgross@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20221101152842.4257-16-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Juergen,

On 01/11/2022 15:28, Juergen Gross wrote:
> clang is complaining about a NULL dereference for constructs like:
> 
>    domain_is_unprivileged(conn) ? conn->in : NULL

I have just build xenstored with clang 11 and didn't get a complain. So 
can you provide more details?

Cheers,

-- 
Julien Grall

