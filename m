Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4949D4647B9
	for <lists+xen-devel@lfdr.de>; Wed,  1 Dec 2021 08:15:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.235593.408681 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1msJok-0007j9-C7; Wed, 01 Dec 2021 07:14:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 235593.408681; Wed, 01 Dec 2021 07:14:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1msJok-0007hI-7U; Wed, 01 Dec 2021 07:14:14 +0000
Received: by outflank-mailman (input) for mailman id 235593;
 Wed, 01 Dec 2021 07:14:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=P4my=QS=kaod.org=clg@srs-se1.protection.inumbo.net>)
 id 1msJoi-0007hC-5a
 for xen-devel@lists.xenproject.org; Wed, 01 Dec 2021 07:14:12 +0000
Received: from 5.mo552.mail-out.ovh.net (5.mo552.mail-out.ovh.net
 [188.165.45.220]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 473f19d5-5276-11ec-b941-1df2895da90e;
 Wed, 01 Dec 2021 08:14:10 +0100 (CET)
Received: from mxplan5.mail.ovh.net (unknown [10.108.1.125])
 by mo552.mail-out.ovh.net (Postfix) with ESMTPS id B6B2D217F7;
 Wed,  1 Dec 2021 07:14:07 +0000 (UTC)
Received: from kaod.org (37.59.142.105) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.20; Wed, 1 Dec
 2021 08:14:05 +0100
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
X-Inumbo-ID: 473f19d5-5276-11ec-b941-1df2895da90e
Authentication-Results: garm.ovh; auth=pass (GARM-105G00686e3cafe-0521-4f42-aedc-fcaeb2775d24,
                    A214034E9EDAB49BEA2160BF49F8C38F118F2259) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 90.11.56.15
Message-ID: <39556bdc-f48c-68b2-6bec-5975b92e02e2@kaod.org>
Date: Wed, 1 Dec 2021 08:14:05 +0100
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
 <524d9b84-caa8-dd6f-bb5e-9fc906d279c0@kaod.org> <87czmhb8gq.ffs@tglx>
 <875ys9b71j.ffs@tglx>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <875ys9b71j.ffs@tglx>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.105]
X-ClientProxiedBy: DAG1EX2.mxp5.local (172.16.2.2) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: e52f034b-6a74-4e80-b1cd-9a54c9a992a9
X-Ovh-Tracer-Id: 2359604732828158876
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvuddriedvgddutdeiucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvfhfhjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepjeekvdfgudevkeefkeeltdejteekvdegffegudetgeettdffjeefheekfeelffdtnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddtheenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopehlihhnuhigphhptgdquggvvheslhhishhtshdrohiilhgrsghsrdhorhhg

On 11/30/21 23:41, Thomas Gleixner wrote:
> On Tue, Nov 30 2021 at 23:10, Thomas Gleixner wrote:
> 
>> On Tue, Nov 30 2021 at 22:48, Cédric Le Goater wrote:
>>> On 11/29/21 22:38, Thomas Gleixner wrote:
>>>> On Mon, Nov 29 2021 at 08:33, Cédric Le Goater wrote:
>>>> thanks for having a look. I fixed up this and other fallout and pushed out an
>>>> updated series (all 4 parts) to:
>>>>
>>>>           git://git.kernel.org/pub/scm/linux/kernel/git/tglx/devel msi
>>>
>>> pSeries fails to allocate MSIs starting with this patch :
>>>
>>>    [PATCH 049/101] powerpc/pseries/msi: Let core code check for contiguous ...
>>>
>>> I will dig in later on.
>>
>> Let me stare at the core function..
> 
> It's not the core function. It's the patch above and I'm a moron.

All good now. Ship it !

Thanks,

C.





