Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 122147BA38E
	for <lists+xen-devel@lfdr.de>; Thu,  5 Oct 2023 17:58:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.613053.953317 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qoQjJ-0006tQ-Iq; Thu, 05 Oct 2023 15:57:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 613053.953317; Thu, 05 Oct 2023 15:57:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qoQjJ-0006qi-Fi; Thu, 05 Oct 2023 15:57:37 +0000
Received: by outflank-mailman (input) for mailman id 613053;
 Thu, 05 Oct 2023 15:57:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=9m1Y=FT=m5p.com=ehem@srs-se1.protection.inumbo.net>)
 id 1qoQjH-0006qc-Vu
 for xen-devel@lists.xenproject.org; Thu, 05 Oct 2023 15:57:35 +0000
Received: from mailhost.m5p.com (mailhost.m5p.com [74.104.188.4])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e4eda7a9-6397-11ee-98d3-6d05b1d4d9a1;
 Thu, 05 Oct 2023 17:57:33 +0200 (CEST)
Received: from m5p.com (mailhost.m5p.com [IPv6:2001:470:1f07:15ff:0:0:0:f7])
 by mailhost.m5p.com (8.17.1/8.15.2) with ESMTPS id 395Fv0m7005525
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
 Thu, 5 Oct 2023 11:57:05 -0400 (EDT) (envelope-from ehem@m5p.com)
Received: (from ehem@localhost)
 by m5p.com (8.17.1/8.15.2/Submit) id 395Fuxic005524;
 Thu, 5 Oct 2023 08:56:59 -0700 (PDT) (envelope-from ehem)
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
X-Inumbo-ID: e4eda7a9-6397-11ee-98d3-6d05b1d4d9a1
Date: Thu, 5 Oct 2023 08:56:59 -0700
From: Elliott Mitchell <ehem+xen@m5p.com>
To: Julien Grall <julien@xen.org>
Cc: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
        xen-devel@lists.xenproject.org,
        Stefano Stabellini <sstabellini@kernel.org>,
        Bertrand Marquis <bertrand.marquis@arm.com>,
        Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
        Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Subject: Re: Issue with shared information page on Xen/ARM 4.17
Message-ID: <ZR7cyzT2S8ZvYPJ2@mattapan.m5p.com>
References: <ZR0erl_OSkNgIQjx@MacBookPdeRoger>
 <c0b67401-dfe5-475f-8640-b66ac32a80fb@xen.org>
 <ZR1gM19i6-vBaXh7@MacBookPdeRoger>
 <b00500ae-76b1-441c-8154-bcdd897734dc@xen.org>
 <ZR1rBP_49Y2V8VF6@MacBookPdeRoger>
 <fe94dcd2-4429-48df-8ebd-59563d43796a@xen.org>
 <ZR18dlMAbCwEOeH4@MacBookPdeRoger>
 <f8242725-7ee0-4fca-a608-d234f8f3b564@xen.org>
 <ZR3VidifMWdjDQcv@mattapan.m5p.com>
 <b740572e-df22-449b-8c90-a155292b2e69@xen.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="MeI29MV4WBbuw2+2"
Content-Disposition: inline
In-Reply-To: <b740572e-df22-449b-8c90-a155292b2e69@xen.org>
X-Spam-Status: No, score=0.0 required=10.0 tests=KHOP_HELO_FCRDNS
	autolearn=unavailable autolearn_force=no version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-14) on mattapan.m5p.com


--MeI29MV4WBbuw2+2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Oct 05, 2023 at 09:54:26AM +0100, Julien Grall wrote:
> On 04/10/2023 22:13, Elliott Mitchell wrote:
> >>> I understand the situation is different on Arm vs x86, so if
> >>> edk2 is not supported on arm I guess it doesn't matter much whether
> >>> it's broken.  It would be a much worse issue on x86 where edk2 is
> >>> supported.
> >>
> >> AFAIK, we have CI for x86 on EDK2 but we don't on Arm.
> > 
> > What is the current status of this?  I'm unsure whether it was an extra
> > patch done by Debian, but "edk2-stable202211"/fff6d81270 doesn't work
> > with Xen/Qemu.
> 
> I don't know what's the status for x86. But for Arm, there are nothing. 
> And as I pointed out in my previous answer this is unlikely to change 
> until someone invest time in EDK2 on Xen on Arm.

Indications are the measures for x86 aren't very good either.  Presently
the Debian distribution is using builds based on tag edk2-stable202211,
commit fff6d81270.  Could be the Debian package process got broken.
Could also be that tag, builds are completing yet the output fails to
function.

I've also been trying to get Tianocore/EDK2 to function as a bootloader
for PVH.  Current OVMF builds are accepted for the 'kernel = "OVMF.fd"'
line, but simply hang.  I'm wondering whether it is assuming the presence
of a framebuffer and doesn't use the x86 Xen console.

> If there are patches sent on the ML, then I am happy to attempt to 
> review them. But I am afraid, I am not going to have time to try to find 
> and fix all the issues when using EDK2 in Arm guests.

The attached patch got booting via Tianocore/EDK2 working.  This likely
needs adjustment to match their style; problem is their style is so
awful I was looking for an airsickness bag.  I really don't want to do
further polishing.

I'm unsure whether XENMEM_remove_from_physmap uncovers a memory page
which had been previously mapped, versus turning it into a hole.  In
the former case, the allocation should be moved to a normal heap page
since the OS can reuse it.


-- 
(\___(\___(\______          --=> 8-) EHM <=--          ______/)___/)___/)
 \BS (    |         ehem+sigmsg@m5p.com  PGP 87145445         |    )   /
  \_CS\   |  _____  -O #include <stddisclaimer.h> O-   _____  |   /  _/
8A19\___\_|_/58D2 7E3D DDF4 7BA6 <-PGP-> 41D1 B375 37D0 8714\_|_/___/5445



--MeI29MV4WBbuw2+2
Content-Type: text/x-diff; charset=us-ascii
Content-Disposition: attachment;
	filename="0001-OvmfPkg-XenBusDxe-Unmap-shared-information-page-on-e.patch"

From 19b0e88b5e0d6954a924f444b02bcb576a115952 Mon Sep 17 00:00:00 2001
Message-Id: <19b0e88b5e0d6954a924f444b02bcb576a115952.1696517822.git.ehem+xen@m5p.com>
From: Elliott Mitchell <ehem+xen@m5p.com>
Date: Wed, 4 Oct 2023 21:47:17 -0700
Subject: [PATCH] OvmfPkg/XenBusDxe: Unmap shared information page on exit

Xen/ARM now requires the shared information page to only be mapped once.
This behavior is expected to be copied to Xen/x86 at some future point.

Signed-off-by: Elliott Mitchell <ehem+xen@m5p.com>
---
 OvmfPkg/XenBusDxe/XenBusDxe.c | 29 +++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/OvmfPkg/XenBusDxe/XenBusDxe.c b/OvmfPkg/XenBusDxe/XenBusDxe.c
index 132f43a72b..117a299d10 100644
--- a/OvmfPkg/XenBusDxe/XenBusDxe.c
+++ b/OvmfPkg/XenBusDxe/XenBusDxe.c
@@ -84,6 +84,33 @@ XenGetSharedInfoPage (
   return EFI_SUCCESS;
 }
 
+/**
+  Unmap the shared_info_t page from memory.
+
+  @param Dev    A XENBUS_DEVICE instance.
+**/
+VOID
+XenClearSharedInfoPage (
+  IN OUT XENBUS_DEVICE  *Dev
+  )
+{
+  xen_remove_from_physmap_t  Parameter;
+
+  //
+  // Either never mapped, or else already cleared.  No further cleanup
+  // action required.
+  //
+  if (!Dev->SharedInfo) return;
+
+  Parameter.domid = DOMID_SELF;
+  Parameter.gpfn  = (UINTN)Dev->SharedInfo >> EFI_PAGE_SHIFT;
+  if (XenHypercallMemoryOp (XENMEM_remove_from_physmap, &Parameter) != 0)
+    return;
+
+  FreePages (Dev->SharedInfo, 1);
+  Dev->SharedInfo = NULL;
+}
+
 /**
   Unloads an image.
 
@@ -501,6 +528,8 @@ XenBusDxeDriverBindingStop (
   XenStoreDeinit (Dev);
   XenGrantTableDeinit (Dev);
 
+  XenClearSharedInfoPage(Dev);
+
   gBS->CloseProtocol (
          ControllerHandle,
          &gEfiDevicePathProtocolGuid,
-- 
2.39.2


--MeI29MV4WBbuw2+2--

