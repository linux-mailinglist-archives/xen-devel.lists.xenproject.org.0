Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AAD3BF2D9
	for <lists+xen-devel@lfdr.de>; Thu, 26 Sep 2019 14:22:50 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iDSjt-0007HW-LN; Thu, 26 Sep 2019 12:19:17 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=breC=XV=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iDSjs-0007HR-Nq
 for xen-devel@lists.xenproject.org; Thu, 26 Sep 2019 12:19:16 +0000
X-Inumbo-ID: dac883e2-e057-11e9-bf31-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by localhost (Halon) with ESMTPS
 id dac883e2-e057-11e9-bf31-bc764e2007e4;
 Thu, 26 Sep 2019 12:19:15 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 5C343B283;
 Thu, 26 Sep 2019 12:19:14 +0000 (UTC)
To: Oleksandr Tyshchenko <olekstysh@gmail.com>
References: <1569496834-7796-1-git-send-email-olekstysh@gmail.com>
 <1569496834-7796-4-git-send-email-olekstysh@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <32234ca5-75b2-3908-5f46-484fc53104af@suse.com>
Date: Thu, 26 Sep 2019 14:19:15 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <1569496834-7796-4-git-send-email-olekstysh@gmail.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH V6 3/8] xen/common: Introduce _xrealloc
 function
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
Cc: sstabellini@kernel.org, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, julien.grall@arm.com,
 Paul Durrant <paul.durrant@citrix.com>, xen-devel@lists.xenproject.org,
 volodymyr_babchuk@epam.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjYuMDkuMjAxOSAxMzoyMCwgT2xla3NhbmRyIFR5c2hjaGVua28gd3JvdGU6Cj4gRnJvbTog
T2xla3NhbmRyIFR5c2hjaGVua28gPG9sZWtzYW5kcl90eXNoY2hlbmtvQGVwYW0uY29tPgo+IAo+
IFRoaXMgcGF0Y2ggaW50cm9kdWNlcyB0eXBlLXVuc2FmZSBmdW5jdGlvbiB3aGljaCBiZXNpZGVz
Cj4gcmUtYWxsb2NhdGlvbiBoYW5kbGVzIHRoZSBmb2xsb3dpbmcgY29ybmVyIGNhc2VzOgo+IDEu
IGlmIHJlcXVlc3RlZCBzaXplIGlzIHplcm8sIGl0IHdpbGwgYmVoYXZlIGxpa2UgeGZyZWUKPiAy
LiBpZiBpbmNvbWluZyBwb2ludGVyIGlzIG5vdCB2YWxpZCAoTlVMTCBvciBaRVJPX0JMT0NLX1BU
UiksCj4gICAgaXQgd2lsbCBiZWhhdmUgbGlrZSB4bWFsbG9jCj4gCj4gSWYgYm90aCBwb2ludGVy
IGFuZCBzaXplIGFyZSB2YWxpZCB0aGUgZnVuY3Rpb24gd2lsbCByZS1hbGxvY2F0ZSBhbmQKPiBj
b3B5IG9ubHkgaWYgcmVxdWVzdGVkIHNpemUgYW5kIGFsaWdubWVudCBkb24ndCBmaXQgaW4gYWxy
ZWFkeQo+IGFsbG9jYXRlZCBzcGFjZS4KPiAKPiBTdWJzZXF1ZW50IHBhdGNoIHdpbGwgYWRkIHR5
cGUtc2FmZSBoZWxwZXIgbWFjcm9zLgo+IAo+IFNpZ25lZC1vZmYtYnk6IE9sZWtzYW5kciBUeXNo
Y2hlbmtvIDxvbGVrc2FuZHJfdHlzaGNoZW5rb0BlcGFtLmNvbT4KClJldmlld2VkLWJ5OiBKYW4g
QmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+CnByZWZlcmFibHkgd2l0aCB0d28gbW9yZSBjb3Nt
ZXRpY3MgYWRkcmVzc2VkIChjYW4gc3VyZWx5IGJlIGRvbmUKd2hpbGUgY29tbWl0dGluZyk6Cgo+
IC0tLSBhL3hlbi9jb21tb24veG1hbGxvY190bHNmLmMKPiArKysgYi94ZW4vY29tbW9uL3htYWxs
b2NfdGxzZi5jCj4gQEAgLTU0OSwxMCArNTQ5LDQwIEBAIHN0YXRpYyB2b2lkIHRsc2ZfaW5pdCh2
b2lkKQo+ICAgKiB4bWFsbG9jKCkKPiAgICovCj4gIAo+ICtzdGF0aWMgdm9pZCAqc3RyaXBfcGFk
ZGluZyh2b2lkICpwKQo+ICt7Cj4gKyAgICBzdHJ1Y3QgYmhkciAqYiA9IHAgLSBCSERSX09WRVJI
RUFEOwoKTG9va3MgbGlrZSB0aGlzIGNhbiAoYW5kIGhlbmNlIHNob3VsZCkgYmUgcG9pbnRlciB0
byBjb25zdC4KCgo+IEBAIC01OTMsMTAgKzYxNiw3MSBAQCB2b2lkICpfeHphbGxvYyh1bnNpZ25l
ZCBsb25nIHNpemUsIHVuc2lnbmVkIGxvbmcgYWxpZ24pCj4gICAgICByZXR1cm4gcCA/IG1lbXNl
dChwLCAwLCBzaXplKSA6IHA7Cj4gIH0KPiAgCj4gLXZvaWQgeGZyZWUodm9pZCAqcCkKPiArdm9p
ZCAqX3hyZWFsbG9jKHZvaWQgKnB0ciwgdW5zaWduZWQgbG9uZyBzaXplLCB1bnNpZ25lZCBsb25n
IGFsaWduKQo+ICB7Cj4gLSAgICBzdHJ1Y3QgYmhkciAqYjsKPiArICAgIHVuc2lnbmVkIGxvbmcg
Y3Vycl9zaXplOwo+ICsgICAgdm9pZCAqcDsKPiArCj4gKyAgICBpZiAoICFzaXplICkKPiArICAg
IHsKPiArICAgICAgICB4ZnJlZShwdHIpOwo+ICsgICAgICAgIHJldHVybiBaRVJPX0JMT0NLX1BU
UjsKPiArICAgIH0KPiAgCj4gKyAgICBpZiAoIHB0ciA9PSBOVUxMIHx8IHB0ciA9PSBaRVJPX0JM
T0NLX1BUUiApCj4gKyAgICAgICAgcmV0dXJuIF94bWFsbG9jKHNpemUsIGFsaWduKTsKPiArCj4g
KyAgICBBU1NFUlQoIShhbGlnbiAmIChhbGlnbiAtIDEpKSk7Cj4gKyAgICBpZiAoIGFsaWduIDwg
TUVNX0FMSUdOICkKPiArICAgICAgICBhbGlnbiA9IE1FTV9BTElHTjsKPiArCj4gKyAgICBpZiAo
ICEoKHVuc2lnbmVkIGxvbmcpcHRyICYgKFBBR0VfU0laRSAtIDEpKSApCj4gKyAgICB7Cj4gKyAg
ICAgICAgY3Vycl9zaXplID0gKHVuc2lnbmVkIGxvbmcpUEZOX09SREVSKHZpcnRfdG9fcGFnZShw
dHIpKSA8PCBQQUdFX1NISUZUOwo+ICsKPiArICAgICAgICBpZiAoIHNpemUgPD0gY3Vycl9zaXpl
ICYmICEoKHVuc2lnbmVkIGxvbmcpcHRyICYgKGFsaWduIC0gMSkpICkKPiArICAgICAgICAgICAg
cmV0dXJuIHB0cjsKPiArICAgIH0KPiArICAgIGVsc2UKPiArICAgIHsKPiArICAgICAgICB1bnNp
Z25lZCBsb25nIHRtcF9zaXplOwo+ICsgICAgICAgIHN0cnVjdCBiaGRyICpiOwoKU2FtZSBoZXJl
LgoKPiArICAgICAgICB0bXBfc2l6ZSA9IHNpemUgKyBhbGlnbiAtIE1FTV9BTElHTjsKClRoaXMg
Y291bGQgYWxzbyBiZSB0aGUgaW5pdGlhbGl6ZXIgb2YgdGhlIHZhcmlhYmxlLgoKSmFuCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFp
bGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhl
bnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
