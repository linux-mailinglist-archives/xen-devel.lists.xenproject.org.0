Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E3DBA99C778
	for <lists+xen-devel@lfdr.de>; Mon, 14 Oct 2024 12:48:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.818621.1231937 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t0Icg-0004uA-Ay; Mon, 14 Oct 2024 10:48:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 818621.1231937; Mon, 14 Oct 2024 10:48:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t0Icg-0004rs-86; Mon, 14 Oct 2024 10:48:22 +0000
Received: by outflank-mailman (input) for mailman id 818621;
 Mon, 14 Oct 2024 10:48:21 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1t0Icf-0004rm-9d
 for xen-devel@lists.xenproject.org; Mon, 14 Oct 2024 10:48:21 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1t0Icf-0000qK-6i; Mon, 14 Oct 2024 10:48:21 +0000
Received: from [2a02:8012:3a1:0:750a:af63:2306:b870]
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1t0Icf-0007A0-0m; Mon, 14 Oct 2024 10:48:21 +0000
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
	bh=NIx09bWwwG/Xv4o8dbzWGu41Fp6dsK4rVmusN8OOfKs=; b=uvRJuT3Mk5Q+3kaFuPzdw42XvO
	fESofTmX6XBLAawv9DNTDQLWUGA7yphGpTASTzK4gGF+7TbKviO9XOyJ2nj7fSaBzi2tC79+6OtVf
	zyKpfTtRCPLS3/kDKzopdRAEr+5+v7l7onp5lhg5FwIF5SqLQjV4/lg8ygtpMjjDYlC0=;
Message-ID: <0be5b60b-c333-4718-98a8-34eae911a169@xen.org>
Date: Mon, 14 Oct 2024 11:48:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/public: add comments regarding interface version
 bumps
Content-Language: en-GB
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
 <jbeulich@suse.com>, Stefano Stabellini <sstabellini@kernel.org>
References: <20241014103311.31272-1-jgross@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20241014103311.31272-1-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Juergen,

On 14/10/2024 11:33, Juergen Gross wrote:
> domctl.h and sysctl.h have an interface version, which needs to be
> bumped in case of incompatible modifications of the interface.

What about vm_event.h?

> 
> In order to avoid misunderstandings, add a comment to both headers
> specifying in which cases a bump is needed.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>

Regardless my question above:

Acked-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall


