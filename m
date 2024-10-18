Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 04FCF9A32F9
	for <lists+xen-devel@lfdr.de>; Fri, 18 Oct 2024 04:44:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.821562.1235435 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t1cyg-0000DP-Cc; Fri, 18 Oct 2024 02:44:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 821562.1235435; Fri, 18 Oct 2024 02:44:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t1cyg-0000Bc-8y; Fri, 18 Oct 2024 02:44:34 +0000
Received: by outflank-mailman (input) for mailman id 821562;
 Fri, 18 Oct 2024 02:44:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WtqF=RO=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1t1cye-0008Sr-N1
 for xen-devel@lists.xenproject.org; Fri, 18 Oct 2024 02:44:32 +0000
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e6b7a52d-8cfa-11ef-a0be-8be0dac302b0;
 Fri, 18 Oct 2024 04:44:31 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 75BBAA434F1;
 Fri, 18 Oct 2024 02:44:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 45283C4CEC3;
 Fri, 18 Oct 2024 02:44:29 +0000 (UTC)
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
X-Inumbo-ID: e6b7a52d-8cfa-11ef-a0be-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729219470;
	bh=y4/9vUSU46QUvJ37YVwJ7PHeferKEDkYRNT77KetPXk=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=EKlLbIJUGbcxsL891caDYxri5QezBugVee+sz+jpq7g3mE0h8+H7CsIMze8RdGbBb
	 OrIcs3iNUEy1DgTIhZxec4N23dwlzZ8QORWCqoGpF7cJmJBDmcOzm0Cx3Lcd3kE8BN
	 P4L2wphXm7/4vLvM2URr7zGr/n/FoIBjgHTZEqTHsbjbujhhp6pr/mEtOW2NkBMjae
	 KpM01Khtm6jFcHj3+HijTxcrDVz0WHGYwK0XGWkBAIl5Ru+WiHI08Z/5aZVnVYaWtV
	 0dauGkgld3LvB8VAJerqQ1pt7+gqd5kimGJjwavmiSDVufLDsJGOh77k8+uAgeLCXH
	 hoZ9RXkCtwtsQ==
Date: Thu, 17 Oct 2024 19:44:28 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Andrew Cooper <andrew.cooper3@citrix.com>
cc: victorm.lira@amd.com, xen-devel@lists.xenproject.org, 
    Doug Goldstein <cardoe@cardoe.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Christopher Clark <christopher.w.clark@gmail.com>, 
    Daniel Smith <dpsmith@apertussolutions.com>
Subject: Re: [XEN PATCH v1 0/3] automation: add x86_64 test (linux argo)
In-Reply-To: <40f27418-08b3-4b74-889b-12720be8f9c7@citrix.com>
Message-ID: <alpine.DEB.2.22.394.2410171903200.2416588@ubuntu-linux-20-04-desktop>
References: <cover.1729183051.git.victorm.lira@amd.com> <40f27418-08b3-4b74-889b-12720be8f9c7@citrix.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323329-1391709021-1729217293=:2416588"
Content-ID: <alpine.DEB.2.22.394.2410171908210.2416588@ubuntu-linux-20-04-desktop>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1391709021-1729217293=:2416588
Content-Type: text/plain; CHARSET=UTF-8
Content-Transfer-Encoding: 8BIT
Content-ID: <alpine.DEB.2.22.394.2410171908211.2416588@ubuntu-linux-20-04-desktop>

On Thu, 17 Oct 2024, Andrew Cooper wrote:
> On 17/10/2024 6:18 pm, victorm.lira@amd.com wrote:
> > From: Victor Lira <victorm.lira@amd.com>
> >
> > Add x86_64 hardware test that creates a Xen Argo communication
> > connection between two PVH domains.
> >
> > To accomplish this, add new build artifacts for Linux and Argo, and
> > update the xilinx x86_64 test script.
> >
> > Victor Lira (3):
> >   automation: add linux 6.6.56 artifact
> >   automation: add linux argo test artifacts
> >   automation: add x86_64 test (linux argo)
> >
> >  automation/gitlab-ci/build.yaml               | 34 +++++++
> >  automation/gitlab-ci/test.yaml                | 10 ++
> >  .../scripts/xilinx-smoke-dom0-x86_64.sh       | 76 ++++++++++-----
> >  .../tests-artifacts/argo/6.6.56.dockerfile    | 95 +++++++++++++++++++
> >  .../tests-artifacts/kernel/6.6.56.dockerfile  | 54 +++++++++++
> >  5 files changed, 244 insertions(+), 25 deletions(-)
> >  create mode 100644 automation/tests-artifacts/argo/6.6.56.dockerfile
> >  create mode 100644 automation/tests-artifacts/kernel/6.6.56.dockerfile
> 
> I'm afraid that we need to stop doing this test-artefacts like this.
> 
> The *-export pattern is nonsense (wasting lots of runner network&disk
> and time just to copy data back into Github's artefact store), and the
> main reason why we're at ~2T of data total for Xen-project.
> 
> We need a project wide expires_in: setting, which will prune all of our
> not-most-recent content, and probably make most of that 2T disappear.

I looked at this for an hour and couldn't find a way to do it
unfortunately. expires_in can only be changed if you are an Admin of the
Gitlab instance, meaning an Admin of gitlab.com.

However, there is a setting in each repository (not one global at the
gitlab.com/xen-project level) called "Keep artifacts from most recent
successful jobs" that can be disabled. I did it manually for my repo.

The big offender is patchew. I went and disabled "Keep artifacts from
most recent successful jobs" but I didn't see any immediate changes in
storage utilization. But it is expected to take time to propagate.


> But, the test jobs stating what artefacts they want are perfectly
> capable of pulling artefacts from somewhere other than an earlier nop
> build job, meaning that we could get away with having one artefact
> shared by everything, not one artefact copied per user per pipeline into
> the artefact store.
> 
> 
> I was thinking of experimenting with a separate top-level repo that does
> nothing but has a few manual runs to populate artefacts, and having the
> Xen tests pull artefacts from here rather than from earlier build jobs.
> 
> But, I've not had a chance to play yet, so I don't know for sure if this
> is a workable direction.
>
> Alternatively, if anyone has a better idea, I'm all ears.  But, it is
> very clear that the *-export pattern is a giant bodge and there are
> better ways.
> 
> Other notes.  Your dockerfiles use syntax:1 but not heredocs, and
> they're also root containers.
> 
> Please follow the pattern in
> https://lore.kernel.org/xen-devel/178560672106e37648304f5e597cc0b16c8db6db.1729170005.git.javi.merino@cloud.com/T/#u
> or one of plenty other containers I've already converted in the past few
> months.
> 
> Please do not add a new build job just to get a new minor variation of
> Xen.  Just enable ARGO in general Xen build.

+1
--8323329-1391709021-1729217293=:2416588--

