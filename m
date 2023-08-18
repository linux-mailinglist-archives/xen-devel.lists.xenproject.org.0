Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 397A2780AE6
	for <lists+xen-devel@lfdr.de>; Fri, 18 Aug 2023 13:16:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.586093.917317 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qWxT3-00075i-KP; Fri, 18 Aug 2023 11:16:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 586093.917317; Fri, 18 Aug 2023 11:16:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qWxT3-00073Z-HY; Fri, 18 Aug 2023 11:16:37 +0000
Received: by outflank-mailman (input) for mailman id 586093;
 Fri, 18 Aug 2023 11:16:36 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qWxT2-00073R-AG
 for xen-devel@lists.xenproject.org; Fri, 18 Aug 2023 11:16:36 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qWxT1-0007Mv-NA; Fri, 18 Aug 2023 11:16:35 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.240])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qWxT1-0003oo-I3; Fri, 18 Aug 2023 11:16:35 +0000
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
	bh=ZEgXVObrsFQAnkvs7o6yyVs9pLt8OVtLZAR5xeA4CII=; b=GrCAyEE2JeivBgoQpwFYqinVNt
	lVG1BDxzmTGkyT8s+WjFiEsBnsWk0WkyURzghTWzAJyOwv1KYdE4ksNOC4bwGIxISv30n1IU2oEjc
	53UyTZgg4DIFNUuPvGm1RNjHsJ1bCT5snz3MsK2mf2OOBs7TGWx8DajfBVIKNKhfFT5M=;
Message-ID: <c5ada339-504d-4717-9360-78e59acf549a@xen.org>
Date: Fri, 18 Aug 2023 12:16:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 17/19] tools/xenstore: introduce get_node_const()
Content-Language: en-GB
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
References: <20230814074707.27696-1-jgross@suse.com>
 <20230814074707.27696-18-jgross@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20230814074707.27696-18-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Juergen,

On 14/08/2023 08:47, Juergen Gross wrote:
> Add a variant of get_node() returning a const struct node pointer.
> 
> Note that all callers of this new variant don't supply a pointer where
> to store the canonical node name, while all callers needing a non-const
> node do supply this pointer. This results in an asymmetric
> simplification of the two variants.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>

Reviewed-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall

