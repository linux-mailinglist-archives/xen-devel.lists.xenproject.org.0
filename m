Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AFDE34E700
	for <lists+xen-devel@lfdr.de>; Tue, 30 Mar 2021 14:03:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.103458.197384 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lRD5y-0006do-R6; Tue, 30 Mar 2021 12:03:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 103458.197384; Tue, 30 Mar 2021 12:03:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lRD5y-0006dL-Nn; Tue, 30 Mar 2021 12:03:42 +0000
Received: by outflank-mailman (input) for mailman id 103458;
 Tue, 30 Mar 2021 12:03:42 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=aqZP=I4=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1lRD5y-0006cZ-0V
 for xen-devel@lists.xenproject.org; Tue, 30 Mar 2021 12:03:42 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 353b5c5d-d6ee-4f57-ba03-8ae5fba53517;
 Tue, 30 Mar 2021 12:03:38 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id CF7EFB2E7;
 Tue, 30 Mar 2021 12:03:37 +0000 (UTC)
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
X-Inumbo-ID: 353b5c5d-d6ee-4f57-ba03-8ae5fba53517
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1617105817; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=RgYXG8R4K7D3UYQ2peCbRMFBTS3NparOU1uQzH1eEOI=;
	b=ns/hsvRw67g4WN7NB4Qvd0CALMQ4QpTQHVNRooYdY+fHsNNOiiUfaBMJnAz8vF9Ybmma+1
	AeI29Mw0/1zf+nR8xZ1UENKzb2CiWlMqAE3XxNoTBgrbjFCKjwQP48GdWGT7y3gz4w4esz
	2psMmjkMokKaqDya48A9LeZjxtRS01E=
From: Juergen Gross <jgross@suse.com>
To: torvalds@linux-foundation.org
Cc: linux-kernel@vger.kernel.org,
	xen-devel@lists.xenproject.org,
	boris.ostrovsky@oracle.com
Subject: [GIT PULL] xen: branch for v5.12-rc6
Date: Tue, 30 Mar 2021 14:03:37 +0200
Message-Id: <20210330120337.4404-1-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Linus,

Please git pull the following tag:

 git://git.kernel.org/pub/scm/linux/kernel/git/xen/tip.git for-linus-5.12b-rc6-tag

xen: branch for v5.12-rc6

It contains one Xen related security fix (XSA-371).

Thanks.

Juergen

 drivers/block/xen-blkback/blkback.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

Jan Beulich (1):
      xen-blkback: don't leak persistent grants from xen_blkbk_map()

