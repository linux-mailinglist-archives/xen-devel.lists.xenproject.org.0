Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 20EEC885FC5
	for <lists+xen-devel@lfdr.de>; Thu, 21 Mar 2024 18:31:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.696545.1087539 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rnMFd-00054W-8I; Thu, 21 Mar 2024 17:30:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 696545.1087539; Thu, 21 Mar 2024 17:30:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rnMFd-00051z-4x; Thu, 21 Mar 2024 17:30:49 +0000
Received: by outflank-mailman (input) for mailman id 696545;
 Thu, 21 Mar 2024 17:30:47 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1rnMFb-00051t-Mk
 for xen-devel@lists.xenproject.org; Thu, 21 Mar 2024 17:30:47 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rnMFb-0006f8-6d; Thu, 21 Mar 2024 17:30:47 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.240])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rnMFa-0006uB-Vg; Thu, 21 Mar 2024 17:30:47 +0000
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
	bh=lbdeDOqJ+i2eL5Vu9dhHJJxJ64TSt4rCuK6fGgrq04Q=; b=NX/Vym/a804aTM7TCwCJKshSfT
	Eqd68b+iVDNg2YV9KHgT7Elf8xoRupi/ZBS0Eet8+68R0/Lg7fA/e1B4cjMMPvXZrbncYrcmxKe+M
	aUtkEFPI8ZWbl7mVsjx/sH7pHR5THQeFzJfOPHDyMqNIVcXryDTiS9gXQ/9bloYjg9Ac=;
Message-ID: <b88f085a-544f-455f-a414-cf59be70f8ee@xen.org>
Date: Thu, 21 Mar 2024 17:30:44 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/9] EFI: Introduce inline stub for efi_enabled on !X86
 && !ARM
Content-Language: en-GB
To: Shawn Anastasio <sanastasio@raptorengineering.com>,
 xen-devel@lists.xenproject.org
Cc: tpearson@raptorengineering.com, Jan Beulich <jbeulich@suse.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <cover.1710443965.git.sanastasio@raptorengineering.com>
 <39069a589f9c4dc0db9b01b7412c1a99bea55f37.1710443965.git.sanastasio@raptorengineering.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <39069a589f9c4dc0db9b01b7412c1a99bea55f37.1710443965.git.sanastasio@raptorengineering.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Shawn,

On 14/03/2024 22:15, Shawn Anastasio wrote:
> On architectures with no EFI support, define an inline stub
> implementation of efi_enabled in efi.h that always returns false.
> 
> Suggested-by: Jan Beulich <jbeulich@suse.com>
> Signed-off-by: Shawn Anastasio <sanastasio@raptorengineering.com>

Acked-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall

