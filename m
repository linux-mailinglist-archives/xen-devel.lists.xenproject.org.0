Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E5619849D37
	for <lists+xen-devel@lfdr.de>; Mon,  5 Feb 2024 15:40:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.676153.1052075 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rX08c-0007bF-Do; Mon, 05 Feb 2024 14:39:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 676153.1052075; Mon, 05 Feb 2024 14:39:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rX08c-0007aL-9R; Mon, 05 Feb 2024 14:39:58 +0000
Received: by outflank-mailman (input) for mailman id 676153;
 Mon, 05 Feb 2024 14:39:56 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1rX08a-0007aF-E6
 for xen-devel@lists.xenproject.org; Mon, 05 Feb 2024 14:39:56 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rX08Z-0007ce-Nt; Mon, 05 Feb 2024 14:39:55 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.240])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rX08Z-0008Vn-Gq; Mon, 05 Feb 2024 14:39:55 +0000
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
	bh=3v2B+1bf2u8wUgFhFX2ioDgMbxwNW2MJi8f5Ed7apnQ=; b=XbqBgPSWBCZGGMd94Dq+2V7KGI
	JqFtKs+cvIf1a7TCL+l4looSP2uhdt9pmzdH3Wy3k8lKKdaDQHGmhdEx5MDFDkOmGg6KI8uBg76eN
	aQLxtLdJ8f1qI2IDf9uVW3QjXrYQuiIVl/EaFnXvQzl7AkwKljpUV4UaJBzu8EosjEA4=;
Message-ID: <cee3522d-6f33-4157-8e96-e179820c9392@xen.org>
Date: Mon, 5 Feb 2024 14:39:54 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 24/32] tools/xenstored: move all socket handling into
 posix.c
Content-Language: en-GB
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
References: <20240205105001.24171-1-jgross@suse.com>
 <20240205105001.24171-25-jgross@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20240205105001.24171-25-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Juergen,

On 05/02/2024 10:49, Juergen Gross wrote:
> All of the socket handling is needed only when running as daemon.
> 
> Move it into posix.c, allowing to remove the NO_SOCKETS macro.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>

Reviewed-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall

