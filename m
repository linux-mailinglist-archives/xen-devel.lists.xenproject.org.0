Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EA64863A0
	for <lists+xen-devel@lfdr.de>; Thu,  8 Aug 2019 15:47:49 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hvij5-0002AY-Cg; Thu, 08 Aug 2019 13:45:07 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=islG=WE=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hvij3-0002AO-NC
 for xen-devel@lists.xenproject.org; Thu, 08 Aug 2019 13:45:05 +0000
X-Inumbo-ID: b97e163c-b9e2-11e9-8980-bc764e045a96
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTP
 id b97e163c-b9e2-11e9-8980-bc764e045a96;
 Thu, 08 Aug 2019 13:45:03 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8EC3415A2;
 Thu,  8 Aug 2019 06:45:03 -0700 (PDT)
Received: from [10.1.196.50] (e108454-lin.cambridge.arm.com [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DBA573F694;
 Thu,  8 Aug 2019 06:45:01 -0700 (PDT)
To: Oleksandr <olekstysh@gmail.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>
References: <1565261603-9632-1-git-send-email-olekstysh@gmail.com>
 <20190808110107.kh2jbl2eztgzong3@Air-de-Roger>
 <e5483aef-cb1f-4fa0-eea7-59005ababa38@gmail.com>
 <2dfcda6f-c5da-7b86-429f-f11827ad1b08@arm.com>
 <a6d060d0-663e-83ac-e880-813db882b677@gmail.com>
 <13592722-6a0c-ac81-1402-3f09e662ca4d@arm.com>
 <bb0990c3-af35-8a32-cad5-da1d86594010@gmail.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <a61f54dc-05d7-8351-15b8-f3e368008231@arm.com>
Date: Thu, 8 Aug 2019 14:45:00 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <bb0990c3-af35-8a32-cad5-da1d86594010@gmail.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] xen/arm: Let the IOMMU be accessible by
 Dom0 if forcibly disabled in Xen
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
Cc: xen-devel@lists.xenproject.org, sstabellini@kernel.org,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGksCgpPbiAwOC8wOC8yMDE5IDE0OjM2LCBPbGVrc2FuZHIgd3JvdGU6Cj4gCj4gSGkKPiAKPiAK
Pj4+Cj4+Pgo+Pj4KPj4+Pj4KPj4+Pj4KPj4+Pj4+IE9uIFRodSwgQXVnIDA4LCAyMDE5IGF0IDAx
OjUzOjIzUE0gKzAzMDAsIE9sZWtzYW5kciBUeXNoY2hlbmtvIHdyb3RlOgo+Pj4+Pj4+IEZyb206
IE9sZWtzYW5kciBUeXNoY2hlbmtvIDxvbGVrc2FuZHJfdHlzaGNoZW5rb0BlcGFtLmNvbT4KPj4+
Pj4+Pgo+Pj4+Pj4+IERvbid0IHNraXAgSU9NTVUgbm9kZXMgd2hlbiBjcmVhdGluZyBEVCBmb3Ig
RG9tMCBpZiBJT01NVSBoYXMgYmVlbgo+Pj4+Pj4+IGZvcmNpYmx5IGRpc2FibGVkIGluIGJvb3Rh
cmdzIChlLmcuICJpb21tdT0wIikgaW4gb3JkZXIgdG8gbGV0Cj4+Pj4+Pj4gdGhlIElPTU1VIGJl
IGFjY2Vzc2libGUgYnkgRE9NMC4KPj4+Pgo+Pj4+IEkgZG9uJ3QgdGhpbmsgeW91ciBjb2RlIGlz
IGRvaW5nIHdoYXQgeW91IGV4cGVjdC4uLiBJZiBpb21tdT0wLCB0aGVuIFhlbiAKPj4+PiB3aWxs
IG5vdCBsb29rdXAgZm9yIElPTU1VcyAoaW9tbXVfaGFyZHdhcmVfc2V0dXAoKSB3aWxsIG5vdCBi
ZSBjYWxsZWQpLiBTbyAKPj4+PiBub25lIG9mIHRoZSBkZXZpY2Ugd2lsbCBoYXZlIERFVklDRV9J
T01NVSBzZXQgYW5kIGhlbmNlIHRoZXkgYXJlIGFscmVhZHkgCj4+Pj4gZ2l2ZW4gdG8gZG9tMC4K
Pj4+Pgo+Pj4+IEJ1dCBJIHRoaW5rIGl0IGlzIHdyb25nIHRvIGdpdmUgdGhlIElPTU1VcyB0byBE
b20wIHdoZW4gaW9tbXU9MC4gVGhpcyBpcyBub3QgCj4+Pj4gdGhlIGdvYWwgb2YgdGhpcyBvcHRp
b24uIElmIHlvdSB3YW50IHRvIHBhc3N0aHJvdWdoIHRoZSBJT01NVSB0byBEb20wLCB0aGVuIAo+
Pj4+IHlvdSBzaG91bGQgdXNlIHRoZSBwYXJhbWV0ZXIgaW9tbXVfaHdkb21fcGFzc3Rocm91Z2gu
Cj4+Pj4KPj4+PiBIb3dldmVyLCBJIGFncmVlIHdpdGggUm9nZXIgdGhhdCBnaXZpbmcgdGhlIElP
TU1VIHRvIGRvbTAgaXMgYSBwcmV0dHkgYmFkIAo+Pj4+IGlkZWEuIFNvIHRoaXMgc2hvdWxkIGJl
IGZpeGVkLgo+Pj4KPj4+Cj4+PiBJIGZ1bGx5IGFncmVlIHdpdGggdGhlIGFyZ3VtZW50cyBwcm92
aWRlZCB0aGF0IGl0IGlzIGEgYmFkIGlkZWEuIFNvLCBwbGVhc2UgCj4+PiBjb25zaWRlciB0aGF0
IHBhdGNoIGFzIG5vdCByZWxldmFudC4KPj4+Cj4+Pgo+Pj4gQnV0LCBJIGFtIG5vdCBzdXJlIEkg
Zm9sbG93IHRoZSBsYXN0IHNlbnRlbmNlOgo+Pj4KPj4+IMKgPj4+IElmIGlvbW11PTAsIHRoZW4g
WGVuIHdpbGwgbm90IGxvb2t1cCBmb3IgSU9NTVVzIChpb21tdV9oYXJkd2FyZV9zZXR1cCgpIAo+
Pj4gd2lsbCBub3QgYmUgY2FsbGVkKS4gU28gbm9uZSBvZiB0aGUgZGV2aWNlIHdpbGwgaGF2ZSBE
RVZJQ0VfSU9NTVUgc2V0IGFuZCAKPj4+IGhlbmNlIHRoZXkgYXJlIGFscmVhZHkgZ2l2ZW4gdG8g
ZG9tMC4KPj4+Cj4+PiBJIGNhbiBzZWUgdGhhdCBkZXZpY2VzIGhhdmUgREVWSUNFX0lPTU1VIHNl
dC4gQWx0aG91Z2gsIHRoZSBJT01NVSBkcml2ZXIgaXMgCj4+PiBub3QgaW4gdXNlLCBpdCBpcyBw
cmVzZW50IGFuZCBjb21wYXRpYmxlIG1hdGNoZXMuIFNvLCBldmVuIGlmIGlvbW11PTAsIHRoZSAK
Pj4+IElPTU1VIGRldmljZXMgYXJlIG5vdCBnaXZlbiB0byBEb20wLCBiZWNhdXNlIG9mIHNraXBw
ZWQuIE9yIEkgbWlzc2VkIHNvbWV0aGluZz8KPj4KPj4gSSBjYW4ndCBzZWUgaG93IGlvbW11X2hh
cmR3YXJlX3NldHVwKCkgY2FuIGJlIGNhbGxlZCBvbiBzdGFnaW5nIHdoZW4gaW9tbXU9MCAKPj4g
YXMgdGhpcyBpcyBwcm90ZWN0ZWQgYnkgYSBpZiAoIGlvbW11X2VuYWJsZSApLgo+Pgo+PiBDYW4g
eW91IHBsZWFzZSBnaXZlIGEgc3RhY2sgdHJhY2UgaG93IHRoaXMgaXMgY2FsbGVkIGFuZCB0aGUg
dmVyc2lvbiB5b3UgdXNlPyAKPj4gV0FSTigpIHNob3VsZCBkbyBpdCBmb3IgeW91Lgo+IAo+IAo+
IGlvbW11X2hhcmR3YXJlX3NldHVwKCkgaXMgbm90IGNhbGxlZC4gQnV0LCBkZXZpY2VzIGhhdmUg
REVWSUNFX0lPTU1VIHNldCwgZXZlbiAKPiBpZiAiaW9tbXU9MCIuIEkgYW0gYmFzZWQgb24gIjdk
MTQ2MGMgeGVuL2FybTogb3B0ZWU6IGZpeCBjb21waWxhdGlvbiB3aXRoIEdDQyAKPiA0LjgiICsg
U3RlZmFubydzIHJlc2VydmVkLW1lbW9yeSBzZXJpZXMgKyBteSBJUE1NVSBzZXJpZXMuCgpIbW1t
LCB3aGF0IHlvdSBtZWFuIGJ5IHNldCBpcyAiZGV2aWNlX2dldF9jbGFzcygpIHJldHVybiBERVZJ
Q0VfSU9NTVUiLiBUaGlzIGlzIAp3ZXJlIEkgZ290IGNvbmZ1c2VkIGFuZCBJIG1peGVkIHVwIHdp
dGggZHRfZGV2aWNlX3NldF97cHJvdGVjdGVkLCB1c2VkX2J5fSgpIApmdW5jdGlvbi4KCmRldmlj
ZV9nZXRfY2xhc3MoKSB3aWxsIGp1c3QgbG9va3VwIGZvciBhIG1hdGNoIGFuZCByZXR1cm4gdGhl
IGNsYXNzIGFzc29jaWF0ZWQuIApTbyB5b3UgYXJlIHJpZ2h0IGFuZCB0aGUgbm9kZSB3aWxsIGJl
IHNraXBwZWQgaW4gdGhhdCBjYXNlLiBOb3RoaW5nIHRvIG1vZGlmeSBpbiAKdGhlIGN1cnJlbnQg
Y29kZS4KCkNoZWVycywKCi0tIApKdWxpZW4gR3JhbGwKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1h
bi9saXN0aW5mby94ZW4tZGV2ZWw=
