Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CCBC913BE27
	for <lists+xen-devel@lfdr.de>; Wed, 15 Jan 2020 12:05:32 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1irgRp-0006uj-22; Wed, 15 Jan 2020 11:02:53 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=wJf7=3E=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1irgRn-0006ue-Nk
 for xen-devel@lists.xenproject.org; Wed, 15 Jan 2020 11:02:51 +0000
X-Inumbo-ID: 8d5308c2-3786-11ea-b89f-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8d5308c2-3786-11ea-b89f-bc764e2007e4;
 Wed, 15 Jan 2020 11:02:42 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id EE302AF9F;
 Wed, 15 Jan 2020 11:02:41 +0000 (UTC)
To: =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>
References: <cover.f819645cd9f5cf7a6f692f9661cfb4e670a2cd08.1579055705.git-series.marmarek@invisiblethingslab.com>
 <ce51dd78fd7aa0856d160b2d94c82f68dd4e7056.1579055705.git-series.marmarek@invisiblethingslab.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <f0712623-fbc7-eca2-8303-6cc6b46f36b1@suse.com>
Date: Wed, 15 Jan 2020 12:02:42 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <ce51dd78fd7aa0856d160b2d94c82f68dd4e7056.1579055705.git-series.marmarek@invisiblethingslab.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v4 11/16] tools: add simple
 vchan-socket-proxy
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTUuMDEuMjAyMCAwMzozOSwgTWFyZWsgTWFyY3p5a293c2tpLUfDs3JlY2tpIHdyb3RlOgo+
IEFkZCBhIHNpbXBsZSBwcm94eSBmb3IgdHVubmVsaW5nIHNvY2tldCBjb25uZWN0aW9uIG92ZXIg
dmNoYW4uIFRoaXMgaXMKPiBiYXNlZCBvbiBleGlzdGluZyB2Y2hhbi1ub2RlKiBhcHBsaWNhdGlv
bnMsIGJ1dCBleHRlbmRlZCB3aXRoIHNvY2tldAo+IHN1cHBvcnQuIHZjaGFuLXNvY2tldC1wcm94
eSBzZXJ2ZXMgYm90aCBhcyBhIGNsaWVudCBhbmQgYXMgYSBzZXJ2ZXIsCj4gZGVwZW5kaW5nIG9u
IHBhcmFtZXRlcnMuIEl0IGNhbiBiZSB1c2VkIHRvIHRyYW5zcGFyZW50bHkgY29tbXVuaWNhdGUK
PiB3aXRoIGFuIGFwcGxpY2F0aW9uIGluIGFub3RoZXIgZG9taWFuIHRoYXQgbm9ybWFsbHkgZXhw
b3NlIFVOSVggc29ja2V0Cj4gaW50ZXJmYWNlLiBTcGVjaWZpY2FsbHksIGl0J3Mgd3JpdHRlbiB0
byBjb21tdW5pY2F0ZSB3aXRoIHFlbXUgcnVubmluZwo+IHdpdGhpbiBzdHViZG9tLgo+IAo+IFNl
cnZlciBtb2RlIGxpc3RlbnMgZm9yIHZjaGFuIGNvbm5lY3Rpb25zIGFuZCB3aGVuIG9uZSBpcyBv
cGVuZWQsCj4gY29ubmVjdHMgdG8gYSBwb2ludGVkIFVOSVggc29ja2V0LiAgQ2xpZW50IG1vZGUg
bGlzdGVucyBvbiBVTklYCj4gc29ja2V0IGFuZCB3aGVuIHNvbWVvbmUgY29ubmVjdHMsIG9wZW5z
IGEgdmNoYW4gY29ubmVjdGlvbi4gIE9ubHkKPiBhIHNpbmdsZSBjb25uZWN0aW9uIGF0IGEgdGlt
ZSBpcyBzdXBwb3J0ZWQuCj4gCj4gQWRkaXRpb25hbGx5LCBzb2NrZXQgY2FuIGJlIHByb3ZpZGVk
IGFzIGEgbnVtYmVyIC0gaW4gd2hpY2ggY2FzZSBpdCdzCj4gaW50ZXJwcmV0ZWQgYXMgYWxyZWFk
eSBvcGVuIEZEIChpbiBjYXNlIG9mIFVOSVggbGlzdGVuaW5nIHNvY2tldCAtCj4gbGlzdGVuKCkg
bmVlZHMgdG8gYmUgYWxyZWFkeSBjYWxsZWQpLiBPciAiLSIgbWVhbmluZyBzdGRpbi9zdGRvdXQg
LSBpbgo+IHdoaWNoIGNhc2UgaXQgaXMgcmVkdWNlZCB0byB2Y2hhbi1ub2RlMiBmdW5jdGlvbmFs
aXR5Lgo+IAo+IEV4YW1wbGUgdXNhZ2U6Cj4gCj4gMS4gKGluIGRvbTApIHZjaGFuLXNvY2tldC1w
cm94eSAtLW1vZGU9Y2xpZW50IDxET01JRD4KPiAgICAgL2xvY2FsL2RvbWFpbi88RE9NSUQ+L2Rh
dGEvdmNoYW4vMTIzNCAvcnVuL3FlbXUuKERPTUlEKQo+IAo+IDIuIChpbiBET01JRCkgdmNoYW4t
c29ja2V0LXByb3h5IC0tbW9kZT1zZXJ2ZXIgMAo+ICAgIC9sb2NhbC9kb21haW4vPERPTUlEPi9k
YXRhL3ZjaGFuLzEyMzQgL3J1bi9xZW11LihET01JRCkKPiAKPiBUaGlzIHdpbGwgbGlzdGVuIG9u
IC9ydW4vcWVtdS4oRE9NSUQpIGluIGRvbTAgYW5kIHdoZW5ldmVyIGNvbm5lY3Rpb24gaXMKPiBt
YWRlLCBpdCB3aWxsIGNvbm5lY3QgdG8gRE9NSUQsIHdoZXJlIHNlcnZlciBwcm9jZXNzIHdpbGwg
Y29ubmVjdCB0bwo+IC9ydW4vcWVtdS4oRE9NSUQpIHRoZXJlLiBXaGVuIGNsaWVudCBkaXNjb25u
ZWN0cywgdmNoYW4gY29ubmVjdGlvbiBpcwo+IHRlcm1pbmF0ZWQgYW5kIHNlcnZlciB2Y2hhbi1z
b2NrZXQtcHJveHkgcHJvY2VzcyBhbHNvIGRpc2Nvbm5lY3RzIGZyb20KPiBxZW11Lgo+IAo+IFNp
Z25lZC1vZmYtYnk6IE1hcmVrIE1hcmN6eWtvd3NraS1Hw7NyZWNraSA8bWFybWFyZWtAaW52aXNp
YmxldGhpbmdzbGFiLmNvbT4KPiAtLS0KPiAgLmdpdGlnbm9yZSAgICAgICAgICAgICAgICAgICAg
ICAgICAgfCAgIDEgKy0KCkkgZ3Vlc3MgdGhpcyBpcyB3aHkgdmFyaW91cyBub24tdG9vbC1zdGFj
ayBtYWludGFpbmVycyBoYXZlCmJlZW4gQ2MtZWQuIEl0IHdvdWxkIGhhdmUgYmVlbiBuaWNlIGlm
IHlvdSBoYWQgc3RyaXBwZWQgdGhlCnVubmVjZXNzYXJ5IENjLXMuIEkgZG9uJ3QgdGhpbmsgLi9N
QUlOVEFJTkVSUyBjYW4gcHJvcGVybHkKZXhwcmVzcyBhIHN1aXRhYmxlIHJ1bGUgb2YgQ2MgUkVT
VCBpZiB0aGUgYWRqdXN0bWVudCBpcyBub3QKc2ltcGx5IGFjY29tcGFueWluZyB0aGUgYWRkaXRp
b24gb2Ygc29tZSBuZXcgb3V0cHV0IGZpbGUuCgo+ICB0b29scy9saWJ2Y2hhbi9NYWtlZmlsZSAg
ICAgICAgICAgICB8ICAgNyArLQo+ICB0b29scy9saWJ2Y2hhbi9pbml0LmMucmVqICAgICAgICAg
ICB8ICA2MCArKysrLQoKTm93IHNpbmNlIEkndmUgYmVlbiBDYy1lZCwgSSdkIGxpa2UgdG8gYXNr
IHdoYXQgdGhpcyBpcyBhYm91dC4KCkphbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMu
eGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL3hlbi1kZXZlbA==
