Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FC2F16BE09
	for <lists+xen-devel@lfdr.de>; Tue, 25 Feb 2020 10:56:56 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j6Wuw-0005st-Ha; Tue, 25 Feb 2020 09:54:18 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=UoxS=4N=amazon.co.uk=prvs=317b3ba57=pdurrant@srs-us1.protection.inumbo.net>)
 id 1j6Wuv-0005so-FB
 for xen-devel@lists.xenproject.org; Tue, 25 Feb 2020 09:54:17 +0000
X-Inumbo-ID: c931eba8-57b4-11ea-92c4-12813bfff9fa
Received: from smtp-fw-6001.amazon.com (unknown [52.95.48.154])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c931eba8-57b4-11ea-92c4-12813bfff9fa;
 Tue, 25 Feb 2020 09:54:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1582624457; x=1614160457;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=UXf7UlB/PoP3fW/RYpqi+218HSBdFrBEH6tnCjGu63Y=;
 b=a/XL8OdeOx1O87cefNcSqdJMS1hsADzWGf36qrGFbAh20vIq9hivJvZj
 kFnlfFLrugK3y8Mja7GqngqaURkGB3XhwZtuZUE7wyMCZ6NUOb8vksX3y
 utOAg5XipE9G7yU+355DIRTLBgIqFU+LjbR/0DTm8740BiX0oLZkL/Hc+ w=;
IronPort-SDR: FMIJqBOaWGX1BQZZWcdNFO9krvU/J1fWhRshWKHbq6i0NDoFx9VVA3TRLsKjtHSUfrYKnjnC/Y
 Ifs30CZZZG3Q==
X-IronPort-AV: E=Sophos;i="5.70,483,1574121600"; d="scan'208";a="19522465"
Received: from iad12-co-svc-p1-lb1-vlan3.amazon.com (HELO
 email-inbound-relay-2c-87a10be6.us-west-2.amazon.com) ([10.43.8.6])
 by smtp-border-fw-out-6001.iad6.amazon.com with ESMTP;
 25 Feb 2020 09:54:04 +0000
Received: from EX13MTAUEA002.ant.amazon.com
 (pdx4-ws-svc-p6-lb7-vlan2.pdx.amazon.com [10.170.41.162])
 by email-inbound-relay-2c-87a10be6.us-west-2.amazon.com (Postfix) with ESMTPS
 id 4EC7AA23B6
 for <xen-devel@lists.xenproject.org>; Tue, 25 Feb 2020 09:54:03 +0000 (UTC)
Received: from EX13D32EUC001.ant.amazon.com (10.43.164.159) by
 EX13MTAUEA002.ant.amazon.com (10.43.61.77) with Microsoft SMTP Server (TLS)
 id 15.0.1236.3; Tue, 25 Feb 2020 09:54:02 +0000
Received: from EX13MTAUWA001.ant.amazon.com (10.43.160.58) by
 EX13D32EUC001.ant.amazon.com (10.43.164.159) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Tue, 25 Feb 2020 09:54:01 +0000
Received: from u2f063a87eabd5f.cbg10.amazon.com (10.125.106.135) by
 mail-relay.amazon.com (10.43.160.118) with Microsoft SMTP Server id
 15.0.1367.3 via Frontend Transport; Tue, 25 Feb 2020 09:53:59 +0000
From: Paul Durrant <pdurrant@amazon.com>
To: <xen-devel@lists.xenproject.org>
Date: Tue, 25 Feb 2020 09:53:55 +0000
Message-ID: <20200225095357.3923-1-pdurrant@amazon.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Precedence: Bulk
Subject: [Xen-devel] [PATCH 0/2] remove one more shared xenheap page:
 shared_info
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

UGF1bCBEdXJyYW50ICgyKToKICBkb21haW46IGludHJvZHVjZSBhbGxvYy9mcmVlX3NoYXJlZF9p
bmZvKCkgaGVscGVycy4uLgogIGRvbWFpbjogdXNlIFBHQ19leHRyYSBkb21oZWFwIHBhZ2UgZm9y
IHNoYXJlZF9pbmZvCgogeGVuL2FyY2gvYXJtL2RvbWFpbi5jICAgICAgICB8IDEwICsrKystLS0t
LQogeGVuL2FyY2gvYXJtL21tLmMgICAgICAgICAgICB8ICAyICstCiB4ZW4vYXJjaC94ODYvZG9t
YWluLmMgICAgICAgIHwgMTIgKysrKystLS0tLQogeGVuL2FyY2gveDg2L21tLmMgICAgICAgICAg
ICB8ICAyICstCiB4ZW4vYXJjaC94ODYvbW0vcDJtLmMgICAgICAgIHwgIDMgKy0tCiB4ZW4vYXJj
aC94ODYvcHYvZG9tMF9idWlsZC5jIHwgIDYgKysrKy0KIHhlbi9hcmNoL3g4Ni9wdi9zaGltLmMg
ICAgICAgfCAgMiArLQogeGVuL2NvbW1vbi9kb21haW4uYyAgICAgICAgICB8IDQzICsrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKystLQogeGVuL2NvbW1vbi9kb21jdGwuYyAgICAgICAg
ICB8ICAyICstCiB4ZW4vY29tbW9uL2V2ZW50XzJsLmMgICAgICAgIHwgIDQgKysrKwogeGVuL2Nv
bW1vbi9ldmVudF9maWZvLmMgICAgICB8ICAxICsKIHhlbi9jb21tb24vdGltZS5jICAgICAgICAg
ICAgfCAgNyArKysrLS0KIHhlbi9pbmNsdWRlL2FzbS14ODYvc2hhcmVkLmggfCAxNSArKysrKysr
LS0tLS0tCiB4ZW4vaW5jbHVkZS94ZW4vZG9tYWluLmggICAgIHwgIDMgKysrCiB4ZW4vaW5jbHVk
ZS94ZW4vc2NoZWQuaCAgICAgIHwgIDUgKysrKy0KIHhlbi9pbmNsdWRlL3hlbi9zaGFyZWQuaCAg
ICAgfCAgMiArLQogMTYgZmlsZXMgY2hhbmdlZCwgODYgaW5zZXJ0aW9ucygrKSwgMzMgZGVsZXRp
b25zKC0pCgotLSAKMi4yMC4xCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hl
bi1kZXZlbA==
