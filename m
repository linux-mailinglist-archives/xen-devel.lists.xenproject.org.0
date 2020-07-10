Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3327321B603
	for <lists+xen-devel@lfdr.de>; Fri, 10 Jul 2020 15:13:01 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jtson-0007gs-PX; Fri, 10 Jul 2020 13:11:57 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=q6aM=AV=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1jtsom-0007gn-Vj
 for xen-devel@lists.xenproject.org; Fri, 10 Jul 2020 13:11:57 +0000
X-Inumbo-ID: edb5fea0-c2ae-11ea-bca7-bc764e2007e4
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id edb5fea0-c2ae-11ea-bca7-bc764e2007e4;
 Fri, 10 Jul 2020 13:11:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1594386716;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=jaVFTTx2HNGKf3JgEbZLbjj1J2bUpC47ifE5uMvXHoA=;
 b=JtpcWXhtNaouckQzlF/J/ouHl9WETwBX7nnSqH3mpHH8LpirOzcAdQht
 qZG2l0ixzYgw9U0tw1iUnW11lnQDgyc55Bk6smCG/GZTIWzPI1Vn4KnNv
 rmANPIFs3RSYLxiI9O1xqCidsCMUvyt2E9osGabrflMVBQjfXrH/1YuIl w=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: Kx/E3xb/iLQiWYXFukk0rCEoznEszOCzONcTv7LJ5UGbxDQ+Ev4/7IbcDUTP+bIzi7/wEt+zLk
 dxNZe0/FZZMJqWHfJBn+u7McrVUA3G3lDufYiy22nGJ7LrSm6/ChmcmxNClRQtbSNxcMP870az
 +XKD9wrO5VhaEA1X4Op/NROAEiLFVPt06dzZ6tJ4YYmd1Wnd0aRTR8uhD0SvaBSh1mMZUTJ0l1
 4Bm0uwOJeAiaz9QmecWPrkqZSrgTsSRzfvd/bw5iK90WFjLXYsL6ujMzOow4yxa95SRVbDC6pd
 YDc=
X-SBRS: 2.7
X-MesageID: 22265261
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.75,335,1589256000"; d="scan'208";a="22265261"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <qemu-devel@nongnu.org>
Subject: [PULL 0/2] xen queue 2020-07-10
Date: Fri, 10 Jul 2020 14:11:43 +0100
Message-ID: <20200710131145.589476-1-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
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
Cc: Anthony PERARD <anthony.perard@citrix.com>,
 Peter Maydell <peter.maydell@linaro.org>, xen-devel@lists.xenproject.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

The following changes since commit b6d7e9b66f59ca6ebc6e9b830cd5e7bf849d31cf:

  Merge remote-tracking branch 'remotes/stefanha/tags/tracing-pull-request' into staging (2020-07-10 09:01:28 +0100)

are available in the Git repository at:

  https://xenbits.xen.org/git-http/people/aperard/qemu-dm.git tags/pull-xen-20200710

for you to fetch changes up to dd29b5c30cd2a13f8c12376a8de84cb090c338bf:

  xen: cleanup unrealized flash devices (2020-07-10 13:49:16 +0100)

----------------------------------------------------------------
xen patches

Fixes following harden checks in qdev.

----------------------------------------------------------------
Jason Andryuk (1):
      xen: Fix xen-legacy-backend qdev types

Paul Durrant (1):
      xen: cleanup unrealized flash devices

 hw/i386/pc_piix.c           | 9 ++++++---
 hw/i386/pc_sysfw.c          | 2 +-
 hw/xen/xen-legacy-backend.c | 4 ++--
 include/hw/i386/pc.h        | 1 +
 4 files changed, 10 insertions(+), 6 deletions(-)

