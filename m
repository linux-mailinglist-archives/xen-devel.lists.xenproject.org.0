Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A024780ABC
	for <lists+xen-devel@lfdr.de>; Fri, 18 Aug 2023 13:07:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.586051.917257 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qWxIt-0002Gt-Ih; Fri, 18 Aug 2023 11:06:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 586051.917257; Fri, 18 Aug 2023 11:06:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qWxIt-0002En-G5; Fri, 18 Aug 2023 11:06:07 +0000
Received: by outflank-mailman (input) for mailman id 586051;
 Fri, 18 Aug 2023 11:06:05 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qWxIr-0002Eh-IW
 for xen-devel@lists.xenproject.org; Fri, 18 Aug 2023 11:06:05 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qWxIq-00071G-M3; Fri, 18 Aug 2023 11:06:04 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.240])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qWxIq-0003Pk-H0; Fri, 18 Aug 2023 11:06:04 +0000
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
	bh=lKp0ogqW5jTUcwPlCsqGmQJXR+Yeay6HmJWt+p3mHV0=; b=0wJwx7p7586VHuWZiR37pdI8Z7
	2rUjIgPmYtFZSPjegN9hQ4tcTy92z+B4TtY899F2NsjjMSqZvHvR41KE7XIWIH0sytoePSHBPlFOb
	cJMscYzvqexwR6xfJgow7ndlBlFbBshYzAtA94yAn/YruzvHWTMDUrsFADDqt9v0Z8Hw=;
Message-ID: <b4ed3b32-2b1b-43b3-bec5-83f46a7ca3b4@xen.org>
Date: Fri, 18 Aug 2023 12:06:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 13/19] tools/xenstore: introduce read_node_const()
Content-Language: en-GB
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
References: <20230814074707.27696-1-jgross@suse.com>
 <20230814074707.27696-14-jgross@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20230814074707.27696-14-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Juergen,

On 14/08/2023 08:47, Juergen Gross wrote:
> Introduce a read_node() variant returning a pointer to const struct
> node, which doesn't do a copy of the node data after retrieval from
> the data base.
> 
> Call this variant where appropriate.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>

Reviewed-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall

