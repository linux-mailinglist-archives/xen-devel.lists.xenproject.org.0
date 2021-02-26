Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 02542326441
	for <lists+xen-devel@lfdr.de>; Fri, 26 Feb 2021 15:42:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.90349.170936 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lFeJq-00039p-Ij; Fri, 26 Feb 2021 14:42:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 90349.170936; Fri, 26 Feb 2021 14:42:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lFeJq-00039Q-FV; Fri, 26 Feb 2021 14:42:14 +0000
Received: by outflank-mailman (input) for mailman id 90349;
 Fri, 26 Feb 2021 14:42:12 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=77G0=H4=amazon.de=prvs=684d0ac3b=nmanthey@srs-us1.protection.inumbo.net>)
 id 1lFeJo-00039L-Hd
 for xen-devel@lists.xenproject.org; Fri, 26 Feb 2021 14:42:12 +0000
Received: from smtp-fw-4101.amazon.com (unknown [72.21.198.25])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8e33ec5c-6a09-4a29-8acd-5a78c6b34fad;
 Fri, 26 Feb 2021 14:42:11 +0000 (UTC)
Received: from iad12-co-svc-p1-lb1-vlan2.amazon.com (HELO
 email-inbound-relay-2a-d0be17ee.us-west-2.amazon.com) ([10.43.8.2])
 by smtp-border-fw-out-4101.iad4.amazon.com with ESMTP;
 26 Feb 2021 14:42:03 +0000
Received: from EX13D37EUA004.ant.amazon.com
 (pdx1-ws-svc-p6-lb9-vlan3.pdx.amazon.com [10.236.137.198])
 by email-inbound-relay-2a-d0be17ee.us-west-2.amazon.com (Postfix) with ESMTPS
 id EDDA7A25E2; Fri, 26 Feb 2021 14:42:02 +0000 (UTC)
Received: from EX13MTAUEB002.ant.amazon.com (10.43.60.12) by
 EX13D37EUA004.ant.amazon.com (10.43.165.124) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Fri, 26 Feb 2021 14:42:01 +0000
Received: from u6fc700a6f3c650.ant.amazon.com (10.1.212.27) by
 mail-relay.amazon.com (10.43.60.234) with Microsoft SMTP Server id
 15.0.1497.2 via Frontend Transport; Fri, 26 Feb 2021 14:41:59 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: 8e33ec5c-6a09-4a29-8acd-5a78c6b34fad
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.de; i=@amazon.de; q=dns/txt; s=amazon201209;
  t=1614350531; x=1645886531;
  h=from:to:cc:subject:date:message-id:mime-version;
  bh=MrpNszt3xmQUZDbSv/CS/qvXEazMfVAoaD1nb9pai1Q=;
  b=cuv3sbHfYAMqB6rIQ5lWVSjPU5bTrG/7Mc9kMpsxGvjZu5uA6PA9vpPh
   JPilmWxzksfEIz1EprZGGSskK8YV1E1tT4SxQmk+1t4yfnUsjOZgEipy5
   jmMz5rxu91NbvHBpa/ZU7mkqg3GP3IZdKl9zxHgMHVlvYI2nFM1/+cGHn
   c=;
X-IronPort-AV: E=Sophos;i="5.81,208,1610409600"; 
   d="scan'208";a="88627962"
From: Norbert Manthey <nmanthey@amazon.de>
To: <xen-devel@lists.xenproject.org>
CC: Ian Jackson <iwj@xenproject.org>, Juergen Gross <jgross@suse.com>, Wei Liu
	<wl@xen.org>, Julien Grall <jgrall@amazon.co.uk>, Michael Kurth
	<mku@amazon.de>, Norbert Manthey <nmanthey@amazon.de>
Subject: [PATCH XENSTORE v1 00/10] Code analysis fixes
Date: Fri, 26 Feb 2021 15:41:34 +0100
Message-ID: <20210226144144.9252-1-nmanthey@amazon.de>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
Precedence: Bulk

Dear all,

we have been running some code analysis tools on the xenstore code, and triaged
the results. This series presents the robustness fixes we identified.

Best,
Norbert

Michael Kurth (1):
  xenstore: add missing NULL check

Norbert Manthey (9):
  xenstore: add missing NULL check
  xenstore: fix print format string
  xenstore: check formats of trace
  xenstore_client: handle memory on error
  xenstore: handle daemon creation errors
  xenstored: handle port reads correctly
  xenstore: handle do_mkdir and do_rm failure
  xs: handle daemon socket error
  xs: add error handling

 tools/libs/store/xs.c            | 10 +++++++++-
 tools/xenstore/xenstore_client.c |  3 +++
 tools/xenstore/xenstored_core.c  | 16 ++++++++++++++++
 tools/xenstore/xenstored_core.h  |  2 +-
 tools/xenstore/xenstored_posix.c |  6 +++++-
 tools/xenstore/xs_tdb_dump.c     |  6 +++---
 6 files changed, 37 insertions(+), 6 deletions(-)

-- 
2.17.1




Amazon Development Center Germany GmbH
Krausenstr. 38
10117 Berlin
Geschaeftsfuehrung: Christian Schlaeger, Jonathan Weiss
Eingetragen am Amtsgericht Charlottenburg unter HRB 149173 B
Sitz: Berlin
Ust-ID: DE 289 237 879




