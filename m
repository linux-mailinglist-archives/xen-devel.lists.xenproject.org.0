Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 55B2414CCC5
	for <lists+xen-devel@lfdr.de>; Wed, 29 Jan 2020 15:50:59 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iwocj-0007aj-6L; Wed, 29 Jan 2020 14:47:21 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=xIWx=3S=amazon.co.uk=prvs=2906e62af=pdurrant@srs-us1.protection.inumbo.net>)
 id 1iwoch-0007aQ-Kt
 for xen-devel@lists.xenproject.org; Wed, 29 Jan 2020 14:47:19 +0000
X-Inumbo-ID: 3fa17ac0-42a6-11ea-a933-bc764e2007e4
Received: from smtp-fw-9102.amazon.com (unknown [207.171.184.29])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3fa17ac0-42a6-11ea-a933-bc764e2007e4;
 Wed, 29 Jan 2020 14:47:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1580309240; x=1611845240;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=OEwhNeRnXFjgRYwyOAHM01inRdwQjnD5Bs+wKMi8Ypg=;
 b=iCCIyyl+VQ2J6HN/vfnS3lws26bylobyAnd3hvqdFsY0gCQJ6vjx3dOm
 dS8XslJ7dyGqW5v+vxeeYJ+Sm11ELmVJrWkuwqy5/j5Pr4uCHq0JS9LL6
 AYf7sk/0FSN+f83MPgvQ44D8xnVMFemJvrYFifgpBOxr7d0h1b3ifqV2e A=;
IronPort-SDR: X8CLn3m1XRUN5/f92KHosQXzpWGt/NpHVoILy7vUM3kFmdgJ/GNqwjga97gJQzw5uttyq9K7nA
 nm41SIpv7zfQ==
X-IronPort-AV: E=Sophos;i="5.70,378,1574121600"; d="scan'208";a="21809415"
Received: from sea32-co-svc-lb4-vlan3.sea.corp.amazon.com (HELO
 email-inbound-relay-1d-74cf8b49.us-east-1.amazon.com) ([10.47.23.38])
 by smtp-border-fw-out-9102.sea19.amazon.com with ESMTP;
 29 Jan 2020 14:47:08 +0000
Received: from EX13MTAUEA002.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan2.iad.amazon.com [10.40.159.162])
 by email-inbound-relay-1d-74cf8b49.us-east-1.amazon.com (Postfix) with ESMTPS
 id CCB78C107A
 for <xen-devel@lists.xenproject.org>; Wed, 29 Jan 2020 14:47:06 +0000 (UTC)
Received: from EX13D32EUC002.ant.amazon.com (10.43.164.94) by
 EX13MTAUEA002.ant.amazon.com (10.43.61.77) with Microsoft SMTP Server (TLS)
 id 15.0.1236.3; Wed, 29 Jan 2020 14:47:06 +0000
Received: from EX13MTAUEA002.ant.amazon.com (10.43.61.77) by
 EX13D32EUC002.ant.amazon.com (10.43.164.94) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Wed, 29 Jan 2020 14:47:05 +0000
Received: from u2f063a87eabd5f.cbg10.amazon.com (10.125.106.135) by
 mail-relay.amazon.com (10.43.61.169) with Microsoft SMTP Server id
 15.0.1236.3 via Frontend Transport; Wed, 29 Jan 2020 14:47:04 +0000
From: Paul Durrant <pdurrant@amazon.com>
To: <xen-devel@lists.xenproject.org>
Date: Wed, 29 Jan 2020 14:47:00 +0000
Message-ID: <20200129144702.1543-1-pdurrant@amazon.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Precedence: Bulk
Subject: [Xen-devel] [PATCH v4 0/2] docs: Migration design documents
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Paul Durrant <pdurrant@amazon.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

UGF1bCBEdXJyYW50ICgyKToKICBkb2NzL2Rlc2lnbnM6IEFkZCBhIGRlc2lnbiBkb2N1bWVudCBm
b3Igbm9uLWNvb3BlcmF0aXZlIGxpdmUgbWlncmF0aW9uCiAgZG9jcy9kZXNpZ25zOiBBZGQgYSBk
ZXNpZ24gZG9jdW1lbnQgZm9yIG1pZ3JhdGlvbiBvZiB4ZW5zdG9yZSBkYXRhCgogZG9jcy9kZXNp
Z25zL25vbi1jb29wZXJhdGl2ZS1taWdyYXRpb24ubWQgfCAyNzIgKysrKysrKysrKysrKysrKysr
KysrKwogZG9jcy9kZXNpZ25zL3hlbnN0b3JlLW1pZ3JhdGlvbi5tZCAgICAgICAgfCAxMjEgKysr
KysrKysrKwogMiBmaWxlcyBjaGFuZ2VkLCAzOTMgaW5zZXJ0aW9ucygrKQogY3JlYXRlIG1vZGUg
MTAwNjQ0IGRvY3MvZGVzaWducy9ub24tY29vcGVyYXRpdmUtbWlncmF0aW9uLm1kCiBjcmVhdGUg
bW9kZSAxMDA2NDQgZG9jcy9kZXNpZ25zL3hlbnN0b3JlLW1pZ3JhdGlvbi5tZAoKLS0gCjIuMjAu
MQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1k
ZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8v
bGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
