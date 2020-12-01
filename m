Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 219942C990C
	for <lists+xen-devel@lfdr.de>; Tue,  1 Dec 2020 09:22:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.41625.74962 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kk0ut-0004j8-Jw; Tue, 01 Dec 2020 08:21:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 41625.74962; Tue, 01 Dec 2020 08:21:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kk0ut-0004i9-BU; Tue, 01 Dec 2020 08:21:43 +0000
Received: by outflank-mailman (input) for mailman id 41625;
 Tue, 01 Dec 2020 08:21:42 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=UECe=FF=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1kk0us-0004VK-5P
 for xen-devel@lists.xenproject.org; Tue, 01 Dec 2020 08:21:42 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 7e073957-b4d3-4490-a2b8-ed309ab44ce7;
 Tue, 01 Dec 2020 08:21:33 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 6EDDFAF0B;
 Tue,  1 Dec 2020 08:21:32 +0000 (UTC)
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
X-Inumbo-ID: 7e073957-b4d3-4490-a2b8-ed309ab44ce7
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1606810892; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qB6FBv+cM43jZdWdb0tnpaGR6+tOQZRO3dWAITjC9q0=;
	b=MDEmfBgGtA6DduOQH1C265ZvdQ2g1BmM2oxV9IeH0i3JY28sWofN5W0mJt1SBw0VLG/3/y
	Xwk99r5DsCgc5iRluiuKF/q6TxjBq4/0/wQ+Yo5Bl+aR6dFVdbhWIl+AjBeakPAH+55Nmd
	QNdqGsjlsuEUWeWDk5xu/3+agETy7iM=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Ian Jackson <iwj@xenproject.org>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v2 08/17] docs: fix hypfs path documentation
Date: Tue,  1 Dec 2020 09:21:19 +0100
Message-Id: <20201201082128.15239-9-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201201082128.15239-1-jgross@suse.com>
References: <20201201082128.15239-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The /params/* entry is missing a writable tag.

Signed-off-by: Juergen Gross <jgross@suse.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
---
 docs/misc/hypfs-paths.pandoc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/docs/misc/hypfs-paths.pandoc b/docs/misc/hypfs-paths.pandoc
index dddb592bc5..6c7b2f7ee3 100644
--- a/docs/misc/hypfs-paths.pandoc
+++ b/docs/misc/hypfs-paths.pandoc
@@ -179,7 +179,7 @@ The minor version of Xen.
 
 A directory of runtime parameters.
 
-#### /params/*
+#### /params/* [w]
 
 The individual parameters. The description of the different parameters can be
 found in `docs/misc/xen-command-line.pandoc`.
-- 
2.26.2


