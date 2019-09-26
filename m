Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ECC42BEEEC
	for <lists+xen-devel@lfdr.de>; Thu, 26 Sep 2019 11:52:04 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iDQOu-0006FR-6x; Thu, 26 Sep 2019 09:49:28 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Ph5t=XV=amazon.com=prvs=165c3e20f=hongyax@srs-us1.protection.inumbo.net>)
 id 1iDQOr-0006BS-U9
 for xen-devel@lists.xenproject.org; Thu, 26 Sep 2019 09:49:25 +0000
X-Inumbo-ID: dac3b55d-e042-11e9-964c-12813bfff9fa
Received: from smtp-fw-9102.amazon.com (unknown [207.171.184.29])
 by localhost (Halon) with ESMTPS
 id dac3b55d-e042-11e9-964c-12813bfff9fa;
 Thu, 26 Sep 2019 09:48:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1569491336; x=1601027336;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=5Q2XE0XvYzUty69qqRlTGEEguqCrML7ftDS0JmcjKEo=;
 b=vZs6ypAmKaV/ssztcrieLjCkc8w+9mUfpHTEB7hibcWeWNwew7xIIc+Q
 Nn/rJpCBQVrBZnOg7o7C4tWpbqc5W7cxvwA38N1h09EAyp3/HLH2UV7jE
 FAZ2aQPawwDlW7F3irz1rFOv842xRlT9Hfo5GxUqXk12F0qm7AGYjWby6 M=;
X-IronPort-AV: E=Sophos;i="5.64,551,1559520000"; d="scan'208";a="704637159"
Received: from sea3-co-svc-lb6-vlan3.sea.amazon.com (HELO
 email-inbound-relay-1d-37fd6b3d.us-east-1.amazon.com) ([10.47.22.38])
 by smtp-border-fw-out-9102.sea19.amazon.com with ESMTP;
 26 Sep 2019 09:47:14 +0000
Received: from EX13MTAUWA001.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan2.iad.amazon.com [10.40.159.162])
 by email-inbound-relay-1d-37fd6b3d.us-east-1.amazon.com (Postfix) with ESMTPS
 id AADD6281FDE; Thu, 26 Sep 2019 09:46:57 +0000 (UTC)
Received: from EX13D19UWA001.ant.amazon.com (10.43.160.169) by
 EX13MTAUWA001.ant.amazon.com (10.43.160.58) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Thu, 26 Sep 2019 09:46:57 +0000
Received: from EX13MTAUWA001.ant.amazon.com (10.43.160.58) by
 EX13D19UWA001.ant.amazon.com (10.43.160.169) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Thu, 26 Sep 2019 09:46:56 +0000
Received: from u9d785c4ba99158.ant.amazon.com (10.125.106.58) by
 mail-relay.amazon.com (10.43.160.118) with Microsoft SMTP Server id
 15.0.1367.3 via Frontend Transport; Thu, 26 Sep 2019 09:46:55 +0000
From: <hongyax@amazon.com>
To: <xen-devel@lists.xenproject.org>
Date: Thu, 26 Sep 2019 10:45:25 +0100
Message-ID: <70b327fb33bf4e53ce98ad547589170fa93c62fe.1569489002.git.hongyax@amazon.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1569489002.git.hongyax@amazon.com>
References: <cover.1569489002.git.hongyax@amazon.com>
MIME-Version: 1.0
Precedence: Bulk
Subject: [Xen-devel] [RFC PATCH 02/84] x86: move some xen mm function
 declarations
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

RnJvbTogV2VpIExpdSA8d2VpLmxpdTJAY2l0cml4LmNvbT4KClRoZXkgd2VyZSBwdXQgaW50byBw
YWdlLmggYnV0IG1tLmggaXMgbW9yZSBhcHByb3ByaWF0ZS4KClRoZSByZWFsIHJlYXNvbiBpcyB0
aGF0IEkgd2lsbCBiZSBhZGRpbmcgc29tZSBuZXcgZnVuY3Rpb25zIHdoaWNoCnRha2VzIG1mbl90
LiBJdCB0dXJucyBvdXQgaXQgaXMgYSBiaXQgZGlmZmljdWx0IHRvIGRvIGluIHBhZ2UuaC4KCk5v
IGZ1bmN0aW9uYWwgY2hhbmdlLgoKU2lnbmVkLW9mZi1ieTogV2VpIExpdSA8d2VpLmxpdTJAY2l0
cml4LmNvbT4KLS0tCiB4ZW4vaW5jbHVkZS9hc20teDg2L21tLmggICB8IDUgKysrKysKIHhlbi9p
bmNsdWRlL2FzbS14ODYvcGFnZS5oIHwgNSAtLS0tLQogMiBmaWxlcyBjaGFuZ2VkLCA1IGluc2Vy
dGlvbnMoKyksIDUgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEveGVuL2luY2x1ZGUvYXNtLXg4
Ni9tbS5oIGIveGVuL2luY2x1ZGUvYXNtLXg4Ni9tbS5oCmluZGV4IDM4NjNlNGNlNTcuLjI4MDAx
MDYzMjcgMTAwNjQ0Ci0tLSBhL3hlbi9pbmNsdWRlL2FzbS14ODYvbW0uaAorKysgYi94ZW4vaW5j
bHVkZS9hc20teDg2L21tLmgKQEAgLTYzMCw0ICs2MzAsOSBAQCBpbnQgYXJjaF9hY3F1aXJlX3Jl
c291cmNlKHN0cnVjdCBkb21haW4gKmQsIHVuc2lnbmVkIGludCB0eXBlLAogICAgICAgICAgICAg
ICAgICAgICAgICAgICB1bnNpZ25lZCBpbnQgaWQsIHVuc2lnbmVkIGxvbmcgZnJhbWUsCiAgICAg
ICAgICAgICAgICAgICAgICAgICAgIHVuc2lnbmVkIGludCBucl9mcmFtZXMsIHhlbl9wZm5fdCBt
Zm5fbGlzdFtdKTsKIAorLyogQWxsb2NhdG9yIGZ1bmN0aW9ucyBmb3IgWGVuIHBhZ2V0YWJsZXMu
ICovCit2b2lkICphbGxvY194ZW5fcGFnZXRhYmxlKHZvaWQpOwordm9pZCBmcmVlX3hlbl9wYWdl
dGFibGUodm9pZCAqdik7CitsMV9wZ2VudHJ5X3QgKnZpcnRfdG9feGVuX2wxZSh1bnNpZ25lZCBs
b25nIHYpOworCiAjZW5kaWYgLyogX19BU01fWDg2X01NX0hfXyAqLwpkaWZmIC0tZ2l0IGEveGVu
L2luY2x1ZGUvYXNtLXg4Ni9wYWdlLmggYi94ZW4vaW5jbHVkZS9hc20teDg2L3BhZ2UuaAppbmRl
eCBjMWU5MjkzN2MwLi4wNWE4YjFlZmE2IDEwMDY0NAotLS0gYS94ZW4vaW5jbHVkZS9hc20teDg2
L3BhZ2UuaAorKysgYi94ZW4vaW5jbHVkZS9hc20teDg2L3BhZ2UuaApAQCAtMzQ1LDExICszNDUs
NiBAQCB2b2lkIGVmaV91cGRhdGVfbDRfcGd0YWJsZSh1bnNpZ25lZCBpbnQgbDRpZHgsIGw0X3Bn
ZW50cnlfdCk7CiAKICNpZm5kZWYgX19BU1NFTUJMWV9fCiAKLS8qIEFsbG9jYXRvciBmdW5jdGlv
bnMgZm9yIFhlbiBwYWdldGFibGVzLiAqLwotdm9pZCAqYWxsb2NfeGVuX3BhZ2V0YWJsZSh2b2lk
KTsKLXZvaWQgZnJlZV94ZW5fcGFnZXRhYmxlKHZvaWQgKnYpOwotbDFfcGdlbnRyeV90ICp2aXJ0
X3RvX3hlbl9sMWUodW5zaWduZWQgbG9uZyB2KTsKLQogLyogQ29udmVydCBiZXR3ZWVuIFBBVC9Q
Q0QvUFdUIGVtYmVkZGVkIGluIFBURSBmbGFncyBhbmQgMy1iaXQgY2FjaGVhdHRyLiAqLwogc3Rh
dGljIGlubGluZSB1bnNpZ25lZCBpbnQgcHRlX2ZsYWdzX3RvX2NhY2hlYXR0cih1bnNpZ25lZCBp
bnQgZmxhZ3MpCiB7Ci0tIAoyLjE3LjEKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVs
