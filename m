Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BA0D120456
	for <lists+xen-devel@lfdr.de>; Mon, 16 Dec 2019 12:48:40 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1igopm-00078u-IV; Mon, 16 Dec 2019 11:46:42 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=L813=2G=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1igopl-00078k-M9
 for xen-devel@lists.xenproject.org; Mon, 16 Dec 2019 11:46:41 +0000
X-Inumbo-ID: b8e3390c-1ff9-11ea-938c-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b8e3390c-1ff9-11ea-938c-12813bfff9fa;
 Mon, 16 Dec 2019 11:46:40 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 7599EAD10;
 Mon, 16 Dec 2019 11:46:39 +0000 (UTC)
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <13e82227-1de3-fd48-bd0f-99f07fca21db@suse.com>
 <5e833675-602c-7aa6-4fb7-34814355b844@suse.com>
 <8c98d4bb-52cd-3a78-f063-f791f1d37980@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <73109279-76ec-3127-9d01-d901f6701f6c@suse.com>
Date: Mon, 16 Dec 2019 12:47:05 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <8c98d4bb-52cd-3a78-f063-f791f1d37980@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v2 2/3] x86: explicitly disallow guest
 access to PPIN
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTMuMTIuMjAxOSAyMDo0NywgQW5kcmV3IENvb3BlciB3cm90ZToKPiBPbiAwOC8xMS8yMDE5
IDE1OjI0LCBKYW4gQmV1bGljaCB3cm90ZToKPj4gVG8gZnVsZmlsbCB0aGUgInByb3RlY3RlZCIg
aW4gaXRzIG5hbWUsIGRvbid0IGxldCB0aGUgcmVhbCBoYXJkd2FyZQo+PiB2YWx1ZXMgInNoaW5l
IHRocm91Z2giLiBSZXBvcnQgYSBjb250cm9sIHJlZ2lzdGVyIHZhbHVlIGV4cHJlc3NpbmcgdGhp
cy4KPiAKPiBXaHkgbm90IGNhbGwgaXQgYXMgaXQgaXM/wqAgVGhleSBsZWFrIHRocm91Z2ggZHVl
IHRvIGJ1Z3MgaW4gTVNSIGhhbmRsaW5nLgo+IAo+PiBTaWduZWQtb2ZmLWJ5OiBKYW4gQmV1bGlj
aCA8amJldWxpY2hAc3VzZS5jb20+Cj4+IC0tLQo+PiB2MjogVXNlICJjcCIgY29uc2lzdGVudGx5
LiBSZS1iYXNlLgo+Pgo+PiAtLS0gYS94ZW4vYXJjaC94ODYvbXNyLmMKPj4gKysrIGIveGVuL2Fy
Y2gveDg2L21zci5jCj4+IEBAIC0xMzUsNiArMTM1LDggQEAgaW50IGd1ZXN0X3JkbXNyKHN0cnVj
dCB2Y3B1ICp2LCB1aW50MzJfdAo+PiAgICAgIGNhc2UgTVNSX1RTWF9GT1JDRV9BQk9SVDoKPj4g
ICAgICBjYXNlIE1TUl9BTUQ2NF9MV1BfQ0ZHOgo+PiAgICAgIGNhc2UgTVNSX0FNRDY0X0xXUF9D
QkFERFI6Cj4+ICsgICAgY2FzZSBNU1JfUFBJTjoKPj4gKyAgICBjYXNlIE1TUl9BTURfUFBJTjoK
Pj4gICAgICAgICAgLyogTm90IG9mZmVyZWQgdG8gZ3Vlc3RzLiAqLwo+PiAgICAgICAgICBnb3Rv
IGdwX2ZhdWx0Owo+PiAgCj4+IEBAIC0yMzcsNiArMjM5LDE4IEBAIGludCBndWVzdF9yZG1zcihz
dHJ1Y3QgdmNwdSAqdiwgdWludDMyX3QKPj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgQVJSQVlfU0laRShtc3JzLT5kcl9tYXNrKSldOwo+PiAgICAgICAgICBicmVhazsKPj4g
IAo+PiArICAgIGNhc2UgTVNSX1BQSU5fQ1RMOgo+PiArICAgICAgICBpZiAoIGNwLT54ODZfdmVu
ZG9yICE9IFg4Nl9WRU5ET1JfSU5URUwgKQo+PiArICAgICAgICAgICAgZ290byBncF9mYXVsdDsK
Pj4gKyAgICAgICAgKnZhbCA9IFBQSU5fTE9DS09VVDsKPj4gKyAgICAgICAgYnJlYWs7Cj4+ICsK
Pj4gKyAgICBjYXNlIE1TUl9BTURfUFBJTl9DVEw6Cj4+ICsgICAgICAgIGlmICggIWNwLT5leHRk
LmFtZF9wcGluICkKPj4gKyAgICAgICAgICAgIGdvdG8gZ3BfZmF1bHQ7Cj4+ICsgICAgICAgICp2
YWwgPSBQUElOX0xPQ0tPVVQ7Cj4+ICsgICAgICAgIGJyZWFrOwo+PiArCj4gCj4gVGhlICJub3Qg
b2ZmZXJlZCB0byBndWVzdHMiIGJsb2NrcyBzaG91bGQgYWx3YXlzIGJlIHN5bW1ldHJpYy4KCldl
bGwsIHRoZSB3cm1zciBzaWRlIG9mIHRoaW5ncyBzaW1wbHkgd2FzIHRoZSB3cm9uZyB3YXkgcm91
bmQKKHNlZSBiZWxvdykgLSB3aXRoIGl0IGZsaXBwZWQgdGhleSB0aGVuIGFyZSBzeW1tZXRyaWMu
Cgo+wqAgV2hhdAo+IHlvdSd2ZSBkb25lIGhlcmUgaXMgaGFsZi12aXJ0dWFsaXNlIHNvbWV0aGlu
ZyB3ZSBoYXZlIG5vIGludGVudGlvbiB0bwo+IGV2ZXIgdmlydHVhbGlzZSBmb3IgZ3Vlc3RzLgo+
IAo+IEJvdGggb2YgdGhlc2Ugc2hvdWxkIGJlIGJsYW5rZXQgI0dQIGZhdWx0cy7CoCBBTUQgc2hv
dWxkIG5ldmVyIGJlIGluIHRoZQo+IHBvc2l0aW9uIG9mIHNlZWluZyBhbWRfcHBpbiBjbGVhciBi
dXQgUFBJTl9DVEwgcmV0dXJuaW5nIExPQ0tPVVQsIGFuZAo+IHdoaWxlIEludGVsIGRvZXMgaGF2
ZSBtb2RlbCBzcGVjaWZpYyBiZWhhdmlvdXIsIHdoYXRldmVyIGVsc2UgbWlnaHQgYmUKPiBiZWhp
bmQgdGhhdCBNU1Igb2J2aW91c2x5IHNob3VsZG4ndCBiZSBsZWFraW5nIHRob3VnaCBlaXRoZXIu
CgpJbiB0aGUgaW50ZXJlc3Qgb2YgZ2V0dGluZyB0aGlzIGFjay1lZCBJIG1pZ2h0IHN3aXRjaCB0
byB0aGUKYmxhbmtldC0jR1AgYXMgeW91IHN1Z2dlc3QsIGJ1dCBJJ20gaGF2aW5nIHRyb3VibGUg
c2VlaW5nIHdoeQpnaXZpbmcgYmFjayBzYW5lIChhbmQgc2FmZSkgdmFsdWVzIGlzIHdyb25nLiBU
aGlzIGlzbid0IG1lYW50CnRvIGluZGljYXRlIHdlIG1pZ2h0IHZpcnR1YWxpemUgbW9yZSBvZiB0
aGlzLiBCdXQgd2h5IGluY3VyIGFuCnVubmVjZXNzYXJ5ICNHUCgwKSBpbiB0aGUgZ3Vlc3Qgd2hl
biB3ZSBjYW4gaW5kaWNhdGUgdGhlIHNhbWUKaW4gYSBtb3JlICJmcmllbmRseSIgbWFubmVyPwoK
Pj4gQEAgLTI3MywxMCArMjg3LDE0IEBAIGludCBndWVzdF93cm1zcihzdHJ1Y3QgdmNwdSAqdiwg
dWludDMyX3QKPj4gICAgICBjYXNlIE1TUl9JTlRFTF9DT1JFX1RIUkVBRF9DT1VOVDoKPj4gICAg
ICBjYXNlIE1TUl9JTlRFTF9QTEFURk9STV9JTkZPOgo+PiAgICAgIGNhc2UgTVNSX0FSQ0hfQ0FQ
QUJJTElUSUVTOgo+PiArICAgIGNhc2UgTVNSX1BQSU46Cj4+ICsgICAgY2FzZSBNU1JfQU1EX1BQ
SU46Cj4gCj4gLi4uIHRoZXNlIHNob3VsZCBiZSBpbiB0aGUgbG93ZXIgYmxvY2ssIGFzICJub3Qg
b2ZmZXJlZCB0byBndWVzdHMiIGlzCj4gbG9naWNhbGx5IGRpZmZlcmVudCBmcm9tICJ3ZSB2aXJ0
dWFsaXNlIHRoZW0sIGJ1dCB0aGV5IGFyZSByZWFkIG9ubHkiLgoKSG1tLCB5ZXMsIEkgZ290IHRo
ZXNlIGFuZCAuLi4KCj4+ICAgICAgICAgIC8qIFJlYWQtb25seSAqLwo+PiAgICAgIGNhc2UgTVNS
X1RTWF9GT1JDRV9BQk9SVDoKPj4gICAgICBjYXNlIE1TUl9BTUQ2NF9MV1BfQ0ZHOgo+PiAgICAg
IGNhc2UgTVNSX0FNRDY0X0xXUF9DQkFERFI6Cj4+ICsgICAgY2FzZSBNU1JfUFBJTl9DVEw6Cj4+
ICsgICAgY2FzZSBNU1JfQU1EX1BQSU5fQ1RMOgo+PiAgICAgICAgICAvKiBOb3Qgb2ZmZXJlZCB0
byBndWVzdHMuICovCj4+ICAgICAgICAgIGdvdG8gZ3BfZmF1bHQ7CgouLi4gdGhlc2UgdGhlIHdy
b25nIHdheSByb3VuZC4KCkphbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hl
bi1kZXZlbA==
