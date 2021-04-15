Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 10434361589
	for <lists+xen-devel@lfdr.de>; Fri, 16 Apr 2021 00:34:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.111519.213298 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lXAYh-0007lP-SA; Thu, 15 Apr 2021 22:33:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 111519.213298; Thu, 15 Apr 2021 22:33:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lXAYh-0007ky-Og; Thu, 15 Apr 2021 22:33:59 +0000
Received: by outflank-mailman (input) for mailman id 111519;
 Thu, 15 Apr 2021 22:33:58 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ByZD=JM=gmail.com=christopher.w.clark@srs-us1.protection.inumbo.net>)
 id 1lXAYg-0007kq-D2
 for xen-devel@lists.xenproject.org; Thu, 15 Apr 2021 22:33:58 +0000
Received: from mail-oi1-x235.google.com (unknown [2607:f8b0:4864:20::235])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f58cb268-38cb-448b-a700-20650fd0b951;
 Thu, 15 Apr 2021 22:33:57 +0000 (UTC)
Received: by mail-oi1-x235.google.com with SMTP id d12so25897936oiw.12
 for <xen-devel@lists.xenproject.org>; Thu, 15 Apr 2021 15:33:57 -0700 (PDT)
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
X-Inumbo-ID: f58cb268-38cb-448b-a700-20650fd0b951
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=FV+gdqUn0A036xmpndUBZcIkZFxF01wHkgn1UQCMFrQ=;
        b=ElSAmkoRHFPwfz9iTj+VjDS414UiRd3U3fzWYBDWCJKojcoOEGNXaYNsdBWu1DLR/F
         13KNZBKqcOJ+XkUgTAnHRcazRCLeRkAMc81CfpXdC+Z0KvJPcgt3ENeMYL3BA1e/VYvu
         hrFRy1zuBThMloXd1z1VE5iXL6DwujilBb9TB1uAQgd8F/oGnUJoAb/8nXfo1QHXsHq2
         19zeqjmwx+u7w2v58Y74h2r33f8gKr/tmFTOAPKjQ/UzyHTrYagVxGa/4J0M9YJvI7MW
         EV1OOb260xb8Zy0OFF0GI76p0/GNZMJ2o205ykudVTpfF0U1nmd4+KK++8taO+SQ88ZA
         piqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=FV+gdqUn0A036xmpndUBZcIkZFxF01wHkgn1UQCMFrQ=;
        b=olprYvg0FU4gauH+Qd6PMEGbhiZzvApylCpskvvps+84/tq2esYriw4cmUhkqTnM7R
         MTomAWLj0koUxgHzzeZq2xyG9b/TSmTPG2uYazrWb2AwH++NQgM+V+qSGh61LgweMRpa
         nRFIxcBOqpFkyrivwEeS4V0nZPsTaQZb8rQcVHrawVOGVX71IVU8W+h0LLRkdesOHyBJ
         c3RkkvcsRfrNeVmqI2wx+5hTPJ99Ipn2dWCxEEjcrLu0nOoJXyo/g5Y/+Ep7eNRKSbHN
         pDiej62PRYeX8+q8jOJGwc4tJncb/7XdNfddTqV3igl01P/Cg6x277uMVhT8vIu9ueoz
         q7Hg==
X-Gm-Message-State: AOAM530BP1wsYiM9QNFG1knQDPby/4rrUSS+oDItJotbm376hBi3R/8F
	WBAz6Wof1LdHyRLl3TPjgGu1WTOz567uopw1uWE=
X-Google-Smtp-Source: ABdhPJzfvrejgbAE1Xf8wsZ9NPYxeaVqf6t1fFnffzc5c7NKwPiCspQi+TZxua9832f0vMI1Ix/3kCglqJL64ON3rKs=
X-Received: by 2002:aca:534d:: with SMTP id h74mr4177827oib.152.1618526036967;
 Thu, 15 Apr 2021 15:33:56 -0700 (PDT)
MIME-Version: 1.0
References: <20210316031814.10311-1-dpsmith@apertussolutions.com>
 <6314f50f-b4fc-e472-4c9a-3591e168d2c3@apertussolutions.com>
 <bd61f993-f719-ec87-638f-f53d6e983c3e@suse.com> <CACMJ4GY1QpTYUYV5oG5zOfah_PzPq_-__K3-F3qUfzX95R3w8g@mail.gmail.com>
 <2651d116-7c44-261e-8561-c9b3b5a4aab8@suse.com>
In-Reply-To: <2651d116-7c44-261e-8561-c9b3b5a4aab8@suse.com>
From: Christopher Clark <christopher.w.clark@gmail.com>
Date: Thu, 15 Apr 2021 15:33:45 -0700
Message-ID: <CACMJ4GbEEAkpA-aynWa=nw41HBxqENmx6NNXAhqmVxkTNB5kEw@mail.gmail.com>
Subject: Re: [PATCH 0/2] Introducing hyperlaunch capability design (formerly:
 DomB mode of dom0less)
To: Jan Beulich <jbeulich@suse.com>
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>, Andrew Cooper <andrew.cooper3@citrix.com>, 
	Stefano Stabellini <stefano.stabellini@xilinx.com>, Julien Grall <jgrall@amazon.com>, 
	Julien Grall <Julien.grall.oss@gmail.com>, Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>, 
	George Dunlap <george.dunlap@citrix.com>, Rich Persaud <persaur@gmail.com>, 
	Bertrand Marquis <Bertrand.Marquis@arm.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	luca.fancellu@arm.com, paul@xen.org, Adam Schwalm <adam.schwalm@starlab.io>, 
	xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, Apr 7, 2021 at 10:56 PM Jan Beulich <jbeulich@suse.com> wrote:
>
> On 07.04.2021 21:23, Christopher Clark wrote:
> > On Tue, Mar 30, 2021 at 7:31 AM Jan Beulich <jbeulich@suse.com> wrote:
> >>
> >> On 16.03.2021 04:56, Daniel P. Smith wrote:
> >>> To assist in reading, please find attached rendered copies of the design
> >>> docs. It should be noted that due to poor rendering by pandoc, we forced
> >>> the tables to stay as ASCII tables in the patches whereas the attached
> >>> docs have the tables rendered properly by rst2pdf.
> >>
> >> In section 3.6 I found "As a result, on x86 the hyperlaunch capability does
> >> not rely on nor preclude any specific BIOS boot protocol, i.e legacy BIOS
> >> boot or UEFI boot. The only requirement is that the boot loader supports
> >> the Multiboot2 (MB2) protocol." I'm afraid the two sentences contradict
> >> one another, as UEFI on its own doesn't provide MB2 functionality. It is
> >> my understanding that you don't require this anyway - what you need is a
> >> way to load modules beyond just Dom0 kernel and an initrd.
> >
> > Thanks - we'll amend the doc. Given the already sizeable scope of the
> > project, our current approach for host UEFI is to recommend use of
> > GRUB.efi to load Xen and the initial domains via the multiboot2 method.
> >
> >> I'm also struggling to see how you mean to associate the (MB2) modules
> >> passed to Xen with the individual functions. I.e. I don't see how it will
> >> be ensure that the embedded mb-index is in sync with the order or modules
> >> actually supplied.
> >
> > To make sure I'm following the concern raised here, my understanding is:
> >
> > - the multiboot module list is ordered and stable, so that the order
> >   that the bootloader provides the modules in is the same order in which
> >   Xen receives them, in the multiboot data structure, so the modules can
> >   be referenced by an index into that list
>
> In a separate context (parallel ongoing discussion under "multiboot2
> and module2 boot issues via GRUB2") Andrew raised the (imo valid)
> point of this getting the more fragile the more modules there are.

It is a separate context though: ie. your (controversial!) proposal to
use the Xen command line to direct the hypervisor to concatenate
multiboot modules to form a single initrd before assembling a domain.

Boot via Multiboot2 relies on the positional correctness (ie. ordering)
of the modules supplied.

Andrew's first message in the thread describes Xen's longstanding
convention for handling the multiboot modules that it receives:

    Xen is capable of taking various things via modules, such as an
    XSM/Flask policy, or microcode, so has logic to identify these if
    present and separate them from "other stuff".  However, there is a
    hardcoded expectation that the first module is the dom0 kernel, and
    the next unrecognised module, if present, is *the* initrd.

We are proposing to make that hardcoded expectation become configurable
via the definition provided in the Launch Control Module. The modules
supplied will have to be correctly ordered, matching that definition.

Xen has behaviour today for when the boot materials are incorrect
(eg. when dom0 initrd is supplied before the dom0 kernel) and that is
reasonable, and the same can apply to misconfigured systems in future
too.

> > - for a given Launch Control Module file (expressed in a Device Tree, as
> >   described in our second design document), the provided multiboot
> >   modules will need to match, both in type (kernel, ramdisk, microcode,
> >   xsm policy) and order
>
> "Need to match" meaning what? You don't clarify how boot loader
> config and device tree blob are meant to be kept in sync.

A given Launch Control Module (or device tree blob) defines the
expectation for boot module ordering. The boot loader config needs to be
written with an awareness of that ordering.

Tooling to support that synchronization can be provided - as noted here:

> > - we think that at some point the LCM will end up being dynamically
> >   generated by an enlightened bootloader, assembling it from the
> >   bootloader config file, which will list the modules and their types

which should help address usability concerns.

> >> As to modules - iirc there are placement restrictions by at least some
> >> boot loaders (below 4Gb). If that's correct, do you have any thoughts
> >> towards dealing with the limited space available to hold these modules?
> >> I've seem systems with lots of memory, but with as little as just 1Gb
> >> below the 4Gb boundary.
> >
> > At this point, I don't think that we'll break anything that currently
> > works, and that hardware or platform limitations can always constrain
> > what is deployable.
>
> I'm not concerned of you breaking anything. I merely raised a possible
> scalability issue of your current proposal.

Fair. Thanks for the review.

Christopher

