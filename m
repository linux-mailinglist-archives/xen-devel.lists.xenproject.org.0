Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 118A72EC38C
	for <lists+xen-devel@lfdr.de>; Wed,  6 Jan 2021 19:54:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.62651.111055 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kxDwo-00011i-V7; Wed, 06 Jan 2021 18:54:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 62651.111055; Wed, 06 Jan 2021 18:54:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kxDwo-00011J-Rk; Wed, 06 Jan 2021 18:54:18 +0000
Received: by outflank-mailman (input) for mailman id 62651;
 Wed, 06 Jan 2021 18:54:18 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8o9k=GJ=oracle.com=konrad.wilk@srs-us1.protection.inumbo.net>)
 id 1kxDwo-00011E-4A
 for xen-devel@lists.xenproject.org; Wed, 06 Jan 2021 18:54:18 +0000
Received: from aserp2120.oracle.com (unknown [141.146.126.78])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 59a7f11a-8967-43c1-b6cb-b2322412bfe4;
 Wed, 06 Jan 2021 18:54:17 +0000 (UTC)
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
 by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 106IjB5u196283;
 Wed, 6 Jan 2021 18:53:13 GMT
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by aserp2120.oracle.com with ESMTP id 35wepm9cch-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 06 Jan 2021 18:53:13 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 106IoRPl159555;
 Wed, 6 Jan 2021 18:53:12 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
 by userp3020.oracle.com with ESMTP id 35w3qscvkn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 06 Jan 2021 18:53:12 +0000
Received: from abhmp0012.oracle.com (abhmp0012.oracle.com [141.146.116.18])
 by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 106Iqnt3017026;
 Wed, 6 Jan 2021 18:52:49 GMT
Received: from localhost.localdomain (/209.6.208.110)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Wed, 06 Jan 2021 18:52:48 +0000
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
X-Inumbo-ID: 59a7f11a-8967-43c1-b6cb-b2322412bfe4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2020-01-29;
 bh=d7r5xtPvBNwX8sHlOpwKQPVqsuAMbzzeGpYOR/NcGwg=;
 b=qM3CUrzJi5NYswEOUCDAiuEVSWKYi8jpu3JX3OC3C4/15aKBCjP1FD8YFoR9E6pSYpbU
 LwmAPA3cpetxqr5FRBf+9CG8U4Jc4Ad5XEN64T0DSeyErZr/rTM2TbQ8zGMhYlF0s+XH
 6f9uwAKaepr8JwGBTk22WTtPDs7d1sbAF8aREN+6sViZGUSyvzdKk4eLM9IiRSb/ndRX
 DUq3qMC4kqUVrZlX6k6+0XlruRA/qp4vcu0G7lFRWl9mQBHVNJz1CnjvFBj7OajSWh2x
 xDo764i0+664jiF5ToeoDoXUO7+zzdXhxuBHS4oeyB4ZlVQHqQZ0SN8xCkdDkdcd1uYy mw== 
Date: Wed, 6 Jan 2021 13:52:41 -0500
From: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
To: Claire Chang <tientzu@chromium.org>
Cc: robh+dt@kernel.org, mpe@ellerman.id.au, benh@kernel.crashing.org,
        paulus@samba.org, joro@8bytes.org, will@kernel.org,
        frowand.list@gmail.com, boris.ostrovsky@oracle.com, jgross@suse.com,
        sstabellini@kernel.org, hch@lst.de, m.szyprowski@samsung.com,
        robin.murphy@arm.com, grant.likely@arm.com, xypron.glpk@gmx.de,
        treding@nvidia.com, mingo@kernel.org, bauerman@linux.ibm.com,
        peterz@infradead.org, gregkh@linuxfoundation.org, saravanak@google.com,
        rafael.j.wysocki@intel.com, heikki.krogerus@linux.intel.com,
        andriy.shevchenko@linux.intel.com, rdunlap@infradead.org,
        dan.j.williams@intel.com, bgolaszewski@baylibre.com,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, iommu@lists.linux-foundation.org,
        xen-devel@lists.xenproject.org, tfiga@chromium.org,
        drinkcat@chromium.org
Subject: Re: [RFC PATCH v3 2/6] swiotlb: Add restricted DMA pool
Message-ID: <20210106185241.GA109735@localhost.localdomain>
References: <20210106034124.30560-1-tientzu@chromium.org>
 <20210106034124.30560-3-tientzu@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210106034124.30560-3-tientzu@chromium.org>
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9856 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 malwarescore=0 mlxscore=0
 spamscore=0 mlxlogscore=999 phishscore=0 bulkscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2101060106
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9856 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 bulkscore=0 spamscore=0
 impostorscore=0 phishscore=0 lowpriorityscore=0 suspectscore=0
 priorityscore=1501 mlxscore=0 malwarescore=0 clxscore=1011 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2101060105

Hello!

In this file:

> diff --git a/kernel/dma/swiotlb.c b/kernel/dma/swiotlb.c
> index e4368159f88a..7fb2ac087d23 100644
> --- a/kernel/dma/swiotlb.c
> +++ b/kernel/dma/swiotlb.c
..

> +static const struct reserved_mem_ops rmem_swiotlb_ops = {
> +	.device_init	= rmem_swiotlb_device_init,
> +	.device_release	= rmem_swiotlb_device_release,
> +};
> +
> +static int __init rmem_swiotlb_setup(struct reserved_mem *rmem)
> +{
> +	unsigned long node = rmem->fdt_node;
> +
> +	if (of_get_flat_dt_prop(node, "reusable", NULL) ||
> +	    of_get_flat_dt_prop(node, "linux,cma-default", NULL) ||
> +	    of_get_flat_dt_prop(node, "linux,dma-default", NULL) ||
> +	    of_get_flat_dt_prop(node, "no-map", NULL))
> +		return -EINVAL;
> +
> +	rmem->ops = &rmem_swiotlb_ops;
> +	pr_info("Reserved memory: created device swiotlb memory pool at %pa, size %ld MiB\n",
> +		&rmem->base, (unsigned long)rmem->size / SZ_1M);
> +	return 0;
> +}
> +
> +RESERVEDMEM_OF_DECLARE(dma, "restricted-dma-pool", rmem_swiotlb_setup);

The code should be as much as possible arch-agnostic. That is why there
are multiple -swiotlb files scattered in arch directories that own the
architecture specific code.

Would it be possible to move the code there and perhaps have a ARM
specific front-end for this DMA restricted pool there? See for example
the xen-swiotlb code.

Cheers!

Konrad

