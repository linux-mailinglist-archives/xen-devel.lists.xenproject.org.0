Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 17009241CB4
	for <lists+xen-devel@lfdr.de>; Tue, 11 Aug 2020 16:48:40 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k5VYg-0005cw-Ty; Tue, 11 Aug 2020 14:47:22 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=+4EG=BV=trmm.net=hudson@srs-us1.protection.inumbo.net>)
 id 1k5VYf-0005cr-15
 for xen-devel@lists.xenproject.org; Tue, 11 Aug 2020 14:47:21 +0000
X-Inumbo-ID: 6cf5ab0e-753d-4022-92e3-eeed1bb83e07
Received: from mail1.protonmail.ch (unknown [185.70.40.18])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6cf5ab0e-753d-4022-92e3-eeed1bb83e07;
 Tue, 11 Aug 2020 14:47:17 +0000 (UTC)
Date: Tue, 11 Aug 2020 14:47:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=trmm.net;
 s=protonmail; t=1597157235;
 bh=1bj2mENroGCRB+/A1DX5xD7jEWBz0ibf2sqMew+vKd4=;
 h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
 b=bHSSd2QhWY0Sl0hwiKxtb2jRpA05nxfgm5NW1RLJhGegrjdu4eDrdoAKCrfTmPIp6
 y886e58VxjuPffZ6HW9EM82S3cCPROdB5DfTKw2je0G+FMmRF6Yd77pVpUp9vGWwad
 uet1gooxMTUX3ozOrqxFRIlppYDFrCfFubt5jQac=
To: Jan Beulich <jbeulich@suse.com>
From: Trammell Hudson <hudson@trmm.net>
Subject: Re: [RFC] efi/boot: Unified Xen executable for UEFI Secure Boot
 support
Message-ID: <R7aUb5x20WJaKNC0-ug_5CtqyrJQlSd8J1jy1urYoEiU10J2yTd9PmNX72ZNDP01-HrVBi0r18HlkUGXGGOI2oVgWJU4Yrjel1y_W8GtYo4=@trmm.net>
In-Reply-To: <1489916a-24cc-3e2c-98a0-1f35186e4b06@suse.com>
References: <SQvDCuitxs8ZbVLJqpnPlbhTvIw_fMkZDetiBpJD-DID2X8EnTvReCaJgThJ8b-3kS9gHm3-HYRqNJk-k1cVYPIQf04R8uuhPjm9WNKzJh4=@trmm.net>
 <1bd2d79e-5bef-835c-f6cc-9fd367e8beb7@suse.com>
 <FKRB6MJm-n6DwX0LoYfI4Ysny1U_xRbxvZn7ttLHGxpKTEnAmcoDMLsLsgKZGYaB2eVuIzoNQ6UPpsfiMlaRPW-7AIXQ9mqz_i9sF-tI2Ks=@trmm.net>
 <5e3b16b3-0f93-4683-dcc7-852c805870c8@suse.com>
 <y5v76XS6whE9vu9FqI2eN6ieuvXkjnAJ1oaBXdXyKKNjJxvbLqaRnHi99iq_AIknqaQ9V18cLCLy9v3dV8YIEsfyrQq9apJRcWiQeFXuGuk=@trmm.net>
 <1489916a-24cc-3e2c-98a0-1f35186e4b06@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.2 required=7.0 tests=ALL_TRUSTED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF shortcircuit=no
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on mail.protonmail.ch
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
Reply-To: Trammell Hudson <hudson@trmm.net>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Friday, August 7, 2020 2:23 PM, Jan Beulich <jbeulich@suse.com> wrote:
> On 06.08.2020 16:15, Trammell Hudson wrote:
> > --- /dev/null
> > +++ b/xen/arch/x86/efi/pe.c
> > @@ -0,0 +1 @@
> > +../../../common/efi/pe.c
> > \ No newline at end of file
>
> This isn't supposed to be part of the patch; the symlinks get
> created in the course of building.

Fixed -- had to add the pe.c to the xen/Makefile to create the symlink.

> > -   s2w(&name_string);
> > -   PrintStr(name_string.w);
> > -   PrintStr(L": ");
> > -   DisplayUint(file->addr, 2 * sizeof(file->addr));
> > -   PrintStr(L"-");
> > -   DisplayUint(file->addr + file->size, 2 * sizeof(file->addr));
> > -   PrintStr(newline);
> > -
> > -   efi_arch_handle_module(file, name_string.w, options);
>
> This is a copy of existing code - please make a helper function
> instead of duplicating (preferably in a separate, prereq patch, but
> I guess there's anyway the open question on whether this change
> can/should be split into smaller pieces).

Fixed -- split into separate display file info function.

> > -   static const EFI_GUID global_guid =3D EFI_GLOBAL_VARIABLE;
>
> Also __initconst please.

Fixed.  I'm a little surprised that constant strings don't also need
some sort of annotation, but perhaps there is magic that I don't see.

> > -   if ( efi_rs->GetVariable(L"SecureBoot", (EFI_GUID *)&global_guid, N=
ULL, &size, buf) !=3D EFI_SUCCESS )
> > -          return false;
>
> Judging from Linux code you also need to evaluate the SetupMode var.

Fixed.  Added a note to maintain sync with the Linux code (which has its
own note about maintaining sync with other Linux code).

> > -   if ( loaded_image )
> > -          image_base =3D loaded_image->ImageBase;
>
> There's no point in having the if() - efi_arch_load_addr_check()
> has already de-referenced loaded_image. If HandleProtocol() fails
> we won't make it here.

Fixed.  Also removed the variable to use EFI_LOADED_IMAGE struct instead.

> [...]
> As said before, I think we want an all-or-nothing approach. You
> want to first establish whether the image is a unified one, and
> if so not fall back to reading from disk. Otherwise the claim
> of secure boot above is liable to be wrong.
>
> I'm also unconvinced of reporting the secure boot status only in
> the case you're interested in.

Andrew had similar comments on this flow; I'll respond to both
in a separate reply.

> > -   const CHAR8 * const base =3D image_base;
>
> Why the extra variable? The more that ...

Fixed (by passing the EFI_LOADED_IMAGE instead so that we can
check sizes, etc).

> > -   if ( pe->FileHeader.NumberOfSections > 96 )
> > -          return NULL;
>
> Besides there still needing to be an explanation for this apparently
> arbitrary limit, I also find the amount of consistency checking
> insufficient. At the very least I'd like to see you check the COFF
> magic value (0x020b).

I've removed the 96 limit, which came from the original systemd-boot.
And I also added more extensive bounds checking on the PE structures to
ensure that they all are within the loaded image region.  An attacker
probably couldn't exploit it, since the signature is already checked,
but better than weird memory errors.

> > -              if ( size_out )
> > -                  *size_out =3D sect->VirtualSize;
>
> Is this correct in all cases? Iirc zero tail padding can be
> expressed by SizeOfRawData < VirtualSize, in which case there
> won't be as many bytes to copy / use as you tell your caller.

I don't know, perhaps objcopy doesn't do that?  This logic is also copied d=
irectly
from the systemd-boot PE parser:

https://github.com/systemd/systemd/blob/master/src/boot/efi/pe.c#L101

> > -              return (void*)(sect->VirtualAddress + (uintptr_t) image_=
base);
>
> Again no need for the cast; the function should return
> const void * anyway, as the caller isn't supposed to alter
> section contents (I hope).

Fixed and the signature changed to return const void *.  This does require
a dangerous const-discarding cast since struct file has a void *.  In gener=
al
the edk2-derived code base is really bad about const-correctness, which mig=
ht
be worth a separate cleanup pass.

> > --- /dev/null
> > +++ b/xen/scripts/unify-xen
> > @@ -0,0 +1,89 @@
> > +#!/bin/bash
> > +# Build a "unified Xen" image.
> > +# Usage
> > +# unify xen.efi xen.cfg bzimage initrd [xsm [ucode]]
> > [...]
>
> With all these hard coded size restrictions I take it this still is
> just an example, not something that is to eventually get committed.

I'm wondering if for the initial merge if it is better to include just
the objcopy command line to show how to do it in the documentation, similar
to how systemd-boot documents it, rather than providing a tool.  At a later
time a more correct unify script could be merged.

Updated patch follows:

diff --git a/xen/Makefile b/xen/Makefile
index a87bb225dc..e4e4c6d5c1 100644
--- a/xen/Makefile
+++ b/xen/Makefile
@@ -355,7 +355,7 @@ $(TARGET): delete-unfresh-files
 =09$(MAKE) -C tools
 =09$(MAKE) -f $(BASEDIR)/Rules.mk include/xen/compile.h
 =09[ -e include/asm ] || ln -sf asm-$(TARGET_ARCH) include/asm
-=09[ -e arch/$(TARGET_ARCH)/efi ] && for f in boot.c runtime.c compat.c ef=
i.h;\
+=09[ -e arch/$(TARGET_ARCH)/efi ] && for f in boot.c pe.c runtime.c compat=
.c efi.h;\
 =09=09do test -r arch/$(TARGET_ARCH)/efi/$$f || \
 =09=09   ln -nsf ../../../common/efi/$$f arch/$(TARGET_ARCH)/efi/; \
 =09=09done; \
diff --git a/xen/arch/arm/efi/efi-boot.h b/xen/arch/arm/efi/efi-boot.h
index 6527cb0bdf..483dec465d 100644
--- a/xen/arch/arm/efi/efi-boot.h
+++ b/xen/arch/arm/efi/efi-boot.h
@@ -395,7 +395,7 @@ static void __init efi_arch_cfg_file_early(EFI_FILE_HAN=
DLE dir_handle, char *sec
         blexit(L"Unable to create new FDT");
 }

-static void __init efi_arch_cfg_file_late(EFI_FILE_HANDLE dir_handle, char=
 *section)
+static void __init efi_arch_cfg_file_late(EFI_LOADED_IMAGE * image, EFI_FI=
LE_HANDLE dir_handle, char *section)
 {
 }

diff --git a/xen/arch/x86/efi/Makefile b/xen/arch/x86/efi/Makefile
index 4b2b010a80..ae666aa14c 100644
--- a/xen/arch/x86/efi/Makefile
+++ b/xen/arch/x86/efi/Makefile
@@ -8,7 +8,7 @@ cmd_objcopy_o_ihex =3D $(OBJCOPY) -I ihex -O binary $< $@

 boot.init.o: buildid.o

-EFIOBJ :=3D boot.init.o compat.o runtime.o
+EFIOBJ :=3D boot.init.o pe.init.o compat.o runtime.o

 $(call cc-option-add,cflags-stack-boundary,CC,-mpreferred-stack-boundary=
=3D4)
 $(EFIOBJ): CFLAGS-stack-boundary :=3D $(cflags-stack-boundary)
diff --git a/xen/arch/x86/efi/efi-boot.h b/xen/arch/x86/efi/efi-boot.h
index 7188c9a551..e2650c0440 100644
--- a/xen/arch/x86/efi/efi-boot.h
+++ b/xen/arch/x86/efi/efi-boot.h
@@ -276,9 +276,11 @@ static void __init efi_arch_cfg_file_early(EFI_FILE_HA=
NDLE dir_handle, char *sec
 {
 }

-static void __init efi_arch_cfg_file_late(EFI_FILE_HANDLE dir_handle, char=
 *section)
+static void __init efi_arch_cfg_file_late(EFI_LOADED_IMAGE * image, EFI_FI=
LE_HANDLE dir_handle, char *section)
 {
     union string name;
+    if ( read_section(image, ".ucode", &ucode, NULL) )
+        return;

     name.s =3D get_value(&cfg, section, "ucode");
     if ( !name.s )
diff --git a/xen/common/efi/boot.c b/xen/common/efi/boot.c
index 5a520bf21d..72ef472297 100644
--- a/xen/common/efi/boot.c
+++ b/xen/common/efi/boot.c
@@ -102,6 +102,7 @@ union string {

 struct file {
     UINTN size;
+    bool need_to_free;
     union {
         EFI_PHYSICAL_ADDRESS addr;
         void *ptr;
@@ -121,6 +122,8 @@ static CHAR16 *s2w(union string *str);
 static char *w2s(const union string *str);
 static bool read_file(EFI_FILE_HANDLE dir_handle, CHAR16 *name,
                       struct file *file, char *options);
+static bool read_section(EFI_LOADED_IMAGE * image,
+        char * name, struct file *file, char *options);
 static size_t wstrlen(const CHAR16 * s);
 static int set_color(u32 mask, int bpp, u8 *pos, u8 *sz);
 static bool match_guid(const EFI_GUID *guid1, const EFI_GUID *guid2);
@@ -330,13 +333,13 @@ static void __init noreturn blexit(const CHAR16 *str)
     if ( !efi_bs )
         efi_arch_halt();

-    if ( cfg.addr )
+    if ( cfg.addr && cfg.need_to_free)
         efi_bs->FreePages(cfg.addr, PFN_UP(cfg.size));
-    if ( kernel.addr )
+    if ( kernel.addr && kernel.need_to_free)
         efi_bs->FreePages(kernel.addr, PFN_UP(kernel.size));
-    if ( ramdisk.addr )
+    if ( ramdisk.addr && ramdisk.need_to_free)
         efi_bs->FreePages(ramdisk.addr, PFN_UP(ramdisk.size));
-    if ( xsm.addr )
+    if ( xsm.addr && xsm.need_to_free)
         efi_bs->FreePages(xsm.addr, PFN_UP(xsm.size));

     efi_arch_blexit();
@@ -589,6 +592,21 @@ static char * __init split_string(char *s)
     return NULL;
 }

+static void __init display_file_info(CHAR16 * name, struct file * file, ch=
ar * options)
+{
+    if ( file =3D=3D &cfg )
+        return;
+
+    PrintStr(name);
+    PrintStr(L": ");
+    DisplayUint(file->addr, 2 * sizeof(file->addr));
+    PrintStr(L"-");
+    DisplayUint(file->addr + file->size, 2 * sizeof(file->addr));
+    PrintStr(newline);
+
+    efi_arch_handle_module(file, name, options);
+}
+
 static bool __init read_file(EFI_FILE_HANDLE dir_handle, CHAR16 *name,
                              struct file *file, char *options)
 {
@@ -619,6 +637,7 @@ static bool __init read_file(EFI_FILE_HANDLE dir_handle=
, CHAR16 *name,
         what =3D what ?: L"Seek";
     else
     {
+        file->need_to_free =3D true;
         file->addr =3D min(1UL << (32 + PAGE_SHIFT),
                          HYPERVISOR_VIRT_END - DIRECTMAP_VIRT_START);
         ret =3D efi_bs->AllocatePages(AllocateMaxAddress, EfiLoaderData,
@@ -632,16 +651,7 @@ static bool __init read_file(EFI_FILE_HANDLE dir_handl=
e, CHAR16 *name,
     else
     {
         file->size =3D size;
-        if ( file !=3D &cfg )
-        {
-            PrintStr(name);
-            PrintStr(L": ");
-            DisplayUint(file->addr, 2 * sizeof(file->addr));
-            PrintStr(L"-");
-            DisplayUint(file->addr + size, 2 * sizeof(file->addr));
-            PrintStr(newline);
-            efi_arch_handle_module(file, name, options);
-        }
+        display_file_info(name, file, options);

         ret =3D FileHandle->Read(FileHandle, &file->size, file->ptr);
         if ( !EFI_ERROR(ret) && file->size !=3D size )
@@ -665,6 +675,24 @@ static bool __init read_file(EFI_FILE_HANDLE dir_handl=
e, CHAR16 *name,
     return true;
 }

+static bool __init read_section(EFI_LOADED_IMAGE * image,
+                                char * const name, struct file *file, char=
 *options)
+{
+    union string name_string =3D { .s =3D name + 1 };
+
+    file->ptr =3D (void*) pe_find_section(image->ImageBase, image->ImageSi=
ze, name, &file->size);
+    if ( !file->ptr )
+        return false;
+
+    file->need_to_free =3D false;
+
+    s2w(&name_string);
+    display_file_info(name_string.w, file, options);
+    efi_bs->FreePool(name_string.w);
+
+    return true;
+}
+
 static void __init pre_parse(const struct file *cfg)
 {
     char *ptr =3D cfg->ptr, *end =3D ptr + cfg->size;
@@ -968,6 +996,26 @@ static void __init setup_efi_pci(void)
     efi_bs->FreePool(handles);
 }

+/*
+ * Logic should remain sync'ed with linux/arch/x86/xen/efi.c
+ * Secure Boot is enabled iff 'SecureBoot' is set and the system is
+ * not in Setup Mode.
+ */
+static bool __init efi_secure_boot(void)
+{
+    static const __initconst EFI_GUID global_guid =3D EFI_GLOBAL_VARIABLE;
+    uint8_t secboot, setupmode;
+    UINTN secboot_size =3D sizeof(secboot);
+    UINTN setupmode_size =3D sizeof(setupmode);
+
+    if ( efi_rs->GetVariable(L"SecureBoot", (EFI_GUID *)&global_guid, NULL=
, &secboot_size, &secboot) !=3D EFI_SUCCESS )
+        return false;
+    if ( efi_rs->GetVariable(L"SetupMode", (EFI_GUID *)&global_guid, NULL,=
 &setupmode_size, &setupmode) !=3D EFI_SUCCESS )
+        return false;
+
+    return secboot =3D=3D 1 && setupmode =3D=3D 0;
+}
+
 static void __init efi_variables(void)
 {
     EFI_STATUS status;
@@ -1144,8 +1192,8 @@ efi_start(EFI_HANDLE ImageHandle, EFI_SYSTEM_TABLE *S=
ystemTable)
     static EFI_GUID __initdata shim_lock_guid =3D SHIM_LOCK_PROTOCOL_GUID;
     EFI_LOADED_IMAGE *loaded_image;
     EFI_STATUS status;
-    unsigned int i, argc;
-    CHAR16 **argv, *file_name, *cfg_file_name =3D NULL, *options =3D NULL;
+    unsigned int i, argc =3D 0;
+    CHAR16 **argv =3D NULL, *file_name, *cfg_file_name =3D NULL, *options =
=3D NULL;
     UINTN gop_mode =3D ~0;
     EFI_SHIM_LOCK_PROTOCOL *shim_lock;
     EFI_GRAPHICS_OUTPUT_PROTOCOL *gop =3D NULL;
@@ -1153,6 +1201,7 @@ efi_start(EFI_HANDLE ImageHandle, EFI_SYSTEM_TABLE *S=
ystemTable)
     bool base_video =3D false;
     char *option_str;
     bool use_cfg_file;
+    bool secure =3D false;

     __set_bit(EFI_BOOT, &efi_flags);
     __set_bit(EFI_LOADER, &efi_flags);
@@ -1171,8 +1220,10 @@ efi_start(EFI_HANDLE ImageHandle, EFI_SYSTEM_TABLE *=
SystemTable)
         PrintErrMesg(L"No Loaded Image Protocol", status);

     efi_arch_load_addr_check(loaded_image);
+    secure =3D efi_secure_boot();

-    if ( use_cfg_file )
+    /* If UEFI Secure Boot is enabled, do not parse the command line */
+    if ( use_cfg_file && !secure )
     {
         UINTN offset =3D 0;

@@ -1249,9 +1300,15 @@ efi_start(EFI_HANDLE ImageHandle, EFI_SYSTEM_TABLE *=
SystemTable)
         /* Get the file system interface. */
         dir_handle =3D get_parent_handle(loaded_image, &file_name);

-        /* Read and parse the config file. */
-        if ( !cfg_file_name )
+        if ( read_section(loaded_image, ".config", &cfg, NULL) )
         {
+            if ( secure )
+                PrintStr(L"Secure Boot enabled: ");
+            PrintStr(L"Using unified config file\r\n");
+        }
+        else if ( !cfg_file_name )
+        {
+            /* Read and parse the config file. */
             CHAR16 *tail;

             while ( (tail =3D point_tail(file_name)) !=3D NULL )
@@ -1303,26 +1360,36 @@ efi_start(EFI_HANDLE ImageHandle, EFI_SYSTEM_TABLE =
*SystemTable)
         efi_arch_cfg_file_early(dir_handle, section.s);

         option_str =3D split_string(name.s);
-        read_file(dir_handle, s2w(&name), &kernel, option_str);
-        efi_bs->FreePool(name.w);
-
-        if ( !EFI_ERROR(efi_bs->LocateProtocol(&shim_lock_guid, NULL,
-                        (void **)&shim_lock)) &&
-             (status =3D shim_lock->Verify(kernel.ptr, kernel.size)) !=3D =
EFI_SUCCESS )
-            PrintErrMesg(L"Dom0 kernel image could not be verified", statu=
s);

-        name.s =3D get_value(&cfg, section.s, "ramdisk");
-        if ( name.s )
+        if ( !read_section(loaded_image, ".kernel", &kernel, option_str) )
         {
-            read_file(dir_handle, s2w(&name), &ramdisk, NULL);
+            read_file(dir_handle, s2w(&name), &kernel, option_str);
             efi_bs->FreePool(name.w);
+
+            if ( !EFI_ERROR(efi_bs->LocateProtocol(&shim_lock_guid, NULL,
+                            (void **)&shim_lock)) &&
+                 (status =3D shim_lock->Verify(kernel.ptr, kernel.size)) !=
=3D EFI_SUCCESS )
+                PrintErrMesg(L"Dom0 kernel image could not be verified", s=
tatus);
         }

-        name.s =3D get_value(&cfg, section.s, "xsm");
-        if ( name.s )
+        if ( !read_section(loaded_image, ".ramdisk", &ramdisk, NULL) )
         {
-            read_file(dir_handle, s2w(&name), &xsm, NULL);
-            efi_bs->FreePool(name.w);
+            name.s =3D get_value(&cfg, section.s, "ramdisk");
+            if ( name.s )
+            {
+                read_file(dir_handle, s2w(&name), &ramdisk, NULL);
+                efi_bs->FreePool(name.w);
+            }
+        }
+
+        if ( !read_section(loaded_image, ".xsm", &xsm, NULL) )
+        {
+            name.s =3D get_value(&cfg, section.s, "xsm");
+            if ( name.s )
+            {
+                read_file(dir_handle, s2w(&name), &xsm, NULL);
+                efi_bs->FreePool(name.w);
+            }
         }

         /*
@@ -1358,7 +1425,7 @@ efi_start(EFI_HANDLE ImageHandle, EFI_SYSTEM_TABLE *S=
ystemTable)
             }
         }

-        efi_arch_cfg_file_late(dir_handle, section.s);
+        efi_arch_cfg_file_late(loaded_image, dir_handle, section.s);

         efi_bs->FreePages(cfg.addr, PFN_UP(cfg.size));
         cfg.addr =3D 0;
diff --git a/xen/common/efi/efi.h b/xen/common/efi/efi.h
index 2e38d05f3d..d3018f81a1 100644
--- a/xen/common/efi/efi.h
+++ b/xen/common/efi/efi.h
@@ -41,3 +41,6 @@ extern UINT64 efi_apple_properties_addr;
 extern UINTN efi_apple_properties_len;

 const CHAR16 *wmemchr(const CHAR16 *s, CHAR16 c, UINTN n);
+
+const void * pe_find_section(const UINT8 * image_base, const size_t image_=
size,
+        const char * section_name, UINTN * size_out);
diff --git a/xen/common/efi/pe.c b/xen/common/efi/pe.c
new file mode 100644
index 0000000000..c70bb4566a
--- /dev/null
+++ b/xen/common/efi/pe.c
@@ -0,0 +1,139 @@
+/*
+ * xen/common/efi/pe.c
+ *
+ * PE executable header parser.
+ *
+ * Derived from https://github.com/systemd/systemd/blob/master/src/boot/ef=
i/pe.c
+ *
+ * Copyright (C) 2015 Kay Sievers <kay@vrfy.org>
+ *
+ * This program is free software; you can redistribute it and/or modify it
+ * under the terms of the GNU Lesser General Public License as published b=
y
+ * the Free Software Foundation; either version 2.1 of the License, or
+ * (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful, but
+ * WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
+ * Lesser General Public License for more details.
+ */
+
+
+#include "efi.h"
+
+struct DosFileHeader {
+    UINT8   Magic[2];
+    UINT16  LastSize;
+    UINT16  nBlocks;
+    UINT16  nReloc;
+    UINT16  HdrSize;
+    UINT16  MinAlloc;
+    UINT16  MaxAlloc;
+    UINT16  ss;
+    UINT16  sp;
+    UINT16  Checksum;
+    UINT16  ip;
+    UINT16  cs;
+    UINT16  RelocPos;
+    UINT16  nOverlay;
+    UINT16  reserved[4];
+    UINT16  OEMId;
+    UINT16  OEMInfo;
+    UINT16  reserved2[10];
+    UINT32  ExeHeader;
+} __attribute__((packed));
+
+#define PE_HEADER_MACHINE_ARM64         0xaa64
+#define PE_HEADER_MACHINE_X64           0x8664
+#define PE_HEADER_MACHINE_I386          0x014c
+
+struct PeFileHeader {
+    UINT16  Machine;
+    UINT16  NumberOfSections;
+    UINT32  TimeDateStamp;
+    UINT32  PointerToSymbolTable;
+    UINT32  NumberOfSymbols;
+    UINT16  SizeOfOptionalHeader;
+    UINT16  Characteristics;
+} __attribute__((packed));
+
+struct PeHeader {
+    UINT8   Magic[4];
+    struct PeFileHeader FileHeader;
+} __attribute__((packed));
+
+struct PeSectionHeader {
+    UINT8   Name[8];
+    UINT32  VirtualSize;
+    UINT32  VirtualAddress;
+    UINT32  SizeOfRawData;
+    UINT32  PointerToRawData;
+    UINT32  PointerToRelocations;
+    UINT32  PointerToLinenumbers;
+    UINT16  NumberOfRelocations;
+    UINT16  NumberOfLinenumbers;
+    UINT32  Characteristics;
+} __attribute__((packed));
+
+const void * __init pe_find_section(const CHAR8 * image, const UINTN image=
_size,
+                              const char * section_name, UINTN * size_out)
+{
+    const struct DosFileHeader * dos =3D (const void*) image;
+    const struct PeHeader * pe;
+    const struct PeSectionHeader * sect;
+    const UINTN name_len =3D strlen(section_name);
+    UINTN offset =3D 0;
+
+    if ( name_len > sizeof(sect->Name) )
+        return NULL;
+
+    if ( image_size < sizeof(*dos) )
+        return NULL;
+    if ( memcmp(dos->Magic, "MZ", 2) !=3D 0 )
+        return NULL;
+
+    offset =3D dos->ExeHeader;
+    pe =3D (const void *) &image[offset];
+
+    offset +=3D sizeof(*pe);
+    if ( image_size < offset)
+        return NULL;
+
+    if ( memcmp(pe->Magic, "PE\0\0", 4) !=3D 0 )
+        return NULL;
+
+    /* PE32+ Subsystem type */
+#if defined(__ARM__)
+    if (pe->FileHeader.Machine !=3D PE_HEADER_MACHINE_ARM64)
+        return NULL;
+#elif defined(__x86_64__)
+    if (pe->FileHeader.Machine !=3D PE_HEADER_MACHINE_X64)
+        return NULL;
+#else
+    /* unknown architecture */
+    return NULL;
+#endif
+
+    offset +=3D pe->FileHeader.SizeOfOptionalHeader;
+
+    for (UINTN i =3D 0 ; i < pe->FileHeader.NumberOfSections ; i++)
+    {
+        sect =3D (const void *) &image[offset];
+        if ( image_size < offset + sizeof(*sect) )
+            return NULL;
+
+        if ( memcmp(sect->Name, section_name, name_len) !=3D 0
+        ||   image_size < sect->VirtualSize + sect->VirtualAddress )
+        {
+            offset +=3D sizeof(*sect);
+            continue;
+        }
+
+        if ( size_out )
+            *size_out =3D sect->VirtualSize;
+
+        return &image[sect->VirtualAddress];
+    }
+
+    return NULL;
+}


