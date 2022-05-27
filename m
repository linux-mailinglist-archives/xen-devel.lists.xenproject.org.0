Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 75D97535A46
	for <lists+xen-devel@lfdr.de>; Fri, 27 May 2022 09:24:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.337811.562506 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nuUKn-0003Wm-QM; Fri, 27 May 2022 07:24:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 337811.562506; Fri, 27 May 2022 07:24:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nuUKn-0003Um-MM; Fri, 27 May 2022 07:24:33 +0000
Received: by outflank-mailman (input) for mailman id 337811;
 Fri, 27 May 2022 07:24:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=OTKn=WD=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1nuUKm-0003UV-4X
 for xen-devel@lists.xenproject.org; Fri, 27 May 2022 07:24:32 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0c4e4fa6-dd8e-11ec-bd2c-47488cf2e6aa;
 Fri, 27 May 2022 09:24:30 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id D4C6C21A80;
 Fri, 27 May 2022 07:24:29 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 9AE88139C4;
 Fri, 27 May 2022 07:24:29 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 7YtuJK18kGJLIgAAMHmgww
 (envelope-from <jgross@suse.com>); Fri, 27 May 2022 07:24:29 +0000
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
X-Inumbo-ID: 0c4e4fa6-dd8e-11ec-bd2c-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1653636269; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=47WCpd+EZFhSVapU9H5XzQiUPnz5KW9QIdGGZN/8BNo=;
	b=qsJlQQO4WSjfUrCHX4WRRp4u57eejI5VXFfV8wv5ocTJGpecYM9D0IZqh4OHe7IUHkoimS
	eNvRhCVSQkqhl603t23I1iUF3y7dEM0CTJuvzZZ2J3LVzPBBBmWeVSoyk6nSguxOEbAGk4
	dfNcV+RXVEZpmk9lU9FY7NWLHeDv59E=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v2 0/4] tools/xenstore: add some new features to the documentation
Date: Fri, 27 May 2022 09:24:23 +0200
Message-Id: <20220527072427.20327-1-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
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

Changes in V2:
- added new patch 1
- remove feature bits for dom0-only features
- get-features without domid returns Xenstore supported features
- get/set-quota without domid for global quota access

Juergen Gross (4):
  tools/xenstore: modify feature bit specification in xenstore-ring.txt
  tools/xenstore: add documentation for new set/get-feature commands
  tools/xenstore: add documentation for new set/get-quota commands
  tools/xenstore: add documentation for extended watch command

 docs/misc/xenstore-ring.txt | 10 ++++----
 docs/misc/xenstore.txt      | 47 ++++++++++++++++++++++++++++++++++---
 2 files changed, 50 insertions(+), 7 deletions(-)

-- 
2.35.3


