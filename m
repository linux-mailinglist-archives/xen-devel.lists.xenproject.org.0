Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 723D652BD8F
	for <lists+xen-devel@lfdr.de>; Wed, 18 May 2022 16:32:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.332253.555915 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nrKj4-00024m-F1; Wed, 18 May 2022 14:32:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 332253.555915; Wed, 18 May 2022 14:32:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nrKj4-00021i-Bi; Wed, 18 May 2022 14:32:34 +0000
Received: by outflank-mailman (input) for mailman id 332253;
 Wed, 18 May 2022 14:32:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=p2sr=V2=arndb.de=arnd@srs-se1.protection.inumbo.net>)
 id 1nrKj3-00021c-9h
 for xen-devel@lists.xenproject.org; Wed, 18 May 2022 14:32:33 +0000
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.187])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 59ccaf7c-d6b7-11ec-bd2c-47488cf2e6aa;
 Wed, 18 May 2022 16:32:31 +0200 (CEST)
Received: from mail-yw1-f173.google.com ([209.85.128.173]) by
 mrelayeu.kundenserver.de (mreue012 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1M3VAI-1nrsgn0FJi-000fJW for <xen-devel@lists.xenproject.org>; Wed, 18 May
 2022 16:32:31 +0200
Received: by mail-yw1-f173.google.com with SMTP id
 00721157ae682-2ff39b44b06so26177257b3.13
 for <xen-devel@lists.xenproject.org>; Wed, 18 May 2022 07:32:30 -0700 (PDT)
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
X-Inumbo-ID: 59ccaf7c-d6b7-11ec-bd2c-47488cf2e6aa
X-Gm-Message-State: AOAM533KbuiTruuYcrBFgs44zHn9/680IJA1qf4KHyYPMA77fgv5Jb47
	7kYxS8EkBGxWWhkokcEsJ6khW+68kP4mUY9vPNM=
X-Google-Smtp-Source: ABdhPJxlE4uUCuxvYT1DUTMaDWGZzPyyY5pBzmvWGxQQ4rCwL5f9fheKzGazF0y+V/+NQaENE1GQBL2EymP+kgt99NY=
X-Received: by 2002:a81:6283:0:b0:2ff:2443:6f3c with SMTP id
 w125-20020a816283000000b002ff24436f3cmr9731868ywb.135.1652884349891; Wed, 18
 May 2022 07:32:29 -0700 (PDT)
MIME-Version: 1.0
References: <1651947548-4055-1-git-send-email-olekstysh@gmail.com> <1651947548-4055-6-git-send-email-olekstysh@gmail.com>
In-Reply-To: <1651947548-4055-6-git-send-email-olekstysh@gmail.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Wed, 18 May 2022 15:32:27 +0100
X-Gmail-Original-Message-ID: <CAK8P3a2cAnXr8TDDYTiFxTWzQxa67sGnYDQRRD+=Q8_cSb1mEw@mail.gmail.com>
Message-ID: <CAK8P3a2cAnXr8TDDYTiFxTWzQxa67sGnYDQRRD+=Q8_cSb1mEw@mail.gmail.com>
Subject: Re: [PATCH V2 5/7] dt-bindings: Add xen,dev-domid property
 description for xen-grant DMA ops
To: Oleksandr Tyshchenko <olekstysh@gmail.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>, 
	"open list:DRM DRIVER FOR QEMU'S CIRRUS DEVICE" <virtualization@lists.linux-foundation.org>, 
	DTML <devicetree@vger.kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, Jason Wang <jasowang@redhat.com>, 
	Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Julien Grall <julien@xen.org>, 
	Juergen Gross <jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, 
	"Michael S. Tsirkin" <mst@redhat.com>, Christoph Hellwig <hch@infradead.org>, 
	Jean-Philippe Brucker <jean-philippe@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:WFVAKeO0MbZcUO/LbWW8rokfv9qQ/1NcjMQV3qavBzyRx0lVR3c
 XbLSGrmf+WurMCRtoGbzbfx4LVDIJsQP/trrfjz4GGGkZrliT9DmvBBYP4olTng4iTHFQb9
 +pF4LdyFhOoqcc5oIlxhw17cZ48RPnZSei8TXjkZbrYtKo8GkB6IlVs9w67d8oovwjnRZNJ
 7xgFzrgH5FNoqkWmP6TIw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:ZrHKYPx8XzY=:ZUL1iGTclFQFPhqr8hXSYa
 +lEcMnmbSNGkD109ww9zlFkCnTQ0/QCgA7mDg1plVg83irLtn6qRGcYH+2xx+uFI9/8TiZDDm
 jGkylXijqu3KfHq306FLv8zo5J9V8Uo5ORCQxWycZmPKQk8qYWdrOq0Zi8jB5sHZDSR99TH5a
 HPXGkC1rp/btEPimmeZACDNh+CPn2blbLet0yOiYDfy4z5hrex1Ow+0RFSspdNKsUoimUIjm2
 Xr9QQcVTr3Myn7riRPQg41Gzks5SPpyEmFjRgLiKPEI+B/LZP5wJIvTz7ATZG+UKLADJI+WnX
 /fkn12AvB4Aw1gBhu+Tcx0z1XTYhempbB3oerSH84MCjZLuENqhuF48uUD5QyM4Gq7zvOGXYX
 nJ3THRrMmTGOATzFdYrdSem0Mgwkk9wFj/HwhDpw0hVabcgKFTGI57Zqu6f8VOLLv9Fx4CGi/
 yOGuTt+e7pFJFOxTsIGcqViwjl6vbuaDgZYF2Y4VGYyvRwjYkP2HBGYoONDrJdUQvzDTZ3bK4
 N6CKD/YXygjO+6uM7o2WPhVhCxgmKoqaKaHR8gMosvFsILneuMGPJTX58B5yMdey6mwvZhRd4
 301Y3s5dc6xUrMA+DsrrGg0Ptz4ihaAuXuSRjrq62GkmqtkIRghNCn1jLceA+mbYaUYrw2bY1
 5bocQCb+ApthBO/yrlYZtpAeAQtpbLyY9OG1t2EAzroAP1PG6gzhaJJiKvDqA4nI3YoMPFr3V
 MYAa5GVgEa9CgonvTvwcgDQ+MDlsnb8VPbOBY5cpAWFmFOYBH5x5Qc6MD9FnPyJt+L0H6Z2aV
 OiGb7z4ak2GBfPBmPs8aFd8SoLm/Mr8x90WLFNgmY/xXsv70cLKO3bRqwY4YCUNNEppJQps4t
 AqRPvzzb9f9eytktbvx0gxqOYNg+L/fPaF5SO74ow=

On Sat, May 7, 2022 at 7:19 PM Oleksandr Tyshchenko <olekstysh@gmail.com> wrote:
>
> diff --git a/Documentation/devicetree/bindings/virtio/mmio.yaml b/Documentation/devicetree/bindings/virtio/mmio.yaml
> index 10c22b5..29a0932 100644
> --- a/Documentation/devicetree/bindings/virtio/mmio.yaml
> +++ b/Documentation/devicetree/bindings/virtio/mmio.yaml
> @@ -13,6 +13,9 @@ description:
>    See https://www.oasis-open.org/committees/tc_home.php?wg_abbrev=virtio for
>    more details.
>
> +allOf:
> +  - $ref: /schemas/arm/xen,dev-domid.yaml#
> +
>  properties:
>    compatible:
>      const: virtio,mmio
> @@ -33,6 +36,10 @@ properties:
>      description: Required for devices making accesses thru an IOMMU.
>      maxItems: 1
>
> +  xen,dev-domid:
> +    description: Required when Xen grant mappings need to be enabled for device.
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +
>  required:
>    - compatible
>    - reg

Sorry for joining the discussion late. Have you considered using the
generic iommu
binding here instead of a custom property? This would mean having a device
node for the grant-table mechanism that can be referred to using the 'iommus'
phandle property, with the domid as an additional argument.

It does not quite fit the model that Linux currently uses for iommus,
as that has an allocator for dma_addr_t space, but it would think it's
conceptually close enough that it makes sense for the binding.

         Arnd

