Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 315F9B3DA5
	for <lists+xen-devel@lfdr.de>; Mon, 16 Sep 2019 17:28:26 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i9ssE-00071W-ME; Mon, 16 Sep 2019 15:25:06 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=ZJ1s=XL=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1i9ssD-00071I-1C
 for xen-devel@lists.xenproject.org; Mon, 16 Sep 2019 15:25:05 +0000
X-Inumbo-ID: 277cab4c-d896-11e9-95ee-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 277cab4c-d896-11e9-95ee-12813bfff9fa;
 Mon, 16 Sep 2019 15:25:03 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 0F441B6E1;
 Mon, 16 Sep 2019 15:25:02 +0000 (UTC)
To: Oleksandr <olekstysh@gmail.com>
References: <1568388917-7287-1-git-send-email-olekstysh@gmail.com>
 <1568388917-7287-5-git-send-email-olekstysh@gmail.com>
 <81c2099d-ee08-2e0a-134c-0a9889748ac8@suse.com>
 <0021c5ab-457e-7cbf-a5c7-7d8676503116@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <93811967-b49d-7a86-6d19-647cd0e8d1dd@suse.com>
Date: Mon, 16 Sep 2019 17:24:51 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <0021c5ab-457e-7cbf-a5c7-7d8676503116@gmail.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH V4 4/8] xen/common: Introduce _xrealloc
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
 Volodymyr_Babchuk@epam.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTYuMDkuMjAxOSAxNzowMywgT2xla3NhbmRyIHdyb3RlOgo+IE9uIDE2LjA5LjE5IDEzOjEz
LCBKYW4gQmV1bGljaCB3cm90ZToKPj4gT24gMTMuMDkuMjAxOSAxNzozNSwgT2xla3NhbmRyIFR5
c2hjaGVua28gd3JvdGU6Cj4+PiAtLS0gYS94ZW4vY29tbW9uL3htYWxsb2NfdGxzZi5jCj4+PiAr
KysgYi94ZW4vY29tbW9uL3htYWxsb2NfdGxzZi5jCj4+PiBAQCAtNTk4LDYgKzU5OCw1OCBAQCB2
b2lkICpfeHphbGxvYyh1bnNpZ25lZCBsb25nIHNpemUsIHVuc2lnbmVkIGxvbmcgYWxpZ24pCj4+
PiAgICAgICByZXR1cm4gcCA/IG1lbXNldChwLCAwLCBzaXplKSA6IHA7Cj4+PiAgIH0KPj4+ICAg
Cj4+PiArdm9pZCAqX3hyZWFsbG9jKHZvaWQgKnB0ciwgdW5zaWduZWQgbG9uZyBzaXplLCB1bnNp
Z25lZCBsb25nIGFsaWduKQo+Pj4gK3sKPj4+ICsgICAgdW5zaWduZWQgbG9uZyBjdXJyX3NpemUs
IHRtcF9zaXplOwo+Pj4gKyAgICB2b2lkICpwOwo+Pj4gKwo+Pj4gKyAgICBpZiAoICFzaXplICkK
Pj4+ICsgICAgewo+Pj4gKyAgICAgICAgeGZyZWUocHRyKTsKPj4+ICsgICAgICAgIHJldHVybiBa
RVJPX0JMT0NLX1BUUjsKPj4+ICsgICAgfQo+Pj4gKwo+Pj4gKyAgICBpZiAoIHB0ciA9PSBOVUxM
IHx8IHB0ciA9PSBaRVJPX0JMT0NLX1BUUiApCj4+PiArICAgICAgICByZXR1cm4gX3htYWxsb2Mo
c2l6ZSwgYWxpZ24pOwo+Pj4gKwo+Pj4gKyAgICBpZiAoICEoKHVuc2lnbmVkIGxvbmcpcHRyICYg
KFBBR0VfU0laRSAtIDEpKSApCj4+PiArICAgICAgICBjdXJyX3NpemUgPSBQRk5fT1JERVIodmly
dF90b19wYWdlKHB0cikpIDw8IFBBR0VfU0hJRlQ7Cj4+IFdoaWxlIHRoZSBwcmVzZW50IE1BWF9P
UkRFUiBzZXR0aW5nIHdpbGwgcHJldmVudCBhbGxvY2F0aW9ucyBvZgo+PiA0R2lCIG9yIGFib3Zl
IGZyb20gc3VjY2VlZGluZywgbWF5IEkgYXNrIHRoYXQgeW91IGRvbid0IGludHJvZHVjZQo+PiBs
YXRlbnQgaXNzdWVzIGluIGNhc2UgTUFYX09SREVSIHdvdWxkIGV2ZXIgbmVlZCBidW1waW5nPwo+
IFN1cmUgKEkgYXNzdW1lLCB5b3UgYXJlIHRhbGtpbmcgYWJvdXQgcG9zc2libGUgdHJ1bmNhdGlv
bik6Cj4gCj4gaWYgKCAhKCh1bnNpZ25lZCBsb25nKXB0ciAmIChQQUdFX1NJWkUgLSAxKSkgKQo+
ICDCoMKgwqAgY3Vycl9zaXplID0gKHVuc2lnbmVkIGxvbmcpUEZOX09SREVSKHZpcnRfdG9fcGFn
ZShwdHIpKSA8PCBQQUdFX1NISUZUOwoKWWVzLgoKPj4+ICsgICAgICAgICAgICBST1VORFVQX1NJ
WkUodG1wX3NpemUpOwo+Pj4gKwo+Pj4gKyAgICBpZiAoIHRtcF9zaXplIDw9IGN1cnJfc2l6ZSAm
JiAoKHVuc2lnbmVkIGxvbmcpcHRyICYgKGFsaWduIC0gMSkpID09IDAgKQo+Pj4gKyAgICAgICAg
cmV0dXJuIHB0cjsgLyogdGhlIHNpemUgYW5kIGFsaWdubWVudCBmaXQgaW4gYWxyZWFkeSBhbGxv
Y2F0ZWQgc3BhY2UgKi8KPj4gWW91IGFsc28gZG9uJ3Qgc2VlbSB0byBldmVyIHVwZGF0ZSBwdHIg
aW4gY2FzZSB5b3Ugd2FudCB0byB1c2UgdGhlCj4+IChoZWFkKSBwYWRkaW5nLCBpLmUuIHlvdSdk
IGhhbmQgYmFjayBhIHBvaW50ZXIgdG8gYSBibG9jayB3aGljaCB0aGUKPj4gY2FsbGVyIHdvdWxk
IGFzc3VtZSBleHRlbmRzIHBhc3QgaXRzIGFjdHVhbCBlbmQuIEkgdGhpbmsgeW91IHdhbnQKPj4g
dG8gY2FsY3VsYXRlIHRoZSBuZXcgdGVudGF0aXZlIHBvaW50ZXIgKHRha2luZyB0aGUgcmVxdWVz
dGVkCj4+IGFsaWdubWVudCBpbnRvIGFjY291bnQpLCBhbmQgb25seSBmcm9tIHRoYXQgY2FsY3Vs
YXRlIGN1cnJfc2l6ZQo+PiAod2hpY2ggcGVyaGFwcyB3b3VsZCBiZXR0ZXIgYmUgbmFtZWQgInVz
YWJsZSIgb3IgInNwYWNlIiBvciBzb21lCj4+IHN1Y2gpLiBPYnZpb3VzbHkgdGhlIChoZWFkKSBw
YWRkaW5nIGJsb2NrIG1heSBuZWVkIHVwZGF0aW5nLCB0b28uCj4gCj4gSSBhbSBhZnJhaWQgSSBk
b24ndCBjb21wbGV0ZWx5IHVuZGVyc3RhbmQgeW91ciBwb2ludCBoZXJlLiBBbmQgc29ycnkgZm9y
IAo+IHRoZSBtYXliZSBuYWl2ZSBxdWVzdGlvbiwgYnV0IHdoYXQgaXMgdGhlICIoaGVhZCkgcGFk
ZGluZyIgaGVyZT8KClRoZSB2ZXJ5IHBhZGRpbmcgdGFsa2VkIGFib3V0IGVhcmxpZXIuIEkgZGlk
IGFkZCAiKGhlYWQpIiB0byBjbGFyaWZ5Cml0J3MgdGhhdCBzcGVjaWZpYyBjYXNlIC0gYWZ0ZXIg
YWxsIHRhaWwgcGFkZGluZyBpcyBmYXIgbW9yZSBjb21tb24uCgpKYW4KCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QK
WGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5v
cmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
