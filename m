Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AE89A12D82
	for <lists+xen-devel@lfdr.de>; Wed, 15 Jan 2025 22:16:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.873110.1284090 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tYAkf-0007BU-JK; Wed, 15 Jan 2025 21:16:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 873110.1284090; Wed, 15 Jan 2025 21:16:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tYAkf-000798-Gb; Wed, 15 Jan 2025 21:16:37 +0000
Received: by outflank-mailman (input) for mailman id 873110;
 Wed, 15 Jan 2025 21:16:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9vXr=UH=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1tYAke-000791-3P
 for xen-devel@lists.xenproject.org; Wed, 15 Jan 2025 21:16:36 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ff4cbffe-d385-11ef-a0e2-8be0dac302b0;
 Wed, 15 Jan 2025 22:16:34 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 81EA15C5EBC;
 Wed, 15 Jan 2025 21:15:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ABDFBC4CED1;
 Wed, 15 Jan 2025 21:16:31 +0000 (UTC)
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
X-Inumbo-ID: ff4cbffe-d385-11ef-a0e2-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736975793;
	bh=Z1FkJy2ZJlX5J2H6d8Cx6I2J1RaILxhF7JAP7P6Pmi0=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=g95udV+RaCe8TPuhEW6NvdUba+PsCldWRK7BonznA7pa3OHxkKC6Sc0sdjMBI/kIU
	 uMw/XZB1V25bE3AzUivUnrer3DGhFNTE0hHLxhD1QdFPv4JdQ1WLPX3km/1pmEcNfj
	 2LiRd0ZI+2WA6z3rALP1AS5cRVfur8uDOhm/zk/VXFnbvLwgttgD25m0kaQtoAx6d2
	 73UxNCYGgzBSQc3mmIpmwty/i0I6r2NWcYrsUNrMsvNyhHaXJ1bGde1RK90v5OMhwF
	 ZtOAKSS3QzMeKi2iZtd9y78cLD8QP7AmbYQmlF/HP0f4BBpHP41B0FGFu2xD+bJPzU
	 xE4JOrWngauQw==
Date: Wed, 15 Jan 2025 13:16:30 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Frediano Ziglio <frediano.ziglio@cloud.com>
cc: Bernhard Kaindl <bernhard.kaindl@cloud.com>, 
    xen-devel@lists.xenproject.org, Andrew Cooper <andrew.cooper3@citrix.com>, 
    Anthony PERARD <anthony.perard@vates.tech>, 
    Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, 
    Julien Grall <julien@xen.org>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH] Design docs: Fix some typos in the design docs
In-Reply-To: <CACHz=ZjgkDUsxSL1vS09A6E3QmPXQTYO3aaoijNUTdoyBK7abg@mail.gmail.com>
Message-ID: <alpine.DEB.2.22.394.2501151316230.2684657@ubuntu-linux-20-04-desktop>
References: <692dabc63953fb0d33536f87e4c5c147ba6ce11c.1736948633.git.bernhard.kaindl@cloud.com> <CACHz=ZjgkDUsxSL1vS09A6E3QmPXQTYO3aaoijNUTdoyBK7abg@mail.gmail.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-699952963-1736975793=:2684657"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-699952963-1736975793=:2684657
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Wed, 15 Jan 2025, Frediano Ziglio wrote:
> On Wed, Jan 15, 2025 at 1:45 PM Bernhard Kaindl
> <bernhard.kaindl@cloud.com> wrote:
> >
> > Skimming through the design docs, I saw some typos that needed fixing.
> >
> > ---
> > Comments for reviewers (not for the commit message itself):
> >
> > Sample typos (some are not easy to spot):
> > - heirarchical: (ei->ie)
> > - implementaiton: (it->ti)
> > - comprimised: (i->o)
> > - contol->control (r)
> >
> > PS: I did the fixes using LTeX in an IDE and re-checked the mail too.
> >
> > Signed-off-by: Bernhard Kaindl <bernhard.kaindl@cloud.com>
> > ---
> >  docs/designs/argo.pandoc                |  4 ++--
> >  docs/designs/nested-svm-cpu-features.md | 12 ++++++------
> >  docs/designs/qemu-deprivilege.md        |  8 ++++----
> >  docs/designs/xenstore-migration.md      |  2 +-
> >  docs/features/qemu-deprivilege.pandoc   |  2 +-
> >  5 files changed, 14 insertions(+), 14 deletions(-)
> >
> > diff --git a/docs/designs/argo.pandoc b/docs/designs/argo.pandoc
> > index e18aacea7c..cd854d2a7a 100644
> > --- a/docs/designs/argo.pandoc
> > +++ b/docs/designs/argo.pandoc
> > @@ -58,7 +58,7 @@ concurrency.
> >
> >  Avoidance of deadlock is essential and since state must frequently be updated
> >  that pertains to more than one domain, a locking protocol defines which locks
> > -are needed and the order of their acquistion.
> > +are needed and the order of their acquisition.
> >
> >  ## Structure
> >
> > @@ -127,7 +127,7 @@ by the domain.
> >
> >  ## Hierarchical Locking Model and Protocol
> >
> > -The locking discipline within the Argo code is heirarchical and utilizes
> > +The locking discipline within the Argo code is hierarchical and utilizes
> >  reader/writer locks to enable increased concurrency when operations do not
> >  conflict. None of the Argo locks are reentrant.
> >
> > diff --git a/docs/designs/nested-svm-cpu-features.md b/docs/designs/nested-svm-cpu-features.md
> > index 837a96df05..c855748141 100644
> > --- a/docs/designs/nested-svm-cpu-features.md
> > +++ b/docs/designs/nested-svm-cpu-features.md
> > @@ -22,7 +22,7 @@ leaf 8000000A:edx
> >    from the L1 hypervisor's perspective to be as close as possible to
> >    the original hardware.  In particular, the behavior of the hardware
> >    on error paths 1) is not easy to understand or test, 2) can be the
> > -  source of surprising vulnerabiliies.  (See XSA-7 for an example of a
> > +  source of surprising vulnerabilities.  (See XSA-7 for an example of a
> >    case where subtle error-handling differences can open up a privilege
> >    escalation.)  We should avoid emulating any bit of the hardware with
> >    complex error paths if we can at all help it.
> > @@ -59,11 +59,11 @@ leaf 8000000A:edx
> >
> >  - 2 `SVML` *SVM Lock*: Not required for L0, not provided to L1
> >
> > -  Seems to be aboult enabling an operating system to prevent "blue
> > +  Seems to be about enabling an operating system to prevent "blue
> >    pill" attacks against itself.
> >
> >    Xen doesn't use it, nor provide it; so it would need to be
> > -  implementend.  The best way to protect a guest OS is to leave nested
> > +  implemented.  The best way to protect a guest OS is to leave nested
> >    virt disabled in the tools.
> >
> >  - 3 `NRIPS` NRIP Save: Require for both L0 and L1
> > @@ -78,8 +78,8 @@ leaf 8000000A:edx
> >    The main putative use for this would be trying to maintain an
> >    invariant TSC across cores with different clock speeds, or after a
> >    migrate.  Unlike others, this doesn't have an error path to worry
> > -  about compatibility-wise; and according to tests done when nestedSVM
> > -  was first implemented, it's actually faster to emliate TscRateMSR in
> > +  about compatibility-wise; and according to tests done when nested SVM
> > +  was first implemented, it's actually faster to emulate TscRateMSR in
> >    the L0 hypervisor than for L1 to attempt to emulate it itself.
> >
> >    However, using this properly in L0 will take some implementation
> > @@ -89,7 +89,7 @@ leaf 8000000A:edx
> >   - 5 `VmcbClean`: VMCB Clean Bits: Not required by L0, provide to L1
> >
> >    This is a pure optimization, both on the side of the L0 and L1.  The
> > -  implementaiton for L1 is entirely Xen-side, so can be provided even
> > +  implementation for L1 is entirely Xen-side, so can be provided even
> >    on hardware that doesn't provide it.  And it's purely an
> >    optimization, so could be "implemented" by ignoring the bits
> >    entirely.
> > diff --git a/docs/designs/qemu-deprivilege.md b/docs/designs/qemu-deprivilege.md
> > index f12b1a3ae3..603491f24d 100644
> > --- a/docs/designs/qemu-deprivilege.md
> > +++ b/docs/designs/qemu-deprivilege.md
> > @@ -22,7 +22,7 @@ The following restrictions are currently implemented.
> >  '''Description''': As mentioned above, having QEMU switch to a
> >  non-root user, one per domain id.  Not being the root user limits what
> >  a compromised QEMU process can do to the system, and having one user
> > -per domain id limits what a comprimised QEMU process can do to the
> > +per domain id limits what a compromised QEMU process can do to the
> >  QEMU processes of other VMs.
> >
> >  '''Implementation''': The toolstack adds the following to the qemu command-line:
> > @@ -79,8 +79,8 @@ Then adds the following to the qemu command-line:
> >  ## Namespaces for unused functionality (Linux only)
> >
> >  '''Description''': QEMU doesn't use the functionality associated with
> > -mount and IPC namespaces. (IPC namespaces contol non-file-based IPC
> > -mechanisms within the kernel; unix and network sockets are not
> > +mount and IPC namespaces. (IPC namespaces control non-file-based IPC
> > +mechanisms within the kernel; Unix and network sockets are not
> >  affected by this.)  Making separate namespaces for these for QEMU
> >  won't affect normal operation, but it does mean that even if other
> >  restrictions fail, the process won't be able to even name system mount
> > @@ -251,7 +251,7 @@ executing QEMU.  (But this would then require other changes to create
> >  the QMP socket, VNC socket, and so on).
> >
> >  It should be noted that `-sandbox` is implemented as a blacklist, not
> > -a whitelist; that is, it disables known-unsed functionality which may
> > +a whitelist; that is, it disables known-unused functionality which may
> >  be harmful, rather than disabling all functionality except that known
> >  to be safe and needed.  This is unfortunately necessary since qemu
> >  doesn't know what system calls libraries might end up making.  (See
> > diff --git a/docs/designs/xenstore-migration.md b/docs/designs/xenstore-migration.md
> > index 5022268386..082314bf72 100644
> > --- a/docs/designs/xenstore-migration.md
> > +++ b/docs/designs/xenstore-migration.md
> > @@ -372,7 +372,7 @@ or modified by a transaction for which there is also a `TRANSACTION_DATA`
> >  record previously present).
> >
> >  Each _committed_ node in the stream is required to have an already known parent
> > -node. A parent node is known if it was either in the node data base before the
> > +node. A parent node is known if it was either in the node database before the
> >  stream was started to be processed, or if a `NODE_DATA` record for that parent
> >  node has already been processed in the stream.
> >
> > diff --git a/docs/features/qemu-deprivilege.pandoc b/docs/features/qemu-deprivilege.pandoc
> > index 4ef119c821..915e38d8c9 100644
> > --- a/docs/features/qemu-deprivilege.pandoc
> > +++ b/docs/features/qemu-deprivilege.pandoc
> > @@ -25,7 +25,7 @@ dm_restrict is a set of operations to restrict QEMU running in domain
> >
> >   1. Mechanisms to restrict QEMU to only being able to affect its own
> >  domain
> > - 2. Mechanisms to restruct QEMU's ability to interact with domain 0.
> > + 2. Mechanisms to restrict QEMU's ability to interact with domain 0.
> >
> >  # User details
> >
> 
> Reviewed-by: Frediano Ziglio <frediano.ziglio@cloud.com>

Acked-by: Stefano Stabellini <sstabellini@kernel.org>
--8323329-699952963-1736975793=:2684657--

