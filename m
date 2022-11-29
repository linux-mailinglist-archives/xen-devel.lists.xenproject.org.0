Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D30063B9BA
	for <lists+xen-devel@lfdr.de>; Tue, 29 Nov 2022 07:18:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.449237.705898 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oztvf-0006F8-11; Tue, 29 Nov 2022 06:17:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 449237.705898; Tue, 29 Nov 2022 06:17:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oztve-0006C6-Tt; Tue, 29 Nov 2022 06:17:14 +0000
Received: by outflank-mailman (input) for mailman id 449237;
 Tue, 29 Nov 2022 06:17:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rIio=35=citrix.com=prvs=325750465=lin.liu@srs-se1.protection.inumbo.net>)
 id 1oztvd-0006C0-2g
 for xen-devel@lists.xenproject.org; Tue, 29 Nov 2022 06:17:13 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 735e603e-6fad-11ed-91b6-6bf2151ebd3b;
 Tue, 29 Nov 2022 07:17:09 +0100 (CET)
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
X-Inumbo-ID: 735e603e-6fad-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1669702629;
  h=from:to:cc:subject:date:message-id:mime-version;
  bh=bmlgSAtGbFtOdTc2GOvO2wyZBv0MSel48KWcSeby+RI=;
  b=Xw6i+O4cgrcWCHtarq0c5t+cW853QSNfZt/sgzan861QepPP77bM0j5P
   QTvTP6VbxBI+QcKvXhjfeSCBujz8C8ymMo0nkYUGTIKZ2gZkr8/zADzF7
   H6fw4BjI1Fr7xgfTKCHXE+KVgKpKvnY4bHLgTsAw+4x5QgDrjgA7PWpPw
   I=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: None
X-MesageID: 86155238
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:/wwzm67QmHsfLrdwyeQQXAxRtJ3HchMFZxGqfqrLsTDasY5as4F+v
 mIYWW6GafyJNmXwKY10aIu+9U0G6JGHxoNgG1dkrio9Hi5G8cbLO4+Ufxz6V8+wwm8vb2o8t
 plDNYOQRCwQZiWBzvt4GuG59RGQ7YnRGvynTraBYnoqLeNdYH9JoQp5nOIkiZJfj9G8Agec0
 fv/uMSaM1K+s9JOGjt8B5mr9VU+4pwehBtC5gZkPKkR7QeE/5UoJMl3yZ+ZfiOQrrZ8RoZWd
 86bpJml82XQ+QsaC9/Nut4XpWVTH9Y+lSDX4pZnc/DKbipq/0Te4Y5iXBYoUm9Fii3hojxE4
 I4lWapc6+seFvakdOw1C3G0GszlVEFM0OevzXOX6aR/w6BaGpdFLjoH4EweZOUlFuhL7W5my
 cYxczAofhW5xMXsz5SLWMR8jdwKBZy+VG8fkikIITDxCP8nRdbIQrnQ5M8e1zA17ixMNa+AP
 YxDM2MpNUmeJU0UUrsUIMtWcOOAgnj5NTlZtXqepLYt4niVxwt0uFToGIqLI4HXH54F9qqej
 m2Y7kPGWgsjDtya4CXC3X+0vf/MuQquDer+E5Xnr6U30TV/3Fc7EBQcWF26ieO0hk63R5RUL
 El80ikzp6Ea90GxSNT5GRqirxasrhMaHtZdDeA+wAWM0bbPpRaUAHAeSTxMY8Bgs9U5LRQu1
 1mUj5bqCCZpvbm9V32Q7PGXoCm0NCxTKnUNDQcCQBcJ7sfLvo4+lFTMQ8xlHarzicf6cRn9z
 y2PpTozm50ciskE06j99lfC6xquqYLOVRUd/RjMUySu6QYRTJW+e4Wi5Fzf7PBBBIWUVF+Mu
 D4Dgcf2xOwHE5yIvCCEXugIGLan+7CDPSG0qVlrEpo6/jKh4Um/bJtQ6zFzIkRuGssccDqva
 0jW0T69/7cKYiHsN/UuJdvsVYJ6lsAMCOgJSNjoVPMVYr1hcTXE23thQ36C8nDmiGEFxPRX1
 YigTe6gCnMTCKJCxTWwRvsA3bJD+h3S1V8/VrigkU35jOP2iGq9DO5cbQDQNrxRALas+l29z
 jpJCyedJ/yzusXaazKfz4McJEtiwZMTVcGv8Jw/mgJuz2Nb9IAd5x35m+tJl29Nxf49egL0E
 paVBCdlJKLX3yGvFOlzQikLhXOGdc8XQYgHFSItJ020/HMofJyi6qwSH7NuI+d2qrI7lq8kE
 KZbEyllPhioYm2XkwnxkLGn9NAyHPhVrV3m09WZjMgXIMc7Gl2hFi7MdQrz7igeZhdbRuNny
 4BNF2rzH/I+euiVJJ+OMK33kAvt5SN1dSAbdxKgH+S/sX7EqOBCQxEdRNdsSy3QAX0vHgen6
 js=
IronPort-HdrOrdr: A9a23:2Qpes6A5gwNlSHblHem455DYdb4zR+YMi2TC1yhKJiC9E/bo8/
 xG88576faZslsssRIb6LW90cu7IU80nKQdieJ6AV7LZniFhILCFu9fBOXZrwEIYxeOldJg6Q
 ==
X-IronPort-AV: E=Sophos;i="5.96,202,1665460800"; 
   d="scan'208";a="86155238"
From: Lin Liu <lin.liu@citrix.com>
To:
CC: Lin Liu <lin.liu@citrix.com>, Juergen Gross <jgross@suse.com>, Stefano
 Stabellini <sstabellini@kernel.org>, Oleksandr Tyshchenko
	<oleksandr_tyshchenko@epam.com>, "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo
 Abeni <pabeni@redhat.com>, "moderated list:XEN HYPERVISOR INTERFACE"
	<xen-devel@lists.xenproject.org>, "open list:NETWORKING DRIVERS"
	<netdev@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
Subject: [PATCH] drivers/net/netfront: Fix NULL sring after live migration
Date: Tue, 29 Nov 2022 06:17:02 +0000
Message-ID: <20221129061702.60629-1-lin.liu@citrix.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain

A NAPI is setup for each network sring to poll data to kernel
The sring with source host is destroyed before live migration and
new sring with target host is setup after live migration.
The NAPI for the old sring is not deleted until setup new sring
with target host after migration. With busy_poll/busy_read enabled,
the NAPI can be polled before got deleted when resume VM.

[50116.602938] BUG: unable to handle kernel NULL pointer dereference at
0000000000000008
[50116.603047] IP: xennet_poll+0xae/0xd20
[50116.603090] PGD 0 P4D 0
[50116.603118] Oops: 0000 [#1] SMP PTI
[50116.604624] Call Trace:
[50116.604674]  ? finish_task_switch+0x71/0x230
[50116.604745]  ? timerqueue_del+0x1d/0x40
[50116.604807]  ? hrtimer_try_to_cancel+0xb5/0x110
[50116.604882]  ? xennet_alloc_rx_buffers+0x2a0/0x2a0
[50116.604958]  napi_busy_loop+0xdb/0x270
[50116.605017]  sock_poll+0x87/0x90
[50116.605066]  do_sys_poll+0x26f/0x580
[50116.605125]  ? tracing_map_insert+0x1d4/0x2f0
[50116.605196]  ? event_hist_trigger+0x14a/0x260
...
[50116.613598]  ? finish_task_switch+0x71/0x230
[50116.614131]  ? __schedule+0x256/0x890
[50116.614640]  ? recalc_sigpending+0x1b/0x50
[50116.615144]  ? xen_sched_clock+0x15/0x20
[50116.615643]  ? __rb_reserve_next+0x12d/0x140
[50116.616138]  ? ring_buffer_lock_reserve+0x123/0x3d0
[50116.616634]  ? event_triggers_call+0x87/0xb0
[50116.617138]  ? trace_event_buffer_commit+0x1c4/0x210
[50116.617625]  ? xen_clocksource_get_cycles+0x15/0x20
[50116.618112]  ? ktime_get_ts64+0x51/0xf0
[50116.618578]  SyS_ppoll+0x160/0x1a0
[50116.619029]  ? SyS_ppoll+0x160/0x1a0
[50116.619475]  do_syscall_64+0x73/0x130
[50116.619901]  entry_SYSCALL_64_after_hwframe+0x41/0xa6
...
[50116.806230] RIP: xennet_poll+0xae/0xd20 RSP: ffffb4f041933900
[50116.806772] CR2: 0000000000000008
[50116.807337] ---[ end trace f8601785b354351c ]---

xen frontend should remove the NAPIs for the old srings before live
migration as the bond srings are destroyed

There is a tiny window between the srings are set to NULL and
the NAPIs are disabled, It is safe as the NAPI threads are still
frozen at that time

Signed-off-by: Lin Liu <lin.liu@citrix.com>
---
 drivers/net/xen-netfront.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/net/xen-netfront.c b/drivers/net/xen-netfront.c
index 9af2b027c19c..dc404e05970c 100644
--- a/drivers/net/xen-netfront.c
+++ b/drivers/net/xen-netfront.c
@@ -1862,6 +1862,12 @@ static int netfront_resume(struct xenbus_device *dev)
 	netif_tx_unlock_bh(info->netdev);
 
 	xennet_disconnect_backend(info);
+
+	rtnl_lock();
+	if (info->queues)
+		xennet_destroy_queues(info);
+	rtnl_unlock();
+
 	return 0;
 }
 
-- 
2.17.1


