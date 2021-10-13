Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F2F1242B8CA
	for <lists+xen-devel@lfdr.de>; Wed, 13 Oct 2021 09:16:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.207980.363982 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1maYV6-00044b-Gq; Wed, 13 Oct 2021 07:16:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 207980.363982; Wed, 13 Oct 2021 07:16:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1maYV6-00042W-Dt; Wed, 13 Oct 2021 07:16:32 +0000
Received: by outflank-mailman (input) for mailman id 207980;
 Wed, 13 Oct 2021 07:16:30 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bmSx=PB=gmail.com=alistair23@srs-us1.protection.inumbo.net>)
 id 1maYV4-00042P-Le
 for xen-devel@lists.xenproject.org; Wed, 13 Oct 2021 07:16:30 +0000
Received: from mail-il1-x135.google.com (unknown [2607:f8b0:4864:20::135])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id decbc151-6f16-4b9e-9522-a9304c19b24f;
 Wed, 13 Oct 2021 07:16:29 +0000 (UTC)
Received: by mail-il1-x135.google.com with SMTP id x1so1611815ilv.4
 for <xen-devel@lists.xenproject.org>; Wed, 13 Oct 2021 00:16:29 -0700 (PDT)
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
X-Inumbo-ID: decbc151-6f16-4b9e-9522-a9304c19b24f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=i3FI/4yg1UnUkR3eFfub07xRQFw994Re88ZbTuriDcs=;
        b=fnt6SAzQGyiPybQHEXVCM0uU97YZxcWzVopCBhCvr6XBbj2XR1Oi+WhDZSG1se8yr+
         04SpaO2W584eqSOk/6gpNgP0V+QKjmK7x0xh/jHlpvCJxi3QtM+CxH+eHM9+roXm6Yrf
         aR5fwEtuzHgwqaaywBAOafqgEg1HJbx316sbDaYt/cjwl4rqOzmZbJgkZ6eY8dFExCBt
         aCsEBowYbx5bbrtC4d1WmWmvmG9RJM/LY1F4xEUoWNsW0cWVxxpzB/7ki93VpFn8c1Qa
         j4Erspl8b7ZCU4qnGaoQvUqL9RecGA7d9SPvnJc4iEqUmqscFGsuk8CStKc5M6pxxHKa
         TRIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=i3FI/4yg1UnUkR3eFfub07xRQFw994Re88ZbTuriDcs=;
        b=Pm17fkv3Z0rbmtHTC40p9Az4V1rNGvnw1XpEf6iJNHgknhpibOFJsdGn5xvPCF0xV3
         8W3yZWO+WEEUrqtoDUshPAugBwIwPFyL2bl9N0KHnUHnbtOpp9T16k9b6DQtRsain4L8
         Crsp6HAu344bQd6uAjJ4xx0FmPWXVPZADUVBWawOjompCrk4VlS5ErZyw8q7+TDtru9i
         PahhqSAN95FZaltR4mM5QGQ0GulD1hPf80mKosiYKScYPX4siyPHNKvJVq1nGbBLC4Dn
         l+9nzjFp3aOsx7mLRmD5T+HwRDvtHoPd65Kno4JIYH25FIkobQVrdZ+KIZQnZ+Ywgm8k
         KnAw==
X-Gm-Message-State: AOAM531MoJ1QIJHUiWlRuSaYcpAkFtQi5xLJ8hN3ufFboe33tW4jkEdg
	AwcqH/rgrbtCt6xtQNh0//qXxu9YLUTJ+FXoPe8=
X-Google-Smtp-Source: ABdhPJyzWNsJ7ScpHzJDMDmxpcmfJLbKNdWIIAodbqImc6KC0VK+oNgkRydrV8wTWOXm1+nOaURd7afR1ivOvcLqGT8=
X-Received: by 2002:a92:1a43:: with SMTP id z3mr27913757ill.46.1634109389213;
 Wed, 13 Oct 2021 00:16:29 -0700 (PDT)
MIME-Version: 1.0
References: <20210922161405.140018-1-damien.hedde@greensocs.com> <20210922161405.140018-13-damien.hedde@greensocs.com>
In-Reply-To: <20210922161405.140018-13-damien.hedde@greensocs.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 13 Oct 2021 17:16:03 +1000
Message-ID: <CAKmqyKPWDL52kC23TgtpdEST_kvVjNWn3-j2YFORN457_cEwnw@mail.gmail.com>
Subject: Re: [RFC PATCH v2 12/16] add x-sysbus-mmio-map qmp command
To: Damien Hedde <damien.hedde@greensocs.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>, Peter Maydell <peter.maydell@linaro.org>, 
	"Michael S. Tsirkin" <mst@redhat.com>, David Hildenbrand <david@redhat.com>, Peter Xu <peterx@redhat.com>, 
	mirela.grujic@greensocs.com, Alistair Francis <Alistair.Francis@wdc.com>, 
	Gerd Hoffmann <kraxel@redhat.com>, Ani Sinha <ani@anisinha.ca>, Eric Blake <eblake@redhat.com>, 
	Stefano Stabellini <sstabellini@kernel.org>, "open list:X86" <xen-devel@lists.xenproject.org>, 
	Paul Durrant <paul@xen.org>, Markus Armbruster <armbru@redhat.com>, 
	Anthony Perard <anthony.perard@citrix.com>, 
	=?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
	Eduardo Habkost <ehabkost@redhat.com>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>, 
	Eric Auger <eric.auger@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	"open list:RISC-V" <qemu-riscv@nongnu.org>, =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
	Mark Burton <mark.burton@greensocs.com>, Edgar Iglesias <edgari@xilinx.com>, 
	Igor Mammedov <imammedo@redhat.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, Sep 23, 2021 at 2:26 AM Damien Hedde <damien.hedde@greensocs.com> wrote:
>
> This command allows to map an mmio region of sysbus device onto
> the system memory. Its behavior mimics the sysbus_mmio_map()
> function apart from the automatic unmap (the C function unmaps
> the region if it is already mapped).
> For the qmp function we consider it is an error to try to map
> an already mapped function. If unmapping is required, it is
> probably better to add a sysbus-mmip-unmap function.
>
> This command is still experimental (hence the x prefix), as it
> is related to the sysbus device creation through qmp commands.
>
> In future, we expect to have to handle the overlap/priority
> parameter but also multiple mapping of one mmio. For some
> devices, one mmio is mapped several times at different addresses on
> the bus (which is not supported by sysbus_mmio_map() function and
> requires the use of memory region aliases).

I think as is this is a good start. This is a useful feature!

>
> Signed-off-by: Damien Hedde <damien.hedde@greensocs.com>

Acked-by: Alistair Francis <alistair.francis@wdc.com>

> ---
>
> Note: this qmp command is required to be able to build a machine from
> scratch as there is no qmp-way of doing a memory mapping today.
>
> We've added the command into qapi/qdev.json section. It does not seem to
> have any really adequate section yet. Any idea ? should we create for
> example a new one: qapi/sysbus.json or qapi/memory.json ?

I would say leave it in qdev. We don't really want many more sysbus
commands, so qapi/sysbus.json doesn't need it's own file.

Alistair

> ---
>  qapi/qdev.json   | 21 +++++++++++++++++++++
>  hw/core/sysbus.c | 41 +++++++++++++++++++++++++++++++++++++++++
>  2 files changed, 62 insertions(+)
>
> diff --git a/qapi/qdev.json b/qapi/qdev.json
> index ad669ae175..dfc1104197 100644
> --- a/qapi/qdev.json
> +++ b/qapi/qdev.json
> @@ -125,3 +125,24 @@
>  ##
>  { 'event': 'DEVICE_DELETED',
>    'data': { '*device': 'str', 'path': 'str' } }
> +
> +##
> +# @x-sysbus-mmio-map:
> +#
> +# Map a sysbus device mmio onto the main system bus.
> +#
> +# @device: the device's QOM path
> +#
> +# @mmio: The mmio number to be mapped (defaults to 0).
> +#
> +# @addr: The base address for the mapping.
> +#
> +# Since: 6.2
> +#
> +# Returns: Nothing on success
> +#
> +##
> +
> +{ 'command': 'x-sysbus-mmio-map',
> +  'data': {'device': 'str', '*mmio': 'uint8', 'addr': 'uint64'},
> +  'allow-preconfig' : true }
> diff --git a/hw/core/sysbus.c b/hw/core/sysbus.c
> index aaae8e23cc..b0891f37b6 100644
> --- a/hw/core/sysbus.c
> +++ b/hw/core/sysbus.c
> @@ -23,6 +23,7 @@
>  #include "hw/sysbus.h"
>  #include "monitor/monitor.h"
>  #include "exec/address-spaces.h"
> +#include "qapi/qapi-commands-qdev.h"
>
>  static void sysbus_dev_print(Monitor *mon, DeviceState *dev, int indent);
>  static char *sysbus_get_fw_dev_path(DeviceState *dev);
> @@ -154,6 +155,46 @@ static void sysbus_mmio_map_common(SysBusDevice *dev, int n, hwaddr addr,
>      }
>  }
>
> +void qmp_x_sysbus_mmio_map(const char *device, bool has_mmio, uint8_t mmio,
> +                           uint64_t addr, Error **errp)
> +{
> +    Object *obj = object_resolve_path_type(device, TYPE_SYS_BUS_DEVICE, NULL);
> +    SysBusDevice *dev;
> +
> +    if (phase_get() != MACHINE_INIT_PHASE_INITIALIZED) {
> +        error_setg(errp, "The command is permitted only when "
> +                         "the machine is in initialized phase");
> +        return;
> +    }
> +
> +    if (obj == NULL) {
> +        error_setg(errp, "Device '%s' not found", device);
> +        return;
> +    }
> +
> +    dev = SYS_BUS_DEVICE(obj);
> +    if (!has_mmio) {
> +        mmio = 0;
> +    }
> +    if (mmio >= dev->num_mmio) {
> +        error_setg(errp, "MMIO index '%u' is out of range", mmio);
> +        return;
> +    }
> +
> +    if (dev->mmio[mmio].addr != (hwaddr)-1) {
> +        error_setg(errp, "MMIO index '%u' is already mapped", mmio);
> +        return;
> +    }
> +
> +    if (!memory_region_try_add_subregion(get_system_memory(), addr,
> +                                         dev->mmio[mmio].memory, 0,
> +                                         errp)) {
> +        return;
> +    }
> +
> +    dev->mmio[mmio].addr = addr;
> +}
> +
>  void sysbus_mmio_unmap(SysBusDevice *dev, int n)
>  {
>      assert(n >= 0 && n < dev->num_mmio);
> --
> 2.33.0
>
>

