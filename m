Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7996C81BDEF
	for <lists+xen-devel@lfdr.de>; Thu, 21 Dec 2023 19:10:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.659085.1028529 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rGNTr-0005li-TH; Thu, 21 Dec 2023 18:09:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 659085.1028529; Thu, 21 Dec 2023 18:09:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rGNTr-0005is-Qe; Thu, 21 Dec 2023 18:09:11 +0000
Received: by outflank-mailman (input) for mailman id 659085;
 Thu, 21 Dec 2023 18:09:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=VfJF=IA=neowutran.ovh=xen@srs-se1.protection.inumbo.net>)
 id 1rGNTq-0005im-Dw
 for xen-devel@lists.xenproject.org; Thu, 21 Dec 2023 18:09:10 +0000
Received: from neowutran.ovh (core.neowutran.ovh [51.83.40.211])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 08af5750-a02c-11ee-98eb-6d05b1d4d9a1;
 Thu, 21 Dec 2023 19:09:08 +0100 (CET)
Received: from neowutran.ovh (maisonhome.neowutran.ovh [82.65.3.49])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1) server-digest SHA384)
 (No client certificate requested)
 by neowutran.ovh (Postfix) with ESMTPSA id 570596131C;
 Thu, 21 Dec 2023 18:09:06 +0000 (UTC)
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
X-Inumbo-ID: 08af5750-a02c-11ee-98eb-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=neowutran.ovh; s=mail;
	t=1703182146; bh=xx9W8hv7Sq7yQ0w3Sc/b9EE8coBORtu7P0HVJIi/beE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=XkKSMsNZqNA2z+9ML2yexCKnpea54Jk2YTGGmJARHBL+G4cgn71tvkjfCyE8XjNEU
	 ySv11ahz8GI9kDRm0c3G1dOSRaqOYYIUHDTkALNTzaOF/2tAtAWsd+VVu/X//I3+5i
	 Q+K65lE9xeyGX2LipdHI/v3maltw3XyOKhciKljdUmIsd8QX7eCQisjUyOm7QO/08/
	 SliLWhfGL4pZsenqbUvLZo6KW2RmhDWrd7tQ1t+STC2opVetMKD+r/DxVZ4EdNsoEC
	 goVfyqnf4iCnHPDaT2WobhWAOmz8O1o40LWoLFSGWeq7jLg8cCnHyByz7Zh6nofjfa
	 QdeRRad+7UphfQDF4F6fIN8l629MEivTCDyhcJ5u6kM3MNEt5DKj7qy/9q2i41YtTZ
	 bVx2puJqyrVCnQXT0B1jYlHuqPr4h7zFO4JH/Xe3F35fSKqHgEPOnRROGgD6MypLLo
	 JqMef1OB4ekLwaCXsfZk/NKc6EU4/NNSMpU4hqp4Tecn9F1yTb81eYFj0lye1SIo+0
	 W5ExgZeAdHzHqDYgF/iQxJjVnSanD9AlLIdNbNzsncLheJqlGBJnMmyeRQPHWrQ7vB
	 x4T+08nKEkpjlkQCIBcrD2O6diMK1MS/DN5Zwp3EZaQqfkLgbs972tCIvyQVXjZ0M+
	 UbKfvqCF7bW5CokuCd8dCdyQ=
Date: Thu, 21 Dec 2023 19:08:50 +0100
From: Neowutran <xen@neowutran.ovh>
To: Jan Beulich <jbeulich@suse.com>
Cc: Neowutran <xen@neowutran.ovh>, xen-devel@lists.xenproject.org
Subject: Re: hvmloader - allow_memory_relocate overlaps
Message-ID: <lyqv62ezqqaybcfuhkvbhiltvnxyy32wzr36kclh7bzrupcvib@a5fpoe6atykl>
References: <7oe275z3eap7rhdwmrm4mvqnjnhrpag5cjwnfvwsf7rchhkyjv@pd3abzwdhg6v>
 <217649a9-8399-48d3-ba49-ae22cacf0d4b@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <217649a9-8399-48d3-ba49-ae22cacf0d4b@suse.com>

On 2023-12-19 17:12, Jan Beulich wrote:
> On 16.12.2023 08:01, Neowutran wrote:
> > I am wondering if the variable "allow_memory_relocate" is still
> > relevant today and if its default value is still relevant. 
> > Should it be defined to 0 by default instead of 1 (it seems to be a
> > workaround for qemu-traditional, so maybe an outdated default value ? ) ? 
> 
> So are you saying you use qemu-trad?
No, I am using "qemu_xen" ( from  
xenstore-read -> 'device-model =
"qemu_xen"' 

> Otherwise isn't libxl suppressing this behavior anyway?
If by "isn't libxl suppressing this behavior" you means if libxl is setting
the value of "allow_memory_relocate", then the answer is no. 

Following this lead, I checked in what code path
"allow_memory_relocate" could be defined. 

It is only defined in one code path, 

In the file "tools/libs/light/libxl_dm.c",
in the function "void libxl__spawn_local_dm(libxl__egc *egc, libxl__dm_spawn_state *dmss)": 

'''
 // ...
    if (b_info->type == LIBXL_DOMAIN_TYPE_HVM) {
 // ...

        libxl__xs_printf(gc, XBT_NULL,
                         GCSPRINTF("%s/hvmloader/allow-memory-relocate", path),
                         "%d",
                         b_info->device_model_version==LIBXL_DEVICE_MODEL_VERSION_QEMU_XEN_TRADITIONAL &&
                         !libxl__vnuma_configured(b_info));
// ...
'''

However, on QubesOS (my system), "local_dm" is never used, "stub_dm"
is always used. 

In the function "void lib 
xl__spawn_stub_dm(libxl__egc *egc, libxl__stub_dm_spawn_state *sdss)", 
the value of "allow_memory_relocate" is never defined. 

I tried to patch the code to define "allow_memory_relocate" in
"libxl__spawn_stub_dm": 

'''
--- a/tools/libs/light/libxl_dm.c
+++ b/tools/libs/light/libxl_dm.c
@@ -2431,6 +2431,10 @@ void libxl__spawn_stub_dm(libxl__egc *egc, libxl__stub_dm_spawn_state *sdss)
                                        libxl__xs_get_dompath(gc, guest_domid)),
                         "%s",
                         libxl_bios_type_to_string(guest_config->b_info.u.hvm.bios));
+        libxl__xs_printf(gc, XBT_NULL,
+                         libxl__sprintf(gc, "%s/hvmloader/allow-memory-relocate", libxl__xs_get_dompath(gc, guest_domid)),
+                         "%d",
+                         0);
     }
     ret = xc_domain_set_target(ctx->xch, dm_domid, guest_domid);
     if (ret<0) {
'''

And it is indeed another way to solve my issue. 
However I do not understand the xen hypervisor enough to known i 
f
"allow-memory-relocate" should have been defined in
"libxl__spawn_stub_dm" or if the real issue is somewhere else. 


> Or did that code go stale?
> 
> > Code extract: 
> > 
> > tools/firmware/hvmloader/pci.c 
> > "
> >    /*
> >      * Do we allow hvmloader to relocate guest memory in order to
> >      * increase the size of the lowmem MMIO hole?  Defaulting to 1
> >      * here will
> >  mean that non-libxl toolstacks (including xend and
> >      * home-grown ones) means that those using qemu-xen will still
> >      * experience the memory relocation bug described below; but it
> >      * also means that those using q 
> > emu-traditional will *not*
> >      * experience any change; and it also means that there is a
> >      * work-around for those using qemu-xen, namely switching to
> >      * qemu-traditional.
> >      *
> >      * If we defaulted to 0, and failing to resize the hole caused any
> >      * problems with qemu-traditional, then there is no work-around.
> >      *
> >      * Since xend can 
 only use qemu-traditional, I think this is the
> >      * option that will have the least impact.
> >      */
> >     bool allow_memory_relocate = 1;
> > "
> > 
> > "
> >         /*
> >          * At the moment qemu-xen can't deal with relocated memory regions.
> >          * It's too close to the release to make a proper fix; for now,
> >          * only allow t
> > he MMIO hole to grow large enough to move guest memory
> >          * if we're running qemu-traditional.  Items that don't fit will be
> >          * relocated into the 64-bit address space.
> >          *
> >          * This loop now does the following:
> >          * - If allow_memory_relocate, increase the MMIO hole until it's
> >          *   big enough, or  
> > until it's 2GiB
> >          * - If !allow_memory_relocate, increase the MMIO hole until it's
> >          *   big enough, or until it's 2GiB, or until it overlaps guest
> >          *   memory
> >          */
> >         while ( (mmio_total > (pci_mem_end - pci_mem_start))
> >     
             && ((pci_mem_start << 1) != 0)
> >                 && (allow_memory_relocate
> >                     || (((pci_mem_start << 1) >> PAGE_SHIFT)
> >                         >= hvm_info->low_mem_pgend)) )
> >             pci_mem_start <<= 1;
> > "
> > 
> > The issue it cause is documented in the source code: guest memory can
> > be trashed by the hvmloader. 
> > 
> > Due to this issue, it is impossible to passthrough a large PCI device to a HVM with a lot of ram.
> > (https://github.com/QubesOS/qubes-issues/issues/4321). 
> > 
> > (Forcing "allow_memory_relocate" to be 0 seems to solve the issue
> > linked)
> 
> What I don't understand here (and what I also can't find helpful logs for)
> is: The code in hvmloader is in principle intended to work in both cases.
> If there's suspected guest memory corruption, can we get to see the actual
> results of the MMIO hole creation and its using for device ranges? If there
> indeed is an overlap with guest RAM, that's a bug which wants fixing.

tools/firmware/ 
hvmloader/pci.c, function "void pci_setup(void)"
I added a log to print if the hvmloader would have tried to overlaps
guest memory

'''

+        printf("NEOWUTRAN pci.c: pci_mem_end: %d\n",pci_mem_end);
+        printf("NEOWUTRAN pci.c: pci_mem_start: %d\n",pci_mem_start);
+        printf("NEOWUTRAN pci.c: allow_memory_relocate: %d\n",allow_memory_relocate);
+        printf("NEOWUTRAN pci.c: hvm_info->low_mem_pgend: %d\n",hvm_info->low_mem_pgend);
+
+
        while ( (mmio_total > (pci_mem_end - pci_mem_start))
                && ((pci_mem_start << 1) != 0)
                && (allow_memory_relocate
                    || (((pci_mem_start << 1) >> PAGE_SHIFT)
                        >= hvm_info->low_mem_pgend)) )
            pci_mem_start <<= 1;

+         if ( (mmio_total > (pci_mem_end - pci_mem_start))
+                && ((pci_mem_start << 1) != 0)
+                && (1
+                    || (((pci_mem_start << 1) >> PAGE_SHIFT)
+                        >= hvm_info->low_mem_pgend)) ){
+                
printf("NEOWUTRAN pci.c: HVM_LOADER would have tried to relocate guest memory\n");
+               printf("NEOWUTRAN pci.c: pci_mem_start: %d\n",pci_mem_start);
+
+        }
'''

And the associated result is: 

(d22) NEOWUTRAN pci.c: pci_mem_end: -67108864
(d22) NEOWUTRAN pci.c: pci_mem_start: -268435456
(d22) NEOWUTRAN pci.c: allow_memory_relocate: 0
(d22) NEOWUTRAN pci.c: hvm_info->low_mem_pgend: 983040
(d22) NEOWUTRAN pci.c: HVM_LOADER would have tried to relocate guest memory
(d22) NEOWUTRAN pci.c: pci_mem_start: -268435456

So if "allow_memory_relocate" was not defined to 0, the hvmloader
would have tried to overlaps guest memory, and it seems that is
something that qemu_xen cannot handle.

> I
> don't see why we would want to drop allow_memory_relocate in the way you
> suggest; quite the other way around, if upstream qemu still can't tolerate
> hvmloader doing this, then it wants fixing there such that RAM relocation
> can be enabled unconditionally. Then the variable will indeed not be needed
> anymor 
e.

I can send different logs or try different things if needed 


> 
> Jan

Thanks, 
Neowutran
 

