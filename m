Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F31924BD442
	for <lists+xen-devel@lfdr.de>; Mon, 21 Feb 2022 04:43:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.275889.471897 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nLzb9-0003ct-Hy; Mon, 21 Feb 2022 03:42:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 275889.471897; Mon, 21 Feb 2022 03:42:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nLzb9-0003aQ-EH; Mon, 21 Feb 2022 03:42:51 +0000
Received: by outflank-mailman (input) for mailman id 275889;
 Mon, 21 Feb 2022 03:42:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Dco5=TE=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1nLzb7-0003Ks-SB
 for xen-devel@lists.xenproject.org; Mon, 21 Feb 2022 03:42:49 +0000
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com
 [64.147.123.19]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 53057aed-92c8-11ec-8eb8-a37418f5ba1a;
 Mon, 21 Feb 2022 04:42:47 +0100 (CET)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id CAB523200258;
 Sun, 20 Feb 2022 22:42:40 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Sun, 20 Feb 2022 22:42:41 -0500
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 20 Feb 2022 22:42:38 -0500 (EST)
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
X-Inumbo-ID: 53057aed-92c8-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:from:from:in-reply-to:message-id
	:mime-version:reply-to:sender:subject:subject:to:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=4Ftth8
	jIR9thK7FgELPaAjI8cJu47K8WHyuMsUo9B1g=; b=FdoiMWvU0BfcBuxRwZU+21
	YkXa3ru8QvLBJzmL/AR2f3zSpdyN/RArycC556yS3nEpHXST4J6m2eSpv6RsAfae
	HVDZ0tHyCtBHkF+ERY5MvQNm5iP2mhYt2LyddO0yYU4fvStJbC0IIM14aXMD33Fd
	gDIUNKDMi398RCkvE7HHV8/5mkBXoCY3qYqSkxKuCmIYRhjFNNNGujLo6iCqohEo
	jrcLXcM12/4ynXvJxVvUm8dAIn1OnnbIzU1WSBn6s6cGnMvOO95hNqMNJKpHSPZj
	kYpA/hauWPYnxQm0ebleiBxI0kcS2gkEmB3L2nA0ujfpiws/nhx5TNz9yHNa5flQ
	==
X-ME-Sender: <xms:LwoTYpCoP_vRoO-_W43C6K6fDJoUfDxtuNFYf33mJAATjxinZwOqbA>
    <xme:LwoTYnhBQrjcD6W4_JUHEJJ5xXbslYuqYGV2q7GbsGS7sM24JA9cfSloftU9n_920
    GovhIkTXs473g>
X-ME-Received: <xmr:LwoTYkkICF2S4BqHYuGwzspmSGfOM82iVlML-aoKIWsuRIHSpPpgyT8Ipq4Ty5RXgEx9qF_BHzRkiTO5CL53ix3RwgdmF7PdYuDnP39P6FH2XPWzMIA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrkeehgdeitdcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefhvffufffkofggtghogfesthekredtredtjeenucfhrhhomhepofgrrhgvkhcu
    ofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinhhvih
    hsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhephefhfeet
    ueelvddvtedttdevieeluedtvedtfeejieelhedutdeuheduieejgfegnecuffhomhgrih
    hnpehkvghrnhgvlhdrohhrghenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhep
    mhgrihhlfhhrohhmpehmrghrmhgrrhgvkhesihhnvhhishhisghlvghthhhinhhgshhlrg
    gsrdgtohhm
X-ME-Proxy: <xmx:LwoTYjyJDArO5Qikpwxqss0lYz6rfAvZG-o-ZDWrYSHkps5AmaKhPQ>
    <xmx:LwoTYuQaNlIgZeG2_YCDGLJG9dPE5ErYpcWEQBbdDTU6BHUQWHvkLA>
    <xmx:LwoTYmbnSKBtsO3el5Uoa9Tu8brFC5fcwyiqug_rUxPPmUavF9DXMA>
    <xmx:MAoTYrQZH-q9MTuCmeVGtFapoCE7E5IoRirCF9BmYN3iEkXq9iMhtQ>
From: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: linux-kernel@vger.kernel.org
Cc: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	stable@vger.kernel.org,
	Michael Brown <mcb30@ipxe.org>,
	Wei Liu <wei.liu@kernel.org>,
	Paul Durrant <paul@xen.org>,
	"David S. Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>,
	xen-devel@lists.xenproject.org (moderated list:XEN NETWORK BACKEND DRIVER),
	netdev@vger.kernel.org (open list:XEN NETWORK BACKEND DRIVER)
Subject: [PATCH 1/2] Revert "xen-netback: remove 'hotplug-status' once it has served its purpose"
Date: Mon, 21 Feb 2022 04:42:12 +0100
Message-Id: <20220221034214.2237097-1-marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Invisible Things Lab
Content-Transfer-Encoding: 8bit

This reverts commit 1f2565780e9b7218cf92c7630130e82dcc0fe9c2.

The 'hotplug-status' node should not be removed as long as the vif
device remains configured. Otherwise the xen-netback would wait for
re-running the network script even if it was already called (in case of
the frontent re-connecting). But also, it _should_ be removed when the
vif device is destroyed (for example when unbinding the driver) -
otherwise hotplug script would not configure the device whenever it
re-appear.

Moving removal of the 'hotplug-status' node was a workaround for nothing
calling network script after xen-netback module is reloaded. But when
vif interface is re-created (on xen-netback unbind/bind for example),
the script should be called, regardless of who does that - currently
this case is not handled by the toolstack, and requires manual
script call. Keeping hotplug-status=connected to skip the call is wrong
and leads to not configured interface.

More discussion at
https://lore.kernel.org/xen-devel/afedd7cb-a291-e773-8b0d-4db9b291fa98@ipxe.org/T/#u

Cc: stable@vger.kernel.org
Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
---
Cc: Michael Brown <mcb30@ipxe.org>
---
 drivers/net/xen-netback/xenbus.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/xen-netback/xenbus.c b/drivers/net/xen-netback/xenbus.c
index d24b7a7993aa..ce0f3035bee8 100644
--- a/drivers/net/xen-netback/xenbus.c
+++ b/drivers/net/xen-netback/xenbus.c
@@ -256,6 +256,7 @@ static void backend_disconnect(struct backend_info *be)
 		unsigned int queue_index;
 
 		xen_unregister_watchers(vif);
+		xenbus_rm(XBT_NIL, dev->nodename, "hotplug-status");
 #ifdef CONFIG_DEBUG_FS
 		xenvif_debugfs_delif(vif);
 #endif /* CONFIG_DEBUG_FS */
@@ -675,7 +676,6 @@ static void hotplug_status_changed(struct xenbus_watch *watch,
 
 		/* Not interested in this watch anymore. */
 		unregister_hotplug_status_watch(be);
-		xenbus_rm(XBT_NIL, be->dev->nodename, "hotplug-status");
 	}
 	kfree(str);
 }
-- 
2.31.1


