Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AC58B09AB
	for <lists+xen-devel@lfdr.de>; Thu, 12 Sep 2019 09:46:04 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i8Jlb-0005HL-V7; Thu, 12 Sep 2019 07:43:47 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=ncEf=XH=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1i8Jla-0005HG-IH
 for xen-devel@lists.xenproject.org; Thu, 12 Sep 2019 07:43:46 +0000
X-Inumbo-ID: 0c216f08-d531-11e9-b299-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0c216f08-d531-11e9-b299-bc764e2007e4;
 Thu, 12 Sep 2019 07:43:45 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id C9760AFA9;
 Thu, 12 Sep 2019 07:43:43 +0000 (UTC)
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <20190911200504.5693-1-andrew.cooper3@citrix.com>
 <20190911200504.5693-2-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <1bd690aa-bd94-48df-c9a4-c619c02fa408@suse.com>
Date: Thu, 12 Sep 2019 09:43:40 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20190911200504.5693-2-andrew.cooper3@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 1/8] libx86: Introduce
 x86_cpu_policies_are_compatible()
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
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTEuMDkuMjAxOSAyMjowNCwgQW5kcmV3IENvb3BlciB3cm90ZToKPiBUaGlzIGhlbHBlciB3
aWxsIGV2ZW50dWFsbHkgYmUgdGhlIGNvcmUgImNhbiBhIGd1ZXN0IGNvbmZpdXJlZCBsaWtlIHRo
aXMgcnVuCj4gb24gdGhlIENQVT8iIGxvZ2ljLiAgRm9yIG5vdywgaXQgaXMganVzdCBlbm91Z2gg
b2YgYSBzdHViIHRvIGFsbG93IHVzIHRvCj4gcmVwbGFjZSB0aGUgaHlwZXJjYWxsIGludGVyZmFj
ZSB3aGlsZSByZXRhaW5pbmcgdGhlIHByZXZpb3VzIGJlaGF2aW91ci4KPiAKPiBJdCB3aWxsIGJl
IGV4cGFuZGVkIGFzIHZhcmlvdXMgb3RoZXIgYml0cyBvZiBDUFVJRCBoYW5kbGluZyBnZXQgY2xl
YW5lZCB1cC4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVy
M0BjaXRyaXguY29tPgoKRnVuZGFtZW50YWxseQpSZXZpZXdlZC1ieTogSmFuIEJldWxpY2ggPGpi
ZXVsaWNoQHN1c2UuY29tPgpidXQgYSBjb3VwbGUgb2YgcmVtYXJrczoKCkZvciBvbmUsIGRlc3Bp
dGUgYmVpbmcganVzdCB0ZXN0aW5nIGNvZGUsIEkgdGhpbmsgdGhlIHR3byB0ZXN0W10KYXJyYXlz
IGNvdWxkIGRvIHdpdGggY29uc3RpZmljYXRpb24uCgo+IC0tLSBhL3hlbi9pbmNsdWRlL3hlbi9s
aWIveDg2L2NwdS1wb2xpY3kuaAo+ICsrKyBiL3hlbi9pbmNsdWRlL3hlbi9saWIveDg2L2NwdS1w
b2xpY3kuaAo+IEBAIC0xMSw2ICsxMSwyNSBAQCBzdHJ1Y3QgY3B1X3BvbGljeQo+ICAgICAgc3Ry
dWN0IG1zcl9wb2xpY3kgKm1zcjsKPiAgfTsKPiAgCj4gK3N0cnVjdCBjcHVfcG9saWN5X2Vycm9y
cwo+ICt7Cj4gKyAgICB1aW50MzJfdCBsZWFmLCBzdWJsZWFmOwo+ICsgICAgdWludDMyX3QgbXNy
Owo+ICt9Owo+ICsKPiArI2RlZmluZSBJTklUX0NQVV9QT0xJQ1lfRVJST1JTIHsgfjB1LCB+MHUs
IH4wdSB9CgpJbnN0ZWFkIG9mIHRoaXMgKGFuZCB1c2luZyBpdCBpbiBldmVyeSBjYWxsZXIpLCBj
b3VsZG4ndCB0aGUgZnVuY3Rpb24KZmlsbCB0aGlzIGZpcnN0IHRoaW5nPyAoVGhlIGluaXRpYWxp
emVyIGlzbid0IHN0cmljdGx5IG5lZWRlZCBhbnl3YXksCmFzIGNvbnN1bWVycyBhcmUgc3VwcG9z
ZWQgdG8gbG9vayBhdCB0aGUgc3RydWN0dXJlIG9ubHkgd2hlbiBoYXZpbmcKZ290IGJhY2sgYW4g
ZXJyb3IgZnJvbSB0aGUgZnVuY3Rpb24sIGJ1dCBzaW5jZSBlcnJvciBwYXRocyBmaWxsIGp1c3QK
YSBzdWJzZXQgb2YgdGhlIGZpZWxkcyBJIGNhbiBzZWUgaG93IHByZS1maWxsaW5nIHRoZSB3aG9s
ZSBzdHJ1Y3R1cmUKaXMgZWFzaWVyLikKCj4gLS0tIC9kZXYvbnVsbAo+ICsrKyBiL3hlbi9saWIv
eDg2L3BvbGljeS5jCj4gQEAgLTAsMCArMSw1MyBAQAo+ICsjaW5jbHVkZSAicHJpdmF0ZS5oIgo+
ICsKPiArI2luY2x1ZGUgPHhlbi9saWIveDg2L2NwdS1wb2xpY3kuaD4KPiArCj4gK2ludCB4ODZf
Y3B1X3BvbGljaWVzX2FyZV9jb21wYXRpYmxlKGNvbnN0IHN0cnVjdCBjcHVfcG9saWN5ICpob3N0
LAo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBjb25zdCBzdHJ1Y3QgY3B1
X3BvbGljeSAqZ3Vlc3QsCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHN0
cnVjdCBjcHVfcG9saWN5X2Vycm9ycyAqZSkKPiArewo+ICsgICAgdWludDMyX3QgbGVhZiA9IC0x
LCBzdWJsZWFmID0gLTEsIG1zciA9IC0xOwo+ICsgICAgaW50IHJldCA9IC1FSU5WQUw7Cj4gKwo+
ICsjZGVmaW5lIE5BIFhFTl9DUFVJRF9OT19TVUJMRUFGCj4gKyNkZWZpbmUgRkFJTF9DUFVJRChs
LCBzKSBkbyB7IGxlYWYgPSAobCk7IHN1YmxlYWYgPSAocyk7IGdvdG8gb3V0OyB9IHdoaWxlICgg
MCApCj4gKyNkZWZpbmUgRkFJTF9NU1IobSkgZG8geyBtc3IgPSAobSk7IGdvdG8gb3V0OyB9IHdo
aWxlICggMCApCj4gKwo+ICsgICAgaWYgKCBndWVzdC0+Y3B1aWQtPmJhc2ljLm1heF9sZWFmID4g
aG9zdC0+Y3B1aWQtPmJhc2ljLm1heF9sZWFmICkKPiArICAgICAgICBGQUlMX0NQVUlEKDAsIE5B
KTsKPiArCj4gKyAgICBpZiAoIGd1ZXN0LT5jcHVpZC0+ZXh0ZC5tYXhfbGVhZiA+IGhvc3QtPmNw
dWlkLT5leHRkLm1heF9sZWFmICkKPiArICAgICAgICBGQUlMX0NQVUlEKDB4ODAwMDAwMDgsIE5B
KTsKPiArCj4gKyAgICAvKiBUT0RPOiBBdWRpdCBtb3JlIENQVUlEIGRhdGEuICovCj4gKwo+ICsg
ICAgaWYgKCB+aG9zdC0+bXNyLT5wbGFmb3JtX2luZm8ucmF3ICYgZ3Vlc3QtPm1zci0+cGxhZm9y
bV9pbmZvLnJhdyApCgpJJ3ZlIG5vdGljZWQgdGhpcyBvbmx5IGhlcmUsIGJ1dCB0aGVyZSBhcmUg
bnVtZXJvdXMgaW5zdGFuY2VzIGVsc2V3aGVyZToKQ291bGQgSSB0YWxrIHlvdSBpbnRvIGZpeGlu
ZyB0aGUgc3BlbGxpbmcgbWlzdGFrZSAobWlzc2luZyAndCcgaW4KInBsYXRmb3JtX2luZm8iKSBo
ZXJlIG9yIGluIGEgcHJlcmVxIHBhdGNoIChmZWVsIGZyZWUgdG8gYWRkIG15IGFjayB0aGVyZQp3
aXRob3V0IGV2ZW4gcG9zdGluZyk/CgpKYW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3Rz
LnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0
aW5mby94ZW4tZGV2ZWw=
