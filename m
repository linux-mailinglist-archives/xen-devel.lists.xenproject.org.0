Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 575262BA21C
	for <lists+xen-devel@lfdr.de>; Fri, 20 Nov 2020 07:00:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.31558.62019 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kfzSY-0008P4-Ol; Fri, 20 Nov 2020 05:59:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 31558.62019; Fri, 20 Nov 2020 05:59:50 +0000
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
	id 1kfzSY-0008Oj-LH; Fri, 20 Nov 2020 05:59:50 +0000
Received: by outflank-mailman (input) for mailman id 31558;
 Fri, 20 Nov 2020 05:59:50 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=wRTa=E2=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1kfzSX-0008Oe-Tg
 for xen-devel@lists.xenproject.org; Fri, 20 Nov 2020 05:59:49 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d8bfbaeb-4613-4268-b01a-abffcbcae682;
 Fri, 20 Nov 2020 05:59:49 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 173E5AC23;
 Fri, 20 Nov 2020 05:59:48 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=wRTa=E2=suse.com=jgross@srs-us1.protection.inumbo.net>)
	id 1kfzSX-0008Oe-Tg
	for xen-devel@lists.xenproject.org; Fri, 20 Nov 2020 05:59:49 +0000
X-Inumbo-ID: d8bfbaeb-4613-4268-b01a-abffcbcae682
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id d8bfbaeb-4613-4268-b01a-abffcbcae682;
	Fri, 20 Nov 2020 05:59:49 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1605851988; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=4Y4Wnq1UGB9RNhSifrdmnGmDAtM2j7xXdf7kH9LivWw=;
	b=vEMkUgS5AVxLFI5pSm7zN2Bo7HxVN40A2ppZ/3Iv2yCpBhAz53lRbj6N48N+lWCSsLmjqv
	MwvNOU7ej3Hoh6W+Ne2vInmIkxaN7lCae6EfrVVkrExbYaac34a2jVl0hvWbmo7PLCuDno
	tcksr+CkmRYCxaCziHtuROZ/1LKLGvU=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 173E5AC23;
	Fri, 20 Nov 2020 05:59:48 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: torvalds@linux-foundation.org
Cc: linux-kernel@vger.kernel.org,
	xen-devel@lists.xenproject.org,
	boris.ostrovsky@oracle.com
Subject: [GIT PULL] xen: branch for v5.10-rc5
Date: Fri, 20 Nov 2020 06:59:47 +0100
Message-Id: <20201120055947.613-1-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Linus,

Please git pull the following tag:

 git://git.kernel.org/pub/scm/linux/kernel/git/xen/tip.git for-linus-5.10b-rc5-tag

xen: branch for v5.10-rc5

It contains a single fix for avoiding WARN splats when booting a Xen
guest with nosmt.

Thanks.

Juergen

 arch/x86/xen/spinlock.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

Brian Masney (1):
      x86/xen: don't unbind uninitialized lock_kicker_irq

