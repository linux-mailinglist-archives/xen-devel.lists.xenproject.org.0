Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0167489E621
	for <lists+xen-devel@lfdr.de>; Wed, 10 Apr 2024 01:35:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.702882.1098520 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ruKzq-0003KA-AS; Tue, 09 Apr 2024 23:35:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 702882.1098520; Tue, 09 Apr 2024 23:35:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ruKzq-0003HK-7d; Tue, 09 Apr 2024 23:35:22 +0000
Received: by outflank-mailman (input) for mailman id 702882;
 Tue, 09 Apr 2024 23:35:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nipE=LO=raptorengineering.com=sanastasio@srs-se1.protection.inumbo.net>)
 id 1ruKzo-0003HC-UQ
 for xen-devel@lists.xenproject.org; Tue, 09 Apr 2024 23:35:20 +0000
Received: from raptorengineering.com (mail.raptorengineering.com
 [23.155.224.40]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d2f9f535-f6c9-11ee-94a3-07e782e9044d;
 Wed, 10 Apr 2024 01:35:18 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id D7112828554F;
 Tue,  9 Apr 2024 18:35:17 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id ehYQuNLBZTbh; Tue,  9 Apr 2024 18:35:17 -0500 (CDT)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id 060838285626;
 Tue,  9 Apr 2024 18:35:17 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id X1mmGV7dR9tL; Tue,  9 Apr 2024 18:35:16 -0500 (CDT)
Received: from [10.11.0.2] (5.edge.rptsys.com [23.155.224.38])
 by mail.rptsys.com (Postfix) with ESMTPSA id 044BE828554F;
 Tue,  9 Apr 2024 18:35:15 -0500 (CDT)
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
X-Inumbo-ID: d2f9f535-f6c9-11ee-94a3-07e782e9044d
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.rptsys.com 060838285626
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=raptorengineering.com; s=B8E824E6-0BE2-11E6-931D-288C65937AAD;
	t=1712705717; bh=yDV8pOK28ES2sxyCK5YCRfZ0jxyd90RUOTDHu6/7l6k=;
	h=Message-ID:Date:MIME-Version:To:From;
	b=Q/93DC3mDHMQXERt3FWtg/BVxF5oph4E25vvXv3R7kMoU0I/QgMpguSWVofjo3LPU
	 4BZa8ZRiHXcM/VMtZrbrG/3ZIDfno53nIDPNpT3wntShAdmGC2YR6zd/4wdTg5nnOd
	 p+3bgQO7CY2iSNfvUhbobevmhfKGEniepYCntMjI=
X-Virus-Scanned: amavisd-new at rptsys.com
Message-ID: <d9a61ba5-3f75-4d06-a033-0ee0ffc4cd23@raptorengineering.com>
Date: Tue, 9 Apr 2024 18:35:15 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/9] xen/ppc: Introduce stub asm/static-shmem.h
To: Jan Beulich <jbeulich@suse.com>
Cc: tpearson@raptorengineering.com, xen-devel@lists.xenproject.org
References: <cover.1710443965.git.sanastasio@raptorengineering.com>
 <0cf8286269a1c5cdc63e2c19d832a4923cd14f39.1710443965.git.sanastasio@raptorengineering.com>
 <aaaaa735-ce88-42a3-9a2c-22de7f5eeb32@suse.com>
Content-Language: en-US
From: Shawn Anastasio <sanastasio@raptorengineering.com>
In-Reply-To: <aaaaa735-ce88-42a3-9a2c-22de7f5eeb32@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Jan,

On 3/25/24 10:24 AM, Jan Beulich wrote:
> On 14.03.2024 23:15, Shawn Anastasio wrote:
>> Required for bootfdt.c to build.
>>
>> Signed-off-by: Shawn Anastasio <sanastasio@raptorengineering.com>
> 
> As a temporary workaround this may be okay, but was the alternative
> considered to properly provide stubs in a single central place for
> anything !CONFIG_STATIC_SHM?
>

I can't think of an existing place where this would cleanly fit, but if
you have any suggestions I'm open to it.

Otherwise, I think that this solution is acceptable for now.

> Jan

Thanks,
Shawn

