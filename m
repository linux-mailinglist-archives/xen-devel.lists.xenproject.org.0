Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DF4FB5854C8
	for <lists+xen-devel@lfdr.de>; Fri, 29 Jul 2022 19:54:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.377689.611011 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oHUBk-0007Sb-0D; Fri, 29 Jul 2022 17:54:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 377689.611011; Fri, 29 Jul 2022 17:54:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oHUBj-0007Or-TC; Fri, 29 Jul 2022 17:54:15 +0000
Received: by outflank-mailman (input) for mailman id 377689;
 Fri, 29 Jul 2022 17:54:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UihI=YC=citrix.com=prvs=202bfa127=edvin.torok@srs-se1.protection.inumbo.net>)
 id 1oHUBh-0006Zx-VL
 for xen-devel@lists.xenproject.org; Fri, 29 Jul 2022 17:54:14 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 733f9859-0f67-11ed-bd2d-47488cf2e6aa;
 Fri, 29 Jul 2022 19:54:12 +0200 (CEST)
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
X-Inumbo-ID: 733f9859-0f67-11ed-bd2d-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1659117252;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=jYUpkCH0YPQ/TyAwVFBI7seeyuP9yv7VtxJJX+EU6Zw=;
  b=UwsX1ru+o5XospM6vULUddGZvwBEKhvpxjj3oaDkhO+QoWYRX9jjGvf+
   OFnTZQ3ILzlm/d6lyaWQl1juwc6W2bslk0Xoy0Y/4UNHUGnM9ygPqfND8
   +lqyoLuZkR053whFQyst3FdPtwB3EquczPr2fttGOQojocwV8LMV0hGi1
   A=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 2.7
X-MesageID: 76956049
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:dplDyKnt940yuGSnS2O3BYbo5gylJkRdPkR7XQ2eYbSJt1+Wr1Gzt
 xIcXG/VOauCZGb1eNpyPd+y9BgA7Z6HmtA2GgJv+X9jFSMWpZLJC+rCIxarNUt+DCFioGGLT
 Sk6QoOdRCzhZiaE/n9BCpC48T8mk/ngqoPUUIbsIjp2SRJvVBAvgBdin/9RqoNziJ2yDhjlV
 ena+qUzA3f4nW8vWo4ow/jb8kk3466j4GlwUmEWPpingnePzxH5M7pHTU2BByOQapVZGOe8W
 9HCwNmRlo8O105wYj8Nuu+TnnwiGtY+DyDX4pZlc/HKbix5jj4zys4G2M80Mi+7vdkrc+dZk
 72hvbToIesg0zaldO41C3G0GAkmVUFKFSOuzdFSfqV/wmWfG0YAzcmCA2loIIBBpt1ZH1oT7
 OdDL20oNj2J2duflefTpulE3qzPLeHuNYIb/Hph0SvYHbAtRpWrr6fivIECmm1q34YXQKiYN
 5FxhTlHNXwsZzVCNkkWDtQim/2vhVH0ciFCqULTrq0yi4TW5FMvgeWzaIaEEjCMbcdcxkSzv
 mfDw0j4HRUmCeyczzuL21v504cjmgukAdlPRdVU7MVCn1m71mEVThoMWjOTo+S9i0O4c8JSL
 QoT4CVGhbMp6EWhQ935Xhu5iH2JpBgRX5xXCeJSwBGAzO/Y7hiUAkAATyVdc5o2uckuXzso2
 1SV2dTzClRHvLSLRFqH+7yTrDf0PjIaRUcAbyIZSQoO4/H4vZo+yBnIS75e/LWd14OvX2uqm
 nbT8XZ41+57YdM3O7uTo03K2m6XiIbyExcuvQKKezqI5F1ATdvwD2C30mQ3/cqsPa7AEATQ5
 CVVxpDPhAwdJcrTzXLQGY3hCJnsvq/Ya2OE3DaDCrF7r1yQF2ifkZe8Cd2UDGNgKY46dDDge
 yc/UisBtcYIbBNGgUKaCr9d6vjGLoC6TLwJrtiOMrJzjmFZLWdrBh1Ga0+KxHzKm0Mxi6w5M
 przWZ/yUCdCUv88nGbpHbh1PVoXKscWnDm7eHwG507/jer2iIC9Et/pz2dinshmtfjZ8W05A
 v5UNteQygU3bdASlhL/qNdLRXhXfCdTOHwDg5YIHgJ1ClY5RTpJ5j646e9JRrGJaIwPyr6Rr
 inmBhIwJZiWrSSvFDhmo0tLMNvHNauTZ1piVcDwFT5EA0QeXLs=
IronPort-HdrOrdr: A9a23:iOGbU6uSE0DXcV/R07ZdsxEF7skDetV00zEX/kB9WHVpmszxra
 6TdZMgpHjJYVcqKRUdcL+7WJVoLUmxyXcX2/h1AV7BZniEhILAFugLhuGO/9SJIVyZygc378
 ZdmsZFZ+EYdWIK7/rH3A==
X-IronPort-AV: E=Sophos;i="5.93,201,1654574400"; 
   d="scan'208";a="76956049"
From: =?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?= <edvin.torok@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: =?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?= <edvin.torok@citrix.com>, "Christian
 Lindig" <christian.lindig@citrix.com>, David Scott <dave@recoil.org>, Wei Liu
	<wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, "Jan
 Beulich" <jbeulich@suse.com>, Julien Grall <julien@xen.org>, "Stefano
 Stabellini" <sstabellini@kernel.org>
Subject: [PATCH v1 0/7] tools/ocaml code and build cleanups
Date: Fri, 29 Jul 2022 18:53:23 +0100
Message-ID: <cover.1659116941.git.edvin.torok@citrix.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Various OCaml code cleanups to make building and working on Oxenstored easier,
including compatibility with newer language versions.
This does not yet change the minimum version of OCaml.

A version of this series in a git repository is publicly available at:
https://github.com/edwintorok/xen.git
https://github.com/edwintorok/xen/compare/private/edvint/public?expand=1

Edwin Török (7):
  tools/ocaml/Makefile: do not run ocamldep during make clean
  tools/ocaml/*/Makefile: generate paths.ml from configure
  tools/ocaml/*/dune: dune based build system
  tools/ocaml: Makefile to drive dune
  tools/ocaml: fix compiler warnings
  tools/ocaml/libs/xb: hide type of Xb.t
  tools/ocaml/libs/eventchn: do not leak event channels and OCaml 5.0
    compat

 Makefile                                      |  5 ++
 tools/.gitignore                              |  7 ++
 tools/configure                               |  4 +-
 tools/configure.ac                            |  2 +
 tools/dune                                    |  5 ++
 tools/dune-project                            |  1 +
 tools/ocaml/Makefile.dune                     | 88 +++++++++++++++++++
 tools/ocaml/Makefile.rules                    |  2 +
 tools/ocaml/dune-project                      | 27 ++++++
 tools/ocaml/dune-workspace.dev.in             |  2 +
 tools/ocaml/dune-workspace.in                 | 18 ++++
 tools/ocaml/libs/eventchn/dune                | 11 +++
 tools/ocaml/libs/eventchn/xeneventchn_stubs.c | 29 +++++-
 tools/ocaml/libs/mmap/dune                    |  9 ++
 tools/ocaml/libs/xb/dune                      | 10 +++
 tools/ocaml/libs/xb/xb.ml                     |  3 +
 tools/ocaml/libs/xb/xb.mli                    |  9 +-
 tools/ocaml/libs/xc/dune                      | 16 ++++
 tools/ocaml/libs/xs/Makefile                  |  5 --
 tools/ocaml/libs/xs/dune                      | 15 ++++
 tools/ocaml/libs/xs/paths.ml.in               |  1 +
 tools/ocaml/xenstored/Makefile                |  5 --
 tools/ocaml/xenstored/connection.ml           | 10 +--
 tools/ocaml/xenstored/dune                    | 51 +++++++++++
 tools/ocaml/xenstored/paths.ml.in             |  4 +
 tools/ocaml/xenstored/process.ml              |  5 +-
 26 files changed, 315 insertions(+), 29 deletions(-)
 create mode 100644 tools/.gitignore
 create mode 100644 tools/dune
 create mode 100644 tools/dune-project
 create mode 100644 tools/ocaml/Makefile.dune
 create mode 100644 tools/ocaml/dune-project
 create mode 100644 tools/ocaml/dune-workspace.dev.in
 create mode 100644 tools/ocaml/dune-workspace.in
 create mode 100644 tools/ocaml/libs/eventchn/dune
 create mode 100644 tools/ocaml/libs/mmap/dune
 create mode 100644 tools/ocaml/libs/xb/dune
 create mode 100644 tools/ocaml/libs/xc/dune
 create mode 100644 tools/ocaml/libs/xs/dune
 create mode 100644 tools/ocaml/libs/xs/paths.ml.in
 create mode 100644 tools/ocaml/xenstored/dune
 create mode 100644 tools/ocaml/xenstored/paths.ml.in

-- 
2.34.1


