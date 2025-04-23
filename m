Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 83A25A9981D
	for <lists+xen-devel@lfdr.de>; Wed, 23 Apr 2025 20:46:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.965170.1355813 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u7f6s-0004cv-6U; Wed, 23 Apr 2025 18:46:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 965170.1355813; Wed, 23 Apr 2025 18:46:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u7f6s-0004bH-2o; Wed, 23 Apr 2025 18:46:14 +0000
Received: by outflank-mailman (input) for mailman id 965170;
 Wed, 23 Apr 2025 18:46:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Oonq=XJ=3mdeb.com=sergii.dmytruk@srs-se1.protection.inumbo.net>)
 id 1u7f6p-0004b7-Gp
 for xen-devel@lists.xenproject.org; Wed, 23 Apr 2025 18:46:12 +0000
Received: from 5.mo581.mail-out.ovh.net (5.mo581.mail-out.ovh.net
 [178.32.120.239]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 38b07fc8-2073-11f0-9eb0-5ba50f476ded;
 Wed, 23 Apr 2025 20:46:09 +0200 (CEST)
Received: from director2.ghost.mail-out.ovh.net (unknown [10.109.176.211])
 by mo581.mail-out.ovh.net (Postfix) with ESMTP id 4ZjSjr6FLJz1PNv
 for <xen-devel@lists.xenproject.org>; Wed, 23 Apr 2025 18:46:08 +0000 (UTC)
Received: from ghost-submission-5b5ff79f4f-c2b8g (unknown [10.108.42.33])
 by director2.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 16BDE1FE6A;
 Wed, 23 Apr 2025 18:46:06 +0000 (UTC)
Received: from 3mdeb.com ([37.59.142.97])
 by ghost-submission-5b5ff79f4f-c2b8g with ESMTPSA
 id kSZOKG41CWhTAAcAOFddZg
 (envelope-from <sergii.dmytruk@3mdeb.com>); Wed, 23 Apr 2025 18:46:06 +0000
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
X-Inumbo-ID: 38b07fc8-2073-11f0-9eb0-5ba50f476ded
Authentication-Results:garm.ovh; auth=pass (GARM-97G0022e222acc-bbea-4818-9708-2e6ab9eff40e,
                    E44920665798B4DCDE3BF656E3E0060933CCD35A) smtp.auth=sergii.dmytruk@3mdeb.com
X-OVh-ClientIp:176.111.181.178
Date: Wed, 23 Apr 2025 21:45:56 +0300
From: Sergii Dmytruk <sergii.dmytruk@3mdeb.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>,
	Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
	Lukasz Hawrylko <lukasz@hawrylko.pl>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>,
	Mateusz =?iso-8859-1?Q?M=F3wka?= <mateusz.mowka@intel.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Marek =?iso-8859-1?Q?Marczykowski-G=F3recki?= <marmarek@invisiblethingslab.com>,
	trenchboot-devel@googlegroups.com
Subject: Re: [PATCH 00/21] x86: Trenchboot Secure Launch DRTM (Xen)
Message-ID: <aAk1ZBw8GtoVYoL8@MjU3Nj>
References: <cover.1745172094.git.sergii.dmytruk@3mdeb.com>
 <744934f4-f56f-4dc7-bccb-c32f2829d1da@citrix.com>
 <010709d8-7784-41bf-bcb6-bf04803a75fc@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <010709d8-7784-41bf-bcb6-bf04803a75fc@citrix.com>
X-Ovh-Tracer-Id: 3850577682115441820
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvgeejfeehucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggugfgjsehtkeertddttddunecuhfhrohhmpefuvghrghhiihcuffhmhihtrhhukhcuoehsvghrghhiihdrughmhihtrhhukhesfehmuggvsgdrtghomheqnecuggftrfgrthhtvghrnhephfffleeiffduleegveelfeelgefhledvudefiedvkeekjedvffffgfethefggfffnecuffhomhgrihhnpehgihhtlhgrsgdrtghomhdptghirhhruhhsqdgtihdrtghomhenucfkphepuddvjedrtddrtddruddpudejiedrudduuddrudekuddrudejkedpfeejrdehledrudegvddrleejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepuddvjedrtddrtddruddpmhgrihhlfhhrohhmpehsvghrghhiihdrughmhihtrhhukhesfehmuggvsgdrtghomhdpnhgspghrtghpthhtohepuddprhgtphhtthhopeigvghnqdguvghvvghlsehlihhsthhsrdigvghnphhrohhjvggtthdrohhrghdpoffvtefjohhsthepmhhoheekudgmpdhmohguvgepshhmthhpohhuth
DKIM-Signature: a=rsa-sha256; bh=XceR2Mnj5MK8YqxyDM3IyCB+Vlq1dvrrcFTKNgwhCSk=;
 c=relaxed/relaxed; d=3mdeb.com; h=From; s=ovhmo3617313-selector1;
 t=1745433969; v=1;
 b=DHX8zaj1f5RdEzJR8no7LSWafO4HrujNn527sqmT89dnCaRJXQvcmJuZwpP9gLMF+6Ery7X0
 D3XeSIWlRgNBqof4Qeh5TwnnvFgYsfj660HBbvHwe1iQ1LDEmv5+X3+OiIUWRVyjBV+7O5nO/C2
 U039hge7cEFN+vghue29X8o75tZDWqSn9akDt9bI4TmdsmcPEE3FJoYB36HGTq2l3eZHYo/WZBN
 4fV27o57r77DCl+QtfLTxlcCfyttj3kRycEWWePm6w+Cmm90qc5CGWdy7m0+e5U4L0N1n6sN1sO
 Fjw8m87tZBGxPamA5nh56dVqRZUeeFeD00irxZNDeqE0w==

On Wed, Apr 23, 2025 at 02:38:37PM +0100, Andrew Cooper wrote:
> On 22/04/2025 6:14 pm, Andrew Cooper wrote:
> > I've stripped out the sha2 patch and fixed up to use the existing sha2,
> > then kicked off some CI testing:
> >
> > https://gitlab.com/xen-project/hardware/xen-staging/-/pipelines/1780285393
> > https://cirrus-ci.com/build/5452335868018688
> >
> > When the dust has settled, I'll talk you through the failures.
>
> And here we go.  Interestingly, the FreeBSD testing was entirely happy,
> and that is the rare way around.
>
> For Gitlab, there are several areas.
>
> First, for MISRA.  In the job logs, you want the "Browse current
> reports:" link which will give you full details, but it's all pretty
> simple stuff.

Thanks, but that link gives me a list of 5096 failures all over the code
base.  Is there any way to see a diff against master?

> kbl-suspend-x86-64-gcc-debug is a real S3 test on KabyLake hardware,
> which appears to have gone to sleep and never woken up.  (More likely,
> crashed on wakeup before we got the console up).  The AlderLake
> equivalent test seems to be happy, as well as the AMD ones.

Hm, not sure what that could be, but will try to reproduce/guess.

> For the build issues, there are quite a few.
>
> debian-12-x86_64-gcc-ibt is special, using an out-of-tree patch for
> CET-IBT safety.  tl;dr function pointer callees need a cf_check
> annotation.  But, all the failures here are from sha1, and from bits
> which I don't think want to survive into the final form.

That stuff is gone and the build should succeed the next time.

> Other common failures seem to be:
>
>     # take image offset into account
>     arch/x86/efi/fixmlehdr xen.efi 0x200000
>     Failed to find MLE header in xen.efi
>     arch/x86/Makefile:220: recipe for target 'xen.efi' failed
>     make[3]: *** [xen.efi] Error 1
>
> ~Andrew

That seems to be the only reason behind the rest of build failures.
I was able to reproduce the failure in Fedora 37 docker.  Searching for
the header in 8KiB instead of 4KiB fixes it.  Looks like large default
alignment of some toolchains pushes `head.S` to 4 KiB offset.

