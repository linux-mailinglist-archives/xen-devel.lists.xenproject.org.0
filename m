Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B19B47FC812
	for <lists+xen-devel@lfdr.de>; Tue, 28 Nov 2023 22:36:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.643532.1003820 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r85kX-0007W3-KI; Tue, 28 Nov 2023 21:36:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 643532.1003820; Tue, 28 Nov 2023 21:36:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r85kX-0007T1-HX; Tue, 28 Nov 2023 21:36:09 +0000
Received: by outflank-mailman (input) for mailman id 643532;
 Tue, 28 Nov 2023 21:36:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9Vht=HJ=raptorengineering.com=sanastasio@srs-se1.protection.inumbo.net>)
 id 1r85kW-0007Sv-C1
 for xen-devel@lists.xenproject.org; Tue, 28 Nov 2023 21:36:08 +0000
Received: from raptorengineering.com (mail.raptorengineering.com
 [23.155.224.40]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 23203050-8e36-11ee-98e3-6d05b1d4d9a1;
 Tue, 28 Nov 2023 22:36:07 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id C748582855D2;
 Tue, 28 Nov 2023 15:36:05 -0600 (CST)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id ZwZZ4LGCtZXi; Tue, 28 Nov 2023 15:36:02 -0600 (CST)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id 921AB828562B;
 Tue, 28 Nov 2023 15:36:02 -0600 (CST)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id odo25ct4gI-U; Tue, 28 Nov 2023 15:36:02 -0600 (CST)
Received: from [10.11.0.3] (5.edge.rptsys.com [23.155.224.38])
 by mail.rptsys.com (Postfix) with ESMTPSA id 0D50D82855D2;
 Tue, 28 Nov 2023 15:36:01 -0600 (CST)
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
X-Inumbo-ID: 23203050-8e36-11ee-98e3-6d05b1d4d9a1
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.rptsys.com 921AB828562B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=raptorengineering.com; s=B8E824E6-0BE2-11E6-931D-288C65937AAD;
	t=1701207362; bh=viGxz3mpji1XOsZqZoN1cc9i4RT2optDTGFw9EARNrc=;
	h=Message-ID:Date:MIME-Version:To:From;
	b=Xvy0podiHRLYnGABIvKoBfVn16hqjSVZzr36cRxT8GEKh4N3P35a4zXIwuuvOkvxR
	 8krmzA+7rK2ycoDENgi2WItJdVXryMiskfNrflSlgzU8s2baCumoLEUVLtAjBrX4Wq
	 vQyyxu919UMpIoXsFEYLftWKN/szsEzycTfYxBbI=
X-Virus-Scanned: amavisd-new at rptsys.com
Message-ID: <68213190-4d6f-4d5a-9807-7e2cabb80ed5@raptorengineering.com>
Date: Tue, 28 Nov 2023 15:36:01 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 02/14] xen/asm-generic: introduce generic device.h
Content-Language: en-US
To: Oleksii <oleksii.kurochko@gmail.com>, Jan Beulich <jbeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <cover.1701093907.git.oleksii.kurochko@gmail.com>
 <67172a4fbf88833480203fcb1e2c640b6d39a556.1701093907.git.oleksii.kurochko@gmail.com>
 <6aa8c7e5-c13e-43e0-bec4-74827407c985@suse.com>
 <0e948dcb22fe553053431083f19f058245016e41.camel@gmail.com>
From: Shawn Anastasio <sanastasio@raptorengineering.com>
In-Reply-To: <0e948dcb22fe553053431083f19f058245016e41.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi Oleksii,

On 11/27/23 1:46 PM, Oleksii wrote:
> On Mon, 2023-11-27 at 15:31 +0100, Jan Beulich wrote:
>> On 27.11.2023 15:13, Oleksii Kurochko wrote:
>>> --- a/xen/arch/ppc/include/asm/irq.h
>>> +++ b/xen/arch/ppc/include/asm/irq.h
>>> @@ -3,7 +3,9 @@
>>>  #define __ASM_PPC_IRQ_H__
>>> =20
>>>  #include <xen/lib.h>
>>> +#ifdef CONFIG_HAS_DEVICE_TREE
>>>  #include <xen/device_tree.h>
>>> +#endif
>>>  #include <public/device_tree_defs.h>
>>
>> Why would this #ifdef not cover the public header as well? (Otherwise
>> I'd
>> be inclined to ask that the conditional be moved inside that header.)
> In that header is defined only consts without additional header
> inclusion. At that moment it looked to me pretty save to ifdef only
> xen/device_tree.h but you are right we can move incluion of the public
> header inside #ifdef OR just remove as xen/device_tree.h already
> includes it.
>

Removing the include of <xen/device_tree.h> from ppc's asm/irq.h breaks
the build, because of platform_get_irq's usage of the `struct
dt_device_node` type:

  CC      common/cpu.o
In file included from ./include/xen/irq.h:80,
                 from ./include/xen/pci.h:13,
                 from ./include/xen/iommu.h:25,
                 from ./include/xen/sched.h:12,
                 from ./include/xen/event.h:12,
                 from common/cpu.c:3:
./arch/ppc/include/asm/irq.h:28:49: error: =E2=80=98struct dt_device_node=
=E2=80=99
declared inside parameter list will not be visible outside of this
definition or declaration [-Werror]
   28 | static inline int platform_get_irq(const struct dt_device_node
*device, int index)

I wouldn't be opposed to a forward declaration of that type, but as I
indicated in my other reply to this patch, I'd like to avoid the
addition of these essentially always-dead CONFIG_HAS_DEVICE_TREE checks
to PPC code anyways, so dropping this hunk entirely from the patch might
be the way forward.

> ~ Oleksii

Thanks,
Shawn

