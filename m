Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D0A2729358D
	for <lists+xen-devel@lfdr.de>; Tue, 20 Oct 2020 09:14:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.8940.24075 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kUlq9-0002nm-Vv; Tue, 20 Oct 2020 07:13:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 8940.24075; Tue, 20 Oct 2020 07:13:49 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kUlq9-0002nN-Sb; Tue, 20 Oct 2020 07:13:49 +0000
Received: by outflank-mailman (input) for mailman id 8940;
 Tue, 20 Oct 2020 07:13:48 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dZuW=D3=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1kUlq8-0002nI-HV
 for xen-devel@lists.xenproject.org; Tue, 20 Oct 2020 07:13:48 +0000
Received: from mail-ej1-x643.google.com (unknown [2a00:1450:4864:20::643])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 31b43878-27ea-435e-ab4e-6769c12a6027;
 Tue, 20 Oct 2020 07:13:46 +0000 (UTC)
Received: by mail-ej1-x643.google.com with SMTP id z5so1129026ejw.7
 for <xen-devel@lists.xenproject.org>; Tue, 20 Oct 2020 00:13:46 -0700 (PDT)
Received: from CBGR90WXYV0 (54-240-197-238.amazon.com. [54.240.197.238])
 by smtp.gmail.com with ESMTPSA id s29sm1265294edc.30.2020.10.20.00.13.44
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 20 Oct 2020 00:13:45 -0700 (PDT)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=dZuW=D3=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
	id 1kUlq8-0002nI-HV
	for xen-devel@lists.xenproject.org; Tue, 20 Oct 2020 07:13:48 +0000
X-Inumbo-ID: 31b43878-27ea-435e-ab4e-6769c12a6027
Received: from mail-ej1-x643.google.com (unknown [2a00:1450:4864:20::643])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 31b43878-27ea-435e-ab4e-6769c12a6027;
	Tue, 20 Oct 2020 07:13:46 +0000 (UTC)
Received: by mail-ej1-x643.google.com with SMTP id z5so1129026ejw.7
        for <xen-devel@lists.xenproject.org>; Tue, 20 Oct 2020 00:13:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
         :mime-version:content-transfer-encoding:thread-index
         :content-language;
        bh=impcEQiRjn947J8FDCa/SgQe5WbnVHLHszymxM0Eh9E=;
        b=jUdCO9glnO34bN0rvLBwXGNZjJA1jtM5p1/3Vt+mepbDxsUFLoza1fcUIO6bqYsrbl
         VL9rQA6XxWjjqiKY4MuIQ9ewbhkgSHYOTgblgz2gBbDQPHgGd4cY0Vcmk0hivpQGas9p
         xO60uGszo2PTWurB7rVFNbAQjzGyOIaSWvtT0KeRsmycv6czL/XeN6cw24p/Ltgdi6AC
         AwLdpKkrLnKf8DTH3Mn02EdxxSu5X7DIDBAC2S0tqOTchrKiXlVDifjWSt6lXs68TiPL
         N9l5hGBlqzgMQBbbSvStNVw+vLiR31ZM8mNCCW//bn1CokuAfbLyHlmDKXaSfIFxGC3z
         uOSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
         :subject:date:message-id:mime-version:content-transfer-encoding
         :thread-index:content-language;
        bh=impcEQiRjn947J8FDCa/SgQe5WbnVHLHszymxM0Eh9E=;
        b=ScYnYpUUY1OFbo12nO4krHFS95lCctNAhjCNQwZhkQKvREheDERE5KIC1Cucnc/fxF
         PAzwZcyr9xKWjOowYFkYf0lPevmZv8FfjIEj3ijjcV1aeQ9fDawcIkQ7bSK6bB1RPDkQ
         8AVDs3yuf+ReQsqhX1J0PTRe+cIAEO76KV/Ko0i8GC9LFfuVPZBl05wfrmWxVU2i/FZn
         GBHJcKmqnobwNnhhul/K61LNOig9tbu1LfaH5ENncgTSjdsBAe7ospBbZ/i9A+t1jBuM
         dEHYR+UvtduBDfvo5qHfj8nZ2as5fcR5GFXAU0LIpXGPBjPwzHypeRIKReD64TsmKlqT
         C2pQ==
X-Gm-Message-State: AOAM532b76+mHu3Ty41FHeS95oHPnG22NQMvwk176j2pCEBL3lVykHKW
	H8SfBYp5+asjkdsbZA+SZ5i2KHUE/neTsg==
X-Google-Smtp-Source: ABdhPJysn9VmtZYYsKidsB9RaH2tHJjz1F9ZB4QE7/9aEy6SvUwi06J6irHsUr0zlvUtOJYCbKAOaA==
X-Received: by 2002:a17:906:388d:: with SMTP id q13mr1686209ejd.92.1603178025764;
        Tue, 20 Oct 2020 00:13:45 -0700 (PDT)
Received: from CBGR90WXYV0 (54-240-197-238.amazon.com. [54.240.197.238])
        by smtp.gmail.com with ESMTPSA id s29sm1265294edc.30.2020.10.20.00.13.44
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 20 Oct 2020 00:13:45 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
Reply-To: <paul@xen.org>
To: "'Oleksandr Tyshchenko'" <olekstysh@gmail.com>,
	<xen-devel@lists.xenproject.org>
Cc: "'Oleksandr Tyshchenko'" <oleksandr_tyshchenko@epam.com>,
	"'Jan Beulich'" <jbeulich@suse.com>,
	"'Andrew Cooper'" <andrew.cooper3@citrix.com>,
	=?utf-8?Q?'Roger_Pau_Monn=C3=A9'?= <roger.pau@citrix.com>,
	"'Julien Grall'" <julien@xen.org>,
	"'Stefano Stabellini'" <sstabellini@kernel.org>,
	"'Wei Liu'" <wl@xen.org>,
	"'Julien Grall'" <julien.grall@arm.com>
References: <1602780274-29141-1-git-send-email-olekstysh@gmail.com> <1602780274-29141-2-git-send-email-olekstysh@gmail.com>
In-Reply-To: <1602780274-29141-2-git-send-email-olekstysh@gmail.com>
Subject: RE: [PATCH V2 01/23] x86/ioreq: Prepare IOREQ feature for making it common
Date: Tue, 20 Oct 2020 08:13:43 +0100
Message-ID: <003c01d6a6b0$8c418f50$a4c4adf0$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQFqp5MaNUj6MKEiN9RM6S6pfA5bVAH3I7RCqmhWqiA=
Content-Language: en-gb

> -----Original Message-----
> From: Oleksandr Tyshchenko <olekstysh@gmail.com>
> Sent: 15 October 2020 17:44
> To: xen-devel@lists.xenproject.org
> Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>; Paul Durrant =
<paul@xen.org>; Jan Beulich
> <jbeulich@suse.com>; Andrew Cooper <andrew.cooper3@citrix.com>; Roger =
Pau Monn=C3=A9
> <roger.pau@citrix.com>; Julien Grall <julien@xen.org>; Stefano =
Stabellini <sstabellini@kernel.org>;
> Wei Liu <wl@xen.org>; Julien Grall <julien.grall@arm.com>
> Subject: [PATCH V2 01/23] x86/ioreq: Prepare IOREQ feature for making =
it common
>=20
> From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>=20
> As a lot of x86 code can be re-used on Arm later on, this
> patch makes some preparation to x86/hvm/ioreq.c before moving
> to the common code. This way we will get a verbatim copy for
> a code movement in subsequent patch (arch/x86/hvm/ioreq.c
> will be *just* renamed to common/ioreq).
>=20
> This patch does the following:
> 1. Introduce *inline* arch_hvm_ioreq_init(), arch_hvm_ioreq_destroy(),
>    arch_hvm_io_completion(), arch_hvm_destroy_ioreq_server() and
>    hvm_ioreq_server_get_type_addr() to abstract arch specific =
materials.
> 2  Make hvm_map_mem_type_to_ioreq_server() *inline*. It is not going
>    to be called from the common code.
> 3. Make get_ioreq_server() global. It is going to be called from
>    a few places.
> 4. Add IOREQ_STATUS_* #define-s and update candidates for moving.
> 5. Re-order #include-s alphabetically.
>=20
> This support is going to be used on Arm to be able run device
> emulator outside of Xen hypervisor.
>=20
> Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> CC: Julien Grall <julien.grall@arm.com>
>=20
> ---
> Please note, this is a split/cleanup/hardening of Julien's PoC:
> "Add support for Guest IO forwarding to a device emulator"
>=20
> Changes RFC -> V1:
>    - new patch, was split from:
>      "[RFC PATCH V1 01/12] hvm/ioreq: Make x86's IOREQ feature common"
>    - fold the check of p->type into hvm_get_ioreq_server_range_type()
>      and make it return success/failure
>    - remove relocate_portio_handler() call from =
arch_hvm_ioreq_destroy()
>      in arch/x86/hvm/ioreq.c
>    - introduce =
arch_hvm_destroy_ioreq_server()/arch_handle_hvm_io_completion()
>=20
> Changes V1 -> V2:
>    - update patch description
>    - make arch functions inline and put them into arch header
>      to achieve a truly rename by the subsequent patch
>    - return void in arch_hvm_destroy_ioreq_server()
>    - return bool in arch_hvm_ioreq_destroy()
>    - bring relocate_portio_handler() back to arch_hvm_ioreq_destroy()
>    - rename IOREQ_IO* to IOREQ_STATUS*
>    - remove *handle* from arch_handle_hvm_io_completion()
>    - re-order #include-s alphabetically
>    - rename hvm_get_ioreq_server_range_type() to =
hvm_ioreq_server_get_type_addr()
>      and add "const" to several arguments
> ---
>  xen/arch/x86/hvm/ioreq.c        | 153 =
+++++--------------------------------
>  xen/include/asm-x86/hvm/ioreq.h | 165 =
+++++++++++++++++++++++++++++++++++++++-
>  2 files changed, 184 insertions(+), 134 deletions(-)
>=20
> diff --git a/xen/arch/x86/hvm/ioreq.c b/xen/arch/x86/hvm/ioreq.c
> index 1cc27df..d3433d7 100644
> --- a/xen/arch/x86/hvm/ioreq.c
> +++ b/xen/arch/x86/hvm/ioreq.c
> @@ -1,5 +1,5 @@
>  /*
> - * hvm/io.c: hardware virtual machine I/O emulation
> + * ioreq.c: hardware virtual machine I/O emulation
>   *
>   * Copyright (c) 2016 Citrix Systems Inc.
>   *
> @@ -17,21 +17,18 @@
>   */
>=20
>  #include <xen/ctype.h>
> +#include <xen/domain.h>
> +#include <xen/event.h>
>  #include <xen/init.h>
> +#include <xen/irq.h>
>  #include <xen/lib.h>
> -#include <xen/trace.h>
> +#include <xen/paging.h>
>  #include <xen/sched.h>
> -#include <xen/irq.h>
>  #include <xen/softirq.h>
> -#include <xen/domain.h>
> -#include <xen/event.h>
> -#include <xen/paging.h>
> +#include <xen/trace.h>
>  #include <xen/vpci.h>
>=20
> -#include <asm/hvm/emulate.h>
> -#include <asm/hvm/hvm.h>
>  #include <asm/hvm/ioreq.h>
> -#include <asm/hvm/vmx/vmx.h>
>=20
>  #include <public/hvm/ioreq.h>
>  #include <public/hvm/params.h>
> @@ -48,8 +45,8 @@ static void set_ioreq_server(struct domain *d, =
unsigned int id,
>  #define GET_IOREQ_SERVER(d, id) \
>      (d)->arch.hvm.ioreq_server.server[id]
>=20
> -static struct hvm_ioreq_server *get_ioreq_server(const struct domain =
*d,
> -                                                 unsigned int id)
> +struct hvm_ioreq_server *get_ioreq_server(const struct domain *d,
> +                                          unsigned int id)
>  {
>      if ( id >=3D MAX_NR_IOREQ_SERVERS )
>          return NULL;
> @@ -209,19 +206,8 @@ bool handle_hvm_io_completion(struct vcpu *v)
>          return handle_pio(vio->io_req.addr, vio->io_req.size,
>                            vio->io_req.dir);
>=20
> -    case HVMIO_realmode_completion:
> -    {
> -        struct hvm_emulate_ctxt ctxt;
> -
> -        hvm_emulate_init_once(&ctxt, NULL, guest_cpu_user_regs());
> -        vmx_realmode_emulate_one(&ctxt);
> -        hvm_emulate_writeback(&ctxt);
> -
> -        break;
> -    }
>      default:
> -        ASSERT_UNREACHABLE();
> -        break;
> +        return arch_hvm_io_completion(io_completion);
>      }
>=20
>      return true;
> @@ -855,7 +841,7 @@ int hvm_destroy_ioreq_server(struct domain *d, =
ioservid_t id)
>=20
>      domain_pause(d);
>=20
> -    p2m_set_ioreq_server(d, 0, s);
> +    arch_hvm_destroy_ioreq_server(s);
>=20
>      hvm_ioreq_server_disable(s);
>=20
> @@ -1080,54 +1066,6 @@ int hvm_unmap_io_range_from_ioreq_server(struct =
domain *d, ioservid_t id,
>      return rc;
>  }
>=20
> -/*
> - * Map or unmap an ioreq server to specific memory type. For now, =
only
> - * HVMMEM_ioreq_server is supported, and in the future new types can =
be
> - * introduced, e.g. HVMMEM_ioreq_serverX mapped to ioreq server X. =
And
> - * currently, only write operations are to be forwarded to an ioreq =
server.
> - * Support for the emulation of read operations can be added when an =
ioreq
> - * server has such requirement in the future.
> - */
> -int hvm_map_mem_type_to_ioreq_server(struct domain *d, ioservid_t id,
> -                                     uint32_t type, uint32_t flags)
> -{
> -    struct hvm_ioreq_server *s;
> -    int rc;
> -
> -    if ( type !=3D HVMMEM_ioreq_server )
> -        return -EINVAL;
> -
> -    if ( flags & ~XEN_DMOP_IOREQ_MEM_ACCESS_WRITE )
> -        return -EINVAL;
> -
> -    spin_lock_recursive(&d->arch.hvm.ioreq_server.lock);
> -
> -    s =3D get_ioreq_server(d, id);
> -
> -    rc =3D -ENOENT;
> -    if ( !s )
> -        goto out;
> -
> -    rc =3D -EPERM;
> -    if ( s->emulator !=3D current->domain )
> -        goto out;
> -
> -    rc =3D p2m_set_ioreq_server(d, flags, s);
> -
> - out:
> -    spin_unlock_recursive(&d->arch.hvm.ioreq_server.lock);
> -
> -    if ( rc =3D=3D 0 && flags =3D=3D 0 )
> -    {
> -        struct p2m_domain *p2m =3D p2m_get_hostp2m(d);
> -
> -        if ( read_atomic(&p2m->ioreq.entry_count) )
> -            p2m_change_entry_type_global(d, p2m_ioreq_server, =
p2m_ram_rw);
> -    }
> -
> -    return rc;
> -}
> -
>  int hvm_set_ioreq_server_state(struct domain *d, ioservid_t id,
>                                 bool enabled)
>  {
> @@ -1215,7 +1153,7 @@ void hvm_destroy_all_ioreq_servers(struct domain =
*d)
>      struct hvm_ioreq_server *s;
>      unsigned int id;
>=20
> -    if ( !relocate_portio_handler(d, 0xcf8, 0xcf8, 4) )
> +    if ( !arch_hvm_ioreq_destroy(d) )
>          return;
>=20
>      spin_lock_recursive(&d->arch.hvm.ioreq_server.lock);
> @@ -1243,50 +1181,13 @@ struct hvm_ioreq_server =
*hvm_select_ioreq_server(struct domain *d,
>                                                   ioreq_t *p)
>  {
>      struct hvm_ioreq_server *s;
> -    uint32_t cf8;
>      uint8_t type;
>      uint64_t addr;
>      unsigned int id;
>=20
> -    if ( p->type !=3D IOREQ_TYPE_COPY && p->type !=3D IOREQ_TYPE_PIO =
)
> +    if ( hvm_ioreq_server_get_type_addr(d, p, &type, &addr) )
>          return NULL;
>=20
> -    cf8 =3D d->arch.hvm.pci_cf8;
> -
> -    if ( p->type =3D=3D IOREQ_TYPE_PIO &&
> -         (p->addr & ~3) =3D=3D 0xcfc &&
> -         CF8_ENABLED(cf8) )
> -    {
> -        uint32_t x86_fam;
> -        pci_sbdf_t sbdf;
> -        unsigned int reg;
> -
> -        reg =3D hvm_pci_decode_addr(cf8, p->addr, &sbdf);
> -
> -        /* PCI config data cycle */
> -        type =3D XEN_DMOP_IO_RANGE_PCI;
> -        addr =3D ((uint64_t)sbdf.sbdf << 32) | reg;
> -        /* AMD extended configuration space access? */
> -        if ( CF8_ADDR_HI(cf8) &&
> -             d->arch.cpuid->x86_vendor =3D=3D X86_VENDOR_AMD &&
> -             (x86_fam =3D get_cpu_family(
> -                 d->arch.cpuid->basic.raw_fms, NULL, NULL)) >=3D 0x10 =
&&
> -             x86_fam < 0x17 )
> -        {
> -            uint64_t msr_val;
> -
> -            if ( !rdmsr_safe(MSR_AMD64_NB_CFG, msr_val) &&
> -                 (msr_val & (1ULL << =
AMD64_NB_CFG_CF8_EXT_ENABLE_BIT)) )
> -                addr |=3D CF8_ADDR_HI(cf8);
> -        }
> -    }
> -    else
> -    {
> -        type =3D (p->type =3D=3D IOREQ_TYPE_PIO) ?
> -                XEN_DMOP_IO_RANGE_PORT : XEN_DMOP_IO_RANGE_MEMORY;
> -        addr =3D p->addr;
> -    }
> -
>      FOR_EACH_IOREQ_SERVER(d, id, s)
>      {
>          struct rangeset *r;
> @@ -1351,7 +1252,7 @@ static int hvm_send_buffered_ioreq(struct =
hvm_ioreq_server *s, ioreq_t *p)
>      pg =3D iorp->va;
>=20
>      if ( !pg )
> -        return X86EMUL_UNHANDLEABLE;
> +        return IOREQ_STATUS_UNHANDLED;
>=20
>      /*
>       * Return 0 for the cases we can't deal with:
> @@ -1381,7 +1282,7 @@ static int hvm_send_buffered_ioreq(struct =
hvm_ioreq_server *s, ioreq_t *p)
>          break;
>      default:
>          gdprintk(XENLOG_WARNING, "unexpected ioreq size: %u\n", =
p->size);
> -        return X86EMUL_UNHANDLEABLE;
> +        return IOREQ_STATUS_UNHANDLED;
>      }
>=20
>      spin_lock(&s->bufioreq_lock);
> @@ -1391,7 +1292,7 @@ static int hvm_send_buffered_ioreq(struct =
hvm_ioreq_server *s, ioreq_t *p)
>      {
>          /* The queue is full: send the iopacket through the normal =
path. */
>          spin_unlock(&s->bufioreq_lock);
> -        return X86EMUL_UNHANDLEABLE;
> +        return IOREQ_STATUS_UNHANDLED;
>      }
>=20
>      pg->buf_ioreq[pg->ptrs.write_pointer % IOREQ_BUFFER_SLOT_NUM] =3D =
bp;
> @@ -1422,7 +1323,7 @@ static int hvm_send_buffered_ioreq(struct =
hvm_ioreq_server *s, ioreq_t *p)
>      notify_via_xen_event_channel(d, s->bufioreq_evtchn);
>      spin_unlock(&s->bufioreq_lock);
>=20
> -    return X86EMUL_OKAY;
> +    return IOREQ_STATUS_HANDLED;
>  }
>=20
>  int hvm_send_ioreq(struct hvm_ioreq_server *s, ioreq_t *proto_p,
> @@ -1438,7 +1339,7 @@ int hvm_send_ioreq(struct hvm_ioreq_server *s, =
ioreq_t *proto_p,
>          return hvm_send_buffered_ioreq(s, proto_p);
>=20
>      if ( unlikely(!vcpu_start_shutdown_deferral(curr)) )
> -        return X86EMUL_RETRY;
> +        return IOREQ_STATUS_RETRY;
>=20
>      list_for_each_entry ( sv,
>                            &s->ioreq_vcpu_list,
> @@ -1478,11 +1379,11 @@ int hvm_send_ioreq(struct hvm_ioreq_server *s, =
ioreq_t *proto_p,
>              notify_via_xen_event_channel(d, port);
>=20
>              sv->pending =3D true;
> -            return X86EMUL_RETRY;
> +            return IOREQ_STATUS_RETRY;
>          }
>      }
>=20
> -    return X86EMUL_UNHANDLEABLE;
> +    return IOREQ_STATUS_UNHANDLED;
>  }
>=20
>  unsigned int hvm_broadcast_ioreq(ioreq_t *p, bool buffered)
> @@ -1496,30 +1397,18 @@ unsigned int hvm_broadcast_ioreq(ioreq_t *p, =
bool buffered)
>          if ( !s->enabled )
>              continue;
>=20
> -        if ( hvm_send_ioreq(s, p, buffered) =3D=3D =
X86EMUL_UNHANDLEABLE )
> +        if ( hvm_send_ioreq(s, p, buffered) =3D=3D =
IOREQ_STATUS_UNHANDLED )
>              failed++;
>      }
>=20
>      return failed;
>  }
>=20
> -static int hvm_access_cf8(
> -    int dir, unsigned int port, unsigned int bytes, uint32_t *val)
> -{
> -    struct domain *d =3D current->domain;
> -
> -    if ( dir =3D=3D IOREQ_WRITE && bytes =3D=3D 4 )
> -        d->arch.hvm.pci_cf8 =3D *val;
> -
> -    /* We always need to fall through to the catch all emulator */
> -    return X86EMUL_UNHANDLEABLE;
> -}
> -
>  void hvm_ioreq_init(struct domain *d)
>  {
>      spin_lock_init(&d->arch.hvm.ioreq_server.lock);
>=20
> -    register_portio_handler(d, 0xcf8, 4, hvm_access_cf8);
> +    arch_hvm_ioreq_init(d);
>  }
>=20
>  /*
> diff --git a/xen/include/asm-x86/hvm/ioreq.h =
b/xen/include/asm-x86/hvm/ioreq.h
> index e2588e9..376e2ef 100644
> --- a/xen/include/asm-x86/hvm/ioreq.h
> +++ b/xen/include/asm-x86/hvm/ioreq.h
> @@ -19,6 +19,165 @@
>  #ifndef __ASM_X86_HVM_IOREQ_H__
>  #define __ASM_X86_HVM_IOREQ_H__
>=20
> +#include <asm/hvm/emulate.h>
> +#include <asm/hvm/vmx/vmx.h>
> +
> +#include <public/hvm/params.h>
> +
> +struct hvm_ioreq_server *get_ioreq_server(const struct domain *d,
> +                                          unsigned int id);
> +
> +static inline bool arch_hvm_io_completion(enum hvm_io_completion =
io_completion)
> +{
> +    switch ( io_completion )
> +    {
> +    case HVMIO_realmode_completion:
> +    {
> +        struct hvm_emulate_ctxt ctxt;
> +
> +        hvm_emulate_init_once(&ctxt, NULL, guest_cpu_user_regs());
> +        vmx_realmode_emulate_one(&ctxt);
> +        hvm_emulate_writeback(&ctxt);
> +
> +        break;
> +    }
> +
> +    default:
> +        ASSERT_UNREACHABLE();
> +        break;
> +    }
> +
> +    return true;
> +}
> +
> +/* Called when target domain is paused */
> +static inline void arch_hvm_destroy_ioreq_server(struct =
hvm_ioreq_server *s)
> +{
> +    p2m_set_ioreq_server(s->target, 0, s);
> +}
> +
> +/*
> + * Map or unmap an ioreq server to specific memory type. For now, =
only
> + * HVMMEM_ioreq_server is supported, and in the future new types can =
be
> + * introduced, e.g. HVMMEM_ioreq_serverX mapped to ioreq server X. =
And
> + * currently, only write operations are to be forwarded to an ioreq =
server.
> + * Support for the emulation of read operations can be added when an =
ioreq
> + * server has such requirement in the future.
> + */
> +static inline int hvm_map_mem_type_to_ioreq_server(struct domain *d,
> +                                                   ioservid_t id,
> +                                                   uint32_t type,
> +                                                   uint32_t flags)
> +{
> +    struct hvm_ioreq_server *s;
> +    int rc;
> +
> +    if ( type !=3D HVMMEM_ioreq_server )
> +        return -EINVAL;
> +
> +    if ( flags & ~XEN_DMOP_IOREQ_MEM_ACCESS_WRITE )
> +        return -EINVAL;
> +
> +    spin_lock_recursive(&d->arch.hvm.ioreq_server.lock);
> +
> +    s =3D get_ioreq_server(d, id);
> +
> +    rc =3D -ENOENT;
> +    if ( !s )
> +        goto out;
> +
> +    rc =3D -EPERM;
> +    if ( s->emulator !=3D current->domain )
> +        goto out;
> +
> +    rc =3D p2m_set_ioreq_server(d, flags, s);
> +
> + out:
> +    spin_unlock_recursive(&d->arch.hvm.ioreq_server.lock);
> +
> +    if ( rc =3D=3D 0 && flags =3D=3D 0 )
> +    {
> +        struct p2m_domain *p2m =3D p2m_get_hostp2m(d);
> +
> +        if ( read_atomic(&p2m->ioreq.entry_count) )
> +            p2m_change_entry_type_global(d, p2m_ioreq_server, =
p2m_ram_rw);
> +    }
> +
> +    return rc;
> +}
> +

The above doesn't really feel right to me. It's really an entry point =
into the ioreq server code and as such I think it ought to be left in =
the common code. I suggest replacing the p2m_set_ioreq_server() function =
with an arch specific function (also taking the type) which you can then =
implement here.

The rest of the patch looks ok.

  Paul

> +static inline int hvm_ioreq_server_get_type_addr(const struct domain =
*d,
> +                                                 const ioreq_t *p,
> +                                                 uint8_t *type,
> +                                                 uint64_t *addr)
> +{
> +    uint32_t cf8 =3D d->arch.hvm.pci_cf8;
> +
> +    if ( p->type !=3D IOREQ_TYPE_COPY && p->type !=3D IOREQ_TYPE_PIO =
)
> +        return -EINVAL;
> +
> +    if ( p->type =3D=3D IOREQ_TYPE_PIO &&
> +         (p->addr & ~3) =3D=3D 0xcfc &&
> +         CF8_ENABLED(cf8) )
> +    {
> +        uint32_t x86_fam;
> +        pci_sbdf_t sbdf;
> +        unsigned int reg;
> +
> +        reg =3D hvm_pci_decode_addr(cf8, p->addr, &sbdf);
> +
> +        /* PCI config data cycle */
> +        *type =3D XEN_DMOP_IO_RANGE_PCI;
> +        *addr =3D ((uint64_t)sbdf.sbdf << 32) | reg;
> +        /* AMD extended configuration space access? */
> +        if ( CF8_ADDR_HI(cf8) &&
> +             d->arch.cpuid->x86_vendor =3D=3D X86_VENDOR_AMD &&
> +             (x86_fam =3D get_cpu_family(
> +                 d->arch.cpuid->basic.raw_fms, NULL, NULL)) >=3D 0x10 =
&&
> +             x86_fam < 0x17 )
> +        {
> +            uint64_t msr_val;
> +
> +            if ( !rdmsr_safe(MSR_AMD64_NB_CFG, msr_val) &&
> +                 (msr_val & (1ULL << =
AMD64_NB_CFG_CF8_EXT_ENABLE_BIT)) )
> +                *addr |=3D CF8_ADDR_HI(cf8);
> +        }
> +    }
> +    else
> +    {
> +        *type =3D (p->type =3D=3D IOREQ_TYPE_PIO) ?
> +                 XEN_DMOP_IO_RANGE_PORT : XEN_DMOP_IO_RANGE_MEMORY;
> +        *addr =3D p->addr;
> +    }
> +
> +    return 0;
> +}
> +
> +static inline int hvm_access_cf8(
> +    int dir, unsigned int port, unsigned int bytes, uint32_t *val)
> +{
> +    struct domain *d =3D current->domain;
> +
> +    if ( dir =3D=3D IOREQ_WRITE && bytes =3D=3D 4 )
> +        d->arch.hvm.pci_cf8 =3D *val;
> +
> +    /* We always need to fall through to the catch all emulator */
> +    return X86EMUL_UNHANDLEABLE;
> +}
> +
> +static inline void arch_hvm_ioreq_init(struct domain *d)
> +{
> +    register_portio_handler(d, 0xcf8, 4, hvm_access_cf8);
> +}
> +
> +static inline bool arch_hvm_ioreq_destroy(struct domain *d)
> +{
> +    if ( !relocate_portio_handler(d, 0xcf8, 0xcf8, 4) )
> +        return false;
> +
> +    return true;
> +}
> +
>  bool hvm_io_pending(struct vcpu *v);
>  bool handle_hvm_io_completion(struct vcpu *v);
>  bool is_ioreq_server_page(struct domain *d, const struct page_info =
*page);
> @@ -38,8 +197,6 @@ int hvm_map_io_range_to_ioreq_server(struct domain =
*d, ioservid_t id,
>  int hvm_unmap_io_range_from_ioreq_server(struct domain *d, ioservid_t =
id,
>                                           uint32_t type, uint64_t =
start,
>                                           uint64_t end);
> -int hvm_map_mem_type_to_ioreq_server(struct domain *d, ioservid_t id,
> -                                     uint32_t type, uint32_t flags);
>  int hvm_set_ioreq_server_state(struct domain *d, ioservid_t id,
>                                 bool enabled);
>=20
> @@ -55,6 +212,10 @@ unsigned int hvm_broadcast_ioreq(ioreq_t *p, bool =
buffered);
>=20
>  void hvm_ioreq_init(struct domain *d);
>=20
> +#define IOREQ_STATUS_HANDLED     X86EMUL_OKAY
> +#define IOREQ_STATUS_UNHANDLED   X86EMUL_UNHANDLEABLE
> +#define IOREQ_STATUS_RETRY       X86EMUL_RETRY
> +
>  #endif /* __ASM_X86_HVM_IOREQ_H__ */
>=20
>  /*
> --
> 2.7.4



