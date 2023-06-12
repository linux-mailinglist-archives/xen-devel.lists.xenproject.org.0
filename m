Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B12B72CB2D
	for <lists+xen-devel@lfdr.de>; Mon, 12 Jun 2023 18:13:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.547360.854728 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q8kAf-0002uo-Hz; Mon, 12 Jun 2023 16:13:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 547360.854728; Mon, 12 Jun 2023 16:13:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q8kAf-0002sR-DG; Mon, 12 Jun 2023 16:13:33 +0000
Received: by outflank-mailman (input) for mailman id 547360;
 Mon, 12 Jun 2023 16:13:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=abQ6=CA=citrix.com=prvs=520cb9a4c=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1q8kAd-0002qf-Ns
 for xen-devel@lists.xenproject.org; Mon, 12 Jun 2023 16:13:31 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 107476d3-093c-11ee-8611-37d641c3527e;
 Mon, 12 Jun 2023 18:13:29 +0200 (CEST)
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
X-Inumbo-ID: 107476d3-093c-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1686586408;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=LnylG9GKIeMaBr8coy+QDP81rdQ4PrwAB/g/UXeyp2Y=;
  b=BBGFGdSSV2G09e5LaBbEeQe3ahoLSNPzx5GaNk7UOaxyfyF1UkS6l7Du
   PZjx5ZRK+22wmxl9kPrFegBxdGUNQ7tDJ8uENzBbYYahXCUOeojGeQ22g
   o6ehihQ7nLYQRgMULeSlzMr3df8G1g8xRJIyLZ8Lo9++cDf9qzEy1iAWX
   s=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 111816752
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:NrH9Z6kVP4xDYKL7z6XXfiPo5gz7JkRdPkR7XQ2eYbSJt1+Wr1Gzt
 xIWCm2Ba62LM2fweIgjPYXi9E8BuZCAyYJkTQZk/ys1ECMWpZLJC+rCIxarNUt+DCFhoGFPt
 JxCN4aafKjYaleG+39B55C49SEUOZmgH+a6U6icfHgqH2eIcQ954Tp7gek1n4V0ttawBgKJq
 LvartbWfVSowFaYCEpNg064gE0p5KyaVA8w5ARkPqgV5QWGzRH5MbpETU2PByqgKmVrNrbSq
 9brlNmR4m7f9hExPdKp+p6TnpoiG+O60aCm0xK6aoD66vRwjnVaPpUTbZLwXXx/mTSR9+2d/
 f0W3XCGpaXFCYWX8AgVe0Ew/yiTpsSq8pefSZS0mZT7I0Er7xIAahihZa07FdRwxwp5PY1B3
 ccmORULaCqGvuSJx+qRcqpi3sU+EMa+aevzulk4pd3YJfMvQJSFSKTW/95Imjw3g6iiH96HO
 ZBfM2A2Kk2dPVsWYAx/5JEWxY9EglHWdTFCpU3Tjq0w+2XJlyR60aT3McqTcduPLSlQth/B/
 zKfoTukWHn2MvSO5wHUyU2un9Tktj+8CK8qFrej/NdD1Qj7Kms7V0RNCArTTeOCol6zXZdTJ
 lIZ/gIqrLMu7wq7Q9/lRRq6rXWY+BkGVLJ4Mcc39QWMwar8+BuCCy4PSTspQMMinN87Q3otz
 FDhoj/yLWUx6vvPEyvbr+rK62roYkD5MFPuewc/cxog5d/Zpbg1sRWXZO4gHva0k+H6TGSYL
 y+xkMQuu1kCpZdVh/vhrQuc0m/ESovhFVBsuFiONo6xxkYgPdP+OdT1gbTOxawYRLt1WGVtq
 5TtdyK2yOkVRa+AmyWWKAnmNOH4vq3VWNEwbLMGInXAy9hO0yT5FWyoyGsiTHqFy+5dEdMTX
 GfduBlK+LhYN2awYKl8buqZUpp6k/W4RYi9B6iIMLKih6SdkyfdpUlTibO4hTixwCDAb4liU
 XtkTSpcJSlDUvk2pNZHb+wczaUq1kgDKZD7HPjGI+Cc+ePGPha9EO5VWGZim8hltMtoVi2Jq
 YcAXyZLoj0DONDDjt7/q95DdA1bcSJqWfgbaaV/L4a+H+avI0l5Y9e5/F/rU9YNc3h9/gsQw
 kyAZw==
IronPort-HdrOrdr: A9a23:a9Zk0aDzhDRE213lHelo55DYdb4zR+YMi2TDt3oddfU1SL38qy
 nKpp4mPHDP5wr5NEtPpTniAtjjfZq/z/5ICOAqVN/PYOCPggCVxepZnOjfKlPbehEX9oRmpN
 1dm6oVMqyMMbCt5/yKnDVRELwbsaa6GLjDv5a785/0JzsaE52J6W1Ce2GmO3wzfiZqL7wjGq
 GR48JWzgDQAkj+PqyAdx84t/GonayzqK7b
X-Talos-CUID: =?us-ascii?q?9a23=3AQ/Cm4mmGBijFY8KI3mFLLj3mJtXXOUbj3VLWJXW?=
 =?us-ascii?q?9MGBWT+W/cRyeoKJ5r8U7zg=3D=3D?=
X-Talos-MUID: =?us-ascii?q?9a23=3AJv4RCA+/meLzzHGxctkdl6qQf9ZG2PWVN0IUqr4?=
 =?us-ascii?q?tp47UGBRyMSyXpR3iFw=3D=3D?=
X-IronPort-AV: E=Sophos;i="6.00,236,1681185600"; 
   d="scan'208";a="111816752"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH v3 0/4] x86: RSBA and RRSBA handling
Date: Mon, 12 Jun 2023 17:13:02 +0100
Message-ID: <20230612161306.2739572-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

This series deals with the hanlding of the RSBA and RRSBA bits across all
parts and all mistakes encountered in various microcode versions.

There are only minor changes from v2.  See patches for details.

Andrew Cooper (4):
  x86/spec-ctrl: Use a taint for CET without MSR_SPEC_CTRL
  x86/spec-ctrl: Rename retpoline_safe() to retpoline_calculations()
  x86/spec-ctrl: Fix up the RSBA/RRSBA bits as appropriate
  x86/cpu-policy: Derive RSBA/RRSBA for guest policies

 xen/arch/x86/cpu-policy.c                   |  39 ++++++
 xen/arch/x86/include/asm/cpufeature.h       |   1 +
 xen/arch/x86/spec_ctrl.c                    | 142 +++++++++++++++++---
 xen/common/kernel.c                         |   2 +-
 xen/include/public/arch-x86/cpufeatureset.h |   4 +-
 xen/tools/gen-cpuid.py                      |   5 +-
 6 files changed, 170 insertions(+), 23 deletions(-)

-- 
2.30.2


