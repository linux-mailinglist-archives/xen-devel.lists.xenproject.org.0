Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 139EB650EEB
	for <lists+xen-devel@lfdr.de>; Mon, 19 Dec 2022 16:43:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.466235.725111 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p7IIA-0001Cd-8Q; Mon, 19 Dec 2022 15:43:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 466235.725111; Mon, 19 Dec 2022 15:43:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p7IIA-00019t-30; Mon, 19 Dec 2022 15:43:02 +0000
Received: by outflank-mailman (input) for mailman id 466235;
 Mon, 19 Dec 2022 15:43:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TGe1=4R=linuxfoundation.org=gregkh@srs-se1.protection.inumbo.net>)
 id 1p7II9-00019i-9h
 for xen-devel@lists.xenproject.org; Mon, 19 Dec 2022 15:43:01 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d0770080-7fb3-11ed-8fd4-01056ac49cbb;
 Mon, 19 Dec 2022 16:43:00 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id A461B6102A;
 Mon, 19 Dec 2022 15:42:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9ECF3C433F0;
 Mon, 19 Dec 2022 15:42:57 +0000 (UTC)
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
X-Inumbo-ID: d0770080-7fb3-11ed-8fd4-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1671464578;
	bh=kpd0HiwHfLJpUb7XCz8g5W4xpTaALiTKH66t8ZH6JpM=;
	h=Subject:To:Cc:From:Date:In-Reply-To:From;
	b=yImR4KEuESv4ASj0dI7DSRNoWkHF6xWKBhIg+BUPlIn9/hTbrcrDiNWXaL3unkvOy
	 AluiIqNzMXBbM6lD5S1QEhwq387ME+8fgv43fuq+gNi3PnXE8ISiG0QvRA8jkWBJBF
	 FqiTAMRIrbDeAN+B9+jui4F5IR8rUaASQlB67OrE=
Subject: Patch "xen-netback: move removal of "hotplug-status" to the right place" has been added to the 5.4-stable tree
To: davem@davemloft.net,gregkh@linuxfoundation.org,julien@xen.org,kuba@kernel.org,marmarek@invisiblethingslab.com,mheyne@amazon.de,paul@xen.org,pjy@amazon.de,ptyadav@amazon.de,sashal@kernel.org,wei.liu@kernel.org,xen-devel@lists.xenproject.org
Cc: <stable-commits@vger.kernel.org>
From: <gregkh@linuxfoundation.org>
Date: Mon, 19 Dec 2022 16:42:55 +0100
In-Reply-To: <20221219153710.23782-1-ptyadav@amazon.de>
Message-ID: <1671464575160233@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8bit
X-stable: commit
X-Patchwork-Hint: ignore 


This is a note to let you know that I've just added the patch titled

    xen-netback: move removal of "hotplug-status" to the right place

to the 5.4-stable tree which can be found at:
    http://www.kernel.org/git/?p=linux/kernel/git/stable/stable-queue.git;a=summary

The filename of the patch is:
     xen-netback-move-removal-of-hotplug-status-to-the-right-place.patch
and it can be found in the queue-5.4 subdirectory.

If you, or anyone else, feels it should not be added to the stable tree,
please let <stable@vger.kernel.org> know about it.


From ptyadav@amazon.de  Mon Dec 19 16:41:51 2022
From: Pratyush Yadav <ptyadav@amazon.de>
Date: Mon, 19 Dec 2022 16:37:10 +0100
Subject: xen-netback: move removal of "hotplug-status" to the right place
To: <stable@vger.kernel.org>
Cc: "Pratyush Yadav" <ptyadav@amazon.de>, "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>, "Wei Liu" <wei.liu@kernel.org>, "Paul Durrant" <paul@xen.org>, "David S. Miller" <davem@davemloft.net>, "Marek Marczykowski-Górecki" <marmarek@invisiblethingslab.com>, "Jakub Kicinski" <kuba@kernel.org>, "Sasha Levin" <sashal@kernel.org>, "Puranjay Mohan" <pjy@amazon.de>, "Maximilian Heyne" <mheyne@amazon.de>, "Julien Grall" <julien@xen.org>, xen-devel@lists.xenproject.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Message-ID: <20221219153710.23782-1-ptyadav@amazon.de>

From: Pratyush Yadav <ptyadav@amazon.de>

The removal of "hotplug-status" has moved around a bit. First it was
moved from netback_remove() to hotplug_status_changed() in upstream
commit 1f2565780e9b ("xen-netback: remove 'hotplug-status' once it has
served its purpose"). Then the change was reverted in upstream commit
0f4558ae9187 ("Revert "xen-netback: remove 'hotplug-status' once it has
served its purpose""), but it moved the removal to backend_disconnect().
Then the upstream commit c55f34b6aec2 ("xen-netback: only remove
'hotplug-status' when the vif is actually destroyed") moved it finally
back to netback_remove(). The thing to note being it is removed
unconditionally this time around.

The story on v5.4.y adds to this confusion. Commit 60e4e3198ce8 ("Revert
"xen-netback: remove 'hotplug-status' once it has served its purpose"")
is backported to v5.4.y but the original commit that it tries to revert
was never present on 5.4. So the backport incorrectly ends up just
adding another xenbus_rm() of "hotplug-status" in backend_disconnect().

Now in v5.4.y it is removed in both backend_disconnect() and
netback_remove(). But it should only be removed in netback_remove(), as
the upstream version does.

Removing "hotplug-status" in backend_disconnect() causes problems when
the frontend unilaterally disconnects, as explained in
c55f34b6aec2 ("xen-netback: only remove 'hotplug-status' when the vif is
actually destroyed").

Remove "hotplug-status" in the same place as it is done on the upstream
version to ensure unilateral re-connection of frontend continues to
work.

Fixes: 60e4e3198ce8 ("Revert "xen-netback: remove 'hotplug-status' once it has served its purpose"")
Signed-off-by: Pratyush Yadav <ptyadav@amazon.de>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/net/xen-netback/xenbus.c |    3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

--- a/drivers/net/xen-netback/xenbus.c
+++ b/drivers/net/xen-netback/xenbus.c
@@ -202,10 +202,10 @@ static int netback_remove(struct xenbus_
 	set_backend_state(be, XenbusStateClosed);
 
 	unregister_hotplug_status_watch(be);
+	xenbus_rm(XBT_NIL, dev->nodename, "hotplug-status");
 	if (be->vif) {
 		kobject_uevent(&dev->dev.kobj, KOBJ_OFFLINE);
 		xen_unregister_watchers(be->vif);
-		xenbus_rm(XBT_NIL, dev->nodename, "hotplug-status");
 		xenvif_free(be->vif);
 		be->vif = NULL;
 	}
@@ -435,7 +435,6 @@ static void backend_disconnect(struct ba
 		unsigned int queue_index;
 
 		xen_unregister_watchers(vif);
-		xenbus_rm(XBT_NIL, be->dev->nodename, "hotplug-status");
 #ifdef CONFIG_DEBUG_FS
 		xenvif_debugfs_delif(vif);
 #endif /* CONFIG_DEBUG_FS */


Patches currently in stable-queue which might be from ptyadav@amazon.de are

queue-5.4/xen-netback-move-removal-of-hotplug-status-to-the-right-place.patch
queue-5.4/tracing-ring-buffer-only-do-full-wait-when-cpu-ring_buffer_all_cpus.patch

