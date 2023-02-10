Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 596986925B2
	for <lists+xen-devel@lfdr.de>; Fri, 10 Feb 2023 19:47:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.493547.763525 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pQYQ4-0002zW-Kg; Fri, 10 Feb 2023 18:46:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 493547.763525; Fri, 10 Feb 2023 18:46:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pQYQ4-0002wy-G8; Fri, 10 Feb 2023 18:46:48 +0000
Received: by outflank-mailman (input) for mailman id 493547;
 Fri, 10 Feb 2023 18:46:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qATP=6G=ens-lyon.org=samuel.thibault@bounce.ens-lyon.org>)
 id 1pQYQ3-0002uf-60
 for xen-devel@lists.xenproject.org; Fri, 10 Feb 2023 18:46:47 +0000
Received: from sonata.ens-lyon.org (domu-toccata.ens-lyon.fr [140.77.166.138])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4303baa0-a973-11ed-93b5-47a8fe42b414;
 Fri, 10 Feb 2023 19:46:43 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by sonata.ens-lyon.org (Postfix) with ESMTP id B74222015E;
 Fri, 10 Feb 2023 19:46:42 +0100 (CET)
Received: from sonata.ens-lyon.org ([127.0.0.1])
 by localhost (sonata.ens-lyon.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CiSvYmAxpibe; Fri, 10 Feb 2023 19:46:42 +0100 (CET)
Received: from begin (lfbn-bor-1-1163-184.w92-158.abo.wanadoo.fr
 [92.158.138.184])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by sonata.ens-lyon.org (Postfix) with ESMTPSA id 7736720152;
 Fri, 10 Feb 2023 19:46:42 +0100 (CET)
Received: from samy by begin with local (Exim 4.96)
 (envelope-from <samuel.thibault@ens-lyon.org>) id 1pQYPy-006gPP-0Q;
 Fri, 10 Feb 2023 19:46:42 +0100
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
X-Inumbo-ID: 4303baa0-a973-11ed-93b5-47a8fe42b414
Date: Fri, 10 Feb 2023 19:46:42 +0100
From: Samuel Thibault <samuel.thibault@ens-lyon.org>
To: Juergen Gross <jgross@suse.com>
Cc: minios-devel@lists.xenproject.org, xen-devel@lists.xenproject.org,
	wl@xen.org
Subject: Re: [PATCH v2 4/7] Mini-OS: add 9pfs frontend
Message-ID: <20230210184642.7pliosfbx7us2va7@begin>
Mail-Followup-To: Samuel Thibault <samuel.thibault@ens-lyon.org>,
	Juergen Gross <jgross@suse.com>, minios-devel@lists.xenproject.org,
	xen-devel@lists.xenproject.org, wl@xen.org
References: <20230210104628.14374-1-jgross@suse.com>
 <20230210104628.14374-5-jgross@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230210104628.14374-5-jgross@suse.com>
Organization: I am not organized
User-Agent: NeoMutt/20170609 (1.8.3)

Juergen Gross, le ven. 10 févr. 2023 11:46:25 +0100, a ecrit:
> Add a frontend for the 9pfs PV device. For now add only the code needed
> to connect to the backend and the related disconnect functionality. The
> 9pfs protocol support will be added later.
> 
> Due to its nature (ability to access files) the whole code is guarded
> by "#ifdef HAVE_LIBC".
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>

Reviewed-by: Samuel Thibault <samuel.thibault@ens-lyon.org>

> ---
> V2:
> - add better error handling to version parsing (Samuel Thibault)
> ---
>  9pfront.c                     | 286 ++++++++++++++++++++++++++++++++++
>  Config.mk                     |   1 +
>  Makefile                      |   1 +
>  arch/x86/testbuild/all-no     |   1 +
>  arch/x86/testbuild/all-yes    |   1 +
>  arch/x86/testbuild/newxen-yes |   1 +
>  include/9pfront.h             |   7 +
>  7 files changed, 298 insertions(+)
>  create mode 100644 9pfront.c
>  create mode 100644 include/9pfront.h
> 
> diff --git a/9pfront.c b/9pfront.c
> new file mode 100644
> index 00000000..89ecb3a1
> --- /dev/null
> +++ b/9pfront.c
> @@ -0,0 +1,286 @@
> +/*
> + * Minimal 9pfs PV frontend for Mini-OS.
> + * Copyright (c) 2023 Juergen Gross, SUSE Software Solution GmbH
> + */
> +
> +#include <mini-os/os.h>
> +#include <mini-os/lib.h>
> +#include <mini-os/events.h>
> +#include <mini-os/gnttab.h>
> +#include <mini-os/xenbus.h>
> +#include <mini-os/xmalloc.h>
> +#include <errno.h>
> +#include <xen/io/9pfs.h>
> +#include <mini-os/9pfront.h>
> +
> +#ifdef HAVE_LIBC
> +struct dev_9pfs {
> +    int id;
> +    char nodename[20];
> +    unsigned int dom;
> +    char *backend;
> +
> +    char *tag;
> +    const char *mnt;
> +
> +    struct xen_9pfs_data_intf *intf;
> +    struct xen_9pfs_data data;
> +    RING_IDX prod_pvt_out;
> +    RING_IDX cons_pvt_in;
> +
> +    grant_ref_t ring_ref;
> +    evtchn_port_t evtchn;
> +    unsigned int ring_order;
> +    xenbus_event_queue events;
> +};
> +
> +#define DEFAULT_9PFS_RING_ORDER  4
> +
> +static unsigned int ftype_9pfs;
> +
> +static void intr_9pfs(evtchn_port_t port, struct pt_regs *regs, void *data)
> +{
> +}
> +
> +static int open_9pfs(struct mount_point *mnt, const char *pathname, int flags,
> +                     mode_t mode)
> +{
> +    errno = ENOSYS;
> +
> +    return -1;
> +}
> +
> +static void free_9pfront(struct dev_9pfs *dev)
> +{
> +    unsigned int i;
> +
> +    if ( dev->data.in && dev->intf )
> +    {
> +        for ( i = 0; i < (1 << dev->ring_order); i++ )
> +            gnttab_end_access(dev->intf->ref[i]);
> +        free_pages(dev->data.in, dev->ring_order);
> +    }
> +    unbind_evtchn(dev->evtchn);
> +    gnttab_end_access(dev->ring_ref);
> +    free_page(dev->intf);
> +    free(dev->backend);
> +    free(dev->tag);
> +    free(dev);
> +}
> +
> +void *init_9pfront(unsigned int id, const char *mnt)
> +{
> +    struct dev_9pfs *dev;
> +    char *msg;
> +    char *reason = "";
> +    xenbus_transaction_t xbt;
> +    int retry = 1;
> +    char bepath[64] = { 0 };
> +    XenbusState state;
> +    unsigned int i;
> +    void *addr;
> +    char *version;
> +    char *v;
> +
> +    printk("9pfsfront add %u, for mount at %s\n", id, mnt);
> +    dev = malloc(sizeof(*dev));
> +    memset(dev, 0, sizeof(*dev));
> +    snprintf(dev->nodename, sizeof(dev->nodename), "device/9pfs/%u", id);
> +    dev->id = id;
> +
> +    msg = xenbus_read_unsigned(XBT_NIL, dev->nodename, "backend-id", &dev->dom);
> +    if ( msg )
> +        goto err;
> +    msg = xenbus_read_string(XBT_NIL, dev->nodename, "backend", &dev->backend);
> +    if ( msg )
> +        goto err;
> +    msg = xenbus_read_string(XBT_NIL, dev->nodename, "tag", &dev->tag);
> +    if ( msg )
> +        goto err;
> +
> +    snprintf(bepath, sizeof(bepath), "%s/state", dev->backend);
> +    free(xenbus_watch_path_token(XBT_NIL, bepath, bepath, &dev->events));
> +    state = xenbus_read_integer(bepath);
> +    while ( msg == NULL && state < XenbusStateInitWait )
> +        msg = xenbus_wait_for_state_change(bepath, &state, &dev->events);
> +    if ( msg || state != XenbusStateInitWait )
> +    {
> +        reason = "illegal backend state";
> +        goto err;
> +    }
> +
> +    msg = xenbus_read_unsigned(XBT_NIL, dev->backend, "max-ring-page-order",
> +                               &dev->ring_order);
> +    if ( msg )
> +        goto err;
> +    if ( dev->ring_order > DEFAULT_9PFS_RING_ORDER )
> +        dev->ring_order = DEFAULT_9PFS_RING_ORDER;
> +
> +    msg = xenbus_read_string(XBT_NIL, dev->backend, "versions", &version);
> +    if ( msg )
> +        goto err;
> +    for ( v = version; *v; v++ )
> +    {
> +        if ( strtoul(v, &v, 10) == 1 && (*v == ',' || *v == 0) )
> +        {
> +            v = NULL;
> +            break;
> +        }
> +        if ( *v != ',' && *v != 0 )
> +        {
> +            reason = "backend published illegal version string";
> +            free(version);
> +            goto err;
> +        }
> +    }
> +    free(version);
> +    if ( v )
> +    {
> +        reason = "backend doesn't support version 1";
> +        goto err;
> +    }
> +
> +    dev->ring_ref = gnttab_alloc_and_grant((void **)&dev->intf);
> +    memset(dev->intf, 0, PAGE_SIZE);
> +    if ( evtchn_alloc_unbound(dev->dom, intr_9pfs, dev, &dev->evtchn) )
> +    {
> +        reason = "no event channel";
> +        goto err;
> +    }
> +    dev->intf->ring_order = dev->ring_order;
> +    dev->data.in = (void *)alloc_pages(dev->ring_order);
> +    dev->data.out = dev->data.in + XEN_FLEX_RING_SIZE(dev->ring_order);
> +    for ( i = 0; i < (1 << dev->ring_order); i++ )
> +    {
> +        addr = dev->data.in + i * PAGE_SIZE;
> +        dev->intf->ref[i] = gnttab_grant_access(dev->dom, virt_to_mfn(addr), 0);
> +    }
> +
> +    while ( retry )
> +    {
> +        msg = xenbus_transaction_start(&xbt);
> +        if ( msg )
> +        {
> +            free(msg);
> +            msg = NULL;
> +            reason = "starting transaction";
> +            goto err;
> +        }
> +
> +        msg = xenbus_printf(xbt, dev->nodename, "version", "%u", 1);
> +        if ( msg )
> +            goto err_tr;
> +        msg = xenbus_printf(xbt, dev->nodename, "num-rings", "%u", 1);
> +        if ( msg )
> +            goto err_tr;
> +        msg = xenbus_printf(xbt, dev->nodename, "ring-ref0", "%u",
> +                            dev->ring_ref);
> +        if ( msg )
> +            goto err_tr;
> +        msg = xenbus_printf(xbt, dev->nodename, "event-channel-0", "%u",
> +                            dev->evtchn);
> +        if ( msg )
> +            goto err_tr;
> +        msg = xenbus_printf(xbt, dev->nodename, "state", "%u",
> +                            XenbusStateInitialised);
> +        if ( msg )
> +            goto err_tr;
> +
> +        free(xenbus_transaction_end(xbt, 0, &retry));
> +    }
> +
> +    state = xenbus_read_integer(bepath);
> +    while ( msg == NULL && state < XenbusStateConnected )
> +        msg = xenbus_wait_for_state_change(bepath, &state, &dev->events);
> +    if ( msg || state != XenbusStateConnected )
> +    {
> +        reason = "illegal backend state";
> +        goto err;
> +    }
> +
> +    msg = xenbus_printf(XBT_NIL, dev->nodename, "state", "%u",
> +                        XenbusStateConnected);
> +    if ( msg )
> +        goto err;
> +
> +    unmask_evtchn(dev->evtchn);
> +
> +    dev->mnt = mnt;
> +    if ( mount(dev->mnt, dev, open_9pfs) )
> +    {
> +        reason = "mount failed";
> +        goto err;
> +    }
> +
> +    return dev;
> +
> + err_tr:
> +    free(xenbus_transaction_end(xbt, 1, &retry));
> +
> + err:
> +    if ( bepath[0] )
> +        free(xenbus_unwatch_path_token(XBT_NIL, bepath, bepath));
> +    if ( msg )
> +        printk("9pfsfront add %u failed, error %s accessing Xenstore\n",
> +               id, msg);
> +    else
> +        printk("9pfsfront add %u failed, %s\n", id, reason);
> +    free_9pfront(dev);
> +    free(msg);
> +    return NULL;
> +}
> +
> +void shutdown_9pfront(void *dev)
> +{
> +    struct dev_9pfs *dev9p = dev;
> +    char bepath[64];
> +    XenbusState state;
> +    char *msg;
> +    char *reason = "";
> +
> +    umount(dev9p->mnt);
> +    snprintf(bepath, sizeof(bepath), "%s/state", dev9p->backend);
> +
> +    msg = xenbus_printf(XBT_NIL, dev9p->nodename, "state", "%u",
> +                        XenbusStateClosing);
> +    if ( msg )
> +        goto err;
> +
> +    state = xenbus_read_integer(bepath);
> +    while ( msg == NULL && state < XenbusStateClosing)
> +        msg = xenbus_wait_for_state_change(bepath, &state, &dev9p->events);
> +    if ( msg || state != XenbusStateClosing )
> +    {
> +        reason = "illegal backend state";
> +        goto err;
> +    }
> +
> +    msg = xenbus_printf(XBT_NIL, dev9p->nodename, "state", "%u",
> +                        XenbusStateClosed);
> +    if ( msg )
> +        goto err;
> +
> +    free_9pfront(dev9p);
> +
> +    return;
> +
> + err:
> +    if ( msg )
> +        printk("9pfsfront shutdown %u failed, error %s accessing Xenstore\n",
> +               dev9p->id, msg);
> +    else
> +        printk("9pfsfront shutdown %u failed, %s\n", dev9p->id, reason);
> +    free(msg);
> +}
> +
> +static const struct file_ops ops_9pfs = {
> +    .name = "9pfs",
> +};
> +
> +__attribute__((constructor))
> +static void initialize_9pfs(void)
> +{
> +    ftype_9pfs = alloc_file_type(&ops_9pfs);
> +}
> +
> +#endif /* HAVE_LIBC */
> diff --git a/Config.mk b/Config.mk
> index 1a24b30e..677e93df 100644
> --- a/Config.mk
> +++ b/Config.mk
> @@ -187,6 +187,7 @@ CONFIG-n += CONFIG_QEMU_XS_ARGS
>  CONFIG-n += CONFIG_TEST
>  CONFIG-n += CONFIG_PCIFRONT
>  CONFIG-n += CONFIG_TPMFRONT
> +CONFIG-n += CONFIG_9PFRONT
>  CONFIG-n += CONFIG_TPM_TIS
>  CONFIG-n += CONFIG_TPMBACK
>  CONFIG-n += CONFIG_BALLOON
> diff --git a/Makefile b/Makefile
> index 747c7c01..7ee181a2 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -39,6 +39,7 @@ SUBDIRS := lib
>  src-$(CONFIG_BLKFRONT) += blkfront.c
>  src-$(CONFIG_CONSFRONT) += consfront.c
>  src-$(CONFIG_TPMFRONT) += tpmfront.c
> +src-$(CONFIG_9PFRONT) += 9pfront.c
>  src-$(CONFIG_TPM_TIS) += tpm_tis.c
>  src-$(CONFIG_TPMBACK) += tpmback.c
>  src-y += console.c
> diff --git a/arch/x86/testbuild/all-no b/arch/x86/testbuild/all-no
> index f79a1012..5b3e99ed 100644
> --- a/arch/x86/testbuild/all-no
> +++ b/arch/x86/testbuild/all-no
> @@ -12,6 +12,7 @@ CONFIG_NETFRONT = n
>  CONFIG_FBFRONT = n
>  CONFIG_KBDFRONT = n
>  CONFIG_CONSFRONT = n
> +CONFIG_9PFRONT = n
>  CONFIG_XENBUS = n
>  CONFIG_LIBXS = n
>  CONFIG_LWIP = n
> diff --git a/arch/x86/testbuild/all-yes b/arch/x86/testbuild/all-yes
> index faa3af32..8ae489a4 100644
> --- a/arch/x86/testbuild/all-yes
> +++ b/arch/x86/testbuild/all-yes
> @@ -12,6 +12,7 @@ CONFIG_NETFRONT = y
>  CONFIG_FBFRONT = y
>  CONFIG_KBDFRONT = y
>  CONFIG_CONSFRONT = y
> +CONFIG_9PFRONT = y
>  CONFIG_XENBUS = y
>  CONFIG_LIBXS = y
>  CONFIG_BALLOON = y
> diff --git a/arch/x86/testbuild/newxen-yes b/arch/x86/testbuild/newxen-yes
> index dc83e670..ee27a328 100644
> --- a/arch/x86/testbuild/newxen-yes
> +++ b/arch/x86/testbuild/newxen-yes
> @@ -12,6 +12,7 @@ CONFIG_NETFRONT = y
>  CONFIG_FBFRONT = y
>  CONFIG_KBDFRONT = y
>  CONFIG_CONSFRONT = y
> +CONFIG_9PFRONT = y
>  CONFIG_XENBUS = y
>  CONFIG_LIBXS = y
>  CONFIG_BALLOON = y
> diff --git a/include/9pfront.h b/include/9pfront.h
> new file mode 100644
> index 00000000..722ec564
> --- /dev/null
> +++ b/include/9pfront.h
> @@ -0,0 +1,7 @@
> +#ifndef __9PFRONT_H__
> +#define __9PFRONT_H__
> +
> +void *init_9pfront(unsigned int id, const char *mnt);
> +void shutdown_9pfront(void *dev);
> +
> +#endif /* __9PFRONT_H__ */
> -- 
> 2.35.3
> 

-- 
Samuel
---
Pour une évaluation indépendante, transparente et rigoureuse !
Je soutiens la Commission d'Évaluation de l'Inria.

