Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mNF3I+ZuvWnL9gIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 20 Mar 2026 16:59:34 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E2FC92DCFC9
	for <lists+xen-devel@lfdr.de>; Fri, 20 Mar 2026 16:59:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1258254.1552402 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w3cFB-0000xf-8t; Fri, 20 Mar 2026 15:58:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1258254.1552402; Fri, 20 Mar 2026 15:58:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w3cFB-0000vV-5p; Fri, 20 Mar 2026 15:58:37 +0000
Received: by outflank-mailman (input) for mailman id 1258254;
 Fri, 20 Mar 2026 15:58:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=8gqn=BU=kernel.org=rafael@srs-se1.protection.inumbo.net>)
 id 1w3cFA-0000vP-4q
 for xen-devel@lists.xenproject.org; Fri, 20 Mar 2026 15:58:36 +0000
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a4eeaa3d-2475-11f1-9ccf-f158ae23cfc8;
 Fri, 20 Mar 2026 16:58:33 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 6156F43A1F
 for <xen-devel@lists.xenproject.org>; Fri, 20 Mar 2026 15:58:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E3E9C2BCB1
 for <xen-devel@lists.xenproject.org>; Fri, 20 Mar 2026 15:58:31 +0000 (UTC)
Received: by mail-oi1-f169.google.com with SMTP id
 5614622812f47-4645dde00a7so2668946b6e.1
 for <xen-devel@lists.xenproject.org>; Fri, 20 Mar 2026 08:58:31 -0700 (PDT)
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
X-Inumbo-ID: a4eeaa3d-2475-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774022311;
	bh=5OVfAAKYK3pCoLiGVQAI4LiOth4ynX3Xbge5VJYkavc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=pl16mdaQ5+COvdD9bX5ZRystAoUG0uE2dY3Yvx/WMuBeNO8FE3lhKUIpOLQg17eGT
	 0FhgrAVDhlH9C1iGGYtI3u+/XlktPJzKMcGFmHHp8+mQDNiY6rF0ztNzJijj3vq8oz
	 gcGClnbQENyd5qhJdBGbF3h3Zc1ZGp9PFi4NGz8wvyodWXjcf2nK+eoVCNbBtlkRWZ
	 TZACQxSFIr1KUyJi2Zg8TYtLAnIqjPEgRkNkZ5lAstrP+LSGDP85SJLPZzEYMWEzbT
	 NE2qZUwQ3n20WaxKqnvQ7HzD401uSj8kc+q67u3Ngz+2UdaCD3Uvkpk1ncw5vWPpG1
	 t0APO6MNg/N0Q==
X-Forwarded-Encrypted: i=1; AJvYcCV5cSl3+mz461WjsRi0Fkkno/NLRGNuh/m8raJWFbKtczhFxbDodDa7rsYhU3O70fStA23y9GyxJJc=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzvHUsnaMEzKOxZOYeLibTo+Hh+Q+AzUDooBMYqYjler3U25yU+
	8a+EojdTFC2AjeOVnqFCPPhMjaXZBpvSfE3Ka8SWiu7ZUjG97qwkvApQWH2YWOn0Rl3l34MFimt
	hjD6niDoaEhg8NprW+biz3elM4BNvquQ=
X-Received: by 2002:a05:6808:4fe4:b0:467:cd8:7f5e with SMTP id
 5614622812f47-467cd556a0dmr4624044b6e.4.1774022310328; Fri, 20 Mar 2026
 08:58:30 -0700 (PDT)
MIME-Version: 1.0
References: <8683270.T7Z3S40VBb@rafael.j.wysocki>
In-Reply-To: <8683270.T7Z3S40VBb@rafael.j.wysocki>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Fri, 20 Mar 2026 16:58:18 +0100
X-Gmail-Original-Message-ID: <CAJZ5v0gt72nhueFkpP1Hp9PNNbnQ6cmskq_sxEbdgzxy-ZWqjg@mail.gmail.com>
X-Gm-Features: AaiRm53OWzJ_LsLSl2Q21Pi0otYOG2pKuGSzCAUkrh5-7mMws8P_z_zFxxlNZcA
Message-ID: <CAJZ5v0gt72nhueFkpP1Hp9PNNbnQ6cmskq_sxEbdgzxy-ZWqjg@mail.gmail.com>
Subject: Re: [PATCH v1] ACPI: PAD: xen: Convert to a platform driver
To: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Linux ACPI <linux-acpi@vger.kernel.org>, xen-devel@lists.xenproject.org, 
	LKML <linux-kernel@vger.kernel.org>, Juergen Gross <jgross@suse.com>, 
	Stefano Stabellini <sstabellini@kernel.org>, 
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,intel.com:email];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:rafael@kernel.org,m:linux-acpi@vger.kernel.org,m:xen-devel@lists.xenproject.org,m:linux-kernel@vger.kernel.org,m:jgross@suse.com,m:sstabellini@kernel.org,m:oleksandr_tyshchenko@epam.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[rafael@kernel.org,xen-devel-bounces@lists.xenproject.org];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[rafael@kernel.org,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	RCPT_COUNT_SEVEN(0.00)[7];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Queue-Id: E2FC92DCFC9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sat, Mar 14, 2026 at 12:57=E2=80=AFPM Rafael J. Wysocki <rafael@kernel.o=
rg> wrote:
>
> From: "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>
>
> In all cases in which a struct acpi_driver is used for binding a driver
> to an ACPI device object, a corresponding platform device is created by
> the ACPI core and that device is regarded as a proper representation of
> underlying hardware.  Accordingly, a struct platform_driver should be
> used by driver code to bind to that device.  There are multiple reasons
> why drivers should not bind directly to ACPI device objects [1].
>
> Overall, it is better to bind drivers to platform devices than to their
> ACPI companions, so convert the Xen ACPI processor aggregator device
> (PAD) driver to a platform one.
>
> While this is not expected to alter functionality, it changes sysfs
> layout and so it will be visible to user space.
>
> Link: https://lore.kernel.org/all/2396510.ElGaqSPkdT@rafael.j.wysocki/ [1=
]
> Signed-off-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>

If there are any objections or concerns regarding this change, please
let me know.

In the absence of any, I'll queue it up for 7.1.

Thanks!

> ---
>
> Note that the original ACPI PAD driver has been a platform driver for
> quite some time already.
>
> ---
>  drivers/xen/xen-acpi-pad.c | 23 ++++++++++++-----------
>  1 file changed, 12 insertions(+), 11 deletions(-)
>
> diff --git a/drivers/xen/xen-acpi-pad.c b/drivers/xen/xen-acpi-pad.c
> index ede69a5278d3..75a39862c1df 100644
> --- a/drivers/xen/xen-acpi-pad.c
> +++ b/drivers/xen/xen-acpi-pad.c
> @@ -11,6 +11,7 @@
>  #include <linux/kernel.h>
>  #include <linux/types.h>
>  #include <linux/acpi.h>
> +#include <linux/platform_device.h>
>  #include <xen/xen.h>
>  #include <xen/interface/version.h>
>  #include <xen/xen-ops.h>
> @@ -107,8 +108,9 @@ static void acpi_pad_notify(acpi_handle handle, u32 e=
vent,
>         }
>  }
>
> -static int acpi_pad_add(struct acpi_device *device)
> +static int acpi_pad_probe(struct platform_device *pdev)
>  {
> +       struct acpi_device *device =3D ACPI_COMPANION(&pdev->dev);
>         acpi_status status;
>
>         strcpy(acpi_device_name(device), ACPI_PROCESSOR_AGGREGATOR_DEVICE=
_NAME);
> @@ -122,13 +124,13 @@ static int acpi_pad_add(struct acpi_device *device)
>         return 0;
>  }
>
> -static void acpi_pad_remove(struct acpi_device *device)
> +static void acpi_pad_remove(struct platform_device *pdev)
>  {
>         mutex_lock(&xen_cpu_lock);
>         xen_acpi_pad_idle_cpus(0);
>         mutex_unlock(&xen_cpu_lock);
>
> -       acpi_remove_notify_handler(device->handle,
> +       acpi_remove_notify_handler(ACPI_HANDLE(&pdev->dev),
>                 ACPI_DEVICE_NOTIFY, acpi_pad_notify);
>  }
>
> @@ -137,13 +139,12 @@ static const struct acpi_device_id pad_device_ids[]=
 =3D {
>         {"", 0},
>  };
>
> -static struct acpi_driver acpi_pad_driver =3D {
> -       .name =3D "processor_aggregator",
> -       .class =3D ACPI_PROCESSOR_AGGREGATOR_CLASS,
> -       .ids =3D pad_device_ids,
> -       .ops =3D {
> -               .add =3D acpi_pad_add,
> -               .remove =3D acpi_pad_remove,
> +static struct platform_driver acpi_pad_driver =3D {
> +       .probe =3D acpi_pad_probe,
> +       .remove =3D acpi_pad_remove,
> +       .driver =3D {
> +               .name =3D "acpi_processor_aggregator",
> +               .acpi_match_table =3D pad_device_ids,
>         },
>  };
>
> @@ -157,6 +158,6 @@ static int __init xen_acpi_pad_init(void)
>         if (!xen_running_on_version_or_later(4, 2))
>                 return -ENODEV;
>
> -       return acpi_bus_register_driver(&acpi_pad_driver);
> +       return platform_driver_register(&acpi_pad_driver);
>  }
>  subsys_initcall(xen_acpi_pad_init);
> --
> 2.51.0
>
>
>
>
>

