Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4369A47FD4E
	for <lists+xen-devel@lfdr.de>; Mon, 27 Dec 2021 14:23:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.251985.432970 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n1pxh-000285-DN; Mon, 27 Dec 2021 13:22:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 251985.432970; Mon, 27 Dec 2021 13:22:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n1pxh-000255-AO; Mon, 27 Dec 2021 13:22:49 +0000
Received: by outflank-mailman (input) for mailman id 251985;
 Mon, 27 Dec 2021 13:22:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=I4x1=RM=linuxfoundation.org=gregkh@srs-se1.protection.inumbo.net>)
 id 1n1pxg-00024z-0c
 for xen-devel@lists.xenproject.org; Mon, 27 Dec 2021 13:22:48 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org
 [2604:1380:4601:e00::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 12aaea15-6718-11ec-9e60-abaf8a552007;
 Mon, 27 Dec 2021 14:22:46 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 6977AB8102E;
 Mon, 27 Dec 2021 13:22:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B0687C36AEA;
 Mon, 27 Dec 2021 13:22:40 +0000 (UTC)
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
X-Inumbo-ID: 12aaea15-6718-11ec-9e60-abaf8a552007
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1640611361;
	bh=oIhYMV0TNwWQ1DJ3amUeZe8z+/TaiKP3lJFVwv/2FtI=;
	h=Subject:To:Cc:From:Date:In-Reply-To:From;
	b=gnFdWFPzWEZWTuBHCnbA45zveqXYJRm/xDyIUypleIlCcdBUwxr1VfZa5eBGksY2N
	 yf0eeNPTVBFaQo28VRSZCkpHuFdn6xlWlhyI3Nqtjr6nPB78I0oC1GyEa3uURO6xhU
	 gFnaR5cuU+/j+V4llvRU+0+knHof/0jhSD7VyZHE=
Subject: Patch "xen/blkfront: fix bug in backported patch" has been added to the 4.4-stable tree
To: gregkh@linuxfoundation.org,jgross@suse.com,xen-devel@lists.xenproject.org
Cc: <stable-commits@vger.kernel.org>
From: <gregkh@linuxfoundation.org>
Date: Mon, 27 Dec 2021 14:22:30 +0100
In-Reply-To: <20211223105308.17077-1-jgross@suse.com>
Message-ID: <164061135021254@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=ANSI_X3.4-1968
Content-Transfer-Encoding: 8bit
X-stable: commit
X-Patchwork-Hint: ignore 


This is a note to let you know that I've just added the patch titled

    xen/blkfront: fix bug in backported patch

to the 4.4-stable tree which can be found at:
    http://www.kernel.org/git/?p=linux/kernel/git/stable/stable-queue.git;a=summary

The filename of the patch is:
     xen-blkfront-fix-bug-in-backported-patch.patch
and it can be found in the queue-4.4 subdirectory.

If you, or anyone else, feels it should not be added to the stable tree,
please let <stable@vger.kernel.org> know about it.


From jgross@suse.com  Mon Dec 27 13:38:43 2021
From: Juergen Gross <jgross@suse.com>
Date: Thu, 23 Dec 2021 11:53:08 +0100
Subject: xen/blkfront: fix bug in backported patch
To: stable@vger.kernel.org
Cc: xen-devel@lists.xenproject.org, Juergen Gross <jgross@suse.com>
Message-ID: <20211223105308.17077-1-jgross@suse.com>

From: Juergen Gross <jgross@suse.com>

The backport of commit 8f5a695d99000fc ("xen/blkfront: don't take local
copy of a request from the ring page") to stable 4.4 kernel introduced
a bug when adding the needed blkif_ring_get_request() function, as
info->ring.req_prod_pvt was incremented twice now.

Fix that be deleting the now superfluous increments after calling that
function.

Signed-off-by: Juergen Gross <jgross@suse.com>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/block/xen-blkfront.c |    4 ----
 1 file changed, 4 deletions(-)

--- a/drivers/block/xen-blkfront.c
+++ b/drivers/block/xen-blkfront.c
@@ -493,8 +493,6 @@ static int blkif_queue_discard_req(struc
 	else
 		ring_req->u.discard.flag = 0;
 
-	info->ring.req_prod_pvt++;
-
 	/* Copy the request to the ring page. */
 	*final_ring_req = *ring_req;
 	info->shadow[id].inflight = true;
@@ -711,8 +709,6 @@ static int blkif_queue_rw_req(struct req
 	if (setup.segments)
 		kunmap_atomic(setup.segments);
 
-	info->ring.req_prod_pvt++;
-
 	/* Copy request(s) to the ring page. */
 	*final_ring_req = *ring_req;
 	info->shadow[id].inflight = true;


Patches currently in stable-queue which might be from jgross@suse.com are

queue-4.4/xen-blkfront-fix-bug-in-backported-patch.patch

