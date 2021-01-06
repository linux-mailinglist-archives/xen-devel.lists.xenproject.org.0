Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C8D362EC393
	for <lists+xen-devel@lfdr.de>; Wed,  6 Jan 2021 19:58:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.62656.111066 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kxE0x-0001CG-Gd; Wed, 06 Jan 2021 18:58:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 62656.111066; Wed, 06 Jan 2021 18:58:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kxE0x-0001Br-DV; Wed, 06 Jan 2021 18:58:35 +0000
Received: by outflank-mailman (input) for mailman id 62656;
 Wed, 06 Jan 2021 18:58:34 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8o9k=GJ=oracle.com=konrad.wilk@srs-us1.protection.inumbo.net>)
 id 1kxE0w-0001Bm-CZ
 for xen-devel@lists.xenproject.org; Wed, 06 Jan 2021 18:58:34 +0000
Received: from aserp2120.oracle.com (unknown [141.146.126.78])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1fe56afc-f0b3-4fc8-b82d-a7872eb36274;
 Wed, 06 Jan 2021 18:58:33 +0000 (UTC)
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
 by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 106It0hC028017;
 Wed, 6 Jan 2021 18:58:07 GMT
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by aserp2120.oracle.com with ESMTP id 35wepm9cyr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 06 Jan 2021 18:58:07 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 106IoQod159497;
 Wed, 6 Jan 2021 18:58:06 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
 by userp3020.oracle.com with ESMTP id 35w3qsd0gy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 06 Jan 2021 18:58:06 +0000
Received: from abhmp0001.oracle.com (abhmp0001.oracle.com [141.146.116.7])
 by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 106Iw1TS006276;
 Wed, 6 Jan 2021 18:58:01 GMT
Received: from localhost.localdomain (/209.6.208.110)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Wed, 06 Jan 2021 10:58:01 -0800
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
X-Inumbo-ID: 1fe56afc-f0b3-4fc8-b82d-a7872eb36274
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2020-01-29;
 bh=qgEi3Qa2hyF376sE4mh5A9+MilrONCFfI4KMkx2vQvA=;
 b=XbcsGl1XP/I/qKOicRYCGWl0CuALE4QAftUapu+rjN2oKyJJpd+mgeDnQE+VIjaegTwc
 pNVgp9Vf/szLcDU/3px/SNSlkRITzlqpN4PEHWvg+8ncgKpYIz2ge7iUcezzo8adAy/F
 XSujrBZctl3KJu+bPMJKe2wqb4lfcl9nb+kJ5pDapf38ZZzP/V5SQScw1EdT8j/INqKG
 EZMqn7KHrhXf7jC+64G57UpWXyce+gDU/LD+A4DWyRIOWyFTqi2POu42+olRuP/J3fRw
 R5UyKH8ecQNJZaBlrfmJp5ZwD86IDgwyhop2LHAMXqeJoeg2qokq0H36JsvvmgDo/4Tz Hg== 
Date: Wed, 6 Jan 2021 13:57:57 -0500
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
Subject: Re: [RFC PATCH v3 5/6] dt-bindings: of: Add restricted DMA pool
Message-ID: <20210106185757.GB109735@localhost.localdomain>
References: <20210106034124.30560-1-tientzu@chromium.org>
 <20210106034124.30560-6-tientzu@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210106034124.30560-6-tientzu@chromium.org>
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9856 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 malwarescore=0 mlxscore=0
 spamscore=0 mlxlogscore=999 phishscore=0 bulkscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2101060106
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9856 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 bulkscore=0 spamscore=0
 impostorscore=0 phishscore=0 lowpriorityscore=0 suspectscore=0
 priorityscore=1501 mlxscore=0 malwarescore=0 clxscore=1015 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2101060106

On Wed, Jan 06, 2021 at 11:41:23AM +0800, Claire Chang wrote:
> Introduce the new compatible string, restricted-dma-pool, for restricted
> DMA. One can specify the address and length of the restricted DMA memory
> region by restricted-dma-pool in the device tree.
> 
> Signed-off-by: Claire Chang <tientzu@chromium.org>
> ---
>  .../reserved-memory/reserved-memory.txt       | 24 +++++++++++++++++++
>  1 file changed, 24 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/reserved-memory/reserved-memory.txt b/Documentation/devicetree/bindings/reserved-memory/reserved-memory.txt
> index e8d3096d922c..44975e2a1fd2 100644
> --- a/Documentation/devicetree/bindings/reserved-memory/reserved-memory.txt
> +++ b/Documentation/devicetree/bindings/reserved-memory/reserved-memory.txt
> @@ -51,6 +51,20 @@ compatible (optional) - standard definition
>            used as a shared pool of DMA buffers for a set of devices. It can
>            be used by an operating system to instantiate the necessary pool
>            management subsystem if necessary.
> +        - restricted-dma-pool: This indicates a region of memory meant to be
> +          used as a pool of restricted DMA buffers for a set of devices. The
> +          memory region would be the only region accessible to those devices.
> +          When using this, the no-map and reusable properties must not be set,
> +          so the operating system can create a virtual mapping that will be used
> +          for synchronization. The main purpose for restricted DMA is to
> +          mitigate the lack of DMA access control on systems without an IOMMU,
> +          which could result in the DMA accessing the system memory at
> +          unexpected times and/or unexpected addresses, possibly leading to data
> +          leakage or corruption. The feature on its own provides a basic level
> +          of protection against the DMA overwriting buffer contents at
> +          unexpected times. However, to protect against general data leakage and
> +          system memory corruption, the system needs to provide way to restrict
> +          the DMA to a predefined memory region.

Heya!

I think I am missing something obvious here so please bear with my
questions:

 - This code adds the means of having the SWIOTLB pool tied to a specific
   memory correct?

 - Nothing stops the physical device from bypassing the SWIOTLB buffer.
   That is if an errant device screwed up the length or DMA address, the
   SWIOTLB would gladly do what the device told it do?

 - This has to be combined with SWIOTLB-force-ish to always use the
   bounce buffer, otherwise you could still do DMA without using
   SWIOTLB (by not hitting the criteria for needing to use SWIOTLB)?

