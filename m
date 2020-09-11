Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CD651265FAF
	for <lists+xen-devel@lfdr.de>; Fri, 11 Sep 2020 14:40:55 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kGiMD-0006mA-0Q; Fri, 11 Sep 2020 12:40:49 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vrAB=CU=citrix.com=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1kGiMB-0006gu-Ec
 for xen-devel@lists.xenproject.org; Fri, 11 Sep 2020 12:40:47 +0000
X-Inumbo-ID: ebeda99d-dabe-4cfb-8a1a-6f4b21e6e3ef
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ebeda99d-dabe-4cfb-8a1a-6f4b21e6e3ef;
 Fri, 11 Sep 2020 12:40:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1599828042;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=6hvqvDnIaK5LxdUrZAah3lW8EHE+s21vV+EQh3ktnEA=;
 b=SLyd6mbpgL38uxI6IpZGMsMAe7dXtdWTjf2V52ePTCvH3QHXwcfv5O8c
 soYfVvgIa8NGuFES5cugxOqGvgqwBb/Lf2EDiaAfxUCvX2MTesfm0+P78
 m43UixC6T+wGLXcukZO/LB1w45YQHwV/3MUzck1hUtJV/b5ND4aVYT/RI M=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: +mZGLqzCxjx21jiSZNMzHII0A3m3GkZ+yoody6L/5j9Sh6cxVfy6N83IVqG3P8hpkhysd3IR69
 6zFNODLX6HYCv/hOldhxKl7nOWoK/2ZAxT2vL1/JAkOSsjEQGqgt2vJtrKmLTxzXgfVE4BA6A8
 DtYHifLndYyKtfw5X/YwQxWOg3Ft9Pa128UmtdWqcZFp5EiDltaONOH5fMOjS/td+93FoQB4M1
 Bd2LK9O3Xnx0X8oeTRmnZWN2CkiYJu8CeLHeJqeIopHI8bS34iOUOv+0EOyg42uemEZ7uUi3Wd
 pcQ=
X-SBRS: 2.7
X-MesageID: 26476155
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.76,415,1592884800"; d="scan'208";a="26476155"
From: George Dunlap <george.dunlap@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: George Dunlap <george.dunlap@citrix.com>
Subject: [PATCH 5/8] Convert code-review-guide.md to rst
Date: Fri, 11 Sep 2020 13:40:06 +0100
Message-ID: <20200911124009.3760032-6-george.dunlap@citrix.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200911124009.3760032-1-george.dunlap@citrix.com>
References: <20200911124009.3760032-1-george.dunlap@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="true"
Content-Transfer-Encoding: 8bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Convert titles as approproate.

Use inter-doc references for other full docs.  Convert other external
links to RST-style references, keeping the labels (3-F).  One
exception to this: sphinx noticed that there were two 'D' labels;
rename one to `Shift Left`.

Convert internal link to RST-style reference.

 Add spaces so that lists compile correctly.

Remove explicit HTML <br> tags; Make them a separate block to achieve
a similar goal.

Convert "manual" **subsubsection** sections to RST subsubsuctions
(^^^^^).

No textual changes.

Signed-off-by: George Dunlap <george.dunlap@citrix.com>
---
 ...-review-guide.md => code-review-guide.rst} | 153 +++++++++++-------
 source/index.rst                              |   1 +
 2 files changed, 97 insertions(+), 57 deletions(-)
 rename source/{code-review-guide.md => code-review-guide.rst} (79%)

diff --git a/source/code-review-guide.md b/source/code-review-guide.rst
similarity index 79%
rename from source/code-review-guide.md
rename to source/code-review-guide.rst
index ed4f9d6..9c0040e 100644
--- a/source/code-review-guide.md
+++ b/source/code-review-guide.rst
@@ -1,4 +1,5 @@
-# Code Review Guide
+Code Review Guide
+*****************
 
 This document highlights what reviewers such as maintainers and committers look
 for when reviewing your code. It sets expectations for code authors and provides
@@ -14,40 +15,46 @@ provides  pointers on code author's and reviewer's workflows.
 
 Sometimes it happens that a submitted patch series made wrong assumptions or has
 a flawed design or architecture. This can be frustrating for contributors and
-code  reviewers. Note that this document does contain [a section](#problems)
-that provides  suggestions on how to minimize the impact for most stake-holders
+code reviewers. Note that this document does contain `a section <problems_>`_
+that provides suggestions on how to minimize the impact for most stake-holders
 and also on how to avoid such situations.
 
 This document does **not cover** the following topics:
-* [Communication Best Practice][1]
-* [Resolving Disagreement][2]
-* [Patch Submission Workflow][3]
-* [Managing Patch Submission with Git][4]
 
-## What we look for in Code Reviews
+* :doc:`Communication Best Practice <communication-practice>`
+* :doc:`Resolving Disagreement <resolving-disagreement>`
+* `Patch Submission Workflow <3_>`_
+* `Managing Patch Submission with Git <4_>`_
+
+What we look for in Code Reviews
+================================
 
 When performing a code review, reviewers typically look for the following things
 
-### Is the change necessary to accomplish the goals?
+Is the change necessary to accomplish the goals?
+------------------------------------------------
 
 * Is it clear what the goals are?
 * Do we need to make a change, or can the goals be met with existing
   functionality?
 
-### Architecture / Interface
+Architecture / Interface
+------------------------
 
 * Is this the best way to solve the problem?
 * Is this the right part of the code to modify?
 * Is this the right level of abstraction?
 * Is the interface general enough? Too general? Forward compatible?
 
-### Functionality
+Functionality
+-------------
 
 * Does it do what it’s trying to do?
 * Is it doing it in the most efﬁcient way?
 * Does it handle all the corner / error cases correctly?
 
-### Maintainability / Robustness
+Maintainability / Robustness
+----------------------------
 
 * Is the code clear? Appropriately commented?
 * Does it duplicate another piece of code?
@@ -61,60 +68,75 @@ and/or robustness issues. In such cases, maintainers may ask you to make
 additional changes, such that your submitted code does not make things worse or
 point you to other patches are already being worked on.
 
-### System properties
+System properties
+-----------------
 
 In some areas of the code, system properties such as
+
 * Code size
 * Performance
 * Scalability
 * Latency
 * Complexity
 * &c
+
 are also important during code reviews.
 
-### Style
+Style
+-----
 
 * Comments, carriage returns, **snuggly braces**, &c
-* See [CODING_STYLE][5] and [tools/libxl/CODING_STYLE][6]
+* See `CODING_STYLE <5_>`_ and `tools/libxl/CODING_STYLE <6_>`_
 * No extraneous whitespace changes
 
-### Documentation and testing
+Documentation and testing
+-------------------------
 
 * If there is pre-existing documentation in the tree, such as man pages, design
   documents, etc. a contributor may be asked to update the documentation
-  alongside the change. Documentation is typically present in the [docs][7]
+  alongside the change. Documentation is typically present in the `docs <7_>`_
   folder.
 * When adding new features that have an impact on the end-user,
-  a contributor should include an update to the [SUPPORT.md][8] file.
+  a contributor should include an update to the `SUPPORT.md <8_>`_ file.
   Typically, more complex features require several patch series before it is
   ready to be advertised in SUPPORT.md
 * When adding new features, a contributor may be asked to provide tests or
   ensure that existing tests pass
 
-#### Testing for the Xen Project Hypervisor
+Testing for the Xen Project Hypervisor
+--------------------------------------
 
 Tests are typically located in one of the following directories
-* **Unit tests**: [tools/tests][9] or [xen/test][A]<br>
+
+* **Unit tests**: `tools/tests <9_>`_ or `xen/test <A_>`_
+
   Unit testing is hard for a system like Xen and typically requires building a
   subsystem of your tree. If your change can be easily unit tested, you should
   consider submitting tests with your patch.
-* **Build and smoke test**: see [Xen GitLab CI][B]<br>
+  
+* **Build and smoke test**: see `Xen GitLab CI <B_>`_
+  
   Runs build tests for a combination of various distros and compilers against
   changes committed to staging. Developers can join as members and test their
   development branches **before** submitting a patch.
-* **XTF tests** (microkernel-based tests): see [XTF][C]<br>
+  
+* **XTF tests** (microkernel-based tests): see `XTF <C_>`_
+  
   XTF has been designed to test interactions between your software and hardware.
   It is a very useful tool for testing low level functionality and is executed
   as part of the project's CI system. XTF can be easily executed locally on
   xen.git trees.
-* **osstest**: see [README][D]<br>
+  
+* **osstest**: see `README <D_>`_
+  
   Osstest is the Xen Projects automated test system, which tests basic Xen use
   cases on a variety of different hardware. Before changes are committed, but
   **after** they have been reviewed. A contributor’s changes **cannot be
   applied to master** unless the tests pass this test suite. Note that XTF and
   other tests are also executed as part of osstest.
 
-### Patch / Patch series information
+Patch / Patch series information
+--------------------------------
 
 * Informative one-line changelog
 * Full changelog
@@ -124,14 +146,16 @@ Tests are typically located in one of the following directories
 * Reviewed-by’s and Acked-by’s dropped if appropriate
 
 More information related to these items can be found in our
-[Patch submission Guide][E].
+`Patch submission Guide <E_>`_.
 
-## Code Review Workflow
+Code Review Workflow
+====================
 
 This section is important for code authors and reviewers. We recommend that in
 particular new code authors carefully read this section.
 
-### Workflow from a Reviewer's Perspective
+Workflow from a Reviewer's Perspective
+--------------------------------------
 
 Patch series typically contain multiple changes to the codebase, some
 transforming the same section of the codebase multiple times. It is quite common
@@ -147,7 +171,8 @@ Generally there are no hard rules on how to structure a series, as the structure
 of a series is very code specific and it is hard to give specific advice. There
 are some general tips which  help and some general patterns.
 
-**Tips:**
+Tips
+^^^^
 
 * Outline the thinking behind the structure of the patch series. This can make
   a huge difference and helps ensure that the code reviewer understands what the
@@ -161,7 +186,8 @@ are some general tips which  help and some general patterns.
   to learn the tools, code and deal with a large patch series all together for
   the first time.
 
-**General Patterns:**
+General Patterns
+^^^^^^^^^^^^^^^^
 
 If there are multiple subsystems involved in your series, then these are best
 separated out into **sets of patches**, which roughly follow the following
@@ -171,6 +197,7 @@ all subsystems (e.g. headers, macros, documentation) impacting all changed
 subsystems which ideally comes **before** subsystem specific changes.
 
 The seven categories typically making up a logical set of patches
+
 1. Cleanups and/or new Independent Helper Functions
 2. Reorganizations
 3. Headers, APIs, Documentation and anything which helps understand the
@@ -189,13 +216,15 @@ patches.
 If a series is structured this way, it is often possible to agree early on,
 that a significant portion of the changes are fine and to check these in
 independently of the rest of the patch series. This means that there is
+
 * Less work for authors to rebase
 * Less cognitive overhead for reviewers to review successive versions of a
   series
 * The possibility for different code reviewers to review portions of such
   large changes independently
 
-**Trade-Offs:**
+Trade-Offs
+^^^^^^^^^^
 
 * In some cases, following the general pattern above may create extra patches
   and may make a series more complex and harder to understand.
@@ -210,9 +239,12 @@ independently of the rest of the patch series. This means that there is
   the change** is back-ported, whereas general cleanups and improvements are
   not.
 
-**Example:**
-* [[PATCH v3 00/18] VM forking][H] is a complex patch series with an exemplary
+Example
+^^^^^^^
+
+* `[PATCH v3 00/18] VM forking <H_>`_ is a complex patch series with an exemplary
   cover letter. Notably, it contains the following elements
+  
   * It provides a description of the design goals and detailed description
     of the steps required to fork a VM.
   * A description of changes to the user interface
@@ -225,7 +257,8 @@ independently of the rest of the patch series. This means that there is
     rest of the series and **4** the substance of the series with additional
     information to make it easier for the reviewer to parse the series.
 
-### Workflow from an Author's Perspective
+Workflow from an Author's Perspective
+-------------------------------------
 
 When code authors receive feedback on their patches, they typically first try
 to clarify feedback they do not understand. For smaller patches or patch series
@@ -236,18 +269,22 @@ make sense to send out a new revision earlier.
 As a reviewer, you need some system that helps ensure that you address all
 review comments. This can be tedious when trying to map a hierarchical e-mail
 thread onto a code-base. Different people use different techniques from using
+
 * In-code TODO statements with comment snippets copied into the code
 * To keeping a separate TODO list
 * To printing out the review conversation tree and ticking off what has been
   addressed
 * A combination of the above
 
-### <a name="problems"></a>Problematic Patch Reviews
+.. _problems:
+
+Problematic Patch Reviews
+-------------------------
 
 A typical waterfall software development process is sequential with the
 following steps: define requirements, analyze, design, code, test and deploy.
 Problems uncovered by code review or testing at such a late stage can cause
-costly redesign and delays. The principle of **[Shift Left][D]** is to take a
+costly redesign and delays. The principle of `Shift Left`_ is to take a
 task that is traditionally performed at a late stage in the process and perform
 that task at earlier stages. The goal is to save time by avoiding refactoring.
 
@@ -271,43 +308,45 @@ separate difficult and easy portions of a patch series. This will enable
 reviewers to progress uncontroversial portions of a patch independently from
 controversial ones.
 
-### Reviewing for Patch Authors
+Reviewing for Patch Authors
+---------------------------
 
 The following presentation by George Dunlap, provides an excellent overview on
 how we do code reviews, specifically targeting non-maintainers.
 
 As a community, we would love to have more help reviewing, including from **new
 community members**. But many people
+
 * do not know where to start, or
 * believe that their review would not contribute much, or
 * may feel intimidated reviewing the code of more established community members
 
 The presentation demonstrates that you do not need to worry about any of these
 concerns. In addition, reviewing other people's patches helps you
+
 * write better patches and experience the code review process from the other
   side
 * and build more influence within the community over time
 
 Thus, we recommend strongly that **patch authors** read the watch the recording
 or read the slides:
-* [Patch Review for Non-Maintainers slides][F]
-* [Patch Review for Non-Maintainers recording - 20"][G]
-
-[1]: communication-practice.md
-[2]: resolving-disagreement.md
-[3]: https://wiki.xenproject.org/wiki/Submitting_Xen_Project_Patches
-[4]: https://wiki.xenproject.org/wiki/Managing_Xen_Patches_with_Git
-[5]: https://xenbits.xenproject.org/gitweb/?p=xen.git;a=blob;f=CODING_STYLE
-[6]: https://xenbits.xenproject.org/gitweb/?p=xen.git;a=blob;f=tools/libxl/CODING_STYLE
-[7]: https://xenbits.xenproject.org/gitweb/?p=xen.git;a=tree;f=docs
-[8]: https://xenbits.xenproject.org/gitweb/?p=xen.git;a=blob;f=SUPPORT.md
-[9]: https://xenbits.xenproject.org/gitweb/?p=xen.git;a=tree;f=tools/tests
-[A]: https://xenbits.xenproject.org/gitweb/?p=xen.git;a=tree;f=xen/test
-[B]: https://gitlab.com/xen-project/xen/pipelines
-[C]: https://xenbits.xenproject.org/docs/xtf/
-[D]: https://xenbits.xenproject.org/gitweb/?p=osstest.git;a=blob;f=README
-[E]: https://wiki.xenproject.org/wiki/Submitting_Xen_Project_Patches
-[D]: https://devopedia.org/shift-left
-[F]: https://www.slideshare.net/xen_com_mgr/xpdds19-keynote-patch-review-for-nonmaintainers-george-dunlap-citrix-systems-uk-ltd
-[G]: https://www.youtube.com/watch?v=ehZvBmrLRwg
-[H]: https://lists.xenproject.org/archives/html/xen-devel/2019-12/threads.html#02097
+
+* `Patch Review for Non-Maintainers slides <F_>`_
+* `Patch Review for Non-Maintainers recording - 20" <G_>`_
+
+.. _3: https://wiki.xenproject.org/wiki/Submitting_Xen_Project_Patches
+.. _4: https://wiki.xenproject.org/wiki/Managing_Xen_Patches_with_Git
+.. _5: https://xenbits.xenproject.org/gitweb/?p=xen.git;a=blob;f=CODING_STYLE
+.. _6: https://xenbits.xenproject.org/gitweb/?p=xen.git;a=blob;f=tools/libxl/CODING_STYLE
+.. _7: https://xenbits.xenproject.org/gitweb/?p=xen.git;a=tree;f=docs
+.. _8: https://xenbits.xenproject.org/gitweb/?p=xen.git;a=blob;f=SUPPORT.md
+.. _9: https://xenbits.xenproject.org/gitweb/?p=xen.git;a=tree;f=tools/tests
+.. _A: https://xenbits.xenproject.org/gitweb/?p=xen.git;a=tree;f=xen/test
+.. _B: https://gitlab.com/xen-project/xen/pipelines
+.. _C: https://xenbits.xenproject.org/docs/xtf/
+.. _D: https://xenbits.xenproject.org/gitweb/?p=osstest.git;a=blob;f=README
+.. _E: https://wiki.xenproject.org/wiki/Submitting_Xen_Project_Patches
+.. _Shift Left: https://devopedia.org/shift-left
+.. _F: https://www.slideshare.net/xen_com_mgr/xpdds19-keynote-patch-review-for-nonmaintainers-george-dunlap-citrix-systems-uk-ltd
+.. _G: https://www.youtube.com/watch?v=ehZvBmrLRwg
+.. _H: https://lists.xenproject.org/archives/html/xen-devel/2019-12/threads.html#02097
diff --git a/source/index.rst b/source/index.rst
index e0139fa..d1152c4 100644
--- a/source/index.rst
+++ b/source/index.rst
@@ -12,6 +12,7 @@ Welcome to XenProject Governance's documentation!
 
    code-of-conduct
    communication-guide
+   code-review-guide
 
 Indices and tables
 ==================
-- 
2.24.3 (Apple Git-128)


