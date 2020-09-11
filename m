Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 51E75265FAB
	for <lists+xen-devel@lfdr.de>; Fri, 11 Sep 2020 14:40:51 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kGiM2-0006h4-Oz; Fri, 11 Sep 2020 12:40:38 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vrAB=CU=citrix.com=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1kGiM1-0006gu-HB
 for xen-devel@lists.xenproject.org; Fri, 11 Sep 2020 12:40:37 +0000
X-Inumbo-ID: 8b275429-b684-4f38-8357-bb179e1de913
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 8b275429-b684-4f38-8357-bb179e1de913;
 Fri, 11 Sep 2020 12:40:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1599828036;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=E9jVzjewcHv8oSNd7zb4kMsDRgnBST4bkl0Ixsq38QY=;
 b=XnUrU6GQNFXZHEa/wO5mXO1fjYTTt/sqfpL7ppWxKqCCpgLeJ8p9N9IH
 J8Ji8PEqouH7f9HNupavHeDnagOoOUGtFi3m4DI8eZtxI67EgXUmw8/pe
 lKHByrgeaxK7Z1OMZswfCygd4vZHxO7Vn+xI567gAZ3M0s2YnQ072YilJ E=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: XuF3ypyX0E83P8EWuaTghwZqrfdb4XK77jdf8HFhWy9ULdSHs45FBLnA8f4LTGjiwoqvIrr7mw
 feOtRm/9Wq9bc+y4YLgvohiWa7+pMXohOupTT+1MZN+vPWFNTw+UZpScuEaCFr7v3MX0dm121J
 yD8p/ayOvbHRjnkZoD7/IMT2wM21cmv5wRWQkLPP/hs+uFcEAI+kqEGKKS8ILYo8WBGZ4srmWC
 2JyfoOkhAUnZKtb99p2eE2rY8uWj9OUHFD7SvFvzI8EDVwsmyUXdBkXc7q5kpIgQudYHGJOPI2
 Lkc=
X-SBRS: 2.7
X-MesageID: 27470677
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.76,415,1592884800"; d="scan'208";a="27470677"
From: George Dunlap <george.dunlap@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: George Dunlap <george.dunlap@citrix.com>, Ian Jackson
 <ian.jackson@citrix.com>, Wei Liu <wei.liu2@citrix.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Julien Grall <julien.grall@arm.com>,
 Paul Durrant <paul@xenproject.org>
Subject: [PATCH 0/8] Finding a home for the Code of Conduct
Date: Fri, 11 Sep 2020 13:40:01 +0100
Message-ID: <20200911124009.3760032-1-george.dunlap@citrix.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
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

The Code of Conduct has been approved [1]; now we need to find it a
home.  Since we've started using sphinx for the hypervisor documents,
I propose doing the same for the project-wide governance documents, starting
with the Code of Conduct.

This series takes Lars' code of conduct tree, written as individual MD
files, and puts them into the sphinx documentation system.  After this
series, if you run "make html" in the top-level directory, you'll get
the generated sphinx documentation in the build/ directory.

The finalized Code of Conduct documentation can be found at:

https://xenbits.xen.org/git-http/people/gdunlap/governance.git

This series can be found on the branch out/move-to-sphinx/v1

And a rendered version of the governance can be found here:

https://xenbits.xenproject.org/people/gdunlap/governance/

If there are no objections to this setup, I propose the following URL
as a long-term home:

https://xenbits.xenproject.org/governance

And also moving both the main governance doc [2] and the security
policy [3] into that system, to make it easier to update.

Thoughts?

[1] https://marc.info/?i=CB503BA1-979C-42E5-86C6-AFAB10C738DF@citrix.com%3E

[2] https://xenproject.org/developers/governance/

[3] https://xenproject.org/developers/security-policy/

CC: Ian Jackson <ian.jackson@citrix.com>
CC: Wei Liu <wei.liu2@citrix.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>
CC: Jan Beulich <jbeulich@suse.com>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Julien Grall <julien.grall@arm.com>
CC: Paul Durrant <paul@xenproject.org>

George Dunlap (8):
  Add basic sphinx structure
  Move docs into source directory, rename to rst
  Convert code-of-conduct to rst
  Convert communication-guide.md to rst
  Convert code-review-guide.md to rst
  Convert communication-practice.md to RST
  Convert resolving-disagreement.md to rst
  Clean up index page

 Makefile                                      |  20 ++
 .../code-of-conduct.rst                       |  39 ++-
 .../code-review-guide.rst                     | 154 ++++++----
 .../communication-guide.rst                   |  27 +-
 .../communication-practice.rst                | 289 +++++++++++-------
 source/conf.py                                |  54 ++++
 source/index.rst                              |  36 +++
 .../resolving-disagreement.rst                | 109 ++++---
 8 files changed, 495 insertions(+), 233 deletions(-)
 create mode 100644 Makefile
 rename code-of-conduct.md => source/code-of-conduct.rst (83%)
 rename code-review-guide.md => source/code-review-guide.rst (79%)
 rename communication-guide.md => source/communication-guide.rst (82%)
 rename communication-practice.md => source/communication-practice.rst (75%)
 create mode 100644 source/conf.py
 create mode 100644 source/index.rst
 rename resolving-disagreement.md => source/resolving-disagreement.rst (72%)

-- 
2.24.3 (Apple Git-128)


