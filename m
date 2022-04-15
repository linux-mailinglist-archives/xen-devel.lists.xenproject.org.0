Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 26B0A50303C
	for <lists+xen-devel@lfdr.de>; Sat, 16 Apr 2022 00:02:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.305904.521017 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nfU0P-0000da-6P; Fri, 15 Apr 2022 22:01:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 305904.521017; Fri, 15 Apr 2022 22:01:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nfU0P-0000bK-23; Fri, 15 Apr 2022 22:01:29 +0000
Received: by outflank-mailman (input) for mailman id 305904;
 Fri, 15 Apr 2022 22:01:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JP5O=UZ=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1nfU0O-0000HG-51
 for xen-devel@lists.xenproject.org; Fri, 15 Apr 2022 22:01:28 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 990a68e0-bd07-11ec-8fbe-03012f2f19d4;
 Sat, 16 Apr 2022 00:01:27 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 95673B83120;
 Fri, 15 Apr 2022 22:01:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A0D90C385A4;
 Fri, 15 Apr 2022 22:01:24 +0000 (UTC)
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
X-Inumbo-ID: 990a68e0-bd07-11ec-8fbe-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1650060085;
	bh=3nAlILfONam3A1vF12+Z//hbMZsSoLMl3r4snyjFDkg=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=R5ACtTmRa1lWffZNP40CcYwujsVyYLvLu7t4cuSkHx/zaTDgutlQ4iwTl0T+OF46E
	 KTk2+o63Z5vwr6TH66atXLG4sAjRb/3Fu3/lo+Yd3s4T2y408M4g5eshPM00FXsruY
	 gnQywd9MCBBru4u0+hmOTmRr5Sf6fOH6A8aUY3iN3hikuJ5hZX6mYNnkvR8sfqbHJZ
	 6cwdJQMOfy9nf5UrBix4ZArxlSXSr5cEKNoGxqL5AE9/8QMWl5q0TSv2lORkNvm+eu
	 0mpduXkufAAx6byB3UeBLcqIFKHPEHxW+sH7kFA7AyIzaxOVMzTIUGBGsnuhnJ9rtg
	 ul349pv5wZ/2g==
Date: Fri, 15 Apr 2022 15:01:24 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Oleksandr Tyshchenko <olekstysh@gmail.com>
cc: xen-devel@lists.xenproject.org, virtualization@lists.linux-foundation.org, 
    devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
    Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, 
    "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>, 
    Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
    Julien Grall <julien@xen.org>, Juergen Gross <jgross@suse.com>, 
    Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [RFC PATCH 3/6] dt-bindings: xen: Add xen,dev-domid property
 description for xen-virtio layer
In-Reply-To: <1649963973-22879-4-git-send-email-olekstysh@gmail.com>
Message-ID: <alpine.DEB.2.22.394.2204151300130.915916@ubuntu-linux-20-04-desktop>
References: <1649963973-22879-1-git-send-email-olekstysh@gmail.com> <1649963973-22879-4-git-send-email-olekstysh@gmail.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 14 Apr 2022, Oleksandr Tyshchenko wrote:
> From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> 
> Introduce Xen specific binding for the virtio-mmio device to be used
> by Xen virtio support driver in a subsequent commit.
> 
> This binding specifies the ID of Xen domain where the corresponding
> device (backend) resides. This is needed for the option to restrict
> memory access using Xen grant mappings to work.
> 
> Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> ---
>  .../devicetree/bindings/virtio/xen,dev-domid.yaml  | 39 ++++++++++++++++++++++
>  1 file changed, 39 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/virtio/xen,dev-domid.yaml
> 
> diff --git a/Documentation/devicetree/bindings/virtio/xen,dev-domid.yaml b/Documentation/devicetree/bindings/virtio/xen,dev-domid.yaml
> new file mode 100644
> index 00000000..78be993
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/virtio/xen,dev-domid.yaml
> @@ -0,0 +1,39 @@
> +# SPDX-License-Identifier: (GPL-2.0-only or BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/virtio/xen,dev-domid.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Xen specific binding for the virtio device
> +
> +maintainers:
> +  - Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> +
> +select: true
> +
> +description:
> +  This binding specifies the ID of Xen domain where the corresponding device
> +  (backend) resides. This is needed for the option to restrict memory access
> +  using Xen grant mappings to work.
> +
> +  Note that current and generic "iommus" bindings are mutually exclusive, since
> +  the restricted memory access model on Xen behaves as a kind of software IOMMU.

I don't think that this last statement is necessary or fully accurate, so
I would remove it. Other than that, this looks good to me.


> +properties:
> +  xen,dev-domid:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description:
> +      Should contain the ID of device's domain.

Maybe better as:
"The domid (domain ID) of the domain where the device (backend) is running"



> +additionalProperties: true
> +
> +examples:
> +  - |
> +    virtio_block@3000 {
> +            compatible = "virtio,mmio";
> +            reg = <0x3000 0x100>;
> +            interrupts = <41>;
> +
> +            /* The device is located in Xen domain with ID 1 */
> +            xen,dev-domid = <1>;
> +    };
> -- 
> 2.7.4
> 

