Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 36CE4197DC0
	for <lists+xen-devel@lfdr.de>; Mon, 30 Mar 2020 16:01:03 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jIuvD-0002Ws-QA; Mon, 30 Mar 2020 13:57:47 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=UV6F=5P=chiark.greenend.org.uk=ijackson@srs-us1.protection.inumbo.net>)
 id 1jIuvC-0002Wn-GA
 for xen-devel@lists.xenproject.org; Mon, 30 Mar 2020 13:57:46 +0000
X-Inumbo-ID: 6e9629b2-728e-11ea-b4f4-bc764e2007e4
Received: from chiark.greenend.org.uk (unknown [2001:ba8:1e3::])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6e9629b2-728e-11ea-b4f4-bc764e2007e4;
 Mon, 30 Mar 2020 13:57:45 +0000 (UTC)
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
 by chiark.greenend.org.uk (Debian Exim 4.84_2 #1) with esmtp
 (return-path ijackson@chiark.greenend.org.uk)
 id 1jIuvA-0007Qg-Pg; Mon, 30 Mar 2020 14:57:44 +0100
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: xen-devel@lists.xenproject.org
Date: Mon, 30 Mar 2020 14:57:32 +0100
Message-Id: <20200330135735.31512-1-ian.jackson@eu.citrix.com>
X-Mailer: git-send-email 2.11.0
Subject: [Xen-devel] [PATCH 0/3] docs: Fix our url schemes to use https
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
Cc: Juergen Gross <jgross@suse.com>, Kevin Tian <kevin.tian@intel.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Jun Nakajima <jun.nakajima@intel.com>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ross Lagerwall <ross.lagerwall@citrix.com>, ian.jackson@eu.citrix.com,
 George Dunlap <george.dunlap@citrix.com>,
 Anthony PERARD <anthony.perard@citrix.com>,
 Yang Hongyang <imhy.yang@gmail.com>, Jan Beulich <jbeulich@suse.com>,
 Shriram Rajagopalan <rshriram@cs.ubc.ca>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Daniel De Graaf <dgdegra@tycho.nsa.gov>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Obviously we should be publishing https: URLs instead of http: ones
where possible.  I have not changed URLs referring to other projects
at this stage because that would have involved checking whether
https:// works for them.

Ian Jackson (3):
  docs etc.: https: Fix references to wiki.xen[project.org
  docs etc.: https: Fix references to other Xen pages
  docs/README: Fix a broken url

 README                               | 24 ++++++++++++------------
 SUPPORT.md                           |  2 +-
 config/Paths.mk.in                   |  2 +-
 configure                            |  6 +++---
 configure.ac                         |  2 +-
 docs/README.colo                     |  2 +-
 docs/README.remus                    |  2 +-
 docs/configure                       |  6 +++---
 docs/configure.ac                    |  2 +-
 docs/misc/9pfs.pandoc                |  4 ++--
 docs/misc/livepatch.pandoc           |  4 ++--
 docs/misc/pvcalls.pandoc             |  6 +++---
 docs/misc/stubdom.txt                |  2 +-
 docs/misc/vtd.txt                    |  2 +-
 docs/misc/xen-command-line.pandoc    |  4 ++--
 docs/misc/xenstore-paths.pandoc      | 22 +++++++++++-----------
 docs/misc/xenstore.txt               |  2 +-
 docs/misc/xsm-flask.txt              |  4 ++--
 docs/process/branching-checklist.txt |  2 +-
 stubdom/configure                    |  6 +++---
 stubdom/configure.ac                 |  2 +-
 tools/configure                      |  6 +++---
 tools/configure.ac                   |  2 +-
 tools/libxl/libxlu_cfg.c             |  2 +-
 xen/arch/x86/hvm/vmx/vmx.c           |  2 +-
 xen/include/public/io/blkif.h        |  2 +-
 26 files changed, 61 insertions(+), 61 deletions(-)

-- 
2.11.0



Ian Jackson (3):
  docs etc.: https: Fix references to wiki.xen[project.org
  docs etc.: https: Fix references to other Xen pages
  docs/README: Fix a broken url

 README                               | 24 ++++++++++++------------
 SUPPORT.md                           |  2 +-
 config/Paths.mk.in                   |  2 +-
 configure                            |  6 +++---
 configure.ac                         |  2 +-
 docs/README.colo                     |  2 +-
 docs/README.remus                    |  2 +-
 docs/configure                       |  6 +++---
 docs/configure.ac                    |  2 +-
 docs/misc/9pfs.pandoc                |  4 ++--
 docs/misc/livepatch.pandoc           |  4 ++--
 docs/misc/pvcalls.pandoc             |  6 +++---
 docs/misc/stubdom.txt                |  2 +-
 docs/misc/vtd.txt                    |  2 +-
 docs/misc/xen-command-line.pandoc    |  4 ++--
 docs/misc/xenstore-paths.pandoc      | 22 +++++++++++-----------
 docs/misc/xenstore.txt               |  2 +-
 docs/misc/xsm-flask.txt              |  4 ++--
 docs/process/branching-checklist.txt |  2 +-
 stubdom/configure                    |  6 +++---
 stubdom/configure.ac                 |  2 +-
 tools/configure                      |  6 +++---
 tools/configure.ac                   |  2 +-
 tools/libxl/libxlu_cfg.c             |  2 +-
 xen/arch/x86/hvm/vmx/vmx.c           |  2 +-
 xen/include/public/io/blkif.h        |  2 +-
 26 files changed, 61 insertions(+), 61 deletions(-)

-- 
2.11.0


