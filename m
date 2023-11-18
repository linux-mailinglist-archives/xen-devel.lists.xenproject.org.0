Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BD0D37EFD1C
	for <lists+xen-devel@lfdr.de>; Sat, 18 Nov 2023 03:20:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.635475.991375 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r4AwB-00019A-37; Sat, 18 Nov 2023 02:19:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 635475.991375; Sat, 18 Nov 2023 02:19:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r4AwB-000172-0S; Sat, 18 Nov 2023 02:19:59 +0000
Received: by outflank-mailman (input) for mailman id 635475;
 Sat, 18 Nov 2023 02:19:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=W+gg=G7=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1r4Aw9-00016w-If
 for xen-devel@lists.xenproject.org; Sat, 18 Nov 2023 02:19:57 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f6016c13-85b8-11ee-98dc-6d05b1d4d9a1;
 Sat, 18 Nov 2023 03:19:55 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id A82B461DF3;
 Sat, 18 Nov 2023 02:19:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6DC08C433C8;
 Sat, 18 Nov 2023 02:19:50 +0000 (UTC)
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
X-Inumbo-ID: f6016c13-85b8-11ee-98dc-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700273992;
	bh=z6pTziN/JcjnXzjVx6Wp158hLjbEqCdHpHzaB73Dcpc=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=thtrgRUbLkRciqIpqh6vKIOryif9ckBe2ePwbuW2lORhVpGjg/m+kS+krV1BruWtD
	 W0Z6NPVTic/gc8ud8qzA37fQI9musapzyBukvTQG85exb25IMN3LKmREeCn9obb/69
	 FYRFT9IKaRBdea3MvJ+kvwcOYDh3HzSsLpcpWFdr3BmC+78AMXc6l0qbbVqnZP2dR2
	 hq44SUyoPF6F5qafN4kz/sLilUalhFnAz/b8oPbNN7ZslotLI+MO+YwzqrW/jBEhQL
	 D9P2i4FaXUBOD7Wz2al7zcxiGjPMuyfRmZWngmqsWKngeKbk4MM2kTV0ATWoob1OhF
	 piF1PMua6dLuA==
Date: Fri, 17 Nov 2023 18:19:48 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Julien Grall <julien@xen.org>
cc: Nicola Vetrini <nicola.vetrini@bugseng.com>, 
    xen-devel@lists.xenproject.org, sstabellini@kernel.org, 
    michal.orzel@amd.com, xenia.ragiadakou@amd.com, ayan.kumar.halder@amd.com, 
    consulting@bugseng.com, jbeulich@suse.com, andrew.cooper3@citrix.com, 
    roger.pau@citrix.com, bertrand.marquis@arm.com, 
    Simone Ballarin <simone.ballarin@bugseng.com>, 
    Doug Goldstein <cardoe@cardoe.com>
Subject: Re: [XEN PATCH v4 1/2] automation/eclair: make the docs for MISRA
 C:2012 Dir 4.1 visible to ECLAIR
In-Reply-To: <90f41e53-783b-43e6-9188-abbae847e370@xen.org>
Message-ID: <alpine.DEB.2.22.394.2311171813380.773207@ubuntu-linux-20-04-desktop>
References: <cover.1699975581.git.nicola.vetrini@bugseng.com> <f14b266f18089f5951a3e390a5ebfe713beb8dbb.1699975581.git.nicola.vetrini@bugseng.com> <f63fa9b5-a821-49d4-88f6-7d991ab6c644@xen.org> <1689d4b47d708098c43601a58e867f1c@bugseng.com>
 <ecbfa46d-2e0a-4685-9695-f7de37e7b6ce@xen.org> <fd6f51afebb9fd90531e30289eb99d8c@bugseng.com> <90f41e53-783b-43e6-9188-abbae847e370@xen.org>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323329-464059291-1700273631=:773207"
Content-ID: <alpine.DEB.2.22.394.2311171818090.773207@ubuntu-linux-20-04-desktop>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-464059291-1700273631=:773207
Content-Type: text/plain; CHARSET=UTF-8
Content-Transfer-Encoding: 8BIT
Content-ID: <alpine.DEB.2.22.394.2311171818091.773207@ubuntu-linux-20-04-desktop>

On Fri, 17 Nov 2023, Julien Grall wrote:
> Hi,
> 
> On 16/11/2023 08:45, Nicola Vetrini wrote:
> > On 2023-11-15 12:22, Julien Grall wrote:
> > > Hi,
> > > 
> > > On 15/11/2023 11:02, Nicola Vetrini wrote:
> > > > On 2023-11-14 23:12, Julien Grall wrote:
> > > > > Hi,
> > > > > 
> > > > > On 14/11/2023 15:36, Nicola Vetrini wrote:
> > > > > > To be able to check for the existence of the necessary subsections
> > > > > > in
> > > > > > the documentation for MISRA C:2012 Dir 4.1, ECLAIR needs to have a
> > > > > > source
> > > > > > file that is built.
> > > > > > 
> > > > > > This file is generated from 'C-runtime-failures.rst' in docs/misra
> > > > > > and the configuration is updated accordingly.
> > > > > > 
> > > > > > Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
> > > > > > ---
> > > > > > Changes from RFC:
> > > > > > - Dropped unused/useless code
> > > > > > - Revised the sed command
> > > > > > - Revised the clean target
> > > > > > 
> > > > > > Changes in v2:
> > > > > > - Added explanative comment to the makefile
> > > > > > - printf instead of echo
> > > > > > 
> > > > > > Changes in v3:
> > > > > > - Terminate the generated file with a newline
> > > > > > - Build it with -std=c99, so that the documentation
> > > > > >    for D1.1 applies.
> > > > > > Changes in v5:
> > > > > > - Transform and build the file directly in the eclair-specific
> > > > > > directory
> > > > > > ---
> > > > > >   automation/eclair_analysis/build.sh   | 21 +++++++++++++++++++--
> > > > > >   automation/eclair_analysis/prepare.sh |  7 ++++---
> > > > > >   2 files changed, 23 insertions(+), 5 deletions(-)
> > > > > > 
> > > > > > diff --git a/automation/eclair_analysis/build.sh
> > > > > > b/automation/eclair_analysis/build.sh
> > > > > > index ec087dd822fa..f24292ed0643 100755
> > > > > > --- a/automation/eclair_analysis/build.sh
> > > > > > +++ b/automation/eclair_analysis/build.sh
> > > > > > @@ -33,12 +33,29 @@ else
> > > > > >     PROCESSORS=6
> > > > > >   fi
> > > > > >   +runtime_failures_docs() {
> > > > > > +  doc="C-runtime-failures.rst"
> > > > > > +  builddir="automation/eclair_analysis"
> > > > > > +
> > > > > > +  cp "docs/misra/${doc}" "${builddir}"
> > > > > 
> > > > > Is it necessary to copy the .rst? IOW, would it be sufficient to
> > > > > use...
> > > > > 
> > > > > > +  cd "${builddir}"
> > > > > > +  printf "/*\n\n" >"${doc}.tmp"
> > > > > > +  sed -e 's|\*/|*//*|g' "${doc}" >>"${doc}.tmp"
> > > > > 
> > > > > ... docs/misc/${doc} here?
> > > > > 
> > > > 
> > > > I didn't want to leave a stray file under docs/misra, but it's not
> > > > essential.
> > > 
> > > I am confused. I am suggesting to use:
> > > 
> > > sed -e 's|\*/|*//*|g' "../../docs/misc/${doc}" >> "${doc}.tmp"
> > > 
> > > So *.tmp is still created at the same place.
> > > 
> > 
> > Ok, makes sense.
> > 
> > > > 
> > > > > > +  printf "\n\n*/\n" >>"${doc}.tmp"
> > > > > > +  mv "${doc}.tmp" "${doc}.c"
> > > > > 
> > > > > NIT: I am not sure why you need to first create .tmp and then
> > > > > create.c.
> > > > > 
> > > > 
> > > > Wasn't this a pattern to defend against interruptions of the build, just
> > > > as I did in v3?
> > > > 
> > > > +$(TARGETS:.o=.c): %.c: %.rst
> > > > +    printf "/*\n\n" > $@.tmp
> > > > +    sed -e 's|\*/|*//*|g' $< >> $@.tmp
> > > > +    printf "\n\n*/\n" >> $@.tmp
> > > > +    mv $@.tmp $@
> > > 
> > > Yes but it makes sense for the Makefile because the target would not be
> > > re-executed if *.c exists.
> > > 
> > > But I don't think this is the case for you because you are using a bash
> > > script. So your function should always be re-executed regardless on
> > > whether it was interrupted or not.
> > > 
> > 
> > Ok.
> > 
> > > > 
> > > > > > +
> > > > > > +  # Cannot redirect to /dev/null because it would be excluded from
> > > > > > the analysis
> > > > > > +  "${CROSS_COMPILE}gcc-12" -std=c99 -c "${doc}.c" -o "${doc}.o"
> > > > > 
> > > > > NIT: It would be helpful to specify why -std=c99 is used. Above, you
> > > > > suggest this is to enable D1.1.
> > > > > 
> > > > 
> > > > Yeah, the comment in the changelog should be pasted here
> > > > 
> > > > > NIT: Can we define CC and use here and ...
> > > > > 
> > > > > > +  cd -
> > > > > > +}
> > > > > > +
> > > > > >   (
> > > > > > -  cd xen
> > > > > > +  runtime_failures_docs
> > > > > >       make "-j${PROCESSORS}" "-l${PROCESSORS}.0"    \
> > > > > >          "CROSS_COMPILE=${CROSS_COMPILE}"         \
> > > > > >          "CC=${CROSS_COMPILE}gcc-12"              \
> > > > > 
> > > > > ...? This would make easier to re-use the code.
> > > > > 
> > > > 
> > > > I don't expect this build script to be changed much to be honest, but if
> > > > you think
> > > > this is beneficial then it's ok.
> > > 
> > > This is not only about code evolving. It makes easier to spot your are
> > > using the same compiler. I would not have made the remark if you were
> > > using 'gcc'.
> > > 
> > > But I noticed you were using gcc-12 and originally thought it was a
> > > mistake until I saw the second use.
> > > 
> > > The advantage of a variable CC (and CXX) is you can add a comment on top
> > > why you are specifically requestion gcc-12? IOW, why is gcc not fine?
> > > 
> > 
> > The assumptions in C-language-toolchain.rst (which are reflected in the
> > analysis config) are using gcc-12 explicitly; that's just easier from a
> > certification perspective to have a fixed version.
> 
> I am not against fixed version. It just needs to be documented. At least
> reading C-language-toolchain.rst, it is not obvious to me that this is only
> applying to GCC-12.

I did a commit sweep for the old MISRA patches. I didn't commit this
series as I imagine it requires a respin.
--8323329-464059291-1700273631=:773207--

