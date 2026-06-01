Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mAXKBtllHWqwaAkAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 01 Jun 2026 12:58:33 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B7AD761DFE5
	for <lists+xen-devel@lfdr.de>; Mon, 01 Jun 2026 12:58:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1323794.1589476 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wU0LD-0006DZ-NT; Mon, 01 Jun 2026 10:57:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1323794.1589476; Mon, 01 Jun 2026 10:57:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wU0LD-00068e-JM; Mon, 01 Jun 2026 10:57:55 +0000
Received: by outflank-mailman (input) for mailman id 1323794;
 Mon, 01 Jun 2026 10:39:59 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <eduardomarinho@em-4.local>) id 1wU03r-0003ay-EN
 for xen-devel@lists.xenproject.org; Mon, 01 Jun 2026 10:39:59 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wU03n-006ZzF-2T
 for xen-devel@lists.xenproject.org; Mon, 01 Jun 2026 12:39:55 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <eduardomarinho@em-4.local>)
 id 6a1d616b-bab6-0a2a0a5309dd-0a2a450286d8-24
 for <xen-devel@lists.xenproject.org>; Mon, 01 Jun 2026 12:39:55 +0200
Received: from [179.190.196.82] (helo=EM-4.local)
 by tlsNG-720697.mxtls.expurgate.net with ESMTP (eXpurgate 4.56.1)
 (envelope-from <eduardomarinho@em-4.local>)
 id 6a1d6179-af86-0a2a45020019-b3bec452ccce-1
 for <xen-devel@lists.xenproject.org>; Mon, 01 Jun 2026 12:39:54 +0200
Received: by EM-4.local (Postfix, from userid 501)
 id 934DC44A44A7; Mon,  1 Jun 2026 07:39:52 -0300 (-03)
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
Authentication-Results: eu.smtp.expurgate.cloud; none
From: Eduardo Marinho <eduardomarinho@pm.me>
To: xen-devel@lists.xenproject.org
Cc: andrew.cooper3@citrix.com,
	anthony.perard@vates.tech,
	michal.orzel@amd.com,
	jbeulich@suse.com,
	julien@xen.org,
	roger.pau@citrix.com,
	sstabellini@kernel.org,
	Eduardo Marinho <eduardomarinho@pm.me>
Subject: [PATCH 0/3] docs: fix minor typos and duplicated words
Date: Mon,  1 Jun 2026 07:39:02 -0300
Message-ID: <20260601103905.20982-1-eduardomarinho@pm.me>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-720697/1780310395-A9573161-090A7898/0/0
X-purgate-type: clean
X-purgate-size: 581
X-Spamd-Result: default: False [2.51 / 15.00];
	DMARC_POLICY_QUARANTINE(1.50)[pm.me : SPF not aligned (strict), No valid DKIM,quarantine];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:eduardomarinho@pm.me,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[eduardomarinho@pm.me,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[eduardomarinho@pm.me,xen-devel-bounces@lists.xenproject.org];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.414];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ARC_NA(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Queue-Id: B7AD761DFE5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This series corrects a few minor typos and duplicated words found across
the general documentation, the admin guide, and the libxl specifications.

Eduardo Marinho (3):
  docs: fix spelling of 'necessarily' in index.rst
  docs/admin-guide: drop duplicated word in microcode-loading.rst
  docs/specs: drop duplicated word in libxl-migration-stream.pandoc

 docs/admin-guide/microcode-loading.rst   | 2 +-
 docs/index.rst                           | 2 +-
 docs/specs/libxl-migration-stream.pandoc | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

-- 
2.52.0


