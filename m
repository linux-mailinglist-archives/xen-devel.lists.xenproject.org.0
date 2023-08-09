Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DFB7776C37
	for <lists+xen-devel@lfdr.de>; Thu, 10 Aug 2023 00:35:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.581434.910134 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTrlG-00027Q-Uu; Wed, 09 Aug 2023 22:34:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 581434.910134; Wed, 09 Aug 2023 22:34:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTrlG-000256-RR; Wed, 09 Aug 2023 22:34:38 +0000
Received: by outflank-mailman (input) for mailman id 581434;
 Wed, 09 Aug 2023 22:34:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JRC9=D2=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qTrlF-000250-9y
 for xen-devel@lists.xenproject.org; Wed, 09 Aug 2023 22:34:37 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id eaa9193d-3704-11ee-b282-6b7b168915f2;
 Thu, 10 Aug 2023 00:34:36 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 67DF664B82;
 Wed,  9 Aug 2023 22:34:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 983DBC433C8;
 Wed,  9 Aug 2023 22:34:32 +0000 (UTC)
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
X-Inumbo-ID: eaa9193d-3704-11ee-b282-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691620473;
	bh=ASLkJYW+aNebiQ/C5hjTpetqtLfQ6TDZsa31UZXTnYw=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=uttJxl7Dzd4QlTqHKvkYrJNbxYauBeEr0ODInCEMsCSIphBCSHnRlui6cVJxYjKKz
	 d2yEdY4ftkS7UaBZYxUleb2/Mqzn3nte2SsWIfR2QehbdmW8DMnkv4SfaF1j8fvE5a
	 xL1E6AQj/0FVLLCtTpboU9UV6nb+VtjKvQDGePNVi6Hwk2IExXPOpybxsaQeaKCCYg
	 ISYakji6ON1KMhpubi7gICf3P1BomBR5qUPOeUbAQRsmoobJu1Kff+xUamwgSf53Ju
	 fsrWvr/Xak2oHKPTP4rvU7sUFhAW6WjK8mxyH2fY2Fnh9hT0lJ+699evHleEo6zZ+Q
	 rXKsfUQsMD6uw==
Date: Wed, 9 Aug 2023 15:34:31 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Andrew Cooper <andrew.cooper3@citrix.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    Henry Wang <Henry.Wang@arm.com>, 
    "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
    "community.manager@xenproject.org" <community.manager@xenproject.org>, 
    Jan Beulich <jbeulich@suse.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Julien Grall <julien@xen.org>, Bertrand Marquis <Bertrand.Marquis@arm.com>
Subject: Re: Xen 4.18 release: Reminder about last posting date
In-Reply-To: <1ac14ed0-d489-0efe-0b0c-200792a50fde@citrix.com>
Message-ID: <alpine.DEB.2.22.394.2308091526060.2127516@ubuntu-linux-20-04-desktop>
References: <AS8PR08MB79911746BC3D82A6341EDA6F920CA@AS8PR08MB7991.eurprd08.prod.outlook.com> <ec8e75da-743b-50dc-4665-854c446c974e@citrix.com> <alpine.DEB.2.22.394.2308091437200.2127516@ubuntu-linux-20-04-desktop>
 <1ac14ed0-d489-0efe-0b0c-200792a50fde@citrix.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323329-2084107488-1691620297=:2127516"
Content-ID: <alpine.DEB.2.22.394.2308091531390.2127516@ubuntu-linux-20-04-desktop>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-2084107488-1691620297=:2127516
Content-Type: text/plain; CHARSET=UTF-8
Content-Transfer-Encoding: 8BIT
Content-ID: <alpine.DEB.2.22.394.2308091531391.2127516@ubuntu-linux-20-04-desktop>

On Wed, 9 Aug 2023, Andrew Cooper wrote:
> On 09/08/2023 10:43 pm, Stefano Stabellini wrote:
> > On Wed, 9 Aug 2023, Andrew Cooper wrote:
> >> On 07/08/2023 2:24 am, Henry Wang wrote:
> >>> Hi everyone,
> >>>
> >>> Following the release schedule discussion in in April, I am sending this email
> >>> to remind that according to the release schedule [1], August 11 (this Friday)
> >>> will be the last posting date, when patches adding new features are expected
> >>> to be posted to the mailing list by this date.
> >>>
> >>> Also, note that we currently have 1 release blocker [2] which might need
> >>> some attention.
> >>>
> >>> [1] https://lore.kernel.org/xen-devel/AS8PR08MB79919F9CE0B2BF80E7103FB592609@AS8PR08MB7991.eurprd08.prod.outlook.com/
> >>> [2] https://gitlab.com/xen-project/xen/-/issues/114
> >> Off the top of my head.
> >>
> >> There are still unaddressed Gitlab bugs from the Eclair integration
> > The bug you managed to find it is now fixed (commit e55146071de9). I am
> > all for fixing Gitlab bugs so let me know if you find anything else! I
> > am not aware of any other issue with Eclair at the moment.
> 
> I meant the one where Eclair is still running on `smoke` and twiddling
> its thumbs for 1h doing so each time OSSTest says yes to a push.  It
> will be a missing 'exclude' somewhere, but I haven't hand enough time to
> look.

Ah, yes, got it. I would call it "Eclair lagging behind". I am happy for
this to be a blocker.


> >> and other Gitlab bugs (use of unstable containers) which I'd unwilling
> >> to let 4.18 be released with, given the pain we've had on the stable
> >> trees trying to keep CI working.
> > That is fair enough. To make this more concrete and easier to track, the
> > following would need to be changed to using stable containers:
> >
> > - .qemu-arm64
> > - .qemu-arm32
> > (I am not counting .qemu-riscv64)
> >
> > Andrew, is that what you meant? Am I missing anything?
> 
> Every debian unstable container, and the other containers (OpenSUSE)
> which are using an non-specific upstream version.  Upstreams which
> really are rolling distros (Arch, Tumbleweed) need to be made non-fatal.

I was more asking whether for 4.18 you want to fix only test.yaml or
also build.yaml. (Typically it is test.yaml that causes most issues
with rolling containers.)

.qemu-arm64 and .qemu-arm32 are the only ones using unstable/rolling
containers in automation/gitlab-ci/test.yaml (excluding .qemu-riscv64),
that's why I was asking about those two specifically.


> Then the second part which is also a blocker.  Update the distros we
> test with to be less obsolete.  e.g. the majority of our CI testing runs
> with Alpine-3.12 when EOL more than a year ago. (2022-05-01)

OK. Hopefully it will be trivial.
--8323329-2084107488-1691620297=:2127516--

