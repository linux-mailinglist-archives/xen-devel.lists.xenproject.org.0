Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 01AE0510899
	for <lists+xen-devel@lfdr.de>; Tue, 26 Apr 2022 21:09:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.314114.532037 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1njQYS-0003lx-UY; Tue, 26 Apr 2022 19:08:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 314114.532037; Tue, 26 Apr 2022 19:08:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1njQYS-0003jK-Rb; Tue, 26 Apr 2022 19:08:56 +0000
Received: by outflank-mailman (input) for mailman id 314114;
 Tue, 26 Apr 2022 19:08:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1SWQ=VE=tklengyel.com=tamas@srs-se1.protection.inumbo.net>)
 id 1njQYR-0003jE-MY
 for xen-devel@lists.xenproject.org; Tue, 26 Apr 2022 19:08:55 +0000
Received: from MTA-08-3.privateemail.com (mta-08-3.privateemail.com
 [198.54.127.61]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4fe9a531-c594-11ec-a405-831a346695d4;
 Tue, 26 Apr 2022 21:08:54 +0200 (CEST)
Received: from mta-08.privateemail.com (localhost [127.0.0.1])
 by mta-08.privateemail.com (Postfix) with ESMTP id 824D518000A1
 for <xen-devel@lists.xenproject.org>; Tue, 26 Apr 2022 15:08:52 -0400 (EDT)
Received: from mail-oi1-f169.google.com (unknown [10.20.151.166])
 by mta-08.privateemail.com (Postfix) with ESMTPA id 5DA2618000A0
 for <xen-devel@lists.xenproject.org>; Tue, 26 Apr 2022 15:08:52 -0400 (EDT)
Received: by mail-oi1-f169.google.com with SMTP id z2so21764344oic.6
 for <xen-devel@lists.xenproject.org>; Tue, 26 Apr 2022 12:08:52 -0700 (PDT)
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
X-Inumbo-ID: 4fe9a531-c594-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=tklengyel.com;
	s=default; t=1651000132;
	bh=yPbcqqdvrqY4PHs11jvQLiX38T1X301iId1E0jTb5+M=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=qTUd6af6HB147lkpwNM+UscRiZZ12ZjKfJ8zgQ40TW8Ixdju0szKYeGLHOPP6hoyO
	 9F3A1kCPvLHUX4jfo+QbsW6ugzTsGFrBOY1Wo2HdFQuVJH3L6i6vC+nGSnRGbCFFGr
	 Qwxb6xq8IGWxzSx1n9LTXKUDJC83dLAZUlGVHPnp/bZvxeLK7llyDcJjAGwqF8qeMz
	 rrvddObCADd5waQvG/ZRNp7hLvZGcZLs2pQqSSWHQtoWIjZmYuyx4ey/HsX3N+/FRv
	 xj4leGm1xefw6MmYJiA3XOJyFZD8Nf7Zs9yPLWTDbAwGh1EbJtXe3mD6SAotF9Y+0n
	 zWAaFQCQOEKPg==
X-Gm-Message-State: AOAM530lrAr+pJsckG6OwfCcFlc9j+wTgzNCpOHgnj6g64K+oZo3meEN
	JtVGXtKwDgdDTssWBJSvPbhxhl4cTwGmdu5/rFk=
X-Google-Smtp-Source: ABdhPJz5RSTxm5VEA6NqBXvUGgr6HegqnqBrTjnsZAmoxHBeJswuBRXwUceIecdDKC8tfrrj0tWJB1SKPGtLNsv01Kk=
X-Received: by 2002:a05:6808:302b:b0:2f9:eeef:f03 with SMTP id
 ay43-20020a056808302b00b002f9eeef0f03mr16102819oib.128.1651000131698; Tue, 26
 Apr 2022 12:08:51 -0700 (PDT)
MIME-Version: 1.0
References: <e57797cbc2c0706c03363cc7fa1b3e234921fee5.1648214955.git.tamas.lengyel@intel.com>
 <CABfawhk-oCAoz-99LOaOYKD-N1FvRnFvM9_AUCgsPEF16F=VCA@mail.gmail.com>
 <BN9PR11MB527672E1BF038742F290A7798CF59@BN9PR11MB5276.namprd11.prod.outlook.com>
 <7a9e02b5-e24e-0b55-e52f-0e45e41eafc6@suse.com>
In-Reply-To: <7a9e02b5-e24e-0b55-e52f-0e45e41eafc6@suse.com>
From: Tamas K Lengyel <tamas@tklengyel.com>
Date: Tue, 26 Apr 2022 15:08:15 -0400
X-Gmail-Original-Message-ID: <CABfawhm54w_jm1-cz-e7fDNSxkFQtbw_4RJGGrpq1YsHvDAe4w@mail.gmail.com>
Message-ID: <CABfawhm54w_jm1-cz-e7fDNSxkFQtbw_4RJGGrpq1YsHvDAe4w@mail.gmail.com>
Subject: Re: [PATCH v5] x86/vmx: add hvm functions to get/set non-register state
To: Jan Beulich <jbeulich@suse.com>
Cc: "Tian, Kevin" <kevin.tian@intel.com>, 
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Nakajima, Jun" <jun.nakajima@intel.com>, 
	"Cooper, Andrew" <andrew.cooper3@citrix.com>, =?UTF-8?Q?Pau_Monn=C3=A9=2C_Roger?= <roger.pau@citrix.com>, 
	Wei Liu <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>, 
	"Lengyel, Tamas" <tamas.lengyel@intel.com>
Content-Type: text/plain; charset="UTF-8"
X-Virus-Scanned: ClamAV using ClamSMTP

On Wed, Apr 20, 2022 at 2:50 AM Jan Beulich <jbeulich@suse.com> wrote:
>
> On 20.04.2022 08:39, Tian, Kevin wrote:
> >> From: Tamas K Lengyel <tamas@tklengyel.com>
> >> Sent: Tuesday, April 19, 2022 2:43 AM
> >>
> >> On Fri, Mar 25, 2022 at 9:34 AM Tamas K Lengyel <tamas.lengyel@intel.com>
> >> wrote:
> >>>
> >>> During VM forking and resetting a failed vmentry has been observed due
> >>> to the guest non-register state going out-of-sync with the guest register
> >>> state. For example, a VM fork reset right after a STI instruction can trigger
> >>> the failed entry. This is due to the guest non-register state not being saved
> >>> from the parent VM, thus the reset operation only copies the register state.
> >>>
> >>> Fix this by adding a new pair of hvm functions to get/set the guest
> >>> non-register state so that the overall vCPU state remains in sync.
> >>>
> >>> Signed-off-by: Tamas K Lengyel <tamas.lengyel@intel.com>
> >>> ---
> >>> v5: Switch to internal-only hvm funcs instead of adding to hvm_hw_cpu
> >>
> >> Patch ping.
> >
> > I'd like to hear opinions from Andrew/Jan first. Obviously they have
> > different thoughts when reviewing the earlier versions.
>
> Well, I certainly would prefer if migration was taken care of at the same
> time, but I can understand if Tamas doesn't want to put more time into
> getting that case working. Plus, aiui, this solution to his problem won't
> prevent the eventual wider scope change to be used also for the specific
> purpose here, perhaps by simply fully replacing what is being done now.

Can we move forward with this patch then? As Jan points out, it
doesn't prevent anyone coming up with a fix to the migration case,
whatever shape that might take.

Thanks,
Tamas

