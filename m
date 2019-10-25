Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E7ECFE4F19
	for <lists+xen-devel@lfdr.de>; Fri, 25 Oct 2019 16:29:31 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iO0Yr-0001Uj-FN; Fri, 25 Oct 2019 14:27:29 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=/YrW=YS=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iO0Yp-0001UY-8M
 for xen-devel@lists.xenproject.org; Fri, 25 Oct 2019 14:27:27 +0000
X-Inumbo-ID: 911a2d20-f733-11e9-bbab-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 911a2d20-f733-11e9-bbab-bc764e2007e4;
 Fri, 25 Oct 2019 14:27:26 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id C6F01BC1C;
 Fri, 25 Oct 2019 14:27:25 +0000 (UTC)
To: =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>
References: <cover.d9b2d7d69cc351a30963d653b1d459c878356e4e.1571888583.git-series.marmarek@invisiblethingslab.com>
 <db4793665d03513d06ffd6b3d4a52c8a699ccb0b.1571888583.git-series.marmarek@invisiblethingslab.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <975b7013-d379-4baa-e648-f87776e143f2@suse.com>
Date: Fri, 25 Oct 2019 16:27:42 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <db4793665d03513d06ffd6b3d4a52c8a699ccb0b.1571888583.git-series.marmarek@invisiblethingslab.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v4 2/3] xen/efi: optionally call
 SetVirtualAddressMap()
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
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjQuMTAuMjAxOSAwNTo0NSwgTWFyZWsgTWFyY3p5a293c2tpLUfDs3JlY2tpIHdyb3RlOgo+
IFNvbWUgVUVGSSBpbXBsZW1lbnRhdGlvbnMgYXJlIG5vdCBoYXBweSBhYm91dCBsYWNrIG9mCj4g
U2V0VmlydHVhbEFkZHJlc3NNYXAoKSBjYWxsLiBMaWtlbHkgYWJ1c2UgdGhlIGFkZHJlc3MgbWFw
IGNoYW5nZQo+IG5vdGlmaWNhdGlvbiB0byBkbyB0aGluZ3MgYmV5b25kIHRoZSBuZWNlc3Nhcnkg
Q29udmVydFBvaW50ZXIoKSBjYWxscy4KPiBTcGVjaWZpY2FsbHksIHdpaHRvdXQgdGhlIFNldFZp
cnR1YWxBZGRyZXNzTWFwKCkgY2FsbCwgc29tZSBhY2Nlc3MKPiBFZmlCb290U2VydmljZXN7Q29k
ZSxEYXRhfSwgb3IgZXZlbiB0b3RhbGx5IHVubWFwcGVkIGFyZWFzLiBFeGFtcGxlCj4gY3Jhc2gg
b2YgR2V0VmFyaWFibGUoKSBjYWxsIG9uIFRoaW5rcGFkIFc1NDA6Cj4gCj4gICAgIFhlbiBjYWxs
IHRyYWNlOgo+ICAgICAgICBbPDAwMDAwMDAwMDAwMDAwODA+XSAwMDAwMDAwMDAwMDAwMDgwCj4g
ICAgICAgIFs8OGMyYjAzOThlMDAwMGRhYT5dIDhjMmIwMzk4ZTAwMDBkYWEKPiAKPiAgICAgUGFn
ZXRhYmxlIHdhbGsgZnJvbSBmZmZmZmZmZjg1ODQ4M2ExOgo+ICAgICAgICBMNFsweDFmZl0gPSAw
MDAwMDAwMDAwMDAwMDAwIGZmZmZmZmZmZmZmZmZmZmYKPiAKPiAgICAgKioqKioqKioqKioqKioq
KioqKioqKioqKioqKioqKioqKioqKioqKgo+ICAgICBQYW5pYyBvbiBDUFUgMDoKPiAgICAgRkFU
QUwgUEFHRSBGQVVMVAo+ICAgICBbZXJyb3JfY29kZT0wMDAyXQo+ICAgICBGYXVsdGluZyBsaW5l
YXIgYWRkcmVzczogZmZmZmZmZmY4NTg0ODNhMQo+ICAgICAqKioqKioqKioqKioqKioqKioqKioq
KioqKioqKioqKioqKioqKioqCj4gCj4gRml4IHRoaXMgYnkgY2FsbGluZyBTZXRWaXJ0dWFsQWRk
cmVzc01hcCgpIHJ1bnRpbWUgc2VydmljZSwgZ2l2aW5nIGl0Cj4gMToxIG1hcCBmb3IgYXJlYXMg
bWFya2VkIGFzIG5lZWRlZCBkdXJpbmcgcnVudGltZS4gVGhlIGFkZHJlc3Mgc3BhY2UgaW4KPiB3
aGljaCBFRkkgcnVudGltZSBzZXJ2aWNlcyBhcmUgY2FsbGVkIGlzIHVuY2hhbmdlZCwgYnV0IFVF
RkkgdmlldyBvZiBpdAo+IG1heSBiZS4KPiBTaW5jZSBpdCdzIGZhaXJseSBsYXRlIGluIFhlbiA0
LjEzIGRldmVsb3BtZW50IGN5Y2xlLCBkaXNhYmxlIGl0Cj4gYnkgZGVmYXVsdCBhbmQgaGlkZSBi
ZWhpbmQgRVhQRVJULgo+IAo+IFNpZ25lZC1vZmYtYnk6IE1hcmVrIE1hcmN6eWtvd3NraS1Hw7Ny
ZWNraSA8bWFybWFyZWtAaW52aXNpYmxldGhpbmdzbGFiLmNvbT4KClJldmlld2VkLWJ5OiBKYW4g
QmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVs
