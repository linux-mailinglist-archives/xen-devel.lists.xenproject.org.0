Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 01E7F511BF2
	for <lists+xen-devel@lfdr.de>; Wed, 27 Apr 2022 17:38:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.315178.533598 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1njjjo-0003nZ-Kk; Wed, 27 Apr 2022 15:37:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 315178.533598; Wed, 27 Apr 2022 15:37:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1njjjo-0003kS-Hj; Wed, 27 Apr 2022 15:37:56 +0000
Received: by outflank-mailman (input) for mailman id 315178;
 Wed, 27 Apr 2022 15:37:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uVAb=VF=tklengyel.com=tamas@srs-se1.protection.inumbo.net>)
 id 1njjjm-0003kM-Kw
 for xen-devel@lists.xenproject.org; Wed, 27 Apr 2022 15:37:54 +0000
Received: from MTA-07-4.privateemail.com (mta-07-4.privateemail.com
 [68.65.122.27]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ff5796f8-c63f-11ec-8fc2-03012f2f19d4;
 Wed, 27 Apr 2022 17:37:52 +0200 (CEST)
Received: from mta-07.privateemail.com (localhost [127.0.0.1])
 by mta-07.privateemail.com (Postfix) with ESMTP id D572B18000AF
 for <xen-devel@lists.xenproject.org>; Wed, 27 Apr 2022 11:37:50 -0400 (EDT)
Received: from mail-oi1-f180.google.com (unknown [10.20.151.189])
 by mta-07.privateemail.com (Postfix) with ESMTPA id B07D218000A3
 for <xen-devel@lists.xenproject.org>; Wed, 27 Apr 2022 11:37:50 -0400 (EDT)
Received: by mail-oi1-f180.google.com with SMTP id 12so2330852oix.12
 for <xen-devel@lists.xenproject.org>; Wed, 27 Apr 2022 08:37:50 -0700 (PDT)
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
X-Inumbo-ID: ff5796f8-c63f-11ec-8fc2-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=tklengyel.com;
	s=default; t=1651073870;
	bh=nFw4jYsyAisqJLzlqA1IidWP4jHuOs/pyKgg5MZ7yhs=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=JnHv/C/f/4koIQPLZ5uItrE1bg69zGg+9Nn89sB+LAL5056Wr07JcbV0Ao2eMMx9n
	 jueqlS2XA6MWZ7wqMIkdHjWMWIVRm4dIKm5bstbnmAm/HHGJmurOzJ5ofJaGjitiw9
	 MP4bTpRkJrsifgPtU6ToEzQucaEVsYWH/5niQDC5lXyCVKo0uqh6DMOm4IU20dsrVw
	 vlrp5QaxBl10TKW2Wzo3/q4SN7nL4snKOW2H4qzbIOxs61J+qV42SYl37vjC8iqEow
	 NUh5AnYfPtkbDv1aAQoyRIIAbzKQpIQv4XCMaXFEMP3a18OfSfCUVs5HoNbBYEqJut
	 rjxxXeaNY+bTA==
X-Gm-Message-State: AOAM530WA5cXSgq4U885yOf+X4OK6AA9M04/bQdJjRWeAI1B/pAWl/FY
	HmwaEOIEkwmluaGkSLmv5lB9yYDiTvjPOZgjdzI=
X-Google-Smtp-Source: ABdhPJxUHao9BLknQexAiIWtBtQzBWGn6svvl2JdDCVCUzT5qup2yemsRDiE83WQAC2Um00KBi7ZNf2vzygQvNkethw=
X-Received: by 2002:a05:6808:130e:b0:325:813d:a3f4 with SMTP id
 y14-20020a056808130e00b00325813da3f4mr1349743oiv.9.1651073870123; Wed, 27 Apr
 2022 08:37:50 -0700 (PDT)
MIME-Version: 1.0
References: <e57797cbc2c0706c03363cc7fa1b3e234921fee5.1648214955.git.tamas.lengyel@intel.com>
 <BN9PR11MB527638D2BE6087C1A4D796D48CFA9@BN9PR11MB5276.namprd11.prod.outlook.com>
 <d6c2b3b5-6eb4-e094-fc9f-5214f8c12df0@suse.com>
In-Reply-To: <d6c2b3b5-6eb4-e094-fc9f-5214f8c12df0@suse.com>
From: Tamas K Lengyel <tamas@tklengyel.com>
Date: Wed, 27 Apr 2022 11:37:14 -0400
X-Gmail-Original-Message-ID: <CABfawhnkf8_yFak9SdQJsLT6aXT64oS_yFkF9pAkbiU7TsQ5zQ@mail.gmail.com>
Message-ID: <CABfawhnkf8_yFak9SdQJsLT6aXT64oS_yFkF9pAkbiU7TsQ5zQ@mail.gmail.com>
Subject: Re: [PATCH v5] x86/vmx: add hvm functions to get/set non-register state
To: Jan Beulich <jbeulich@suse.com>
Cc: "Lengyel, Tamas" <tamas.lengyel@intel.com>, "Nakajima, Jun" <jun.nakajima@intel.com>, 
	"Cooper, Andrew" <andrew.cooper3@citrix.com>, =?UTF-8?Q?Pau_Monn=C3=A9=2C_Roger?= <roger.pau@citrix.com>, 
	Wei Liu <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>, 
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Tian, Kevin" <kevin.tian@intel.com>
Content-Type: text/plain; charset="UTF-8"
X-Virus-Scanned: ClamAV using ClamSMTP

On Wed, Apr 27, 2022 at 3:07 AM Jan Beulich <jbeulich@suse.com> wrote:
>
> On 27.04.2022 05:46, Tian, Kevin wrote:
> >> From: Lengyel, Tamas <tamas.lengyel@intel.com>
> >> Sent: Friday, March 25, 2022 9:33 PM
> >>
> >> During VM forking and resetting a failed vmentry has been observed due
> >> to the guest non-register state going out-of-sync with the guest register
> >> state. For example, a VM fork reset right after a STI instruction can trigger
> >> the failed entry. This is due to the guest non-register state not being saved
> >> from the parent VM, thus the reset operation only copies the register state.
> >>
> >> Fix this by adding a new pair of hvm functions to get/set the guest
> >> non-register state so that the overall vCPU state remains in sync.
> >>
> >> Signed-off-by: Tamas K Lengyel <tamas.lengyel@intel.com>
> >
> > Reviewed-by: Kevin Tian <kevin.tian@intel.com>
>
> Acked-by: Jan Beulich <jbeulich@suse.com>
> with ...
>
> >> @@ -863,6 +892,17 @@ static inline void hvm_set_reg(struct vcpu *v,
> >> unsigned int reg, uint64_t val)
> >>      ASSERT_UNREACHABLE();
> >>  }
> >>
> >> +static inline void hvm_get_nonreg_state(struct vcpu *v,
> >> +                                        struct hvm_vcpu_nonreg_state *nrs)
> >> +{
> >> +    ASSERT_UNREACHABLE();
> >> +}
> >> +static inline void hvm_set_nonreg_state(struct vcpu *v,
> >> +                                        struct hvm_vcpu_nonreg_state *nrs)
> >> +{
> >> +    ASSERT_UNREACHABLE();
> >> +}
>
> ... these unnecessary stubs dropped (they should be introduced only
> once actually needed, i.e. when a caller appears in a file which is
> also built when !CONFIG_HVM), and ...
>
> >> --- a/xen/arch/x86/mm/mem_sharing.c
> >> +++ b/xen/arch/x86/mm/mem_sharing.c
> >> @@ -1643,6 +1643,13 @@ static int bring_up_vcpus(struct domain *cd,
> >> struct domain *d)
> >>      return 0;
> >>  }
> >>
> >> +static void copy_vcpu_nonreg_state(struct vcpu *d_vcpu, struct vcpu
> >> *cd_vcpu)
> >> +{
> >> +    struct hvm_vcpu_nonreg_state nrs = {};
> >> +    hvm_get_nonreg_state(d_vcpu, &nrs);
>
> ... this missing blank line inserted between these two lines. I'll
> make both adjustments while committing.

Thanks, both changes are fine from my side.

Tamas

