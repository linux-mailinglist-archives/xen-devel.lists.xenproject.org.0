Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BBA24DB5AE
	for <lists+xen-devel@lfdr.de>; Wed, 16 Mar 2022 17:11:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.291212.494145 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nUWEV-0000Yg-Sv; Wed, 16 Mar 2022 16:10:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 291212.494145; Wed, 16 Mar 2022 16:10:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nUWEV-0000Uh-O5; Wed, 16 Mar 2022 16:10:43 +0000
Received: by outflank-mailman (input) for mailman id 291212;
 Wed, 16 Mar 2022 16:10:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=/w4J=T3=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1nUWEU-0000RR-Qb
 for xen-devel@lists.xenproject.org; Wed, 16 Mar 2022 16:10:42 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 93cf928a-a543-11ec-8eba-a37418f5ba1a;
 Wed, 16 Mar 2022 17:10:39 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 077BF21108;
 Wed, 16 Mar 2022 16:10:20 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id C0A3F139B5;
 Wed, 16 Mar 2022 16:10:19 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id rnCsLesLMmK2OwAAMHmgww
 (envelope-from <jgross@suse.com>); Wed, 16 Mar 2022 16:10:19 +0000
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
X-Inumbo-ID: 93cf928a-a543-11ec-8eba-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1647447020; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=hZKD0EuTc6WQXVOTuJxQoolqoYXnAFSSnw7fgb9wYmQ=;
	b=VZ+kkIbd02t4dK03Jr3BAxZ/CFOFjXOwUiEyKhermAHZjL5tgRYuCm+Jlsn92Otc/2ipr7
	N3An5DNKRI2mpzmrokc+l2budEABb3TgTefk64HzcMu+Igt+PtvVavhevb9mSPvZWLIpaj
	5kr4QyUiueHc+quGGm7WoCqhK5I1TQU=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH 0/3] tools/xenstore: add some new features to the documentation
Date: Wed, 16 Mar 2022 17:10:14 +0100
Message-Id: <20220316161017.3579-1-jgross@suse.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In the past there have been spotted some shortcomings in the Xenstore
interface, which should be repaired. Those are in detail:

- Using driver domains for large number of domains needs per domain
  Xenstore quota [1]. The feedback sent was rather slim (one reply),
  but it was preferring a new set of wire commands.

- XSA-349 [2] has shown that the current definition of watches is not
  optimal, as it will trigger lots of events when a single one would
  suffice: for detecting new backend devices the backends in the Linux
  kernel are registering a watch for e.g. "/local/domain/0/backend"
  which will fire for ANY sub-node written below this node (on a test
  machine this added up to 91 watch events for only 3 devices).
  This can be limited dramatically by extending the XS_WATCH command
  to take another optional parameter specifying the depth of
  subdirectories to be considered for sending watch events ("0" would
  trigger a watch event only if the watched node itself being written).

- New features like above being added might make migration of guests
  between hosts with different Xenstore variants harder, so it should
  be possible to set the available feature set per domain. For socket
  connections it should be possible to read the available features.

- The special watches @introduceDomain and @releaseDomain are rather
  cumbersome to use, as they only tell you that SOME domain has been
  introduced/released. Any consumer of those watches needs to scan
  all domains on the host in order to find out the domid, causing
  significant pressure on the dominfo hypercall (imagine a system
  with 1000 domains running and one domain dying - there will be more
  than 1000 watch events triggered and 1000 xl daemons will try to
  find out whether "their" domain has died). Those watches should be
  enhanced to optionally be specific to a single domain and to let the
  event carry the related domid.

As some of those extensions will need to be considered in the Xenstore
migration stream, they should be defined in one go (in fact the 4th one
wouldn't need that, but it can easily be connected to the 2nd one).
As such extensions need to be flagged in the "features" in the ring
page anyway, it is fine to implement them independently.

Add the documentation of the new commands/features.

[1]: https://lists.xen.org/archives/html/xen-devel/2020-06/msg00291.html
[2]: http://xenbits.xen.org/xsa/advisory-349.html

Juergen Gross (3):
  tools/xenstore: add documentation for new set/get-feature commands
  tools/xenstore: add documentation for new set/get-quota commands
  tools/xenstore: add documentation for extended watch command

 docs/misc/xenstore-ring.txt |  3 +++
 docs/misc/xenstore.txt      | 40 ++++++++++++++++++++++++++++++++++---
 2 files changed, 40 insertions(+), 3 deletions(-)

-- 
2.34.1


