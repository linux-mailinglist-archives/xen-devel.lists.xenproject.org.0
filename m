Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3126B4640B9
	for <lists+xen-devel@lfdr.de>; Tue, 30 Nov 2021 22:49:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.235530.408570 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1msAzI-0003St-AT; Tue, 30 Nov 2021 21:48:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 235530.408570; Tue, 30 Nov 2021 21:48:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1msAzI-0003Q6-7B; Tue, 30 Nov 2021 21:48:32 +0000
Received: by outflank-mailman (input) for mailman id 235530;
 Tue, 30 Nov 2021 21:48:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ALws=QR=kaod.org=clg@srs-se1.protection.inumbo.net>)
 id 1msAzG-0003Q0-2I
 for xen-devel@lists.xenproject.org; Tue, 30 Nov 2021 21:48:30 +0000
Received: from 6.mo552.mail-out.ovh.net (6.mo552.mail-out.ovh.net
 [188.165.49.222]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3f9965ae-5227-11ec-b941-1df2895da90e;
 Tue, 30 Nov 2021 22:48:26 +0100 (CET)
Received: from mxplan5.mail.ovh.net (unknown [10.109.143.123])
 by mo552.mail-out.ovh.net (Postfix) with ESMTPS id 0AD47216DE;
 Tue, 30 Nov 2021 21:48:24 +0000 (UTC)
Received: from kaod.org (37.59.142.99) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.20; Tue, 30 Nov
 2021 22:48:23 +0100
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
X-Inumbo-ID: 3f9965ae-5227-11ec-b941-1df2895da90e
Authentication-Results: garm.ovh; auth=pass (GARM-99G00338e8fa02-b36d-46a2-a9ce-03d85f7b4222,
                    1FE831E2BDC1BE20692CF32662DF656E64B35270) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 90.11.56.15
Message-ID: <524d9b84-caa8-dd6f-bb5e-9fc906d279c0@kaod.org>
Date: Tue, 30 Nov 2021 22:48:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [patch 05/22] genirq/msi: Fixup includes
Content-Language: en-US
To: Thomas Gleixner <tglx@linutronix.de>, LKML <linux-kernel@vger.kernel.org>
CC: <linux-hyperv@vger.kernel.org>, Paul Mackerras <paulus@samba.org>,
	<sparclinux@vger.kernel.org>, Wei Liu <wei.liu@kernel.org>, Ashok Raj
	<ashok.raj@intel.com>, Marc Zygnier <maz@kernel.org>, <x86@kernel.org>,
	Christian Borntraeger <borntraeger@de.ibm.com>, Bjorn Helgaas
	<helgaas@kernel.org>, Jason Gunthorpe <jgg@nvidia.com>,
	<linux-pci@vger.kernel.org>, <xen-devel@lists.xenproject.org>,
	<ath11k@lists.infradead.org>, Kevin Tian <kevin.tian@intel.com>, Heiko
 Carstens <hca@linux.ibm.com>, Alex Williamson <alex.williamson@redhat.com>,
	Megha Dey <megha.dey@intel.com>, Juergen Gross <jgross@suse.com>, Thomas
 Bogendoerfer <tsbogend@alpha.franken.de>, Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>, <linux-mips@vger.kernel.org>,
	<linuxppc-dev@lists.ozlabs.org>
References: <20211126222700.862407977@linutronix.de>
 <20211126223824.382273262@linutronix.de>
 <b1a6d267-c7b4-c4b9-ab0e-f5cc32bfe9bf@kaod.org> <87tufud4m3.ffs@tglx>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <87tufud4m3.ffs@tglx>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.99]
X-ClientProxiedBy: DAG3EX2.mxp5.local (172.16.2.22) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 16c7449c-9f55-435d-bf3c-7f66bf2ab8fd
X-Ovh-Tracer-Id: 11252243670229552028
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvuddriedugdduheehucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvfhfhjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepjeekvdfgudevkeefkeeltdejteekvdegffegudetgeettdffjeefheekfeelffdtnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddrleelnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtoheplhhinhhugihpphgtqdguvghvsehlihhsthhsrdhoiihlrggsshdrohhrgh

On 11/29/21 22:38, Thomas Gleixner wrote:
> Cedric,
> 
> On Mon, Nov 29 2021 at 08:33, Cédric Le Goater wrote:
>> On 11/27/21 02:18, Thomas Gleixner wrote:
>>> Remove the kobject.h include from msi.h as it's not required and add a
>>> sysfs.h include to the core code instead.
>>>
>>> Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
>>
>>
>> This patch breaks compile on powerpc :
>>
>>     CC      arch/powerpc/kernel/msi.o
>> In file included from ../arch/powerpc/kernel/msi.c:7:
>> ../include/linux/msi.h:410:65: error: ‘struct cpumask’ declared inside parameter list will not be visible outside of this definition or declaration [-Werror]
>>     410 | int msi_domain_set_affinity(struct irq_data *data, const struct cpumask *mask,
>>         |                                                                 ^~~~~~~
>> cc1: all warnings being treated as errors
>>
>> Below is fix you can merge in patch 5.
> 
> thanks for having a look. I fixed up this and other fallout and pushed out an
> updated series (all 4 parts) to:
> 
>          git://git.kernel.org/pub/scm/linux/kernel/git/tglx/devel msi

pSeries fails to allocate MSIs starting with this patch :

  [PATCH 049/101] powerpc/pseries/msi: Let core code check for contiguous ...

I will dig in later on.

C.

