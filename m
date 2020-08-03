Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CC7B23AAF0
	for <lists+xen-devel@lfdr.de>; Mon,  3 Aug 2020 18:53:34 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k2dhz-0000Ml-Tr; Mon, 03 Aug 2020 16:53:07 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Dd1b=BN=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1k2dhy-0000Lq-Bq
 for xen-devel@lists.xenproject.org; Mon, 03 Aug 2020 16:53:06 +0000
X-Inumbo-ID: cc940268-d5a9-11ea-90ad-bc764e2007e4
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id cc940268-d5a9-11ea-90ad-bc764e2007e4;
 Mon, 03 Aug 2020 16:53:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1596473585;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=qUEzT/sythxNJ9sGpLp+qH5wmPU56dvfrIxZ3Qy2z3c=;
 b=BqeI4v5NTx3zl8AJtVKibCRO6SAhloXxc9MMwcmN9Qy5G4Hszyj5bpQj
 ni947T/JFWJQ7TqDzVZ02wRunpXZttuTvrKk+eKyObDDFJLYnhgYhAoJx
 Ngw6EfBC7IUzIy7Tmi/qZPk6U3g6+rnzr7hN9VD6fQGzw3HPX7M4Fj5IR E=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: Hs8xDfMQ8nyk+/4NscBbN7hK37UarIUXmgFSJxkAi2tcwAHYMYp0cMsfQwhouMF5pAnfi1xWv1
 dOG1ygyAZdGvaL5BcbMAeVBkVY3OqVTXE5R+/r6tP19JlyXRUPvBT0E8HZSHdCLXMMpAyHBhYu
 6GaPljbE5m3QcoAlEmh66MNNzO2R5dD99GvpB000qX0zt3k/e3XveVApjzhwMOL1ahkOeLwh4i
 fAbtOfz7Xo741x4nrVNSn0S1RaIR1shXFDHO9GbHMZ8nAzoerHiXpZB2RIoVzXfCmAVCLRa8Ah
 6Hc=
X-SBRS: 3.7
X-MesageID: 23750296
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.75,430,1589256000"; d="scan'208";a="23750296"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <qemu-devel@nongnu.org>
Subject: [PULL 0/1] xen queue 2020-08-03
Date: Mon, 3 Aug 2020 17:52:50 +0100
Message-ID: <20200803165251.907213-1-anthony.perard@citrix.com>
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

The following changes since commit 45a150aa2b3492acf6691c7bdbeb25a8545d8345:

  Merge remote-tracking branch 'remotes/ericb/tags/pull-bitmaps-2020-08-03' into staging (2020-08-03 15:13:49 +0100)

are available in the Git repository at:

  https://xenbits.xen.org/git-http/people/aperard/qemu-dm.git tags/pull-xen-20200803

for you to fetch changes up to b3fcc98f391e9a60a369d825333b852871cf67b0:

  accel/xen: Fix xen_enabled() behavior on target-agnostic objects (2020-08-03 17:39:38 +0100)

----------------------------------------------------------------
xen patches

bug fix

----------------------------------------------------------------
Philippe Mathieu-Daudé (1):
      accel/xen: Fix xen_enabled() behavior on target-agnostic objects

 include/sysemu/xen.h | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

