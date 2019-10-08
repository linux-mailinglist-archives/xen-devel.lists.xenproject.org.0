Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 330A6CF852
	for <lists+xen-devel@lfdr.de>; Tue,  8 Oct 2019 13:34:09 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iHnik-0001YR-G3; Tue, 08 Oct 2019 11:32:02 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=aTbt=YB=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iHnii-0001YL-Hs
 for xen-devel@lists.xenproject.org; Tue, 08 Oct 2019 11:32:00 +0000
X-Inumbo-ID: 3d505c18-e9bf-11e9-9bee-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3d505c18-e9bf-11e9-9bee-bc764e2007e4;
 Tue, 08 Oct 2019 11:31:59 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 7C763B1A6;
 Tue,  8 Oct 2019 11:31:58 +0000 (UTC)
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Juergen Gross <jgross@suse.com>
References: <osstest-142383-mainreport@xen.org>
 <b155b2f9-9664-7366-cdd0-10fac5c3ab3b@suse.com>
 <20191008111530.GD66437@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <ccad4619-0366-a117-28ba-0e4eccd550b3@suse.com>
Date: Tue, 8 Oct 2019 13:31:58 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191008111530.GD66437@Air-de-Roger>
Content-Language: en-US
Subject: Re: [Xen-devel] [xen-unstable test] 142383: regressions - FAIL
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
Cc: xen-devel@lists.xenproject.org,
 osstest service owner <osstest-admin@xenproject.org>,
 Paul Durrant <paul@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDguMTAuMjAxOSAxMzoxNSwgUm9nZXIgUGF1IE1vbm7DqSAgd3JvdGU6Cj4gT24gVHVlLCBP
Y3QgMDgsIDIwMTkgYXQgMTI6NDI6MjVQTSArMDIwMCwgSsO8cmdlbiBHcm/DnyB3cm90ZToKPj4g
T24gMDcuMTAuMTkgMjI6NTYsIG9zc3Rlc3Qgc2VydmljZSBvd25lciB3cm90ZToKPj4+IGZsaWdo
dCAxNDIzODMgeGVuLXVuc3RhYmxlIHJlYWwgW3JlYWxdCj4+PiBodHRwOi8vbG9ncy50ZXN0LWxh
Yi54ZW5wcm9qZWN0Lm9yZy9vc3N0ZXN0L2xvZ3MvMTQyMzgzLwo+Pj4KPj4+IFJlZ3Jlc3Npb25z
IDotKAo+Pj4KPj4+IFRlc3RzIHdoaWNoIGRpZCBub3Qgc3VjY2VlZCBhbmQgYXJlIGJsb2NraW5n
LAo+Pj4gaW5jbHVkaW5nIHRlc3RzIHdoaWNoIGNvdWxkIG5vdCBiZSBydW46Cj4+PiAgIHRlc3Qt
YW1kNjQtYW1kNjQtbGlidmlydC1wYWlyIDIyIGd1ZXN0LW1pZ3JhdGUvc3JjX2hvc3QvZHN0X2hv
c3QgZmFpbCBSRUdSLiB2cy4gMTQxODIyCj4+PiAgIHRlc3QtYW1kNjQtaTM4Ni1saWJ2aXJ0LXBh
aXIgMjIgZ3Vlc3QtbWlncmF0ZS9zcmNfaG9zdC9kc3RfaG9zdCBmYWlsIFJFR1IuIHZzLiAxNDE4
MjIKPj4KPj4gSG1tLCB0ZXN0IGxvZyBzYXlzIHRoZSBndWVzdCBkaWRuJ3Qgc3VzcGVuZC4KPj4K
Pj4gQ291bGQgdGhhdCBiZSByZWxhdGVkIHRvIGNvbW1pdCBiMTgzZTE4MGJjZTkzMDMgPwo+IAo+
IFRoZSBsaWJ2aXJ0IGxpYnhsIGRhZW1vbiBzcGl0czoKPiAKPiAyMDE5LTEwLTA3IDEyOjMxOjA5
Ljk1MyswMDAwOiBsaWJ4bC1zYXZlLWhlbHBlcjogc3RhcnRpbmcgc2F2ZTogU3VjY2Vzcwo+IDIw
MTktMTAtMDcgMTI6MzE6MDkuOTUzKzAwMDA6IHhjOiBmZCA0MCwgZG9tIDEsIGZsYWdzIDEsIGh2
bSAwCj4gMjAxOS0xMC0wNyAxMjozMTowOS45NTQrMDAwMDogeGM6IFNhdmluZyBkb21haW4gMSwg
dHlwZSB4ODYgUFYKPiAyMDE5LTEwLTA3IDEyOjMxOjA5Ljk1NCswMDAwOiB4YzogNjQgYml0cywg
NCBsZXZlbHMKPiAyMDE5LTEwLTA3IDEyOjMxOjA5Ljk1OSswMDAwOiB4YzogbWF4X21mbiAweDI4
MDAwMAo+IDIwMTktMTAtMDcgMTI6MzE6MDkuOTU5KzAwMDA6IHhjOiBwMm0gbGlzdCBmcm9tIDB4
ZmZmZmM5MDAwMDAwMDAwMCB0byAweGZmZmZjOTAwMDAwZmZmZmYsIHJvb3QgYXQgMHgyN2RlMGEK
PiAyMDE5LTEwLTA3IDEyOjMxOjA5Ljk1OSswMDAwOiB4YzogbWF4X3BmbiAweDFmZmZmLCBwMm1f
ZnJhbWVzIDI1Ngo+IDIwMTktMTAtMDcgMTI6MzE6MDkuOTYwKzAwMDA6IHhjOiBGYWlsZWQgdG8g
ZW5hYmxlIGxvZ2RpcnR5OiAyMiwwLDIyICgyMiA9IEludmFsaWQgYXJndW1lbnQpOiBJbnRlcm5h
bCBlcnJvcgo+IDIwMTktMTAtMDcgMTI6MzE6MDkuOTYwKzAwMDA6IHhjOiBTYXZlIGZhaWxlZCAo
MjIgPSBJbnZhbGlkIGFyZ3VtZW50KTogSW50ZXJuYWwgZXJyb3IKPiAyMDE5LTEwLTA3IDEyOjMx
OjA5Ljk4MSswMDAwOiBsaWJ4bC1zYXZlLWhlbHBlcjogY29tcGxldGUgcj0tMTogSW52YWxpZCBh
cmd1bWVudAo+IDIwMTktMTAtMDcgMTI6MzE6MDkuOTgzKzAwMDA6IGxpYnhsOiBsaWJ4bC5jOjc1
MjpsaWJ4bF9fZmRfZmxhZ3NfcmVzdG9yZTogZm5jdGwgRl9TRVRGTCBvZiBmZCA0MCB0byAweDIK
PiAyMDE5LTEwLTA3IDEyOjMxOjA5Ljk4MyswMDAwOiBsaWJ4bDogbGlieGxfZXZlbnQuYzoxODcz
OmxpYnhsX19hb19jb21wbGV0ZTogYW8gMHg3Zjc2MGMwMDIxMTA6IGNvbXBsZXRlLCByYz0tOAo+
IDIwMTktMTAtMDcgMTI6MzE6MDkuOTgzKzAwMDA6IGxpYnhsOiBsaWJ4bF9ldmVudC5jOjE4NDI6
bGlieGxfX2FvX19kZXN0cm95OiBhbyAweDdmNzYwYzAwMjExMDogZGVzdHJveQo+IAo+IFdoaWNo
IHNlZW0gdG8gYmUgcmVsYXRlZCB0byB0aGUgcmVjZW50IGlvbW11IGNoYW5nZXMsIEkgd291bGQg
c2F5IGl0J3MKPiBsaWtlbHkgaGl0dGluZyB0aGUgaXNfaW9tbXVfZW5hYmxlZCBjaGVjayBpbiBw
YWdpbmdfbG9nX2RpcnR5X2VuYWJsZQo+IGFuZCBoZW5jZSByZXR1cm5pbmcgRUlOVkFMLgo+IAo+
IEFkZGluZyBQYXVsIGFuZCBKYW4gd2hvIHdvcmtlZCBvbiB0aGUgc2VyaWVzLgoKV2VsbCwgYXMg
bWVudGlvbmVkIGluIHJlcGx5IHRvIFBhdWwncyBwYXRjaCBlYXJsaWVyIHRvZGF5LCBJIGludGVu
ZAp0byBjb21taXQgdGhlIGFncmVlZCB1cG9uIGhhbGYgb2YgaXQgbGF0ZXIgdG9kYXkuIFN1Z2dl
c3RpbmcgdGhpcyB3YXMKYWN0dWFsbHkgYSByZXN1bHQgb2YgbWUgbm90aWNpbmcgdGhpcyBsb2ct
ZGlydHkgZW5hYmxpbmcgZmFpbHVyZSB3aGVuCkkgbG9va2VkIGF0IHRoZSBsb2dzIChhbm90aGVy
IHRpbWUpIGluIHRoZSBtb3JuaW5nLgoKSmFuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVs
