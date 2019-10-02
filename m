Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D05C6C8FAA
	for <lists+xen-devel@lfdr.de>; Wed,  2 Oct 2019 19:19:52 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iFiFV-0008EV-Be; Wed, 02 Oct 2019 17:17:13 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=aMxB=X3=amazon.com=prvs=17142d732=hongyax@srs-us1.protection.inumbo.net>)
 id 1iFiFT-0008E9-Sm
 for xen-devel@lists.xenproject.org; Wed, 02 Oct 2019 17:17:11 +0000
X-Inumbo-ID: 7365c29c-e538-11e9-bf31-bc764e2007e4
Received: from smtp-fw-6001.amazon.com (unknown [52.95.48.154])
 by localhost (Halon) with ESMTPS
 id 7365c29c-e538-11e9-bf31-bc764e2007e4;
 Wed, 02 Oct 2019 17:17:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1570036622; x=1601572622;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=5Q2XE0XvYzUty69qqRlTGEEguqCrML7ftDS0JmcjKEo=;
 b=Kcouyx2jS7CKL6bC/JuXZmCbf4z2k8w7K0VcCo8eX4jX4U+GdaJybvni
 4W4MsU+YVxiUBP8eBRCVzbrqDuB/0WuSUX6vrB0Hl/Sqv4mimZ1nlyOmG
 o1ZXpekVVAhHe/hJ6DqhnWNa277spLuDXbHhj/f8eIByEAOIV87a3TXp7 8=;
X-IronPort-AV: E=Sophos;i="5.67,249,1566864000"; d="scan'208";a="419366605"
Received: from iad6-co-svc-p1-lb1-vlan3.amazon.com (HELO
 email-inbound-relay-2a-69849ee2.us-west-2.amazon.com) ([10.124.125.6])
 by smtp-border-fw-out-6001.iad6.amazon.com with ESMTP;
 02 Oct 2019 17:16:58 +0000
Received: from EX13MTAUEA001.ant.amazon.com
 (pdx4-ws-svc-p6-lb7-vlan2.pdx.amazon.com [10.170.41.162])
 by email-inbound-relay-2a-69849ee2.us-west-2.amazon.com (Postfix) with ESMTPS
 id 9BDEBA1C90; Wed,  2 Oct 2019 17:16:57 +0000 (UTC)
Received: from EX13D15UEE001.ant.amazon.com (10.43.62.86) by
 EX13MTAUEA001.ant.amazon.com (10.43.61.82) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Wed, 2 Oct 2019 17:16:57 +0000
Received: from EX13MTAUEE001.ant.amazon.com (10.43.62.200) by
 EX13D15UEE001.ant.amazon.com (10.43.62.86) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Wed, 2 Oct 2019 17:16:56 +0000
Received: from u9d785c4ba99158.ant.amazon.com (10.125.106.78) by
 mail-relay.amazon.com (10.43.62.226) with Microsoft SMTP Server id
 15.0.1367.3 via Frontend Transport; Wed, 2 Oct 2019 17:16:56 +0000
From: Hongyan Xia <hongyax@amazon.com>
To: <xen-devel@lists.xenproject.org>
Date: Wed, 2 Oct 2019 18:16:46 +0100
Message-ID: <136f8a63b7e381af7a6134721ab6c63dac4e4654.1570034362.git.hongyax@amazon.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1570034362.git.hongyax@amazon.com>
References: <cover.1570034362.git.hongyax@amazon.com>
MIME-Version: 1.0
Precedence: Bulk
Subject: [Xen-devel] [PATCH v3 1/9] x86: move some xen mm function
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
