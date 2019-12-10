Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 07D291181A0
	for <lists+xen-devel@lfdr.de>; Tue, 10 Dec 2019 09:00:04 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ieaP3-0000vz-Th; Tue, 10 Dec 2019 07:57:53 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=1mH3=2A=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1ieaP3-0000vu-2A
 for xen-devel@lists.xenproject.org; Tue, 10 Dec 2019 07:57:53 +0000
X-Inumbo-ID: c3f324b4-1b22-11ea-88e7-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c3f324b4-1b22-11ea-88e7-bc764e2007e4;
 Tue, 10 Dec 2019 07:57:52 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 6DD19AD9F;
 Tue, 10 Dec 2019 07:57:51 +0000 (UTC)
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <20191207211634.9958-1-andrew.cooper3@citrix.com>
 <20191207211634.9958-2-andrew.cooper3@citrix.com>
 <57b4ce90-7756-6073-0985-0310f8709f25@suse.com>
 <f37194ce-bd20-0286-e4a7-c6e6b38eaee9@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <b447d680-645f-8553-9b39-f392f0468796@suse.com>
Date: Tue, 10 Dec 2019 08:58:11 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <f37194ce-bd20-0286-e4a7-c6e6b38eaee9@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v3 1/3] xen/flask: Drop the gen-policy.py
 script
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
Cc: Juergen Gross <jgross@suse.com>, Xen-devel <xen-devel@lists.xenproject.org>,
 Daniel De Graaf <dgdegra@tycho.nsa.gov>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDkuMTIuMjAxOSAxODowMSwgQW5kcmV3IENvb3BlciB3cm90ZToKPiBPbiAwOS8xMi8yMDE5
IDEzOjM4LCBKYW4gQmV1bGljaCB3cm90ZToKPj4gT24gMDcuMTIuMjAxOSAyMjoxNiwgQW5kcmV3
IENvb3BlciB3cm90ZToKPj4+IC0tLSAvZGV2L251bGwKPj4+ICsrKyBiL3hlbi94c20vZmxhc2sv
Zmxhc2stcG9saWN5LlMKPj4+IEBAIC0wLDAgKzEsMjAgQEAKPj4+ICsgICAgICAgIC5zZWN0aW9u
IC5pbml0LnJvZGF0YSwgImEiLCAlcHJvZ2JpdHMKPj4+ICsKPj4+ICsvKiBjb25zdCB1bnNpZ25l
ZCBjaGFyIHhzbV9mbGFza19pbml0X3BvbGljeVtdIF9faW5pdGNvbnN0ICovCj4+PiArICAgICAg
ICAuYWxpZ24gNAo+PiBJJ20gYWZyYWlkIC5hbGlnbiBpcyBub3QgdW5pdmVyc2FsIGVub3VnaCB0
byBiZSB1c2VkIGhlcmUgLSBpaXJjCj4+IHNvbWUgYXJjaGl0ZWN0dXJlcyBoYXZlIGl0IGFsaWFz
IC5wMmFsaWduIHJhdGhlciB0aGFuIChob3cgZS5nLgo+PiB4ODYgYmVoYXZlcykgLmJhbGlnbi4g
TG9va3MgbGlrZSAucDJhbGlnbiBpcyBhdmFpbGFibGUgaW4gYWxsCj4+IGJpbnV0aWxzIHZlcnNp
b25zIHdlIGNsYWltIHRvIGJlIGFibGUgdG8gYmUgYnVpbHQgd2l0aC4gKEknbQo+PiBub3Qgc3Vy
ZSB0aGUgb25lIGhlcmUgaXMgbmVlZGVkIGFueXdheSwgYnV0IHRoZSBvbmUgYmVsb3cgd2UKPj4g
c3VyZWx5IHdhbnQuKQo+IAo+IEkgY2FuIHN3aXRjaCB0byBwMmFsaWduLCBidXQuLi4KPiAKPj4K
Pj4+ICsgICAgICAgIC5nbG9iYWwgeHNtX2ZsYXNrX2luaXRfcG9saWN5Cj4+PiAreHNtX2ZsYXNr
X2luaXRfcG9saWN5Ogo+Pj4gKyAgICAgICAgLmluY2JpbiAicG9saWN5LmJpbiIKPj4+ICsuTGVu
ZDoKPj4+ICsKPj4+ICsgICAgICAgIC50eXBlIHhzbV9mbGFza19pbml0X3BvbGljeSwgJW9iamVj
dAo+Pj4gKyAgICAgICAgLnNpemUgeHNtX2ZsYXNrX2luaXRfcG9saWN5LCAuIC0geHNtX2ZsYXNr
X2luaXRfcG9saWN5Cj4+PiArCj4+PiArLyogY29uc3QgdW5zaWduZWQgaW50IF9faW5pdGNvbnN0
IHhzbV9mbGFza19pbml0X3BvbGljeV9zaXplICovCj4+PiArICAgICAgICAuYWxpZ24gNAo+Pj4g
KyAgICAgICAgLmdsb2JhbCB4c21fZmxhc2tfaW5pdF9wb2xpY3lfc2l6ZQo+Pj4gK3hzbV9mbGFz
a19pbml0X3BvbGljeV9zaXplOgo+Pj4gKyAgICAgICAgLmxvbmcgLkxlbmQgLSB4c21fZmxhc2tf
aW5pdF9wb2xpY3kKPj4gU2ltaWxhcmx5IC5sb25nIGlzbid0IHJlYWxseSB1bml2ZXJzYWwgKHZh
cmlvdXMgYXJjaGVzIG92ZXJyaWRlCj4+IGl0IGluIGdhcykuIEFpdWkgLmRjLmwgaXMgaW50ZW5k
ZWQgdG8gYmUgcG9ydGFibGUgKGRlc3BpdGUgc3RpbGwKPj4gY2FycnlpbmcgdGhlICdsJyBpbiBp
dHMgbmFtZSwgYW5kIGRlc3BpdGUgZXZlbiB0aGlzIG9uZSBnZXR0aW5nCj4+IG92ZXJyaWRkZW4g
YnkgdHdvIGFyY2hlcykuIEJ1dCBwZXJoYXBzIGJlc3QgdG8gYXNrIG9uIHRoZQo+PiBiaW51dGls
cyBsaXN0Lgo+IAo+IC4uLiB0aGlzIGlzIG5vdCBhIGNsZWFyIG9yIG9idmlvdXMgd2F5IHRvIGdv
LCBub3QgbGVhc3QgYmVjYXVzZSBpdCBtYWtlcwo+IGEgZGlmZmVyZW50IGV4cGVjdGF0aW9uIHRo
YXQgaW50IHdpbGwgbmV2ZXIgY2hhbmdlIGZyb20gYmVpbmcgMzIgYml0cy7CoAo+IEF0IGxlYXN0
IC5sb25nIHdpbGwgd29yayBldmVuIGlmIGl0IGJlY29tZXMgbG9uZ2VyIGluIGEgZnV0dXJlIHRv
b2xjaGFpbi4KClRoZXJlIGFyZSBhIGZldyB0YXJnZXRzIHdoZXJlIC5sb25nIChhbmQgLmludCkg
YXBwZWFyIHRvIHByb2R1Y2UgMi1ieXRlCnZhbHVlcyAoYXQgdGhlIGZpcnN0IGdsYW5jZSwgaS5l
LiB3aXRob3V0IGNoZWNraW5nIHZlcnkgY2xvc2VseSkuCgo+IFdoYXQgaXMgdXNlZCBoZXJlIGRv
ZXNuJ3QgbmVlZCB0byBiZSB1bml2ZXJzYWwgLSBpdCBvbmx5IG5lZWRzIHRvIHdvcmsKPiBmb3Ig
dGhlIGFyY2hpdGVjdHVyZXMgd2Ugc3VwcG9ydC4KCkJ1dCBpdCBhbHNvIHdvdWxkIGJldHRlciBu
b3QgYnJlYWsgc2lsZW50bHkgZm9yIHNvbWUgZnV0dXJlIHBvcnQuIEhvdwphYm91dCBhbiBlcXVp
dmFsZW50IHRvIExpbnV4J2VzIF9BU01fUFRSKCkgKHNheSBBU01fV09SRCgpKSwgd2hpY2ggZWFj
aAphcmNoaXRlY3R1cmUgaGFzIHRvIHN1cHBseSBleHBsaWNpdGx5PwoKPiBJZiBoYW5kIHdyaXRp
bmcgYW4gYXNtIGZpbGUgaXNuJ3QgY29uc2lkZXJlZCBnb29kIGVub3VnaCwgdGhlbiB0aGUgb3Ro
ZXIKPiBvcHRpb25zIGFyZSBhIEMgZmlsZSB3aXRoIGlubGluZSBhc20gaW5jYmluLCBvciBgb2Jq
ZHVtcAo+IC0tcmVuYW1lLXNlY3Rpb25gLsKgIFRoZSBsYXR0ZXIgb25lIHdvdWxkIHJlcXVpcmUg
YSBmZXcgY2hhbmdlcyBlbHNld2hlcmUKPiBpbiB0aGUgY29kZSwgYnV0IG9ubHkgZm9yIGxpbmth
Z2UgcHVycG9zZXMuCgpJJ20gZW50aXJlbHkgZmluZSB3aXRoIGFuIGFzc2VtYmxlciBzb3VyY2Ug
aGVyZSwgaXQganVzdCBuZWVkcyBhIGxpdHRsZQptb3JlIHBvbGlzaGluZyBpbW8uCgpKYW4KCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBt
YWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMu
eGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
