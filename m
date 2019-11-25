Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 51F1E108E31
	for <lists+xen-devel@lfdr.de>; Mon, 25 Nov 2019 13:51:23 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iZDo7-0008Pn-SS; Mon, 25 Nov 2019 12:49:35 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=yJnJ=ZR=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iZDo6-0008Pg-Ts
 for xen-devel@lists.xenproject.org; Mon, 25 Nov 2019 12:49:34 +0000
X-Inumbo-ID: 071a0ebc-0f82-11ea-b08b-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 071a0ebc-0f82-11ea-b08b-bc764e2007e4;
 Mon, 25 Nov 2019 12:49:33 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 74443AF11;
 Mon, 25 Nov 2019 12:49:32 +0000 (UTC)
To: George Dunlap <george.dunlap@citrix.com>
References: <20191125123923.2000028-1-george.dunlap@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <7b6f4664-7d59-a8f9-2c29-67edba04ac17@suse.com>
Date: Mon, 25 Nov 2019 13:49:36 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20191125123923.2000028-1-george.dunlap@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH RFC] x86: Don't increase ApicIdCoreSize past
 7
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
Cc: Juergen Gross <jgross@suse.com>, Steven Haigh <netwiz@crc.id.au>,
 WeiLiu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Andreas Kinzler <hfp@posteo.de>, Ian Jackson <ian.jackson@citrix.com>,
 xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjUuMTEuMjAxOSAxMzozOSwgR2VvcmdlIER1bmxhcCB3cm90ZToKPiBDaGFuZ2VzZXQgY2Ey
ZWVlOTJkZjQ0ICgieDg2LCBodm06IEV4cG9zZSBob3N0IGNvcmUvSFQgdG9wb2xvZ3kgdG8gSFZN
Cj4gZ3Vlc3RzIikgYXR0ZW1wdGVkIHRvICJmYWtlIHVwIiBhIHRvcG9sb2d5IHdoaWNoIHdvdWxk
IGluZHVjZSBndWVzdAo+IG9wZXJhdGluZyBzeXN0ZW1zIHRvIG5vdCB0cmVhdCB2Y3B1cyBhcyBz
aWJsaW5nIGh5cGVydGhyZWFkcy4gIFRoaXMKPiBpbnZvbHZlZCBhY3R1YWxseSByZXBvcnRpbmcg
aHlwZXJ0aHJlYWRpbmcgYXMgYXZhaWxhYmxlLCBidXQgZ2l2aW5nCj4gdmNwdXMgZXZlcnkgb3Ro
ZXIgQXBpY0lkOyB3aGljaCBpbiB0dXJuIGxlZCB0byBkb3VibGluZyB0aGUgQXBpY0lkcwo+IHBl
ciBjb3JlIGJ5IGJ1bXBpbmcgdGhlIEFwaWNJZENvcmVTaXplIGJ5IG9uZS4gIEluIHBhcnRpY3Vs
YXIsIFJ5emVuCj4gM3h4eCBzZXJpZXMgcHJvY2Vzc29ycywgYW5kIHJlcG9ydGVkbHkgRVBZQyAi
Um9tZSIgY3B1cyAtLSBoYXZlIGFuCj4gQXBpY0lkQ29yZVNpemUgb2YgNzsgdGhlICJmYWtlIiB0
b3BvbG9neSBpbmNyZWFzZXMgdGhpcyB0byA4Lgo+IAo+IFVuZm9ydHVuYXRlbHksIFdpbmRvd3Mg
cnVubmluZyBvbiBtb2Rlcm4gQU1EIGhhcmR3YXJlIC0tIGluY2x1ZGluZwo+IFJ5emVuIDN4eHgg
c2VyaWVzIHByb2Nlc3NvcnMsIGFuZCByZXBvcnRlZGx5IEVQWUMgIlJvbWUiIGNwdXMgLS0KPiBk
b2Vzbid0IHNlZW0gdG8gY29wZSB3aXRoIHRoaXMgdmFsdWUgYmVpbmcgaGlnaGVyIHRoYW4gNy4g
IChMaW51eAo+IGd1ZXN0cyBoYXZlIHNvIGZhciBjb250aW51ZWQgdG8gY29wZS4pCj4gCj4gQSAi
cHJvcGVyIiBmaXggaXMgY29tcGxpY2F0ZWQgYW5kIGl0J3MgdG9vIGxhdGUgdG8gZml4IGl0IGVp
dGhlciBmb3IKPiA0LjEzLCBvciB0byBiYWNrcG9ydCB0byBzdXBwb3J0ZWQgYnJhbmNoZXMuICBB
cyBhIHNob3J0LXRlcm0gZml4LAo+IGxpbWl0IHRoaXMgdmFsdWUgdG8gNy4KPiAKPiBUaGlzIGRv
ZXMgbWVhbiB0aGF0IGEgTGludXggZ3Vlc3QsIGJvb3RlZCBvbiBzdWNoIGEgc3lzdGVtIHdpdGhv
dXQKPiB0aGlzIGNoYW5nZSwgYW5kIHRoZW4gbWlncmF0aW5nIHRvIGEgc3lzdGVtIHdpdGggdGhp
cyBjaGFuZ2UsIHdpdGgKPiBtb3JlIHRoYW4gNjQgdmNwdXMsIHdvdWxkIHNlZSBhbiBhcHBhcmVu
dCB0b3BvbG9neSBjaGFuZ2UuICBUaGlzIGlzIGEKPiBsb3cgZW5vdWdoIHJpc2sgaW4gcHJhY3Rp
Y2UgdGhhdCBlbmFibGluZyB0aGlzIGxpbWl0IHVuaWxhdGVyYWxseSwgdG8KPiBhbGxvdyBvdGhl
ciBndWVzdHMgdG8gYm9vdCB3aXRob3V0IG1hbnVhbCBpbnRlcnZlbnRpb24sIGlzIHdvcnRoIGl0
Lgo+IAo+IFJlcG9ydGVkLWJ5OiBTdGV2ZW4gSGFpZ2ggPG5ldHdpekBjcmMuaWQuYXU+Cj4gUmVw
b3J0ZWQtYnk6IEFuZHJlYXMgS2luemxlciA8aGZwQHBvc3Rlby5kZT4KPiBTaWduZWQtb2ZmLWJ5
OiBHZW9yZ2UgRHVubGFwIDxnZW9yZ2UuZHVubGFwQGNpdHJpeC5jb20+CgpBY2tlZC1ieTogSmFu
IEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgp3aXRoIC4uLgoKPiAtLS0gYS90b29scy9saWJ4
Yy94Y19jcHVpZF94ODYuYwo+ICsrKyBiL3Rvb2xzL2xpYnhjL3hjX2NwdWlkX3g4Ni5jCj4gQEAg
LTYxNiwxMCArNjE2LDE1IEBAIGludCB4Y19jcHVpZF9hcHBseV9wb2xpY3koeGNfaW50ZXJmYWNl
ICp4Y2gsIHVpbnQzMl90IGRvbWlkLAo+ICAgICAgICAgICAgICAgKiAtIGdvaW5nIG91dCBvZiBz
eW5jIHdpdGggbGVhZiAxIEVCWFsyMzoxNl0sCj4gICAgICAgICAgICAgICAqIC0gaW5jcmVtZW50
aW5nIEFwaWNJZENvcmVTaXplIHdoZW4gaXQncyB6ZXJvICh3aGljaCBjaGFuZ2VzIHRoZQo+ICAg
ICAgICAgICAgICAgKiAgIG1lYW5pbmcgb2YgYml0cyA3OjApLgo+ICsgICAgICAgICAgICAgKgo+
ICsgICAgICAgICAgICAgKiBVUERBVEU6IEkgYWRkaXRpb24gdG8gYXZvaWRpbmcgb3ZlcmZsb3cs
IHNvbWUKCi4uLiB0aGlzIGJlY29taW5nICJVUERBVEU6IEluIC4uLiIuCgpKYW4KCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5n
IGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJv
amVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
