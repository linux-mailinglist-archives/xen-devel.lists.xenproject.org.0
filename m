Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 237609D5AFA
	for <lists+xen-devel@lfdr.de>; Fri, 22 Nov 2024 09:21:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.841771.1257266 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tEOuX-0002O1-TT; Fri, 22 Nov 2024 08:21:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 841771.1257266; Fri, 22 Nov 2024 08:21:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tEOuX-0002MT-QY; Fri, 22 Nov 2024 08:21:05 +0000
Received: by outflank-mailman (input) for mailman id 841771;
 Fri, 22 Nov 2024 08:21:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JvYz=SR=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1tEOuV-0002Lc-SG
 for xen-devel@lists.xenproject.org; Fri, 22 Nov 2024 08:21:03 +0000
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [2a00:1450:4864:20::131])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b4647b12-a8aa-11ef-99a3-01e77a169b0f;
 Fri, 22 Nov 2024 09:20:59 +0100 (CET)
Received: by mail-lf1-x131.google.com with SMTP id
 2adb3069b0e04-53dd57589c8so273655e87.1
 for <xen-devel@lists.xenproject.org>; Fri, 22 Nov 2024 00:20:59 -0800 (PST)
Received: from [192.168.219.191] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53dd2480ec1sm278883e87.166.2024.11.22.00.20.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Nov 2024 00:20:58 -0800 (PST)
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
X-Inumbo-ID: b4647b12-a8aa-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjoxMzEiLCJoZWxvIjoibWFpbC1sZjEteDEzMS5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6ImI0NjQ3YjEyLWE4YWEtMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMyMjYzNjU5Ljc0Mjg1MSwic2VuZGVyIjoib2xla3NpaS5rdXJvY2hrb0BnbWFpbC5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732263659; x=1732868459; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=dlm0jt+dN8a/gRZ8O0P+wi8OQsPuuJfFFMYmHv7xq/s=;
        b=BuHHPlG/ul0YeK61ZjW1DL4nDh+/pSeKnJjyiWgs9kDJ5Fy8HCyY7sEQl3yy/A97ZD
         43RrINfpGL7NTeT7EHFUL7sInpIRUh/tAx6x5x8twzpm/ry2zSHh53YODUbAJPmysN6S
         4Uk10F6Pq8zLc/3Ubo6+Y1EvS+G7ltoLCAzSJIHjItM074p01oNbUoWeohAptZdYABOl
         iATfrirQFTetuedCy3DlqSRkP4nYcYrrzuQ8EETqgpgF7InVOn56+SVKPfCWrR0Yxztx
         IqURitjpa63/kmLdkQXxNEE02tZfPOrE2FBQzylNfB8v0vzfsP5pfu1BKAefxYcf9km8
         TihA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732263659; x=1732868459;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dlm0jt+dN8a/gRZ8O0P+wi8OQsPuuJfFFMYmHv7xq/s=;
        b=Zm15LuXQWJ2fSh1CzRk5oMfwrB2ikPI6kRuMGfUrXI9DgZdzOsOnmjXjY3r+dmkGvL
         sOxLCfS/WS604nC+Vu1ipVc5yrfV4w6H/4H4DiCyQH7KaLK4UFFkHetAexAJlSa+OP6c
         teTjt5C8MXXkYZAxQpU/UJNOTNQAV+YS0wUmHcx1gKUkvWYO6LNl3sfN0NJhE/ByWZbS
         nmt96Y5ns2aaYUgB9JGUcif9THXzs++rQWHMl1bZeELwEqQqEH8B8ct5c4OFqIa6bA6v
         vzlJ1z7iZcVgJdenLO4lxrXXJwL7QFD0axs6z/9wZp5AnXpMesdIZacUXgxRfzesx20l
         oeWg==
X-Forwarded-Encrypted: i=1; AJvYcCW3bnQt+KTK5WwcoXVz7a8NbQVYsF6gpuNm5dExnmIk4YfJz8YEgdLkcDFFbaO14hLfYdX7BgTSDNw=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy+mgLklkcJXNKpKEkoscEGcSv4/HWappuADJnNAmvuZEf+19/B
	kKes93Np5Qqz0AcJaBzqDCvgy6niBZRYY8gJs2M31t6BHHmBN5gN
X-Gm-Gg: ASbGncvhL9SLrWcOLMs/o/TnB0T5vRdhcBeDyRDbW9nwSboquwzgH8IdrkJe1sXjnW1
	Eru9b1l7hXLJ9MCoIhusWKWP9zRlhdAxO+XS9hvs8GyU7fKJIeVwJpOc1Xo/y2tSN0s0SWWQIWS
	QvB5w60UQWeyMqR1yGGao6taf1Rv40x6uQeyWl3pnvo+jIMUrw42ucCHNsH3vXW7zpH4X+PhZAw
	g0Gg5i8o2Px77eKlifI86i5ZLSl//lZ9zLOUAWzrvgUasu4FeTCcBcXRxGgJuE=
X-Google-Smtp-Source: AGHT+IHJiZgdo0h1T7wRdD/ObYglhLWT6JsHfUm1GFmgUMbvphZT08+hdiGA11TkD7PkzXC1ATXQMw==
X-Received: by 2002:a05:6512:234f:b0:53d:d09c:27cc with SMTP id 2adb3069b0e04-53dd29c43abmr671230e87.1.1732263658778;
        Fri, 22 Nov 2024 00:20:58 -0800 (PST)
Message-ID: <4b7780e0ad9ca5fac5be2382c060c06ef3697274.camel@gmail.com>
Subject: Re: [PATCH v4] xen/common: Move gic_dt_preinit() to common code
From: oleksii.kurochko@gmail.com
To: Michal Orzel <michal.orzel@amd.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>,  Bertrand Marquis <bertrand.marquis@arm.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>
Date: Fri, 22 Nov 2024 09:20:57 +0100
In-Reply-To: <74f837dc-eaeb-495f-89ca-296eb56ad36b@amd.com>
References: 
	<54d0ff689e167b3f3137afea45307f762ce0a974.1732027385.git.oleksii.kurochko@gmail.com>
	 <74f837dc-eaeb-495f-89ca-296eb56ad36b@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.1 (3.54.1-1.fc41app1) 
MIME-Version: 1.0

On Thu, 2024-11-21 at 11:27 +0100, Michal Orzel wrote:
>=20
>=20
> On 19/11/2024 15:56, Oleksii Kurochko wrote:
> >=20
> >=20
> > Introduce intc_dt_preinit() in the common codebase, as it is not
> > architecture-specific and can be reused by both PPC and RISC-V.
> > This function identifies the node with the interrupt-controller
> > property
> > in the device tree and calls device_init() to handle architecture-
> > specific
> > initialization of the interrupt controller.
> >=20
> > Make minor adjustments compared to the original ARM implementation
> > of
> > gic_dt_preinit():
> > =C2=A0- Remove the local rc variable in gic_dt_preinit() since it is
> > only used once.
> > =C2=A0- Change the prefix from gic to intc to clarify that the function
> > is not
> > =C2=A0=C2=A0 specific to ARM=E2=80=99s GIC, making it suitable for othe=
r
> > architectures as well.
> >=20
> > Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> > ---
> > Changes in v4:
> > =C2=A0- Add SPDX tag in intc.c
> > =C2=A0- s/num_gics/num_intc
> > =C2=A0- Update the comment: s/GIC/interrupt controller.
> > ---
> > Changes in v3:
> > =C2=A0- s/ic/intc.
> > =C2=A0- Update the commit message.
> > =C2=A0- Move intc_dt_preinit() to common/device-tree/intc.c.
> > =C2=A0- Add declaration of intc_dt_preinit() in xen/device_tree.h.
> > =C2=A0- Revert intc_preinit()-related changes and just back
> > gic_preinit() in
> > =C2=A0=C2=A0 Arm's gic.c.
> > =C2=A0- Revert ACPI-related changes.
> > ---
> > Changes in v2:
> > =C2=A0- Revert changes connected to moving of gic_acpi_preinit() to
> > common code as
> > =C2=A0=C2=A0 it isn't really architecture indepent part.
> > =C2=A0- Update the commit message.
> > =C2=A0- Move stub of ic_acpi_preinit() to <asm-generic/device.h> for th=
e
> > case when
> > =C2=A0=C2=A0 CONFIG_ACPI=3Dn.
> > ---
> > =C2=A0xen/arch/arm/gic.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 32 +----------------------------
> > -
> > =C2=A0xen/common/device-tree/Makefile |=C2=A0 1 +
> > =C2=A0xen/common/device-tree/intc.c=C2=A0=C2=A0 | 35
> > +++++++++++++++++++++++++++++++++
> > =C2=A0xen/include/xen/device_tree.h=C2=A0=C2=A0 |=C2=A0 6 ++++++
> > =C2=A04 files changed, 43 insertions(+), 31 deletions(-)
> > =C2=A0create mode 100644 xen/common/device-tree/intc.c
> >=20
> > diff --git a/xen/arch/arm/gic.c b/xen/arch/arm/gic.c
> > index 3eaf670fd7..acf61a4de3 100644
> > --- a/xen/arch/arm/gic.c
> > +++ b/xen/arch/arm/gic.c
> > @@ -214,36 +214,6 @@ int gic_map_hwdom_extra_mappings(struct domain
> > *d)
> > =C2=A0=C2=A0=C2=A0=C2=A0 return 0;
> > =C2=A0}
> >=20
> > -static void __init gic_dt_preinit(void)
> > -{
> > -=C2=A0=C2=A0=C2=A0 int rc;
> > -=C2=A0=C2=A0=C2=A0 struct dt_device_node *node;
> > -=C2=A0=C2=A0=C2=A0 uint8_t num_gics =3D 0;
> > -
> > -=C2=A0=C2=A0=C2=A0 dt_for_each_device_node( dt_host, node )
> > -=C2=A0=C2=A0=C2=A0 {
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if ( !dt_get_property(node,=
 "interrupt-controller", NULL)
> > )
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 con=
tinue;
> > -
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if ( !dt_get_parent(node) )
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 con=
tinue;
> > -
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 rc =3D device_init(node, DE=
VICE_INTERRUPT_CONTROLLER, NULL);
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if ( !rc )
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 {
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* =
NOTE: Only one GIC is supported */
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 num=
_gics =3D 1;
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bre=
ak;
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
> > -=C2=A0=C2=A0=C2=A0 }
> > -=C2=A0=C2=A0=C2=A0 if ( !num_gics )
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 panic("Unable to find compa=
tible GIC in the device
> > tree\n");
> > -
> > -=C2=A0=C2=A0=C2=A0 /* Set the GIC as the primary interrupt controller =
*/
> > -=C2=A0=C2=A0=C2=A0 dt_interrupt_controller =3D node;
> > -=C2=A0=C2=A0=C2=A0 dt_device_set_used_by(node, DOMID_XEN);
> > -}
> > -
> > =C2=A0#ifdef CONFIG_ACPI
> > =C2=A0static void __init gic_acpi_preinit(void)
> > =C2=A0{
> > @@ -269,7 +239,7 @@ static void __init gic_acpi_preinit(void) { }
> > =C2=A0void __init gic_preinit(void)
> > =C2=A0{
> > =C2=A0=C2=A0=C2=A0=C2=A0 if ( acpi_disabled )
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 gic_dt_preinit();
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 intc_dt_preinit();
> > =C2=A0=C2=A0=C2=A0=C2=A0 else
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 gic_acpi_preinit();
> > =C2=A0}
> > diff --git a/xen/common/device-tree/Makefile b/xen/common/device-
> > tree/Makefile
> > index 58052d074e..7c549be38a 100644
> > --- a/xen/common/device-tree/Makefile
> > +++ b/xen/common/device-tree/Makefile
> > @@ -2,3 +2,4 @@ obj-y +=3D bootfdt.init.o
> > =C2=A0obj-y +=3D bootinfo.init.o
> > =C2=A0obj-y +=3D device-tree.o
> > =C2=A0obj-$(CONFIG_OVERLAY_DTB) +=3D dt-overlay.o
> > +obj-y +=3D intc.o
> > diff --git a/xen/common/device-tree/intc.c b/xen/common/device-
> > tree/intc.c
> > new file mode 100644
> > index 0000000000..d2bcbc2d5e
> > --- /dev/null
> > +++ b/xen/common/device-tree/intc.c
> > @@ -0,0 +1,35 @@
> > +/* SPDX-License-Identifier: GPL-2.0-or-later */
> > +
> > +#include <xen/device_tree.h>
> > +#include <xen/init.h>
> > +#include <xen/lib.h>
> > +
> > +void __init intc_dt_preinit(void)
> > +{
> > +=C2=A0=C2=A0=C2=A0 struct dt_device_node *node;
> > +=C2=A0=C2=A0=C2=A0 uint8_t num_intc =3D 0;
> > +
> > +=C2=A0=C2=A0=C2=A0 dt_for_each_device_node( dt_host, node )
> > +=C2=A0=C2=A0=C2=A0 {
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if ( !dt_get_property(node,=
 "interrupt-controller", NULL)
> > )
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 con=
tinue;
> > +
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if ( !dt_get_parent(node) )
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 con=
tinue;
> > +
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if ( !device_init(node, DEV=
ICE_INTERRUPT_CONTROLLER, NULL)
> > )
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 {
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* =
NOTE: Only one interrupt controller is supported */
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 num=
_intc =3D 1;
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bre=
ak;
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
> > +=C2=A0=C2=A0=C2=A0 }
> > +
> > +=C2=A0=C2=A0=C2=A0 if ( !num_intc )
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 panic("Unable to find compa=
tible interrupt contoller"
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 "in the device tree\n");
> Don't split printk messages. Also the split is incorrect as it'll
> result in "contollerin" (i.e. no space in between).
> Also s/contoller/controller/
> =C2=A0
> > +
> > +=C2=A0=C2=A0=C2=A0 /* Set the interrupt controller as the primary inte=
rrupt
> > controller */
> > +=C2=A0=C2=A0=C2=A0 dt_interrupt_controller =3D node;
> > +=C2=A0=C2=A0=C2=A0 dt_device_set_used_by(node, DOMID_XEN);
> > +}
> Missing EMACS block at the end of file.
>=20
> > diff --git a/xen/include/xen/device_tree.h
> > b/xen/include/xen/device_tree.h
> > index e6287305a7..33d70b9594 100644
> > --- a/xen/include/xen/device_tree.h
> > +++ b/xen/include/xen/device_tree.h
> > @@ -238,6 +238,12 @@ extern rwlock_t dt_host_lock;
> > =C2=A0struct dt_device_node *
> > =C2=A0dt_find_interrupt_controller(const struct dt_device_match
> > *matches);
> >=20
> > +#ifdef CONFIG_HAS_DEVICE_TREE
> > +void intc_dt_preinit(void);
> > +#else
> > +static inline void intc_dt_preinit(void) { }
> > +#endif
> Is it really needed to provide the stub and guards? Other DT related
> functions in this header are not
> protected and AFAICT the inclusion of this header only works if
> CONFIG_HAS_DEVICE_TREE=3Dy.
I think you are right and we can really drop stub and guards. I'll send
a new patch version applying this and the comments above.

Thanks.

~ Oleksii

