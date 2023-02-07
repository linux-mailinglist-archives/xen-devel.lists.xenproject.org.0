Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AD5768CC5C
	for <lists+xen-devel@lfdr.de>; Tue,  7 Feb 2023 02:55:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.490777.759624 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pPDCd-0006UH-2o; Tue, 07 Feb 2023 01:55:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 490777.759624; Tue, 07 Feb 2023 01:55:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pPDCc-0006Rv-WC; Tue, 07 Feb 2023 01:55:23 +0000
Received: by outflank-mailman (input) for mailman id 490777;
 Tue, 07 Feb 2023 01:55:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=SVd9=6D=m5p.com=ehem@srs-se1.protection.inumbo.net>)
 id 1pPDCb-0006Ro-70
 for xen-devel@lists.xenproject.org; Tue, 07 Feb 2023 01:55:21 +0000
Received: from mailhost.m5p.com (mailhost.m5p.com [74.104.188.4])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 78304262-a68a-11ed-93b5-47a8fe42b414;
 Tue, 07 Feb 2023 02:55:18 +0100 (CET)
Received: from m5p.com (mailhost.m5p.com [IPv6:2001:470:1f07:15ff:0:0:0:f7])
 by mailhost.m5p.com (8.16.1/8.15.2) with ESMTPS id 3171stcX050816
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
 Mon, 6 Feb 2023 20:55:01 -0500 (EST) (envelope-from ehem@m5p.com)
Received: (from ehem@localhost)
 by m5p.com (8.16.1/8.15.2/Submit) id 3171stKk050815;
 Mon, 6 Feb 2023 17:54:55 -0800 (PST) (envelope-from ehem)
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
X-Inumbo-ID: 78304262-a68a-11ed-93b5-47a8fe42b414
Date: Mon, 6 Feb 2023 17:54:55 -0800
From: Elliott Mitchell <ehem+xen@m5p.com>
To: Julien Grall <julien@xen.org>
Cc: george.dunlap@cloud.com, Stefano Stabellini <sstabellini@kernel.org>,
        Bertrand Marquis <bertrand.marquis@arm.com>,
        Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
        xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>
Subject: Re: [PATCH] xen/arm64: Default ACPI support enabled
Message-ID: <Y+Gvb4NEoG2JvmP5@mattapan.m5p.com>
References: <202302031801.313I1SdK033264@m5p.com>
 <df51bbdc-ab88-7254-799e-0e2828d3d1a9@suse.com>
 <15b88500-89b0-507a-601c-84a8102bb550@xen.org>
 <Y+EmIHDyvSCHjEo+@mattapan.m5p.com>
 <1d685b34-940b-b8ca-e689-b5a42eaccea1@xen.org>
 <Y+FjUTXdcoy3W9th@mattapan.m5p.com>
 <3b2f49cd-195c-f69b-b5d4-681a7cad58d5@xen.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3b2f49cd-195c-f69b-b5d4-681a7cad58d5@xen.org>
X-Spam-Status: No, score=0.4 required=10.0 tests=KHOP_HELO_FCRDNS autolearn=no
	autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on mattapan.m5p.com

On Mon, Feb 06, 2023 at 10:32:22PM +0000, Julien Grall wrote:
> Hi,
> 
> On 06/02/2023 20:30, Elliott Mitchell wrote:
> > On Mon, Feb 06, 2023 at 05:07:50PM +0000, Julien Grall wrote:
> >>
> >> On 06/02/2023 16:09, Elliott Mitchell wrote:
> >>> On Mon, Feb 06, 2023 at 10:38:32AM +0000, Julien Grall wrote:
> >>>>
> >>>> On 06/02/2023 07:29, Jan Beulich wrote:
> >>>>> On 22.07.2020 19:43, Elliott Mitchell wrote:
> 
> >>>>>> --- a/xen/arch/arm/Kconfig
> >>>>>> +++ b/xen/arch/arm/Kconfig
> >>>>>> @@ -29,13 +29,18 @@ menu "Architecture Features"
> >>>>>>     source "arch/Kconfig"
> >>>>>>     
> >>>>>>     config ACPI
> >>>>>> -	bool "ACPI (Advanced Configuration and Power Interface) Support (UNSUPPORTED)" if UNSUPPORTED
> >>>>>> +	bool "ACPI (Advanced Configuration and Power Interface) Support (UNSUPPORTED)"
> >>>>
> >>>> The concerns I raised in [1] still stand. Most of the ACPI platform will
> >>>> also have support for IOMMUs. If we have support for IORT in Xen, then I
> >>>> would be a lot more amenable to remove the "UNSUPPORTED". And without
> >>>> that support we are going to do more harm and than good.
> >>>
> >>> Okay, this has been a known issue for *years* and yet remains unresolved
> >>> despite being a major issue.
> >>
> >> Right, the situation hasn't changed much since you last sent your patch
> >> to drop EXPERT/UNSUPPORTED.
> >>
> >> Unless you fancy working on ACPI, I don't really see the situation
> >> changing soon.
> > 
> > The situation is changing in large entities are pushing ACPI for ARM.  If
> > they succeed (likely) then it will be a case of Xen/ARM MUST support
> > ACPI, or else the project will die. 
> 
> This is quite a bold statement... I can see this ACPI to overtake in 
> server world where ACPI is sort of the de-facto default firmware table. 
> However, in embedded this is probably going to be more mixed because 
> Device-Tree is a lot simpler to use (think of safety certified environment).

Quite true.  Many technologies though tend to slowly flow down from the
high-end server market into lower-end desktop and then embedded markets
(some do go the opposite direction).  Notice the first computers filled
rooms, yet now many doorknobs have computers.  Hypervisors started on
high-end servers, yet now most phones have 95% of the technology.

I don't expect to see ACPI inside cars in the next decade, but I suspect
it may be common on cellphones and routers soon.

> >>>   Might be an abomination, but would it work
> >>> to find the string "IORT" and change it to "iort", "RTIO" or "IOXN" to
> >>> prevent Dom0 from finding it?
> >>
> >> Unfortunately no because there IORT is used to describing mapping for
> >> the GICv3 ITS which is currently working when ACPI is enabled in Xen.
> > 
> > The original advantage of Xen was paravirtualization.  Might this
> > be a case where it is better to have Domain 0 compensate and know the
> > SMMU is unusable with current versions of Xen?
> 
> I believe it would make more difficult to add support for Stage-1 SMMU 
> in dom0. So this would be a short-sighted decision.

Okay.  Use a feature bit?  Perhaps have something passing "iommu=off" to
the Dom0 kernel?

> >>> This ends up turning into a question of what are the cases and which are
> >>> more common?
> >>>
> >>> Case1: DT-only: Unchanged
> >>>
> >>> Case2: Switchable between DT and ACPI, w/o SMMU: Starts working with ACPI
> >>>
> >>> Case3: Switchable between DT and ACPI, w/SMMU: Unchanged, ACPI mode still
> >>> doesn't work, but the failure is different.
> >>>
> >>> Case4: Concurrent DT and ACPI support, w/o SMMU: Unchanged
> >>
> >> So Xen would start using ACPI rather than DT.I think we should default
> >> DT it until we have the ACPI support completed.
> > 
> > Isn't this precisely what the proposed change does?  Are you suggesting,
> > if both DT and ACPI are present, prevent Dom0 from seeing ACPI?
> 
> In the current model Xen and dom0 have to be using the same kind of 
> firmware table. IOW if Xen is using the Device-Tree then dom0 has to.
> 
> We never investigated whether it would be feasible for Dom0 to use ACPI 
> but not Xen.
> 
> >  If
> > you're suggesting doing futher masking, perhaps only if SMMU is present?
> 
> Even if we remove the dependencies on UNSUPPORTED, ACPI will still be in 
> a unsupported state by Xen Project (at least until the missing feature 
> are present).
> 
> This means, if both Device-Tree and ACPI are present then we should boot 
> using Device-Tree so the user is using a supported configuration. If 
> they wish to use ACPI, then they will need to pass "acpi=on" on the Xen 
> command line.

This seems reasonable.

> >>> Case5: Concurrent DT and ACPI support, w/SMMU: Breaks if Dom0 tries to
> >>> use ACPI
> >>>
> >>> Case6: ACPI-only, w/o SMMU: Starts working out-of-box
> >>>
> >>> Case7: ACPI-only, w/SMMU: Unchanged (still broken)
> >>
> >> To clarify, this will boot but then start to break in very subtle way.
> > 
> > Which suggests a need to provide warnings the situation is known to be
> > broken.
> 
> Right. If that's the decision, then this would need to be part of this 
> patch (or a new one patch).

A warning message was part of a previous version.  Yet that was rejected
and the recent suggestion was to send the bare default enable ACPI by
itself.

> >>> Ultimately this is more a decision for Xen Project management, than the
> >>> technical side.  Are things in shape where they can be rolled out?
> >>
> >> No. But as I wrote before, I don't believe the gap is very big.
> >>
> >>>   Is
> >>> ACPI support important enough to need rolling out now?
> >>>
> >>> I'm unsure about the former, but the latter seems a distinct "yes" since
> >>> ACPI appears to be the future.
> >>
> >> ACPI is indeed picking up the pace on Arm Server and platform where
> >> Windows on Arm is supported. But that should not only be the reason to
> >> remove UNSUPPORTED.
> > 
> > Well good news is I'm not proposing removing the unsupported marking.
> > I'm proposing to enable ACPI by default.  I think it is reasonable to
> > add more warnings at runtime of the setup not being supported.
>  From my experience warnings tend to be ignore/forgotten. So this could 
> lead to poorer experience when issues are subbtle (think memory corruption).

True enough.  :-(

> >> You are right that enabling ACPI by default will draw more users. But I
> >> also expect those users to be less familiar with Xen and therefore not
> >> very interested to fix bugs. So removing EXPERT/UNSUPPORTED is probably
> >> going to still make them unhappy as I don't think the help (including
> >> writing patch) for ACPI on Arm will change very much in the near future
> >> (from the community call I was under the impression you could not commit
> >> time for it).
> > 
> > The average level of technical competence may be lower, but the larger
> > pool of people should yield enough to get additional problems fixed. >
> >> So I am not convinced this is really making Xen in a better position
> >> right now.
> > 
> > Right now the present situation is *actively* pushing people who want to
> > use Xen on ACPI-only ARM boards away.

> That's interesting because I haven't encountered that many ACPI-only 
> platform outside of the server world.

Perhaps most have been looking up information, finding Xen didn't support
ACPI on ARM and quietly disappearing.

> But, honestly, I think you are blaming a bit too much 
> EXPERT/UNSUPPORTED. Such issue would be really a problem with single 
> contributor. For companies they usually care less and will pick whatever 
> suit them (even it is behind a Kconfig).

Though individuals are valuable since they represent mindshare and
mindshare has a distinct influence on the future.



On Mon, Feb 06, 2023 at 04:09:51PM -0800, Stefano Stabellini wrote:
> +George
> 
> On Mon, 6 Feb 2023, Julien Grall wrote:
> > On 06/02/2023 20:30, Elliott Mitchell wrote:
> > > The situation is changing in large entities are pushing ACPI for ARM.  If
> > > they succeed (likely) then it will be a case of Xen/ARM MUST support
> > > ACPI, or else the project will die. 
> 
> We need to be careful when making wide-reaching marketing statements because:
> - it is always extremely hard to make accurate prediction of the future
> - even seasoned experts often make major guessing mistakes
> 
> Bill Gates predicted that OS/2 would take over the world in '87. Many
> people on xen-devel might not even know what OS/2 is.
> 
> I am not aware of any plans by Xilinx (now AMD) to replace Device Tree
> with ACPI. In fact we are investing in Device Tree with System Device
> Tree and other related activites (Lopper, etc.)

True enough.  Though see above about many bits of technology tending to
slowly flow from the server room into smaller systems.


> I suggest to keep the discussion technical and practical. As a
> community, we don't enable experimental/unsupported features by default
> for obvious reasons. In this case, the feature (ACPI) might give a
> chance to Xen to boot on a given platform.

As noted, nested-HVM support is present in default builds of 4.14/x86.


> Do we want to make an exception for ACPI to be enabled by default even
> if experimental/unsupported? If so, we can look into the details of how
> to do that.

As noted, this allows Xen to boot on more devices (whereas without it Xen
won't boot).  So this is what places ACPI support into a different
category.

Classic approach is a warning message with a delay.  Marking as tainted
has been suggested.  I don't have any additional ideas.

> But first, we need a policy decision. Who should be the people making
> this decision? I'll let George as Community Manager decide if the
> decision stands with the ARM maintainers or with the committers.

I think this has gotten into a none of the above category; this is more
of a management/community question.  Does enabling it provide a better
experience by making things simpler for more people?  Does enabling it
provide a worse experience by something not supported escaping?
Management has to make a guess as which is more likely beneficial to the
Xen Project's future.


-- 
(\___(\___(\______          --=> 8-) EHM <=--          ______/)___/)___/)
 \BS (    |         ehem+sigmsg@m5p.com  PGP 87145445         |    )   /
  \_CS\   |  _____  -O #include <stddisclaimer.h> O-   _____  |   /  _/
8A19\___\_|_/58D2 7E3D DDF4 7BA6 <-PGP-> 41D1 B375 37D0 8714\_|_/___/5445



