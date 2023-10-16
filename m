Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A0EE7CA42A
	for <lists+xen-devel@lfdr.de>; Mon, 16 Oct 2023 11:30:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.617378.959918 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qsJv7-0004zn-4k; Mon, 16 Oct 2023 09:29:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 617378.959918; Mon, 16 Oct 2023 09:29:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qsJv7-0004wd-05; Mon, 16 Oct 2023 09:29:53 +0000
Received: by outflank-mailman (input) for mailman id 617378;
 Mon, 16 Oct 2023 09:29:51 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qsJv5-0004wX-AU
 for xen-devel@lists.xenproject.org; Mon, 16 Oct 2023 09:29:51 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qsJv4-0005FX-T6; Mon, 16 Oct 2023 09:29:50 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.240])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qsJv4-0005l8-NQ; Mon, 16 Oct 2023 09:29:50 +0000
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
	bh=gbxmicep5LUaFXJJmQewRhLxLPalA3qNgooiYyR4dzk=; b=LeR1SPbl+0kZLH6JLgey1wZikj
	guEYDInE+wloXrdBwtSgMMh7zg+afawK6o/ADjuPFFt5sJE5UVE6kXtGgFXspJkN9DPwR185hphCV
	ivDzhEzbISmgcm6BYol7GBx60ERAf+zG0CROhiMyO12kCGbezX7ELrlZjqpeE6ZeqmcU=;
Message-ID: <4c2d2125-9e63-4905-a471-eb97594fb2c3@xen.org>
Date: Mon, 16 Oct 2023 10:29:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/arm: vtimer: Don't read/use the secure physical timer
 interrupt for ACPI
Content-Language: en-GB
To: "Driscoll, Dan" <dan.driscoll@siemens.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: "Henry.Wang@arm.com" <Henry.Wang@arm.com>,
 "arvind.raghuraman@siemens.com" <arvind.raghuraman@siemens.com>,
 "michal.orzel@amd.com" <michal.orzel@amd.com>,
 Julien Grall <jgrall@amazon.com>, Stefano Stabellini
 <sstabellini@kernel.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20231005165454.18143-1-julien@xen.org>
 <DM6PR07MB4316E6C8F062F93E800AFD6A9ACDA@DM6PR07MB4316.namprd07.prod.outlook.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <DM6PR07MB4316E6C8F062F93E800AFD6A9ACDA@DM6PR07MB4316.namprd07.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Dan,

On 10/10/2023 18:11, Driscoll, Dan wrote:
> Julien,
> 
> 	Verified this patch works on Graviton 2... so looks good from this perspective.

Thanks for testing. I will commit the patch then to staging so it will 
be included in the next release (4.18.0).

Cheers,

-- 
Julien Grall

