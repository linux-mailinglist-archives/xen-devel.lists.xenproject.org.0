Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 088EA8124FD
	for <lists+xen-devel@lfdr.de>; Thu, 14 Dec 2023 03:08:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.654281.1021019 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rDb9J-0000Nw-NE; Thu, 14 Dec 2023 02:08:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 654281.1021019; Thu, 14 Dec 2023 02:08:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rDb9J-0000Kg-JH; Thu, 14 Dec 2023 02:08:29 +0000
Received: by outflank-mailman (input) for mailman id 654281;
 Thu, 14 Dec 2023 02:08:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fjLX=HZ=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1rDb9I-0000KY-H7
 for xen-devel@lists.xenproject.org; Thu, 14 Dec 2023 02:08:28 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a968a739-9a25-11ee-9b0f-b553b5be7939;
 Thu, 14 Dec 2023 03:08:26 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 846D6CE2227;
 Thu, 14 Dec 2023 02:08:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F540C433C7;
 Thu, 14 Dec 2023 02:08:21 +0000 (UTC)
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
X-Inumbo-ID: a968a739-9a25-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702519701;
	bh=hhEj1no1x3UdD4UJ0BBSbSDElzy6gelhkKhgRl7TBYw=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=s37Dx7rjLlKtC8o08smkaRblNlsxqsXRNAhg+tZAD5SMZ94aNCYVPoQpKXCLScnZs
	 4FZ6pszRSTDDIks7bW9wQUJLwyADhmQdXujG7LttJo+K3Uyzt9FUpKiYHmCsZvouMq
	 j7y7+CIZQQvGyBwjyh0kdA7Z4gs7nDv67r9QPP3Z4Pd5SVlKOnF8JeeSUr/aTPUF52
	 q16toVi2psfE7ekGpNbFqTl7XKJ9Elm3uMPJgXuf+dsL4NGAKZfjjzIAmItrFYADeY
	 GKO9RkA6f9VdO5REm8GOL7Jgt57Pf1XpfmfN3esf8W7ZadC7gWOzqP5AUISZReg5Aw
	 jsoekkOzNQ6lQ==
Date: Wed, 13 Dec 2023 18:08:19 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    xen-devel@lists.xenproject.org, Doug Goldstein <cardoe@cardoe.com>
Subject: Re: [PATCH v2 5/5] automation: add x86-64 livepatching test
In-Reply-To: <ZXmNhK58kveTKT0N@macbook>
Message-ID: <alpine.DEB.2.22.394.2312131807190.3175268@ubuntu-linux-20-04-desktop>
References: <20231128100352.35430-1-roger.pau@citrix.com> <20231128100352.35430-6-roger.pau@citrix.com> <alpine.DEB.2.22.394.2311291901250.3533093@ubuntu-linux-20-04-desktop> <ZXmNhK58kveTKT0N@macbook>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-958033687-1702519701=:3175268"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-958033687-1702519701=:3175268
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Wed, 13 Dec 2023, Roger Pau Monné wrote:
> On Wed, Nov 29, 2023 at 07:03:10PM -0800, Stefano Stabellini wrote:
> > On Tue, 28 Nov 2023, Roger Pau Monne wrote:
> > > Introduce a new gitlab tests for livepatching, using livepatch-build-tools,
> > > which better reflects how downstreams build live patches rather than the
> > > in-tree tests.
> > > 
> > > The tests applies the dummy in-tree patch example, checks that the patch is
> > > applied correctly and then reverts and unloads it.
> > > 
> > > Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> > > ---
> > >  automation/gitlab-ci/build.yaml               |  8 +++
> > >  automation/gitlab-ci/test.yaml                |  8 +++
> > >  automation/scripts/build                      | 21 ++++++
> > >  .../scripts/qemu-alpine-x86_64-livepatch.sh   | 68 +++++++++++++++++++
> > >  4 files changed, 105 insertions(+)
> > >  create mode 100755 automation/scripts/qemu-alpine-x86_64-livepatch.sh
> > > 
> > > diff --git a/automation/gitlab-ci/build.yaml b/automation/gitlab-ci/build.yaml
> > > index 32af30ccedc9..22026df51b87 100644
> > > --- a/automation/gitlab-ci/build.yaml
> > > +++ b/automation/gitlab-ci/build.yaml
> > > @@ -358,6 +358,14 @@ alpine-3.18-gcc-debug:
> > >    variables:
> > >      CONTAINER: alpine:3.18
> > >  
> > > +alpine-3.18-gcc-livepatch:
> > > +  extends: .gcc-x86-64-build
> > > +  variables:
> > > +    CONTAINER: alpine:3.18
> > > +    LIVEPATCH: y
> > > +    EXTRA_XEN_CONFIG: |
> > > +      CONFIG_LIVEPATCH=y
> > > +
> > >  debian-stretch-gcc-debug:
> > >    extends: .gcc-x86-64-build-debug
> > >    variables:
> > > diff --git a/automation/gitlab-ci/test.yaml b/automation/gitlab-ci/test.yaml
> > > index 6aabdb9d156f..58a90be5ed0e 100644
> > > --- a/automation/gitlab-ci/test.yaml
> > > +++ b/automation/gitlab-ci/test.yaml
> > > @@ -459,3 +459,11 @@ qemu-smoke-ppc64le-powernv9-gcc:
> > >    needs:
> > >      - qemu-system-ppc64-8.1.0-ppc64-export
> > >      - debian-bullseye-gcc-ppc64le-debug
> > > +
> > > +qemu-alpine-x86_64-gcc-livepatch:
> > > +  extends: .qemu-x86-64
> > > +  script:
> > > +    - ./automation/scripts/qemu-alpine-x86_64-livepatch.sh 2>&1 | tee ${LOGFILE}
> > > +  needs:
> > > +    - *x86-64-test-needs
> > > +    - alpine-3.18-gcc-livepatch
> > > diff --git a/automation/scripts/build b/automation/scripts/build
> > > index b3c71fb6fb60..0a0a6dceb08c 100755
> > > --- a/automation/scripts/build
> > > +++ b/automation/scripts/build
> > > @@ -103,3 +103,24 @@ else
> > >      cp -r dist binaries/
> > >      if [[ -f xen/xen ]] ; then cp xen/xen binaries/xen; fi
> > >  fi
> > > +
> > > +if [[ "$LIVEPATCH" == "y" ]]; then
> > > +    # Build a test livepatch using livepatch-build-tools.
> > > +
> > > +    if [[ "$XEN_TARGET_ARCH" != "x86_64" ]]; then
> > > +        exit 1
> > > +    fi
> > > +
> > > +    # git diff --no-index returns 0 if no differences, otherwise 1.
> > > +    git diff --no-index --output=test.patch xen/arch/x86/test-smc-lp.c \
> > > +                                            xen/arch/x86/test-smc-lp-alt.c && exit 1
> > > +
> > > +    BUILDID=$(readelf -Wn xen/xen-syms | sed -n -e 's/^.*Build ID: //p')
> > > +
> > > +    git clone https://xenbits.xen.org/git-http/livepatch-build-tools.git
> > > +    cd livepatch-build-tools
> > > +    make
> > > +    ./livepatch-build -s ../ -p ../test.patch -o out -c ../xen/.config \
> > > +        --depends $BUILDID --xen-depends $BUILDID
> > > +    cp out/test.livepatch ../binaries/test.livepatch
> > > +fi
> > 
> > I realize this is a matter of taste but if possible I would move this to
> > qemu-alpine-x86_64-livepatch.sh not to make the build script too
> > complex.
> 
> I've attempted that, but there are some issues.  First, the
> elfutils-dev package would need to be added to the test container,
> checkout livepatch-build-tools.git from the test script, and do the
> differential build in the test script, so all the Xen hypervisor build
> dependencies would also be needed in the test container.
> 
> > Otherwise, plase create automation/scripts/livepatch and move this code
> > there. You can call automation/scripts/livepatch from
> > automation/scripts/build.
> 
> Unless you have a strong desire to pursue building the livepatch in
> the test step, I will go with the route proposed here, and split the
> livepatch build into automation/scripts/build-livepatch.

I am OK with this.


> > Other than that, this is great! I'll let other review the livepatch
> > specific changes in this series
> 
> Thanks, will post a new version soon.
> 
> Roger.
> 
--8323329-958033687-1702519701=:3175268--

