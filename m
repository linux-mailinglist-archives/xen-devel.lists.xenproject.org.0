Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 21D0FA36B63
	for <lists+xen-devel@lfdr.de>; Sat, 15 Feb 2025 03:17:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.889284.1298462 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tj7kZ-0003x7-ND; Sat, 15 Feb 2025 02:17:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 889284.1298462; Sat, 15 Feb 2025 02:17:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tj7kZ-0003u5-Kc; Sat, 15 Feb 2025 02:17:47 +0000
Received: by outflank-mailman (input) for mailman id 889284;
 Sat, 15 Feb 2025 02:17:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NTp2=VG=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1tj7kY-0003tt-NL
 for xen-devel@lists.xenproject.org; Sat, 15 Feb 2025 02:17:46 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0a27fd7a-eb43-11ef-9896-31a8f345e629;
 Sat, 15 Feb 2025 03:17:44 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id B08DD5C5ECE;
 Sat, 15 Feb 2025 02:17:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E9DBBC4CEEF;
 Sat, 15 Feb 2025 02:17:41 +0000 (UTC)
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
X-Inumbo-ID: 0a27fd7a-eb43-11ef-9896-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739585862;
	bh=16f5NDk6p22buPZZt6NNciV07oJCR4OqzwqSoR4InH4=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=NSS28Ck+N48VV+jW2TvKDHUXUW0gHi3FcM75uRz7n4WSHh+uidxonRmjBfLz6goGI
	 M5WtKl2l6TvFkc/3qDqq+oG5MI6RCAAXEnDrUL4MwTU+ZSHbcvSWxG1TzjzvmbGvuy
	 lMmLX+jBlKfNWmJyV52ziZc1H4891QOYsWHDSeAxa1gKX+q3K/62QWPV8AeMp0h5hW
	 dF8VpRsfIHJ68vrBgmTRakm31BOROgf4yHEhoisuokoFxBb90vQSEp48Kb43NRAQRe
	 7DNq7Y74WLiofoAZPzAiTjJ6lIhgk2w/4QSMgYGwgTrD6fsehNLczIBf2KsXDGy3LR
	 D8i8miSr+o5iA==
Date: Fri, 14 Feb 2025 18:17:40 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    xen-devel@lists.xenproject.org, Doug Goldstein <cardoe@cardoe.com>
Subject: Re: [PATCH v2 4/4] automation: add tools/tests jobs on the AMD Zen3+
 runner too
In-Reply-To: <Z6_lt1Kd9ELpmv5e@mail-itl>
Message-ID: <alpine.DEB.2.22.394.2502141817181.3858257@ubuntu-linux-20-04-desktop>
References: <cover.36ee649a8537af1a5fb5b3c5b7ffc0d8a1369969.1739496480.git-series.marmarek@invisiblethingslab.com> <82cb819ef4d54705b3a79ce5b77003380382ebbf.1739496480.git-series.marmarek@invisiblethingslab.com> <alpine.DEB.2.22.394.2502141629420.3858257@ubuntu-linux-20-04-desktop>
 <Z6_lt1Kd9ELpmv5e@mail-itl>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-145994227-1739585862=:3858257"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-145994227-1739585862=:3858257
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Sat, 15 Feb 2025, Marek Marczykowski-Górecki wrote:
> On Fri, Feb 14, 2025 at 04:33:07PM -0800, Stefano Stabellini wrote:
> > On Fri, 14 Feb 2025, Marek Marczykowski-Górecki wrote:
> > > Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
> > > ---
> > > new in v2
> > > If those tests are sensitive to underlying hardware, I guess it makes
> > > sense to run them on other runners too. Are they?
> > > Similarly - does it matter if dom0 is PV or PVH for those tests? If not,
> > > probably better to put just one of those jobs (PV?) to save CI
> > > time.
> > 
> > It should make a difference for the vpci test probably. I think we
> > should keep both a PV and a PVH test of it. I think it is less important
> > to run them on multiple runners, but it cannot hurt.
> > 
> > > ---
> > >  automation/gitlab-ci/test.yaml | 23 +++++++++++++++++++++++
> > >  1 file changed, 23 insertions(+)
> > > 
> > > diff --git a/automation/gitlab-ci/test.yaml b/automation/gitlab-ci/test.yaml
> > > index 93632f1f9204..fc7663e3367a 100644
> > > --- a/automation/gitlab-ci/test.yaml
> > > +++ b/automation/gitlab-ci/test.yaml
> > > @@ -162,6 +162,7 @@
> > >      PCIDEV: "01:00.0"
> > >      PCIDEV_INTR: "MSI-X"
> > >      CONSOLE_OPTS: "console=com1 com1=115200,8n1,pci,msi"
> > > +    SUT_ADDR: test-11.testnet
> > >    tags:
> > >      - qubes-hw11
> > 
> > Is this a spurious change?
> 
> No, the SUT_ADDR variable is used by the test script to extract the
> junit xml file via network.

Ah yes, I only looked at the patch without the context.

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
--8323329-145994227-1739585862=:3858257--

