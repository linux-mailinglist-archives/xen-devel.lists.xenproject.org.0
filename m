Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AF9E729F6DF
	for <lists+xen-devel@lfdr.de>; Thu, 29 Oct 2020 22:30:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.15022.37558 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kYFUn-0004JA-Fq; Thu, 29 Oct 2020 21:30:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 15022.37558; Thu, 29 Oct 2020 21:30:09 +0000
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
	id 1kYFUn-0004Hp-Cc; Thu, 29 Oct 2020 21:30:09 +0000
Received: by outflank-mailman (input) for mailman id 15022;
 Thu, 29 Oct 2020 21:30:08 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=nYkQ=EE=m5p.com=ehem@srs-us1.protection.inumbo.net>)
 id 1kYFUm-0004Es-7w
 for xen-devel@lists.xenproject.org; Thu, 29 Oct 2020 21:30:08 +0000
Received: from mailhost.m5p.com (unknown [74.104.188.4])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 0f3d3471-aeb5-4326-92ce-f0fba5042a55;
 Thu, 29 Oct 2020 21:30:06 +0000 (UTC)
Received: from m5p.com (mailhost.m5p.com [IPv6:2001:470:1f07:15ff:0:0:0:f7])
 by mailhost.m5p.com (8.15.2/8.15.2) with ESMTPS id 09TLTtIO053328
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
 Thu, 29 Oct 2020 17:30:01 -0400 (EDT) (envelope-from ehem@m5p.com)
Received: (from ehem@localhost)
 by m5p.com (8.15.2/8.15.2/Submit) id 09TLTsYY053327;
 Thu, 29 Oct 2020 14:29:54 -0700 (PDT) (envelope-from ehem)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=nYkQ=EE=m5p.com=ehem@srs-us1.protection.inumbo.net>)
	id 1kYFUm-0004Es-7w
	for xen-devel@lists.xenproject.org; Thu, 29 Oct 2020 21:30:08 +0000
X-Inumbo-ID: 0f3d3471-aeb5-4326-92ce-f0fba5042a55
Received: from mailhost.m5p.com (unknown [74.104.188.4])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 0f3d3471-aeb5-4326-92ce-f0fba5042a55;
	Thu, 29 Oct 2020 21:30:06 +0000 (UTC)
Received: from m5p.com (mailhost.m5p.com [IPv6:2001:470:1f07:15ff:0:0:0:f7])
	by mailhost.m5p.com (8.15.2/8.15.2) with ESMTPS id 09TLTtIO053328
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
	Thu, 29 Oct 2020 17:30:01 -0400 (EDT)
	(envelope-from ehem@m5p.com)
Received: (from ehem@localhost)
	by m5p.com (8.15.2/8.15.2/Submit) id 09TLTsYY053327;
	Thu, 29 Oct 2020 14:29:54 -0700 (PDT)
	(envelope-from ehem)
Date: Thu, 29 Oct 2020 14:29:54 -0700
From: Elliott Mitchell <ehem+xen@m5p.com>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Julien Grall <julien@xen.org>, roman@zededa.com,
        xen-devel@lists.xenproject.org
Subject: Re: Xen on RP4
Message-ID: <20201029212954.GA50793@mattapan.m5p.com>
References: <20201023005629.GA83870@mattapan.m5p.com>
 <alpine.DEB.2.21.2010221801490.12247@sstabellini-ThinkPad-T480s>
 <20201023211941.GA90171@mattapan.m5p.com>
 <alpine.DEB.2.21.2010231647290.12247@sstabellini-ThinkPad-T480s>
 <20201024053540.GA97417@mattapan.m5p.com>
 <4fcf4832-9266-443f-54d0-fa1fff4b6e14@xen.org>
 <20201026160316.GA20589@mattapan.m5p.com>
 <7a904044-8206-b45d-8ec2-d4e48b07ea83@xen.org>
 <20201028015423.GA33407@mattapan.m5p.com>
 <alpine.DEB.2.21.2010281704250.12247@sstabellini-ThinkPad-T480s>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.21.2010281704250.12247@sstabellini-ThinkPad-T480s>
X-Spam-Status: No, score=0.0 required=10.0 tests=KHOP_HELO_FCRDNS
	autolearn=unavailable autolearn_force=no version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on mattapan.m5p.com

On Wed, Oct 28, 2020 at 05:37:02PM -0700, Stefano Stabellini wrote:
> On Tue, 27 Oct 2020, Elliott Mitchell wrote:
> > On Mon, Oct 26, 2020 at 06:44:27PM +0000, Julien Grall wrote:
> > > On 26/10/2020 16:03, Elliott Mitchell wrote:
> > > > On Mon, Oct 26, 2020 at 01:31:42PM +0000, Julien Grall wrote:
> > > >> On 24/10/2020 06:35, Elliott Mitchell wrote:
> > > >>> ACPI has a distinct
> > > >>> means of specifying a limited DMA-width; the above fails, because it
> > > >>> assumes a *device-tree*.
> > > >>
> > > >> Do you know if it would be possible to infer from the ACPI static table
> > > >> the DMA-width?
> > > > 
> > > > Yes, and it is.  Due to not knowing much about ACPI tables I don't know
> > > > what the C code would look like though (problem is which documentation
> > > > should I be looking at first?).
> > > 
> > > What you provided below is an excerpt of the DSDT. AFAIK, DSDT content 
> > > is written in AML. So far the shortest implementation I have seen for 
> > > the AML parser is around 5000 lines (see [1]). It might be possible to 
> > > strip some the code, although I think this will still probably too big 
> > > for a single workaround.
> > > 
> > > What I meant by "static table" is a table that looks like a structure 
> > > and can be parsed in a few lines. If we can't find on contain the DMA 
> > > window, then the next best solution is to find a way to identity the 
> > > platform.
> > > 
> > > I don't know enough ACPI to know if this solution is possible. A good 
> > > starter would probably be the ACPI spec [2].
> > 
> > Okay, that is worse than I had thought (okay, ACPI is impressively
> > complex for something nominally firmware-level).
> >
> > There are strings in the present Tianocore implementation for Raspberry
> > PI 4B which could be targeted.  Notably included in the output during
> > boot listing the tables, "RPIFDN", "RPIFDN RPI" and "RPIFDN RPI4" (I'm
> > unsure how kosher these are as this wsn't implemented nor blessed by the
> > Raspberry PI Foundation).
> > 
> > I strongly dislike this approach as you soon turn the Xen project into a
> > database of hardware.  This is already occurring with
> > xen/arch/arm/platforms and I would love to do something about this.  On
> > that thought, how about utilizing Xen's command-line for this purpose?
> 
> I don't think that a command line option is a good idea: basically it is
> punting to users the task of platform detection. Also, it means that
> users will be necessarily forced to edit the uboot script or grub
> configuration file to boot.

-EINVAL

Many Linux installations (near universal on desktop/server, but may be
uncommon on ARM servers) Xen's command-line comes from grub.cfg.
grub.cfg is in turn created by a series of scripts with several places
for users to modify configuration without breaking things.

The scripts which create grub.cfg could add a "dma_mem=" option to Xen's
command-line based upon what the running kernel reports.  If the kernel
is running on top of Xen, it will still be able to retrieve this
information out of ACPI.

This does mean distributions would need to modify scripts, but that is
doable.  This also means a dumb user could potentially jump in, modify
the value and thus cause unrecoverable breakage.  Yet on the flip side
this also allows for the short-term stop-gap of smart users modifying
the option as appropriate for new hardware.

Certainly it may not be the greatest approach, but it isn't as bad as
you're claiming.


> Note that even if we introduced a new command line, we wouldn't take
> away the need for xen/arch/arm/platforms anyway.

Perhaps, but it could allow for this setting at least to be moved to
somewhere outside of Xen.

I'm inclined to agree with Juergen Gro??, this reads kind of like having
an extra domain run during Xen's initialization which can talk ACPI.


> > Have a procedure of during installation/updates retrieve DMA limitation
> > information from the running OS and the following boot Xen will follow
> > the appropriate setup.  By its nature, Domain 0 will have the information
> > needed, just becomes an issue of how hard that is to retrieve...
> 
> Historically that is what we used to do for many things related to ACPI,
> but unfortunately it leads to a pretty bad architecture where Xen
> depends on Dom0 for booting rather than the other way around. (Dom0
> should be the one requiring Xen for booting, given that Xen is higher
> privilege and boots first.)
> 
> 
> I think the best compromise is still to use an ACPI string to detect the
> platform. For instance, would it be possible to use the OEMID fields in
> RSDT, XSDT, FADT?  Possibly even a combination of them?
> 
> Another option might be to get the platform name from UEFI somehow. 

I included appropriate strings in e-mail.  Suitable strings do appear in
`dmesg`.

Problem is this feels like you're hard-coding a fixed list of platforms
Xen can run on.  Instead values like these should be provided by
firmware.  ACPI includes a method for encoding DMA limitations,
device-tree really should have one added.  Only challenge for device-tree
is getting everyone to agree on names and parameters.



Looking at it, there are really issues with the allocate_memory_11()
function in xen/arch/arm/domain_build.c.  Two tasks have been merged and
I'm unsure they were merged correctly.

I'm unaware of any Xen-capable platforms with such, but DMA can have
distinct restrictions outside of what allocate_memory_11() provides for.
ACPI allows for explicit address ranges and in the past many devices have
used addresses that didn't start at zero.

Additionally a device might have several devices with restricted DMA and
these could have differing non-overlapping ranges.  Domain 0 might need
memory in several DMA ranges.  Luckily In the past few years I haven't
read about any potentially Xen-capable devices where DMA-capable memory
had differing capabilities/performance from non-DMA-capable memory.

Meanwhile for a platform which does have DMA limitations, the kernel and
boot information for domain 0 shouldn't be placed in DMA-capable memory
if domain 0 has any memory which isn't DMA-capable.  Yet it appears
allocate_memory_11() will cause kernel/initrd/boot information to be
placed in DMA-capable memory.

If my understanding is correct (this is a BIG IF), as a last step
allocate_memory_11() should reverse the order of memory banks.  Another
trick is DMA-capable banks need to be subject to ballooning AFTER
non-DMA-capable banks (I'm unsure how often ballooning is used on ARM).


-- 
(\___(\___(\______          --=> 8-) EHM <=--          ______/)___/)___/)
 \BS (    |         ehem+sigmsg@m5p.com  PGP 87145445         |    )   /
  \_CS\   |  _____  -O #include <stddisclaimer.h> O-   _____  |   /  _/
8A19\___\_|_/58D2 7E3D DDF4 7BA6 <-PGP-> 41D1 B375 37D0 8714\_|_/___/5445



