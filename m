Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F9CCA6CB2
	for <lists+xen-devel@lfdr.de>; Tue,  3 Sep 2019 17:15:49 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i5AUz-00054g-11; Tue, 03 Sep 2019 15:13:37 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=CRa/=W6=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1i5AUx-00054b-KW
 for xen-devel@lists.xenproject.org; Tue, 03 Sep 2019 15:13:35 +0000
X-Inumbo-ID: 65b51f5e-ce5d-11e9-b299-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 65b51f5e-ce5d-11e9-b299-bc764e2007e4;
 Tue, 03 Sep 2019 15:13:35 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 2D479AF92;
 Tue,  3 Sep 2019 15:13:34 +0000 (UTC)
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <88d6b97e-1f19-56ff-1a35-901ce3102e78@suse.com>
 <20190903141545.5n4uk2khgbtvewgz@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <10cc7a4e-2c3b-c672-313c-d6c11874eac0@suse.com>
Date: Tue, 3 Sep 2019 17:13:38 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190903141545.5n4uk2khgbtvewgz@Air-de-Roger>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] ns16550: make PCI device hiding uniform
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 KonradWilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Tim Deegan <tim@xen.org>,
 JulienGrall <julien.grall@arm.com>, Ian Jackson <ian.jackson@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDMuMDkuMjAxOSAxNjoxNSwgUm9nZXIgUGF1IE1vbm7DqSAgd3JvdGU6Cj4gT24gVHVlLCBT
ZXAgMDMsIDIwMTkgYXQgMDM6NTg6MDhQTSArMDIwMCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+IC0t
LSBhL3hlbi9kcml2ZXJzL2NoYXIvbnMxNjU1MC5jCj4+ICsrKyBiL3hlbi9kcml2ZXJzL2NoYXIv
bnMxNjU1MC5jCj4+IEBAIC03NjMsMjMgKzc2MywxNiBAQCBzdGF0aWMgdm9pZCBfX2luaXQgbnMx
NjU1MF9pbml0X3Bvc3RpcnEoCj4+ICAjaWZkZWYgQ09ORklHX0hBU19QQ0kKPj4gICAgICBpZiAo
IHVhcnQtPmJhciB8fCB1YXJ0LT5wc19iZGZfZW5hYmxlICkKPj4gICAgICB7Cj4+IC0gICAgICAg
IGlmICggIXVhcnQtPnBhcmFtICkKPj4gLSAgICAgICAgICAgIHBjaV9oaWRlX2RldmljZSgwLCB1
YXJ0LT5wc19iZGZbMF0sIFBDSV9ERVZGTih1YXJ0LT5wc19iZGZbMV0sCj4+IC0gICAgICAgICAg
ICAgICAgICAgICAgICAgICAgdWFydC0+cHNfYmRmWzJdKSk7Cj4+IC0gICAgICAgIGVsc2UKPj4g
LSAgICAgICAgewo+PiAtICAgICAgICAgICAgaWYgKCB1YXJ0LT5wYXJhbS0+bW1pbyAmJgo+PiAt
ICAgICAgICAgICAgICAgICByYW5nZXNldF9hZGRfcmFuZ2UobW1pb19yb19yYW5nZXMsCj4+IC0g
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB1YXJ0LT5pb19iYXNlLAo+PiAtICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgdWFydC0+aW9fYmFzZSArIHVhcnQtPmlv
X3NpemUgLSAxKSApCj4+IC0gICAgICAgICAgICAgICAgcHJpbnRrKFhFTkxPR19JTkZPICJFcnJv
ciB3aGlsZSBhZGRpbmcgTU1JTyByYW5nZSBvZiBkZXZpY2UgdG8gbW1pb19yb19yYW5nZXNcbiIp
Owo+PiArICAgICAgICBpZiAoIHVhcnQtPnBhcmFtICYmIHVhcnQtPnBhcmFtLT5tbWlvICYmCj4+
ICsgICAgICAgICAgICAgcmFuZ2VzZXRfYWRkX3JhbmdlKG1taW9fcm9fcmFuZ2VzLCB1YXJ0LT5p
b19iYXNlLAo+PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB1YXJ0LT5pb19iYXNl
ICsgdWFydC0+aW9fc2l6ZSAtIDEpICkKPj4gKyAgICAgICAgICAgIHByaW50ayhYRU5MT0dfSU5G
TyAiRXJyb3Igd2hpbGUgYWRkaW5nIE1NSU8gcmFuZ2Ugb2YgZGV2aWNlIHRvIG1taW9fcm9fcmFu
Z2VzXG4iKTsKPj4gIAo+PiAtICAgICAgICAgICAgaWYgKCBwY2lfcm9fZGV2aWNlKDAsIHVhcnQt
PnBzX2JkZlswXSwKPj4gLSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBQQ0lfREVWRk4o
dWFydC0+cHNfYmRmWzFdLCB1YXJ0LT5wc19iZGZbMl0pKSApCj4+IC0gICAgICAgICAgICAgICAg
cHJpbnRrKFhFTkxPR19JTkZPICJDb3VsZCBub3QgbWFyayBjb25maWcgc3BhY2Ugb2YgJTAyeDol
MDJ4LiV1IHJlYWQtb25seS5cbiIsCj4+IC0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICB1YXJ0LT5wc19iZGZbMF0sIHVhcnQtPnBzX2JkZlsxXSwKPj4gLSAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIHVhcnQtPnBzX2JkZlsyXSk7Cj4+IC0gICAgICAgIH0KPj4g
KyAgICAgICAgaWYgKCBwY2lfcm9fZGV2aWNlKDAsIHVhcnQtPnBzX2JkZlswXSwKPiAKPiBEb24n
dCB5b3UgbmVlZCB0byBnYXRlIHRoZSBjYWxsIHRvIHBjaV9yb19kZXZpY2Ugd2l0aAo+IHVhcnQt
PnBzX2JkZl9lbmFibGU/CgpObywgd2Ugd2FudCB0aGlzIGZvciBib3RoIHRoZSBwYXJzZV9wY2ko
KSBhbmQgdGhlIHBjaV91YXJ0X2NvbmZpZygpCmNhc2UsIHdoaWNoIGlzIHdoYXQgdGhlIHN1cnJv
dW5kaW5nIGlmKCkgKHZpc2libGUgaW4gY29udGV4dCBhYm92ZSkKY2hlY2tzLiAoTm90ZSBhbHNv
IHRoYXQgcHJldmlvdXNseSB0aGVyZSB3YXMgbm8gc3VjaCBjaGVjayBlaXRoZXIsCnNvIGlmIGFu
eXRoaW5nIGl0IHdvdWxkIGJlIGFuIG9ydGhvZ29uYWwgY2hhbmdlIGFueXdheS4pCgpKYW4KCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBt
YWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMu
eGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
