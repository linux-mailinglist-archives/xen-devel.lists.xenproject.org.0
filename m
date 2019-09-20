Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E592BB8EAF
	for <lists+xen-devel@lfdr.de>; Fri, 20 Sep 2019 12:55:25 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iBGX3-0003hz-OP; Fri, 20 Sep 2019 10:52:57 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=qXnC=XP=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iBGX2-0003hu-3F
 for xen-devel@lists.xenproject.org; Fri, 20 Sep 2019 10:52:56 +0000
X-Inumbo-ID: cc4236be-db94-11e9-968a-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id cc4236be-db94-11e9-968a-12813bfff9fa;
 Fri, 20 Sep 2019 10:52:54 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 93160AF30;
 Fri, 20 Sep 2019 10:52:53 +0000 (UTC)
To: Roger Pau Monne <roger.pau@citrix.com>
References: <20190903161428.7159-1-roger.pau@citrix.com>
 <20190903161428.7159-5-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <6858f6c1-d1dd-7a99-6a27-1ff726e2dc24@suse.com>
Date: Fri, 20 Sep 2019 12:53:01 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20190903161428.7159-5-roger.pau@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v2 04/11] ioreq: add fields to allow
 internal ioreq servers
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
Cc: xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDMuMDkuMjAxOSAxODoxNCwgUm9nZXIgUGF1IE1vbm5lIHdyb3RlOgo+IC0tLSBhL3hlbi9p
bmNsdWRlL2FzbS14ODYvaHZtL2RvbWFpbi5oCj4gKysrIGIveGVuL2luY2x1ZGUvYXNtLXg4Ni9o
dm0vZG9tYWluLmgKPiBAQCAtNTIsMjEgKzUyLDI5IEBAIHN0cnVjdCBodm1faW9yZXFfdmNwdSB7
Cj4gICNkZWZpbmUgTUFYX05SX0lPX1JBTkdFUyAgMjU2Cj4gIAo+ICBzdHJ1Y3QgaHZtX2lvcmVx
X3NlcnZlciB7Cj4gLSAgICBzdHJ1Y3QgZG9tYWluICAgICAgICAgICp0YXJnZXQsICplbXVsYXRv
cjsKPiAtCj4gKyAgICBzdHJ1Y3QgZG9tYWluICAgICAgICAgICp0YXJnZXQ7Cj4gICAgICAvKiBM
b2NrIHRvIHNlcmlhbGl6ZSB0b29sc3RhY2sgbW9kaWZpY2F0aW9ucyAqLwo+ICAgICAgc3Bpbmxv
Y2tfdCAgICAgICAgICAgICBsb2NrOwo+IC0KPiAtICAgIHN0cnVjdCBodm1faW9yZXFfcGFnZSAg
aW9yZXE7Cj4gLSAgICBzdHJ1Y3QgbGlzdF9oZWFkICAgICAgIGlvcmVxX3ZjcHVfbGlzdDsKPiAt
ICAgIHN0cnVjdCBodm1faW9yZXFfcGFnZSAgYnVmaW9yZXE7Cj4gLQo+IC0gICAgLyogTG9jayB0
byBzZXJpYWxpemUgYWNjZXNzIHRvIGJ1ZmZlcmVkIGlvcmVxIHJpbmcgKi8KPiAtICAgIHNwaW5s
b2NrX3QgICAgICAgICAgICAgYnVmaW9yZXFfbG9jazsKPiAtICAgIGV2dGNobl9wb3J0X3QgICAg
ICAgICAgYnVmaW9yZXFfZXZ0Y2huOwo+ICAgICAgc3RydWN0IHJhbmdlc2V0ICAgICAgICAqcmFu
Z2VbTlJfSU9fUkFOR0VfVFlQRVNdOwo+ICAgICAgYm9vbCAgICAgICAgICAgICAgICAgICBlbmFi
bGVkOwo+IC0gICAgdWludDhfdCAgICAgICAgICAgICAgICBidWZpb3JlcV9oYW5kbGluZzsKPiAr
Cj4gKyAgICB1bmlvbiB7Cj4gKyAgICAgICAgc3RydWN0IHsKPiArICAgICAgICAgICAgc3RydWN0
IGRvbWFpbiAgICAgICAgICAqZW11bGF0b3I7Cj4gKyAgICAgICAgICAgIHN0cnVjdCBodm1faW9y
ZXFfcGFnZSAgaW9yZXE7Cj4gKyAgICAgICAgICAgIHN0cnVjdCBsaXN0X2hlYWQgICAgICAgaW9y
ZXFfdmNwdV9saXN0Owo+ICsgICAgICAgICAgICBzdHJ1Y3QgaHZtX2lvcmVxX3BhZ2UgIGJ1Zmlv
cmVxOwo+ICsKPiArICAgICAgICAgICAgLyogTG9jayB0byBzZXJpYWxpemUgYWNjZXNzIHRvIGJ1
ZmZlcmVkIGlvcmVxIHJpbmcgKi8KPiArICAgICAgICAgICAgc3BpbmxvY2tfdCAgICAgICAgICAg
ICBidWZpb3JlcV9sb2NrOwo+ICsgICAgICAgICAgICBldnRjaG5fcG9ydF90ICAgICAgICAgIGJ1
ZmlvcmVxX2V2dGNobjsKPiArICAgICAgICAgICAgdWludDhfdCAgICAgICAgICAgICAgICBidWZp
b3JlcV9oYW5kbGluZzsKPiArICAgICAgICB9Owo+ICsgICAgICAgIHN0cnVjdCB7Cj4gKyAgICAg
ICAgICAgIHZvaWQgICAgICAgICAgICAgICAgICAgKmRhdGE7Cj4gKyAgICAgICAgICAgIGludCAo
KmhhbmRsZXIpKHN0cnVjdCB2Y3B1ICp2LCBpb3JlcV90ICosIHZvaWQgKik7CgpJZiB5b3Ugb21p
dCB0aGUgbGF0dGVyIHR3byBwYXJhbWV0ZXIgbmFtZXMsIHRoZSBmaXJzdCBvbmUgc2hvdWxkCmJl
IG9taXR0ZWQsIHRvby4gQW5kIGlmIHRoZXJlIHdhcyB0byBiZSBhbnkgaW5jb25zaXN0ZW5jeSBp
biB0aGlzCnJlZ2FyZCwgdGhlbiB0aGUgb25lIHBhcmFtZXRlciB3aGVyZSB0aGUgdHlwZSBkb2Vz
bid0IGltbWVkaWF0ZWx5CmNsYXJpZnkgdGhlIHB1cnBvc2Ugd291bGQgYmUgdGhlIG9uZSB0byBo
YXZlIGEgbmFtZS4KCkFzIHRvIHRoZSBzdHJ1Y3QgdmNwdSAqIHBhcmFtZXRlciAtIGlzIHRoZXJl
IGFuIGV4cGVjdGF0aW9uIHRoYXQKdGhlIGhhbmRsZXIgd291bGQgYmUgY2FsbGVkIHdpdGggdGhp
cyBiZWluZyBvdGhlciB0aGFuICJjdXJyZW50Ij8KSWYgbm90LCB0aGUgcGFyYW1ldGVyIHdvdWxk
IHdhbnQgdG8gZWl0aGVyIGJlIGRyb3BwZWQsIG9yIGJlCm5hbWVkICJjdXJyIi4KCkphbgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1h
aWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54
ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
