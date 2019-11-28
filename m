Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4519710C12B
	for <lists+xen-devel@lfdr.de>; Thu, 28 Nov 2019 01:57:55 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ia84a-0000IQ-GR; Thu, 28 Nov 2019 00:54:20 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=S3ai=ZU=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1ia84Y-0000IA-HD
 for xen-devel@lists.xenproject.org; Thu, 28 Nov 2019 00:54:18 +0000
X-Inumbo-ID: 949a776a-1179-11ea-a3c4-12813bfff9fa
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 949a776a-1179-11ea-a3c4-12813bfff9fa;
 Thu, 28 Nov 2019 00:54:07 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 5286D20661;
 Thu, 28 Nov 2019 00:54:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1574902446;
 bh=iJEb+4SPDgdNtgzcXfxN2lbRBImN9YGqE4uU8Dba+5I=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=0UHHP5NV/CnX0ZY8M0SYr5CKhlS35Ztq2TUn/947hnUpWA0i2lXOI08NSopT9MSi8
 1Zyxk2x9LhZSW3NtSjRa/oPhI1YOF6O4zoDEaKBY+fh5yguXVyXQR22RvJoHw2rHf3
 JSmYCdsnH5yu9dDYgfxggO+iFaKvnuGjTACP6gY0=
Date: Wed, 27 Nov 2019 16:54:05 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Lars Kurth <lars.kurth@xenproject.org>
In-Reply-To: <97e3adf75cf71ba39e702d4cab23236ada8d5a6c.1569525222.git.lars.kurth@citrix.com>
Message-ID: <alpine.DEB.2.21.1911271608510.27669@sstabellini-ThinkPad-T480s>
References: <cover.1569525222.git.lars.kurth@citrix.com>
 <97e3adf75cf71ba39e702d4cab23236ada8d5a6c.1569525222.git.lars.kurth@citrix.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323329-168241973-1574899840=:27669"
Content-ID: <alpine.DEB.2.21.1911271631020.27669@sstabellini-ThinkPad-T480s>
Subject: Re: [Xen-devel] [PATCH v2 4/6] Add Code Review Guide
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Lars Kurth <lars.kurth@citrix.com>, xen-api@lists.xenproject.org,
 minios-devel@lists.xenproject.org, committers@xenproject.org,
 mirageos-devel@lists.xenproject.org, xen-devel@lists.xenproject.org,
 win-pv-devel@lists.xenproject.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-168241973-1574899840=:27669
Content-Type: text/plain; CHARSET=UTF-8
Content-Transfer-Encoding: 8BIT
Content-ID: <alpine.DEB.2.21.1911271631021.27669@sstabellini-ThinkPad-T480s>

On Thu, 26 Sep 2019, Lars Kurth wrote:
> From: Lars Kurth <lars.kurth@citrix.com>
> 
> This document highlights what reviewers such as maintainers and committers look
> for when reviewing code. It sets expectations for code authors and provides
> a framework for code reviewers.

I think the document is missing a couple of things:

- a simple one line statement that possibly the most important thing in
  a code review is to indentify any bugs in the code

- an explanation that requests for major changes to the series should be
  made early on (i.e. let's not change the architecture of a feature at
  v9 if possible) I also made this comment in reply to patch #5. I'll
  let you decide where is the best place for it.


> Signed-off-by: Lars Kurth <lars.kurth@citrix.com>
> ---
> Cc: minios-devel@lists.xenproject.org
> Cc: xen-api@lists.xenproject.org
> Cc: win-pv-devel@lists.xenproject.org
> Cc: mirageos-devel@lists.xenproject.org
> Cc: committers@xenproject.org
> ---
>  code-review-guide.md | 125 +++++++++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 125 insertions(+)
>  create mode 100644 code-review-guide.md
> 
> diff --git a/code-review-guide.md b/code-review-guide.md
> new file mode 100644
> index 0000000..8639431
> --- /dev/null
> +++ b/code-review-guide.md
> @@ -0,0 +1,125 @@
> +# Code Review Guide
> +
> +This document highlights what reviewers such as maintainers and committers look
> +for when reviewing your code. It sets expectations for code authors and provides
> +a framework for code reviewers.
> +
> +This document does **not cover** the following topics:
> +* [Communication Best Practice](communication-practice.md)
> +* [Resolving Disagreement](resolving-disagreement.md)
> +* [Patch Submission Workflow](https://wiki.xenproject.org/wiki/Submitting_Xen_Project_Patches)
> +* [Managing Patch Submission with Git](https://wiki.xenproject.org/wiki/Managing_Xen_Patches_with_Git)
> +
> +## What we look for in Code Reviews
> +When performing a code review, reviewers typically look for the following things
> +
> +### Is the change necessary to accomplish the goals?
> +* Is it clear what the goals are?
> +* Do we need to make a change, or can the goals be met with existing
> +  functionality?
> +
> +### Architecture / Interface
> +* Is this the best way to solve the problem?
> +* Is this the right part of the code to modify?
> +* Is this the right level of abstraction?
> +* Is the interface general enough? Too general? Forward compatible?
> +
> +### Functionality
> +* Does it do what it’s trying to do?
> +* Is it doing it in the most efﬁcient way?
> +* Does it handle all the corner / error cases correctly?
> +
> +### Maintainability / Robustness
> +* Is the code clear? Appropriately commented?
> +* Does it duplicate another piece of code?
> +* Does the code make hidden assumptions?
> +* Does it introduce sections which need to be kept **in sync** with other sections?
> +* Are there other **traps** someone modifying this code might fall into?
> +
> +**Note:** Sometimes you will work in areas which have identified maintainability
> +and/or robustness issues. In such cases, maintainers may ask you to make additional
> +changes, such that your submitted code does not make things worse or point you
> +to other patches are already being worked on.
> +
> +### System properties
> +In some areas of the code, system properties such as
> +* Code size
> +* Performance
> +* Scalability
> +* Latency
> +* Complexity
> +* &c
> +are also important during code reviews.
> +
> +### Style
> +* Comments, carriage returns, **snuggly braces**, &c
> +* See [CODING_STYLE](https://xenbits.xenproject.org/gitweb/?p=xen.git;a=blob;f=CODING_STYLE)
> +  and [tools/libxl/CODING_STYLE](https://xenbits.xenproject.org/gitweb/?p=xen.git;a=blob;f=tools/libxl/CODING_STYLE)
> +* No extraneous whitespace changes
> +
> +### Documentation and testing
> +* If there is pre-existing documentation in the tree, such as man pages, design
> +  documents, etc. a contributor may be asked to update the documentation alongside
> +  the change. Documentation is typically present in the
> +  [docs](https://xenbits.xen.org/gitweb/?p=xen.git;a=tree;f=docs) folder.
> +* When adding new features that have an impact on the end-user,
> +  a contributor should include an update to the
> +  [SUPPORT.md](https://xenbits.xen.org/gitweb/?p=xen.git;a=tree;f=docs) file.
> +  Typically, more complex features require several patch series before it is ready to be
> +  advertised in SUPPORT.md
> +* When adding new features, a contributor may be asked to provide tests or
> +  ensure that existing tests pass
> +
> +#### Testing for the Xen Project Hypervisor
> +Tests are typically located in one of the following directories
> +* **Unit tests**: [tools/tests](https://xenbits.xenproject.org/gitweb/?p=xen.git;a=tree;f=tools/tests)
> +or [xen/test](https://xenbits.xenproject.org/gitweb/?p=xen.git;a=tree;f=xen/test)<br>
> +  Unit testing is hard for a system like Xen and typically requires building a subsystem of
> +  your tree. If your change can be easily unit tested, you should consider submitting tests
> +  with your patch.
> +* **Build and smoke test**: see [Xen GitLab CI](https://gitlab.com/xen-project/xen/pipelines)<br>
> +  Runs build tests for a combination of various distros and compilers against changes
> +  committed to staging. Developers can join as members and test their development
> +  branches **before** submitting a patch.
> +* **XTF tests** (microkernel-based tests): see [XTF](https://xenbits.xenproject.org/docs/xtf/)<br>
> +  XTF has been designed to test interactions between your software and hardware.
> +  It is a very useful tool for testing low level functionality and is executed as part of the
> +  project's CI system. XTF can be easily executed locally on xen.git trees.
> +* **osstest**: see [README](https://xenbits.xenproject.org/gitweb/?p=osstest.git;a=blob;f=README)<br>
> +  Osstest is the Xen Projects automated test system, which tests basic Xen use cases on
> +  a variety of different hardware. Before changes are committed, but **after** they have
> +  been reviewed. A contributor’s changes **cannot be applied to master** unless the
> +  tests pass this test suite. Note that XTF and other tests are also executed as part of
> +  osstest.
> +
> +### Patch / Patch series information
> +* Informative one-line changelog
> +* Full changelog
> +* Motivation described
> +* All important technical changes mentioned
> +* Changes since previous revision listed
> +* Reviewed-by’s and Acked-by’s dropped if appropriate
> +
> +More information related to these items can be found in our
> +[Patch submission Guide](https://wiki.xenproject.org/wiki/Submitting_Xen_Project_Patches).
> +
> +## Reviewing for Patch Authors
> +
> +The following presentation by George Dunlap, provides an excellent overview on how
> +we do code reviews, specifically targeting non-maintainers.
> +
> +As a community, we would love to have more help reviewing, including from **new
> +community members**. But many people
> +* do not know where to start, or
> +* believe that their review would not contribute much, or
> +* may feel intimidated reviewing the code of more established community members
> +
> +The presentation demonstrates that you do not need to worry about any of these
> +concerns. In addition, reviewing other people's patches helps you
> +* write better patches and experience the code review process from the other side
> +* and build more influence within the community over time
> +
> +Thus, we recommend strongly that **patch authors** read the watch the recording or
> +read the slides:
> +* [Patch Review for Non-Maintainers slides](https://www.slideshare.net/xen_com_mgr/xpdds19-keynote-patch-review-for-nonmaintainers-george-dunlap-citrix-systems-uk-ltd)
> +* [Patch Review for Non-Maintainers recording - 20"](https://www.youtube.com/watch?v=ehZvBmrLRwg)
> -- 
> 2.13.0
> 
--8323329-168241973-1574899840=:27669
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--8323329-168241973-1574899840=:27669--

