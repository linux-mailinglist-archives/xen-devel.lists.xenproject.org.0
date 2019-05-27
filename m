Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 216762AFBA
	for <lists+xen-devel@lfdr.de>; Mon, 27 May 2019 10:06:28 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hVAan-0002X1-S7; Mon, 27 May 2019 08:02:49 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=7auh=T3=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hVAal-0002Ww-Rc
 for xen-devel@lists.xenproject.org; Mon, 27 May 2019 08:02:47 +0000
X-Inumbo-ID: ce172b2e-8055-11e9-a07e-338ef0844f0c
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ce172b2e-8055-11e9-a07e-338ef0844f0c;
 Mon, 27 May 2019 08:02:43 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Mon, 27 May 2019 02:02:42 -0600
Message-Id: <5CEB999F02000078002327BD@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.1 
Date: Mon, 27 May 2019 02:02:39 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "Andrew Cooper" <andrew.cooper3@citrix.com>
References: <5B6BF83602000078001DC548@prv1-mh.provo.novell.com>
 <5C8B7EC0020000780021F10B@prv1-mh.provo.novell.com>
 <5C8B84A8020000780021F23F@prv1-mh.provo.novell.com>
 <bf91ae8b-33f8-ee85-ff39-44e8ccc29f60@citrix.com>
 <5CE792AA0200007800231E09@prv1-mh.provo.novell.com>
 <7c71228d-4b60-73e8-e7a9-98f430c6d8a7@citrix.com>
In-Reply-To: <7c71228d-4b60-73e8-e7a9-98f430c6d8a7@citrix.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: Re: [Xen-devel] [PATCH v8 27/50] x86emul: support AVX512{F,
 ER} reciprocal insns
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
Cc: George Dunlap <George.Dunlap@eu.citrix.com>,
 xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wei.liu2@citrix.com>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Pj4+IE9uIDI0LjA1LjE5IGF0IDIyOjQ4LCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gT24gMjQvMDUvMjAxOSAwNzo0MywgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4+IE9uIDIz
LjA1LjE5IGF0IDE4OjE1LCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3JvdGU6Cj4+PiBP
biAxNS8wMy8yMDE5IDEwOjU1LCBKYW4gQmV1bGljaCB3cm90ZToKPj4+PiBBbHNvIGluY2x1ZGUg
dGhlIG9ubHkgb3RoZXIgQVZYNTEyRVIgaW5zbiBwYWlyLCBWRVhQMlB7RCxTfS4KPj4+Pgo+Pj4+
IE5vdGUgdGhhdCBkZXNwaXRlIHRoZSByZXBsYWNlbWVudCBvZiB0aGUgU0hBIGluc25zJyB0YWJs
ZSBzbG90cyB0aGVyZSdzCj4+Pj4gbm8gbmVlZCB0byBzcGVjaWFsIGNhc2UgdGhlaXIgZGVjb2Rp
bmc6IFRoZWlyIGluc24tc3BlY2lmaWMgY29kZSBhbHJlYWR5Cj4+Pj4gc2V0cyBvcF9ieXRlcyAo
YXMgd2FzIHJlcXVpcmVkIGR1ZSB0byBzaW1kX290aGVyKSwgYW5kIFR3b09wIGlzIG9mIG5vCj4+
Pj4gcmVsZXZhbmNlIGZvciBsZWdhY3kgZW5jb2RlZCBTSU1EIGluc25zLgo+Pj4+Cj4+Pj4gVGhl
IHJhaXNpbmcgb2YgI1VEIHdoZW4gRVZFWC5MJ0wgaXMgMyBmb3IgQVZYNTEyRVIgc2NhbGFyIGlu
c25zIGlzIGRvbmUKPj4+PiB0byBiZSBvbiB0aGUgc2FmZSBzaWRlLiBUaGUgU0RNIGRvZXMgbm90
IGNsYXJpZnkgYmVoYXZpb3IgdGhlcmUsIGFuZAo+Pj4+IGl0J3MgZXZlbiBtb3JlIGFtYmlndW91
cyBoZXJlICh3aXRob3V0IEFWWDUxMlZMIGluIHRoZSBwaWN0dXJlKS4KPj4+Pgo+Pj4+IFNpZ25l
ZC1vZmYtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KPj4+IEFja2VkLWJ5OiBB
bmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPgo+PiBUaGFua3MsIGFsc28g
Zm9yIHRoZSBvdGhlcnMuCj4+Cj4+PiBTZWVpbmcgYXMgSSBoYXZlIHNvbWUgRVIgaGFyZHdhcmUs
IGlzIHRoZXJlIGFuIGVhc3kgd2F5IHRvIGdldAo+Pj4gR0NDL2JpbnV0aWxzIHRvIGVtaXQgYSB3
ZWlyZCBMJ0wgZmllbGQsIG9yIHdpbGwgdGhpcyBpbnZvbHZlIHNvbWUgbWFudWFsCj4+PiBvcGNv
ZGUgZ2VuZXJhdGlvbiB0byB0ZXN0Pwo+PiBnY2MgZG9lcyBub3QgcHJvdmlkZSBhbnkgY29udHJv
bCBhdCBhbGwsIGFmYWljdC4gYmludXRpbHMgYWxsb3dzICJ3ZWlyZCIKPj4gVkVYLkwgb3IgRVZF
WC5MJ0wgb25seSBmb3IgaW5zbnMgaXQgYmVsaWV2ZXMgaWdub3JlIHRoYXQgZmllbGQuIFNvIHll
cywKPj4gSSdtIGFmcmFpZCB0aGlzIHdpbGwgaW52b2x2ZSB1c2luZyAuYnl0ZS4KPiAKPiBPay4g
IEdpdmVuIGEgdGVzdCBwcm9ncmFtIG9mOgo+IAo+IHsKPiBwcmludGYoIlJlYWw6XG4iKTsKPiBh
c20gdm9sYXRpbGUgKCJ2cmNwMTRzZCAleG1tMCwleG1tMCwleG1tMCIpOwo+IAo+IHByaW50Zigi
Qnl0ZXM6XG4iKTsKPiBhc20gdm9sYXRpbGUgKCIuYnl0ZSAweDYyLCAweGYyLCAweGZkLCAweDA4
LCAweDRkLCAweGMwIik7Cj4gCj4gcHJpbnRmKCJCYWQgMHgyODpcbiIpOwo+IGFzbSB2b2xhdGls
ZSAoIi5ieXRlIDB4NjIsIDB4ZjIsIDB4ZmQsIDB4MjgsIDB4NGQsIDB4YzAiKTsKPiAKPiBwcmlu
dGYoIkJhZCAweDQ4OlxuIik7Cj4gYXNtIHZvbGF0aWxlICgiLmJ5dGUgMHg2MiwgMHhmMiwgMHhm
ZCwgMHg0OCwgMHg0ZCwgMHhjMCIpOwo+IAo+IHByaW50ZigiQmFkIDB4Njg6XG4iKTsKPiBhc20g
dm9sYXRpbGUgKCIuYnl0ZSAweDYyLCAweGYyLCAweGZkLCAweDY4LCAweDRkLCAweGMwIik7Cj4g
fQo+IAo+IFRoZW4gdGhlIEwnTCA9IDMgY2FzZSAoMHg2OCBhdCB0aGUgZW5kKSBkb2VzIGluZGVl
ZCB0YWtlICNVRCBmb3IgYm90aAo+IEtOTCBhbmQgS05NLgoKQW5kIGJ5IGltcGxpY2F0aW9uIEkg
dGFrZSBpdCB0aGF0IHRoZSBMJ0w9MSBhbmQgTCdMPTIgY2FzZXMgaW5kZWVkIHRvIG5vdAojVUQg
dGhlcmU/CgpUaGFua3MgZm9yIGhhdmluZyB0cmllZCB0aGlzIG91dCwKSmFuCgoKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5n
IGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJv
amVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
