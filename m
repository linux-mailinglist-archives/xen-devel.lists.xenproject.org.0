Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C4EA042AF84
	for <lists+xen-devel@lfdr.de>; Wed, 13 Oct 2021 00:09:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.207711.363612 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1maPxR-0003U6-1x; Tue, 12 Oct 2021 22:09:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 207711.363612; Tue, 12 Oct 2021 22:09:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1maPxQ-0003RW-Ul; Tue, 12 Oct 2021 22:09:12 +0000
Received: by outflank-mailman (input) for mailman id 207711;
 Tue, 12 Oct 2021 22:09:10 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=quuu=PA=gmail.com=alistair23@srs-us1.protection.inumbo.net>)
 id 1maPxO-0003RG-Qt
 for xen-devel@lists.xenproject.org; Tue, 12 Oct 2021 22:09:10 +0000
Received: from mail-io1-xd35.google.com (unknown [2607:f8b0:4864:20::d35])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f17d6988-d9f5-411b-a1c8-080451070c63;
 Tue, 12 Oct 2021 22:09:09 +0000 (UTC)
Received: by mail-io1-xd35.google.com with SMTP id r134so539455iod.11
 for <xen-devel@lists.xenproject.org>; Tue, 12 Oct 2021 15:09:09 -0700 (PDT)
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
X-Inumbo-ID: f17d6988-d9f5-411b-a1c8-080451070c63
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=A8tS+FAHb9od7Jib5DnZFG/AjAZmK7umWqwvEa27qRs=;
        b=KgJmrojIfIEoCIxkxm2pMhrD9TpGtoXxwR1poaKrLuSJGMMYye9D/Ag/6gIhZLwMqK
         QSnS0qgcs/nClxeGvvFml5xlJZ8fKFJL1NHDf3Ytb4dey7VvfMO3V+3TDrAUBSp3YdQc
         rbofhFzPIfc0Qz0/XArKCUn37t2da7sTf4b1aXdhk3Xlq1Smq1nbtV5bxTGwMxBpFHWR
         oxMJnuqDIt/p6TrixyF9DZbhiPPW2Ov7bocA62N1/KmbEjyRPTLmwBdRgvcBO1RRI3WP
         X6XzIJIch5MoxTaCLi6J+2br8EN+LXTHsgu1HgX+BYnNIx9o/KGFpZVEJppKSWLs08dk
         7pbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=A8tS+FAHb9od7Jib5DnZFG/AjAZmK7umWqwvEa27qRs=;
        b=iNirruqtTvJdodXLMMxm2fxFT+yauZrEKg2X3WySJZf0WPPzy2kc76f5oAdQ7phSeR
         Cb/OeCmyILEKLD1ORlZdQx/pDsZaUU2v8JfH/1hZU2dn+NEz7FsxoCkbFQr0IMEo+9yE
         Cfhy1pP/pmEeDl9bSiupZsrKAN8gFaXCmSIBdX5MvhDh72HwIqD7C/VfcFin5DJ7chNs
         jugyhtbFG5hbvrhtzlBsOOvGjO01UOdEoKLViw9FhHVVd3MPPPNPtmoSpenfjnj0IOZC
         M7kRR/0au3kXEW4bmReZaA7zrlWaR6DZqoLmZ3q0OFFIY1d0vIBt1/Y3rHBkWq8MAWJS
         FFeg==
X-Gm-Message-State: AOAM533J+Q7UNLYO2nL7WO41Ikg2BVwk67lcVf/kIh0w9uyRHN9SY0Pq
	YyB7ztjaOWGzVmatMWvX47H7IhVHiePnVXQxLCc=
X-Google-Smtp-Source: ABdhPJyjn2JGj0C1wSr86O4QoFZL5yrk8p7xpOhtz4Neo2WsSYDHKD/N6rnNIFBr0q08yMYNVeb0MWkdpiH1X0GVpjo=
X-Received: by 2002:a05:6602:2e8c:: with SMTP id m12mr7416731iow.91.1634076549426;
 Tue, 12 Oct 2021 15:09:09 -0700 (PDT)
MIME-Version: 1.0
References: <20210922161405.140018-1-damien.hedde@greensocs.com> <20210922161405.140018-3-damien.hedde@greensocs.com>
In-Reply-To: <20210922161405.140018-3-damien.hedde@greensocs.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 13 Oct 2021 08:08:43 +1000
Message-ID: <CAKmqyKN5JadUSb=-a5jn3Uz1WKj8Sb23buC0Nooa4mY4g7O=ew@mail.gmail.com>
Subject: Re: [RFC PATCH v2 02/16] qapi: Implement query-machine-phase QMP command
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

On Thu, Sep 23, 2021 at 2:20 AM Damien Hedde <damien.hedde@greensocs.com> wrote:
>
> From: Mirela Grujic <mirela.grujic@greensocs.com>
>
> The command returns current machine initialization phase.
> From now on, the MachineInitPhase enum is generated from the
> QAPI schema.
>
> Signed-off-by: Mirela Grujic <mirela.grujic@greensocs.com>

Acked-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  qapi/machine.json          | 56 ++++++++++++++++++++++++++++++++++++++
>  include/hw/qdev-core.h     | 30 ++------------------
>  hw/core/machine-qmp-cmds.c |  9 ++++++
>  hw/core/qdev.c             |  5 ++++
>  4 files changed, 72 insertions(+), 28 deletions(-)
>
> diff --git a/qapi/machine.json b/qapi/machine.json
> index 157712f006..969d37fb03 100644
> --- a/qapi/machine.json
> +++ b/qapi/machine.json
> @@ -1312,3 +1312,59 @@
>       '*cores': 'int',
>       '*threads': 'int',
>       '*maxcpus': 'int' } }
> +
> +##
> +# @MachineInitPhase:
> +#
> +# Enumeration of machine initialization phases.
> +#
> +# @no-machine: machine does not exist
> +#
> +# @machine-created: machine is created, but its accelerator is not
> +#
> +# @accel-created: accelerator is created, but the machine properties have not
> +#                 been validated and machine initialization is not done yet
> +#
> +# @initialized: machine is initialized, thus creating any embedded devices and
> +#               validating machine properties. Devices created at this time are
> +#               considered to be cold-plugged.
> +#
> +# @ready: QEMU is ready to start CPUs and devices created at this time are
> +#         considered to be hot-plugged. The monitor is not restricted to
> +#         "preconfig" commands.
> +#
> +# Since: 6.2
> +##
> +{ 'enum': 'MachineInitPhase',
> +  'data': [ 'no-machine', 'machine-created', 'accel-created', 'initialized',
> +            'ready' ] }
> +
> +##
> +# @MachineInitPhaseStatus:
> +#
> +# Information about machine initialization phase
> +#
> +# @phase: the machine initialization phase
> +#
> +# Since: 6.2
> +##
> +{ 'struct': 'MachineInitPhaseStatus',
> +  'data': { 'phase': 'MachineInitPhase' } }
> +
> +##
> +# @query-machine-phase:
> +#
> +# Return machine initialization phase
> +#
> +# Since: 6.2
> +#
> +# Returns: MachineInitPhaseStatus
> +#
> +# Example:
> +#
> +# -> { "execute": "query-machine-phase" }
> +# <- { "return": { "phase": "initialized" } }
> +#
> +##
> +{ 'command': 'query-machine-phase', 'returns': 'MachineInitPhaseStatus',
> +             'allow-preconfig': true }
> diff --git a/include/hw/qdev-core.h b/include/hw/qdev-core.h
> index 859fd913bb..800eda8f54 100644
> --- a/include/hw/qdev-core.h
> +++ b/include/hw/qdev-core.h
> @@ -1,6 +1,7 @@
>  #ifndef QDEV_CORE_H
>  #define QDEV_CORE_H
>
> +#include "qapi/qapi-types-machine.h"
>  #include "qemu/queue.h"
>  #include "qemu/bitmap.h"
>  #include "qemu/rcu.h"
> @@ -839,35 +840,8 @@ void device_listener_unregister(DeviceListener *listener);
>   */
>  bool qdev_should_hide_device(QemuOpts *opts);
>
> -typedef enum MachineInitPhase {
> -    /* current_machine is NULL.  */
> -    MACHINE_INIT_PHASE_NO_MACHINE,
> -
> -    /* current_machine is not NULL, but current_machine->accel is NULL.  */
> -    MACHINE_INIT_PHASE_MACHINE_CREATED,
> -
> -    /*
> -     * current_machine->accel is not NULL, but the machine properties have
> -     * not been validated and machine_class->init has not yet been called.
> -     */
> -    MACHINE_INIT_PHASE_ACCEL_CREATED,
> -
> -    /*
> -     * machine_class->init has been called, thus creating any embedded
> -     * devices and validating machine properties.  Devices created at
> -     * this time are considered to be cold-plugged.
> -     */
> -    MACHINE_INIT_PHASE_INITIALIZED,
> -
> -    /*
> -     * QEMU is ready to start CPUs and devices created at this time
> -     * are considered to be hot-plugged.  The monitor is not restricted
> -     * to "preconfig" commands.
> -     */
> -    MACHINE_INIT_PHASE_READY,
> -} MachineInitPhase;
> -
>  extern bool phase_check(MachineInitPhase phase);
>  extern void phase_advance(MachineInitPhase phase);
> +extern MachineInitPhase phase_get(void);
>
>  #endif
> diff --git a/hw/core/machine-qmp-cmds.c b/hw/core/machine-qmp-cmds.c
> index 52168a3771..d3b9a04855 100644
> --- a/hw/core/machine-qmp-cmds.c
> +++ b/hw/core/machine-qmp-cmds.c
> @@ -204,3 +204,12 @@ MemdevList *qmp_query_memdev(Error **errp)
>      object_child_foreach(obj, query_memdev, &list);
>      return list;
>  }
> +
> +MachineInitPhaseStatus *qmp_query_machine_phase(Error **errp)
> +{
> +    MachineInitPhaseStatus *status = g_malloc0(sizeof(*status));
> +
> +    status->phase = phase_get();
> +
> +    return status;
> +}
> diff --git a/hw/core/qdev.c b/hw/core/qdev.c
> index c5fc704f55..d83f1c029a 100644
> --- a/hw/core/qdev.c
> +++ b/hw/core/qdev.c
> @@ -1150,6 +1150,11 @@ void phase_advance(MachineInitPhase phase)
>      machine_phase = phase;
>  }
>
> +MachineInitPhase phase_get(void)
> +{
> +    return machine_phase;
> +}
> +
>  static const TypeInfo device_type_info = {
>      .name = TYPE_DEVICE,
>      .parent = TYPE_OBJECT,
> --
> 2.33.0
>
>

