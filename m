Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E86F7460F63
	for <lists+xen-devel@lfdr.de>; Mon, 29 Nov 2021 08:33:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.234304.406651 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mrbAS-0003yT-CW; Mon, 29 Nov 2021 07:33:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 234304.406651; Mon, 29 Nov 2021 07:33:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mrbAS-0003vA-8S; Mon, 29 Nov 2021 07:33:40 +0000
Received: by outflank-mailman (input) for mailman id 234304;
 Mon, 29 Nov 2021 07:33:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=KK+l=QQ=kaod.org=clg@srs-se1.protection.inumbo.net>)
 id 1mrbAR-0003u7-Aw
 for xen-devel@lists.xenproject.org; Mon, 29 Nov 2021 07:33:39 +0000
Received: from 8.mo548.mail-out.ovh.net (8.mo548.mail-out.ovh.net
 [46.105.45.231]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id aa7a3c39-50e6-11ec-976b-d102b41d0961;
 Mon, 29 Nov 2021 08:33:37 +0100 (CET)
Received: from mxplan5.mail.ovh.net (unknown [10.108.20.7])
 by mo548.mail-out.ovh.net (Postfix) with ESMTPS id D10AB2064C;
 Mon, 29 Nov 2021 07:33:34 +0000 (UTC)
Received: from kaod.org (37.59.142.103) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.20; Mon, 29 Nov
 2021 08:33:33 +0100
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
X-Inumbo-ID: aa7a3c39-50e6-11ec-976b-d102b41d0961
Authentication-Results: garm.ovh; auth=pass (GARM-103G0058ffb0110-7673-40ee-a51a-c9a65a45fa89,
                    3279756C2EB34864E332BB908A933B747C53BE44) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <b1a6d267-c7b4-c4b9-ab0e-f5cc32bfe9bf@kaod.org>
Date: Mon, 29 Nov 2021 08:33:33 +0100
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
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20211126223824.382273262@linutronix.de>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.103]
X-ClientProxiedBy: DAG1EX2.mxp5.local (172.16.2.2) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 67cb6c92-6833-4394-901b-34c8b386eb6d
X-Ovh-Tracer-Id: 9389442276353674140
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvuddrheekgdegjecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfhfhfgjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeeigedvffekgeeftedutddttdevudeihfegudffkeeitdekkeetkefhffelveelleenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddtfeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopehlihhnuhigphhptgdquggvvheslhhishhtshdrohiilhgrsghsrdhorhhg

On 11/27/21 02:18, Thomas Gleixner wrote:
> Remove the kobject.h include from msi.h as it's not required and add a
> sysfs.h include to the core code instead.
> 
> Signed-off-by: Thomas Gleixner <tglx@linutronix.de>


This patch breaks compile on powerpc :

   CC      arch/powerpc/kernel/msi.o
In file included from ../arch/powerpc/kernel/msi.c:7:
../include/linux/msi.h:410:65: error: ‘struct cpumask’ declared inside parameter list will not be visible outside of this definition or declaration [-Werror]
   410 | int msi_domain_set_affinity(struct irq_data *data, const struct cpumask *mask,
       |                                                                 ^~~~~~~
cc1: all warnings being treated as errors

Below is fix you can merge in patch 5.

Thanks,

C.

--- a/include/linux/msi.h
+++ b/include/linux/msi.h
@@ -2,6 +2,7 @@
  #ifndef LINUX_MSI_H
  #define LINUX_MSI_H
  
+#include <linux/cpumask.h>
  #include <linux/list.h>
  #include <asm/msi.h>

> ---
>   include/linux/msi.h |    1 -
>   kernel/irq/msi.c    |    1 +
>   2 files changed, 1 insertion(+), 1 deletion(-)
> 
> --- a/include/linux/msi.h
> +++ b/include/linux/msi.h
> @@ -2,7 +2,6 @@
>   #ifndef LINUX_MSI_H
>   #define LINUX_MSI_H
>   
> -#include <linux/kobject.h>
>   #include <linux/list.h>
>   #include <asm/msi.h>
>   
> --- a/kernel/irq/msi.c
> +++ b/kernel/irq/msi.c
> @@ -14,6 +14,7 @@
>   #include <linux/irqdomain.h>
>   #include <linux/msi.h>
>   #include <linux/slab.h>
> +#include <linux/sysfs.h>
>   #include <linux/pci.h>
>   
>   #include "internals.h"
> 


