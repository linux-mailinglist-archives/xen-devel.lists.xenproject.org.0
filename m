Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D498519289
	for <lists+xen-devel@lfdr.de>; Wed,  4 May 2022 02:02:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.319984.540474 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nm2T7-0006vO-Rj; Wed, 04 May 2022 00:02:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 319984.540474; Wed, 04 May 2022 00:02:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nm2T7-0006sV-OQ; Wed, 04 May 2022 00:02:13 +0000
Received: by outflank-mailman (input) for mailman id 319984;
 Wed, 04 May 2022 00:02:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Srsx=VM=gmail.com=robherring2@srs-se1.protection.inumbo.net>)
 id 1nm2T6-0006sP-6E
 for xen-devel@lists.xenproject.org; Wed, 04 May 2022 00:02:12 +0000
Received: from mail-oa1-f44.google.com (mail-oa1-f44.google.com
 [209.85.160.44]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7199c68d-cb3d-11ec-a406-831a346695d4;
 Wed, 04 May 2022 02:02:10 +0200 (CEST)
Received: by mail-oa1-f44.google.com with SMTP id
 586e51a60fabf-d6e29fb3d7so18764090fac.7
 for <xen-devel@lists.xenproject.org>; Tue, 03 May 2022 17:02:10 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 b14-20020a056870160e00b000e915a9121csm8077296oae.52.2022.05.03.17.02.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 May 2022 17:02:08 -0700 (PDT)
Received: (nullmailer pid 275646 invoked by uid 1000);
 Wed, 04 May 2022 00:02:08 -0000
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
X-Inumbo-ID: 7199c68d-cb3d-11ec-a406-831a346695d4
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=XPALVs8tri7925YP8yP2QcFpx7h0JSNeGifZWhU99Ro=;
        b=ze6E0pCmSc92htYK4PJhcfgcE2U7KasC9uCnp3u5nluUO9pqIyVaZrBz8AKkHqLkf0
         pLeb7NqXN7moaTqgHU4oioAg9bH5R45A55Va5PSD65d8YlPQhtpW+JReHAikDKensHix
         9FoSMJ5J3HthdGyOJXyq9fIrBZSmXGDGJJ7JQE+jtW5Z1nYfbWA3MAznVXmqpYgTGQiQ
         Z+xTRG9Ox65vGFsXf+2fPgRnuq7xRwAfQVf/IiPWC5jXPNBelKknZAC9S8oVbXDIXPV6
         BFgFH/phz6xQcPf+N5Im6DbIuvgbTbFjxdzZBXWOrJp7uJP9obxyOuLv0lqEQ77uCVET
         H+tg==
X-Gm-Message-State: AOAM531Ieq+PzLNtuBiLgYL+6MElLm4Lve8utS02di+d43bRWR5rLyof
	dPf6z+Y07kAaDfixaf2bhw==
X-Google-Smtp-Source: ABdhPJzDGRHxbFONbrvkkP2SSUKrYke5y7WcShS5ZvQNY7jHJAryoCIKp3IBbg4qJhIn8naxdCDyWw==
X-Received: by 2002:a05:6870:b292:b0:ec:ec79:4842 with SMTP id c18-20020a056870b29200b000ecec794842mr2769207oao.145.1651622529455;
        Tue, 03 May 2022 17:02:09 -0700 (PDT)
Date: Tue, 3 May 2022 19:02:08 -0500
From: Rob Herring <robh@kernel.org>
To: Oleksandr <olekstysh@gmail.com>
Cc: xen-devel@lists.xenproject.org, virtualization@lists.linux-foundation.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, Jason Wang <jasowang@redhat.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Julien Grall <julien@xen.org>, Juergen Gross <jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, "Michael S. Tsirkin" <mst@redhat.com>, Christoph Hellwig <hch@infradead.org>
Subject: Re: [PATCH V1 4/6] dt-bindings: Add xen,dev-domid property
 description for xen-grant DMA ops
Message-ID: <YnHCgBsQ90cJ58+0@robh.at.kernel.org>
References: <1650646263-22047-1-git-send-email-olekstysh@gmail.com>
 <1650646263-22047-5-git-send-email-olekstysh@gmail.com>
 <YnBUUclJqkvKsV2o@robh.at.kernel.org>
 <accbc6be-82c1-dfd2-586f-816141415d7c@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <accbc6be-82c1-dfd2-586f-816141415d7c@gmail.com>

On Tue, May 03, 2022 at 08:09:32PM +0300, Oleksandr wrote:
> 
> On 03.05.22 00:59, Rob Herring wrote:
> 
> Hello Rob
> 
> 
> > On Fri, Apr 22, 2022 at 07:51:01PM +0300, Oleksandr Tyshchenko wrote:
> > > From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> > > 
> > > Introduce Xen specific binding for the virtualized device (e.g. virtio)
> > > to be used by Xen grant DMA-mapping layer in the subsequent commit.
> > > 
> > > This binding indicates that Xen grant mappings scheme needs to be
> > > enabled for the device which DT node contains that property and specifies
> > > the ID of Xen domain where the corresponding backend resides. The ID
> > > (domid) is used as an argument to the grant mapping APIs.
> > > 
> > > This is needed for the option to restrict memory access using Xen grant
> > > mappings to work which primary goal is to enable using virtio devices
> > > in Xen guests.
> > > 
> > > Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> > > ---
> > > Changes RFC -> V1:
> > >     - update commit subject/description and text in description
> > >     - move to devicetree/bindings/arm/
> > > ---
> > >   .../devicetree/bindings/arm/xen,dev-domid.yaml     | 37 ++++++++++++++++++++++
> > >   1 file changed, 37 insertions(+)
> > >   create mode 100644 Documentation/devicetree/bindings/arm/xen,dev-domid.yaml
> > > 
> > > diff --git a/Documentation/devicetree/bindings/arm/xen,dev-domid.yaml b/Documentation/devicetree/bindings/arm/xen,dev-domid.yaml
> > > new file mode 100644
> > > index 00000000..ef0f747
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/arm/xen,dev-domid.yaml
> > > @@ -0,0 +1,37 @@
> > > +# SPDX-License-Identifier: (GPL-2.0-only or BSD-2-Clause)
> > > +%YAML 1.2
> > > +---
> > > +$id: http://devicetree.org/schemas/arm/xen,dev-domid.yaml#
> > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > +
> > > +title: Xen specific binding for the virtualized device (e.g. virtio)
> > > +
> > > +maintainers:
> > > +  - Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> > > +
> > > +select: true
> > Do we really need to support this property everywhere?
> 
> From my understanding - yes.
> 
> As, I think, any device node describing virtulized device in the guest
> device tree can have this property.  Initially (in the RFC series) the
> "solution to restrict memory access using Xen grant mappings" was
> virtio-specific.
> 
> Although the support of virtio is a primary target of this series, we
> decided to generalize this work and expand it to any device [1]. So the Xen
> grant mappings scheme (this property to be used for) can be theoretically
> used for any device emulated by the Xen backend.
> 
> 
> > > +
> > > +description:
> > > +  This binding indicates that Xen grant mappings scheme needs to be enabled
> > > +  for that device and specifies the ID of Xen domain where the corresponding
> > > +  device (backend) resides. This is needed for the option to restrict memory
> > > +  access using Xen grant mappings to work.
> > > +
> > > +properties:
> > > +  xen,dev-domid:
> > > +    $ref: /schemas/types.yaml#/definitions/uint32
> > > +    description:
> > > +      The domid (domain ID) of the domain where the device (backend) is running.
> > > +
> > > +additionalProperties: true
> > > +
> > > +examples:
> > > +  - |
> > > +    virtio_block@3000 {
> > virtio@3000
> 
> ok, will change
> 
> 
> > 
> > > +            compatible = "virtio,mmio";
> > > +            reg = <0x3000 0x100>;
> > > +            interrupts = <41>;
> > > +
> > > +            /* The device is located in Xen domain with ID 1 */
> > > +            xen,dev-domid = <1>;
> > This fails validation:
> > 
> > Documentation/devicetree/bindings/arm/xen,dev-domid.example.dtb: virtio_block@3000: xen,dev-domid: [[1]] is not of type 'object'
> >          From schema: /home/rob/proj/git/linux-dt/Documentation/devicetree/bindings/virtio/mmio.yaml
> 
> Thank you for pointing this out, my fault, I haven't "properly" checked this
> before. I think, we need to remove "compatible = "virtio,mmio"; here

Uhh, no. That just means the example is incomplete. You need to add this 
property or reference this schema from virtio/mmio.yaml.


> diff --git a/Documentation/devicetree/bindings/arm/xen,dev-domid.yaml
> b/Documentation/devicetree/bindings/arm/xen,dev-domid.yaml
> index 2daa8aa..d2f2140 100644
> --- a/Documentation/devicetree/bindings/arm/xen,dev-domid.yaml
> +++ b/Documentation/devicetree/bindings/arm/xen,dev-domid.yaml
> @@ -28,7 +28,7 @@ additionalProperties: true
>  examples:
>    - |
>      virtio_block@3000 {
> -            compatible = "virtio,mmio";
> +            /* ... */
>              reg = <0x3000 0x100>;
>              interrupts = <41>;
> 
> 
> 
> > 
> > The property has to be added to the virtio/mmio.yaml schema. If it is
> > not needed elsewhere, then *just* add the property there.
> 
> As I described above, the property is not virtio specific and can be used
> for any virtualized device for which Xen grant mappings scheme needs to be
> enabled (xen-grant DMA-mapping layer).

But that's a finite list of devices, right? In any case, you have to 
list the property anywhere it can be used.

Rob

