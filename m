Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F3E0464B34
	for <lists+xen-devel@lfdr.de>; Wed, 10 Jul 2019 19:06:47 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hlG06-0003xp-06; Wed, 10 Jul 2019 17:03:26 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ELaq=VH=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hlG04-0003xk-DR
 for xen-devel@lists.xenproject.org; Wed, 10 Jul 2019 17:03:24 +0000
X-Inumbo-ID: 9fcca5b6-a334-11e9-8980-bc764e045a96
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTP
 id 9fcca5b6-a334-11e9-8980-bc764e045a96;
 Wed, 10 Jul 2019 17:03:22 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5980C344;
 Wed, 10 Jul 2019 10:03:22 -0700 (PDT)
Received: from [10.119.48.3] (unknown [10.119.48.3])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DEE803F246;
 Wed, 10 Jul 2019 10:03:21 -0700 (PDT)
To: Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <alpine.DEB.2.21.1906211648280.25730@sstabellini-ThinkPad-T480s>
 <20190621235608.2153-6-sstabellini@kernel.org>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <3155e28e-24b4-2cbe-8970-1f1feadd5395@arm.com>
Date: Wed, 10 Jul 2019 18:03:21 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <20190621235608.2153-6-sstabellini@kernel.org>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v3 6/6] xen/arm: add reserved-memory regions
 to the dom0 memory node
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
Cc: Stefano Stabellini <stefanos@xilinx.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgU3RlZmFubywKCk9uIDYvMjIvMTkgMTI6NTYgQU0sIFN0ZWZhbm8gU3RhYmVsbGluaSB3cm90
ZToKPiBSZXNlcnZlZCBtZW1vcnkgcmVnaW9ucyBhcmUgYXV0b21hdGljYWxseSByZW1hcHBlZCB0
byBkb20wLiBUaGVpciBkZXZpY2UKPiB0cmVlIG5vZGVzIGFyZSBhbHNvIGFkZGVkIHRvIGRvbTAg
ZGV2aWNlIHRyZWUuIEhvd2V2ZXIsIHRoZSBkb20wIG1lbW9yeQo+IG5vZGUgaXMgbm90IGN1cnJl
bnRseSBleHRlbmRlZCB0byBjb3ZlciB0aGUgcmVzZXJ2ZWQgbWVtb3J5IHJlZ2lvbnMKPiByYW5n
ZXMgYXMgcmVxdWlyZWQgYnkgdGhlIHNwZWMuICBUaGlzIGNvbW1pdCBmaXhlcyBpdC4KPiAKPiBT
aWduZWQtb2ZmLWJ5OiBTdGVmYW5vIFN0YWJlbGxpbmkgPHN0ZWZhbm9zQHhpbGlueC5jb20+Cj4g
LS0tCj4gICB4ZW4vYXJjaC9hcm0vZG9tYWluX2J1aWxkLmMgfCAxNyArKysrKysrKysrKysrKysr
LQo+ICAgMSBmaWxlIGNoYW5nZWQsIDE2IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKPiAK
PiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gvYXJtL2RvbWFpbl9idWlsZC5jIGIveGVuL2FyY2gvYXJt
L2RvbWFpbl9idWlsZC5jCj4gaW5kZXggNzZkZDRiZjZmOS4uNTA0N2ViNGMyOCAxMDA2NDQKPiAt
LS0gYS94ZW4vYXJjaC9hcm0vZG9tYWluX2J1aWxkLmMKPiArKysgYi94ZW4vYXJjaC9hcm0vZG9t
YWluX2J1aWxkLmMKPiBAQCAtNjQzLDcgKzY0Myw4IEBAIHN0YXRpYyBpbnQgX19pbml0IG1ha2Vf
bWVtb3J5X25vZGUoY29uc3Qgc3RydWN0IGRvbWFpbiAqZCwKPiAgIHsKPiAgICAgICBpbnQgcmVz
LCBpOwo+ICAgICAgIGludCByZWdfc2l6ZSA9IGFkZHJjZWxscyArIHNpemVjZWxsczsKPiAtICAg
IGludCBucl9jZWxscyA9IHJlZ19zaXplKmtpbmZvLT5tZW0ubnJfYmFua3M7Cj4gKyAgICBpbnQg
bnJfY2VsbHMgPSByZWdfc2l6ZSAqIChraW5mby0+bWVtLm5yX2JhbmtzICsgKGlzX2hhcmR3YXJl
X2RvbWFpbihkKSA/Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBib290aW5mby5y
ZXNlcnZlZF9tZW0ubnJfYmFua3MgOiAwKSk7CgpBIGRldmljZS10cmVlIGlzIGFsbG93ZWQgdG8g
aGF2ZSBtdWx0aXBsZSBtZW1vcnkgbm9kZS4gU28gSSB3b3VsZCAKYWN0dWFsbHkgcHJlZmVyIGlm
IHdlIGNyZWF0ZSBhIG5ldyBub2RlIGZvciB0aGUgcmVzZXJ2ZWQtbWVtb3J5IHJlZ2lvbnMuCgpZ
b3UgY291bGQgcmVwbGFjZSB0aGUgbGFzdCBwYXJhbWV0ZXIgd2l0aCBzdHJ1Y3QgbWVtaW5mbyAq
LiBOb3RlIHRoYXQgCnlvdSB3b3VsZCBuZWVkIHRvIHNwZWNpZnkgYSB1bml0IGluIHRoZSBub2Rl
LW5hbWUuCgo+ICAgICAgIF9fYmUzMiByZWdbTlJfTUVNX0JBTktTICogNCAvKiBXb3JzdCBjYXNl
IGFkZHJjZWxscyArIHNpemVjZWxscyAqL107CgpOb3RlIHRoYXQgeW91IHdpbGwgb3ZlcnJ1biBy
ZWcgaGVyZSBpZiB0aGUgdHdvIGFycmF5cyAocmVzZXJ2ZWRfbWVtIGFuZCAKbWVtKSBhcmUgZnVs
bC4KCj4gICAgICAgX19iZTMyICpjZWxsczsKPiAgIAo+IEBAIC02NzMsNiArNjc0LDIwIEBAIHN0
YXRpYyBpbnQgX19pbml0IG1ha2VfbWVtb3J5X25vZGUoY29uc3Qgc3RydWN0IGRvbWFpbiAqZCwK
PiAgICAgICAgICAgZHRfY2hpbGRfc2V0X3JhbmdlKCZjZWxscywgYWRkcmNlbGxzLCBzaXplY2Vs
bHMsIHN0YXJ0LCBzaXplKTsKPiAgICAgICB9Cj4gICAKPiArICAgIGlmICggaXNfaGFyZHdhcmVf
ZG9tYWluKGQpICkKPiArICAgIHsKPiArICAgICAgICBmb3IgKCBpID0gMDsgaSA8IGJvb3RpbmZv
LnJlc2VydmVkX21lbS5ucl9iYW5rczsgaSsrICkKPiArICAgICAgICB7Cj4gKyAgICAgICAgICAg
IHU2NCBzdGFydCA9IGJvb3RpbmZvLnJlc2VydmVkX21lbS5iYW5rW2ldLnN0YXJ0Owo+ICsgICAg
ICAgICAgICB1NjQgc2l6ZSA9IGJvb3RpbmZvLnJlc2VydmVkX21lbS5iYW5rW2ldLnNpemU7Cj4g
Kwo+ICsgICAgICAgICAgICBkdF9kcHJpbnRrKCIgIEJhbmsgJWQ6ICUjIlBSSXg2NCItPiUjIlBS
SXg2NCJcbiIsCj4gKyAgICAgICAgICAgICAgICAgICAgaSwgc3RhcnQsIHN0YXJ0ICsgc2l6ZSk7
Cj4gKwo+ICsgICAgICAgICAgICBkdF9jaGlsZF9zZXRfcmFuZ2UoJmNlbGxzLCBhZGRyY2VsbHMs
IHNpemVjZWxscywgc3RhcnQsIHNpemUpOwo+ICsgICAgICAgIH0KPiArICAgIH0KPiArCj4gICAg
ICAgcmVzID0gZmR0X3Byb3BlcnR5KGZkdCwgInJlZyIsIHJlZywgbnJfY2VsbHMgKiBzaXplb2Yo
KnJlZykpOwo+ICAgICAgIGlmICggcmVzICkKPiAgICAgICAgICAgcmV0dXJuIHJlczsKPiAKCkNo
ZWVycywKCi0tIApKdWxpZW4gR3JhbGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5m
by94ZW4tZGV2ZWw=
