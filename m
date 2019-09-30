Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BF2EC1F35
	for <lists+xen-devel@lfdr.de>; Mon, 30 Sep 2019 12:38:30 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iEt2w-0002OW-QW; Mon, 30 Sep 2019 10:36:50 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Wfc7=XZ=amazon.com=prvs=169663feb=hongyax@srs-us1.protection.inumbo.net>)
 id 1iEt2u-0002MC-VZ
 for xen-devel@lists.xenproject.org; Mon, 30 Sep 2019 10:36:49 +0000
X-Inumbo-ID: 1fc7b422-e36e-11e9-97fb-bc764e2007e4
Received: from smtp-fw-33001.amazon.com (unknown [207.171.190.10])
 by localhost (Halon) with ESMTPS
 id 1fc7b422-e36e-11e9-97fb-bc764e2007e4;
 Mon, 30 Sep 2019 10:36:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1569839773; x=1601375773;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=ac2eimXv3IPFD3HqKUmOTeHhR84IFbsA9dhs2/WCnXI=;
 b=lsFELa8M3P7Dql2TrMRjKhf00mcLB3BMNFD0XyfJKgZW7YiJBdOPgQBG
 e9vDLUoVZcA0tjLIklR67gVl+16ndYQJvnA7+NGTvt8r/YOkmTzDJBeFv
 fNbMEbFyl6+ooSujR9H5doNM5TtjsT5jE+0mLo4+8JaZJTo218XttfsQu o=;
X-IronPort-AV: E=Sophos;i="5.64,565,1559520000"; d="scan'208";a="838005697"
Received: from sea3-co-svc-lb6-vlan2.sea.amazon.com (HELO
 email-inbound-relay-1a-807d4a99.us-east-1.amazon.com) ([10.47.22.34])
 by smtp-border-fw-out-33001.sea14.amazon.com with ESMTP;
 30 Sep 2019 10:35:13 +0000
Received: from EX13MTAUEA001.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan2.iad.amazon.com [10.40.159.162])
 by email-inbound-relay-1a-807d4a99.us-east-1.amazon.com (Postfix) with ESMTPS
 id 42D59A306A; Mon, 30 Sep 2019 10:34:59 +0000 (UTC)
Received: from EX13D21UEE004.ant.amazon.com (10.43.62.91) by
 EX13MTAUEA001.ant.amazon.com (10.43.61.243) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Mon, 30 Sep 2019 10:34:39 +0000
Received: from EX13MTAUEE001.ant.amazon.com (10.43.62.200) by
 EX13D21UEE004.ant.amazon.com (10.43.62.91) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Mon, 30 Sep 2019 10:34:38 +0000
Received: from u9d785c4ba99158.ant.amazon.com (10.125.106.78) by
 mail-relay.amazon.com (10.43.62.226) with Microsoft SMTP Server id
 15.0.1367.3 via Frontend Transport; Mon, 30 Sep 2019 10:34:38 +0000
From: Hongyan Xia <hongyax@amazon.com>
To: <xen-devel@lists.xenproject.org>
Date: Mon, 30 Sep 2019 11:33:44 +0100
Message-ID: <8e25d1ca1b754a9e368ccf12375730ae7b76ca57.1569833766.git.hongyax@amazon.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1569833766.git.hongyax@amazon.com>
References: <cover.1569833766.git.hongyax@amazon.com>
MIME-Version: 1.0
Precedence: Bulk
Subject: [Xen-devel] [PATCH v2 52/55] x86: remove lXe_to_lYe in __start_xen
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RnJvbTogV2VpIExpdSA8d2VpLmxpdTJAY2l0cml4LmNvbT4KClByb3Blcmx5IG1hcCBhbmQgdW5t
YXAgcGFnZSB0YWJsZXMgd2hlcmUgbmVjZXNzYXJ5LgoKU2lnbmVkLW9mZi1ieTogV2VpIExpdSA8
d2VpLmxpdTJAY2l0cml4LmNvbT4KLS0tCiB4ZW4vYXJjaC94ODYvc2V0dXAuYyB8IDEwICsrKysr
KysrLS0KIDEgZmlsZSBjaGFuZ2VkLCA4IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCgpk
aWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L3NldHVwLmMgYi94ZW4vYXJjaC94ODYvc2V0dXAuYwpp
bmRleCBkZWM2MGQwMzAxLi5kMjdiY2YxNzI0IDEwMDY0NAotLS0gYS94ZW4vYXJjaC94ODYvc2V0
dXAuYworKysgYi94ZW4vYXJjaC94ODYvc2V0dXAuYwpAQCAtMTA5NSwxMyArMTA5NSwxNyBAQCB2
b2lkIF9faW5pdCBub3JldHVybiBfX3N0YXJ0X3hlbih1bnNpZ25lZCBsb25nIG1iaV9wKQogICAg
ICAgICAgICAgcGw0ZSA9IF9fdmEoX19wYShpZGxlX3BnX3RhYmxlKSk7CiAgICAgICAgICAgICBm
b3IgKCBpID0gMCA7IGkgPCBMNF9QQUdFVEFCTEVfRU5UUklFUzsgaSsrLCBwbDRlKysgKQogICAg
ICAgICAgICAgeworICAgICAgICAgICAgICAgIGwzX3BnZW50cnlfdCAqbDN0OworCiAgICAgICAg
ICAgICAgICAgaWYgKCAhKGw0ZV9nZXRfZmxhZ3MoKnBsNGUpICYgX1BBR0VfUFJFU0VOVCkgKQog
ICAgICAgICAgICAgICAgICAgICBjb250aW51ZTsKICAgICAgICAgICAgICAgICAqcGw0ZSA9IGw0
ZV9mcm9tX2ludHB0ZShsNGVfZ2V0X2ludHB0ZSgqcGw0ZSkgKwogICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIHhlbl9waHlzX3N0YXJ0KTsKLSAgICAgICAgICAgICAgICBw
bDNlID0gbDRlX3RvX2wzZSgqcGw0ZSk7CisgICAgICAgICAgICAgICAgcGwzZSA9IGwzdCA9IG1h
cF94ZW5fcGFnZXRhYmxlX25ldyhsNGVfZ2V0X21mbigqcGw0ZSkpOwogICAgICAgICAgICAgICAg
IGZvciAoIGogPSAwOyBqIDwgTDNfUEFHRVRBQkxFX0VOVFJJRVM7IGorKywgcGwzZSsrICkKICAg
ICAgICAgICAgICAgICB7CisgICAgICAgICAgICAgICAgICAgIGwyX3BnZW50cnlfdCAqbDJ0Owor
CiAgICAgICAgICAgICAgICAgICAgIC8qIE5vdCBwcmVzZW50LCAxR0IgbWFwcGluZywgb3IgYWxy
ZWFkeSByZWxvY2F0ZWQ/ICovCiAgICAgICAgICAgICAgICAgICAgIGlmICggIShsM2VfZ2V0X2Zs
YWdzKCpwbDNlKSAmIF9QQUdFX1BSRVNFTlQpIHx8CiAgICAgICAgICAgICAgICAgICAgICAgICAg
KGwzZV9nZXRfZmxhZ3MoKnBsM2UpICYgX1BBR0VfUFNFKSB8fApAQCAtMTEwOSw3ICsxMTEzLDcg
QEAgdm9pZCBfX2luaXQgbm9yZXR1cm4gX19zdGFydF94ZW4odW5zaWduZWQgbG9uZyBtYmlfcCkK
ICAgICAgICAgICAgICAgICAgICAgICAgIGNvbnRpbnVlOwogICAgICAgICAgICAgICAgICAgICAq
cGwzZSA9IGwzZV9mcm9tX2ludHB0ZShsM2VfZ2V0X2ludHB0ZSgqcGwzZSkgKwogICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB4ZW5fcGh5c19zdGFydCk7Ci0gICAg
ICAgICAgICAgICAgICAgIHBsMmUgPSBsM2VfdG9fbDJlKCpwbDNlKTsKKyAgICAgICAgICAgICAg
ICAgICAgcGwyZSA9IGwydCA9IG1hcF94ZW5fcGFnZXRhYmxlX25ldyhsM2VfZ2V0X21mbigqcGwz
ZSkpOwogICAgICAgICAgICAgICAgICAgICBmb3IgKCBrID0gMDsgayA8IEwyX1BBR0VUQUJMRV9F
TlRSSUVTOyBrKyssIHBsMmUrKyApCiAgICAgICAgICAgICAgICAgICAgIHsKICAgICAgICAgICAg
ICAgICAgICAgICAgIC8qIE5vdCBwcmVzZW50LCBQU0UsIG9yIGFscmVhZHkgcmVsb2NhdGVkPyAq
LwpAQCAtMTEyMCw3ICsxMTI0LDkgQEAgdm9pZCBfX2luaXQgbm9yZXR1cm4gX19zdGFydF94ZW4o
dW5zaWduZWQgbG9uZyBtYmlfcCkKICAgICAgICAgICAgICAgICAgICAgICAgICpwbDJlID0gbDJl
X2Zyb21faW50cHRlKGwyZV9nZXRfaW50cHRlKCpwbDJlKSArCiAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICB4ZW5fcGh5c19zdGFydCk7CiAgICAgICAgICAg
ICAgICAgICAgIH0KKyAgICAgICAgICAgICAgICAgICAgVU5NQVBfWEVOX1BBR0VUQUJMRV9ORVco
bDJ0KTsKICAgICAgICAgICAgICAgICB9CisgICAgICAgICAgICAgICAgVU5NQVBfWEVOX1BBR0VU
QUJMRV9ORVcobDN0KTsKICAgICAgICAgICAgIH0KIAogICAgICAgICAgICAgLyogVGhlIG9ubHkg
ZGF0YSBtYXBwaW5ncyB0byBiZSByZWxvY2F0ZWQgYXJlIGluIHRoZSBYZW4gYXJlYS4gKi8KLS0g
CjIuMTcuMQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Clhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0
dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
