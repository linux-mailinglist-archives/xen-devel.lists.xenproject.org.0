Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 47BCDA9CA72
	for <lists+xen-devel@lfdr.de>; Fri, 25 Apr 2025 15:33:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.968106.1357809 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u8JBX-00085k-GV; Fri, 25 Apr 2025 13:33:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 968106.1357809; Fri, 25 Apr 2025 13:33:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u8JBX-00083G-DL; Fri, 25 Apr 2025 13:33:43 +0000
Received: by outflank-mailman (input) for mailman id 968106;
 Fri, 25 Apr 2025 13:33:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=iaDa=XL=3mdeb.com=sergii.dmytruk@srs-se1.protection.inumbo.net>)
 id 1u8JBU-000834-Pk
 for xen-devel@lists.xenproject.org; Fri, 25 Apr 2025 13:33:41 +0000
Received: from 6.mo583.mail-out.ovh.net (6.mo583.mail-out.ovh.net
 [178.32.119.138]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e5878700-21d9-11f0-9eb3-5ba50f476ded;
 Fri, 25 Apr 2025 15:33:39 +0200 (CEST)
Received: from director6.ghost.mail-out.ovh.net (unknown [10.108.25.63])
 by mo583.mail-out.ovh.net (Postfix) with ESMTP id 4ZkYhL5GHNz1Pwj
 for <xen-devel@lists.xenproject.org>; Fri, 25 Apr 2025 13:33:38 +0000 (UTC)
Received: from ghost-submission-5b5ff79f4f-dpp2z (unknown [10.108.54.28])
 by director6.ghost.mail-out.ovh.net (Postfix) with ESMTPS id A45981FEC5;
 Fri, 25 Apr 2025 13:33:36 +0000 (UTC)
Received: from 3mdeb.com ([37.59.142.109])
 by ghost-submission-5b5ff79f4f-dpp2z with ESMTPSA
 id LM+WBjCPC2i19AEA//PyqQ
 (envelope-from <sergii.dmytruk@3mdeb.com>); Fri, 25 Apr 2025 13:33:36 +0000
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
X-Inumbo-ID: e5878700-21d9-11f0-9eb3-5ba50f476ded
Authentication-Results:garm.ovh; auth=pass (GARM-109S0033e4aaf71-8ec0-4c80-81a5-8d7daa0cd4df,
                    CE3358D68E528721033CA0B73B1255FA651B03CF) smtp.auth=sergii.dmytruk@3mdeb.com
X-OVh-ClientIp:176.111.181.178
Date: Fri, 25 Apr 2025 16:33:25 +0300
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
Message-ID: <aAuPJRy64Fez_HCT@MjU3Nj>
References: <cover.1745172094.git.sergii.dmytruk@3mdeb.com>
 <744934f4-f56f-4dc7-bccb-c32f2829d1da@citrix.com>
 <010709d8-7784-41bf-bcb6-bf04803a75fc@citrix.com>
 <aAk1ZBw8GtoVYoL8@MjU3Nj>
 <6ae5f0a2-8055-45e1-933c-199d6c6d8626@citrix.com>
 <aAqHQ98cePJxuf6v@MjU3Nj>
 <99e2fd35-4241-4be5-a81b-c7ea6cd54597@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <99e2fd35-4241-4be5-a81b-c7ea6cd54597@citrix.com>
X-Ovh-Tracer-Id: 10318309698760062108
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvhedvgeejucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggugfgjsehtkeertddttddunecuhfhrohhmpefuvghrghhiihcuffhmhihtrhhukhcuoehsvghrghhiihdrughmhihtrhhukhesfehmuggvsgdrtghomheqnecuggftrfgrthhtvghrnhepjeeijeffvddvvdettdeuuedtkeehgfduleevfffghfeuudeuleejleeutefggedvnecuffhomhgrihhnpeigvghnrdhorhhgpdhsohhurhgtvgifrghrvgdrohhrghenucfkphepuddvjedrtddrtddruddpudejiedrudduuddrudekuddrudejkedpfeejrdehledrudegvddruddtleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeduvdejrddtrddtrddupdhmrghilhhfrhhomhepshgvrhhgihhirdgumhihthhruhhkseefmhguvggsrdgtohhmpdhnsggprhgtphhtthhopedupdhrtghpthhtohepgigvnhdquggvvhgvlheslhhishhtshdrgigvnhhprhhojhgvtghtrdhorhhgpdfovfetjfhoshhtpehmohehkeefmgdpmhhouggvpehsmhhtphhouhht
DKIM-Signature: a=rsa-sha256; bh=/qxLl0+iTx+0MH5tonACziZgyUg7DNuTOrbjMVEjjsU=;
 c=relaxed/relaxed; d=3mdeb.com; h=From; s=ovhmo3617313-selector1;
 t=1745588018; v=1;
 b=W50U/ATqVGSQvBfh+GcNs8F0p2FuH09Jk68OidMRoFMby/X85zP3PRjjMsy078+P2oFdR4JT
 YHLX3AC4SIo9EyYbCUVab4p6jDr/XyMcNSHvjzjtNbKA5ttJ3A8QhQGjmoZZvVqiDDOnNP0VbFA
 Gtsh7G80IvKFj+b0/IQQ0WjjF2Hv9QOzQhAJ9UY8ecLGOT8Nmucy9cDu0O2FXDHgzBFaWHNq6QH
 uu2Nsls9UEF+KhMeL5cdq5W4tfrroTakAjh5+LIzj4NbJvihoPNvHcY3wu8g34vChY/WfckIxlm
 cESxTU7mmYrRV1zFcVgDgzIJKJXNBe2hOWBOXJWatUcwg==

On Thu, Apr 24, 2025 at 07:51:21PM +0100, Andrew Cooper wrote:
> On 24/04/2025 7:47 pm, Sergii Dmytruk wrote:
> >> Alignment that large is unexpected, and I suspect we want to fix it.  Is
> >> it pre-existing, or something introduced by your series?
> >>
> >> ~Andrew
> > Pre-existing one.  I can see `-N` is already passed to `ld`:
> >
> > -N, --omagic     Do not page align data, do not make text readonly
> >
> > Specifying `--section-alignment 512 --file-alignment 512 --nmagic`
> > didn't reduce the alignment.  Statistics so far:
> >
> >   Give 0x1000 offset:
> >   GNU ld (GNU Binutils for Debian) 2.31.1
> >   GNU ld version 2.38-27.fc37
> >
> >   Give 0x440 offset:
> >   GNU ld (GNU Binutils for Debian) 2.40
> >   GNU ld (GNU Binutils for Debian) 2.41
> >
> > Maybe that's not something configurable and just needs a newer version.
>
> Ah - that's something that was changed literally yesterday:
>
> https://xenbits.xen.org/gitweb/?p=xen.git;a=commitdiff;h=d444763f8ca556d0a67a4b933be303d346baef02
>
> in order to fix some problems we've had trying to get xen.efi happy to
> be NX_COMPAT.
>
> We couldn't identify any good reason why -N was in use.
>
> ~Andrew

The fewer cryptic flags the better, but adding either of those flags or
removing -N doesn't affect the file offset.  EFI_LDFLAGS even includes
--file-alignment=0x20, it just gets ignored and that could be
target-specific behaviour in older versions of ld.  This commit by Jan
Beulich might be the one fixing it:

https://sourceware.org/git/?p=binutils-gdb.git;a=commit;h=bc5baa9f13ffb3fd4c39f1a779062bfb3a980cea

