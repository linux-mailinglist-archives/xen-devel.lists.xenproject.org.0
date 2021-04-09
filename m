Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E6B6035A349
	for <lists+xen-devel@lfdr.de>; Fri,  9 Apr 2021 18:27:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.107902.206209 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lUtyO-00052M-Is; Fri, 09 Apr 2021 16:27:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 107902.206209; Fri, 09 Apr 2021 16:27:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lUtyO-00051z-F9; Fri, 09 Apr 2021 16:27:08 +0000
Received: by outflank-mailman (input) for mailman id 107902;
 Fri, 09 Apr 2021 16:27:07 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=0eme=JG=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1lUtyM-00051t-Ve
 for xen-devel@lists.xenproject.org; Fri, 09 Apr 2021 16:27:07 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 696d9388-b6c9-4b1c-9752-110f1605d933;
 Fri, 09 Apr 2021 16:27:06 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 59CD9B02B;
 Fri,  9 Apr 2021 16:27:05 +0000 (UTC)
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
X-Inumbo-ID: 696d9388-b6c9-4b1c-9752-110f1605d933
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1617985625; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=fhUPXYAbVhvraSv5r/RZz5v2Ni5ifrFujAGOxwr66WE=;
	b=juGDQ4WZ4Ko+BG6+oZPCXrgp95TotOf5V39FseY8r2yi6IyjkSchaPWeor2DPo4bUDORsZ
	DGX1VygdB9PVkicLSraGhQOEzyzIRvG6IZeHBFKqnCvB1UuRXl3MkO9tmySSuEvPSu9gmP
	YAKVpDGjQnVbxhNeu8a0fONUIRfKn1s=
From: Juergen Gross <jgross@suse.com>
To: torvalds@linux-foundation.org
Cc: linux-kernel@vger.kernel.org,
	xen-devel@lists.xenproject.org,
	boris.ostrovsky@oracle.com
Subject: [GIT PULL] xen: branch for v5.12-rc7
Date: Fri,  9 Apr 2021 18:27:04 +0200
Message-Id: <20210409162704.27220-1-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Linus,

Please git pull the following tag:

 git://git.kernel.org/pub/scm/linux/kernel/git/xen/tip.git for-linus-5.12b-rc7-tag

xen: branch for v5.12-rc7

It contains a single fix of a 5.12 patch for the rather uncommon problem of
running as a Xen guest with a real time kernel config.


Thanks.

Juergen

 drivers/xen/events/events_base.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

Luca Fancellu (1):
      xen/evtchn: Change irq_info lock to raw_spinlock_t

