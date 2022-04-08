Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 653024F95F5
	for <lists+xen-devel@lfdr.de>; Fri,  8 Apr 2022 14:41:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.301513.514568 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ncnvR-0006R8-Tb; Fri, 08 Apr 2022 12:41:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 301513.514568; Fri, 08 Apr 2022 12:41:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ncnvR-0006OK-QE; Fri, 08 Apr 2022 12:41:17 +0000
Received: by outflank-mailman (input) for mailman id 301513;
 Fri, 08 Apr 2022 12:41:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=chE6=US=tklengyel.com=tamas@srs-se1.protection.inumbo.net>)
 id 1ncnvQ-0006OE-Sb
 for xen-devel@lists.xenproject.org; Fri, 08 Apr 2022 12:41:16 +0000
Received: from MTA-15-3.privateemail.com (mta-15-3.privateemail.com
 [198.54.122.111]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2d326540-b739-11ec-a405-831a346695d4;
 Fri, 08 Apr 2022 14:41:15 +0200 (CEST)
Received: from mta-15.privateemail.com (localhost [127.0.0.1])
 by mta-15.privateemail.com (Postfix) with ESMTP id A93E718000B4
 for <xen-devel@lists.xenproject.org>; Fri,  8 Apr 2022 08:41:13 -0400 (EDT)
Received: from mail-oi1-f174.google.com (unknown [10.20.151.143])
 by mta-15.privateemail.com (Postfix) with ESMTPA id 19ED61800084
 for <xen-devel@lists.xenproject.org>; Fri,  8 Apr 2022 08:41:13 -0400 (EDT)
Received: by mail-oi1-f174.google.com with SMTP id 12so8645886oix.12
 for <xen-devel@lists.xenproject.org>; Fri, 08 Apr 2022 05:41:13 -0700 (PDT)
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
X-Inumbo-ID: 2d326540-b739-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=tklengyel.com;
	s=default; t=1649421673;
	bh=DP+NHR9//4G9Rjhj0kYzbqhTewtuNRi3eNslDYha7QY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=xiproq7O/uHS2b4CpvXuicBqwz8dB5X0sJKHdGgXlDb95wLBnpupuGTJsm+Ax2QQY
	 appz2Q63GgD4SgMUEPLPgzM0O0XomZ7g/RGbmDYftChDeWOFvDsgmKk6VpHQEmePIW
	 Y+Fh8K1rA2XzVYcNB58AX0KL/UMlRkHKYzJdBuNdA91nVENGEbo2YFsJJEuqQ9jMRM
	 DwMTbJsIZsIZGX7elMC2VCbcJXpv4PAbyuAK/TLuSbqftca2cYXb7cCoUqIftmfxeA
	 ssb8Nb1qvR4hq7aRnXa5/LMpmY6G/GDDdsIgx6y8JfL6/qrPzyzcSxzGLS3ZBP7Xo1
	 U58WuIwQpgc+Q==
X-Gm-Message-State: AOAM530tKO9eu2DUmt61D3T4db0ThLFx8d9auhryGAVbB6WcT8EOrx/j
	I6S8jvKFryvkPMi9BRvGYGq+kdaBkw/ru8MV3fU=
X-Google-Smtp-Source: ABdhPJyRxBCgWaklEkPejPBHE/jhwYVvbebiqnAMotnGnANaTbgoaX36uCAbbeQ3cl95PK3+vjGFjkDE8wNLuB08EyQ=
X-Received: by 2002:aca:d12:0:b0:2ee:f684:bd4b with SMTP id
 18-20020aca0d12000000b002eef684bd4bmr7877583oin.128.1649421672442; Fri, 08
 Apr 2022 05:41:12 -0700 (PDT)
MIME-Version: 1.0
References: <e57797cbc2c0706c03363cc7fa1b3e234921fee5.1648214955.git.tamas.lengyel@intel.com>
 <BN9PR11MB52762BD5E8F62281A5C326F88CE99@BN9PR11MB5276.namprd11.prod.outlook.com>
In-Reply-To: <BN9PR11MB52762BD5E8F62281A5C326F88CE99@BN9PR11MB5276.namprd11.prod.outlook.com>
From: Tamas K Lengyel <tamas@tklengyel.com>
Date: Fri, 8 Apr 2022 08:40:36 -0400
X-Gmail-Original-Message-ID: <CABfawhkC_56t57fFwJXC0-kevfTyp_8UcZ+47W4QVWF64+AoDQ@mail.gmail.com>
Message-ID: <CABfawhkC_56t57fFwJXC0-kevfTyp_8UcZ+47W4QVWF64+AoDQ@mail.gmail.com>
Subject: Re: [PATCH v5] x86/vmx: add hvm functions to get/set non-register state
To: "Tian, Kevin" <kevin.tian@intel.com>
Cc: "Lengyel, Tamas" <tamas.lengyel@intel.com>, 
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Nakajima, Jun" <jun.nakajima@intel.com>, 
	"Beulich, Jan" <JBeulich@suse.com>, "Cooper, Andrew" <andrew.cooper3@citrix.com>, 
	=?UTF-8?Q?Pau_Monn=C3=A9=2C_Roger?= <roger.pau@citrix.com>, 
	Wei Liu <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>
Content-Type: text/plain; charset="UTF-8"
X-Virus-Scanned: ClamAV using ClamSMTP

On Thu, Apr 7, 2022 at 11:49 PM Tian, Kevin <kevin.tian@intel.com> wrote:
>
> > From: Lengyel, Tamas <tamas.lengyel@intel.com>
> > Sent: Friday, March 25, 2022 9:33 PM
> >
> > During VM forking and resetting a failed vmentry has been observed due
> > to the guest non-register state going out-of-sync with the guest register
> > state. For example, a VM fork reset right after a STI instruction can trigger
> > the failed entry. This is due to the guest non-register state not being saved
> > from the parent VM, thus the reset operation only copies the register state.
> >
> > Fix this by adding a new pair of hvm functions to get/set the guest
> > non-register state so that the overall vCPU state remains in sync.
> >
> > Signed-off-by: Tamas K Lengyel <tamas.lengyel@intel.com>
> > ---
> > v5: Switch to internal-only hvm funcs instead of adding to hvm_hw_cpu
> > ---
> >  xen/arch/x86/hvm/vmx/vmx.c         | 32 ++++++++++++++++++++++++
> >  xen/arch/x86/include/asm/hvm/hvm.h | 40
> > ++++++++++++++++++++++++++++++
> >  xen/arch/x86/mm/mem_sharing.c      | 11 +++++++-
> >  3 files changed, 82 insertions(+), 1 deletion(-)
> >
> > diff --git a/xen/arch/x86/hvm/vmx/vmx.c b/xen/arch/x86/hvm/vmx/vmx.c
> > index c075370f64..2685da16c8 100644
> > --- a/xen/arch/x86/hvm/vmx/vmx.c
> > +++ b/xen/arch/x86/hvm/vmx/vmx.c
> > @@ -1334,6 +1334,36 @@ static void cf_check vmx_set_interrupt_shadow(
> >      __vmwrite(GUEST_INTERRUPTIBILITY_INFO, intr_shadow);
> >  }
> >
> > +static void cf_check vmx_get_nonreg_state(struct vcpu *v,
> > +    struct hvm_vcpu_nonreg_state *nrs)
> > +{
> > +    vmx_vmcs_enter(v);
> > +
> > +    __vmread(GUEST_ACTIVITY_STATE, &nrs->vmx.activity_state);
> > +    __vmread(GUEST_INTERRUPTIBILITY_INFO, &nrs-
> > >vmx.interruptibility_info);
> > +    __vmread(GUEST_PENDING_DBG_EXCEPTIONS, &nrs->vmx.pending_dbg);
> > +
> > +    if ( cpu_has_vmx_virtual_intr_delivery )
> > +        __vmread(GUEST_INTR_STATUS, &nrs->vmx.interrupt_status);
>
> There lacks of explanation somewhere how those states are selected.
> Your discussion with Andrew leaves me the impression that Andrew sees
> more issues in general save/restore path while you only want to deal with
> the requirements for your own usage. But according to v1 your usage only
> cares about the interruptiblity info. This implies that v5 is kind of in a state
> between your original intention and what Andrew actually wants...

These fields are all guest non-register states so they are not
completely arbitrary. True that at v1 only the interruptibility info
was observed to be causing issues when it goes out-of-sync after a
reset. Since then pending_dbg was also noted to be needing a reset
under some circumstances. So at this point I see no reason to wait to
include the other values in the reset. If you have an insight into why
those fields don't need to be kept in sync with the rest of the vCPU
state, please share.

As for the save/restore path concerns I don't really have a clear
insight into what is needed to fix it. Furthermore the proposed sanity
checking on these values that would be legitimately needed for
save/restore are just pure overhead for our use-case. So the two paths
are better left separate in any case.

Tamas

