Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F1A96881AB3
	for <lists+xen-devel@lfdr.de>; Thu, 21 Mar 2024 02:47:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.696170.1086850 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rn7Vq-0007aZ-7l; Thu, 21 Mar 2024 01:46:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 696170.1086850; Thu, 21 Mar 2024 01:46:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rn7Vq-0007Yk-4E; Thu, 21 Mar 2024 01:46:34 +0000
Received: by outflank-mailman (input) for mailman id 696170;
 Thu, 21 Mar 2024 01:46:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gBWc=K3=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1rn7Vo-0007Ye-Dy
 for xen-devel@lists.xenproject.org; Thu, 21 Mar 2024 01:46:32 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d5d428fc-e724-11ee-afdf-a90da7624cb6;
 Thu, 21 Mar 2024 02:46:30 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 61946CE1282;
 Thu, 21 Mar 2024 01:46:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D9ECC433F1;
 Thu, 21 Mar 2024 01:46:25 +0000 (UTC)
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
X-Inumbo-ID: d5d428fc-e724-11ee-afdf-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1710985586;
	bh=S8wrytfcIW89807vsPn2b7h0OhN+slgwgBdID7tNJu4=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=hUYuitUfkSVydIYjq9fchuJ8ENuesBqRYTXGtsdpnhQxJYko6v+uI2weNj6vg3a3x
	 Q6v3UyLKdN5ahl0BvRTCYUxYfWYhQvqu7/jqJ+RUf1mSvhdTp7EVKl8ykA0x7j4ZPt
	 TLEv+Ziot2Vor1vBRZfXhFN5wV4q9Cfenx6iYoTh3S9cay/qvYG7Iw36tk04AdS3j7
	 U6gYr7eOjuWUSwrpgSVRVzCqERsG8BmUBNqfWGe3RBJGIq0Jb/9X7lxPTQlyAPDdYF
	 wFew7A+eitaCLoVlaZIoZuvSg4k/KKFzvC7E/hoZG0MVe38BmAeYHghDkvtMDpu/Wd
	 FX8Tvgo36MBgg==
Date: Wed, 20 Mar 2024 18:46:23 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jan Beulich <jbeulich@suse.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, andrew.cooper3@citrix.com, 
    bertrand.marquis@arm.com, george.dunlap@citrix.com, julien@xen.org, 
    michal.orzel@amd.com, roger.pau@citrix.com, xen-devel@lists.xenproject.org
Subject: Re: [PATCH v2] docs/misra: document the expected sizes of integer
 types
In-Reply-To: <87234837-9fb3-40a9-849d-8b8574f2661c@suse.com>
Message-ID: <alpine.DEB.2.22.394.2403201812380.1569010@ubuntu-linux-20-04-desktop>
References: <alpine.DEB.2.22.394.2403141516550.853156@ubuntu-linux-20-04-desktop> <6a76723e-ba47-40b3-8f33-d68030b14299@suse.com> <alpine.DEB.2.22.394.2403151658530.853156@ubuntu-linux-20-04-desktop> <7ab73379-b057-4568-9869-141cef185752@suse.com>
 <alpine.DEB.2.22.394.2403181735410.853156@ubuntu-linux-20-04-desktop> <fadd30c9-440d-401d-bd05-7e1d965bbefe@suse.com> <alpine.DEB.2.22.394.2403190815220.853156@ubuntu-linux-20-04-desktop> <87234837-9fb3-40a9-849d-8b8574f2661c@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 20 Mar 2024, Jan Beulich wrote:
> > - the public interface is described in a C header so it makes sense for
> >   the corresponding implementation to be in C
> > 
> > - the C entry point is often both the entry point in C and also common
> >   code
> > 
> > - depending on the architecture, there is typically always some minimal
> >   assembly entry code to prepare the environment before we can jump into
> >   C-land; still one wouldn't consider those minimal and routine assembly
> >   operations to be a meaningful hypercall entry point corresponding to
> >   the C declaration in the public headers
> > 
> > - as per MISRA and also general good practice, we need the declaration
> >   in the public header files to match the definition in C
> 
> Throughout, but especially with this last point, I feel there's confusion
> (not sure on which side): There are no declarations of hypercall functions
> in the public headers. Adding declarations there for the C entry points in
> Xen would actually be wrong, as we don't provide such functions anywhere
> (to consumers of the ABI).

I am copy/pasting text from sched.h:

 * The prototype for this hypercall is:
 * ` long HYPERVISOR_sched_op(enum sched_op cmd, void *arg, ...)
 *
 * @cmd == SCHEDOP_??? (scheduler operation).
 * @arg == Operation-specific extra argument(s), as described below.
 * ...  == Additional Operation-specific extra arguments, described below.
 *

from event_channel.h:

 * ` enum neg_errnoval
 * ` HYPERVISOR_event_channel_op(enum event_channel_op cmd, void *args)
 * `
 * @cmd  == EVTCHNOP_* (event-channel operation).
 * @args == struct evtchn_* Operation-specific extra arguments (NULL if none).

These are the hypercall declarations in public headers. Although they
are comments, they are the only description of the ABI that we have (as
far as I know). They are in C and use C types. 


> >>> Also, as this is an ABI, I consider mandatory to use clear width
> >>> definitions of all the types (whether with this document or with
> >>> fixed-width types, and fixed-width types are clearer and better) in both
> >>> the C header files that describe the ABI interfaces, as well as the C
> >>> entry points that corresponds to it. E.g. I think we have to use
> >>> the same types in both do_sched_op and the hypercall description in
> >>> xen/include/public/sched.h
> >>
> >> There are two entirely separate aspects to the ABI: One is what we
> >> document towards consumers of it. The other is entirely internal, i.e.
> >> an implementation detail - how we actually consume the data.
> >> Documenting fixed-width types towards consumers is probably okay,
> >> albeit (see below) imo still not strictly necessary (for being
> >> needlessly limiting).
> > 
> > I don't see it this way.
> > 
> > As the Xen public interface description is in C and used during the
> > build, my opinion is that the public description and the C definition
> > need to match.
> > 
> > Also, I don't understand how you can say that public interfaces don't
> > strictly necessarily have to use fixed-width types.
> > 
> > Imagine that you use native types with different compilers that can
> > actually output different width interger sizes (which is not possible
> > today with gcc or clang). Imagine that a guest is written in a language
> > other than C (e.g. Java) based on the public interface description. It
> > cannot work correctly, can it?
> 
> They'd need to write appropriate hypercall invocation functions. As per
> above - we don't provide these in the public headers, not even for C
> consumers.

See above


> > I don't see how we can possibly have a public interface with anything
> > other than fixed-width integers.
> 
> That's the consumer side of the ABI. It says nothing about the internal
> implementation details in Xen. All we need to do there is respect the
> ABI. That has no influence whatsoever on the C entry points when those
> aren't the actual hypercall entrypoints into the hypervisor.

If we go by the strictest definition, nothing is actually called directly
except for the target of a "b" instruction.

When you call a function in C, you are not actually calling a function.
Assembly is generated to save variables and do other things before "b".
Still, typically it is still considered a "direct" call.

It is not exactly the same thing with hypercall, but I hope I conveyed
the idea why I consider the C hypercall entry points part of the ABI.


> >>>> As to public ABIs - that's structure definitions, and I agree we ought
> >>>> to uniformly use fixed-width types there. We largely do; a few things
> >>>> still require fixing.
> >>>
> >>> +1
> >>>
> >>>
> >>>>> We have two options:
> >>>>>
> >>>>> 1) we go with this document, and we clarify that even if we specify
> >>>>>   "unsigned int", we actually mean a 32-bit integer
> >>>>>
> >>>>> 2) we change all our public ABIs and C hypercall entry points to use
> >>>>>    fixed-size types (e.g. s/unsigned int/uint32_t/g)
> >>>>>
> >>>>> 2) is preferred because it is clearer but it is more work. So I went
> >>>>> with 1). I also thought you would like 1) more.
> >>>>
> >>>> For ABIs (i.e. structures) we ought to be making that change anyway.
> >>>> Leaving basic types in there is latently buggy.
> >>>
> >>> I am glad we agree :-)
> >>>
> >>> It is just that I also consinder the C hypercall entry points as part of
> >>> the ABI
> >>>
> >>>
> >>>> I'm happy to see a document like this added, for the purpose described
> >>>> above. But to me 1) and 2) and largely independent of one another.
> >>>
> >>> Good that you are also happy with a document like this.
> >>>
> >>> The remaining question is: what about the rest of the C functions in Xen
> >>> that are certainly not part of an ABI?
> >>
> >> As per above - anything internal isn't part of the ABI, C entry points
> >> for hypercall handlers included. All we need to ensure is that we consume
> >> the data according to what the ABI sets forth.
> > 
> > It doesn't look like we'll convince one another on this point. But let
> > me try another way.
> > 
> > In my view, having mismatched types between declaration and definition
> > and having non-fixed-width types in C hypercall entry points is really
> > bad for a number of reasons, among them:
> > - correctness
> > - risk of ABI breakage
> > - mismatch of declaration and definition
> 
> What mismatches are you talking about? There's nothing mismatched now,
> and there cannot be any mismatch, because the consumers of the ABI don't
> call Xen functions directly.

Let me make an example:

- public header saying enum event_channel_op cmd
- <assembly>
- do_event_channel_op(int cmd, ...)

Do you think this is all good?

There are two pretty serious problems here:
- enum and int are not the same type
- enum and int are not fixed-width

Don't you think it should be:

- public header saying uint32_t cmd in a comment
- <assembly>
- do_something_op(uint32_t cmd, ...)

Or possibly unsigned long depending on the parameter.

?


> > In your view, the drawback is not following the CODING_STYLE.
> > 
> > The two points of views on this subject don't have the same to lose. If
> > I were you, I would probably not invest my energy to defend the
> > CODING_STYLE.
> > 
> > 
> >> To use wording from George when he criticized my supposed lack of actual
> >> arguments: While there's nothing technically wrong with using fixed
> >> width types there (or in fact everywhere), there's also nothing technically
> >> wrong with using plain C types there and almost everywhere else (ABI
> >> structures excluded). With both technically equal, ./CODING_STYLE has the
> >> only criteria to pick between the two. IOW that's what I view wrong in
> >> George's argumentation: Demanding that I provide technical arguments when
> >> the desire to use fixed width types for the purpose under discussion also
> >> isn't backed by any.
> > 
> > I don't think we are in violation of the CODING_STYLE as it explicitly
> > accounts for exceptions. Public interfaces declarations and definitions
> > (hypercalls C entry points included) are an exception.
> 
> If that was technically necessary, I would surely agree to there being an
> exception here.

Great, that's a start


> > In my opinion, using fixed-width integers in public headers and C
> > definitions (including C hypercall entry points) is top priority for
> > correctness. Correctness is more important than style. So, if we need to
> > change the CODING_STYLE to get there, let's change the CODING_STYLE.
> > 
> > 
> >>> Those are less critical, still this document should apply uniformily to
> >>> them too. I don't understand why you are making the >= width assumption
> >>> you mentioned at the top of the file when actually it is impossible to
> >>> exercise or test this assumption on any compiler or any architecture
> >>> that works with Xen. If it cannot be enabled, it hasn't been tested, and
> >>> it probably won't work.
> >>
> >> Hmm, yes, that's one way to look at it. My perspective is different though:
> >> By writing down assumptions that are more strict than necessary, we'd be
> >> excluding ports to environments meeting the >= assumption, but not meeting
> >> the == one. Unless of course you can point me at any place where - not
> >> just by mistake / by being overly lax - we truly depend on the == that you
> >> want to put in place. IOW yes, there likely would need to be adjustments
> >> to code if such a port was to happen. Yet we shouldn't further harden
> >> requirements that were never meant to be there.
> > 
> > I have already shown that all the current implementations and tests only
> > check for ==. In my opinion, this is sufficient evidence that >= is not
> > supported.
> > 
> > If you admit it probably wouldn't work without fixes today, would you
> > security-support such a configuration? Would you safety-support it? I
> > wouldn't want to buy a car running Xen compiled with a compiler using
> > integer sizes different from the ones written in this document.
> > 
> > Let me summarize our positions on these topics.
> > 
> > Agreed points:
> > - public interfaces should use fixed-width types
> > - it is a good idea to have a document describing our assumptions about
> >   integer types
> > 
> > Open decision points and misalignments:
> > - Should the C hypercall entry points match the public header
> >   declarations and ideally use fixed-width integer types? 
> 
> As per above, this question just cannot be validly raised. There are
> no public header declarations to match.

I clarified


> > I'd say yes and I would argue for it
> > 
> > - Should the document describing our assumptions about integer types
> >   specify == (unsigned int == uint32_t) or >= (unsigned int >=
> >   uint32_t)?
> > 
> > I'd say specify == and I would argue for it
> 
> Actually, I had a further thought here in the meantime: For particular
> ports, using == is likely okay - they're conforming to particular
> psABI-s, after all (and that's what the compilers used also implement).
> I'd nevertheless expect >= to be used in common assumptions. That way
> for existing ports you get what you want, and there would still be
> provisions for new ports using, say, an ILP64 ABI. Common code would
> need to adhere to the common assumptions only. Arch-specific code can
> work from the more tight assumptions. (If future sub-arch variants are
> to be expected, like RV128, arch-code may still be well advised to try
> to avoid the more tight assumptions where possible, just to limit
> eventual porting effort.)

I understand the aspirational goal of supporting >= but in reality it is
not tested, if it is not tested it cannot work, if it cannot work, we
cannot support it. If someone creates a compiler or other tool to check
for >= I would be happy to discuss expanding the document. Without any
tests, I don't think it would be useful to write down >=, not even as
an aspirational goal. A goal must be actionable.

