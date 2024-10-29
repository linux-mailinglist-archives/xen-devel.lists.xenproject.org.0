Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 123979B5161
	for <lists+xen-devel@lfdr.de>; Tue, 29 Oct 2024 18:53:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.827773.1242479 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t5qPQ-0002WW-8o; Tue, 29 Oct 2024 17:53:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 827773.1242479; Tue, 29 Oct 2024 17:53:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t5qPQ-0002UG-6H; Tue, 29 Oct 2024 17:53:36 +0000
Received: by outflank-mailman (input) for mailman id 827773;
 Tue, 29 Oct 2024 17:53:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=H/ws=RZ=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1t5qPP-0002UA-BP
 for xen-devel@lists.xenproject.org; Tue, 29 Oct 2024 17:53:35 +0000
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [2a00:1450:4864:20::634])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b54c1b0b-961e-11ef-99a3-01e77a169b0f;
 Tue, 29 Oct 2024 18:53:30 +0100 (CET)
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-a9a2209bd7fso869436566b.2
 for <xen-devel@lists.xenproject.org>; Tue, 29 Oct 2024 10:53:30 -0700 (PDT)
Received: from [192.168.219.191] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9b1f297a29sm494833066b.132.2024.10.29.10.53.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Oct 2024 10:53:29 -0700 (PDT)
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
X-Inumbo-ID: b54c1b0b-961e-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo2MzQiLCJoZWxvIjoibWFpbC1lajEteDYzNC5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6ImI1NGMxYjBiLTk2MWUtMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMwMjI0NDEwLjg1MDAyOCwic2VuZGVyIjoib2xla3NpaS5rdXJvY2hrb0BnbWFpbC5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730224410; x=1730829210; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=i1NIanbQfgD7seQyRSl+grvoN89gakQiWgWhUCjCdxA=;
        b=AvaZVx5cICBMpjNdu+X3lhw0gentv2YrWkNBQRm75FhpC/Cd7jKi46gWAqJPDM+vQ5
         0BXZsPNS0jppY1hEhStY9Ac2brn9CWQYhkYJ4X+qKMLBoSUjjCIjt5qpxHOICh0042Gb
         22YHbwpheLm7dxyN+W1G5fvwEBhtneYGnKGtFQo2GuayCKnHG5kD07pGWj6RbbD67t0h
         r99M0ZmZO3VR7bQ6jZhGAL2uimDPgocSTcyODJhAcCjXITC95bRek+0oInFzfCm0DGIT
         BUDVfwihDHletczp80YlaRfP3+LpzMBfyP+Lgl14WXV7JUeNLnrXQV4SWXXOTRb1sfj3
         MX8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730224410; x=1730829210;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=i1NIanbQfgD7seQyRSl+grvoN89gakQiWgWhUCjCdxA=;
        b=Qhub0XVOQJTK/Ig0jurlOjNKyeCKV5FPHHkV+G8XLcl5ayrGVL2lt84xEmum/51PXr
         jJqfTfb+9sd0Avy0ulFOKBB8gsiw0iGjdB/UJUfe/cZCU4Zzzl61K0URpbhgphLnZFqr
         P+p+HqkCSYNlE4eGEg3A8VSE7N4QodPJZkC3zPBTtYLHW3qor/NbsvExYmTzmWzUC9N4
         vhz9dvJfnFbOAvxw3bhCHoztVVqbyos2Q89vupjte1H/aHCZFxDLNYtYqXfwGam0OexV
         ldEIfn1z5aJZDrzn8UVZL42LJmo91KVsN52SFANIatUfnuRNh7H/yeFnlrhpmQBFPWhn
         UERA==
X-Forwarded-Encrypted: i=1; AJvYcCXbQklSNgmgOBhTzXSti9QTy/aBE1tgLLlYEswXmUuB1hJHXSCimUGr6FHqoL+g4R+LGQ7pKmO7138=@lists.xenproject.org
X-Gm-Message-State: AOJu0YySoLEsM0d9Xh3d9Ye8LbET5P5xjJJq9sx1esZ6Y4E9xnvwrt8i
	Ydu5t9wx/0PqLrery1W5D7w4JpT/QIfA1aLCePjdcehU9F1+nJ66
X-Google-Smtp-Source: AGHT+IEjvGRWSEyWjUENGzqPcVkS1/O5cTYN6bIhBwhXvQftHawVtEHPw8DSylTjOdCGH++O8WzVmg==
X-Received: by 2002:a17:907:1a4e:b0:a9a:2523:b4ce with SMTP id a640c23a62f3a-a9de5c91985mr701140766b.6.1730224410000;
        Tue, 29 Oct 2024 10:53:30 -0700 (PDT)
Message-ID: <c6825b4530e771dcc5393609cd147f34b3e120b3.camel@gmail.com>
Subject: Re: [PATCH v1] xen/common: move gic_preinit() to common code
From: oleksii.kurochko@gmail.com
To: Jan Beulich <jbeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>,  Bertrand Marquis <bertrand.marquis@arm.com>, Michal
 Orzel <michal.orzel@amd.com>, Volodymyr Babchuk
 <Volodymyr_Babchuk@epam.com>, Andrew Cooper <andrew.cooper3@citrix.com>, 
 xen-devel@lists.xenproject.org
Date: Tue, 29 Oct 2024 18:53:29 +0100
In-Reply-To: <a5539c03-4e19-4739-95cf-439aa0bea9a3@suse.com>
References: 
	<b1ded26dcebf9a3228fe4062825273720e0c59fe.1730220384.git.oleksii.kurochko@gmail.com>
	 <a5539c03-4e19-4739-95cf-439aa0bea9a3@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.4 (3.52.4-1.fc40app2) 
MIME-Version: 1.0

On Tue, 2024-10-29 at 17:57 +0100, Jan Beulich wrote:
> On 29.10.2024 17:47, Oleksii Kurochko wrote:
> > --- a/xen/common/device.c
> > +++ b/xen/common/device.c
> > @@ -4,10 +4,14 @@
> > =C2=A0 *=C2=A0=C2=A0 xen/arch/arm/device.c
> > =C2=A0 */
> > =C2=A0
> > +#include <xen/acpi.h>
> > =C2=A0#include <xen/bug.h>
> > =C2=A0#include <xen/device_tree.h>
> > =C2=A0#include <xen/errno.h>
> > =C2=A0#include <xen/init.h>
> > +#include <xen/kernel.h>
> > +#include <xen/lib.h>
> > +#include <xen/types.h>
>=20
> I don't think non-ACPI configs should include xen/acpi.h here. Surely
> this
> can be moved down into the ACPI-only code section?
>=20
> > @@ -56,6 +60,40 @@ enum device_class device_get_class(const struct
> > dt_device_node *dev)
> > =C2=A0=C2=A0=C2=A0=C2=A0 return DEVICE_UNKNOWN;
> > =C2=A0}
> > =C2=A0
> > +static void __init ic_dt_preinit(void)
> > +{
> > +=C2=A0=C2=A0=C2=A0 struct dt_device_node *node;
> > +=C2=A0=C2=A0=C2=A0 uint8_t num_gics =3D 0;
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
NOTE: Only one GIC is supported */
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 num=
_gics =3D 1;
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bre=
ak;
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
> > +=C2=A0=C2=A0=C2=A0 }
> > +
> > +=C2=A0=C2=A0=C2=A0 if ( !num_gics )
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 panic("Unable to find compa=
tible interrupt contoller"
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 "in the device tree\n");
> > +
> > +=C2=A0=C2=A0=C2=A0 /* Set the interrupt controller as the primary inte=
rrupt
> > controller */
> > +=C2=A0=C2=A0=C2=A0 dt_interrupt_controller =3D node;
> > +=C2=A0=C2=A0=C2=A0 dt_device_set_used_by(node, DOMID_XEN);
> > +}
> > +
> > +#else /* !CONFIG_HAS_DEVICE_TREE */
> > +
> > +static void __init ic_dt_preinit(void) { }
> > +
> > =C2=A0#endif
>=20
> While for DT I can only guess that the IC is common across platforms,
> ...
>=20
> > @@ -79,4 +117,31 @@ int __init acpi_device_init(enum device_class
> > class, const void *data, int class
> > =C2=A0=C2=A0=C2=A0=C2=A0 return -EBADF;
> > =C2=A0}
> > =C2=A0
> > +static void __init ic_acpi_preinit(void)
> > +{
> > +=C2=A0=C2=A0=C2=A0 struct acpi_subtable_header *header;
> > +=C2=A0=C2=A0=C2=A0 struct acpi_madt_generic_distributor *dist;
> > +
> > +=C2=A0=C2=A0=C2=A0 header =3D
> > acpi_table_get_entry_madt(ACPI_MADT_TYPE_GENERIC_DISTRIBUTOR, 0);
> > +=C2=A0=C2=A0=C2=A0 if ( !header )
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 panic("No valid interrupt c=
ontroller entries exists\n");
> > +
> > +=C2=A0=C2=A0=C2=A0 dist =3D container_of(header, struct
> > acpi_madt_generic_distributor, header);
> > +
> > +=C2=A0=C2=A0=C2=A0 if ( acpi_device_init(DEVICE_INTERRUPT_CONTROLLER, =
NULL, dist-
> > >version) )
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 panic("Unable to find compa=
tible interrupt controller"
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 "in the ACPI table\n");
> > +}
> > +#else /* !CONFIG_ACPI */
> > +
> > +static void __init ic_acpi_preinit(void) { }
> > +
> > =C2=A0#endif
>=20
> ... simply deriving from x86 (and IA-64) it's clear it isn't for
> ACPI. I'm
> therefore unconvinced placing this in common code is appropriate.
Agree, I don't check acpi_madt_generic_distributor and it is ARM
specific so I will drop it and leave only DT part.

Thanks.

~ Oleksii

