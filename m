Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 32CD860F3BA
	for <lists+xen-devel@lfdr.de>; Thu, 27 Oct 2022 11:32:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.430975.683351 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1onzFY-0003Nb-Fo; Thu, 27 Oct 2022 09:32:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 430975.683351; Thu, 27 Oct 2022 09:32:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1onzFY-0003KQ-CN; Thu, 27 Oct 2022 09:32:32 +0000
Received: by outflank-mailman (input) for mailman id 430975;
 Thu, 27 Oct 2022 09:32:31 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1onzFX-0003KI-6e
 for xen-devel@lists.xenproject.org; Thu, 27 Oct 2022 09:32:31 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1onzFW-0007ps-Nc; Thu, 27 Oct 2022 09:32:30 +0000
Received: from 54-240-197-235.amazon.com ([54.240.197.235]
 helo=[192.168.29.62]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1onzFW-0005Ni-Gs; Thu, 27 Oct 2022 09:32:30 +0000
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
	bh=EBE1Q7CU6voBZIzX8/WnsrJydJ9TiOFS5RLESzBoRlk=; b=MhY0dJxPLvAzeUbkRMhbEk2sR7
	xolTsgF4YI49G80gKyFi6kRM2by/pE+tWd8g25cVBcxbye8YPlicItKe9zfCKv4kyd8qFtLJY5V9Y
	h3rSGGkM5y4l2XeeR9oaZKjepHUllF42rsJtUO0BNJHuvMDozskVhSIFHBoZ0rSphyNY=;
Message-ID: <fd3142a7-778b-4176-347f-ad02252f59c0@xen.org>
Date: Thu, 27 Oct 2022 10:32:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.0
Subject: Re: [PATCH][4.17] Arm32: prune (again) ld warning about mismatched
 wchar_t sizes
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Anthony Perard <anthony.perard@citrix.com>, Henry Wang <Henry.Wang@arm.com>
References: <6a6df9c5-a527-63ac-60ec-fe7f3b6fadbd@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <6a6df9c5-a527-63ac-60ec-fe7f3b6fadbd@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Jan,

On 27/10/2022 10:30, Jan Beulich wrote:
> The name change (stub.c -> common-stub.c) rendered the earlier
> workaround (commit a4d4c541f58b ["xen/arm32: avoid EFI stub wchar_t size
> linker warning"]) ineffectual.

Ah! I noticed this warning over the week-end and was wondering why it 
was still there...

> 
> Fixes: bfd3e9945d1b ("build: fix x86 out-of-tree build without EFI")
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall

