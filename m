Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7418614EE67
	for <lists+xen-devel@lfdr.de>; Fri, 31 Jan 2020 15:27:57 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ixXER-0001va-9I; Fri, 31 Jan 2020 14:25:15 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=dp7M=3U=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1ixXEP-0001vP-LU
 for xen-devel@lists.xenproject.org; Fri, 31 Jan 2020 14:25:13 +0000
X-Inumbo-ID: 7d9ee2be-4435-11ea-8bd3-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 7d9ee2be-4435-11ea-8bd3-12813bfff9fa;
 Fri, 31 Jan 2020 14:25:12 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 82FA1AB87;
 Fri, 31 Jan 2020 14:25:11 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Date: Fri, 31 Jan 2020 15:25:09 +0100
Message-Id: <20200131142509.2801-1-jgross@suse.com>
X-Mailer: git-send-email 2.16.4
Subject: [Xen-devel] [PATCH] tools/xenstore: add newline for printing of
 stubdom console messages
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
Cc: Juergen Gross <jgross@suse.com>, Ian Jackson <ian.jackson@eu.citrix.com>,
 Wei Liu <wl@xen.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhlcmUgYXJlIHNldmVyYWwgcGxhY2VzIGluIHhlbnN0b3JlLXN0dWJkb20gd2hlcmUgbmV3bGlu
ZXMgYXQgdGhlIGVuZApvZiBtZXNzYWdlcyBvbiB0aGUgY29uc29sZSBhcmUgbWlzc2luZy4gQWRk
IHRoZW0uCgpTaWduZWQtb2ZmLWJ5OiBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+Ci0t
LQogdG9vbHMvbGlicy9ldnRjaG4vbWluaW9zLmMgICAgICB8IDEgKwogdG9vbHMveGVuc3RvcmUv
eGVuc3RvcmVkX2NvcmUuYyB8IDIgKy0KIDIgZmlsZXMgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCsp
LCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvdG9vbHMvbGlicy9ldnRjaG4vbWluaW9zLmMg
Yi90b29scy9saWJzL2V2dGNobi9taW5pb3MuYwppbmRleCA0MTRjMjFiYTY3Li45Y2Q3NjM2ZmM1
IDEwMDY0NAotLS0gYS90b29scy9saWJzL2V2dGNobi9taW5pb3MuYworKysgYi90b29scy9saWJz
L2V2dGNobi9taW5pb3MuYwpAQCAtMjE4LDYgKzIxOCw3IEBAIHhlbmV2dGNobl9wb3J0X29yX2Vy
cm9yX3QgeGVuZXZ0Y2huX2JpbmRfdmlycSh4ZW5ldnRjaG5faGFuZGxlICp4Y2UsIHVuc2lnbmVk
IGluCiAKICAgICBwcmludGYoInhlbmV2dGNobl9iaW5kX3ZpcnEoJWQpIiwgdmlycSk7CiAgICAg
cG9ydCA9IGJpbmRfdmlycSh2aXJxLCBldnRjaG5faGFuZGxlciwgKHZvaWQqKShpbnRwdHJfdClm
ZCk7CisgICAgcHJpbnRmKCIgPSAlZFxuIiwgcG9ydCk7CiAKICAgICBpZiAocG9ydCA8IDApIHsK
ICAgICAgICAgcG9ydF9kZWFsbG9jKHBvcnRfaW5mbyk7CmRpZmYgLS1naXQgYS90b29scy94ZW5z
dG9yZS94ZW5zdG9yZWRfY29yZS5jIGIvdG9vbHMveGVuc3RvcmUveGVuc3RvcmVkX2NvcmUuYwpp
bmRleCA5N2NlYWJmOTY0Li41NTFmZTM4ZjU3IDEwMDY0NAotLS0gYS90b29scy94ZW5zdG9yZS94
ZW5zdG9yZWRfY29yZS5jCisrKyBiL3Rvb2xzL3hlbnN0b3JlL3hlbnN0b3JlZF9jb3JlLmMKQEAg
LTg4LDcgKzg4LDcgQEAgc3RhdGljIGNvbnN0IGNoYXIgKnNvY2ttc2dfc3RyaW5nKGVudW0geHNk
X3NvY2ttc2dfdHlwZSB0eXBlKTsKIAkJY2hhciAqcyA9IHRhbGxvY19hc3ByaW50ZihOVUxMLCBf
X1ZBX0FSR1NfXyk7CQlcCiAJCWlmIChzKSB7CQkJCQkJXAogCQkJdHJhY2UoIiVzXG4iLCBzKTsJ
CQkJXAotCQkJc3lzbG9nKExPR19FUlIsICIlcyIsICBzKTsJCQlcCisJCQlzeXNsb2coTE9HX0VS
UiwgIiVzXG4iLCAgcyk7CQkJXAogCQkJdGFsbG9jX2ZyZWUocyk7CQkJCQlcCiAJCX0gZWxzZSB7
CQkJCQkJXAogCQkJdHJhY2UoInRhbGxvYyBmYWlsdXJlIGR1cmluZyBsb2dnaW5nXG4iKTsJXAot
LSAKMi4xNi40CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcK
aHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
