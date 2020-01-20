Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ACE41425E3
	for <lists+xen-devel@lfdr.de>; Mon, 20 Jan 2020 09:39:15 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1itSXp-0005ab-Sv; Mon, 20 Jan 2020 08:36:25 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=xaUo=3J=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1itSXo-0005aW-Ai
 for xen-devel@lists.xenproject.org; Mon, 20 Jan 2020 08:36:24 +0000
X-Inumbo-ID: ef598e42-3b5f-11ea-b934-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ef598e42-3b5f-11ea-b934-12813bfff9fa;
 Mon, 20 Jan 2020 08:36:21 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id DA646B1EC;
 Mon, 20 Jan 2020 08:36:20 +0000 (UTC)
To: =?UTF-8?B?UGFzaSBLw6Rya2vDpGluZW4=?= <pasik@iki.fi>
References: <20200104010759.GA2507@mail-itl>
 <ee338bbe-647e-36c9-a22e-8a082f97b08c@suse.com>
 <20200119103945.GN21578@reaktio.net>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <f4099f0e-2084-1fb3-5038-9e82b6a3e3e1@suse.com>
Date: Mon, 20 Jan 2020 09:36:27 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20200119103945.GN21578@reaktio.net>
Content-Language: en-US
Subject: Re: [Xen-devel] Broken PCI device passthrough, after XSA-302 fix?
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
Cc: xen-devel <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTkuMDEuMjAyMCAxMTozOSwgUGFzaSBLw6Rya2vDpGluZW4gd3JvdGU6Cj4gT24gTW9uLCBK
YW4gMDYsIDIwMjAgYXQgMDI6MDY6MTRQTSArMDEwMCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+IE9u
IDA0LjAxLjIwMjAgMDI6MDcsIE1hcmVrIE1hcmN6eWtvd3NraS1Hw7NyZWNraSAgd3JvdGU6Cj4+
PiBJIGhhdmUgYSBtdWx0aS1mdW5jdGlvbiBQQ0kgZGV2aWNlLCBiZWhpbmQgYSBQQ0kgYnJpZGdl
LCB0aGF0IG5vcm1hbGx5Cj4+PiBJIGFzc2lnbiB0byBhIHNpbmdsZSBkb21haW4uIEJ1dCBub3cg
aXQgZmFpbHMgd2l0aDoKPj4+Cj4+PiAoWEVOKSBbVlQtRF1kMTQ6IDAwMDA6MDQ6MDAuMCBvd25l
ZCBieSBkMCE8Rz48MD5hc3NpZ24gMDAwMDowNTowMC4wIHRvIGRvbTE0IGZhaWxlZCAoLTIyKQo+
Pgo+PiBJJ3ZlIHRyaWVkIHRoaXMgb3V0IGluIGFzIGNsb3NlIGEgc2V0dXAgYXMgSSBjb3VsZCBh
cnJhbmdlIGZvciwgYnV0Cj4+IG5vdCBvbmUgbWF0Y2hpbmcgeW91ciBzY2VuYXJpby4gSSBkaWRu
J3QgZmluZCBhIHN5c3RlbSB3aXRoIGEKPj4gc3VpdGFibHkgcGxhY2VkIChpbiB0aGUgdG9wb2xv
Z3kpIG11bHRpLWZ1bmN0aW9uIGRldmljZSAoaGFkIHRvIHVzZQo+PiBhIHNpbmdsZS1mdW5jdGlv
biBvbmUpLCBhbmQgb2YgY291cnNlIEkgZGlkIHRoaXMgb24gKGNsb3NlIHRvKQo+PiBtYXN0ZXIu
IE5vIGFub21hbGllcy4gSGVuY2UgSSB3b25kZXIgd2hldGhlciBlaXRoZXIgb2YgdGhlIHR3bwo+
PiBkaWZmZXJlbmNlcyBtZW50aW9uZWQgbWF0dGVycywgYW5kIC0gaWYsIGFzIEkgc3VzcGVjdCwg
aXQncyB0aGUKPj4gbXVsdGktZnVuY3Rpb24gYXNwZWN0IHRoYXQgaXMgcmVsZXZhbnQgaGVyZSAt
IGhvdyB0aGluZ3Mgd291bGQgaGF2ZQo+PiB3b3JrZWQgYXQgYWxsIGJlZm9yZSB0aG9zZSByZWNl
bnQgY2hhbmdlcy4gVGhpcyBpcyBiZWNhdXNlIEkgdGhpbmsKPj4geW91IHNob3VsZCBoYXZlIGhp
dCB0aGUgc2FtZSBlcnJvciBwYXRoIGV2ZW4gYmVmb3JlLCBhbmQgaXQgd291bGQKPj4gc2VlbSB0
byBtZSB0aGF0IHRoZSBwYXRjaCBiZWxvdyBtaWdodCBiZSAoYW5kIGhhdmUgYmVlbikgbmVlZGVk
Lgo+Pgo+IAo+IEkgdGhpbmsgTWFyZWsgY29uZmlybWVkIGluIHRoZSBvdGhlciBtYWlsIHRoYXQg
dGhpcyBwYXRjaCBmaXhlcyB0aGUgaXNzdWUuCj4gCj4gQXJlIHlvdSBwbGFubmluZyB0byBtZXJn
ZSB0aGlzIHBhdGNoPwoKV2VsbCwgaXQgaXMgc3RpbGwgcGVuZGluZyBhIG1haW50YWluZXIgYWNr
LiBLZXZpbiBoYXMgcmVxdWVzdGVkIGEKKG1lY2hhbmljYWwpIGNoYW5nZSBqdXN0IG92ZXIgdGhl
IHdlZWtlbmQuCgpKYW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2
ZWw=
