Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BC8FB81A710
	for <lists+xen-devel@lfdr.de>; Wed, 20 Dec 2023 19:52:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.658238.1027341 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rG1fm-0001Sk-Gj; Wed, 20 Dec 2023 18:52:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 658238.1027341; Wed, 20 Dec 2023 18:52:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rG1fm-0001Ph-D9; Wed, 20 Dec 2023 18:52:02 +0000
Received: by outflank-mailman (input) for mailman id 658238;
 Wed, 20 Dec 2023 18:52:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3yS4=H7=raptorengineering.com=sanastasio@srs-se1.protection.inumbo.net>)
 id 1rG1fl-0001OL-0J
 for xen-devel@lists.xenproject.org; Wed, 20 Dec 2023 18:52:01 +0000
Received: from raptorengineering.com (mail.raptorengineering.com
 [23.155.224.40]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d9c2e4f5-9f68-11ee-98eb-6d05b1d4d9a1;
 Wed, 20 Dec 2023 19:51:58 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id C89C98285494;
 Wed, 20 Dec 2023 12:51:56 -0600 (CST)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id IB9780hY6YJZ; Wed, 20 Dec 2023 12:51:55 -0600 (CST)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id 845518285497;
 Wed, 20 Dec 2023 12:51:55 -0600 (CST)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id 5Xp9wo1RUKmM; Wed, 20 Dec 2023 12:51:55 -0600 (CST)
Received: from [10.11.0.2] (5.edge.rptsys.com [23.155.224.38])
 by mail.rptsys.com (Postfix) with ESMTPSA id 0CDD78285494;
 Wed, 20 Dec 2023 12:51:54 -0600 (CST)
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
X-Inumbo-ID: d9c2e4f5-9f68-11ee-98eb-6d05b1d4d9a1
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.rptsys.com 845518285497
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=raptorengineering.com; s=B8E824E6-0BE2-11E6-931D-288C65937AAD;
	t=1703098315; bh=BMjoy4Lky1cmwjulfFfiJnZ7v8JkFHePEIusjRlZc7A=;
	h=Message-ID:Date:MIME-Version:To:From;
	b=cfemmQSvl6t0PPqIFfvj5xzAuBsjEDzPkB6dczg75BLF/8awAsGHNBgXV97nMnNFc
	 qgvIkUnhAiNkEMBSt1aMMojXm+6s6KQ7Ab2WlvjypFHK7ZCWmx7eadmxUo2MGvCPyG
	 u/czFi5erN3ABL97TxbOB2iKfQLMOhGoHNZoTdU8=
X-Virus-Scanned: amavisd-new at rptsys.com
Message-ID: <6aa5f0bd-10b4-4976-9ef2-7e01a2c01615@raptorengineering.com>
Date: Wed, 20 Dec 2023 12:51:54 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/7] xen/asm-generic: Introduce generic setup.h
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>
Cc: Timothy Pearson <tpearson@raptorengineering.com>,
 xen-devel@lists.xenproject.org
References: <cover.1702607884.git.sanastasio@raptorengineering.com>
 <1e4f48d753871bf61de3af97a3009e069d25d01e.1702607884.git.sanastasio@raptorengineering.com>
 <3fa1db69-adcc-4d1f-9e8a-e2300393210b@suse.com>
From: Shawn Anastasio <sanastasio@raptorengineering.com>
In-Reply-To: <3fa1db69-adcc-4d1f-9e8a-e2300393210b@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Jan,

On 12/20/23 5:09 AM, Jan Beulich wrote:
> On 15.12.2023 03:43, Shawn Anastasio wrote:
>> Introduce setup.h to asm-generic based off of ARM's to define all
>> stubs necessary to compile bootfdt.c
>>
>> Signed-off-by: Shawn Anastasio <sanastasio@raptorengineering.com>
>> ---
>>  xen/arch/ppc/include/asm/Makefile |   1 +
>>  xen/arch/ppc/include/asm/setup.h  |   6 --
>>  xen/include/asm-generic/setup.h   | 148 ++++++++++++++++++++++++++++++
>>  3 files changed, 149 insertions(+), 6 deletions(-)
>>  delete mode 100644 xen/arch/ppc/include/asm/setup.h
>>  create mode 100644 xen/include/asm-generic/setup.h
>>
>> diff --git a/xen/arch/ppc/include/asm/Makefile b/xen/arch/ppc/include/asm/Makefile
>> index a711cfa856..7167661f86 100644
>> --- a/xen/arch/ppc/include/asm/Makefile
>> +++ b/xen/arch/ppc/include/asm/Makefile
>> @@ -6,5 +6,6 @@ generic-y += iocap.h
>>  generic-y += paging.h
>>  generic-y += percpu.h
>>  generic-y += random.h
>> +generic-y += setup.h
>>  generic-y += static-shmem.h
>>  generic-y += vm_event.h
> 
> Looking at patch 5, you undo this there. Why introduce it in the first place
> then? And why leave a stale (unused) file around there?
>

The intent was to leave the file around for RISC-V, since now xen/common
won't build when CONFIG_HAS_DEVICE tree is set unless these headers are
available with sufficient definitions.

Given your earlier comment about these not being exactly generic (which
I agree with, they are closer to stubs if anything), I suppose I'll just
drop both of these headers going forward and let RISC-V handle the new
changes required to get common/ building.

> Jan

Thanks,
Shawn

