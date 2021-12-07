Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D49A646BFAD
	for <lists+xen-devel@lfdr.de>; Tue,  7 Dec 2021 16:42:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.241269.418170 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mucbT-0006Y5-2D; Tue, 07 Dec 2021 15:42:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 241269.418170; Tue, 07 Dec 2021 15:42:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mucbS-0006Vo-VM; Tue, 07 Dec 2021 15:42:02 +0000
Received: by outflank-mailman (input) for mailman id 241269;
 Tue, 07 Dec 2021 15:41:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SK2l=QY=darkstar.site=sakib@srs-se1.protection.inumbo.net>)
 id 1mucai-0006TE-H2
 for xen-devel@lists.xenproject.org; Tue, 07 Dec 2021 15:41:16 +0000
Received: from pb-smtp21.pobox.com (pb-smtp21.pobox.com [173.228.157.53])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 19bd6cfe-5774-11ec-a831-37629979565c;
 Tue, 07 Dec 2021 16:41:12 +0100 (CET)
Received: from pb-smtp21.pobox.com (unknown [127.0.0.1])
 by pb-smtp21.pobox.com (Postfix) with ESMTP id 7E00315323E;
 Tue,  7 Dec 2021 10:41:09 -0500 (EST)
 (envelope-from sakib@darkstar.site)
Received: from pb-smtp21.sea.icgroup.com (unknown [127.0.0.1])
 by pb-smtp21.pobox.com (Postfix) with ESMTP id 75A7115323D;
 Tue,  7 Dec 2021 10:41:09 -0500 (EST)
 (envelope-from sakib@darkstar.site)
Received: from [192.168.1.116] (unknown [95.67.114.216])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by pb-smtp21.pobox.com (Postfix) with ESMTPSA id 4AD8A15323C;
 Tue,  7 Dec 2021 10:41:04 -0500 (EST)
 (envelope-from sakib@darkstar.site)
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
X-Inumbo-ID: 19bd6cfe-5774-11ec-a831-37629979565c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed; d=pobox.com; h=message-id
	:date:mime-version:subject:to:cc:references:from:in-reply-to
	:content-type:content-transfer-encoding; s=sasl; bh=MxLjfws1ExEH
	78uYyFOY8YaFqMYfqmITg0X8flIRbLg=; b=rJttXkLvMGFHzhQr5zERoBXy8k5Z
	e3lYCRycIcRA+pIIEYZjW+rbko1FnMToQl2gaBS/arwfqo35Ir66VigdSd77w3A4
	DARp9Ri2t/ru+RuAvEhnA2Vf9JW+z7hKjfY5ZmKEFH/kQOfI60229LgEIRkYxCqq
	+wDjNrs3x1bnnIQ=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed; d=darkstar.site;
 h=message-id:date:mime-version:subject:to:cc:references:from:in-reply-to:content-type:content-transfer-encoding; s=2016-12.pbsmtp; bh=3w6QSsy0gHdUt/Pm7k9Truu3K0q6CMLJoQxhfuDDjSs=; b=XbuD/q+S6Lr477eDRIkMXZiBSw3AuIIh/RO197tvrY6sEU9+yN4iMuGInJJ8WW3fn9d5DxD/bllZMC/3k4oLERqJBMIkwaxqz2r7jS9R2dmuT4QvC8iIXKSqhyOHMtD58mI7aQNBwhvQlmZ+yDaME57fdSZ/8KrI/wJN/1RK9zE=
Message-ID: <c789cc71-db2d-0735-f007-e93bd23a81a5@darkstar.site>
Date: Tue, 7 Dec 2021 17:40:59 +0200
MIME-Version: 1.0
Subject: Re: [RFC 1/1] xen/arm: set iommu property for IOMMU-protected devices
Content-Language: en-CA
To: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>
Cc: Roman Skakun <rm.skakun@gmail.com>, xen-devel@lists.xenproject.org,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrii Anisov <andrii_anisov@epam.com>,
 Sergiy Kibrik <sergiy_kibrik@epam.com>
References: <cover.1633106362.git.roman_skakun@epam.com>
 <5b101e4e85668bbb18da83044520b0350344f408.1633106362.git.roman_skakun@epam.com>
 <17547d29-8e15-96f6-2418-5f7ca1c3237d@xen.org>
 <alpine.DEB.2.22.394.2111101306180.440530@ubuntu-linux-20-04-desktop>
From: Sergiy Kibrik <sakib@darkstar.site>
In-Reply-To: <alpine.DEB.2.22.394.2111101306180.440530@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-Pobox-Relay-ID:
 16FBA1BA-5774-11EC-BC76-98D80D944F46-90055647!pb-smtp21.pobox.com
Content-Transfer-Encoding: quoted-printable

hi Stefano, Julien,

On 11/10/21 11:12 =D0=BF=D0=BF, Stefano Stabellini wrote:
> On Mon, 8 Nov 2021, Julien Grall wrote:
[..]
>> A few years ago, I attempted to disable the swiotlb when Xen configure=
d the
>> IOMMU for the device (see [1]). Did you have a chance to go through th=
e
>> thread? In particular, I think Ian Campbell suggestion about creating =
an IOMMU
>> binding is quite interesting.
>>
>> Stefano, what do you think?
>=20
> Yes I think it is a good idea. In fact, thinking more about it, it is
> really the best option. Regardless of the implementation (swiotlb or
> whatever) the device tree description is likely to look similar to the
> description of an IOMMU because it is the common pattern shared by all
> controllers (reset, power, clocks, etc.) so it makes sense to re-use it=
.
>=20
> - there is one controller node (the "IOMMU")
> - there is one property under each device node that is protected,
>    pointing to the controller with a phandle and optional parameters (i=
n
>    the case of IOMMUs it is called "iommus")
>=20

Code in arch_setup_dma_ops() always forces swiotlb for dom0 regardless=20
of any prior IOMMU configuration for the device. So if we are to re-use=20
IOMMU bindings and implement kind of dummy iommu (that merely does=20
direct allocation and mapping) we'll have to check whether device is=20
protected anyway, e.g.:

   diff --git a/arch/arm/xen/enlighten.c b/arch/arm/xen/enlighten.c
   index 49f566ad9acb..6ddef3233095 100644
   --- a/arch/arm/xen/enlighten.c
   +++ b/arch/arm/xen/enlighten.c
   @@ -425,6 +425,10 @@ static int __init xen_pm_init(void)
    }
    late_initcall(xen_pm_init);

   +bool xen_is_device_protected(struct device *dev) {
   +	return dev->dma_ops =3D=3D &dummy_xen_iommu_ops;
   +}

    /* empty stubs */
    void xen_arch_pre_suspend(void) { }


Have I got it right?

  - Sergiy

