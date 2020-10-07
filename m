Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FD202858BF
	for <lists+xen-devel@lfdr.de>; Wed,  7 Oct 2020 08:38:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.3323.9637 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kQ35U-0004OP-C9; Wed, 07 Oct 2020 06:38:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 3323.9637; Wed, 07 Oct 2020 06:38:08 +0000
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
	id 1kQ35U-0004O0-8p; Wed, 07 Oct 2020 06:38:08 +0000
Received: by outflank-mailman (input) for mailman id 3323;
 Wed, 07 Oct 2020 06:38:07 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Gg45=DO=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1kQ35T-0004Nv-9H
 for xen-devel@lists.xenproject.org; Wed, 07 Oct 2020 06:38:07 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8a43d072-2c2f-4b4b-9788-8784ce87e081;
 Wed, 07 Oct 2020 06:38:05 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 16D46AC0C;
 Wed,  7 Oct 2020 06:38:05 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=Gg45=DO=suse.com=jgross@srs-us1.protection.inumbo.net>)
	id 1kQ35T-0004Nv-9H
	for xen-devel@lists.xenproject.org; Wed, 07 Oct 2020 06:38:07 +0000
X-Inumbo-ID: 8a43d072-2c2f-4b4b-9788-8784ce87e081
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 8a43d072-2c2f-4b4b-9788-8784ce87e081;
	Wed, 07 Oct 2020 06:38:05 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1602052685;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=3kOyoKtsiwS+tjIZ6dzqH1KCmgJdwgCsiyneWCC8R6M=;
	b=avIV58ZPj1GRAdoykPhUo3Pb+VuebfM0SYxiddm2n+p0Cvd77cb6VdKI7RCVOsx232QccN
	jcxMzjWOhbuYQMQdUmP6lUEzjthAElIa36MGYYx42V3FgYU67XNi6sminKmixQ4fV01Wwu
	SbYRFgneC0vPBvNzoU/ByaqpJ96KozU=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 16D46AC0C;
	Wed,  7 Oct 2020 06:38:05 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: torvalds@linux-foundation.org
Cc: linux-kernel@vger.kernel.org,
	xen-devel@lists.xenproject.org,
	boris.ostrovsky@oracle.com
Subject: [GIT PULL] xen: branch for v5.9-rc9
Date: Wed,  7 Oct 2020 08:38:04 +0200
Message-Id: <20201007063804.21597-1-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Linus,

Please git pull the following tag:

 git://git.kernel.org/pub/scm/linux/kernel/git/xen/tip.git for-linus-5.9b-rc9-tag

xen: branch for v5.9-rc9

It contains one fix for a regression when booting as a Xen guest on
ARM64 introduced probably during the 5.9 cycle. It is very low risk as
it is modifying Xen specific code only. The exact commit introducing
the bug hasn't been identified yet, but everything was fine in 5.8 and
only in 5.9 some configurations started to fail.


Thanks.

Juergen

 arch/arm/xen/enlighten.c | 2 +-
 include/xen/arm/page.h   | 3 +++
 2 files changed, 4 insertions(+), 1 deletion(-)

Masami Hiramatsu (1):
      arm/arm64: xen: Fix to convert percpu address to gfn correctly

