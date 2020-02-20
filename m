Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 95900165CF6
	for <lists+xen-devel@lfdr.de>; Thu, 20 Feb 2020 12:51:27 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j4kJs-00012K-Lc; Thu, 20 Feb 2020 11:48:40 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=eEsh=4I=xen.org=wl@srs-us1.protection.inumbo.net>)
 id 1j4kJr-00012F-DB
 for xen-devel@lists.xenproject.org; Thu, 20 Feb 2020 11:48:39 +0000
X-Inumbo-ID: ef23ebf4-53d6-11ea-ade5-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ef23ebf4-53d6-11ea-ade5-bc764e2007e4;
 Thu, 20 Feb 2020 11:48:38 +0000 (UTC)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <wl@xen.org>)
 id 1j4kJp-0007M1-PX; Thu, 20 Feb 2020 11:48:37 +0000
Received: from 41.142.6.51.dyn.plus.net ([51.6.142.41] helo=debian)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <wl@xen.org>)
 id 1j4kJp-0008MQ-GP; Thu, 20 Feb 2020 11:48:37 +0000
Date: Thu, 20 Feb 2020 11:48:34 +0000
From: Wei Liu <wl@xen.org>
To: Jan Beulich <jbeulich@suse.com>
Message-ID: <20200220114834.vmzvxy4um4huugxg@debian>
References: <b5d94bd8-9a39-c88b-4c3c-f89e655f3abf@suse.com>
 <2a9a998e-f2d0-3c07-e85e-7fdda18b506e@suse.com>
 <20200220114331.m6yolb4hoyfvfmsa@debian>
 <3d9584c2-9c7f-f3e5-283c-c80bb9bebd73@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <3d9584c2-9c7f-f3e5-283c-c80bb9bebd73@suse.com>
User-Agent: NeoMutt/20180716
Subject: Re: [Xen-devel] [PATCH 5/5] libxl/PCI: align reserved device memory
 boundary for HAP guests
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
Cc: Anthony Perard <anthony.perard@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVGh1LCBGZWIgMjAsIDIwMjAgYXQgMTI6NDU6NTRQTSArMDEwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gT24gMjAuMDIuMjAyMCAxMjo0MywgV2VpIExpdSB3cm90ZToKPiA+IE9uIFR1ZSwgRmVi
IDE4LCAyMDIwIGF0IDA0OjQ3OjQ5UE0gKzAxMDAsIEphbiBCZXVsaWNoIHdyb3RlOgo+ID4+IEFz
IHRoZSBjb2RlIGNvbW1lbnQgc2F5cywgdGhpcyB3aWxsIGFsbG93IHVzZSBvZiBhIDJNYiBzdXBl
ciBwYWdlCj4gPj4gbWFwcGluZyBhdCB0aGUgZW5kIG9mICJsb3ciIG1lbW9yeS4KPiA+Pgo+ID4+
IFNpZ25lZC1vZmYtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KPiA+Pgo+ID4+
IC0tLSBhL3Rvb2xzL2xpYnhsL2xpYnhsX2RtLmMKPiA+PiArKysgYi90b29scy9saWJ4bC9saWJ4
bF9kbS5jCj4gPj4gQEAgLTU2Myw2ICs1NjMsMTMgQEAgaW50IGxpYnhsX19kb21haW5fZGV2aWNl
X2NvbnN0cnVjdF9yZG0obAo+ID4+ICAgICAgICAgIC8qIEp1c3QgY2hlY2sgaWYgUkRNID4gb3Vy
IG1lbW9yeSBib3VuZGFyeS4gKi8KPiA+PiAgICAgICAgICBpZiAocmRtX3N0YXJ0ID4gcmRtX21l
bV9ib3VuZGFyeSkgewo+ID4+ICAgICAgICAgICAgICAvKgo+ID4+ICsgICAgICAgICAgICAgKiBG
b3IgSEFQIGd1ZXN0cyByb3VuZCBkb3duIHRvIGEgMk1iIGJvdW5kYXJ5IHRvIGFsbG93IHVzZQo+
ID4+ICsgICAgICAgICAgICAgKiBvZiBsYXJnZSBwYWdlIG1hcHBpbmdzLgo+ID4+ICsgICAgICAg
ICAgICAgKi8KPiA+PiArICAgICAgICAgICAgaWYgKGxpYnhsX2RlZmJvb2xfdmFsKGRfY29uZmln
LT5jX2luZm8uaGFwKQo+ID4+ICsgICAgICAgICAgICAgICAgJiYgcmRtX3N0YXJ0ID4gMHgyMDAw
MDApCj4gPiAKPiA+IFBsZWFzZSB1c2UgTUIoMikgaGVyZS4KPiAKPiBXaWxsIGRvLCBidXQgdGhl
biB3aGF0IGFib3V0IHRoZSB+MHgxZmZmZmYgb24gdGhlIG5leHQgbGluZT8gU2hvdWxkCj4gdGhp
cyBiZWNvbWUgfihNQigyKSAtIDEpPwoKWWVzIHRoYXQgd291bGQgYmUgZ29vZCB0b28uCgpXZWku
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2
ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xp
c3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
