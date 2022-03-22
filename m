Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7986A4E42EE
	for <lists+xen-devel@lfdr.de>; Tue, 22 Mar 2022 16:25:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.293552.498692 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nWgNi-00064h-FD; Tue, 22 Mar 2022 15:25:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 293552.498692; Tue, 22 Mar 2022 15:25:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nWgNi-00061d-C7; Tue, 22 Mar 2022 15:25:10 +0000
Received: by outflank-mailman (input) for mailman id 293552;
 Tue, 22 Mar 2022 15:25:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=iXg/=UB=gmail.com=tamas.k.lengyel@srs-se1.protection.inumbo.net>)
 id 1nWgNh-00061X-8o
 for xen-devel@lists.xenproject.org; Tue, 22 Mar 2022 15:25:09 +0000
Received: from mail-oa1-x2d.google.com (mail-oa1-x2d.google.com
 [2001:4860:4864:20::2d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 410c05c7-a9f4-11ec-a405-831a346695d4;
 Tue, 22 Mar 2022 16:25:08 +0100 (CET)
Received: by mail-oa1-x2d.google.com with SMTP id
 586e51a60fabf-de3eda6b5dso2013106fac.0
 for <xen-devel@lists.xenproject.org>; Tue, 22 Mar 2022 08:25:08 -0700 (PDT)
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
X-Inumbo-ID: 410c05c7-a9f4-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=eaz97wT2y3WUU7O1vQdJZt9IF7QNbOt91eXLF6u0nBo=;
        b=TTtXl/zbXizei6ZuOV0iMBSGwYLZjlEh9skNdvR80URJapstUHmsyC1jMz+xQx/Wkq
         DpJKEIrei9gUa0gKb+54I/66V4o2Sy6casziOCmaasWVXkIITO5tex2q4jluLMcq7ZbB
         eNIyPoKyiXDgevE1apClMuY8gP5gB98scavFNElcYo5oALV5IWvIcbTTDBhHr66POY/v
         bY8XE8EfDoS/vsOFwl2xHbRxhtIzCWmKMihix2BeN6blXgP7PHa7dlqTeYLXO4QcHiJM
         dC6qGlVErjosfjvdjQZQUXBFwR5obMi373SGwJwIPQOH247hlb0NYd+28nnMF4VXDaKS
         LbeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=eaz97wT2y3WUU7O1vQdJZt9IF7QNbOt91eXLF6u0nBo=;
        b=f7IDymYyYDzF/c0xYlxYIA1WT/wWvq3oqJLf/sSunqNvLRp7QwLW7eFp85VhbkqCKv
         AAH6OPbQqlw0ZtlQCYSnmi9WQoNWS46qJgb6jCNiIw9UIkpfjYSTOOjZ0RTGQ0RxFOHI
         YCTih4mMtPkztbPkc/0l4XmpFspZco83oPnmFnzrhglltdEdrV75Wi7JjRUW4NLnaK7D
         9X7JlPI5ztgQcpLxPEYHd0XeKgznuSZHIZOJbqvrJTxSYvs93DCZP2FqX+fPC2rbNNAK
         18E2rM57WIO4D+lltn66zdtXP+6fK9ygUjRtNJy3BCM80V6wKvO04R2IkY1/1z5CUevp
         XHXw==
X-Gm-Message-State: AOAM533wfDTpjvYboFE7BHuQrOm20p7pLuMwe+i3U81T64HlQbKIHO87
	iO4EekTv0vP126DusS86gAPk6f9Rlk0MRJ6oAJs5USTc
X-Google-Smtp-Source: ABdhPJx/sUrd7WNRq45ljustNtfQmaWjoiXBGe2Jea8CqA/h52BWEBUY82ttBNvy0H+/16mR74yZitl5taZ4l1m+jwo=
X-Received: by 2002:a05:6870:510:b0:d6:f5d1:d1ff with SMTP id
 j16-20020a056870051000b000d6f5d1d1ffmr1935387oao.128.1647962706431; Tue, 22
 Mar 2022 08:25:06 -0700 (PDT)
MIME-Version: 1.0
References: <a8828d68c308fa7ecbfe4387ca753ee0f80a2a7d.1647897016.git.tamas.lengyel@intel.com>
 <72c90101-55ee-b749-625f-004e40bd2745@citrix.com>
In-Reply-To: <72c90101-55ee-b749-625f-004e40bd2745@citrix.com>
From: Tamas K Lengyel <tamas.k.lengyel@gmail.com>
Date: Tue, 22 Mar 2022 11:24:30 -0400
Message-ID: <CABfawhnRW=qcVNxSA7ee+9yc6D9Ae=HCnKn_oZ1JfXKm172KRQ@mail.gmail.com>
Subject: Re: [PATCH v4] x86/vmx: save guest non-register state in hvm_hw_cpu
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Tamas K Lengyel <tamas.lengyel@intel.com>, 
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Jan Beulich <JBeulich@suse.com>, 
	Roger Pau Monne <roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Jun Nakajima <jun.nakajima@intel.com>, 
	Kevin Tian <kevin.tian@intel.com>, David Vrabel <dvrabel@cantab.net>
Content-Type: text/plain; charset="UTF-8"

On Tue, Mar 22, 2022 at 11:11 AM Andrew Cooper
<Andrew.Cooper3@citrix.com> wrote:
>
> On 21/03/2022 21:12, Tamas K Lengyel wrote:
> > During VM forking and resetting a failed vmentry has been observed due
> > to the guest non-register state going out-of-sync with the guest register
> > state. For example, a VM fork reset right after a STI instruction can trigger
> > the failed entry. This is due to the guest non-register state not being saved
> > from the parent VM, thus the reset operation only copies the register state.
> >
> > Fix this by including the guest non-register state in hvm_hw_cpu so that when
> > its copied from the parent VM the vCPU state remains in sync.
> >
> > SVM is not currently wired-in as VM forking is VMX only and saving non-register
> > state during normal save/restore/migration operation hasn't been needed. If
> > deemed necessary in the future it can be wired in by adding a svm-substructure
> > to hvm_hw_cpu.
>
> I disagree here.  This bug isn't really to do with fuzzing; it's to do
> with our APIs being able to get/set vCPU state correctly, and fuzzing is
> the example which demonstrated the breakage.
>
> This will also cause very subtle bugs for the guest-transparent
> migration work, and the live update work, both of which want to shift
> vcpu state behind a VM which hasn't actively entered Xen via hypercall.
>
> (Quick tangent.  Seriously, can the SDM be fixed so it actually
> enumerates the Activity States.)
>
> Xen doesn't currently support any situation where Intel's idea of
> Activity State is anything other than 0.  This in turn is buggy, because
> we don't encode VPF_blocked anywhere.  An activity state of hlt might
> not be best place to encode this, because notably absent from Intel's
> activity state is mwait.  We'll also terminate things like schedop_poll
> early.
>
> Next, AMD does have various fields from interruptibility.  If you want
> me to write the patch then fine, but they should not be excluded from a
> patch like this.  AMD do not have separate bits for STI and MovSS, due
> to microarchitectural differences, but the single INTERRUPT_SHADOW bit
> does need managing, as does the blocked-by-NMI bit which is emulated on
> SVM and older Intel CPUs.
>
> Minor tangent, blocked-by-SMI needs cross-linking with vm-entry
> controls, so I'm not sure it is something we ought to expose.
>
> Next, it turns out that MSR_DEBUGCTL isn't included anywhere (not even
> the MSR list).  It is important, because it forms part of the VMEntry
> cross-check with PENDING_DBG and TF.
>
> Next, we also don't preserve PDPTRs.  This is another area where Intel
> and AMD CPUs behave differently, but under Intel's architecture, the
> guest kernel can clobber the 32bit PAE block of pointers and everything
> will function correctly until the next mov into cr3.  There are
> definitely bugs in Xen's emulated pagewalk in this area.
>
> So there are a lot of errors with hvm_hw_cpu and I bet I haven't found
> them all.
>
> As discussed at multiple previous XenSummits, the current load/save mess
> needs moving out of Xen, and that would be the correct time to fix the
> other errors, but it probably is too much for this case.
>
>
> At a minimum, there shouldn't be a VMX specific union, because we are
> talking about architecture-agnostic properties of the vCPU.  It's fine
> for the format to follow Intel's bit layout for the subset of bits we
> tolerate saving/restoring, but this needs discussing in the header, and
> needs rejecting on set.  An extra check/reject is 0% overhead for
> forking, so I don't find that a credible argument against doing it.

Sure, during the fork itself it's negligible. It's during fork_reset,
which we do thousands of times per second where that sanity checking
is both unneeded (we know the setting is getting copied from the
parent) and will quickly add up if we need to do a bunch of bitshifts
to ensure only the valid bits are restored (plus converted in case the
format will be the non-vmx version).

> I'm not sure if we want to include the activity state at the moment
> without a better idea of how to encode VPF_blocked, but I think DEBUGCTL
> does need including.  This in turn involves transmitting the LBR MSRs too.

I don't really have much to add here. If there are concerns in regards
to the side-effect of this on the pre-existing save/restore/migration
route then what I can do is add only a Xen-internal function that will
allow the fork_reset to copy the non-register state from the parent
and not expose it via the public header. That works for me just as
well, my use-case doesn't have a requirement for these bits to be
exposed externally.

Tamas

