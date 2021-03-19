Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B4D12341897
	for <lists+xen-devel@lfdr.de>; Fri, 19 Mar 2021 10:41:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.99153.188347 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lNBch-0001vz-Rd; Fri, 19 Mar 2021 09:40:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 99153.188347; Fri, 19 Mar 2021 09:40:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lNBch-0001va-Nj; Fri, 19 Mar 2021 09:40:51 +0000
Received: by outflank-mailman (input) for mailman id 99153;
 Fri, 19 Mar 2021 09:40:49 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=v8Ug=IR=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1lNBcf-0001vV-Ki
 for xen-devel@lists.xenproject.org; Fri, 19 Mar 2021 09:40:49 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f3189259-6cea-45b0-903c-388a86421e4c;
 Fri, 19 Mar 2021 09:40:46 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 0315AAE05;
 Fri, 19 Mar 2021 09:40:46 +0000 (UTC)
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
X-Inumbo-ID: f3189259-6cea-45b0-903c-388a86421e4c
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1616146846; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=BDSC5ohYDZgClzQ920JJC1vvfwqO6RRsmKC/d/XO3rI=;
	b=GwSNFyOMsLsaeQvhxuh56K3rc//gFuSXULPqSbviWgLmdOAJ28RnhJoC6zGwAsS10V1PpQ
	h+ElzLpE04Skq98FAXJGtRAdbgeKPS+gUs7cUvzWZdF8GbAeV0Sv+RxTtXRCyarw1YqBGp
	bVzgXDN1brBkGRQGQ1EpYFgARIX4kn4=
Subject: Re: Troubles analyzing crash dumps from xl dump-core
To: Igor Druzhinin <igor.druzhinin@citrix.com>,
 Roman Shaposhnik <roman@zededa.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>
References: <CAMmSBy-wXf+YHa_m1N37537EQfUrs8RVi2i=Ur6yXGtJV_bCgQ@mail.gmail.com>
 <91837fa8-1d57-8b37-bf66-9e021855348d@suse.com>
 <CAMmSBy8vHstYXPUOZS1byK+JtcJRC_WqZXU8jtd4CJHUop3eGg@mail.gmail.com>
 <2bbb347c-bc5b-63f7-3e94-b90145ff5166@suse.com>
 <6466c5e156bf4afbb9fbbd44d7ff20b8@FTLPEX02CL02.citrite.net>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <3e15967e-a243-d728-e66d-31f700539221@suse.com>
Date: Fri, 19 Mar 2021 10:40:45 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <6466c5e156bf4afbb9fbbd44d7ff20b8@FTLPEX02CL02.citrite.net>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="qCUDw5HfKVmisMSQaeQuwr9dUW5MlCHlR"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--qCUDw5HfKVmisMSQaeQuwr9dUW5MlCHlR
Content-Type: multipart/mixed; boundary="56KizhKZjHM3lCODhiMjtgMIgqZQw0VQo";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Igor Druzhinin <igor.druzhinin@citrix.com>,
 Roman Shaposhnik <roman@zededa.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>
Message-ID: <3e15967e-a243-d728-e66d-31f700539221@suse.com>
Subject: Re: Troubles analyzing crash dumps from xl dump-core
References: <CAMmSBy-wXf+YHa_m1N37537EQfUrs8RVi2i=Ur6yXGtJV_bCgQ@mail.gmail.com>
 <91837fa8-1d57-8b37-bf66-9e021855348d@suse.com>
 <CAMmSBy8vHstYXPUOZS1byK+JtcJRC_WqZXU8jtd4CJHUop3eGg@mail.gmail.com>
 <2bbb347c-bc5b-63f7-3e94-b90145ff5166@suse.com>
 <6466c5e156bf4afbb9fbbd44d7ff20b8@FTLPEX02CL02.citrite.net>
In-Reply-To: <6466c5e156bf4afbb9fbbd44d7ff20b8@FTLPEX02CL02.citrite.net>

--56KizhKZjHM3lCODhiMjtgMIgqZQw0VQo
Content-Type: multipart/mixed;
 boundary="------------BD568719CF22F0C3FB34ED2C"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------BD568719CF22F0C3FB34ED2C
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

On 10.03.21 20:37, Igor Druzhinin wrote:
>> On 30.01.21 19:53, Roman Shaposhnik wrote:
>>> On Fri, Jan 29, 2021 at 11:28 PM J=C3=BCrgen Gro=C3=9F <jgross@suse.c=
om> wrote:
>>>>
>>>> On 29.01.21 21:12, Roman Shaposhnik wrote:
>>>>> Hi!
>>>>>
>>>>> I'm trying to see how much mileage I can get out of
>>>>> crash(1) 7.2.8 (based on gdb 7.6) when it comes to analyzing crash
>>>>> dumps taken via xl dump-core (this is all on x86_64 with stock Xen
>>>>> v. 4.14).
>>>>>
>>>>> The good news is that the image actually does load up but it throws=

>>>>> the following WARNINGs in the process:
>>>>>
>>>>> WARNING: cannot access vmalloc'd module memory
>>>>> crash: read error: kernel virtual address: ffffffff93613480  type:
>>>>> "fill_task_struct"
>>>>> WARNING: active task ffffffff93613480 on cpu 0 not found in PID has=
h
>>>>> crash: read error: kernel virtual address: ffffffff93613480  type:
>>>>> "fill_task_struct"
>>>>> WARNING: cannot read log_buf contents
>>>>>
>>>>> And then the info that it gives me around basic things like ps, mod=
,
>>>>> log, etc. is really super limited (and I am now suspecting may even=

>>>>> be wrong).
>>>>>
>>>>> Since I was primarily after dmesg/log initially, I tried:
>>>>> crash> log
>>>>> log: WARNING: cannot read log_buf contents
>>>>>
>>>>> Then I tried taking an xl dump-core from the domU that was still
>>>>> very much alive and happy and got similar results -- so it clearly
>>>>> doesn't seem to be related to the state domU is in.
>>>>>
>>>>> As matter of fact, I actually got to the desired dmesg output by
>>>>> simply running strings(1) on the core file -- so the info is
>>>>> definitely there -- but I guess some kind of index/reference maybe
>>>>> broken.
>>>>>
>>>>> With all that in mind, if there's anyone on this ML who has recentl=
y
>>>>> done Xen DomU crash dump analysis -- I would definitely appreciate
>>>>> the pointers!
>>>>
>>>> For me it just works (openSUSE).
>>>
>>> Can you please run:
>>>
>>> crash --version and readelf -a XXXX (on the xl dump-core output) and
>>> post the results?
>>
>> # crash --version
>>
>> crash 7.2.1
>=20
> I tried to build this version but I still get the following while tryin=
g to open a dump file
> produced by "xl dump-core":
>=20
> [root@lcy2-dt92 crash]# ./crash ../vmlinux-5.8.0-44-generic ../xxx.dmp
>=20
> crash 7.2.1
> Copyright (C) 2002-2017  Red Hat, Inc.
> Copyright (C) 2004, 2005, 2006, 2010  IBM Corporation
> Copyright (C) 1999-2006  Hewlett-Packard Co
> Copyright (C) 2005, 2006, 2011, 2012  Fujitsu Limited
> Copyright (C) 2006, 2007  VA Linux Systems Japan K.K.
> Copyright (C) 2005, 2011  NEC Corporation
> Copyright (C) 1999, 2002, 2007  Silicon Graphics, Inc.
> Copyright (C) 1999, 2000, 2001, 2002  Mission Critical Linux, Inc.
> This program is free software, covered by the GNU General Public Licens=
e,
> and you are welcome to change it and/or distribute copies of it under
> certain conditions.  Enter "help copying" to see the conditions.
> This program has absolutely no warranty.  Enter "help warranty" for det=
ails.
>=20
> GNU gdb (GDB) 7.6
> Copyright (C) 2013 Free Software Foundation, Inc.
> License GPLv3+: GNU GPL version 3 or later <http://gnu.org/licenses/gpl=
=2Ehtml>
> This is free software: you are free to change and redistribute it.
> There is NO WARRANTY, to the extent permitted by law.  Type "show copyi=
ng"
> and "show warranty" for details.
> This GDB was configured as "x86_64-unknown-linux-gnu"...
>=20
> crash: cannot determine base kernel version
> crash: ../vmlinux-5.8.0-44-generic and ../xxx.dmp do not match!
>=20
>=20
> Am I doing something wrong? How do I need to use crash for it to work?

Could you try the attached patch?


Juergen


--------------BD568719CF22F0C3FB34ED2C
Content-Type: text/x-patch; charset=UTF-8;
 name="0001-tools-libs-ctrl-fix-xc_core_arch_map_p2m-to-support-.patch"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment;
 filename*0="0001-tools-libs-ctrl-fix-xc_core_arch_map_p2m-to-support-.pa";
 filename*1="tch"

=46rom e7265739e0db957176261236be53c0c270c2efa1 Mon Sep 17 00:00:00 2001
From: Juergen Gross <jgross@suse.com>
Date: Thu, 18 Mar 2021 14:26:24 +0100
Subject: [PATCH] tools/libs/ctrl: fix xc_core_arch_map_p2m() to support l=
inear
 p2m table

The core of a pv linux guest produced via "xl dump-core" is nor usable
as since kernel 4.14 only the linear p2m table is kept if Xen indicates
it is supporting that. Unfortunately xc_core_arch_map_p2m() is still
supporting the 3-level p2m tree only.

Fix that by copying the functionality of map_p2m() from libxenguest to
libxenctrl.

Fixes: dc6d60937121 ("libxc: set flag for support of linear p2m list in d=
omain builder")
Signed-off-by: Juergen Gross <jgross@suse.com>
---
This is a backport candidate.
---
 tools/libs/ctrl/xc_core_x86.c | 235 ++++++++++++++++++++++++++++++----
 tools/libs/ctrl/xc_private.h  |   1 +
 2 files changed, 208 insertions(+), 28 deletions(-)

diff --git a/tools/libs/ctrl/xc_core_x86.c b/tools/libs/ctrl/xc_core_x86.=
c
index cb76e6207b..a8806efb4a 100644
--- a/tools/libs/ctrl/xc_core_x86.c
+++ b/tools/libs/ctrl/xc_core_x86.c
@@ -17,6 +17,7 @@
  *
  */
=20
+#include <inttypes.h>
 #include "xc_private.h"
 #include "xc_core.h"
 #include <xen/hvm/e820.h>
@@ -65,34 +66,169 @@ xc_core_arch_memory_map_get(xc_interface *xch, struc=
t xc_core_arch_context *unus
     return 0;
 }
=20
-static int
-xc_core_arch_map_p2m_rw(xc_interface *xch, struct domain_info_context *d=
info, xc_dominfo_t *info,
-                        shared_info_any_t *live_shinfo, xen_pfn_t **live=
_p2m,
-                        unsigned long *pfnp, int rw)
+static inline bool is_canonical_address(uint64_t vaddr)
 {
-    /* Double and single indirect references to the live P2M table */
-    xen_pfn_t *live_p2m_frame_list_list =3D NULL;
-    xen_pfn_t *live_p2m_frame_list =3D NULL;
-    /* Copies of the above. */
-    xen_pfn_t *p2m_frame_list_list =3D NULL;
-    xen_pfn_t *p2m_frame_list =3D NULL;
+    return ((int64_t)vaddr >> 47) =3D=3D ((int64_t)vaddr >> 63);
+}
=20
-    uint32_t dom =3D info->domid;
-    int ret =3D -1;
-    int err;
-    int i;
+/* Virtual address ranges reserved for hypervisor. */
+#define HYPERVISOR_VIRT_START_X86_64 0xFFFF800000000000ULL
+#define HYPERVISOR_VIRT_END_X86_64   0xFFFF87FFFFFFFFFFULL
=20
-    if ( xc_domain_nr_gpfns(xch, info->domid, &dinfo->p2m_size) < 0 )
+#define HYPERVISOR_VIRT_START_X86_32 0x00000000F5800000ULL
+#define HYPERVISOR_VIRT_END_X86_32   0x00000000FFFFFFFFULL
+
+static xen_pfn_t *
+xc_core_arch_map_p2m_list_rw(xc_interface *xch, struct domain_info_conte=
xt *dinfo,
+                             uint32_t dom, shared_info_any_t *live_shinf=
o,
+                             uint64_t p2m_cr3)
+{
+    uint64_t p2m_vaddr, p2m_end, mask, off;
+    xen_pfn_t p2m_mfn, mfn, saved_mfn, max_pfn;
+    uint64_t *ptes =3D NULL;
+    xen_pfn_t *mfns =3D NULL;
+    unsigned int fpp, n_pages, level, n_levels, shift,
+                 idx_start, idx_end, idx, saved_idx;
+
+    p2m_vaddr =3D GET_FIELD(live_shinfo, arch.p2m_vaddr, dinfo->guest_wi=
dth);
+    fpp =3D PAGE_SIZE / dinfo->guest_width;
+    dinfo->p2m_frames =3D (dinfo->p2m_size - 1) / fpp + 1;
+    p2m_end =3D p2m_vaddr + dinfo->p2m_frames * PAGE_SIZE - 1;
+
+    if ( dinfo->guest_width =3D=3D 8 )
     {
-        ERROR("Could not get maximum GPFN!");
-        goto out;
+        mask =3D 0x0000ffffffffffffULL;
+        n_levels =3D 4;
+        p2m_mfn =3D p2m_cr3 >> 12;
+        if ( !is_canonical_address(p2m_vaddr) ||
+             !is_canonical_address(p2m_end) ||
+             p2m_end < p2m_vaddr ||
+             (p2m_vaddr <=3D HYPERVISOR_VIRT_END_X86_64 &&
+              p2m_end > HYPERVISOR_VIRT_START_X86_64) )
+        {
+            ERROR("Bad virtual p2m address range %#" PRIx64 "-%#" PRIx64=
,
+                  p2m_vaddr, p2m_end);
+            errno =3D ERANGE;
+            goto out;
+        }
+    }
+    else
+    {
+        mask =3D 0x00000000ffffffffULL;
+        n_levels =3D 3;
+        if ( p2m_cr3 & ~mask )
+            p2m_mfn =3D ~0UL;
+        else
+            p2m_mfn =3D (uint32_t)((p2m_cr3 >> 12) | (p2m_cr3 << 20));
+        if ( p2m_vaddr > mask || p2m_end > mask || p2m_end < p2m_vaddr |=
|
+             (p2m_vaddr <=3D HYPERVISOR_VIRT_END_X86_32 &&
+              p2m_end > HYPERVISOR_VIRT_START_X86_32) )
+        {
+            ERROR("Bad virtual p2m address range %#" PRIx64 "-%#" PRIx64=
,
+                  p2m_vaddr, p2m_end);
+            errno =3D ERANGE;
+            goto out;
+        }
     }
=20
-    if ( dinfo->p2m_size < info->nr_pages  )
+    mfns =3D malloc(sizeof(*mfns));
+    if ( !mfns )
     {
-        ERROR("p2m_size < nr_pages -1 (%lx < %lx", dinfo->p2m_size, info=
->nr_pages - 1);
+        ERROR("Cannot allocate memory for array of %u mfns", 1);
         goto out;
     }
+    mfns[0] =3D p2m_mfn;
+    off =3D 0;
+    saved_mfn =3D 0;
+    idx_start =3D idx_end =3D saved_idx =3D 0;
+
+    for ( level =3D n_levels; level > 0; level-- )
+    {
+        n_pages =3D idx_end - idx_start + 1;
+        ptes =3D xc_map_foreign_pages(xch, dom, PROT_READ, mfns, n_pages=
);
+        if ( !ptes )
+        {
+            PERROR("Failed to map %u page table pages for p2m list", n_p=
ages);
+            goto out;
+        }
+        free(mfns);
+
+        shift =3D level * 9 + 3;
+        idx_start =3D ((p2m_vaddr - off) & mask) >> shift;
+        idx_end =3D ((p2m_end - off) & mask) >> shift;
+        idx =3D idx_end - idx_start + 1;
+        mfns =3D malloc(sizeof(*mfns) * idx);
+        if ( !mfns )
+        {
+            ERROR("Cannot allocate memory for array of %u mfns", idx);
+            goto out;
+        }
+
+        for ( idx =3D idx_start; idx <=3D idx_end; idx++ )
+        {
+            mfn =3D (ptes[idx] & 0x000ffffffffff000ULL) >> PAGE_SHIFT;
+            if ( mfn =3D=3D 0 )
+            {
+                ERROR("Bad mfn %#lx during page table walk for vaddr %#"=
 PRIx64 " at level %d of p2m list",
+                      mfn, off + ((uint64_t)idx << shift), level);
+                errno =3D ERANGE;
+                goto out;
+            }
+            mfns[idx - idx_start] =3D mfn;
+
+            /* Maximum pfn check at level 2. Same reasoning as for p2m t=
ree. */
+            if ( level =3D=3D 2 )
+            {
+                if ( mfn !=3D saved_mfn )
+                {
+                    saved_mfn =3D mfn;
+                    saved_idx =3D idx - idx_start;
+                }
+            }
+        }
+
+        if ( level =3D=3D 2 )
+        {
+            if ( saved_idx =3D=3D idx_end )
+                saved_idx++;
+            max_pfn =3D ((xen_pfn_t)saved_idx << 9) * fpp;
+            if ( max_pfn < dinfo->p2m_size )
+            {
+                dinfo->p2m_size =3D max_pfn;
+                dinfo->p2m_frames =3D (dinfo->p2m_size + fpp - 1) / fpp;=

+                p2m_end =3D p2m_vaddr + dinfo->p2m_frames * PAGE_SIZE - =
1;
+                idx_end =3D idx_start + saved_idx;
+            }
+        }
+
+        munmap(ptes, n_pages * PAGE_SIZE);
+        ptes =3D NULL;
+        off =3D p2m_vaddr & ((mask >> shift) << shift);
+    }
+
+    return mfns;
+
+ out:
+    free(mfns);
+    if ( ptes )
+        munmap(ptes, n_pages * PAGE_SIZE);
+
+    return NULL;
+}
+
+static xen_pfn_t *
+xc_core_arch_map_p2m_tree_rw(xc_interface *xch, struct domain_info_conte=
xt *dinfo,
+                             uint32_t dom, shared_info_any_t *live_shinf=
o)
+{
+    /* Double and single indirect references to the live P2M table */
+    xen_pfn_t *live_p2m_frame_list_list;
+    xen_pfn_t *live_p2m_frame_list =3D NULL;
+    /* Copies of the above. */
+    xen_pfn_t *p2m_frame_list_list =3D NULL;
+    xen_pfn_t *p2m_frame_list;
+
+    int err;
+    int i;
=20
     live_p2m_frame_list_list =3D
         xc_map_foreign_range(xch, dom, PAGE_SIZE, PROT_READ,
@@ -151,10 +287,61 @@ xc_core_arch_map_p2m_rw(xc_interface *xch, struct d=
omain_info_context *dinfo, xc
         for ( i =3D P2M_FL_ENTRIES - 1; i >=3D 0; i-- )
             p2m_frame_list[i] =3D ((uint32_t *)p2m_frame_list)[i];
=20
+    dinfo->p2m_frames =3D P2M_FL_ENTRIES;
+
+    return p2m_frame_list;
+
+ out:
+    err =3D errno;
+
+    if ( live_p2m_frame_list_list )
+        munmap(live_p2m_frame_list_list, PAGE_SIZE);
+
+    if ( live_p2m_frame_list )
+        munmap(live_p2m_frame_list, P2M_FLL_ENTRIES * PAGE_SIZE);
+
+    free(p2m_frame_list_list);
+
+    errno =3D err;
+
+    return NULL;
+}
+
+static int
+xc_core_arch_map_p2m_rw(xc_interface *xch, struct domain_info_context *d=
info, xc_dominfo_t *info,
+                        shared_info_any_t *live_shinfo, xen_pfn_t **live=
_p2m,
+                        unsigned long *pfnp, int rw)
+{
+    xen_pfn_t *p2m_frame_list =3D NULL;
+    uint64_t p2m_cr3;
+    uint32_t dom =3D info->domid;
+    int ret =3D -1;
+    int err;
+
+    if ( xc_domain_nr_gpfns(xch, info->domid, &dinfo->p2m_size) < 0 )
+    {
+        ERROR("Could not get maximum GPFN!");
+        goto out;
+    }
+
+    if ( dinfo->p2m_size < info->nr_pages  )
+    {
+        ERROR("p2m_size < nr_pages -1 (%lx < %lx", dinfo->p2m_size, info=
->nr_pages - 1);
+        goto out;
+    }
+
+    p2m_cr3 =3D GET_FIELD(live_shinfo, arch.p2m_cr3, dinfo->guest_width)=
;
+
+    p2m_frame_list =3D p2m_cr3 ? xc_core_arch_map_p2m_list_rw(xch, dinfo=
, dom, live_shinfo, p2m_cr3)
+                             : xc_core_arch_map_p2m_tree_rw(xch, dinfo, =
dom, live_shinfo);
+
+    if ( !p2m_frame_list )
+        goto out;
+
     *live_p2m =3D xc_map_foreign_pages(xch, dom,
                                     rw ? (PROT_READ | PROT_WRITE) : PROT=
_READ,
                                     p2m_frame_list,
-                                    P2M_FL_ENTRIES);
+                                    dinfo->p2m_frames);
=20
     if ( !*live_p2m )
     {
@@ -169,14 +356,6 @@ xc_core_arch_map_p2m_rw(xc_interface *xch, struct do=
main_info_context *dinfo, xc
 out:
     err =3D errno;
=20
-    if ( live_p2m_frame_list_list )
-        munmap(live_p2m_frame_list_list, PAGE_SIZE);
-
-    if ( live_p2m_frame_list )
-        munmap(live_p2m_frame_list, P2M_FLL_ENTRIES * PAGE_SIZE);
-
-    free(p2m_frame_list_list);
-
     free(p2m_frame_list);
=20
     errno =3D err;
diff --git a/tools/libs/ctrl/xc_private.h b/tools/libs/ctrl/xc_private.h
index f0b5f83ac8..8ebc0b59da 100644
--- a/tools/libs/ctrl/xc_private.h
+++ b/tools/libs/ctrl/xc_private.h
@@ -79,6 +79,7 @@ struct iovec {
=20
 struct domain_info_context {
     unsigned int guest_width;
+    unsigned int p2m_frames;
     unsigned long p2m_size;
 };
=20
--=20
2.26.2


--------------BD568719CF22F0C3FB34ED2C
Content-Type: application/pgp-keys;
 name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment;
 filename="OpenPGP_0xB0DE9DD628BF132F.asc"

-----BEGIN PGP PUBLIC KEY BLOCK-----

xsBNBFOMcBYBCACgGjqjoGvbEouQZw/ToiBg9W98AlM2QHV+iNHsEs7kxWhKMjrioyspZKOBy=
cWx
w3ie3j9uvg9EOB3aN4xiTv4qbnGiTr3oJhkB1gsb6ToJQZ8uxGq2kaV2KL9650I1SJvedYm8O=
f8Z
d621lSmoKOwlNClALZNew72NjJLEzTalU1OdT7/i1TXkH09XSSI8mEQ/ouNcMvIJNwQpd369y=
9bf
IhWUiVXEK7MlRgUG6MvIj6Y3Am/BBLUVbDa4+gmzDC9ezlZkTZG2t14zWPvxXP3FAp2pkW0xq=
G7/
377qptDmrk42GlSKN4z76ELnLxussxc7I2hx18NUcbP8+uty4bMxABEBAAHNHEp1ZXJnZW4gR=
3Jv
c3MgPGpnQHBmdXBmLm5ldD7CwHkEEwECACMFAlOMcBYCGwMHCwkIBwMCAQYVCAIJCgsEFgIDA=
QIe
AQIXgAAKCRCw3p3WKL8TL0KdB/93FcIZ3GCNwFU0u3EjNbNjmXBKDY4FUGNQH2lvWAUy+dnyT=
hpw
dtF/jQ6j9RwE8VP0+NXcYpGJDWlNb9/JmYqLiX2Q3TyevpB0CA3dbBQp0OW0fgCetToGIQrg0=
MbD
1C/sEOv8Mr4NAfbauXjZlvTj30H2jO0u+6WGM6nHwbh2l5O8ZiHkH32iaSTfN7Eu5RnNVUJbv=
oPH
Z8SlM4KWm8rG+lIkGurqqu5gu8q8ZMKdsdGC4bBxdQKDKHEFExLJK/nRPFmAuGlId1E3fe10v=
5QL
+qHI3EIPtyfE7i9Hz6rVwi7lWKgh7pe0ZvatAudZ+JNIlBKptb64FaiIOAWDCx1SzR9KdWVyZ=
2Vu
IEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+wsB5BBMBAgAjBQJTjHCvAhsDBwsJCAcDAgEGFQgCC=
QoL
BBYCAwECHgECF4AACgkQsN6d1ii/Ey/HmQf/RtI7kv5A2PS4RF7HoZhPVPogNVbC4YA6lW7Dr=
Wf0
teC0RR3MzXfy6pJ+7KLgkqMlrAbN/8Dvjoz78X+5vhH/rDLa9BuZQlhFmvcGtCF8eR0T1v0nC=
/nu
AFVGy+67q2DH8As3KPu0344TBDpAvr2uYM4tSqxK4DURx5INz4ZZ0WNFHcqsfvlGJALDeE0Lh=
ITT
d9jLzdDad1pQSToCnLl6SBJZjDOX9QQcyUigZFtCXFst4dlsvddrxyqT1f17+2cFSdu7+ynLm=
XBK
7abQ3rwJY8SbRO2iRulogc5vr/RLMMlscDAiDkaFQWLoqHHOdfO9rURssHNN8WkMnQfvUewRz=
80h
SnVlcmdlbiBHcm9zcyA8amdyb3NzQG5vdmVsbC5jb20+wsB5BBMBAgAjBQJTjHDXAhsDBwsJC=
AcD
AgEGFQgCCQoLBBYCAwECHgECF4AACgkQsN6d1ii/Ey8PUQf/ehmgCI9jB9hlgexLvgOtf7PJn=
FOX
gMLdBQgBlVPO3/D9R8LtF9DBAFPNhlrsfIG/SqICoRCqUcJ96Pn3P7UUinFG/I0ECGF4EvTE1=
jnD
kfJZr6jrbjgyoZHiw/4BNwSTL9rWASyLgqlA8u1mf+c2yUwcGhgkRAd1gOwungxcwzwqgljf0=
N51
N5JfVRHRtyfwq/ge+YEkDGcTU6Y0sPOuj4Dyfm8fJzdfHNQsWq3PnczLVELStJNdapwPOoE+l=
otu
fe3AM2vAEYJ9rTz3Cki4JFUsgLkHFqGZarrPGi1eyQcXeluldO3m91NK/1xMI3/+8jbO0tsn1=
tqS
EUGIJi7ox80eSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuZGU+wsB5BBMBAgAjBQJTjHDrA=
hsD
BwsJCAcDAgEGFQgCCQoLBBYCAwECHgECF4AACgkQsN6d1ii/Ey+LhQf9GL45eU5vOowA2u5N3=
g3O
ZUEBmDHVVbqMtzwlmNC4k9Kx39r5s2vcFl4tXqW7g9/ViXYuiDXb0RfUpZiIUW89siKrkzmQ5=
dM7
wRqzgJpJwK8Bn2MIxAKArekWpiCKvBOB/Cc+3EXE78XdlxLyOi/NrmSGRIov0karw2RzMNOu5=
D+j
LRZQd1Sv27AR+IP3I8U4aqnhLpwhK7MEy9oCILlgZ1QZe49kpcumcZKORmzBTNh30FVKK1Evm=
V2x
AKDoaEOgQB4iFQLhJCdP1I5aSgM5IVFdn7v5YgEYuJYx37IoN1EblHI//x/e2AaIHpzK5h88N=
Eaw
QsaNRpNSrcfbFmAg987ATQRTjHAWAQgAyzH6AOODMBjgfWE9VeCgsrwH3exNAU32gLq2xvjpW=
nHI
s98ndPUDpnoxWQugJ6MpMncr0xSwFmHEgnSEjK/PAjppgmyc57BwKII3sV4on+gDVFJR6Y8ZR=
wgn
BC5mVM6JjQ5xDk8WRXljExRfUX9pNhdE5eBOZJrDRoLUmmjDtKzWaDhIg/+1Hzz93X4fCQkNV=
bVF
LELU9bMaLPBG/x5q4iYZ2k2ex6d47YE1ZFdMm6YBYMOljGkZKwYde5ldM9mo45mmwe0icXKLk=
pEd
IXKTZeKDO+Hdv1aqFuAcccTg9RXDQjmwhC3yEmrmcfl0+rPghO0Iv3OOImwTEe4co3c1mwARA=
QAB
wsBfBBgBAgAJBQJTjHAWAhsMAAoJELDendYovxMvQ/gH/1ha96vm4P/L+bQpJwrZ/dneZcmEw=
Tbe
8YFsw2V/Buv6Z4Mysln3nQK5ZadD534CF7TDVft7fC4tU4PONxF5D+/tvgkPfDAfF77zy2AH1=
vJz
Q1fOU8lYFpZXTXIHb+559UqvIB8AdgR3SAJGHHt4RKA0F7f5ipYBBrC6cyXJyyoprT10EMvU8=
VGi
wXvTyJz3fjoYsdFzpWPlJEBRMedCot60g5dmbdrZ5DWClAr0yau47zpWj3enf1tLWaqcsuylW=
svi
uGjKGw7KHQd3bxALOknAp4dN3QwBYCKuZ7AddY9yjynVaD5X7nF9nO5BjR/i1DG86lem3iBDX=
zXs
ZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------BD568719CF22F0C3FB34ED2C--

--56KizhKZjHM3lCODhiMjtgMIgqZQw0VQo--

--qCUDw5HfKVmisMSQaeQuwr9dUW5MlCHlR
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmBUcZ0FAwAAAAAACgkQsN6d1ii/Ey8w
WAf/XnhgOUWMUC8pLHPITVuLpqov0+nXKZmIePQy/+XW/VT8vzxmkaWq+8TUK7XnXpEj4hzfD3dv
XlASRfHQilaH3ZiGTmrh80+6tqEo0jbZQQOJL4Gjj6V4iIXZPhadw//eXEBJFpF9lkAOG9JVMnqs
FpR9qK7PjjL5z3ZVmj4EhPVNLLI0wX+GyvAyDuBzX3yMZcwB6GlrogytGTOv7gKPPhVAF1mIEUud
Xkhnh6GA0V1DJ3zdIswL0xXyhXEK73rf41S9aB6VGKQ/2gsJXovqPu426A+1M5x8lcixkSWprUkO
2F0IuEUcKMnHOWAIXXQ2dOiRMxlqNW/d1o/hji8Cmg==
=wyh2
-----END PGP SIGNATURE-----

--qCUDw5HfKVmisMSQaeQuwr9dUW5MlCHlR--

