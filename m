Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 68B28517998
	for <lists+xen-devel@lfdr.de>; Tue,  3 May 2022 00:00:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.319082.539160 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nle5A-0000gV-5y; Mon, 02 May 2022 21:59:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 319082.539160; Mon, 02 May 2022 21:59:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nle5A-0000ef-38; Mon, 02 May 2022 21:59:52 +0000
Received: by outflank-mailman (input) for mailman id 319082;
 Mon, 02 May 2022 21:59:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bjNP=VK=gmail.com=robherring2@srs-se1.protection.inumbo.net>)
 id 1nle58-0000eZ-Hk
 for xen-devel@lists.xenproject.org; Mon, 02 May 2022 21:59:50 +0000
Received: from mail-oo1-f43.google.com (mail-oo1-f43.google.com
 [209.85.161.43]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2e67ed13-ca63-11ec-a406-831a346695d4;
 Mon, 02 May 2022 23:59:49 +0200 (CEST)
Received: by mail-oo1-f43.google.com with SMTP id
 y27-20020a4a9c1b000000b0032129651bb0so2812633ooj.2
 for <xen-devel@lists.xenproject.org>; Mon, 02 May 2022 14:59:47 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 s1-20020a4ae541000000b0035eb4e5a6c8sm4329464oot.30.2022.05.02.14.59.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 May 2022 14:59:46 -0700 (PDT)
Received: (nullmailer pid 1863055 invoked by uid 1000);
 Mon, 02 May 2022 21:59:45 -0000
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
X-Inumbo-ID: 2e67ed13-ca63-11ec-a406-831a346695d4
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=OfkNLJQzEZ7e5xPqfxUYJG64Wv+bQWkevq09mi7Lx3c=;
        b=1nvu9oD9eIBdroHecgTEnH39iR4WVlM5SyP7duD1aghiwNg634NAEOXU/5X2ENrlVf
         TNFWAXcCkVGdc+7pb6Pz2uvAlQr3Ei9kwq7kMO2uMhpOW75g6jKWSByV9jFW5P6BCZCA
         qyyXgjwylTCG93/QrCsfhzx+w6QYMGjOYMwSBTQy3ZOS2bYOMrLXfmjPig42w7MdaH0j
         t98xUjmz+5p+0a2GQo/uWmPOzLsbv4hKSRn1c7sY2PHuhnO/36RI0BzWsX1z/ODM7dgr
         +VeqQtjhjKBv17J/3/o7H+cMfVoGY6THBe4KRzIdUFWn80ZYsFJFkVlKX0pv/ZcFtJOC
         kTzA==
X-Gm-Message-State: AOAM531riSKYhyorDYdQg/63GygjbE3Z0PYaS+f+BJIM2ENwDavqPKFg
	XY0H1ve4mMk44kbpP4wvRg==
X-Google-Smtp-Source: ABdhPJx1LDExPGSXpHz8IMEURBsoMHXT9iZfDmEKZxw3kRgHSp4/DSf2T1IKY9UfgGxULbEh9lAUBQ==
X-Received: by 2002:a4a:ac45:0:b0:35e:a8f2:7f55 with SMTP id q5-20020a4aac45000000b0035ea8f27f55mr4805941oon.46.1651528786470;
        Mon, 02 May 2022 14:59:46 -0700 (PDT)
Date: Mon, 2 May 2022 16:59:45 -0500
From: Rob Herring <robh@kernel.org>
To: Oleksandr Tyshchenko <olekstysh@gmail.com>
Cc: xen-devel@lists.xenproject.org, virtualization@lists.linux-foundation.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, Jason Wang <jasowang@redhat.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Julien Grall <julien@xen.org>, Juergen Gross <jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, "Michael S. Tsirkin" <mst@redhat.com>, Christoph Hellwig <hch@infradead.org>
Subject: Re: [PATCH V1 4/6] dt-bindings: Add xen,dev-domid property
 description for xen-grant DMA ops
Message-ID: <YnBUUclJqkvKsV2o@robh.at.kernel.org>
References: <1650646263-22047-1-git-send-email-olekstysh@gmail.com>
 <1650646263-22047-5-git-send-email-olekstysh@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1650646263-22047-5-git-send-email-olekstysh@gmail.com>

On Fri, Apr 22, 2022 at 07:51:01PM +0300, Oleksandr Tyshchenko wrote:
> From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> 
> Introduce Xen specific binding for the virtualized device (e.g. virtio)
> to be used by Xen grant DMA-mapping layer in the subsequent commit.
> 
> This binding indicates that Xen grant mappings scheme needs to be
> enabled for the device which DT node contains that property and specifies
> the ID of Xen domain where the corresponding backend resides. The ID
> (domid) is used as an argument to the grant mapping APIs.
> 
> This is needed for the option to restrict memory access using Xen grant
> mappings to work which primary goal is to enable using virtio devices
> in Xen guests.
> 
> Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> ---
> Changes RFC -> V1:
>    - update commit subject/description and text in description
>    - move to devicetree/bindings/arm/
> ---
>  .../devicetree/bindings/arm/xen,dev-domid.yaml     | 37 ++++++++++++++++++++++
>  1 file changed, 37 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/arm/xen,dev-domid.yaml
> 
> diff --git a/Documentation/devicetree/bindings/arm/xen,dev-domid.yaml b/Documentation/devicetree/bindings/arm/xen,dev-domid.yaml
> new file mode 100644
> index 00000000..ef0f747
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/arm/xen,dev-domid.yaml
> @@ -0,0 +1,37 @@
> +# SPDX-License-Identifier: (GPL-2.0-only or BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/arm/xen,dev-domid.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Xen specific binding for the virtualized device (e.g. virtio)
> +
> +maintainers:
> +  - Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> +
> +select: true

Do we really need to support this property everywhere?

> +
> +description:
> +  This binding indicates that Xen grant mappings scheme needs to be enabled
> +  for that device and specifies the ID of Xen domain where the corresponding
> +  device (backend) resides. This is needed for the option to restrict memory
> +  access using Xen grant mappings to work.
> +
> +properties:
> +  xen,dev-domid:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description:
> +      The domid (domain ID) of the domain where the device (backend) is running.
> +
> +additionalProperties: true
> +
> +examples:
> +  - |
> +    virtio_block@3000 {

virtio@3000

> +            compatible = "virtio,mmio";
> +            reg = <0x3000 0x100>;
> +            interrupts = <41>;
> +
> +            /* The device is located in Xen domain with ID 1 */
> +            xen,dev-domid = <1>;

This fails validation:

Documentation/devicetree/bindings/arm/xen,dev-domid.example.dtb: virtio_block@3000: xen,dev-domid: [[1]] is not of type 'object'
        From schema: /home/rob/proj/git/linux-dt/Documentation/devicetree/bindings/virtio/mmio.yaml

The property has to be added to the virtio/mmio.yaml schema. If it is 
not needed elsewhere, then *just* add the property there.

Rob

