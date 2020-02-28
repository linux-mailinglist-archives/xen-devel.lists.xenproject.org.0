Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 72B78173731
	for <lists+xen-devel@lfdr.de>; Fri, 28 Feb 2020 13:29:11 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j7ejG-0000T6-G1; Fri, 28 Feb 2020 12:26:54 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=F9pE=4Q=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1j7ejE-0000So-Fx
 for xen-devel@lists.xenproject.org; Fri, 28 Feb 2020 12:26:52 +0000
X-Inumbo-ID: 98f84b94-5a25-11ea-991c-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 98f84b94-5a25-11ea-991c-12813bfff9fa;
 Fri, 28 Feb 2020 12:26:52 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id B9845AF33;
 Fri, 28 Feb 2020 12:26:50 +0000 (UTC)
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <e53b3573-9c9a-734c-df67-6f6da7fd8ef4@suse.com>
Message-ID: <e134af37-5677-119c-04be-7806add045ea@suse.com>
Date: Fri, 28 Feb 2020 13:27:00 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <e53b3573-9c9a-734c-df67-6f6da7fd8ef4@suse.com>
Content-Language: en-US
Subject: [Xen-devel] [PATCH 3/5] IOMMU: iommu_igfx is x86-only
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Kevin Tian <kevin.tian@intel.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SW4gZmFjdCBpdCdzIFZULWQgc3BlY2lmaWMsIGJ1dCB3ZSBkb24ndCBoYXZlIGEgd2F5IHlldCB0
byBidWlsZCBjb2RlCmZvciBqdXN0IG9uZSB2ZW5kb3IuCgpTaWduZWQtb2ZmLWJ5OiBKYW4gQmV1
bGljaCA8amJldWxpY2hAc3VzZS5jb20+CgotLS0gYS94ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9p
b21tdS5jCisrKyBiL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL2lvbW11LmMKQEAgLTMyLDcgKzMy
LDYgQEAgYm9vbF90IF9fcmVhZF9tb3N0bHkgaW9tbXVfZW5hYmxlZDsKIGJvb2xfdCBfX3JlYWRf
bW9zdGx5IGZvcmNlX2lvbW11OwogYm9vbF90IF9fcmVhZF9tb3N0bHkgaW9tbXVfdmVyYm9zZTsK
IGJvb2wgX19yZWFkX21vc3RseSBpb21tdV9xdWFyYW50aW5lID0gdHJ1ZTsKLWJvb2xfdCBfX3Jl
YWRfbW9zdGx5IGlvbW11X2lnZnggPSAxOwogYm9vbF90IF9fcmVhZF9tb3N0bHkgaW9tbXVfc25v
b3AgPSAxOwogYm9vbF90IF9fcmVhZF9tb3N0bHkgaW9tbXVfcWludmFsID0gMTsKIGJvb2xfdCBf
X3JlYWRfbW9zdGx5IGlvbW11X2NyYXNoX2Rpc2FibGU7CkBAIC03Myw4ICs3MiwxMCBAQCBzdGF0
aWMgaW50IF9faW5pdCBwYXJzZV9pb21tdV9wYXJhbShjb25zCiAgICAgICAgICAgICBmb3JjZV9p
b21tdSA9IHZhbDsKICAgICAgICAgZWxzZSBpZiAoICh2YWwgPSBwYXJzZV9ib29sZWFuKCJxdWFy
YW50aW5lIiwgcywgc3MpKSA+PSAwICkKICAgICAgICAgICAgIGlvbW11X3F1YXJhbnRpbmUgPSB2
YWw7CisjaWZkZWYgQ09ORklHX1g4NgogICAgICAgICBlbHNlIGlmICggKHZhbCA9IHBhcnNlX2Jv
b2xlYW4oImlnZngiLCBzLCBzcykpID49IDAgKQogICAgICAgICAgICAgaW9tbXVfaWdmeCA9IHZh
bDsKKyNlbmRpZgogICAgICAgICBlbHNlIGlmICggKHZhbCA9IHBhcnNlX2Jvb2xlYW4oInZlcmJv
c2UiLCBzLCBzcykpID49IDAgKQogICAgICAgICAgICAgaW9tbXVfdmVyYm9zZSA9IHZhbDsKICAg
ICAgICAgZWxzZSBpZiAoICh2YWwgPSBwYXJzZV9ib29sZWFuKCJzbm9vcCIsIHMsIHNzKSkgPj0g
MCApCi0tLSBhL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL3Z0ZC9pb21tdS5jCisrKyBiL3hlbi9k
cml2ZXJzL3Bhc3N0aHJvdWdoL3Z0ZC9pb21tdS5jCkBAIC01MCw2ICs1MCw4IEBAIHN0cnVjdCBt
YXBwZWRfcm1yciB7CiAvKiBQb3NzaWJsZSB1bmZpbHRlcmVkIExBUElDL01TSSBtZXNzYWdlcyBm
cm9tIHVudHJ1c3RlZCBzb3VyY2VzPyAqLwogYm9vbCBfX3JlYWRfbW9zdGx5IHVudHJ1c3RlZF9t
c2k7CiAKK2Jvb2wgX19yZWFkX21vc3RseSBpb21tdV9pZ2Z4ID0gdHJ1ZTsKKwogaW50IG5yX2lv
bW11czsKIAogc3RhdGljIHN0cnVjdCB0YXNrbGV0IHZ0ZF9mYXVsdF90YXNrbGV0OwotLS0gYS94
ZW4vaW5jbHVkZS94ZW4vaW9tbXUuaAorKysgYi94ZW4vaW5jbHVkZS94ZW4vaW9tbXUuaApAQCAt
NTMsNyArNTMsNyBAQCBzdGF0aWMgaW5saW5lIGJvb2xfdCBkZm5fZXEoZGZuX3QgeCwgZGZuCiB9
CiAKIGV4dGVybiBib29sX3QgaW9tbXVfZW5hYmxlLCBpb21tdV9lbmFibGVkOwotZXh0ZXJuIGJv
b2wgZm9yY2VfaW9tbXUsIGlvbW11X3F1YXJhbnRpbmUsIGlvbW11X3ZlcmJvc2UsIGlvbW11X2ln
Zng7CitleHRlcm4gYm9vbCBmb3JjZV9pb21tdSwgaW9tbXVfcXVhcmFudGluZSwgaW9tbXVfdmVy
Ym9zZTsKIGV4dGVybiBib29sX3QgaW9tbXVfc25vb3AsIGlvbW11X3FpbnZhbDsKIAogI2lmZGVm
IENPTkZJR19YODYKQEAgLTY2LDYgKzY2LDcgQEAgZXh0ZXJuIGVudW0gX19wYWNrZWQgaW9tbXVf
aW50cmVtYXAgewogICAgaW9tbXVfaW50cmVtYXBfcmVzdHJpY3RlZCwKICAgIGlvbW11X2ludHJl
bWFwX2Z1bGwsCiB9IGlvbW11X2ludHJlbWFwOworZXh0ZXJuIGJvb2wgaW9tbXVfaWdmeDsKICNl
bHNlCiAjIGRlZmluZSBpb21tdV9pbnRyZW1hcCBmYWxzZQogI2VuZGlmCgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlz
dApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
