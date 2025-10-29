Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B604C1B97D
	for <lists+xen-devel@lfdr.de>; Wed, 29 Oct 2025 16:18:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1152854.1483358 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vE7wj-0006oa-I8; Wed, 29 Oct 2025 15:18:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1152854.1483358; Wed, 29 Oct 2025 15:18:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vE7wj-0006m1-FT; Wed, 29 Oct 2025 15:18:45 +0000
Received: by outflank-mailman (input) for mailman id 1152854;
 Wed, 29 Oct 2025 15:18:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BbVn=5G=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1vE7wi-0006bT-3P
 for xen-devel@lists.xenproject.org; Wed, 29 Oct 2025 15:18:44 +0000
Received: from sea.source.kernel.org (sea.source.kernel.org
 [2600:3c0a:e001:78e:0:1991:8:25])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8d8fa70e-b4da-11f0-9d16-b5c5bf9af7f9;
 Wed, 29 Oct 2025 16:18:43 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 112EA43392;
 Wed, 29 Oct 2025 15:18:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E3502C4CEF7;
 Wed, 29 Oct 2025 15:18:39 +0000 (UTC)
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
X-Inumbo-ID: 8d8fa70e-b4da-11f0-9d16-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761751120;
	bh=HG8FiCQzX+EU7cK9tPe4j1BxP3ez+AQtVxiOKhReSzM=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=dBIIvajmYkMS1AwwthYeBDpE8tX4mDeY4FxH6yazDxZa2EhIamBmsnODvnOgpB5dL
	 zDfTb5Nf5E/piSlogioWFYIY0yTRrftWkEuTcgyoH7eBOAQ8OMJ9dudlPHrrglKusE
	 gscnHB1ZUqbXWqCua5QEyQBLx4t/tYd1oVPsNkOt8fjDLuVxxUK1afNgw9vuzXHzpQ
	 a8UrT5EVsILQ51ydXZFMQOe/dlJPv/ZqNCnuA86FuP0a2GF3mqPLuj5NHOeDkd7Tn7
	 0Pu0yW0HNZbOCp5NpEYFCg29EwMbiR3b2/FCoKmkzwFT/CdlLN7/sQL61E8EDSIZNK
	 8SW2OpYn2SIxA==
Date: Wed, 29 Oct 2025 08:18:37 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    xen-devel@lists.xenproject.org, consulting@bugseng.com, 
    Doug Goldstein <cardoe@cardoe.com>, Victor Lira <victorm.lira@amd.com>
Subject: Re: [XEN PATCH v2] automation/eclair: add new analysis jobs with
 differing configurations
In-Reply-To: <f27279b79ca914a27c80532fefda8b27@bugseng.com>
Message-ID: <alpine.DEB.2.22.394.2510290817541.495094@ubuntu-linux-20-04-desktop>
References: <1591f6a0c0f3524c4c613328293ed4e03cfc93ef.1761291003.git.nicola.vetrini@bugseng.com> <alpine.DEB.2.22.394.2510271656380.495094@ubuntu-linux-20-04-desktop> <f6dbd7a74854cab064cf7ca76c68e44d@bugseng.com> <alpine.DEB.2.22.394.2510281722540.495094@ubuntu-linux-20-04-desktop>
 <f27279b79ca914a27c80532fefda8b27@bugseng.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 29 Oct 2025, Nicola Vetrini wrote:
> On 2025-10-29 01:22, Stefano Stabellini wrote:
> > On Tue, 28 Oct 2025, Nicola Vetrini wrote:
> > > On 2025-10-28 00:58, Stefano Stabellini wrote:
> > > > On Fri, 24 Oct 2025, Nicola Vetrini wrote:
> > > > > The following analysis jobs are performed:
> > > > > - eclair-{x86_64,ARM64}: analyze Xen using the default configuration
> > > for
> > > > >   that architecture; runs on runners tagged `eclair-analysis'.
> > > > >
> > > > > - eclair-{x86-64,ARM64}-safety: analyze Xen using the configuration
> > > for
> > > > >   safety, which is more restricted; runs on runners tagged
> > > > >   `eclair-analysis-safety`.
> > > > >
> > > > > - eclair-{x86_64,ARM64}-testing: analyze Xen using the default
> > > > >   configuration for the purposes of testing new runner updates; runs
> > > on
> > > > >   runners tagged `eclair-analysis-testing`.
> > > > >
> > > > > Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
> > > >
> > > > Do you have a link to a successful pipeline?
> > > >
> > > > Just making sure we are not breaking things.
> > > >
> > > 
> > > No; not yet, at least [1]. Without the right tags the safety runner can't
> > > pick
> > > up jobs.
> > > 
> > > [1]
> > > https://gitlab.com/xen-project/people/bugseng/xen/-/pipelines/2117835680
> > > 
> > > >
> > > > > ---
> > > > > Changes in v2:
> > > > > - rebased to current staging;
> > > > > - fixed regex path issue.
> > > > > ---
> > > > >  automation/gitlab-ci/analyze.yaml | 38
> > > +++++++++++++++++++++++++++++++
> > > > >  1 file changed, 38 insertions(+)
> > > > >
> > > > > diff --git a/automation/gitlab-ci/analyze.yaml
> > > > > b/automation/gitlab-ci/analyze.yaml
> > > > > index d50721006740..7bd644d75074 100644
> > > > > --- a/automation/gitlab-ci/analyze.yaml
> > > > > +++ b/automation/gitlab-ci/analyze.yaml
> > > > > @@ -45,6 +45,21 @@ eclair-x86_64:
> > > > >      LOGFILE: "eclair-x86_64.log"
> > > > >      VARIANT: "X86_64"
> > > > >      RULESET: "monitored"
> > > > > +
> > > > > +eclair-x86_64-testing:
> > > > > +  extends: eclair-x86_64
> > > > > +  tags:
> > > > > +    - eclair-analysis-testing
> > > > > +  rules:
> > > > > +    - if: $CI_PROJECT_PATH =~ /^xen-project\/people\/bugseng.*$/
> > > > > +      when: always
> > > > > +    - !reference [.eclair-analysis:triggered, rules]
> > > >
> > > > given that everyone can change this yaml file when pushing to their own
> > > > branch, I think we should remove this, or (probably better) use a
> > > > separate env variable to set the default
> > > >
> > > > it is better not to use the path, I think
> > > >
> > > 
> > > That is a fair concern. One option would be to just use a project runner
> > > assigned to the people/bugseng/xen subproject, but that might be a bit
> > > inconvenient if we want to swap runners around.
> > 
> > I think it is OK to register a project runner to people/bugseng/xen. I
> > am happy with this solution as well.
> > 
> > 
> > > Another option, as you said,
> > > is keeping the regex in a variable, but this wont't prevent rogue
> > > modifications of the YAML.
> > 
> > I was thinking more of a simpler boolean variable like:
> > 
> > rules:
> >   - if: $ECLAIR_TESTING
> > 
> > Yes, it wouldn't prevent modifications of the YAML, but it is probably
> > not an issue? Also, it is not less secure than the path, because the
> > YAML can be changed by anyone. At least the variable is more flexible
> > and feels more natural.
> > 
> 
> Ok, let's use the variable and then change if we see any problems. I'll send a
> v3. If you could add the tags to the runners in the meantime, I can validate
> the changes with a proper CI run.

I added the tag eclair-analysis-testing to the runner

