Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 65E6C2DED84
	for <lists+xen-devel@lfdr.de>; Sat, 19 Dec 2020 07:33:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.56791.99524 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kqVmK-0000sh-Oe; Sat, 19 Dec 2020 06:31:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 56791.99524; Sat, 19 Dec 2020 06:31:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kqVmK-0000sI-LR; Sat, 19 Dec 2020 06:31:44 +0000
Received: by outflank-mailman (input) for mailman id 56791;
 Sat, 19 Dec 2020 06:31:42 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=9pMo=FX=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1kqVmI-0000sD-Ef
 for xen-devel@lists.xenproject.org; Sat, 19 Dec 2020 06:31:42 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b185061e-9cfc-4b47-8b35-55b13241d1e0;
 Sat, 19 Dec 2020 06:31:37 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id D5D98ACC4;
 Sat, 19 Dec 2020 06:31:36 +0000 (UTC)
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
X-Inumbo-ID: b185061e-9cfc-4b47-8b35-55b13241d1e0
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1608359496; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=W7It98Z0GUNNQl0L2v0ZRaWFiumpgvCVR6+DzhT4F3M=;
	b=mOHEYBPDHlpDsNSxc4JotGLnoUNOhKzH8M9LGngwgAK5QrkicMt6V2FAeTLYrZhxHNbm0g
	OW36HhK3pRLCtR7v7ZClx8626x+UDRl+i4lFHGrJOR1DrFNKwGvHakwNZLg8EEek/ozJZ+
	HHRYT3bIpLlmbCnmrpa6Z0eFmHgZXwE=
From: Juergen Gross <jgross@suse.com>
To: torvalds@linux-foundation.org
Cc: linux-kernel@vger.kernel.org,
	xen-devel@lists.xenproject.org,
	boris.ostrovsky@oracle.com
Subject: [GIT PULL] xen: branch for v5.11-rc1
Date: Sat, 19 Dec 2020 07:31:36 +0100
Message-Id: <20201219063136.5828-1-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Linus,

Please git pull the following tag:

 git://git.kernel.org/pub/scm/linux/kernel/git/xen/tip.git for-linus-5.11-rc1b-tag

xen: branch for v5.11-rc1

It contains some minor cleanup patches and a small series disentangling some Xen
related Kconfig options.

Thanks.

Juergen

 arch/x86/include/asm/xen/page.h |  2 +-
 arch/x86/xen/Kconfig            | 38 ++++++++++++++++++++++----------------
 arch/x86/xen/p2m.c              | 12 +-----------
 drivers/block/xen-blkfront.c    |  1 +
 drivers/xen/Makefile            |  2 +-
 drivers/xen/manage.c            |  1 +
 6 files changed, 27 insertions(+), 29 deletions(-)

Gustavo A. R. Silva (2):
      xen-blkfront: Fix fall-through warnings for Clang
      xen/manage: Fix fall-through warnings for Clang

Jason Andryuk (3):
      xen: Remove Xen PVH/PVHVM dependency on PCI
      xen: Kconfig: nest Xen guest options
      xen: Kconfig: remove X86_64 depends from XEN_512GB

Qinglang Miao (1):
      x86/xen: Convert to DEFINE_SHOW_ATTRIBUTE

Tom Rix (1):
      xen: remove trailing semicolon in macro definition

