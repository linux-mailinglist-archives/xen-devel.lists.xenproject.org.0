Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A5A4232DD30
	for <lists+xen-devel@lfdr.de>; Thu,  4 Mar 2021 23:36:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.93400.176345 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lHwZO-0006Lr-Qd; Thu, 04 Mar 2021 22:35:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 93400.176345; Thu, 04 Mar 2021 22:35:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lHwZO-0006LX-Na; Thu, 04 Mar 2021 22:35:46 +0000
Received: by outflank-mailman (input) for mailman id 93400;
 Thu, 04 Mar 2021 22:35:45 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aM4q=IC=gmail.com=alistair23@srs-us1.protection.inumbo.net>)
 id 1lHwZN-0006LS-Kl
 for xen-devel@lists.xenproject.org; Thu, 04 Mar 2021 22:35:45 +0000
Received: from mail-il1-x129.google.com (unknown [2607:f8b0:4864:20::129])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 03d28438-6e53-4cea-8d90-3c2b9e3a1546;
 Thu, 04 Mar 2021 22:35:44 +0000 (UTC)
Received: by mail-il1-x129.google.com with SMTP id g9so202426ilc.3
 for <xen-devel@lists.xenproject.org>; Thu, 04 Mar 2021 14:35:44 -0800 (PST)
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
X-Inumbo-ID: 03d28438-6e53-4cea-8d90-3c2b9e3a1546
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=xZijENr2+zGNDTMY91mNb3XjWFQB+d3gIehbEGKDitY=;
        b=ZYn50Fmmt3BS8UaIsrDlnk8aeyb/CyGHELv6HVIiFc1SVVkUmrOlVgP/E+f/8bJnL4
         ArnLNa/61x0hDaMp9VTFwZvKzzu53JrGbyHMJpd5yehD11RY4EV0mEP0mZHkS7htiwIL
         JnSP8qfMShd6NYUv/9VRmifwXglpxH2T+otFPg7J6OlulXBZbJbiNcX+byNs1/X22OQo
         7wkOsHR5JoCMN876MzLmaFqhZnR+BxwJRTHHal0x9PYKiXIYqc6OSAtT+BPp5qsg8QXX
         LtJcFcCUafD8buEW1Ob7pHF+dB4Q2wry7r+yelUZRWaMoLZZJ4ZqpinMMojfM8oqoA2K
         /ysQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=xZijENr2+zGNDTMY91mNb3XjWFQB+d3gIehbEGKDitY=;
        b=JrRm3Uyiqx/HMYv0U0QCkd9TH65E0zcIV413ajunkPsQDOhYgm4Gtt6lhvp/WXZ/4R
         0sIX3ApJQu7s5636sT2ofvqDVdHMANfmEnIpdY9u5rSaRnpc7Cz+uJIc2qWAv+4Lr9rx
         6gtg3xE25drtHQhp98zxxUgkcJR2BmTeG67sRJk6SbEVv3T+mycXbJM7Kb8m52ofFbND
         evlJjwMrE6C1ggtNLHeDwjmvgkILKOwIREuTa46Nzv9z9hv05goPim932ighz9rLDsS6
         mL8/RYhPS8chPDbcsnXYVeLklqm3ERIna+Y62bs1jRq6rtVHyfe1/OXxiedD0buZ0lnt
         ayPw==
X-Gm-Message-State: AOAM530w1TCty5bvtwsMp6Sqbp/h/qplcInpGQRh2rqRvnNkibn4GyfZ
	HrMeLLxHJMUPFPG7KfrA0ECZpKULjkTblw0bvAgEadDVkmI=
X-Google-Smtp-Source: ABdhPJwp5uTMylSaYOtyIhPpVV741/4v9ltLoWOMIgkqDDk6EcErYwmAVCpr/6XqqwrYeRnyEdEdc2JYtsk3KI2+lHE=
X-Received: by 2002:a92:cda1:: with SMTP id g1mr5816293ild.267.1614897343689;
 Thu, 04 Mar 2021 14:35:43 -0800 (PST)
MIME-Version: 1.0
References: <20210303173642.3805-1-alex.bennee@linaro.org> <20210303173642.3805-5-alex.bennee@linaro.org>
In-Reply-To: <20210303173642.3805-5-alex.bennee@linaro.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 4 Mar 2021 17:34:27 -0500
Message-ID: <CAKmqyKP+F8mZrYss6yZTLz1oAvCrBufWFs1NnWug8XNoCeQkaA@mail.gmail.com>
Subject: Re: [PATCH v3 4/7] hw/core: implement a guest-loader to support
 static hypervisor guests
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>, julien@xen.org, stefano.stabellini@linaro.org, 
	stefano.stabellini@xilinx.com, andre.przywara@arm.com, 
	stratos-dev@op-lists.linaro.org, 
	"open list:X86" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 3, 2021 at 12:37 PM Alex Benn=C3=A9e <alex.bennee@linaro.org> w=
rote:
>
> Hypervisors, especially type-1 ones, need the firmware/bootcode to put
> their initial guest somewhere in memory and pass the information to it
> via platform data. The guest-loader is modelled after the generic
> loader for exactly this sort of purpose:
>
>   $QEMU $ARGS  -kernel ~/xen.git/xen/xen \
>     -append "dom0_mem=3D1G,max:1G loglvl=3Dall guest_loglvl=3Dall" \
>     -device guest-loader,addr=3D0x42000000,kernel=3DImage,bootargs=3D"roo=
t=3D/dev/sda2 ro console=3Dhvc0 earlyprintk=3Dxen" \
>     -device guest-loader,addr=3D0x47000000,initrd=3Drootfs.cpio
>
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> Message-Id: <20201105175153.30489-5-alex.bennee@linaro.org>
> Message-Id: <20210211171945.18313-5-alex.bennee@linaro.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  hw/core/guest-loader.h |  34 ++++++++++
>  hw/core/guest-loader.c | 145 +++++++++++++++++++++++++++++++++++++++++
>  MAINTAINERS            |   5 ++
>  hw/core/meson.build    |   2 +
>  4 files changed, 186 insertions(+)
>  create mode 100644 hw/core/guest-loader.h
>  create mode 100644 hw/core/guest-loader.c
>
> diff --git a/hw/core/guest-loader.h b/hw/core/guest-loader.h
> new file mode 100644
> index 0000000000..07f4b4884b
> --- /dev/null
> +++ b/hw/core/guest-loader.h
> @@ -0,0 +1,34 @@
> +/*
> + * Guest Loader
> + *
> + * Copyright (C) 2020 Linaro
> + * Written by Alex Benn=C3=A9e <alex.bennee@linaro.org>
> + * (based on the generic-loader by Li Guang <lig.fnst@cn.fujitsu.com>)
> + *
> + * SPDX-License-Identifier: GPL-2.0-or-later
> + *
> + * This work is licensed under the terms of the GNU GPL, version 2 or la=
ter.
> + * See the COPYING file in the top-level directory.
> + */
> +
> +#ifndef GUEST_LOADER_H
> +#define GUEST_LOADER_H
> +
> +#include "hw/qdev-core.h"
> +#include "qom/object.h"
> +
> +struct GuestLoaderState {
> +    /* <private> */
> +    DeviceState parent_obj;
> +
> +    /* <public> */
> +    uint64_t addr;
> +    char *kernel;
> +    char *args;
> +    char *initrd;
> +};
> +
> +#define TYPE_GUEST_LOADER "guest-loader"
> +OBJECT_DECLARE_SIMPLE_TYPE(GuestLoaderState, GUEST_LOADER)
> +
> +#endif
> diff --git a/hw/core/guest-loader.c b/hw/core/guest-loader.c
> new file mode 100644
> index 0000000000..bde44e27b4
> --- /dev/null
> +++ b/hw/core/guest-loader.c
> @@ -0,0 +1,145 @@
> +/*
> + * Guest Loader
> + *
> + * Copyright (C) 2020 Linaro
> + * Written by Alex Benn=C3=A9e <alex.bennee@linaro.org>
> + * (based on the generic-loader by Li Guang <lig.fnst@cn.fujitsu.com>)
> + *
> + * SPDX-License-Identifier: GPL-2.0-or-later
> + *
> + * This work is licensed under the terms of the GNU GPL, version 2 or la=
ter.
> + * See the COPYING file in the top-level directory.
> + */
> +
> +/*
> + * Much like the generic-loader this is treated as a special device
> + * inside QEMU. However unlike the generic-loader this device is used
> + * to load guest images for hypervisors. As part of that process the
> + * hypervisor needs to have platform information passed to it by the
> + * lower levels of the stack (e.g. firmware/bootloader). If you boot
> + * the hypervisor directly you use the guest-loader to load the Dom0
> + * or equivalent guest images in the right place in the same way a
> + * boot loader would.
> + *
> + * This is only relevant for full system emulation.
> + */
> +
> +#include "qemu/osdep.h"
> +#include "hw/core/cpu.h"
> +#include "hw/sysbus.h"
> +#include "sysemu/dma.h"
> +#include "hw/loader.h"
> +#include "hw/qdev-properties.h"
> +#include "qapi/error.h"
> +#include "qemu/module.h"
> +#include "guest-loader.h"
> +#include "sysemu/device_tree.h"
> +#include "hw/boards.h"
> +
> +/*
> + * Insert some FDT nodes for the loaded blob.
> + */
> +static void loader_insert_platform_data(GuestLoaderState *s, int size,
> +                                        Error **errp)
> +{
> +    MachineState *machine =3D MACHINE(qdev_get_machine());
> +    void *fdt =3D machine->fdt;
> +    g_autofree char *node =3D g_strdup_printf("/chosen/module@0x%08" PRI=
x64,
> +                                            s->addr);
> +    uint64_t reg_attr[2] =3D {cpu_to_be64(s->addr), cpu_to_be64(size)};
> +
> +    if (!fdt) {
> +        error_setg(errp, "Cannot modify FDT fields if the machine has no=
ne");
> +        return;
> +    }
> +
> +    qemu_fdt_add_subnode(fdt, node);
> +    qemu_fdt_setprop(fdt, node, "reg", &reg_attr, sizeof(reg_attr));
> +
> +    if (s->kernel) {
> +        const char *compat[2] =3D { "multiboot,module", "multiboot,kerne=
l" };
> +        if (qemu_fdt_setprop_string_array(fdt, node, "compatible",
> +                                          (char **) &compat,
> +                                          ARRAY_SIZE(compat)) < 0) {
> +            error_setg(errp, "couldn't set %s/compatible", node);
> +            return;
> +        }
> +        if (s->args) {
> +            if (qemu_fdt_setprop_string(fdt, node, "bootargs", s->args) =
< 0) {
> +                error_setg(errp, "couldn't set %s/bootargs", node);
> +            }
> +        }
> +    } else if (s->initrd) {
> +        const char *compat[2] =3D { "multiboot,module", "multiboot,ramdi=
sk" };
> +        if (qemu_fdt_setprop_string_array(fdt, node, "compatible",
> +                                          (char **) &compat,
> +                                          ARRAY_SIZE(compat)) < 0) {
> +            error_setg(errp, "couldn't set %s/compatible", node);
> +            return;
> +        }
> +    }
> +}
> +
> +static void guest_loader_realize(DeviceState *dev, Error **errp)
> +{
> +    GuestLoaderState *s =3D GUEST_LOADER(dev);
> +    char *file =3D s->kernel ? s->kernel : s->initrd;
> +    int size =3D 0;
> +
> +    /* Perform some error checking on the user's options */
> +    if (s->kernel && s->initrd) {
> +        error_setg(errp, "Cannot specify a kernel and initrd in same sta=
nza");
> +        return;
> +    } else if (!s->kernel && !s->initrd)  {
> +        error_setg(errp, "Need to specify a kernel or initrd image");
> +        return;
> +    } else if (!s->addr) {
> +        error_setg(errp, "Need to specify the address of guest blob");
> +        return;
> +    } else if (s->args && !s->kernel) {
> +        error_setg(errp, "Boot args only relevant to kernel blobs");
> +    }
> +
> +    /* Default to the maximum size being the machine's ram size */
> +    size =3D load_image_targphys_as(file, s->addr, current_machine->ram_=
size,
> +                                  NULL);
> +    if (size < 0) {
> +        error_setg(errp, "Cannot load specified image %s", file);
> +        return;
> +    }
> +
> +    /* Now the image is loaded we need to update the platform data */
> +    loader_insert_platform_data(s, size, errp);
> +}
> +
> +static Property guest_loader_props[] =3D {
> +    DEFINE_PROP_UINT64("addr", GuestLoaderState, addr, 0),
> +    DEFINE_PROP_STRING("kernel", GuestLoaderState, kernel),
> +    DEFINE_PROP_STRING("bootargs", GuestLoaderState, args),
> +    DEFINE_PROP_STRING("initrd", GuestLoaderState, initrd),
> +    DEFINE_PROP_END_OF_LIST(),
> +};
> +
> +static void guest_loader_class_init(ObjectClass *klass, void *data)
> +{
> +    DeviceClass *dc =3D DEVICE_CLASS(klass);
> +
> +    dc->realize =3D guest_loader_realize;
> +    device_class_set_props(dc, guest_loader_props);
> +    dc->desc =3D "Guest Loader";
> +    set_bit(DEVICE_CATEGORY_MISC, dc->categories);
> +}
> +
> +static TypeInfo guest_loader_info =3D {
> +    .name =3D TYPE_GUEST_LOADER,
> +    .parent =3D TYPE_DEVICE,
> +    .instance_size =3D sizeof(GuestLoaderState),
> +    .class_init =3D guest_loader_class_init,
> +};
> +
> +static void guest_loader_register_type(void)
> +{
> +    type_register_static(&guest_loader_info);
> +}
> +
> +type_init(guest_loader_register_type)
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 9b2aa18e1f..a5b87d5e30 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -2007,6 +2007,11 @@ F: hw/core/generic-loader.c
>  F: include/hw/core/generic-loader.h
>  F: docs/generic-loader.txt
>
> +Guest Loader
> +M: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> +S: Maintained
> +F: hw/core/guest-loader.c
> +
>  Intel Hexadecimal Object File Loader
>  M: Su Hang <suhang16@mails.ucas.ac.cn>
>  S: Maintained
> diff --git a/hw/core/meson.build b/hw/core/meson.build
> index 032576f571..9cd72edf51 100644
> --- a/hw/core/meson.build
> +++ b/hw/core/meson.build
> @@ -37,6 +37,8 @@ softmmu_ss.add(files(
>    'clock-vmstate.c',
>  ))
>
> +softmmu_ss.add(when: 'CONFIG_TCG', if_true: files('guest-loader.c'))
> +
>  specific_ss.add(when: 'CONFIG_SOFTMMU', if_true: files(
>    'machine-qmp-cmds.c',
>    'numa.c',
> --
> 2.20.1
>
>

