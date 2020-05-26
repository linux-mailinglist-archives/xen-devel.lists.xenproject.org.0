Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0731C1E1FC6
	for <lists+xen-devel@lfdr.de>; Tue, 26 May 2020 12:34:01 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jdWtA-0002fT-QY; Tue, 26 May 2020 10:32:52 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vX9/=7I=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1jdWt9-0002fO-Tm
 for xen-devel@lists.xenproject.org; Tue, 26 May 2020 10:32:51 +0000
X-Inumbo-ID: 3c54960c-9f3c-11ea-a601-12813bfff9fa
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 3c54960c-9f3c-11ea-a601-12813bfff9fa;
 Tue, 26 May 2020 10:32:45 +0000 (UTC)
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: xxe8AOw4QDajVG4fl/Tl4hCojrrpsVEXkYh8SHc39ewwj/UFxLeOjKDlbL0LNICLFez0GsYRou
 ekEKJWG3u1nPA1+F61Kw4PWIiaM30pg88uDP1t2qyohyBoljWPOnWIfPD4CgK5kE6OGvqNAhxG
 pJ74kWBcbq4MmdCiklRivyLo4pt8vCViaDYcrYGXUOjgdP9wGQxtmfiUyeponFjQsBpeRl7PSe
 43VitVyCZ9rTtVWRWXfRz8m2swzx8YoMc0iWhTQ6916qx9KC27/8Mb/HqQgE58ifC2/qBz3g1+
 PKU=
X-SBRS: None
X-MesageID: 18425278
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-URL-LookUp-ScanningError: 1
Date: Tue, 26 May 2020 12:32:18 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Martin Lucina <martin@lucina.net>
Subject: Re: Xen PVH domU start-of-day VCPU state
Message-ID: <20200526102707.GC38408@Air-de-Roger>
References: <20200525160401.GA3091@nodbug.lucina.net>
 <a17fef73-382c-50b3-1e6b-5904fc3bf60f@suse.com>
 <6a22e477-c9e7-f0d7-6cb1-615137a778be@citrix.com>
 <20200526085221.GB5942@nodbug.lucina.net>
 <20200526093421.GA38408@Air-de-Roger>
 <20200526100337.GB38408@Air-de-Roger>
 <20200526101203.GE5942@nodbug.lucina.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200526101203.GE5942@nodbug.lucina.net>
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
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
Cc: =?utf-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>, anil@recoil.org,
 Andrew Cooper <andrew.cooper3@citrix.com>, mirageos-devel@lists.xenproject.org,
 dave@recoil.org, xen-devel@lists.xenproject.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

BTW, not sure why but my MUA (Mutt 11.0.3) seems to add everyone on Cc
to the To: field on reply, and drops your email address from the list.
I don't see a 'Reply-to:' on the headers, so I'm not sure why it does
that, but you might want to check your config.

I have to manually fix the headers to properly set the To: field to
your address and the Cc to everyone else.

On Tue, May 26, 2020 at 12:12:03PM +0200, Martin Lucina wrote:
> On Tuesday, 26.05.2020 at 12:03, Roger Pau Monné wrote:
> > On Tue, May 26, 2020 at 11:34:21AM +0200, Roger Pau Monné wrote:
> > > On Tue, May 26, 2020 at 10:52:21AM +0200, Martin Lucina wrote:
> > > > On Monday, 25.05.2020 at 17:59, Andrew Cooper wrote:
> > > > > On 25/05/2020 17:42, Jürgen Groß wrote:
> > > > > > You need to setup virtual addressing and enable 64 bit mode before using
> > > > > > 64-bit GDT.
> > > > > >
> > > > > > See Mini-OS source arch/x86/x86_hvm.S
> > > > > 
> > > > > Or
> > > > > https://xenbits.xen.org/gitweb/?p=people/andrewcoop/xen-test-framework.git;a=blob;f=arch/x86/hvm/head.S;h=f7dc72b58ab9ec68538f0087969ab6f72d181d80;hb=HEAD
> > > > > 
> > > > > But yes - Juergen is correct.  Until you have enabled long mode, lgdt
> > > > > will only load the bottom 32 bits of GDTR.base.
> > > > 
> > > > Ah, I missed Jurgen's and your reply here.
> > > > 
> > > > LGDT loading only the bottom 32 bits of GDTR.base shouldn't matter.
> > > > Examining gdt_ptr some more:
> > > > 
> > > >     (gdb) set architecture i386
> > > >     The target architecture is assumed to be i386
> > > >     (gdb) x /xh 0x108040
> > > >     0x108040:	0x002f
> > > >     (gdb) x /xw 0x108042
> > > >     0x108042:	0x00108000
> > > >     (gdb) x /6xb 0x108040
> > > >     0x108040:	0x2f	0x00	0x00	0x80	0x10	0x00
> > > >     (gdb) x /8xb 0x108040
> > > >     0x108040:	0x2f	0x00	0x00	0x80	0x10	0x00	0x00	0x00
> > > 
> > > Could you also print the GDT entry at 0x10 (ie: 0x108000 + 0x10), just
> > > to make sure it contains the right descriptor?
> > 
> > Forgot to ask, but can you also add the output of readelf -lW
> > <kernel>?
> 
>     Elf file type is EXEC (Executable file)
>     Entry point 0x1001e0
>     There are 7 program headers, starting at offset 64
> 
>     Program Headers:
>       Type           Offset   VirtAddr           PhysAddr           FileSiz  MemSiz   Flg Align
>       INTERP         0x001000 0x0000000000100000 0x0000000000100000 0x000018 0x000018 R   0x8
>           [Requesting program interpreter: /nonexistent/solo5/]
>       LOAD           0x001000 0x0000000000100000 0x0000000000100000 0x00626c 0x00626c R E 0x1000
>       LOAD           0x008000 0x0000000000107000 0x0000000000107000 0x007120 0x00ed48 RW  0x1000
>       NOTE           0x0080ac 0x00000000001070ac 0x00000000001070ac 0x000018 0x000018 R   0x4
>       NOTE           0x00f120 0x00000000001070c4 0x00000000001070c4 0x000014 0x000000 R   0x4
>       NOTE           0x008088 0x0000000000107088 0x0000000000107088 0x000024 0x000024 R   0x4
>       NOTE           0x008000 0x0000000000107000 0x0000000000107000 0x000088 0x000088 R   0x4
> 
>      Section to Segment mapping:
>       Segment Sections...
>        00     .interp
>        01     .interp .text .rodata .eh_frame
>        02     .note.solo5.manifest .note.solo5.abi .note.solo5.not-openbsd .data .bss
>        03     .note.solo5.not-openbsd
>        04     .note.solo5.xen
>        05     .note.solo5.abi
>        06     .note.solo5.manifest
> 
> The PT_INTERP and multiple PT_NOTE headers are that way due to specifics of
> how Solo5 ABIs work, but I've verified that the domain builder is
> interpreting XEN_ELFNOTE_PHYS32_ENTRY correctly.

Right, just wanted to double check that virtaddr == physaddr since you
didn't use any offset to get the physical address of symbols, but I
guess that if this wasn't correct you won't be even able to execute
the first instruction anyway.

Thanks, Roger.

