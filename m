Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3017A7F53C7
	for <lists+xen-devel@lfdr.de>; Wed, 22 Nov 2023 23:57:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.639269.996395 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5w9c-0001bg-Py; Wed, 22 Nov 2023 22:57:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 639269.996395; Wed, 22 Nov 2023 22:57:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5w9c-0001Zr-NT; Wed, 22 Nov 2023 22:57:08 +0000
Received: by outflank-mailman (input) for mailman id 639269;
 Wed, 22 Nov 2023 22:57:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lIMN=HD=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1r5w9b-0000uP-JA
 for xen-devel@lists.xenproject.org; Wed, 22 Nov 2023 22:57:07 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 75249b8d-898a-11ee-9b0e-b553b5be7939;
 Wed, 22 Nov 2023 23:57:06 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id 5B388B829CB;
 Wed, 22 Nov 2023 22:57:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F0143C433C8;
 Wed, 22 Nov 2023 22:57:03 +0000 (UTC)
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
X-Inumbo-ID: 75249b8d-898a-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700693824;
	bh=xRSABOPimkruIhnojy34S2rdFT8BG80gt5EZHEfktV0=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=aO1G0FjD2pePl1QAJFZxP3SbLK/s/jNXm8Cr0j3yPDtsouw9zCA/iX1J2u7X0vdmj
	 //XoZ1xpmdlgZuSha8ZokfNkOxB922u2hrE2xpsiHkJDxjwI1Zbxr2VWYWpuiT/QU8
	 kTh38XdO/lRjMzakTiqFveRg/kDoDRPGZouXsDf495AVlks7y858DFQfYaeZZZl1Q7
	 byfnd0QrQKjdLKt0oRObJ6n7foTKDFGegwkgfx7+MFO091yRcLTXF+duYx9z5S/Dhv
	 UMy1AcWo+ymO8Xt97Y8agRMizVW85OVX+eOtWJjnlV1aUcbQurAJd5IJh4EmF1qUN8
	 J4Ue2ejVWIFPQ==
Date: Wed, 22 Nov 2023 14:57:02 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Simone Ballarin <simone.ballarin@bugseng.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    xen-devel@lists.xenproject.org, consulting@bugseng.com, 
    Doug Goldstein <cardoe@cardoe.com>
Subject: Re: [XEN PATCH] automation/eclair: improve scheduled analyses
In-Reply-To: <fc51fe5b-3e2f-4a62-8078-a86d064c9ef1@bugseng.com>
Message-ID: <alpine.DEB.2.22.394.2311221455530.2053963@ubuntu-linux-20-04-desktop>
References: <54204ba682f4a5dc6fb8202b593d9562caff6d06.1700486902.git.simone.ballarin@bugseng.com> <alpine.DEB.2.22.394.2311211733330.2053963@ubuntu-linux-20-04-desktop> <fc51fe5b-3e2f-4a62-8078-a86d064c9ef1@bugseng.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 22 Nov 2023, Simone Ballarin wrote:
> > > diff --git a/automation/gitlab-ci/build.yaml
> > > b/automation/gitlab-ci/build.yaml
> > > index 32af30cced..6b2ac97248 100644
> > > --- a/automation/gitlab-ci/build.yaml
> > > +++ b/automation/gitlab-ci/build.yaml
> > > @@ -1,6 +1,10 @@
> > >   .build-tmpl: &build
> > >     stage: build
> > >     image: registry.gitlab.com/xen-project/xen/${CONTAINER}
> > > +  rules:
> > > +    - if: $CI_PIPELINE_SOURCE == "schedule"
> > > +      when: never
> > > +    - when: always
> > 
> > ...does it mean that we are going to stop all the build jobs...
> > 
> > 
> > >     script:
> > >       - ./automation/scripts/build 2>&1 | tee build.log
> > >     artifacts:
> > > diff --git a/automation/gitlab-ci/test.yaml
> > > b/automation/gitlab-ci/test.yaml
> > > index 61e642cce0..47fc8cb3eb 100644
> > > --- a/automation/gitlab-ci/test.yaml
> > > +++ b/automation/gitlab-ci/test.yaml
> > > @@ -1,6 +1,10 @@
> > >   .test-jobs-common:
> > >     stage: test
> > >     image: registry.gitlab.com/xen-project/xen/${CONTAINER}
> > > +  rules:
> > > +    - if: $CI_PIPELINE_SOURCE == "schedule"
> > > +      when: never
> > > +    - when: always
> > 
> > ...and also stop all the test jobs?
> > 
> > So basically the only thing left is .eclair-analysis:on-schedule ?
> 
> Yes, you're right. I don't know if this is the indented behavior,
> but without these changes all jobs run implicitly.
> 
> If test and build stages are supposed to run on scheduled pipelines,
> I suggest making it explicit by reversing the guard.

Yes I think it is OK to run build and test jobs on scheduled pipelines,
it is not worth optimized them out. I would reduce this patch to the
below. Would that work?

If so, please resend with only the below, and you can add my
Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


diff --git a/automation/eclair_analysis/ECLAIR/action.settings b/automation/eclair_analysis/ECLAIR/action.settings
index f96368ffc7..3cba1a3afb 100644
--- a/automation/eclair_analysis/ECLAIR/action.settings
+++ b/automation/eclair_analysis/ECLAIR/action.settings
@@ -134,7 +134,7 @@ push)
     badgeLabel="ECLAIR ${ANALYSIS_KIND} ${ref}${variantHeadline} #${jobId}"
     ;;
 auto_pull_request)
-    git remote remove autoPRRemote || true
+    git remote remove autoPRRemote 2>/dev/null || true
     git remote add autoPRRemote "${autoPRRemoteUrl}"
     git fetch -q autoPRRemote
     subDir="${ref}"
diff --git a/automation/eclair_analysis/ECLAIR/analysis.ecl b/automation/eclair_analysis/ECLAIR/analysis.ecl
index fe418d6da1..2507a8e787 100644
--- a/automation/eclair_analysis/ECLAIR/analysis.ecl
+++ b/automation/eclair_analysis/ECLAIR/analysis.ecl
@@ -2,7 +2,13 @@
 -project_name=getenv("ECLAIR_PROJECT_NAME")
 -project_root=getenv("ECLAIR_PROJECT_ROOT")
 
--setq=data_dir,getenv("ECLAIR_DATA_DIR")
+setq(data_dir,getenv("ECLAIR_DATA_DIR"))
+setq(analysis_kind,getenv("ANALYSIS_KIND"))
+setq(scheduled_analysis,nil)
+
+strings_map("scheduled-analysis",500,"","^.*scheduled$",0,setq(scheduled_analysis,t))
+strings_map("scheduled-analysis",500,"","^.*$",0)
+map_strings("scheduled-analysis",analysis_kind)
 
 -verbose
 
@@ -15,7 +21,9 @@
 
 -eval_file=toolchain.ecl
 -eval_file=public_APIs.ecl
--eval_file=out_of_scope.ecl
+if(scheduled_analysis,
+    eval_file("out_of_scope.ecl")
+)
 -eval_file=deviations.ecl
 -eval_file=call_properties.ecl
 -eval_file=tagging.ecl
diff --git a/automation/gitlab-ci/analyze.yaml b/automation/gitlab-ci/analyze.yaml
index bd9a68de31..6631db53fa 100644
--- a/automation/gitlab-ci/analyze.yaml
+++ b/automation/gitlab-ci/analyze.yaml
@@ -28,6 +28,8 @@
   extends: .eclair-analysis
   allow_failure: true
   rules:
+    - if: $CI_PIPELINE_SOURCE == "schedule"
+      when: never
     - if: $WTOKEN && $CI_PROJECT_PATH =~ /^xen-project\/people\/.*$/
       when: manual
     - !reference [.eclair-analysis, rules]

