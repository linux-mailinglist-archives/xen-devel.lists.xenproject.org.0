Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 976A6C1BF8
	for <lists+xen-devel@lfdr.de>; Mon, 30 Sep 2019 09:14:38 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iEpqR-0004d1-Ta; Mon, 30 Sep 2019 07:11:43 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=hbFO=XZ=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1iEpqP-0004cw-Lf
 for xen-devel@lists.xenproject.org; Mon, 30 Sep 2019 07:11:41 +0000
X-Inumbo-ID: 8c4481ce-e351-11e9-97fb-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by localhost (Halon) with ESMTPS
 id 8c4481ce-e351-11e9-97fb-bc764e2007e4;
 Mon, 30 Sep 2019 07:11:40 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 476CAB0E5;
 Mon, 30 Sep 2019 07:11:39 +0000 (UTC)
To: osstest service owner <osstest-admin@xenproject.org>,
 xen-devel@lists.xenproject.org, Paul Durrant <Paul.Durrant@citrix.com>
References: <osstest-141990-mainreport@xen.org>
 <fd1ea329-5fae-0ac2-d8b6-53845ac99775@suse.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <ea74b1b6-438a-b78e-be42-187aa432cfe2@suse.com>
Date: Mon, 30 Sep 2019 09:11:38 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <fd1ea329-5fae-0ac2-d8b6-53845ac99775@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [xen-unstable test] 141990: regressions - FAIL
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMzAuMDkuMTkgMDg6MDEsIErDvHJnZW4gR3Jvw58gd3JvdGU6Cj4gT24gMzAuMDkuMTkgMDY6
MjMsIG9zc3Rlc3Qgc2VydmljZSBvd25lciB3cm90ZToKPj4gZmxpZ2h0IDE0MTk5MCB4ZW4tdW5z
dGFibGUgcmVhbCBbcmVhbF0KPj4gaHR0cDovL2xvZ3MudGVzdC1sYWIueGVucHJvamVjdC5vcmcv
b3NzdGVzdC9sb2dzLzE0MTk5MC8KPj4KPj4gUmVncmVzc2lvbnMgOi0oCj4+Cj4+IFRlc3RzIHdo
aWNoIGRpZCBub3Qgc3VjY2VlZCBhbmQgYXJlIGJsb2NraW5nLAo+PiBpbmNsdWRpbmcgdGVzdHMg
d2hpY2ggY291bGQgbm90IGJlIHJ1bjoKPj4gwqAgdGVzdC1hbWQ2NC1hbWQ2NC14bC1xZW11dC1k
ZWJpYW5odm0tYW1kNjTCoCA3IHhlbi1ib290wqDCoMKgIGZhaWwgUkVHUi4gCj4+IHZzLiAxNDE4
MjIKPj4gwqAgdGVzdC1hbWQ2NC1hbWQ2NC1saWJ2aXJ0wqDCoMKgwqAgMTIgZ3Vlc3Qtc3RhcnTC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBmYWlsIFJFR1IuIAo+PiB2cy4gMTQxODIyCj4+IMKg
IHRlc3QtYW1kNjQtaTM4Ni1saWJ2aXJ0LXhzbcKgIDEyIGd1ZXN0LXN0YXJ0wqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgZmFpbCBSRUdSLiAKPj4gdnMuIDE0MTgyMgo+PiDCoCB0ZXN0LWFtZDY0
LWFtZDY0LWxpYnZpcnQtcGFpciAyMiBndWVzdC1taWdyYXRlL3NyY19ob3N0L2RzdF9ob3N0IAo+
PiBmYWlsIFJFR1IuIHZzLiAxNDE4MjIKPj4gwqAgdGVzdC1hbWQ2NC1pMzg2LWxpYnZpcnTCoMKg
wqDCoMKgIDEyIGd1ZXN0LXN0YXJ0wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZmFpbCBSRUdS
LiAKPj4gdnMuIDE0MTgyMgo+PiDCoCB0ZXN0LWFtZDY0LWFtZDY0LW1pZ3J1cGdyYWRlIDIyIGd1
ZXN0LW1pZ3JhdGUvc3JjX2hvc3QvZHN0X2hvc3QgZmFpbCAKPj4gUkVHUi4gdnMuIDE0MTgyMgo+
PiDCoCB0ZXN0LWFtZDY0LWkzODYtbGlidmlydC1wYWlyIDIyIGd1ZXN0LW1pZ3JhdGUvc3JjX2hv
c3QvZHN0X2hvc3QgZmFpbCAKPj4gUkVHUi4gdnMuIDE0MTgyMgo+PiDCoCB0ZXN0LWFtZDY0LWkz
ODYtbWlncnVwZ3JhZGUgMjIgZ3Vlc3QtbWlncmF0ZS9zcmNfaG9zdC9kc3RfaG9zdCBmYWlsIAo+
PiBSRUdSLiB2cy4gMTQxODIyCj4+IMKgIHRlc3QtYXJtNjQtYXJtNjQtZXhhbWluZcKgwqDCoCAx
MSBleGFtaW5lLXNlcmlhbC9ib290bG9hZGVyIGZhaWwgUkVHUi4gCj4+IHZzLiAxNDE4MjIKPj4g
wqAgdGVzdC1hbWQ2NC1hbWQ2NC14bC1xZW11dC1zdHViZG9tLWRlYmlhbmh2bS1hbWQ2NC14c20g
MTAgCj4+IGRlYmlhbi1odm0taW5zdGFsbCBmYWlsIFJFR1IuIHZzLiAxNDE4MjIKPj4gwqAgdGVz
dC1hcm02NC1hcm02NC1saWJ2aXJ0LXhzbSAxMiBndWVzdC1zdGFydMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgIGZhaWwgUkVHUi4gCj4+IHZzLiAxNDE4MjIKPj4gwqAgdGVzdC1hbWQ2NC1hbWQ2
NC1saWJ2aXJ0LXZoZCAxMCBkZWJpYW4tZGktaW5zdGFsbMKgwqDCoMKgwqDCoMKgIGZhaWwgUkVH
Ui4gCj4+IHZzLiAxNDE4MjIKPj4gwqAgdGVzdC1hcm1oZi1hcm1oZi1saWJ2aXJ0wqDCoMKgwqAg
MTIgZ3Vlc3Qtc3RhcnTCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBmYWlsIFJFR1IuIAo+PiB2
cy4gMTQxODIyCj4+IMKgIHRlc3QtYXJtaGYtYXJtaGYtbGlidmlydC1yYXcgMTAgZGViaWFuLWRp
LWluc3RhbGzCoMKgwqDCoMKgwqDCoCBmYWlsIFJFR1IuIAo+PiB2cy4gMTQxODIyCj4gCj4gU2V2
ZXJhbCBvZiB0aGUgZmFpbHVyZXMgc2VlbSB0byBiZSByZWxhdGVkIHRvIGNvbW1pdCBiYWJkZTQ3
YTNmZWRhNmRkNAo+ICgiaW50cm9kdWNlIGEgJ3Bhc3N0aHJvdWdoJyBjb25maWd1cmF0aW9uIG9w
dGlvbiB0byB4bC5jZmciKS4KPiAKPiBJIHRoaW5rIHRoZSBhc3NlcnQoKSBpbiBsaXhsX2NyZWF0
ZS5jIChsaW5lIDU4OSkgc2hvdWxkIGp1c3QgYmUgZHJvcHBlZD8KPiAKPiAgwqDCoMKgwqDCoMKg
wqAgYXNzZXJ0KGluZm8tPnBhc3N0aHJvdWdoICE9IExJQlhMX1BBU1NUSFJPVUdIX0VOQUJMRUQp
Owo+ICDCoMKgwqDCoMKgwqDCoCBMT0coREVUQUlMLCAicGFzc3Rocm91Z2g6ICVzIiwKPiAgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoCBsaWJ4bF9wYXNzdGhyb3VnaF90b19zdHJpbmcoaW5mby0+cGFz
c3Rocm91Z2gpKTsKPiAKPiAgwqDCoMKgwqDCoMKgwqAgaWYgKGluZm8tPnBhc3N0aHJvdWdoICE9
IExJQlhMX1BBU1NUSFJPVUdIX0RJU0FCTEVEKQo+ICDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGNy
ZWF0ZS5mbGFncyB8PSBYRU5fRE9NQ1RMX0NERl9pb21tdTsKPiAKPiAgwqDCoMKgwqDCoMKgwqAg
aWYgKGluZm8tPnBhc3N0aHJvdWdoID09IExJQlhMX1BBU1NUSFJPVUdIX1NZTkNfUFQpCj4gIMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgY3JlYXRlLmlvbW11X29wdHMgfD0gWEVOX0RPTUNUTF9JT01N
VV9ub19zaGFyZXB0Owo+IAo+IE9yIHRoZSBpZiAoKSBzdGF0ZW1lbnRzIGFmdGVyIHRoYXQgYXJl
IGp1c3QgcGxhaW4gd3Jvbmc/CgpJIG1pc3JlYWQgdGhlIGNvZGUuCgpCdXQgbmV2ZXJ0aGVsZXNz
IHRoZXJlIGlzIHNvbWV0aGluZyB3cm9uZy4uLgoKCkp1ZXJnZW4KCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVu
LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcv
bWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
