Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D82552C2CF
	for <lists+xen-devel@lfdr.de>; Wed, 18 May 2022 21:00:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.332455.556151 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nrOt4-0007D0-JT; Wed, 18 May 2022 18:59:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 332455.556151; Wed, 18 May 2022 18:59:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nrOt4-0007AG-FK; Wed, 18 May 2022 18:59:10 +0000
Received: by outflank-mailman (input) for mailman id 332455;
 Wed, 18 May 2022 18:59:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=76Op=V2=gmail.com=robherring2@srs-se1.protection.inumbo.net>)
 id 1nrOt2-0007AA-R3
 for xen-devel@lists.xenproject.org; Wed, 18 May 2022 18:59:08 +0000
Received: from mail-oi1-f173.google.com (mail-oi1-f173.google.com
 [209.85.167.173]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9777b426-d6dc-11ec-bd2c-47488cf2e6aa;
 Wed, 18 May 2022 20:59:07 +0200 (CEST)
Received: by mail-oi1-f173.google.com with SMTP id l16so3799067oil.6
 for <xen-devel@lists.xenproject.org>; Wed, 18 May 2022 11:59:07 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 bd15-20020a056870d78f00b000e686d1389esm1202223oab.56.2022.05.18.11.59.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 May 2022 11:59:05 -0700 (PDT)
Received: (nullmailer pid 3695375 invoked by uid 1000);
 Wed, 18 May 2022 18:59:04 -0000
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
X-Inumbo-ID: 9777b426-d6dc-11ec-bd2c-47488cf2e6aa
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=hl6vHR8m/JLovYO2gNE3ChbiYGqpt17k+OnwcqxZkjo=;
        b=plLHEWQBviL1JKX1XEORj8Gy4wxV9WNSHLb+VbfZ+lXq5Cr1KSdCLqvThrnGlVgUGF
         eHDeAG2Um1a7lwOiYjQB9HV8fGn3NVtU11T+HmCSVFmPI7utjJkNjaCeG316/CIp8qyq
         Rl/BKZQomqF7CQeObda2VLuRYDsx1A9qAdi5jQYvy7j3SE6mjkXo4k9ClM4LO2UzkXk5
         OAB2AG+6PMlVq0GpU0NfE/H3ygGK1Bkde7zPeMqO4N9pJIy7592g1geHqvmOLYVqkRqQ
         pU+l8kW/bPDf4sAbEwdg2v6+folqR47RlzQM/UNOTjxc8nHD9TA4kStEqrxC1pHHChwi
         WJqA==
X-Gm-Message-State: AOAM532ym+iRu62ep70ObL2HEXXSmrTZlmcS0Is/a+GS10ZGGzk2GjtV
	8+yTKuoewVnBuJwtoYzU/w==
X-Google-Smtp-Source: ABdhPJyZK52/lZYsS9R3kKj1OyynJ0P1NooNpNVdFnOOXczUhwNDyIXF2qHiL1sltyV70oHQTWK1Fg==
X-Received: by 2002:a05:6808:aa4:b0:325:91ff:43cc with SMTP id r4-20020a0568080aa400b0032591ff43ccmr623013oij.166.1652900345928;
        Wed, 18 May 2022 11:59:05 -0700 (PDT)
Date: Wed, 18 May 2022 13:59:04 -0500
From: Rob Herring <robh@kernel.org>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Oleksandr Tyshchenko <olekstysh@gmail.com>, xen-devel <xen-devel@lists.xenproject.org>, "open list:DRM DRIVER FOR QEMU'S CIRRUS DEVICE" <virtualization@lists.linux-foundation.org>, DTML <devicetree@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, Jason Wang <jasowang@redhat.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Julien Grall <julien@xen.org>, Juergen Gross <jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, "Michael S. Tsirkin" <mst@redhat.com>, Christoph Hellwig <hch@infradead.org>, Jean-Philippe Brucker <jean-philippe@linaro.org>
Subject: Re: [PATCH V2 5/7] dt-bindings: Add xen,dev-domid property
 description for xen-grant DMA ops
Message-ID: <20220518185904.GA3685644-robh@kernel.org>
References: <1651947548-4055-1-git-send-email-olekstysh@gmail.com>
 <1651947548-4055-6-git-send-email-olekstysh@gmail.com>
 <CAK8P3a2cAnXr8TDDYTiFxTWzQxa67sGnYDQRRD+=Q8_cSb1mEw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAK8P3a2cAnXr8TDDYTiFxTWzQxa67sGnYDQRRD+=Q8_cSb1mEw@mail.gmail.com>

On Wed, May 18, 2022 at 03:32:27PM +0100, Arnd Bergmann wrote:
> On Sat, May 7, 2022 at 7:19 PM Oleksandr Tyshchenko <olekstysh@gmail.com> wrote:
> >
> > diff --git a/Documentation/devicetree/bindings/virtio/mmio.yaml b/Documentation/devicetree/bindings/virtio/mmio.yaml
> > index 10c22b5..29a0932 100644
> > --- a/Documentation/devicetree/bindings/virtio/mmio.yaml
> > +++ b/Documentation/devicetree/bindings/virtio/mmio.yaml
> > @@ -13,6 +13,9 @@ description:
> >    See https://www.oasis-open.org/committees/tc_home.php?wg_abbrev=virtio for
> >    more details.
> >
> > +allOf:
> > +  - $ref: /schemas/arm/xen,dev-domid.yaml#
> > +
> >  properties:
> >    compatible:
> >      const: virtio,mmio
> > @@ -33,6 +36,10 @@ properties:
> >      description: Required for devices making accesses thru an IOMMU.
> >      maxItems: 1
> >
> > +  xen,dev-domid:
> > +    description: Required when Xen grant mappings need to be enabled for device.
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +
> >  required:
> >    - compatible
> >    - reg
> 
> Sorry for joining the discussion late. Have you considered using the
> generic iommu
> binding here instead of a custom property? This would mean having a device
> node for the grant-table mechanism that can be referred to using the 'iommus'
> phandle property, with the domid as an additional argument.
> 
> It does not quite fit the model that Linux currently uses for iommus,
> as that has an allocator for dma_addr_t space, but it would think it's
> conceptually close enough that it makes sense for the binding.

Something common is almost always better.

That may also have the issue that fw_devlink will make the 'iommu' 
driver a dependency to probe.

Rob

