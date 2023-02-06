Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B882668C28C
	for <lists+xen-devel@lfdr.de>; Mon,  6 Feb 2023 17:10:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.490582.759360 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pP43j-00028K-DU; Mon, 06 Feb 2023 16:09:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 490582.759360; Mon, 06 Feb 2023 16:09:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pP43j-00026L-9W; Mon, 06 Feb 2023 16:09:35 +0000
Received: by outflank-mailman (input) for mailman id 490582;
 Mon, 06 Feb 2023 16:09:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=blJ1=6C=m5p.com=ehem@srs-se1.protection.inumbo.net>)
 id 1pP43i-00025u-57
 for xen-devel@lists.xenproject.org; Mon, 06 Feb 2023 16:09:34 +0000
Received: from mailhost.m5p.com (mailhost.m5p.com [74.104.188.4])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a2c95315-a638-11ed-933c-83870f6b2ba8;
 Mon, 06 Feb 2023 17:09:32 +0100 (CET)
Received: from m5p.com (mailhost.m5p.com [IPv6:2001:470:1f07:15ff:0:0:0:f7])
 by mailhost.m5p.com (8.16.1/8.15.2) with ESMTPS id 316G95Bs048521
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
 Mon, 6 Feb 2023 11:09:10 -0500 (EST) (envelope-from ehem@m5p.com)
Received: (from ehem@localhost)
 by m5p.com (8.16.1/8.15.2/Submit) id 316G94d5048520;
 Mon, 6 Feb 2023 08:09:04 -0800 (PST) (envelope-from ehem)
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
X-Inumbo-ID: a2c95315-a638-11ed-933c-83870f6b2ba8
Date: Mon, 6 Feb 2023 08:09:04 -0800
From: Elliott Mitchell <ehem+xen@m5p.com>
To: Julien Grall <julien@xen.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
        Bertrand Marquis <bertrand.marquis@arm.com>,
        Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
        xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>
Subject: Re: [PATCH] xen/arm64: Default ACPI support enabled
Message-ID: <Y+EmIHDyvSCHjEo+@mattapan.m5p.com>
References: <202302031801.313I1SdK033264@m5p.com>
 <df51bbdc-ab88-7254-799e-0e2828d3d1a9@suse.com>
 <15b88500-89b0-507a-601c-84a8102bb550@xen.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <15b88500-89b0-507a-601c-84a8102bb550@xen.org>
X-Spam-Status: No, score=0.4 required=10.0 tests=KHOP_HELO_FCRDNS autolearn=no
	autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on mattapan.m5p.com

On Mon, Feb 06, 2023 at 10:38:32AM +0000, Julien Grall wrote:
> 
> On 06/02/2023 07:29, Jan Beulich wrote:
> > On 22.07.2020 19:43, Elliott Mitchell wrote:
> >> Unlike other unsupportted options, ACPI support is required to *boot*
> >> for a number of platforms.  Users on these platforms are unable to use
> >> distribution builds and must rebuild from source to use Xen.
> >>
> >> Signed-off-by: Elliott Mitchell <ehem+xen@m5p.com>
> > 
> > A general question first: How come this mail dates back to July 2020? I
> > had almost missed it as "new".
> 
> I can't even find the Elliott's email in my inbox so reply here. But 
> this sounds like a rehash of [1].

The date on Git patches is meant as an indicator for author date.  Since
this is a cherry-pick of a patch which was written >2 years ago
`git format-patch` indicates when it was written.  This IS how these
systems work.


>  >> Unlike other unsupportted options, ACPI support is required to *boot*
>  >> for a number of platforms.  Users on these platforms are unable to use
>  >> distribution builds and must rebuild from source to use Xen.
> 
> What platforms are you testing on? I know that this is working-ish on 
> RPI4 and QEMU. But this will likely blow up on one of the server we 
> support in OSSTest because we don't have proper support to hide SMMUs in 
> dom0.

I've been doing RPI4 w/EDK2.  Which works for my purpose, the remaining
trouble spot for my purpose is needing a final resolution of the EFIFB
situation.

> >> --- a/xen/arch/arm/Kconfig
> >> +++ b/xen/arch/arm/Kconfig
> >> @@ -29,13 +29,18 @@ menu "Architecture Features"
> >>   source "arch/Kconfig"
> >>   
> >>   config ACPI
> >> -	bool "ACPI (Advanced Configuration and Power Interface) Support (UNSUPPORTED)" if UNSUPPORTED
> >> +	bool "ACPI (Advanced Configuration and Power Interface) Support (UNSUPPORTED)"
> 
> The concerns I raised in [1] still stand. Most of the ACPI platform will 
> also have support for IOMMUs. If we have support for IORT in Xen, then I 
> would be a lot more amenable to remove the "UNSUPPORTED". And without 
> that support we are going to do more harm and than good.

Okay, this has been a known issue for *years* and yet remains unresolved
despite being a major issue.  Might be an abomination, but would it work
to find the string "IORT" and change it to "iort", "RTIO" or "IOXN" to
prevent Dom0 from finding it?

This ends up turning into a question of what are the cases and which are
more common?

Case1: DT-only: Unchanged

Case2: Switchable between DT and ACPI, w/o SMMU: Starts working with ACPI

Case3: Switchable between DT and ACPI, w/SMMU: Unchanged, ACPI mode still
doesn't work, but the failure is different.

Case4: Concurrent DT and ACPI support, w/o SMMU: Unchanged

Case5: Concurrent DT and ACPI support, w/SMMU: Breaks if Dom0 tries to
use ACPI

Case6: ACPI-only, w/o SMMU: Starts working out-of-box

Case7: ACPI-only, w/SMMU: Unchanged (still broken)

Any other distinct cases of note?


So case 5 is a problem, but cases 2 and 6 are positive.  Does the classic
workaround of "acpi=off" work for Linux as Dom0?  If that is "yes", then
publicizing that workaround (should be detectable by Xen) seems a likely
short-term solution.

My impression is ACPI is getting increasing support in on ARM.  The
number of mentions suggests if they keep going it looks likely to win.
The EDK2 project has been providing an image for RPI4 and the
functionality is impressive.

Ultimately this is more a decision for Xen Project management, than the
technical side.  Are things in shape where they can be rolled out?  Is
ACPI support important enough to need rolling out now?

I'm unsure about the former, but the latter seems a distinct "yes" since
ACPI appears to be the future.


-- 
(\___(\___(\______          --=> 8-) EHM <=--          ______/)___/)___/)
 \BS (    |         ehem+sigmsg@m5p.com  PGP 87145445         |    )   /
  \_CS\   |  _____  -O #include <stddisclaimer.h> O-   _____  |   /  _/
8A19\___\_|_/58D2 7E3D DDF4 7BA6 <-PGP-> 41D1 B375 37D0 8714\_|_/___/5445



