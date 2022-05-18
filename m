Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F57A52BFCB
	for <lists+xen-devel@lfdr.de>; Wed, 18 May 2022 18:40:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.332392.556085 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nrMht-00069c-33; Wed, 18 May 2022 16:39:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 332392.556085; Wed, 18 May 2022 16:39:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nrMhs-00067C-VJ; Wed, 18 May 2022 16:39:28 +0000
Received: by outflank-mailman (input) for mailman id 332392;
 Wed, 18 May 2022 16:39:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=p2sr=V2=arndb.de=arnd@srs-se1.protection.inumbo.net>)
 id 1nrMhr-000676-Jr
 for xen-devel@lists.xenproject.org; Wed, 18 May 2022 16:39:27 +0000
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.10])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 13dbc657-d6c9-11ec-837e-e5687231ffcc;
 Wed, 18 May 2022 18:39:25 +0200 (CEST)
Received: from mail-yb1-f177.google.com ([209.85.219.177]) by
 mrelayeu.kundenserver.de (mreue109 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1MNssA-1oFese2Uau-00OD9V for <xen-devel@lists.xenproject.org>; Wed, 18 May
 2022 18:39:24 +0200
Received: by mail-yb1-f177.google.com with SMTP id i187so2410635ybg.6
 for <xen-devel@lists.xenproject.org>; Wed, 18 May 2022 09:39:24 -0700 (PDT)
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
X-Inumbo-ID: 13dbc657-d6c9-11ec-837e-e5687231ffcc
X-Gm-Message-State: AOAM5329ql0mXp79ULdwivlO7+3ZXf4NXleq+sr3tPqzA9kD7/QeNd/b
	EUb+80yIL/SoizHcUjwLiFSMNi6BXDcTlxJSwUE=
X-Google-Smtp-Source: ABdhPJzgO+qZWLWCVNG0zigCWvcyaAMnm3eGdOmvWgnrUQyVgjytOzSGXEWpAN07OlHuwbLMC0znLO5cjVzishwdUG8=
X-Received: by 2002:a25:cfd7:0:b0:64d:9526:1ed4 with SMTP id
 f206-20020a25cfd7000000b0064d95261ed4mr487184ybg.106.1652891963222; Wed, 18
 May 2022 09:39:23 -0700 (PDT)
MIME-Version: 1.0
References: <1651947548-4055-1-git-send-email-olekstysh@gmail.com>
 <1651947548-4055-6-git-send-email-olekstysh@gmail.com> <CAK8P3a2cAnXr8TDDYTiFxTWzQxa67sGnYDQRRD+=Q8_cSb1mEw@mail.gmail.com>
 <56e8c32d-6771-7179-005f-26ca58555659@gmail.com>
In-Reply-To: <56e8c32d-6771-7179-005f-26ca58555659@gmail.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Wed, 18 May 2022 17:39:23 +0100
X-Gmail-Original-Message-ID: <CAK8P3a1YhkEZ8gcbXHEa5Bwx-4VVRJO8SUHf8=RNWRsc2Yo-+A@mail.gmail.com>
Message-ID: <CAK8P3a1YhkEZ8gcbXHEa5Bwx-4VVRJO8SUHf8=RNWRsc2Yo-+A@mail.gmail.com>
Subject: Re: [PATCH V2 5/7] dt-bindings: Add xen,dev-domid property
 description for xen-grant DMA ops
To: Oleksandr <olekstysh@gmail.com>
Cc: Arnd Bergmann <arnd@arndb.de>, xen-devel <xen-devel@lists.xenproject.org>, 
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
X-Provags-ID: V03:K1:AOTsW5eqCh8NyPfKQ0RVHlpld9aSahzU3E0n3dzqP4uqVD2tiZK
 j0pWXqNZI3+Yn6Z2xcToqYLyEO9ILsKOaXKUB8RRDxztURmWOKz7lpfGFDGJNb5/9MM10K/
 cbuJv85wmLFLRkDw8A/7v8I8H8s+PWjobRQxj+RKsc5c0oh8ho2r0Zd8Ex2YR1nJJLqE5uu
 2hQD6+2JT3so+KcMafIZg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:fs8AsYdenys=:8lxOqoDbRk5jLfWsTTZN7+
 WA7YRHOlKsD1gD/HvVboMFpZWmmIkpNaoHJik2Y/O8yun2Xab9IZpup/ac4UPX8FzAXhm/tEj
 4ol5cn9H3n7VKM2iQC1rfvMvcRTZpEm3VA+wFWz+/8eaxc4J7byfh2zXweTtre5WzXNgJh66J
 aRee0Wl1o2p15EInVLjreThNecxJEB/78h0HCyp+puDg6KvizLbwAIx8I4pIu1YJfli42lXXU
 MXAHlKbuHZp8vTV31bPJXHLuie67g0GMAqhHwNvHGLZ/gyHR9o0TED4YipPeGY7PnBvEL4jap
 KH8m68Y6tXwbgIXNZ5IBQRNwGJ66zGIYJ4Rx27xsg6WNooT9EoZPhOqvo00pmpScz7T9vZcQ2
 Q0zAe8WDRFh6atUyJVfZq+tyY7nJ1to/FBAxd+w0yyoRjSHYEY8qct0I43+fxjGobU5XMyt3D
 eVHklGHGWtKx6ieIMCvb7P9QtDouSv23sp17zCLCB8M8Xt0vTHWRvKurntmYhQ3RtA2F/nm9x
 5nrMEHLizX0iPAWEFpHsYTz8+PS/6Isd9UAxzFa0Rny347xFfu+4kA/wQAmr+mXyOss6bnlEs
 IH4y//C5Ave6MMC9GQFvVR2s5Tf42oB17bnfSIalPdvB8rXm2eBEdQUJubHggDiiyJsDe1Z4z
 libcinN3+hrkexurNkYgJXnjp2+l1ZYIEeO//bz22H29ZoWOw1aTUXtKbCChrT/jFleTesU4k
 hLXvz4Ox13trC3Kk04MMog3Z0CWcfvqh0D8XrPccPVHoAWM/YK8HPtOPhrdZ6i4ixac0OQsAK
 i8uIh5N9Xz6z5cIp1v/NKazv2ZzUPwnT213QUHgvOmPOipFQ4WjeErWGcdozf3aV43LYr0Q+L
 /p4S8fBvX8sQYnKzxzWg==

On Wed, May 18, 2022 at 5:06 PM Oleksandr <olekstysh@gmail.com> wrote:
> On 18.05.22 17:32, Arnd Bergmann wrote:
> > On Sat, May 7, 2022 at 7:19 PM Oleksandr Tyshchenko <olekstysh@gmail.com> wrote:
>
> >   This would mean having a device
> > node for the grant-table mechanism that can be referred to using the 'iommus'
> > phandle property, with the domid as an additional argument.
>
> I assume, you are speaking about something like the following?
>
>
> xen_dummy_iommu {
>     compatible = "xen,dummy-iommu";
>     #iommu-cells = <1>;
> };
>
> virtio@3000 {
>     compatible = "virtio,mmio";
>     reg = <0x3000 0x100>;
>     interrupts = <41>;
>
>     /* The device is located in Xen domain with ID 1 */
>     iommus = <&xen_dummy_iommu 1>;
> };

Right, that's that's the idea, except I would not call it a 'dummy'.
From the perspective of the DT, this behaves just like an IOMMU,
even if the exact mechanism is different from most hardware IOMMU
implementations.

> > It does not quite fit the model that Linux currently uses for iommus,
> > as that has an allocator for dma_addr_t space
>
> yes (# 3/7 adds grant-table based allocator)
>
>
> > , but it would think it's
> > conceptually close enough that it makes sense for the binding.
>
> Interesting idea. I am wondering, do we need an extra actions for this
> to work in Linux guest (dummy IOMMU driver, etc)?

It depends on how closely the guest implementation can be made to
resemble a normal iommu. If you do allocate dma_addr_t addresses,
it may actually be close enough that you can just turn the grant-table
code into a normal iommu driver and change nothing else.

        Arnd

