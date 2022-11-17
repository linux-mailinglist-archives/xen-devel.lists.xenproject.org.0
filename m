Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BBF062E6A5
	for <lists+xen-devel@lfdr.de>; Thu, 17 Nov 2022 22:15:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.445377.700519 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ovmEN-0006Ue-M6; Thu, 17 Nov 2022 21:15:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 445377.700519; Thu, 17 Nov 2022 21:15:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ovmEN-0006Rw-Ip; Thu, 17 Nov 2022 21:15:31 +0000
Received: by outflank-mailman (input) for mailman id 445377;
 Thu, 17 Nov 2022 21:15:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wK8U=3R=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1ovmEM-0006Rq-Kw
 for xen-devel@lists.xenproject.org; Thu, 17 Nov 2022 21:15:30 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f560a905-66bc-11ed-91b6-6bf2151ebd3b;
 Thu, 17 Nov 2022 22:15:28 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 2BC586223F;
 Thu, 17 Nov 2022 21:15:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D438CC433D6;
 Thu, 17 Nov 2022 21:15:25 +0000 (UTC)
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
X-Inumbo-ID: f560a905-66bc-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1668719727;
	bh=OQRwmVxkj8+xV9QXETJbtDq3lnn5kzpCXHkLI6zBNZ4=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=mxpHC4OBwIKdyO5Mli+7yXX40gASm77+uqjBaHBaTGsz6Z/e7KiUHLeSoctxSFkZ1
	 3m82aiKTYET27DIX3s7XteZ2Ut1li3ZTM1qaPTaU7e4PO6EidkKMigH07iDz5+nddr
	 bOaxAIDkFQtI+6MK+05ppO54P3RORo7yeg1DmKK2GnnV19ur0B/ed0wdZDk913wzyq
	 oaCVtz0GR1X5J0IjNZXrccciGe/lzcQOFNHe75FLzyfhCWnkZX7d7rKDe4wC9LYm86
	 NcbXlC8SIj3TtrZ2E+9DpQyFkES2B1tQHOnY2epw6K7cKosXzGvyfykdap9QxzlbTZ
	 RTuWoN9iAW8Sg==
Date: Thu, 17 Nov 2022 13:15:24 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jan Beulich <jbeulich@suse.com>
cc: Michal Orzel <michal.orzel@amd.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, 
    Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, 
    xen-devel@lists.xenproject.org
Subject: Re: [RFC] docs/misra: List files in Xen originated from external
 sources
In-Reply-To: <dfa1eb96-5538-e3f2-250b-3cf17a6e50fd@suse.com>
Message-ID: <alpine.DEB.2.22.394.2211170752060.4020@ubuntu-linux-20-04-desktop>
References: <20221116092032.4423-1-michal.orzel@amd.com> <93736488-8e0c-282a-2e5f-db0cf9419183@suse.com> <88a04b63-04ba-ef03-771d-1f2d11ea8549@amd.com> <dfa1eb96-5538-e3f2-250b-3cf17a6e50fd@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 17 Nov 2022, Jan Beulich wrote:
> On 17.11.2022 11:39, Michal Orzel wrote:
> > On 17/11/2022 11:03, Jan Beulich wrote:
> >> On 16.11.2022 10:20, Michal Orzel wrote:
> >>> --- /dev/null
> >>> +++ b/docs/misra/external-files.txt
> >>> @@ -0,0 +1,70 @@
> >>> +External files in Xen
> >>> +=====================
> >>> +
> >>> +The following table lists files present in the Xen codebase that originated
> >>> +from external sources e.g. Linux kernel. The purpose of this table is to:
> >>> + - keep track of the external files in the Xen codebase,
> >>> + - help with the review process (e.g. changes done to the files that did not
> >>> +   diverge, shall be first submitted to the external projects and then
> >>> +   backported to Xen),
> >>> + - act as a base for listing files to exclude from MISRA checkers.
> >>> +
> >>> +NOTES:
> >>> +1) The files shall be listed in alphabetical order.
> >>
> >> But then you don't?
> > True, it is alphabetical order with directories having a precedence.
> 
> Which is kind of surprising and, at least for me, confusing.
> 
> >>> +2) The origin of the files derived from the projects other than Linux, shall
> >>> +   be specified within the () placed next to the path.
> >>
> >> Might it be more generally useful to have another column, then not only
> >> stating the project but also the path it lives at there (or lived at the
> >> time of cloning)?
> > We though about it. Would be a good idea but can be quite challenging for files
> > that appeared in Xen before switching to git (difficult to establish the time of cloning in such cases).
> > 
> >>
> >>> +3) The table shall be updated when importing new files from external projects.
> >>> +4) At the moment, only the source files are listed in the table.
> >>> +
> >>> +| Relative path to xen/                     | Diverged from | Subject to       |
> >>> +|                                           | origin? [Y/N] | backports? [Y/N] |
> >>> ++-------------------------------------------+---------------+------------------+
> >>> +| arch/arm/arm64/cpufeature.c               | N             | Y                |
> >>> +| arch/arm/arm64/insn.c                     | N             | Y                |
> >>> +| arch/arm/arm64/lib/find_next_bit.c        | N             | Y                |
> >>> +| arch/x86/acpi/boot.c                      | Y             | ?                |
> >>> +| arch/x86/acpi/lib.c                       | ?             | ?                |
> >>
> >> This was simply split off from boot.c, which I'd be inclined to take to
> >> mean Y in the "diverged" column. In the backports column I'd prefer to
> >> keep ? for both, or any other indicator taken to mean "maybe / uncertain".
> >>
> >> What about arch/x86/acpi/cpufreq/* and other stuff in arch/x86/acpi/?
> >>
> >>> +| arch/x86/cpu/mcheck/mce-apei.c            | N             | Y                |
> >>> +| arch/x86/cpu/mcheck/non-fatal.c           | ?             | Y                |
> >>
> >> Even before disappearing in 2.6.32 the file was different from Linux'es,
> >> simply because we don't have anything like schedule_delayed_work(). So
> >> it's pretty clearly Y for "diverged".
> >>
> >>> +| arch/x86/cpu/mtrr/*                       | Y             | N                |
> >>> +| arch/x86/cpu/amd.c                        | Y             | N                |
> >>> +| arch/x86/cpu/centaur.c                    | Y             | N                |
> >>> +| arch/x86/cpu/common.c                     | Y             | N                |
> >>> +| arch/x86/cpu/hygon.c                      | Y             | N                |
> >>> +| arch/x86/cpu/intel_cacheinfo.c            | Y             | Y                |
> >>> +| arch/x86/cpu/intel.c                      | Y             | N                |
> >>> +| arch/x86/cpu/mwait-idle.c                 | Y             | Y                |
> >>> +| arch/x86/genapic/*                        | Y             | N                |
> >>> +| arch/x86/x86_64/mmconf-fam10h.c           | N             | Y                |
> >>> +| arch/x86/dmi_scan.c                       | Y             | ?                |
> >>> +| arch/x86/mpparse.c                        | Y             | ?                |
> >>
> >> Like above I'd like to keep ? (or alike) here, as neither Y nor N are
> >> fully accurate.
> >>
> >>> +| arch/x86/srat.c                           | Y             | N                |
> >>
> >> What about common/cpu.c?
> >>
> >>> +| common/libfdt/* (libfdt)                  | N             | Y                |
> >>> +| common/lz4/decompress.c                   | N             | Y                |
> >>> +| common/ubsan/ubsan.c                      | Y             | Y                |
> >>> +| common/xz/*                               | N             | Y                |
> >>> +| common/zstd/*                             | N             | Y                |
> >>> +| common/bitmap.c                           | N             | Y                |
> >>> +| common/bunzip2.c                          | N             | Y                |
> >>> +| common/earlycpio.c                        | N             | Y                |
> >>> +| common/inflate.c                          | N             | Y                |
> >>
> >> What about common/notifier.c?
> >>
> >>> +| common/radix-tree.c                       | N             | Y                |
> >>
> >> What about common/rcupdate.c? (Stopping at this in this regard:
> >> It's unclear by what criteria you have gone. Even as simple an
> >> indicator as "Copyright (C) ... Linus Torvalds" was apparently not
> > Please see [1]
> > 
> >> used. Similarly mentioning criteria for considering a file
> >> "diverged" would be very helpful to spell out, even if there's
> >> likely some fuzziness involved there.)
> > 
> > We would need to pre-define some criteria to avoid having a long justifications.
> > Any ideas?
> 
> Well, changing just #include-s to fit Xen's model shouldn't count as
> divergence. But coding style conversion already may. I'm afraid
> criteria here depend very much on the purpose, and hence I don't
> feel qualified to suggest any.

Hi Jan,

These two columns are not for MISRA's benefit. They are for our own
benefit as maintainers of this code. We can define them the way we want
to.

MISRA doesn't allow us to make any exceptions to our coding guidelines
for files originating from external sources (unless they are a proper
library we link against, I don't think that even libfdt qualifies from
what I understand.) We'll have to figure out what to do about that, but
it is not something this patch is trying to solve. It is just trying to
identify the external files.

So the two columns are just for us as maintainers. It is only to help
us, not to help with MISRA or with safety. So if you think we should
word the first column differently, or even remove the first column
entirely, we could.

Maybe a better criteria for the first column would be: "do we accept
changes to this file?" (direct changes, not backports)


> >>> +| common/un*.c                              | N             | Y                |
> >>> +| crypto/rijndael.c (OpenBSD)               | N             | Y                |
> >>> +| crypto/vmac.c (public domain)             | N             | Y                |
> >>> +| drivers/acpi/apei/*                       | N             | Y                |
> >>
> >> I'm not sure of the N here.
> >>
> >>> +| drivers/acpi/tables/*                     | N             | Y                |
> >>> +| drivers/acpi/utilities/*                  | N             | Y                |
> >>> +| drivers/acpi/hwregs.c                     | N             | Y                |
> >>> +| drivers/acpi/numa.c                       | ?             | Y                |
> >>
> >> Y
> >>
> >>> +| drivers/acpi/osl.c                        | Y             | Y                |
> >>> +| drivers/acpi/reboot.c                     | N             | Y                |
> >>> +| drivers/acpi/tables.c                     | ?             | Y                |
> >>
> >> Y
> >>
> >> What about drivers/cpufreq/*, drivers/char/ehci-dbgp.c,
> >> drivers/char/xhci-dbc.c, and drivers/video/font*? What about some of
> >> the stuff under tools/, especially tools/kconfig/?
> > 
> > [1]
> > For the first shot, the criteria was to list files using different coding style than Xen,
> > especially the ones using tabs instead of spaces. As I indicated before, the list may not be
> > completed, hence a gentle ask to list the missing ones. Some of the files you mentioned
> > use Xen coding style + there is no information in the git history that they originated from
> > external sources. This is why, the maintainers who are the addressee of this RFC should have
> > a better knowledge of the origin of such files.
> 
> Hmm. Please forgive me being blunt, but to me this then looks like
> offloading work to people who shouldn't be required to invest
> meaningful amounts of time. But maybe that's just me viewing it this
> way ... Yet this is particularly relevant if ...
> 
> > As for the files under tools/, FWICS they are being filtered-out from MISRA checks, hence I
> > did not list them.
> 
> ... the goal here then indeed is use for MISRA alone. I did e.g. ask
> whether it wouldn't be worthwhile to more precisely describe the
> origin of files because at some point in the past it was also
> proposed to arrange for some more automatic monitoring of changes
> being applied at their origins for files we have cloned. Which
> obviously first of all requires establishing an association between
> our files and their origins.

One of the goals has certainly to do with MISRA, but I think we would
want to know which files are not conforming to the Xen coding style and
coding guidelines anyway? For example, we need it to automate coding
style checks for new patches with scripts like checkpatch.

And you are right, also adding the origin of the files to help with
backports and monitoring is a great idea.

On the extra work: some of us in the community have been around for a
long time. Without having to do any research, there are things you might
remember on top of your head. If you don't remember, that's fine and we
can try to do some investigation/archeology.

