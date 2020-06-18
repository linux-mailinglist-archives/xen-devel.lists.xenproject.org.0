Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BAD9B1FF2BB
	for <lists+xen-devel@lfdr.de>; Thu, 18 Jun 2020 15:11:02 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jluJS-0002PQ-UN; Thu, 18 Jun 2020 13:10:38 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ZeQT=77=cert.pl=michall@srs-us1.protection.inumbo.net>)
 id 1jluJR-0002PL-Cn
 for xen-devel@lists.xenproject.org; Thu, 18 Jun 2020 13:10:37 +0000
X-Inumbo-ID: 18d6dae2-b165-11ea-ba90-12813bfff9fa
Received: from bagnar.nask.net.pl (unknown [195.187.242.196])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 18d6dae2-b165-11ea-ba90-12813bfff9fa;
 Thu, 18 Jun 2020 13:10:36 +0000 (UTC)
Received: from bagnar.nask.net.pl (unknown [172.16.9.10])
 by bagnar.nask.net.pl (Postfix) with ESMTP id 04E0EA3054;
 Thu, 18 Jun 2020 15:10:35 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by bagnar.nask.net.pl (Postfix) with ESMTP id E7E51A1C5A;
 Thu, 18 Jun 2020 15:10:33 +0200 (CEST)
Received: from bagnar.nask.net.pl ([127.0.0.1])
 by localhost (bagnar.nask.net.pl [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id 63qMKdKcD9Rv; Thu, 18 Jun 2020 15:10:33 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by bagnar.nask.net.pl (Postfix) with ESMTP id 559B0A3054;
 Thu, 18 Jun 2020 15:10:33 +0200 (CEST)
X-Virus-Scanned: amavisd-new at bagnar.nask.net.pl
Received: from bagnar.nask.net.pl ([127.0.0.1])
 by localhost (bagnar.nask.net.pl [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id U-akyG1LkELX; Thu, 18 Jun 2020 15:10:33 +0200 (CEST)
Received: from belindir.nask.net.pl (belindir-ext.nask.net.pl
 [195.187.242.210])
 by bagnar.nask.net.pl (Postfix) with ESMTP id 2F7E0A1C5A;
 Thu, 18 Jun 2020 15:10:33 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by belindir.nask.net.pl (Postfix) with ESMTP id 11B12222F3;
 Thu, 18 Jun 2020 15:10:03 +0200 (CEST)
Received: from belindir.nask.net.pl ([127.0.0.1])
 by localhost (belindir.nask.net.pl [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id bTjnkH134zcN; Thu, 18 Jun 2020 15:09:57 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by belindir.nask.net.pl (Postfix) with ESMTP id 7E443214EE;
 Thu, 18 Jun 2020 15:09:57 +0200 (CEST)
X-Virus-Scanned: amavisd-new at belindir.nask.net.pl
Received: from belindir.nask.net.pl ([127.0.0.1])
 by localhost (belindir.nask.net.pl [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id YfGNSuXkNlqH; Thu, 18 Jun 2020 15:09:57 +0200 (CEST)
Received: from belindir.nask.net.pl (belindir.nask.net.pl [172.16.10.10])
 by belindir.nask.net.pl (Postfix) with ESMTP id 5F96121125;
 Thu, 18 Jun 2020 15:09:57 +0200 (CEST)
Date: Thu, 18 Jun 2020 15:09:57 +0200 (CEST)
From: =?utf-8?Q?Micha=C5=82_Leszczy=C5=84ski?= <michal.leszczynski@cert.pl>
To: Jan Beulich <jbeulich@suse.com>
Message-ID: <1226758073.9662727.1592485797234.JavaMail.zimbra@cert.pl>
In-Reply-To: <9924a5d9-b851-257a-9a6a-7a5712898a71@suse.com>
References: <1548605014.8764792.1592320576239.JavaMail.zimbra@cert.pl>
 <34833328.8766172.1592320926648.JavaMail.zimbra@cert.pl>
 <20200616172352.GT735@Air-de-Roger>
 <998292451.9258672.1592421185726.JavaMail.zimbra@cert.pl>
 <CABfawhmxUtuyBUYjVf9iOMvJop-_7SfciRNQThZt0sAqPsVqrg@mail.gmail.com>
 <832789003.9534743.1592478099057.JavaMail.zimbra@cert.pl>
 <20200618115519.GL735@Air-de-Roger>
 <9924a5d9-b851-257a-9a6a-7a5712898a71@suse.com>
Subject: Re: [PATCH v1 4/7] x86/vmx: add do_vmtrace_op
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [172.16.10.10]
X-Mailer: Zimbra 8.6.0_GA_1194 (ZimbraWebClient - GC83 (Win)/8.6.0_GA_1194)
Thread-Topic: x86/vmx: add do_vmtrace_op
Thread-Index: IRz1Owj0IBmW4onGTvXVKPePkcy0OA==
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Tamas K Lengyel <tamas.k.lengyel@gmail.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 Roger Pau =?utf-8?Q?Monn=C3=A9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

----- 18 cze 2020 o 14:51, Jan Beulich jbeulich@suse.com napisa=C5=82(a):

> On 18.06.2020 13:55, Roger Pau Monn=C3=A9 wrote:
>> On Thu, Jun 18, 2020 at 01:01:39PM +0200, Micha=C5=82 Leszczy=C5=84ski w=
rote:
>>> It was previously stated that:
>>>
>>>> PVH or HVM domain
>>>> won't be able to use this interface since it has no way to request the
>>>> mapping of a specific mfn into it's physmap.
>>>
>>> but however, taking LibVMI as an example:
>>>
>>> https://github.com/libvmi/libvmi/blob/c461e20ae88bc62c08c27f50fcead23c2=
7a30f9e/libvmi/driver/xen/xen.c#L51
>>>
>>> An essential abstraction xen_get_memory() relies on xc_map_foreign_rang=
e().
>>> Doesn't this mean that it's not usable from PVH or HVM domains, or did =
I got it
>>> all wrong?
>>=20
>> That was my fault, so the buffer mfns are assigned to Xen, and then
>> the Xen domain ID is used to map those, which should work on both PV
>> and HVM (or PVH).
>>=20
>> I still think using XENMEM_acquire_resource might be better, but I
>> would let others comment.
>=20
> +1
>=20
> Jan


I'm trying to implement this right now. I've added some very simple code to=
 mm.c just for testing:

---

diff --git a/xen/arch/x86/mm.c b/xen/arch/x86/mm.c
index e376fc7e8f..aaaefe6d23 100644
--- a/xen/arch/x86/mm.c
+++ b/xen/arch/x86/mm.c
@@ -4624,6 +4624,26 @@ int arch_acquire_resource(struct domain *d, unsigned=
 int type,
         }
         break;
     }
+
+    case XENMEM_resource_vmtrace_buf:
+    {
+        uint64_t output_base;
+        mfn_t mfn;
+        unsigned int i;
+
+        printk("vmtrace buf acquire\n");
+        output_base =3D d->vcpu[id]->arch.hvm.vmx.ipt_state->output_base;
+        mfn =3D mfn_x(output_base >> PAGE_SHIFT);
+
+        rc =3D 0;
+        for ( i =3D 0; i < nr_frames; i++ )
+        {
+            __map_domain_page_global(mfn_to_page(mfn + i));
+            mfn_list[i] =3D mfn + i;
+        }
+
+        break;
+    }
 #endif

     default:

---


and then in my "proctrace" tool I'm trying to acquire it like this:

    fres =3D xenforeignmemory_map_resource(
        fmem, domid, XENMEM_resource_vmtrace_buf,
        /* vcpu: */ 0, /* frame: */ 0, /* num_frames: */ 128, (void **)&buf=
,
        PROT_READ, 0);


ioctl fails with "Argument list too long". It works fine when I provide som=
e small number of frames (e.g. num_frames: 1 or 32), but doesn't work for a=
ny larger quantity.

How should I proceed with this? The PT buffer could be large, even up to 4 =
GB.


Best regards,
Micha=C5=82 Leszczy=C5=84ski
CERT Polska

