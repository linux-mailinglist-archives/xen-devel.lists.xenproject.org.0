Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 524CFA9B6AE
	for <lists+xen-devel@lfdr.de>; Thu, 24 Apr 2025 20:48:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.966820.1356911 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u81by-0003CI-Bf; Thu, 24 Apr 2025 18:47:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 966820.1356911; Thu, 24 Apr 2025 18:47:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u81by-0003AF-95; Thu, 24 Apr 2025 18:47:50 +0000
Received: by outflank-mailman (input) for mailman id 966820;
 Thu, 24 Apr 2025 18:47:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=P8hq=XK=3mdeb.com=sergii.dmytruk@srs-se1.protection.inumbo.net>)
 id 1u81bw-00039l-7O
 for xen-devel@lists.xenproject.org; Thu, 24 Apr 2025 18:47:48 +0000
Received: from 14.mo550.mail-out.ovh.net (14.mo550.mail-out.ovh.net
 [178.32.97.215]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9b1d277c-213c-11f0-9ffb-bf95429c2676;
 Thu, 24 Apr 2025 20:47:43 +0200 (CEST)
Received: from director1.ghost.mail-out.ovh.net (unknown [10.109.148.164])
 by mo550.mail-out.ovh.net (Postfix) with ESMTP id 4Zk4jB6Wvfz1ZZR
 for <xen-devel@lists.xenproject.org>; Thu, 24 Apr 2025 18:47:42 +0000 (UTC)
Received: from ghost-submission-5b5ff79f4f-cbfxp (unknown [10.108.54.179])
 by director1.ghost.mail-out.ovh.net (Postfix) with ESMTPS id EE09E1FD4F;
 Thu, 24 Apr 2025 18:47:40 +0000 (UTC)
Received: from 3mdeb.com ([37.59.142.108])
 by ghost-submission-5b5ff79f4f-cbfxp with ESMTPSA
 id TQ9mJUyHCmgPqy0Aly7jbg
 (envelope-from <sergii.dmytruk@3mdeb.com>); Thu, 24 Apr 2025 18:47:40 +0000
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
X-Inumbo-ID: 9b1d277c-213c-11f0-9ffb-bf95429c2676
Authentication-Results:garm.ovh; auth=pass (GARM-108S002a734e243-f413-490a-a728-3a5017d4fd83,
                    6AF2A11B8D4EBDE9D9447A7514DB0FF9F8FB9007) smtp.auth=sergii.dmytruk@3mdeb.com
X-OVh-ClientIp:176.111.181.178
Date: Thu, 24 Apr 2025 21:47:31 +0300
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
Message-ID: <aAqHQ98cePJxuf6v@MjU3Nj>
References: <cover.1745172094.git.sergii.dmytruk@3mdeb.com>
 <744934f4-f56f-4dc7-bccb-c32f2829d1da@citrix.com>
 <010709d8-7784-41bf-bcb6-bf04803a75fc@citrix.com>
 <aAk1ZBw8GtoVYoL8@MjU3Nj>
 <6ae5f0a2-8055-45e1-933c-199d6c6d8626@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6ae5f0a2-8055-45e1-933c-199d6c6d8626@citrix.com>
X-Ovh-Tracer-Id: 9749730245553206428
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvhedtvddvucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggugfgjsehtkeertddttddunecuhfhrohhmpefuvghrghhiihcuffhmhihtrhhukhcuoehsvghrghhiihdrughmhihtrhhukhesfehmuggvsgdrtghomheqnecuggftrfgrthhtvghrnhepgfejffevudffgfejvdfhfffhueefudegteetteduueehhedugfelgfelieeihfeunecuffhomhgrihhnpehgihhtlhgrsgdrtghomhdptghirhhruhhsqdgtihdrtghomhdpkhgvrhhnvghlrdhorhhgnecukfhppeduvdejrddtrddtrddupddujeeirdduuddurddukedurddujeekpdefjedrheelrddugedvrddutdeknecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepuddvjedrtddrtddruddpmhgrihhlfhhrohhmpehsvghrghhiihdrughmhihtrhhukhesfehmuggvsgdrtghomhdpnhgspghrtghpthhtohepuddprhgtphhtthhopeigvghnqdguvghvvghlsehlihhsthhsrdigvghnphhrohhjvggtthdrohhrghdpoffvtefjohhsthepmhhoheehtdgmpdhmohguvgepshhmthhpohhuth
DKIM-Signature: a=rsa-sha256; bh=n7PnAuKdwOT+uzgZPCOTLAMaJMhasobHPaW1+Y/IEaA=;
 c=relaxed/relaxed; d=3mdeb.com; h=From; s=ovhmo3617313-selector1;
 t=1745520462; v=1;
 b=FjzG8Wv5/HsZrylExGlKjObjfQv94hkwNZZnxqBwdWm6E+ohlRaIGDJtwXCVw0JGMF+1OLWH
 mQt1NE/T2FwxNdnGSlJq1KU8MqcLJnxgxDy8P1Fu7lkBOg+4FD2jtK2xe8R1I8gEFf1xht8ip3Z
 GLnr7dLTYpU0WPpjzpz5hgKEiZdZNNRtigLaKqQogar5s9s2mQemGJ6DbOEVkKPUss+pMYl3VyW
 w8xXbPVAcwwfBVoIrXUskA+hdqxlnABXPg6D808vxuaSAuiOm0U/64mi5BvckmbTFbTLbtq8qxA
 tEsE31qkgeWL1zs/JfkUQCTm6Sk+DMyaYztDmTsqJASlA==

On Wed, Apr 23, 2025 at 11:43:15PM +0100, Andrew Cooper wrote:
> On 23/04/2025 7:45 pm, Sergii Dmytruk wrote:
> > On Wed, Apr 23, 2025 at 02:38:37PM +0100, Andrew Cooper wrote:
> >> On 22/04/2025 6:14 pm, Andrew Cooper wrote:
> >>> I've stripped out the sha2 patch and fixed up to use the existing sha2,
> >>> then kicked off some CI testing:
> >>>
> >>> https://gitlab.com/xen-project/hardware/xen-staging/-/pipelines/1780285393
> >>> https://cirrus-ci.com/build/5452335868018688
> >>>
> >>> When the dust has settled, I'll talk you through the failures.
> >> And here we go.  Interestingly, the FreeBSD testing was entirely happy,
> >> and that is the rare way around.
> >>
> >> For Gitlab, there are several areas.
> >>
> >> First, for MISRA.  In the job logs, you want the "Browse current
> >> reports:" link which will give you full details, but it's all pretty
> >> simple stuff.
> > Thanks, but that link gives me a list of 5096 failures all over the code
> > base.  Is there any way to see a diff against master?
>
> No sadly not.  What you see is a mix of the blocking issues, and the "we
> want to see these so we can work on them".

Nicola Vetrini explained how some errors can be filtered in
https://lore.kernel.org/xen-devel/c2940798-11d0-4aaa-a013-64bef9bbdb82@apertussolutions.com/T/#m153e1cf8a6ef37d3d301253624c07fa3c25814c2
At least in this case it works when done correctly.

> >> kbl-suspend-x86-64-gcc-debug is a real S3 test on KabyLake hardware,
> >> which appears to have gone to sleep and never woken up.  (More likely,
> >> crashed on wakeup before we got the console up).  The AlderLake
> >> equivalent test seems to be happy, as well as the AMD ones.
> > Hm, not sure what that could be, but will try to reproduce/guess.
>
> KBL is unreliable in one specific way, but not with these symptoms.
>
> I reran the suspend test, and it failed in the same way.  I think it's a
> deterministic bug.
>
> I can probably dig out my emergency serial debugging patches for S3 if
> you want?

Thanks, I'll try to come up with something first.  So far I thought
about a change in how stack is picked for APs, but I would expect all
hardware to have issues with S3 if that was the problem.

> >> Other common failures seem to be:
> >>
> >>     # take image offset into account
> >>     arch/x86/efi/fixmlehdr xen.efi 0x200000
> >>     Failed to find MLE header in xen.efi
> >>     arch/x86/Makefile:220: recipe for target 'xen.efi' failed
> >>     make[3]: *** [xen.efi] Error 1
> >>
> >> ~Andrew
> > That seems to be the only reason behind the rest of build failures.
> > I was able to reproduce the failure in Fedora 37 docker.  Searching for
> > the header in 8KiB instead of 4KiB fixes it.  Looks like large default
> > alignment of some toolchains pushes `head.S` to 4 KiB offset.
>
> FYI, you can access all the Xen containers with:
>
> CONTAINER=foo ./automation/scripts/containerize
>
> in the xen.git tree.

Thanks, that looks more convenient.

> Alignment that large is unexpected, and I suspect we want to fix it.  Is
> it pre-existing, or something introduced by your series?
>
> ~Andrew

Pre-existing one.  I can see `-N` is already passed to `ld`:

-N, --omagic     Do not page align data, do not make text readonly

Specifying `--section-alignment 512 --file-alignment 512 --nmagic`
didn't reduce the alignment.  Statistics so far:

  Give 0x1000 offset:
  GNU ld (GNU Binutils for Debian) 2.31.1
  GNU ld version 2.38-27.fc37

  Give 0x440 offset:
  GNU ld (GNU Binutils for Debian) 2.40
  GNU ld (GNU Binutils for Debian) 2.41

Maybe that's not something configurable and just needs a newer version.

