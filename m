Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DC99123C7C
	for <lists+xen-devel@lfdr.de>; Wed, 18 Dec 2019 02:36:54 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ihODy-00061n-Hk; Wed, 18 Dec 2019 01:34:02 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=8lPW=2I=amazon.com=prvs=2481dc0fd=elnikety@srs-us1.protection.inumbo.net>)
 id 1ihODx-00061M-13
 for xen-devel@lists.xenproject.org; Wed, 18 Dec 2019 01:34:01 +0000
X-Inumbo-ID: 726e30c4-2136-11ea-b6f1-bc764e2007e4
Received: from smtp-fw-33001.amazon.com (unknown [207.171.190.10])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 726e30c4-2136-11ea-b6f1-bc764e2007e4;
 Wed, 18 Dec 2019 01:33:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1576632833; x=1608168833;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=wFPcKATxYt8ii+z7WoVMDj3MEqdBz73OudrsmUok3lw=;
 b=Xbbw6MYIo30eQJ9xtvengxtNGBAm8pOHoDy+mMgwR5aonDVFBC9+rsam
 kpQIQ4/khA/IlXedOZvNS32pr5eT6GHgAAUEkKrHOxkNFJSgHyGUKZBVj
 Yp09gPmrevUjnb5CnPhSano/xS6nr3nVx9glD25P3p86VkNI7fxdBITW9 Y=;
IronPort-SDR: RuYN8gQ0d0tJ2TdaItZcvEuBkJb9HdfJz0WkorcmT5Kd8/qbGdZAS6Lv18RGUaNxJ6zmoxiZQJ
 ELtg+N5galBw==
X-IronPort-AV: E=Sophos;i="5.69,327,1571702400"; d="scan'208";a="15519648"
Received: from sea32-co-svc-lb4-vlan3.sea.corp.amazon.com (HELO
 email-inbound-relay-2a-f14f4a47.us-west-2.amazon.com) ([10.47.23.38])
 by smtp-border-fw-out-33001.sea14.amazon.com with ESMTP;
 18 Dec 2019 01:33:50 +0000
Received: from EX13MTAUEE002.ant.amazon.com
 (pdx4-ws-svc-p6-lb7-vlan2.pdx.amazon.com [10.170.41.162])
 by email-inbound-relay-2a-f14f4a47.us-west-2.amazon.com (Postfix) with ESMTPS
 id A44A6A2A15; Wed, 18 Dec 2019 01:33:49 +0000 (UTC)
Received: from EX13D08UEE002.ant.amazon.com (10.43.62.92) by
 EX13MTAUEE002.ant.amazon.com (10.43.62.24) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Wed, 18 Dec 2019 01:33:37 +0000
Received: from EX13MTAUWB001.ant.amazon.com (10.43.161.207) by
 EX13D08UEE002.ant.amazon.com (10.43.62.92) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Wed, 18 Dec 2019 01:33:37 +0000
Received: from dev-dsk-elnikety-1b-cd63f796.eu-west-1.amazon.com (10.15.63.96)
 by mail-relay.amazon.com (10.43.161.249) with Microsoft SMTP Server
 id
 15.0.1367.3 via Frontend Transport; Wed, 18 Dec 2019 01:33:36 +0000
Received: by dev-dsk-elnikety-1b-cd63f796.eu-west-1.amazon.com (Postfix,
 from userid 6438462)
 id 53C8EA0141; Wed, 18 Dec 2019 01:33:36 +0000 (UTC)
From: Eslam Elnikety <elnikety@amazon.com>
To: <xen-devel@lists.xenproject.org>
Date: Wed, 18 Dec 2019 01:32:58 +0000
Message-ID: <3c4b61a2888f01b9344fd302603c56a8739a1c71.1576630344.git.elnikety@amazon.com>
X-Mailer: git-send-email 2.16.5
In-Reply-To: <cover.1576630344.git.elnikety@amazon.com>
References: <cover.1576630344.git.elnikety@amazon.com>
MIME-Version: 1.0
Precedence: Bulk
Subject: [Xen-devel] [PATCH v2 3/4] x86/microcode: use const qualifier for
 microcode buffer
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Eslam Elnikety <elnikety@amazon.com>,
 Paul Durrant <pdurrant@amazon.co.uk>, Jan Beulich <jbeulich@suse.com>,
 David Woodhouse <dwmw@amazon.co.uk>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhlIGJ1ZmZlciBob2xkaW5nIHRoZSBtaWNyb2NvZGUgYml0cyBzaG91bGQgYmUgbWFya2VkIGFz
IGNvbnN0LgoKU2lnbmVkLW9mZi1ieTogRXNsYW0gRWxuaWtldHkgPGVsbmlrZXR5QGFtYXpvbi5j
b20+Ci0tLQogeGVuL2FyY2gveDg2L21pY3JvY29kZS5jIHwgNCArKy0tCiAxIGZpbGUgY2hhbmdl
ZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3hlbi9hcmNo
L3g4Ni9taWNyb2NvZGUuYyBiL3hlbi9hcmNoL3g4Ni9taWNyb2NvZGUuYwppbmRleCBjODc4ZmM3
MWZmLi40NjE2ZmE5ZDJlIDEwMDY0NAotLS0gYS94ZW4vYXJjaC94ODYvbWljcm9jb2RlLmMKKysr
IGIveGVuL2FyY2gveDg2L21pY3JvY29kZS5jCkBAIC04Niw3ICs4Niw3IEBAIHN0YXRpYyBlbnVt
IHsKICAqIG1lbW9yeS4KICAqLwogc3RydWN0IHVjb2RlX21vZF9ibG9iIHsKLSAgICB2b2lkICpk
YXRhOworICAgIGNvbnN0IHZvaWQgKmRhdGE7CiAgICAgc2l6ZV90IHNpemU7CiB9OwogCkBAIC03
NDQsNyArNzQ0LDcgQEAgaW50IG1pY3JvY29kZV91cGRhdGVfb25lKGJvb2wgc3RhcnRfdXBkYXRl
KQogaW50IF9faW5pdCBlYXJseV9taWNyb2NvZGVfdXBkYXRlX2NwdSh2b2lkKQogewogICAgIGlu
dCByYyA9IDA7Ci0gICAgdm9pZCAqZGF0YSA9IE5VTEw7CisgICAgY29uc3Qgdm9pZCAqZGF0YSA9
IE5VTEw7CiAgICAgc2l6ZV90IGxlbjsKICAgICBzdHJ1Y3QgbWljcm9jb2RlX3BhdGNoICpwYXRj
aDsKIAotLSAKMi4xNy4xCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVj
dC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1k
ZXZlbA==
