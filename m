Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D22152B6D48
	for <lists+xen-devel@lfdr.de>; Tue, 17 Nov 2020 19:24:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.29206.58488 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kf5eh-0000NV-3y; Tue, 17 Nov 2020 18:24:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 29206.58488; Tue, 17 Nov 2020 18:24:39 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kf5eg-0000Mz-Vt; Tue, 17 Nov 2020 18:24:38 +0000
Received: by outflank-mailman (input) for mailman id 29206;
 Tue, 17 Nov 2020 18:24:37 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+dD8=EX=citrix.com=edvin.torok@srs-us1.protection.inumbo.net>)
 id 1kf5ef-0000JQ-4P
 for xen-devel@lists.xenproject.org; Tue, 17 Nov 2020 18:24:37 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1021ad91-c687-437e-bb8b-37f15fd9eb24;
 Tue, 17 Nov 2020 18:24:31 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=+dD8=EX=citrix.com=edvin.torok@srs-us1.protection.inumbo.net>)
	id 1kf5ef-0000JQ-4P
	for xen-devel@lists.xenproject.org; Tue, 17 Nov 2020 18:24:37 +0000
X-Inumbo-ID: 1021ad91-c687-437e-bb8b-37f15fd9eb24
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 1021ad91-c687-437e-bb8b-37f15fd9eb24;
	Tue, 17 Nov 2020 18:24:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1605637471;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=4HMvIBx0BI9P0e9tGOp3LfzAc3z+4o6/c/L/wV9Ft/A=;
  b=J0+UpsOG/fTGmgpotvsj/UAqJqiVo7Ygp2FoTEcJk/i7FwggeEogPYrA
   0a4pshEdQIHxYOnwokInzzVx0qY61Xvdd+PcTgELTV6EvHqkFDIKc8BQr
   ar7JykjHo+tXvd4fKSEDp1qkFs1FxHUsKgZyPn8toV96olMJUxQj+vioy
   U=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: yfjK8pbVZlS8xaoxMdLChXUuOw2PJlmlBBbqQb8r11PGMT8NegFwLaxXk/dJuzgwoURSX4J4eZ
 5qr/H0iuOUHpuH/ZBXP7oDwmOXQU4prMecmOTSJf2K9OjmKvlLzj/gR4qx34WuOJSSLh7OvP0q
 zr0Sf6RQhYn4NO/m5Hgc4DXoZN/2KGpZChVkcoYMmGaAOsHrGbrWckiuP5m3EBlumWnfcMNb1g
 HZFyDVq2NrmLnH6wbVs7uNRNw8FRhT5rPeg1YktZ+IO0AX5TAtlzqzrkIM8Kb3ZA/VdJnSvd4L
 51c=
X-SBRS: None
X-MesageID: 32508574
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.77,486,1596513600"; 
   d="scan'208";a="32508574"
From: =?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?= <edvin.torok@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: =?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?= <edvin.torok@citrix.com>, "Doug
 Goldstein" <cardoe@cardoe.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, Christian Lindig
	<christian.lindig@citrix.com>, David Scott <dave@recoil.org>
Subject: [PATCH v1 0/4] tools/ocaml/libs/xc: domid control at domain creation time
Date: Tue, 17 Nov 2020 18:24:08 +0000
Message-ID: <cover.1605636799.git.edvin.torok@citrix.com>
X-Mailer: git-send-email 2.18.4
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

The xl toolstack allows some control over the domid at VM creation time,
allow xenopsd similar control by exposing the appropriate domid field in the OCaml xenctrl bindings.
A new API function is introduced to preserve backwards compatibility without merge ordering
requirements between the Xen and xenopsd patches: Xen can merge the patch and xenopsd will keep
building with the old function, and a new version of xenopsd will start using the new function.

I've also included some build system fixes to allow me to test the build
in an upstream build environment:
```
cd automation/build
podman build -t registry.gitlab.com/xen-project/xen/ubuntu:focal -f ubuntu/focal.dockerfile ubuntu
DOCKER_CMD=podman CONTAINER_NO_PULL=1 CONTAINER=registry.gitlab.com/xen-project/xen/ubuntu:focal automation/scripts/containerize make build-tools-oxenstored
```

It'd be good if someone could test whether containerize still works on non-SELinux systems now, or
whether we need more detection logic in the script.

This works around bugs in the OCaml makefiles that end up in "inconsistent assumptions" by doing a
'make clean' before building the OCaml files every time. This is inefficient, but works.
Long term it would be beneficial to switch to Dune as build system,
which can do correct incremental builds with minimal configuration.
I'll send a separate patch series for that.

Edwin Török (4):
  automation/scripts/containerize: fix DOCKER_CMD=podman
  automation/: add Ubuntu:focal container
  Makefile: add build-tools-oxenstored
  tools/ocaml/libs/xc: backward compatible domid control at domain
    creation time

 Makefile                                 |  6 +++
 automation/build/ubuntu/focal.dockerfile | 50 ++++++++++++++++++++++++
 automation/scripts/containerize          |  7 ++--
 tools/ocaml/Makefile                     |  8 ++++
 tools/ocaml/libs/xc/xenctrl.ml           |  3 ++
 tools/ocaml/libs/xc/xenctrl.mli          |  2 +
 tools/ocaml/libs/xc/xenctrl_stubs.c      |  9 ++++-
 7 files changed, 80 insertions(+), 5 deletions(-)
 create mode 100644 automation/build/ubuntu/focal.dockerfile

-- 
2.18.4


