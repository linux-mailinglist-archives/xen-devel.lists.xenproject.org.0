Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DF9BF79D88D
	for <lists+xen-devel@lfdr.de>; Tue, 12 Sep 2023 20:21:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.600728.936487 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qg7zw-0002DT-AH; Tue, 12 Sep 2023 18:20:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 600728.936487; Tue, 12 Sep 2023 18:20:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qg7zw-0002B3-7d; Tue, 12 Sep 2023 18:20:28 +0000
Received: by outflank-mailman (input) for mailman id 600728;
 Tue, 12 Sep 2023 18:20:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YY/q=E4=raptorengineering.com=sanastasio@srs-se1.protection.inumbo.net>)
 id 1qg7zv-0002Ax-7f
 for xen-devel@lists.xenproject.org; Tue, 12 Sep 2023 18:20:27 +0000
Received: from raptorengineering.com (mail.raptorengineering.com
 [23.155.224.40]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0a7b7bf2-5199-11ee-9b0d-b553b5be7939;
 Tue, 12 Sep 2023 20:20:24 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id C886C82856CC;
 Tue, 12 Sep 2023 13:20:23 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id Dp82U-wf0SvM; Tue, 12 Sep 2023 13:20:22 -0500 (CDT)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id A035E8285713;
 Tue, 12 Sep 2023 13:20:22 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id 4Lm59cH7zDgk; Tue, 12 Sep 2023 13:20:22 -0500 (CDT)
Received: from [10.11.0.3] (5.edge.rptsys.com [23.155.224.38])
 by mail.rptsys.com (Postfix) with ESMTPSA id E0FF282856CC;
 Tue, 12 Sep 2023 13:20:21 -0500 (CDT)
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
X-Inumbo-ID: 0a7b7bf2-5199-11ee-9b0d-b553b5be7939
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.rptsys.com A035E8285713
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=raptorengineering.com; s=B8E824E6-0BE2-11E6-931D-288C65937AAD;
	t=1694542822; bh=1eb6yy1hZOI9yF5r5wsKynxD4GExCLXigy00kGmpq7Y=;
	h=Message-ID:Date:MIME-Version:To:From;
	b=MefAfXsSlt/aCLHXQNECnSDlPLZ1Ndw65ri4Y/5tLX1MfCRcJNzUutwig5VVTnCSt
	 Rpch8A31XG1vZ4DwNbzSMlVLiOEyce3nkVeDtY/rH7517ITFew8coNc+fIvwGmJOL+
	 r7X5juNF/HonqYcupvx7DtdL3zG00u6eHcRkcJTY=
X-Virus-Scanned: amavisd-new at rptsys.com
Message-ID: <0b6ea450-e60b-de6b-6bd8-e78fd2f2b2db@raptorengineering.com>
Date: Tue, 12 Sep 2023 13:20:21 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux ppc64le; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH v4 3/5] xen/ppc: Define minimal stub headers required for
 full build
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>
Cc: Timothy Pearson <tpearson@raptorengineering.com>,
 Tamas K Lengyel <tamas@tklengyel.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <cover.1694211900.git.sanastasio@raptorengineering.com>
 <ec21e13fd3de4142d305924a6f5d55ad15745731.1694211900.git.sanastasio@raptorengineering.com>
 <1868edde-1b7e-84c6-6881-ac3b98934932@suse.com>
From: Shawn Anastasio <sanastasio@raptorengineering.com>
In-Reply-To: <1868edde-1b7e-84c6-6881-ac3b98934932@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 9/11/23 9:45 AM, Jan Beulich wrote:
> On 09.09.2023 00:50, Shawn Anastasio wrote:
>> Additionally, change inclusion of asm/ headers to corresponding xen/ ones
>> throughout arch/ppc now that they work.
>>
>> Signed-off-by: Shawn Anastasio <sanastasio@raptorengineering.com>
> 
> Acked-by: Jan Beulich <jbeulich@suse.com>
> albeit ...
> 
>>
>>  xen/arch/ppc/Kconfig                     |   1 +
>>  xen/arch/ppc/include/asm/altp2m.h        |  25 +++
>>  xen/arch/ppc/include/asm/bug.h           |   9 +
>>  xen/arch/ppc/include/asm/cache.h         |   2 +
>>  xen/arch/ppc/include/asm/config.h        |  10 +
>>  xen/arch/ppc/include/asm/cpufeature.h    |  10 +
>>  xen/arch/ppc/include/asm/current.h       |  43 ++++
>>  xen/arch/ppc/include/asm/delay.h         |  12 ++
>>  xen/arch/ppc/include/asm/device.h        |  53 +++++
>>  xen/arch/ppc/include/asm/div64.h         |  14 ++
>>  xen/arch/ppc/include/asm/domain.h        |  47 +++++
>>  xen/arch/ppc/include/asm/event.h         |  36 ++++
>>  xen/arch/ppc/include/asm/flushtlb.h      |  24 +++
>>  xen/arch/ppc/include/asm/grant_table.h   |   5 +
>>  xen/arch/ppc/include/asm/guest_access.h  |  68 +++++++
>>  xen/arch/ppc/include/asm/guest_atomics.h |  23 +++
>>  xen/arch/ppc/include/asm/hardirq.h       |  19 ++
>>  xen/arch/ppc/include/asm/hypercall.h     |   5 +
>>  xen/arch/ppc/include/asm/io.h            |  16 ++
>>  xen/arch/ppc/include/asm/iocap.h         |   8 +
>>  xen/arch/ppc/include/asm/iommu.h         |   8 +
>>  xen/arch/ppc/include/asm/irq.h           |  33 +++
>>  xen/arch/ppc/include/asm/mem_access.h    |   5 +
>>  xen/arch/ppc/include/asm/mm.h            | 243 ++++++++++++++++++++++-
>>  xen/arch/ppc/include/asm/monitor.h       |  43 ++++
>>  xen/arch/ppc/include/asm/nospec.h        |  15 ++
>>  xen/arch/ppc/include/asm/numa.h          |  26 +++
>>  xen/arch/ppc/include/asm/p2m.h           |  95 +++++++++
>>  xen/arch/ppc/include/asm/page.h          |  18 ++
>>  xen/arch/ppc/include/asm/paging.h        |   7 +
>>  xen/arch/ppc/include/asm/pci.h           |   7 +
>>  xen/arch/ppc/include/asm/percpu.h        |  24 +++
>>  xen/arch/ppc/include/asm/processor.h     |  10 +
>>  xen/arch/ppc/include/asm/random.h        |   9 +
>>  xen/arch/ppc/include/asm/setup.h         |   6 +
>>  xen/arch/ppc/include/asm/smp.h           |  18 ++
>>  xen/arch/ppc/include/asm/softirq.h       |   8 +
>>  xen/arch/ppc/include/asm/spinlock.h      |  15 ++
>>  xen/arch/ppc/include/asm/system.h        | 219 +++++++++++++++++++-
>>  xen/arch/ppc/include/asm/time.h          |  23 +++
>>  xen/arch/ppc/include/asm/vm_event.h      |  49 +++++
> 
> ... this file now wants dropping, and xen/arch/ppc/include/asm/Makefile
> instead indicating to use the asm-generic variant.
>

Got it -- I'll drop it and use asm-generic.

> Note further that xen/arch/ppc/include/asm/numa.h has a leftover Arm
> reference that likely wasn't meant to be there.
>

Good catch, will fix.

> Jan

Thanks,
Shawn

