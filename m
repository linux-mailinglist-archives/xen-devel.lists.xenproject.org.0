Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 05514BEEF2
	for <lists+xen-devel@lfdr.de>; Thu, 26 Sep 2019 11:52:20 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iDQPE-0006uD-8W; Thu, 26 Sep 2019 09:49:48 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Ph5t=XV=amazon.com=prvs=165c3e20f=hongyax@srs-us1.protection.inumbo.net>)
 id 1iDQPB-0006qk-UV
 for xen-devel@lists.xenproject.org; Thu, 26 Sep 2019 09:49:45 +0000
X-Inumbo-ID: de1c7900-e042-11e9-964c-12813bfff9fa
Received: from smtp-fw-6002.amazon.com (unknown [52.95.49.90])
 by localhost (Halon) with ESMTPS
 id de1c7900-e042-11e9-964c-12813bfff9fa;
 Thu, 26 Sep 2019 09:49:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1569491340; x=1601027340;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=Wby/mGwNUuZMxWF138zkmrPdE1eRR8bcGajq5qTxSXc=;
 b=ojz5PpuGRvxVFs9oILFlpn54wH3wrQe5nl4jxS0Bx51meoAHfuq1TASw
 ns/aJTqJl80UEKlctCrvfqoHmhCd0q3lss7jNNI5KwwYVrtGl9NJByfuS
 QrhTad5tFKjauoSBuXAMazUOxqm04xp/a3KbM9g7jajIUf1rx1SAW9fMc 4=;
X-IronPort-AV: E=Sophos;i="5.64,551,1559520000"; d="scan'208";a="423750630"
Received: from iad6-co-svc-p1-lb1-vlan3.amazon.com (HELO
 email-inbound-relay-1e-97fdccfd.us-east-1.amazon.com) ([10.124.125.6])
 by smtp-border-fw-out-6002.iad6.amazon.com with ESMTP;
 26 Sep 2019 09:49:00 +0000
Received: from EX13MTAUWA001.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan3.iad.amazon.com [10.40.159.166])
 by email-inbound-relay-1e-97fdccfd.us-east-1.amazon.com (Postfix) with ESMTPS
 id DDA02A1F03; Thu, 26 Sep 2019 09:48:58 +0000 (UTC)
Received: from EX13D24UWA004.ant.amazon.com (10.43.160.233) by
 EX13MTAUWA001.ant.amazon.com (10.43.160.58) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Thu, 26 Sep 2019 09:48:31 +0000
Received: from EX13MTAUWA001.ant.amazon.com (10.43.160.58) by
 EX13D24UWA004.ant.amazon.com (10.43.160.233) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Thu, 26 Sep 2019 09:48:30 +0000
Received: from u9d785c4ba99158.ant.amazon.com (10.125.106.58) by
 mail-relay.amazon.com (10.43.160.118) with Microsoft SMTP Server id
 15.0.1367.3 via Frontend Transport; Thu, 26 Sep 2019 09:48:29 +0000
From: <hongyax@amazon.com>
To: <xen-devel@lists.xenproject.org>
Date: Thu, 26 Sep 2019 10:46:16 +0100
Message-ID: <32ae1461fb4177b1586bb7e735da6d58bbee5462.1569489002.git.hongyax@amazon.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1569489002.git.hongyax@amazon.com>
References: <cover.1569489002.git.hongyax@amazon.com>
MIME-Version: 1.0
Precedence: Bulk
Subject: [Xen-devel] [RFC PATCH 53/84] x86: remove lXe_to_lYe in __start_xen
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>,
 Wei Liu <wl@xen.org>, Jan Beulich <jbeulich@suse.com>,
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
bmRleCAyNzk4MWFkYzBiLi4xYzkwNTU5Mjg4IDEwMDY0NAotLS0gYS94ZW4vYXJjaC94ODYvc2V0
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
