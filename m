Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DCE5B104E84
	for <lists+xen-devel@lfdr.de>; Thu, 21 Nov 2019 09:56:05 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iXiDk-00051j-Jz; Thu, 21 Nov 2019 08:53:48 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=erj2=ZN=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iXiDi-00051a-PO
 for xen-devel@lists.xenproject.org; Thu, 21 Nov 2019 08:53:46 +0000
X-Inumbo-ID: 6c8e887a-0c3c-11ea-a326-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 6c8e887a-0c3c-11ea-a326-12813bfff9fa;
 Thu, 21 Nov 2019 08:53:45 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 3275BB23E;
 Thu, 21 Nov 2019 08:53:44 +0000 (UTC)
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <0ba2bc19-2388-5fdc-43bd-3ac39497291c@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <587cd745-2bdd-1542-3021-6c55a63ef666@suse.com>
Date: Thu, 21 Nov 2019 09:53:44 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <0ba2bc19-2388-5fdc-43bd-3ac39497291c@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] Status of 4.13
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
Cc: George Dunlap <george.dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien.grall@arm.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjEuMTEuMjAxOSAwNzowNSwgSsO8cmdlbiBHcm/DnyB3cm90ZToKPiBXaGVyZSBkbyB3ZSBz
dGFuZCB3aXRoIFhlbiA0LjEzIHJlZ2FyZGluZyBibG9ja2VycyBhbmQgcmVsYXRlZCBwYXRjaGVz
Pwo+IAo+IDEuIE9TU3Rlc3QgZmFpbHVyZSByZWdhcmRpbmcgbmVzdGVkIHRlc3Q6Cj4gICAgIEkn
bSBub3QgcXVpdGUgc3VyZSB3aGV0aGVyIHRoZSBjdXJyZW50bHkgZGViYXRlZCBwYXRjaCBvZiBB
bmRyZXcgaXMKPiAgICAgZml4aW5nIHRoZSBwcm9ibGVtLiBJZiBub3QsIGRvIHdlIGtub3cgd2hh
dCBpcyBtaXNzaW5nIG9yIGhvdyB0bwo+ICAgICBhZGRyZXNzIHRoZSBpc3N1ZT8gSWYgeWVzLCBj
b3VsZCB3ZSBwbGVhc2UgY29tZSB0byBhbiBhZ3JlZW1lbnQ/Cj4gICAgIEFzIGFuIGFsdGVybmF0
aXZlOiBhbnkgdGhvdWdodHMgYWJvdXQgaWdub3JpbmcgdGhpcyB0ZXN0IGZhaWx1cmUgZm9yCj4g
ICAgIDQuMTMtUkMzIChJT1c6IGRvaW5nIGEgZm9yY2UgcHVzaCk/CgpJJ2QgcmVjb21tZW5kIGFn
YWluc3QgZG9pbmcgc28sIGluIHBhcnRpY3VsYXIgc2VlaW5nIHRoYXQgYWxsIHN0YWJsZQp0cmVl
cyBhcmUgYWxzbyBhZmZlY3RlZC4KCkFuZHJldydzIHBhdGNoIG1heSBlbmQgdXAgYmVpbmcgYSBw
cmVyZXEgdG8gdGhlIGZ1bGwgZml4LCBidXQgdGhpcwpsb29rcyB0byBub3QgYmUgZW50aXJlbHkg
Y2xlYXIgeWV0IGF0IHRoaXMgcG9pbnQuIChJJ20gaGF2aW5nIGEKaGFyZCB0aW1lIHNlZWluZyBh
IGZhaXIgc29sdXRpb24gd2l0aG91dCB0aGlzIGNoYW5nZS4pCgo+IDIuIFJ5emVuL1JvbWUgZmFp
bHVyZXMgd2l0aCBXaW5kb3dzIGd1ZXN0czoKPiAgICAgV2hhdCBpcyB0aGUgY3VycmVudGx5IHBs
YW5uZWQgd2F5IHRvIGFkZHJlc3MgdGhlIHByb2JsZW0/IFdobyBpcwo+ICAgICB3b3JraW5nIG9u
IHRoYXQ/Cj4gCj4gMy4gUGVuZGluZyBwYXRjaGVzIGZvciA0LjEzOgo+ICAgICBDb3VsZCBJIHBs
ZWFzZSBoYXZlIGZlZWRiYWNrIHdoaWNoIHBhdGNoZXMgdGFnZ2VkIGFzICJmb3ItNC4xMyIgYXJl
Cj4gICAgIGZpeGluZyByZWFsIHJlZ3Jlc3Npb25zIG9yIGlzc3Vlcz8gSSBkb24ndCB3YW50IHRv
IHRha2UgYW55IHBhdGNoZXMKPiAgICAgbm90IGZpeGluZyByZWFsIHByb2JsZW1zIGFmdGVyIFJD
MywgYW5kIEkgaG9wZSB0byBiZSBhYmxlIHRvIGdldCBhCj4gICAgIHB1c2ggcmF0aGVyIHNvb25l
ciB0aGFuIGxhdGVyIHRvIGJlIGFibGUgdG8gbGV0IElhbiBjdXQgUkMzLgoKQWNjb3JkaW5nIHRv
IG15IGxpc3QgaXQncwpBTUQvSU9NTVU6IHJlLXdvcmsgbW9kZSB1cGRhdGluZyBbcmVncmVzc2lv
bl0KYnVpbGQ6IHByb3ZpZGUgb3B0aW9uIHRvIGRpc2FtYmlndWF0ZSBzeW1ib2wgbmFtZXMgW2lz
c3VlXQp4ODYvdm14OiBhbHdheXMgc3luYyBQSVIgdG8gSVJSIGJlZm9yZSB2bWVudHJ5IFtpc3N1
ZV0KClRoZSBsYXN0IG9uZSwgYWNjb3JkaW5nIHRvIG15IHJlY29yZHMsIHdpbGwgbmVlZCBhdCBs
ZWFzdCBvbmUgbW9yZQpyZXZpc2lvbi4KCkFuZHJldyBkaWQgYWxzbyBpbmRpY2F0ZSBoZSdkIHNl
ZSAieDg2OiBleHBsaWNpdGx5IGRpc2FsbG93IGd1ZXN0CmFjY2VzcyB0byBQUElOIiBhcyBzb21l
dGhpbmcgdGhhdCBzaG91bGQgZ28gaW4gZm9yIDQuMTMsIGJ1dCB0aGVyZQpsb29rcyB0byBoYXZl
IGJlZW4gdG9vIGxpdHRsZSBhdHRlbnRpb24vcHJvZ3Jlc3MgdGhlcmUuCgo+IDQuIEFyZSB0aGVy
ZSBhbnkgYmxvY2tlcnMgZm9yIDQuMTMgb3RoZXIgdGhhbiAxLiBhbmQgMi4gKGFwYXJ0IG9mIGFu
eQo+ICAgICBwZW5kaW5nIFhTQXMpPwoKIkxhdGVzdCBkZXZlbG9wbWVudCAobWFzdGVyKSBYZW4g
ZmFpbHMgdG8gYm9vdCBvbiBIUCBQcm9MaWFudCBETDIwIEdFTjEwIgoKSmFuCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBs
aXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2pl
Y3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
