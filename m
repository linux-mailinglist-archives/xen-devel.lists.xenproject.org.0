Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 135AF880AE9
	for <lists+xen-devel@lfdr.de>; Wed, 20 Mar 2024 07:01:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.695686.1085584 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmp0v-0002Df-Gm; Wed, 20 Mar 2024 06:01:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 695686.1085584; Wed, 20 Mar 2024 06:01:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmp0v-0002BT-E5; Wed, 20 Mar 2024 06:01:25 +0000
Received: by outflank-mailman (input) for mailman id 695686;
 Wed, 20 Mar 2024 06:01:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=iFPB=K2=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1rmp0t-0002BF-QO
 for xen-devel@lists.xenproject.org; Wed, 20 Mar 2024 06:01:23 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 465e7524-e67f-11ee-afdd-a90da7624cb6;
 Wed, 20 Mar 2024 07:01:22 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 612AD60DF0;
 Wed, 20 Mar 2024 06:01:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3AF21C433C7;
 Wed, 20 Mar 2024 06:01:18 +0000 (UTC)
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
X-Inumbo-ID: 465e7524-e67f-11ee-afdd-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1710914479;
	bh=YEvskiJv4b5eMlWYh4pUDKefgzPN8ylcsJhfV6+5lT0=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=IwkCDaAn4mXvnPqxyWqOIMNEzA3sRlJ8TOQ67D/ueHTkCFWG+mbyZFlRdPMFMSLn5
	 NS8mKmrj5NdH/i9GXk94oIcOyaITXjbQXZU8GuMASZ5aCJOS6rkryyRYFxDGkkepEu
	 pF2MKc0PpYoM1faB6JnquDnV1rPhZwqitWNXgGfPPvssi3exfYH7y5BDH8LtV52cjG
	 ZxRYJKeGRDddXhYyrPBuonXJNX/rq33oft4SCXO91W4FVm5vwzJUh23q78KT922LuG
	 /+dXAPOsutUOKumyX0gffDrUzCWYmDQI7v8xgoEpHN66fkBHiCRH9NB0TtejXaJh2+
	 IeYnwQyQe5Mmg==
Date: Tue, 19 Mar 2024 23:01:16 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jan Beulich <jbeulich@suse.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, andrew.cooper3@citrix.com, 
    bertrand.marquis@arm.com, george.dunlap@citrix.com, julien@xen.org, 
    michal.orzel@amd.com, roger.pau@citrix.com, xen-devel@lists.xenproject.org
Subject: Re: [PATCH v2] docs/misra: document the expected sizes of integer
 types
In-Reply-To: <fadd30c9-440d-401d-bd05-7e1d965bbefe@suse.com>
Message-ID: <alpine.DEB.2.22.394.2403190815220.853156@ubuntu-linux-20-04-desktop>
References: <alpine.DEB.2.22.394.2403141516550.853156@ubuntu-linux-20-04-desktop> <6a76723e-ba47-40b3-8f33-d68030b14299@suse.com> <alpine.DEB.2.22.394.2403151658530.853156@ubuntu-linux-20-04-desktop> <7ab73379-b057-4568-9869-141cef185752@suse.com>
 <alpine.DEB.2.22.394.2403181735410.853156@ubuntu-linux-20-04-desktop> <fadd30c9-440d-401d-bd05-7e1d965bbefe@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 19 Mar 2024, Jan Beulich wrote:
> On 19.03.2024 04:37, Stefano Stabellini wrote:
> > On Mon, 18 Mar 2024, Jan Beulich wrote:
> >> On 16.03.2024 01:07, Stefano Stabellini wrote:
> >>> On Fri, 15 Mar 2024, Jan Beulich wrote:
> >>>> On 14.03.2024 23:17, Stefano Stabellini wrote:
> >>>>> Xen makes assumptions about the size of integer types on the various
> >>>>> architectures. Document these assumptions.
> >>>>
> >>>> My prior reservation wrt exact vs minimum sizes remains.
> >>>
> >>> We have to specify the exact size. In practice the size is predetermined
> >>> and exact with all our supported compilers given a architecture.
> >>
> >> But that's not the purpose of this document; if it was down to what
> >> compilers offer, we could refer to compiler documentation (and iirc we
> >> already do for various aspects). The purpose of this document, aiui,
> >> is to document assumption we make in hypervisor code. And those should
> >> be >=, not ==.
> > 
> > Well... I guess the two of us are making different assumptions then :-)
> > 
> > Which is the reason why documenting assumptions is so important. More at
> > the bottom.
> > 
> > 
> >>> Most importantly, unfortunately we use non-fixed-size integer types in
> >>> C hypercall entry points and public ABIs. In my opinion, that is not
> >>> acceptable.
> >>
> >> The problem is that I can't see the reason for you thinking so. The C
> >> entry points sit past assembly code doing (required to do) necessary
> >> adjustments, if any. If there was no assembly layer, whether to use
> >> fixed with types for such parameters would depend on what the
> >> architecture guarantees.
> > 
> > This could be the source of the disagreement. I see the little assembly
> > code as not important, I consider it just like a little trampoline to
> > me. As we describe the hypercalls in C header files, I consider the C
> > functions the "official" hypercall entry points.
> 
> Why would that be? Any code we execute in Xen is relevant.

There are a few reasons:

- the public interface is described in a C header so it makes sense for
  the corresponding implementation to be in C

- the C entry point is often both the entry point in C and also common
  code

- depending on the architecture, there is typically always some minimal
  assembly entry code to prepare the environment before we can jump into
  C-land; still one wouldn't consider those minimal and routine assembly
  operations to be a meaningful hypercall entry point corresponding to
  the C declaration in the public headers

- as per MISRA and also general good practice, we need the declaration
  in the public header files to match the definition in C


> > Also, as this is an ABI, I consider mandatory to use clear width
> > definitions of all the types (whether with this document or with
> > fixed-width types, and fixed-width types are clearer and better) in both
> > the C header files that describe the ABI interfaces, as well as the C
> > entry points that corresponds to it. E.g. I think we have to use
> > the same types in both do_sched_op and the hypercall description in
> > xen/include/public/sched.h
> 
> There are two entirely separate aspects to the ABI: One is what we
> document towards consumers of it. The other is entirely internal, i.e.
> an implementation detail - how we actually consume the data.
> Documenting fixed-width types towards consumers is probably okay,
> albeit (see below) imo still not strictly necessary (for being
> needlessly limiting).

I don't see it this way.

As the Xen public interface description is in C and used during the
build, my opinion is that the public description and the C definition
need to match.

Also, I don't understand how you can say that public interfaces don't
strictly necessarily have to use fixed-width types.

Imagine that you use native types with different compilers that can
actually output different width interger sizes (which is not possible
today with gcc or clang). Imagine that a guest is written in a language
other than C (e.g. Java) based on the public interface description. It
cannot work correctly, can it?

I don't see how we can possibly have a public interface with anything
other than fixed-width integers.


> >> As to public ABIs - that's structure definitions, and I agree we ought
> >> to uniformly use fixed-width types there. We largely do; a few things
> >> still require fixing.
> > 
> > +1
> > 
> > 
> >>> We have two options:
> >>>
> >>> 1) we go with this document, and we clarify that even if we specify
> >>>   "unsigned int", we actually mean a 32-bit integer
> >>>
> >>> 2) we change all our public ABIs and C hypercall entry points to use
> >>>    fixed-size types (e.g. s/unsigned int/uint32_t/g)
> >>>
> >>> 2) is preferred because it is clearer but it is more work. So I went
> >>> with 1). I also thought you would like 1) more.
> >>
> >> For ABIs (i.e. structures) we ought to be making that change anyway.
> >> Leaving basic types in there is latently buggy.
> > 
> > I am glad we agree :-)
> > 
> > It is just that I also consinder the C hypercall entry points as part of
> > the ABI
> > 
> > 
> >> I'm happy to see a document like this added, for the purpose described
> >> above. But to me 1) and 2) and largely independent of one another.
> > 
> > Good that you are also happy with a document like this.
> > 
> > The remaining question is: what about the rest of the C functions in Xen
> > that are certainly not part of an ABI?
> 
> As per above - anything internal isn't part of the ABI, C entry points
> for hypercall handlers included. All we need to ensure is that we consume
> the data according to what the ABI sets forth.

It doesn't look like we'll convince one another on this point. But let
me try another way.

In my view, having mismatched types between declaration and definition
and having non-fixed-width types in C hypercall entry points is really
bad for a number of reasons, among them:
- correctness
- risk of ABI breakage
- mismatch of declaration and definition

In your view, the drawback is not following the CODING_STYLE.

The two points of views on this subject don't have the same to lose. If
I were you, I would probably not invest my energy to defend the
CODING_STYLE.


> To use wording from George when he criticized my supposed lack of actual
> arguments: While there's nothing technically wrong with using fixed
> width types there (or in fact everywhere), there's also nothing technically
> wrong with using plain C types there and almost everywhere else (ABI
> structures excluded). With both technically equal, ./CODING_STYLE has the
> only criteria to pick between the two. IOW that's what I view wrong in
> George's argumentation: Demanding that I provide technical arguments when
> the desire to use fixed width types for the purpose under discussion also
> isn't backed by any.

I don't think we are in violation of the CODING_STYLE as it explicitly
accounts for exceptions. Public interfaces declarations and definitions
(hypercalls C entry points included) are an exception.

In my opinion, using fixed-width integers in public headers and C
definitions (including C hypercall entry points) is top priority for
correctness. Correctness is more important than style. So, if we need to
change the CODING_STYLE to get there, let's change the CODING_STYLE.


> > Those are less critical, still this document should apply uniformily to
> > them too. I don't understand why you are making the >= width assumption
> > you mentioned at the top of the file when actually it is impossible to
> > exercise or test this assumption on any compiler or any architecture
> > that works with Xen. If it cannot be enabled, it hasn't been tested, and
> > it probably won't work.
> 
> Hmm, yes, that's one way to look at it. My perspective is different though:
> By writing down assumptions that are more strict than necessary, we'd be
> excluding ports to environments meeting the >= assumption, but not meeting
> the == one. Unless of course you can point me at any place where - not
> just by mistake / by being overly lax - we truly depend on the == that you
> want to put in place. IOW yes, there likely would need to be adjustments
> to code if such a port was to happen. Yet we shouldn't further harden
> requirements that were never meant to be there.

I have already shown that all the current implementations and tests only
check for ==. In my opinion, this is sufficient evidence that >= is not
supported.

If you admit it probably wouldn't work without fixes today, would you
security-support such a configuration? Would you safety-support it? I
wouldn't want to buy a car running Xen compiled with a compiler using
integer sizes different from the ones written in this document.

Let me summarize our positions on these topics.

Agreed points:
- public interfaces should use fixed-width types
- it is a good idea to have a document describing our assumptions about
  integer types

Open decision points and misalignments:
- Should the C hypercall entry points match the public header
  declarations and ideally use fixed-width integer types? 

I'd say yes and I would argue for it

- Should the document describing our assumptions about integer types
  specify == (unsigned int == uint32_t) or >= (unsigned int >=
  uint32_t)?

I'd say specify == and I would argue for it

