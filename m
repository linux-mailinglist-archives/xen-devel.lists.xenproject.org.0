Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 12491AD747
	for <lists+xen-devel@lfdr.de>; Mon,  9 Sep 2019 12:52:39 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i7HF2-0005NT-UU; Mon, 09 Sep 2019 10:49:52 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=NFaf=XE=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1i7HF1-0005NO-Pu
 for xen-devel@lists.xenproject.org; Mon, 09 Sep 2019 10:49:51 +0000
X-Inumbo-ID: 8c231006-d2ef-11e9-a337-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8c231006-d2ef-11e9-a337-bc764e2007e4;
 Mon, 09 Sep 2019 10:49:50 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 8D527AFA8;
 Mon,  9 Sep 2019 10:49:49 +0000 (UTC)
To: Alexandru Stefan ISAILA <aisaila@bitdefender.com>
References: <20190903140112.18806-1-aisaila@bitdefender.com>
 <569c7674-4c6e-765a-4071-884bca7d0412@suse.com>
 <7fca65bb-8936-b8c9-80df-3be4675c7b42@bitdefender.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <047d5951-c922-8111-aa39-2bb0bebc5721@suse.com>
Date: Mon, 9 Sep 2019 12:49:59 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <7fca65bb-8936-b8c9-80df-3be4675c7b42@bitdefender.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v8] x86/emulate: Send vm_event from emulate
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
Cc: Petre Ovidiu PIRCALABU <ppircalabu@bitdefender.com>,
 "tamas@tklengyel.com" <tamas@tklengyel.com>, "wl@xen.org" <wl@xen.org>,
 Razvan COJOCARU <rcojocaru@bitdefender.com>,
 "george.dunlap@eu.citrix.com" <george.dunlap@eu.citrix.com>,
 "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
 "paul.durrant@citrix.com" <paul.durrant@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "roger.pau@citrix.com" <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDkuMDkuMjAxOSAxMjowMSwgQWxleGFuZHJ1IFN0ZWZhbiBJU0FJTEEgd3JvdGU6Cj4gT24g
MDYuMDkuMjAxOSAxODo0NiwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+IE9uIDAzLjA5LjIwMTkgMTY6
MDEsIEFsZXhhbmRydSBTdGVmYW4gSVNBSUxBIHdyb3RlOgo+Pj4gICAgICAgfQo+Pj4gKyAgICAv
KiBDaGVjayBpZiBlbnkgdm1fZXZlbnQgd2FzIHNlbnQgKi8KPj4KPj4gImFueSIgYW5kIHBsZWFz
ZSBhZGQgYmxhbmsgbGluZSBhaGVhZCBvZiB5b3VyIGFkZGl0aW9uLgo+IAo+IEkgd2lsbCBjb3Jy
ZWN0IHRoaXMuCj4gCj4+Cj4+PiArICAgIGlmICggZXJyICkKPj4+ICsgICAgICAgIGdvdG8gb3V0
Owo+Pgo+PiBBbmQgd2FpdCAtIHdoeSBkb2VzIHRoaXMgc2l0IGFmdGVyIHRoZSBsb29wPyBJcyB0
aGF0IGEgcmUtYmFzaW5nCj4+IG1pc3Rha2UgZnJvbSB3aGVuIHlvdSBoYWQgcHV0IG9uIHRvcCBv
ZiBteSB1bmNvbW1pdHRlZCBwYXRjaD8KPiAKPiBUaGlzIGlzIGRvbmUgdG8gc2tpcCB0aGUgbWFw
cGluZyBwYXJ0IGRvd24gdGhlIGxpbmUuIElmIHRoZXJlIGlzIGFuIAo+IGVycm9yIHRoZW4gd2Ug
aGF2ZSB0byByZXR1cm4gX2l0XyBhbmQgbm90IHRoZSBtYXBwaW5nLgoKQnV0IGFmdGVyIHJlLWJh
c2luZyB5b3UgY291bGQgKGFuZCBoZW5jZSBpbW8gc2hvdWxkKSAiZ290byBvdXQiCnJpZ2h0IGZy
b20gdGhlIGNvZGUgYmxvYiB5b3UgYWRkIHRvIHRoZSBsb29wLiBXaGljaCB3b3VsZCB0aGVuCmFs
c28gZWxpbWluYXRlIHRoZSBuZWVkIGZvciBvdGhlciAiZXJyIiByZWxhdGVkIGFkanVzdG1lbnRz
IHlvdQptYWtlLgoKSmFuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRl
dmVs
