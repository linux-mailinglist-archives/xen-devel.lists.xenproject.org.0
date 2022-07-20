Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A27C657B680
	for <lists+xen-devel@lfdr.de>; Wed, 20 Jul 2022 14:32:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.371565.603494 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oE8s8-0000xR-Qs; Wed, 20 Jul 2022 12:32:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 371565.603494; Wed, 20 Jul 2022 12:32:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oE8s8-0000v2-OB; Wed, 20 Jul 2022 12:32:12 +0000
Received: by outflank-mailman (input) for mailman id 371565;
 Wed, 20 Jul 2022 12:32:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5mDn=XZ=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1oE8s7-0000uw-8T
 for xen-devel@lists.xenproject.org; Wed, 20 Jul 2022 12:32:11 +0000
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com
 [2a00:1450:4864:20::22e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f96be420-0827-11ed-924f-1f966e50362f;
 Wed, 20 Jul 2022 14:32:10 +0200 (CEST)
Received: by mail-lj1-x22e.google.com with SMTP id r14so6193655ljp.2
 for <xen-devel@lists.xenproject.org>; Wed, 20 Jul 2022 05:32:10 -0700 (PDT)
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
X-Inumbo-ID: f96be420-0827-11ed-924f-1f966e50362f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Xd4I28wqGMbQUFhDjkVwdMEQ9FWCaodOJF7yMGauOSQ=;
        b=TUbucA2PU0zhiLKi1YEi3IwlYFz34YzfZFNfvRHZFq4skdHcMve9++EKkSwKs7WZWU
         uyIL8rGjn9nE8XGofAspve+LE8BbV7mDHiYGwKhcYjhAHPBMuSAGuQSm+fP08ryny8WV
         NCs6Eop4Sg6JPbDrKdRQBRAnrZxGP9yaHPE4YMR4d8+bKMM4clBGSJtvw8oJfLBi+hpT
         9inBI8K1xT8RjbOuk/eDnw6pMaELrE5HYWw7LRYdpLGFzga0QzimAWv3mGpxGK1cJ5Lr
         wBsE69AivyE7ADTJd99C45jAzShwHeP9a82SYWFWGHBiBctAqCfnhjNpdSap+86EuKCd
         9Mfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Xd4I28wqGMbQUFhDjkVwdMEQ9FWCaodOJF7yMGauOSQ=;
        b=RI5i4fVFh1oEXMkm5sJBV/Te2BVLAjI5CTWd/lEYLaLH7XxXJts6NYHJTRgDR8n7/b
         M2DFD0hSRSIbQcYvwL24jCfnOHnbY3SVyP/geA8U8b7e5/A63Ox7futWf3mz2W8ek1bw
         mu0S7yk+Gvnj9z8U8tJw6FFnf8OoDYq1phb24LyfUInEWtnEzM7jmNlfo1bH5kAihHEm
         qMDY7S0R2fbMF0DWgT2i7gsdaTxA3aYi1Qoo5TitR1B3fkk1e1DiA4y1DARLIoUfaiEG
         Uru3TR95z9Z5iz3fwnTOJeAq0RgLHIEo/7bMco6eJ3p9ERHhvWVnTPZ5PhUBbV0YNRnz
         ZnAw==
X-Gm-Message-State: AJIora/QBha72uMz2EiDL9aekPJqEdohxofZS5tzcAboefmlApcY+d4g
	DxY9mVbaw7yomH5HM4rMauPxtsbd7y9Fj5PETMPY4e9Ff7I=
X-Google-Smtp-Source: AGRyM1ste7D4rP9NsUSGd/hKmn2ECeW/G3M8TacFmWjmw0wFeF4UjY0hzbimDjT+KUayXv1WMyhtQ12SgbZ2jew7/TY=
X-Received: by 2002:a05:651c:38e:b0:25d:87b1:b50a with SMTP id
 e14-20020a05651c038e00b0025d87b1b50amr17890958ljp.168.1658320329508; Wed, 20
 Jul 2022 05:32:09 -0700 (PDT)
MIME-Version: 1.0
References: <20220719200815.69884-1-jandryuk@gmail.com> <5a1e78c8-1982-f787-46a4-7197b23d53e8@citrix.com>
In-Reply-To: <5a1e78c8-1982-f787-46a4-7197b23d53e8@citrix.com>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Wed, 20 Jul 2022 08:31:58 -0400
Message-ID: <CAKf6xpseJwr0HHTYZ0ywTM06RF6r5100MLBEO0Xe7QJdXhro9g@mail.gmail.com>
Subject: Re: [PATCH] x86: Expose more MSR_ARCH_CAPS to hwdom
To: Andrew Cooper <Andrew.Cooper3@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Jan Beulich <jbeulich@suse.com>, 
	Roger Pau Monne <roger.pau@citrix.com>, Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, Jul 19, 2022 at 4:29 PM Andrew Cooper <Andrew.Cooper3@citrix.com> wrote:
>
> On 19/07/2022 21:08, Jason Andryuk wrote:
> > commit e46474278a0e ("x86/intel: Expose MSR_ARCH_CAPS to dom0") started
> > exposing MSR_ARCH_CAPS to dom0.  More bits in MSR_ARCH_CAPS have since
> > been defined, but they haven't been exposed.  Update the list to allow
> > them through.
> >
> > As one example, this allows a linux Dom0 to know that it has the
> > appropriate microcode via FB_CLEAR.  Notably, and with the updated
> > microcode, this changes dom0's
> > /sys/devices/system/cpu/vulnerabilities/mmio_stale_data changes from:
> > "Vulnerable: Clear CPU buffers attempted, no microcode; SMT Host state
> > unknown"
> > to:
> > "Mitigation: Clear CPU buffers; SMT Host state unknown"
> >
> > This ecposes the MMIO Stale Data and Intel Branch History Injection
> > (BHI) controls as well as the page size change MCE issue bit.
> >
> > Fixes: commit 2ebe8fe9b7e0 ("x86/spec-ctrl: Enumeration for MMIO Stale Data controls")
> > Fixes: commit cea9ae062295 ("x86/spec-ctrl: Enumeration for new Intel BHI controls")
> > Fixes: commit 59e89cdabc71 ("x86/vtx: Disable executable EPT superpages to work around CVE-2018-12207")
> >
> > Signed-off-by: Jason Andryuk <jandryuk@gmail.com>
> > ---
> > This is the broader replacement for "x86: Add MMIO Stale Data arch_caps
> > to hardware domain".
> >
> > It wasn't discussed previously, but ARCH_CAPS_IF_PSCHANGE_MC_NO is added
> > as well.
>
> I deliberately excluded IF_PSCHANGE_MC_NO because it wasn't relevant.
> But I suppose Linux is looking for it anyway?

Yeah, it looks like Linux checks that bit to determine if it is
affected by what it calls "itlb_multihit".  That's just from reading
the code - I don't seem to have hardware that actually sets that bit
though.

> IF_PSCHANGE_MC_NO is the mouthful meaning "the frontend doesn't have a
> strop when it takes an assist finds that the iTLB mapping has changed".
> It's only interesting to hypervisors looking after an EPT guest, which
> means that it's only interesting to expose to HAP guests with nested
> virt.  Except we disable mitigations for nested virt because there's a
> bug in the nHAP code which I didn't have time to figure out, and none of
> this is remotely security supported to start with.

I can change this however you like.  Basically my reasoning to include
it was that since the "_NO" bits say the hardware is not affected by
something, it's okay to pass it through.

> In principle, TAA_NO's visibility should be dependent on the visibility
> of RTM, but given this is all a pile of hacks anyway, I'm not sure how
> much I care at this point.

:/

Regards,
Jason

