Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D5458238CD
	for <lists+xen-devel@lfdr.de>; Mon, 20 May 2019 15:53:42 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hSihT-0003hh-L7; Mon, 20 May 2019 13:51:35 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=gSYI=TU=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hSihS-0003hY-A9
 for xen-devel@lists.xenproject.org; Mon, 20 May 2019 13:51:34 +0000
X-Inumbo-ID: 5f04effe-7b06-11e9-9613-6f516e38476f
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 5f04effe-7b06-11e9-9613-6f516e38476f;
 Mon, 20 May 2019 13:51:31 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Mon, 20 May 2019 07:51:30 -0600
Message-Id: <5CE2B0DA0200007800230A08@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.0 
Date: Mon, 20 May 2019 07:51:22 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "Wei Liu" <wei.liu2@citrix.com>
References: <E1hSRQF-0006xk-BS@osstest.test-lab.xenproject.org>
 <23778.34168.78221.110803@mariner.uk.xensource.com>
 <20190520114147.GU2798@zion.uk.xensource.com>
In-Reply-To: <20190520114147.GU2798@zion.uk.xensource.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: Re: [Xen-devel] Linux 3.18 no longer boots under Xen, please fix
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
Cc: Juergen Gross <jgross@suse.com>, Lars Kurth <lars.kurth@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Paul Durrant <paul.durrant@citrix.com>,
 xen-devel <xen-devel@lists.xenproject.org>,
 Ian Jackson <ian.jackson@citrix.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Pj4+IE9uIDIwLjA1LjE5IGF0IDEzOjQxLCA8d2VpLmxpdTJAY2l0cml4LmNvbT4gd3JvdGU6Cj4g
T24gTW9uLCBNYXkgMjAsIDIwMTkgYXQgMTE6NDY6MTZBTSArMDEwMCwgSWFuIEphY2tzb24gd3Jv
dGU6Cj4+IFRoaXMgaGFzIGJlZW4gdHJ1ZSBmb3Igc29tZSB0aW1lLiAgb3NzdGVzdCBoYXMgYmVl
biBzZW5kaW5nIGF1dG9tYXRpYwo+PiBtYWlscyBpbmNsdWRpbmcgYmlzZWN0aW9uIHJlcG9ydHMg
bGlrZSB0aGUgb25lIGJlbG93LCBmb3IgYWJvdXQgYQo+PiBtb250aC4KPj4gCj4+IG9zc3Rlc3Qn
cyAidGVzdGVkIGFuZCBnb29kIiBicmFuY2ggb2YgbGludXgtMy4xOCBpcyAxOTAgZGF5cyBiZWhp
bmQKPj4gdGhlIHVwc3RyZWFtIHRpcC4KPj4gCj4+IERvIHdlIGNhcmUgYWJvdXQgdGhpcyBhdCBh
bGwgPwo+PiAKPj4gTm90ZSB0aGF0IHRoZSBYZW4gUHJvamVjdCBkb2VzIG5vdCBoYXZlIGEgZGVk
aWNhdGVkIHRlYW0gb2YgUUEKPj4gZW5naW5lZXJzIHdobyBkbyB0cmlhZ2Ugb2YgdGVzdCByZXBv
cnRzLiAgSXQgaXMgdXAgdG8gZXZlcnkgbWFpbnRhaW5lcgo+PiBvZiBldmVyeSBYZW4tcmVsYXRl
ZCBjb21wb25lbnQgdG8ga2VlcCBhbiBleWUgb24gdGhlc2UgdGVzdCByZXBvcnRzCj4+IGFuZCBp
bnZlc3RpZ2F0ZSBmYWlsdXJlcy4KPj4gCj4+IEZvciB0aGUgYXZvaWRhbmNlIG9mIGFueSBkb3Vi
dCwgb3NzdGVzdCdzICJiaXNlY3Rpb24gY29tcGxldGUiIHJlcG9ydHMKPj4gY2FuIGFsd2F5cyBi
ZSByZWxpZWQgb24gdG8gYWNjdXJhdGVseSBpZGVudGlmeSBhIHJlYWwsIHJlcGVhdGFibGUsCj4+
IHJlZ3Jlc3Npb24uICBvc3N0ZXN0IHdpbGwgb25seSBtYWtlIHN1Y2ggYSByZXBvcnQgaWYgaXQg
aGFzIHJlcHJvZHVjZWQKPj4gc2V2ZXJhbCB0aW1lcyBib3RoIHRoZSBmYWlsdXJlIGF0IHRoZSBj
b21taXQgaXQgYmxhbWVzLCBhbmQgdGhlCj4+IHN1Y2Nlc3MgYXQgdGhlIGNvbW1pdCBpdCBzYXlz
IGlzIE9LLiAgKEluIHRyZWVzIHdpdGggYSBsb3Qgb2YgbWVyZ2luZywKPj4gdGhlIGNvbW1pdCB0
aGF0IGlzIGJsYW1lZCBpcyBzYWRseSBvZnRlbiBhIG1lcmdlLCBidXQgb25lIG9mIGl0cwo+PiBw
YXJlbnRzIHdpbGwgYmUgaWRlbnRpZmllZCBhcyBnb29kLikKPj4gCj4+IEluIHRoaXMgY2FzZSBv
c3N0ZXN0IGhhcyBzZW50IGEgc2lnbmlmaWNhbnQgbnVtYmVyIG9mIGZ1bmN0aW9uYWxseQo+PiBp
ZGVudGljYWwgcmVwb3J0cyBzYXlpbmcgaXQgaGFzIGlkZW50aWZpZWQgYSByZWdyZXNzaW9uIGlu
IGxvdHMgb2YKPj4gZGlmZmVyZW50IHRlc3RzLiAgQnV0IHRoaXMgaGFzIG5vdCByZXN1bHRlZCBp
biBhbnkgYWN0aW9uIEFGQUlBQS4KPj4gCj4+IFBsZWFzZSB3b3VsZCBzb21lb25lIGludm9sdmVk
IHdpdGggdGhlIExpbnV4IGtlcm5lbCBlbmQgb2YgdGhpbmdzIHBpY2sKPj4gdGhpcyB1cC4KPj4g
Cj4+IFRoYW5rcywKPj4gSWFuLgo+PiAKPj4gb3NzdGVzdCBzZXJ2aWNlIG93bmVyIHdyaXRlcyAo
IltsaW51eC0zLjE4IGJpc2VjdGlvbl0gY29tcGxldGUgCj4gdGVzdC1hbWQ2NC1hbWQ2NC14bCIp
Ogo+PiA+IGJyYW5jaCB4ZW4tdW5zdGFibGUKPj4gPiB4ZW5icmFuY2ggeGVuLXVuc3RhYmxlCj4+
ID4gam9iIHRlc3QtYW1kNjQtYW1kNjQteGwKPj4gPiB0ZXN0aWQgeGVuLWJvb3QKPj4gPiAKPj4g
PiBUcmVlOiBsaW51eCAKPiBnaXQ6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5l
bC9naXQvc3RhYmxlL2xpbnV4LXN0YWJsZS5naXQKPj4gPiBUcmVlOiBsaW51eGZpcm13YXJlIGdp
dDovL3hlbmJpdHMueGVuLm9yZy9vc3N0ZXN0L2xpbnV4LWZpcm13YXJlLmdpdAo+PiA+IFRyZWU6
IG92bWYgZ2l0Oi8veGVuYml0cy54ZW4ub3JnL29zc3Rlc3Qvb3ZtZi5naXQKPj4gPiBUcmVlOiBx
ZW11IGdpdDovL3hlbmJpdHMueGVuLm9yZy9xZW11LXhlbi10cmFkaXRpb25hbC5naXQKPj4gPiBU
cmVlOiBxZW11dSBnaXQ6Ly94ZW5iaXRzLnhlbi5vcmcvcWVtdS14ZW4uZ2l0Cj4+ID4gVHJlZTog
eGVuIGdpdDovL3hlbmJpdHMueGVuLm9yZy94ZW4uZ2l0Cj4+ID4gCj4+ID4gKioqIEZvdW5kIGFu
ZCByZXByb2R1Y2VkIHByb2JsZW0gY2hhbmdlc2V0ICoqKgo+PiA+IAo+PiA+ICAgQnVnIGlzIGlu
IHRyZWU6ICBsaW51eCAKPiBnaXQ6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5l
bC9naXQvc3RhYmxlL2xpbnV4LXN0YWJsZS5naXQKPj4gPiAgIEJ1ZyBpbnRyb2R1Y2VkOiAgNmIx
YWU1MjdiMWZkZWU4NmU4MWRhMGNiMjZjZWQ3NTczMWM2YzBmYQo+PiA+ICAgQnVnIG5vdCBwcmVz
ZW50OiBiYTY5ODRmYzAxNjJmMjRhNTEwZWJjMzRlODgxYjU0NmI2OWM1NTNiCj4+ID4gICBMYXN0
IGZhaWwgcmVwcm86IGh0dHA6Ly9sb2dzLnRlc3QtbGFiLnhlbnByb2plY3Qub3JnL29zc3Rlc3Qv
bG9ncy8xMzY1NzQvIAo+PiA+IAo+IAo+IAo+IEl0IHNlZW1zIHRoYXQgdGhlcmUgaXMgc29tZXRo
aW5nIHdyb25nIHdpdGggdGhlIElHQiBkcml2ZXIuCgpXaGljaCBpbiB0dXJuIHJlbWluZHMgbWUg
b2YgYSBwYXRjaCBvZiBtaW5lIHRoYXQgd2FzIGJhY2twb3J0ZWQKKGFuZCBzcG90dGVkIGJ5IGFu
IGVhcmxpZXIgYmlzZWN0aW9uKSwgYW5kIHRoYXQgSSd2ZSBzdWdnZXN0ZWQKKHR3aWNlIGFscmVh
ZHkgaWlyYykgd2FzIGVpdGhlciBiYWNrcG9ydGVkIGluIGVycm9yLCBvciB3aXRob3V0IHNvbWUK
ZnVydGhlciBuZWNlc3NhcnkgY2hhbmdlcy4gSWlyYyB0aGUgc3RhYmxlIHRyZWUgbWFpbnRhaW5l
ciBmb3IgdGhhdApicmFuY2ggd2FzIENjLWVkIGJhY2sgdGhlbiwgYW5kIGlmIHNvIEknZCBjb25j
bHVkZSBoZSBkb2Vzbid0IGNhcmUuCgpKYW4KCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3hlbi1kZXZlbA==
