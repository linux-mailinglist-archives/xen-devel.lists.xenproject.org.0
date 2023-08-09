Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FDEA776B30
	for <lists+xen-devel@lfdr.de>; Wed,  9 Aug 2023 23:44:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.581383.910054 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTqy4-0000xx-2V; Wed, 09 Aug 2023 21:43:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 581383.910054; Wed, 09 Aug 2023 21:43:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTqy3-0000vn-VG; Wed, 09 Aug 2023 21:43:47 +0000
Received: by outflank-mailman (input) for mailman id 581383;
 Wed, 09 Aug 2023 21:43:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JRC9=D2=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qTqy2-0000vh-5a
 for xen-devel@lists.xenproject.org; Wed, 09 Aug 2023 21:43:46 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cf8d7409-36fd-11ee-b281-6b7b168915f2;
 Wed, 09 Aug 2023 23:43:44 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 8705D64A8A;
 Wed,  9 Aug 2023 21:43:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE0A2C433C8;
 Wed,  9 Aug 2023 21:43:40 +0000 (UTC)
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
X-Inumbo-ID: cf8d7409-36fd-11ee-b281-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691617422;
	bh=qy3g1xe0C13bmZblWwqNR7H1+t/fCpycJnO7iRGfc7Q=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=j8Dplpqah295g0lnfVn8vNMPOHMM9nlmMaSFkIFMaQYplD24Q3b2boruuVCXpSaUF
	 CAlyaV/hksOhNkpCXMrj+JAHRI5CBQFppS3m63lM3dYOPXhHQyFAoM0qYH2un2+7qJ
	 f4qVsK2EP1aW5gsXC3XmrGsOEz7Ku4/8sTs6SAQOvRlwJWAIK12/lEmXlphOA7XTRV
	 1OV5d21X/KCjt0g7dHLj38VLwnKUO53F2da5A1EB6OMOOF7EFZqCRt4enO+M1UIUb1
	 Dwe5aTE8zt5kEzpir1hSF73We9WR0OqA4W3MfDXYP8PTuGumAO0F4FdJuhFgdtj66b
	 eqzAuyPzVe4ag==
Date: Wed, 9 Aug 2023 14:43:39 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Andrew Cooper <andrew.cooper3@citrix.com>
cc: Henry Wang <Henry.Wang@arm.com>, 
    "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
    "community.manager@xenproject.org" <community.manager@xenproject.org>, 
    Jan Beulich <jbeulich@suse.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Julien Grall <julien@xen.org>, 
    "sstabellini@kernel.org" <sstabellini@kernel.org>, 
    Bertrand Marquis <Bertrand.Marquis@arm.com>
Subject: Re: Xen 4.18 release: Reminder about last posting date
In-Reply-To: <ec8e75da-743b-50dc-4665-854c446c974e@citrix.com>
Message-ID: <alpine.DEB.2.22.394.2308091437200.2127516@ubuntu-linux-20-04-desktop>
References: <AS8PR08MB79911746BC3D82A6341EDA6F920CA@AS8PR08MB7991.eurprd08.prod.outlook.com> <ec8e75da-743b-50dc-4665-854c446c974e@citrix.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 9 Aug 2023, Andrew Cooper wrote:
> On 07/08/2023 2:24 am, Henry Wang wrote:
> > Hi everyone,
> >
> > Following the release schedule discussion in in April, I am sending this email
> > to remind that according to the release schedule [1], August 11 (this Friday)
> > will be the last posting date, when patches adding new features are expected
> > to be posted to the mailing list by this date.
> >
> > Also, note that we currently have 1 release blocker [2] which might need
> > some attention.
> >
> > [1] https://lore.kernel.org/xen-devel/AS8PR08MB79919F9CE0B2BF80E7103FB592609@AS8PR08MB7991.eurprd08.prod.outlook.com/
> > [2] https://gitlab.com/xen-project/xen/-/issues/114
> 
> Off the top of my head.
> 
> There are still unaddressed Gitlab bugs from the Eclair integration

The bug you managed to find it is now fixed (commit e55146071de9). I am
all for fixing Gitlab bugs so let me know if you find anything else! I
am not aware of any other issue with Eclair at the moment.


> and other Gitlab bugs (use of unstable containers) which I'd unwilling
> to let 4.18 be released with, given the pain we've had on the stable
> trees trying to keep CI working.

That is fair enough. To make this more concrete and easier to track, the
following would need to be changed to using stable containers:

- .qemu-arm64
- .qemu-arm32
(I am not counting .qemu-riscv64)

Andrew, is that what you meant? Am I missing anything?

