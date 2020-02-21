Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 923F8168219
	for <lists+xen-devel@lfdr.de>; Fri, 21 Feb 2020 16:44:29 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j5AQS-0002jh-CD; Fri, 21 Feb 2020 15:41:12 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=P1D7=4J=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1j5AQQ-0002jc-QD
 for xen-devel@lists.xenproject.org; Fri, 21 Feb 2020 15:41:10 +0000
X-Inumbo-ID: 94e12aae-54c0-11ea-bc8e-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 94e12aae-54c0-11ea-bc8e-bc764e2007e4;
 Fri, 21 Feb 2020 15:41:10 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 26AC8AC77;
 Fri, 21 Feb 2020 15:41:09 +0000 (UTC)
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <20200221151948.6209-1-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <6b37fba9-bea3-0368-890d-f4ce042336a6@suse.com>
Date: Fri, 21 Feb 2020 16:41:11 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200221151948.6209-1-andrew.cooper3@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] x86/msr: Start cleaning up msr-index.h
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

T24gMjEuMDIuMjAyMCAxNjoxOSwgQW5kcmV3IENvb3BlciB3cm90ZToKPiAtLS0gYS94ZW4vaW5j
bHVkZS9hc20teDg2L21zci1pbmRleC5oCj4gKysrIGIveGVuL2luY2x1ZGUvYXNtLXg4Ni9tc3It
aW5kZXguaAo+IEBAIC0xLDcgKzEsNzQgQEAKPiAgI2lmbmRlZiBfX0FTTV9NU1JfSU5ERVhfSAo+
ICAjZGVmaW5lIF9fQVNNX01TUl9JTkRFWF9ICj4gIAo+IC0vKiBDUFUgbW9kZWwgc3BlY2lmaWMg
cmVnaXN0ZXIgKE1TUikgbnVtYmVycyAqLwo+ICsvKgo+ICsgKiBDUFUgbW9kZWwgc3BlY2lmaWMg
cmVnaXN0ZXIgKE1TUikgbnVtYmVycwo+ICsgKgo+ICsgKiBEZWZpbml0aW9ucyBmb3IgYW4gTVNS
IHNob3VsZCBmb2xsb3cgdGhpcyBzdHlsZToKPiArICoKPiArICogI2RlZmluZSBNU1JfJE5BTUUg
ICAgICAgICAgICAgICAgICAgICAgICAweCRJTkRFWAo+ICsgKiAjZGVmaW5lICAkTkFNRV8kQklU
MSAgICAgICAgICAgICAgICAgICAgIChfQUMoMSwgVUxMKSA8PCAkUE9TMSkKPiArICogI2RlZmlu
ZSAgJE5BTUVfJEJJVDIgICAgICAgICAgICAgICAgICAgICAoX0FDKDEsIFVMTCkgPDwgJFBPUzIp
Cj4gKyAqCj4gKyAqIEJsb2NrcyBvZiByZWxhdGVkIGNvbnN0YW50cyBzaG91bGQgYmUgc29ydGVk
IGJ5IE1TUiBpbmRleC4gIFRoZSBjb25zdGFudAo+ICsgKiBuYW1lcyBzaG91bGQgYmUgYXMgY29u
Y2lzZSBhcyBwb3NzaWJsZSwgYW5kIHRoZSBiaXQgbmFtZXMgbWF5IGhhdmUgYW4KPiArICogYWJi
cmV2aWF0ZWQgbmFtZS4KPiArICovCgpIbW0sIHdoaWxlICJCbG9ja3Mgb2YgcmVsYXRlZCBjb25z
dGFudHMiIGNhdGVycyBmb3IgZS5nLiBBTUQncwpNU1JfQU1ENjRfRFI8bj5fQUREUkVTU19NQVNL
LCBJIHRoaW5rIGZvciBlYXNlIG9mIGxvb2t1cCB3ZQptYXkgd2FudCB0byBiZSBzbGlnaHRseSBt
b3JlIHN0cmljdCwgd2l0aG91dCByZXF1aXJpbmcgc3Ryb25nCm9yZGVyaW5nLiBFLmcuIGJ5IGFs
c28gc3RhdGluZyB0aGF0IG11bHRpcGxlIHN1Y2ggYmxvY2tzIHNob3VsZApiZSBvcmRlcmVkIHJl
bGF0aXZlIHRvIG9uZSBhbm90aGVyIGFsc28gbnVtZXJpY2FsbHkgKG11Y2ggbGlrZQp3ZSB0cnkg
dG8gZG8gaW4gdGhlIGluc24gZW11bGF0b3IncyBodWdlIHN3aXRjaCgpIHN0YXRlbWVudCksCmJh
c2VkIG9uIHRoZWlyIGxvd2VzdCBudW1iZXJlZCBNU1IuCgooQXMgYSBuaXQsIHRoZSBleGFtcGxl
IGtpbmQgb2YgaW1wbGllcyB0aGF0IG9ubHkgc2luZ2xlIGJpdApmaWVsZHMgd291bGQgZXZlciBv
Y2N1ci4gSXQgbWlnaHQgYXZvaWQgcXVlc3Rpb25zIGlmIHlvdSBnYXZlCmEgbXVsdGktYml0IGV4
YW1wbGUuKQoKPiArI2RlZmluZSBNU1JfQVBJQ19CQVNFICAgICAgICAgICAgICAgICAgICAgICAw
eDAwMDAwMDFiCj4gKyNkZWZpbmUgIEFQSUNfQkFTRV9CU1AgICAgICAgICAgICAgICAgICAgICAg
KF9BQygxLCBVTEwpIDw8ICA4KQo+ICsjZGVmaW5lICBBUElDX0JBU0VfRVhURCAgICAgICAgICAg
ICAgICAgICAgIChfQUMoMSwgVUxMKSA8PCAxMCkKPiArI2RlZmluZSAgQVBJQ19CQVNFX0VOQUJM
RSAgICAgICAgICAgICAgICAgICAoX0FDKDEsIFVMTCkgPDwgMTEpCj4gKyNkZWZpbmUgIEFQSUNf
QkFTRV9BRERSX01BU0sgICAgICAgICAgICAgICAgMHgwMDBmZmZmZmZmZmZmMDAwVUxMCj4gKwo+
ICsjZGVmaW5lIE1TUl9URVNUX0NUUkwgICAgICAgICAgICAgICAgICAgICAgIDB4MDAwMDAwMzMK
PiArI2RlZmluZSAgVEVTVF9DVFJMX1NQTElUTE9DS19ERVRFQ1QgICAgICAgICAoX0FDKDEsIFVM
TCkgPDwgMjkpCj4gKyNkZWZpbmUgIFRFU1RfQ1RSTF9TUExJVExPQ0tfRElTQUJMRSAgICAgICAg
KF9BQygxLCBVTEwpIDw8IDMxKQo+ICsKPiArI2RlZmluZSBNU1JfSU5URUxfQ09SRV9USFJFQURf
Q09VTlQgICAgICAgICAweDAwMDAwMDM1Cj4gKyNkZWZpbmUgIE1TUl9DVENfVEhSRUFEX01BU0sg
ICAgICAgICAgICAgICAgMHgwMDAwZmZmZgo+ICsjZGVmaW5lICBNU1JfQ1RDX0NPUkVfTUFTSyAg
ICAgICAgICAgICAgICAgIDB4ZmZmZjAwMDAKPiArCj4gKyNkZWZpbmUgTVNSX1NQRUNfQ1RSTCAg
ICAgICAgICAgICAgICAgICAgICAgMHgwMDAwMDA0OAo+ICsjZGVmaW5lICBTUEVDX0NUUkxfSUJS
UyAgICAgICAgICAgICAgICAgICAgIChfQUMoMSwgVUxMKSA8PCAgMCkKPiArI2RlZmluZSAgU1BF
Q19DVFJMX1NUSUJQICAgICAgICAgICAgICAgICAgICAoX0FDKDEsIFVMTCkgPDwgIDEpCj4gKyNk
ZWZpbmUgIFNQRUNfQ1RSTF9TU0JEICAgICAgICAgICAgICAgICAgICAgKF9BQygxLCBVTEwpIDw8
ICAyKQo+ICsKPiArI2RlZmluZSBNU1JfUFJFRF9DTUQgICAgICAgICAgICAgICAgICAgICAgICAw
eDAwMDAwMDQ5Cj4gKyNkZWZpbmUgIFBSRURfQ01EX0lCUEIgICAgICAgICAgICAgICAgICAgICAg
KF9BQygxLCBVTEwpIDw8ICAwKQo+ICsKPiArI2RlZmluZSBNU1JfUFBJTl9DVEwgICAgICAgICAg
ICAgICAgICAgICAgICAweDAwMDAwMDRlCj4gKyNkZWZpbmUgIFBQSU5fTE9DS09VVCAgICAgICAg
ICAgICAgICAgICAgICAgKF9BQygxLCBVTEwpIDw8ICAwKQo+ICsjZGVmaW5lICBQUElOX0VOQUJM
RSAgICAgICAgICAgICAgICAgICAgICAgIChfQUMoMSwgVUxMKSA8PCAgMSkKPiArI2RlZmluZSBN
U1JfUFBJTiAgICAgICAgICAgICAgICAgICAgICAgICAgICAweDAwMDAwMDRmCj4gKwo+ICsjZGVm
aW5lIE1TUl9DT1JFX0NBUEFCSUxJVElFUyAgICAgICAgICAgICAgIDB4MDAwMDAwY2YKPiArI2Rl
ZmluZSAgQ09SRV9DQVBTX1NQTElUTE9DS19ERVRFQ1QgICAgICAgICAoX0FDKDEsIFVMTCkgPDwg
IDUpCj4gKwo+ICsjZGVmaW5lIE1TUl9BUkNIX0NBUEFCSUxJVElFUyAgICAgICAgICAgICAgIDB4
MDAwMDAxMGEKPiArI2RlZmluZSAgQVJDSF9DQVBTX1JEQ0xfTk8gICAgICAgICAgICAgICAgICAo
X0FDKDEsIFVMTCkgPDwgIDApCj4gKyNkZWZpbmUgIEFSQ0hfQ0FQU19JQlJTX0FMTCAgICAgICAg
ICAgICAgICAgKF9BQygxLCBVTEwpIDw8ICAxKQo+ICsjZGVmaW5lICBBUkNIX0NBUFNfUlNCQSAg
ICAgICAgICAgICAgICAgICAgIChfQUMoMSwgVUxMKSA8PCAgMikKPiArI2RlZmluZSAgQVJDSF9D
QVBTX1NLSVBfTDFERkwgICAgICAgICAgICAgICAoX0FDKDEsIFVMTCkgPDwgIDMpCj4gKyNkZWZp
bmUgIEFSQ0hfQ0FQU19TU0JfTk8gICAgICAgICAgICAgICAgICAgKF9BQygxLCBVTEwpIDw8ICA0
KQo+ICsjZGVmaW5lICBBUkNIX0NBUFNfTURTX05PICAgICAgICAgICAgICAgICAgIChfQUMoMSwg
VUxMKSA8PCAgNSkKPiArI2RlZmluZSAgQVJDSF9DQVBTX0lGX1BTQ0hBTkdFX01DX05PICAgICAg
ICAoX0FDKDEsIFVMTCkgPDwgIDYpCj4gKyNkZWZpbmUgIEFSQ0hfQ0FQU19UU1hfQ1RSTCAgICAg
ICAgICAgICAgICAgKF9BQygxLCBVTEwpIDw8ICA3KQo+ICsjZGVmaW5lICBBUkNIX0NBUFNfVEFB
X05PICAgICAgICAgICAgICAgICAgIChfQUMoMSwgVUxMKSA8PCAgOCkKPiArCj4gKyNkZWZpbmUg
TVNSX0ZMVVNIX0NNRCAgICAgICAgICAgICAgICAgICAgICAgMHgwMDAwMDEwYgo+ICsjZGVmaW5l
ICBGTFVTSF9DTURfTDFEICAgICAgICAgICAgICAgICAgICAgIChfQUMoMSwgVUxMKSA8PCAgMCkK
PiArCj4gKyNkZWZpbmUgTVNSX1RTWF9GT1JDRV9BQk9SVCAgICAgICAgICAgICAgICAgMHgwMDAw
MDEwZgo+ICsjZGVmaW5lICBUU1hfRk9SQ0VfQUJPUlRfUlRNICAgICAgICAgICAgICAgIChfQUMo
MSwgVUxMKSA8PCAgMCkKPiArCj4gKyNkZWZpbmUgTVNSX1RTWF9DVFJMICAgICAgICAgICAgICAg
ICAgICAgICAgMHgwMDAwMDEyMgo+ICsjZGVmaW5lICBUU1hfQ1RSTF9SVE1fRElTQUJMRSAgICAg
ICAgICAgICAgIChfQUMoMSwgVUxMKSA8PCAgMCkKPiArI2RlZmluZSAgVFNYX0NUUkxfQ1BVSURf
Q0xFQVIgICAgICAgICAgICAgICAoX0FDKDEsIFVMTCkgPDwgIDEpCj4gKwo+ICsvKgo+ICsgKiBM
ZWdhY3kgTVNSIGNvbnN0YW50cyBpbiBuZWVkIG9mIGNsZWFudXAuICBObyBuZXcgY29kZSBiZWxv
dyB0aGlzIGNvbW1lbnQuCj4gKyAqLwoKIk5vIG5ldyBjb2RlIiBnb2VzIHRvbyBmYXIsIEkgdGhp
bmsuIFdlIHNob3VsZG4ndCBkZW1hbmQgbmV3CmJpdHMgZm9yIGV4aXN0aW5nIE1TUnMgdG8gYmUg
YWNjb21wYW5pZWQgYnkgb3RoZXIgY2xlYW51cCBvZgp0aGF0IHNhbWUgTVNSJ3MgZGVmaW5pdGlv
bnMuICJObyBuZXcgTVNScyBiZWxvdyAuLi4iIG90b2gKd291bGQgYmUgZmluZSB3aXRoIG1lLgoK
SWYgeW91IGFncmVlIHdpdGggYm90aCwgZmVlbCBmcmVlIHRvIGFkZApSZXZpZXdlZC1ieTogSmFu
IEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgpPdGhlcndpc2UgbGV0J3Mgc2VlIHdoYXQgd2Ug
Y2FuIGNvbWUgdG8gYWdyZWUgb24uCgpKYW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3Rz
LnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0
aW5mby94ZW4tZGV2ZWw=
