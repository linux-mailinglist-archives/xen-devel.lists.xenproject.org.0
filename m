Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E2EA3696BD
	for <lists+xen-devel@lfdr.de>; Fri, 23 Apr 2021 18:16:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.116483.222312 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZyTM-00083P-No; Fri, 23 Apr 2021 16:16:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 116483.222312; Fri, 23 Apr 2021 16:16:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZyTM-000830-KB; Fri, 23 Apr 2021 16:16:04 +0000
Received: by outflank-mailman (input) for mailman id 116483;
 Fri, 23 Apr 2021 16:16:03 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=c6bT=JU=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1lZyTL-00082q-LJ
 for xen-devel@lists.xenproject.org; Fri, 23 Apr 2021 16:16:03 +0000
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ac6f61ae-55fa-444b-ae3e-c0ade307ffcd;
 Fri, 23 Apr 2021 16:16:01 +0000 (UTC)
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
X-Inumbo-ID: ac6f61ae-55fa-444b-ae3e-c0ade307ffcd
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1619194561;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=dDCFhyMGhlNsdWpa1TqUP5aoaNLQNFAnHsrcPqvLhuk=;
  b=Dnr/+Dev2CbyDE+D3xKMqj8pBoi+rTV5/pgzdA1OjPaPpj+lVV69zLgp
   UFXhP0ty2/lJIk4pCNlTvgx0KyThnDPkHX34HaO6K0m28ilWvP4aPH54r
   Kh0PUACqSY+YrWSszmA7u7VNTrZfprFLI2KJEMcE4NJpuSjmRtvHVQf0U
   c=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: 2guKQ1orOlcDmPy9GM1f16suZS2o2KLH1sV/MnR0G3yW/pHVjy1WQFkCb86sGMjdp4cJKxY725
 esf3XWw+iJ1UG5G0OQy1kFGrXdYbFxmW3rU/NLb9q09HoWJ07As2RFoiMI/vOq9RtS5Q6Hk3Ry
 KWwWPfuw0r41q6NdgzZ6qIZBpvRl661uPEZVruMNmfq1p+2TKws0ebpxDQlzpRRBpsehi11TS4
 aier4G2VDy14k2lqXOWPvFFkUikqZNSM9aAxYNRJSDcLzjpKuUdjeN3gdZRuFXd1bzsw7FQZP0
 Mnw=
X-SBRS: 5.1
X-MesageID: 42285495
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:5E86fK1Q0KZA/3U78BySIwqjBFYkLtp033Aq2lEZdDV+WKWj+f
 yGtvIdyBPylXItQ3kmg9+NI+2tRnnb+J5z7+AqTNOfdSPhv3alK5wn0Jv6z1TbakvD38NUyK
 sISchDIfLqC1wSt6rHyS2ZN/pl/9Wd6qCvgo7lvhJQZCVncbtp4Qs8KivzKDwUeCB8CZA0FI
 WR66N8zlLKExkqR/+2G2UfWKz7r8DL/aiWBiIuPQIt6wWFkFqTiYLSLh7w5HgjegIK5b8j9G
 Tf+jaJhJmejw==
X-IronPort-AV: E=Sophos;i="5.82,246,1613451600"; 
   d="scan'208";a="42285495"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@citrix.com>, Ian Jackson
	<iwj@xenproject.org>, Wei Liu <wl@xen.org>
Subject: [XEN PATCH 0/8] Fix libxl with QEMU 6.0 + remove some more deprecated usages.
Date: Fri, 23 Apr 2021 17:15:50 +0100
Message-ID: <20210423161558.224367-1-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Patch series available in this git branch:
https://xenbits.xen.org/git-http/people/aperard/xen-unstable.git br.deprecated-qemu-qmp-and-cmd-v1

The Xen 4.15 release that went out just before QEMU 6.0 won't be compaptible
with the latter. This patch series fixes libxl to replace use of QMP commands
that have been removed from QEMU and to fix usage of deprecated command and
parameters that well be remove from QEMU in the future.

All of the series should be backported to at least Xen 4.15 or it won't be
possible to migrate, hotplug cpu or change cdrom on HVM guest when QEMU 6.0 and
newer is used. QEMU 6.0 is about to be release, within a week.

Backport: 4.15

Anthony PERARD (8):
  libxl: Replace deprecated QMP command by "query-cpus-fast"
  libxl: Replace QEMU's command line short-form boolean option
  libxl: Replace deprecated "cpu-add" QMP command by "device_add"
  libxl: Use -device for cd-rom drives
  libxl: Assert qmp_ev's state in qmp_ev_qemu_compare_version
  libxl: Export libxl__qmp_ev_qemu_compare_version
  libxl: Use `id` with the "eject" QMP command
  libxl: Replace QMP command "change" by "blockdev-change-media"

 tools/libs/light/libxl_disk.c     |  67 +++++++++--
 tools/libs/light/libxl_dm.c       |  30 +++--
 tools/libs/light/libxl_domain.c   | 190 ++++++++++++++++++++++++++++--
 tools/libs/light/libxl_internal.h |   8 ++
 tools/libs/light/libxl_qmp.c      |   6 +-
 5 files changed, 270 insertions(+), 31 deletions(-)

-- 
Anthony PERARD


