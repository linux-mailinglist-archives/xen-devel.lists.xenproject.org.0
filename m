Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DBB882DC12
	for <lists+xen-devel@lfdr.de>; Wed, 29 May 2019 13:42:49 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hVwvS-0001sY-Hb; Wed, 29 May 2019 11:39:22 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=MUVL=T5=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hVwvR-0001sO-2A
 for xen-devel@lists.xenproject.org; Wed, 29 May 2019 11:39:21 +0000
X-Inumbo-ID: 6556c470-8206-11e9-b681-afcf6c848967
Received: from foss.arm.com (unknown [217.140.101.70])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 6556c470-8206-11e9-b681-afcf6c848967;
 Wed, 29 May 2019 11:39:19 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 120B580D;
 Wed, 29 May 2019 04:39:19 -0700 (PDT)
Received: from [10.1.196.50] (e108454-lin.cambridge.arm.com [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id AD0B13F59C;
 Wed, 29 May 2019 04:39:17 -0700 (PDT)
To: George Dunlap <george.dunlap@citrix.com>, Jan Beulich
 <JBeulich@suse.com>, George Dunlap <George.Dunlap@eu.citrix.com>
References: <20190507151458.29350-1-julien.grall@arm.com>
 <20190507151458.29350-4-julien.grall@arm.com>
 <5CD5620E020000780022D7CF@prv1-mh.provo.novell.com>
 <4cef7816-74da-b6e6-6f7d-e327edb083da@arm.com>
 <5CD57B78020000780022D888@prv1-mh.provo.novell.com>
 <b0dc05a5-3b2e-669a-a955-1a543b3e7581@arm.com>
 <423c2750-ca33-501f-cdc2-988bb58038b6@arm.com>
 <c168a492-8762-5604-0f80-83be4740089e@citrix.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <1f19ca35-04ce-2cf4-da23-746fb244d7dd@arm.com>
Date: Wed, 29 May 2019 12:39:16 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <c168a492-8762-5604-0f80-83be4740089e@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 03/14] xen/x86: Make mfn_to_gfn typesafe
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Tim Deegan <tim@xen.org>,
 Wei Liu <wei.liu2@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgR2VvcmdlLAoKT24gMjgvMDUvMjAxOSAxODoyOSwgR2VvcmdlIER1bmxhcCB3cm90ZToKPiBP
biA1LzIwLzE5IDQ6MTMgUE0sIEp1bGllbiBHcmFsbCB3cm90ZToKPj4gSGksCj4+Cj4+IE9uIDEw
LzA1LzIwMTkgMTQ6MjUsIEp1bGllbiBHcmFsbCB3cm90ZToKPj4+Cj4+Pgo+Pj4gT24gMTAvMDUv
MjAxOSAxNDoyNCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4+Pj4gT24gMTAuMDUuMTkgYXQgMTU6
MDIsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4gd3JvdGU6Cj4+Pj4KPj4+Pj4KPj4+Pj4gT24gMTAv
MDUvMjAxOSAxMjozNSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4+Pj4+PiBPbiAwNy4wNS4xOSBh
dCAxNzoxNCwgPGp1bGllbi5ncmFsbEBhcm0uY29tPiB3cm90ZToKPj4+Pj4+PiAtLS0gYS94ZW4v
YXJjaC94ODYvbW0vc2hhZG93L2NvbW1vbi5jCj4+Pj4+Pj4gKysrIGIveGVuL2FyY2gveDg2L21t
L3NoYWRvdy9jb21tb24uYwo+Pj4+Pj4+IEBAIC00NzQsNyArNDc0LDggQEAgc3RhdGljIGlubGlu
ZSB2b2lkIHRyYWNlX3Jlc3luYyhpbnQgZXZlbnQsCj4+Pj4+Pj4gbWZuX3QgZ21mbikKPj4+Pj4+
PiAgwqDCoMKgwqDCoMKgIGlmICggdGJfaW5pdF9kb25lICkKPj4+Pj4+PiAgwqDCoMKgwqDCoMKg
IHsKPj4+Pj4+PiAgwqDCoMKgwqDCoMKgwqDCoMKgwqAgLyogQ29udmVydCBnbWZuIHRvIGdmbiAq
Lwo+Pj4+Pj4+IC3CoMKgwqDCoMKgwqDCoCB1bnNpZ25lZCBsb25nIGdmbiA9IG1mbl90b19nZm4o
Y3VycmVudC0+ZG9tYWluLCBnbWZuKTsKPj4+Pj4+PiArwqDCoMKgwqDCoMKgwqAgdW5zaWduZWQg
bG9uZyBnZm4gPSBnZm5feChtZm5fdG9fZ2ZuKGN1cnJlbnQtPmRvbWFpbiwKPj4+Pj4+PiBnbWZu
KSk7Cj4+Pj4+Pj4gKwo+Pj4+Pj4+ICDCoMKgwqDCoMKgwqDCoMKgwqDCoCBfX3RyYWNlX3Zhcihl
dmVudCwgMC8qIXRzYyovLCBzaXplb2YoZ2ZuKSwgJmdmbik7Cj4+Pj4+Pj4gIMKgwqDCoMKgwqDC
oCB9Cj4+Pj4+Pgo+Pj4+Pj4gQ2FuJ3QgeW91IHVzZSBnZm5fdCBoZXJlLCBhbmQgaGVuY2UgYXZv
aWQgdGhlIGdmbl94KCk/IFNhbWUgYWdhaW4KPj4+Pj4+IGZ1cnRoZXIKPj4+Pj4+IGRvd24uCj4+
Pj4+IEJlY2F1c2UgX190cmFjZV92YXIgd2lsbCBleHBvcnQgdGhlIHZhbHVlIHRvIHRoZSBndWVz
dC4gSSB3YXNuJ3Qgc3VyZQo+Pj4+PiB3aGV0aGVyIHdlCj4+Pj4+IGNhbiBzYWZlbHkgY29uc2lk
ZXIgdGhhdCBnZm5fdCBpcyBleGFjdGx5IHRoZSBzYW1lIGFzIHVuc2lnbmVkIGxvbmcgaW4KPj4+
Pj4gZGVidWctYnVpbGQuCj4+Pj4KPj4+PiBIbW0sIHdlbGwgLSBzZWUgdGhlIGRlZmluaXRpb24g
b2YgZ2ZuX3QuIEdlb3JnZSwgd2hhdCBkbyB5b3UgdGhpbms/Cj4+Pgo+Pj4gSSBrbm93IHdoYXQn
cyB0aGUgY3VycmVudCBkZWZpbml0aW9uLiBNeSBwb2ludCBpcyB3ZSBuZXZlciBtYWRlIHRoYXQK
Pj4+IGFzc3VtcHRpb24gYmVmb3JlLiBJbiBhbGwgaG9uZXN0eSwgc3VyZSBhc3N1bXB0aW9uIHdv
dWxkIGRlZmluaXRlbHkKPj4+IGhlbHAgaW4gYSBmZXcgcGxhY2VzLCBidXQgSSB0aGluayB3ZSBv
dWdodCB0byBzYWZlZ3VhcmQgd2l0aAo+Pj4gQlVJTERfQlVHKC4uLikuCj4+Cj4+IEdlb3JnZSwg
ZG8geW91IGhhdmUgYW55IG9waW5pb25zPwo+IAo+IFNvcnJ5LCBub3Qgc3VyZSBob3cgSSBtaXNz
ZWQgdGhpcyBxdWVzdGlvbiBlYXJsaWVyLgo+IAo+IFRoZSBfX3RyYWNlX3ZhcigpIGNhbGwgaGVy
ZSBpcyBkZXNpZ25lZCB0byBiZSBnZW5lcmljOiB3aGF0ZXZlciB0eXBlIG9yCj4gc2l6ZSBnZm4g
aXMsIGl0IHdpbGwgY29weSB0aGUgd2hvbGUgdGhpbmcuICBUcmFjaW5nIGlzIGV4cGxpY2l0bHkg
bm90Cj4gbWVhbnQgdG8gYmUgYSBzdGFibGUgaW50ZXJmYWNlIC0tIHRoZSB0b29sc3RhY2sgbmVl
ZHMgdG8gdHJhY2sgdGhlCj4gaHlwZXJ2aXNvciBpbiB0ZXJtcyBvZiB3aGF0IGl0J3MgZ29pbmcg
dG8ga2ljayBvdXQuCj4gCj4gU28sIGhhdmluZyBnZm4gYmUgYSBnZm5fdCBpbiB0aGlzIGNhc2Ug
c2hvdWxkIGJlIGZpbmU7IGluIGZhY3QgaXQgc2hvdWxkCj4gYmUgX2JldHRlcl8gdGhhbiB1bnNp
Z25lZCBsb25nLCBzaW5jZSBpZiBnZm5fdCBldmVyIGRvZXMgY2hhbmdlIHNpemUsCj4gdGhlIHRy
YWNlIHJlY29yZCB3aWxsIGNoYW5nZSBzaXplIGFwcHJvcHJpYXRlbHkuICBJZiB0aGF0IGhhcHBl
bnMsCj4geGVuYWx5emUgd2lsbCBuZWVkIHRvIGJlIG1vZGlmaWVkIHRvIHVuZGVyc3RhbmQgaG93
IHRvIGRlYWwgd2l0aCB0aGUgbmV3Cj4gc2l6ZSwgYnV0IHRoYXQncyBleHBlY3RlZC4KPiAKPiBB
bGwgdGhhdCB0byBzYXk6IGl0IGxvb2tzIGxpa2UgSmFuJ3Mgc3VnZ2VzdGlvbiBvZiBoYXZpbmcg
Z2ZuX3QgaGVyZQo+IHdvdWxkIGJlIGJldHRlci4KCk1ha2Ugc2Vuc2UsIHRoYW5rIHlvdSBmb3Ig
dGhlIGFuc3dlci4gSSB3aWxsIHJlc3BpbiB0aGUgc2VyaWVzLgoKQ2hlZXJzLAoKLS0gCkp1bGll
biBHcmFsbAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
WGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0
cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
