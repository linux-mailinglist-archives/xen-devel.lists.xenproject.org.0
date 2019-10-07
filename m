Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E083CDC86
	for <lists+xen-devel@lfdr.de>; Mon,  7 Oct 2019 09:43:55 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iHNba-0006rh-Do; Mon, 07 Oct 2019 07:38:54 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=C2cV=YA=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iHNbZ-0006rc-5f
 for xen-devel@lists.xenproject.org; Mon, 07 Oct 2019 07:38:53 +0000
X-Inumbo-ID: 81555fc0-e8d5-11e9-97a6-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 81555fc0-e8d5-11e9-97a6-12813bfff9fa;
 Mon, 07 Oct 2019 07:38:51 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 29BD3AFB7;
 Mon,  7 Oct 2019 07:38:50 +0000 (UTC)
To: Chao Gao <chao.gao@intel.com>
References: <20191002104935.60245-1-roger.pau@citrix.com>
 <20191004235855.GA10634@gao-cwp>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <e31ebe3d-3aa8-dafd-1104-54fcaf1a4896@suse.com>
Date: Mon, 7 Oct 2019 09:38:48 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191004235855.GA10634@gao-cwp>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] pci: clear host_maskall field on assign
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
Cc: xen-devel@lists.xenproject.org, Stanislav Spassov <stanspas@amazon.de>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDUuMTAuMjAxOSAwMTo1OCwgQ2hhbyBHYW8gd3JvdGU6Cj4gT24gV2VkLCBPY3QgMDIsIDIw
MTkgYXQgMTI6NDk6MzVQTSArMDIwMCwgUm9nZXIgUGF1IE1vbm5lIHdyb3RlOgo+PiBUaGUgY3Vy
cmVudCBpbXBsZW1lbnRhdGlvbiBvZiBob3N0X21hc2thbGwgbWFrZXMgaXQgc3RpY2t5IGFjcm9z
cwo+PiBhc3NpZ24gYW5kIGRlYXNzaWduIGNhbGxzLCB3aGljaCBtZWFucyB0aGF0IG9uY2UgYSBn
dWVzdCBmb3JjZXMgWGVuIHRvCj4+IHNldCBob3N0X21hc2thbGwgdGhlIG1hc2thbGwgYml0IGlz
IG5vdCBnb2luZyB0byBiZSBjbGVhcmVkIHVudGlsIGEKPj4gY2FsbCB0byBQSFlTREVWT1BfcHJl
cGFyZV9tc2l4IGlzIHBlcmZvcm1lZC4gU3VjaCBjYWxsIGhvd2V2ZXIKPj4gc2hvdWxkbid0IGJl
IHBhcnQgb2YgdGhlIG5vcm1hbCBmbG93IHdoZW4gZG9pbmcgUENJIHBhc3N0aHJvdWdoLCBhbmQK
Pj4gaGVuY2UgdGhlIGZsYWcgbmVlZHMgdG8gYmUgY2xlYXJlZCB3aGVuIGFzc2lnbmluZyBpbiBv
cmRlciB0byBwcmV2ZW50Cj4+IGhvc3RfbWFza2FsbCBiZWluZyBjYXJyaWVkIG92ZXIgZnJvbSBw
cmV2aW91cyBhc3NpZ25hdGlvbnMuCj4+Cj4+IE5vdGUgdGhhdCBvdGhlciBtYXNrIGZpZWxkcywg
bGlrZSBndWVzdF9tYXNrZWQgb3IgdGhlIGVudHJ5IG1hc2tiaXQKPj4gYXJlIGFscmVhZHkgcmVz
ZXQgd2hlbiB0aGUgbXNpeCBjYXBhYmlsaXR5IGlzIGluaXRpYWxpemVkLiBBbHNvIG5vdGUKPj4g
dGhhdCBkb2luZyB0aGUgcmVzZXQgb2YgaG9zdF9tYXNrYWxsIHRoZXJlIHdvdWxkIGFsbG93IHRo
ZSBndWVzdCB0bwo+PiByZXNldCBzdWNoIGZpZWxkIGJ5IGVuYWJsaW5nIGFuZCBkaXNhYmxpbmcg
TVNJWCwgd2hpY2ggaXMgbm90Cj4+IGludGVuZGVkLgo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBSb2dl
ciBQYXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT4KPj4gLS0tCj4+IENjOiBDaGFvIEdh
byA8Y2hhby5nYW9AaW50ZWwuY29tPgo+PiBDYzogIlNwYXNzb3YsIFN0YW5pc2xhdiIgPHN0YW5z
cGFzQGFtYXpvbi5kZT4KPj4gQ2M6IFBhc2kgS8Okcmtrw6RpbmVuIDxwYXNpa0Bpa2kuZmk+Cj4+
IC0tLQo+PiBDaGFvLCBTdGFuaXNsYXYsIGNhbiB5b3UgcGxlYXNlIGNoZWNrIGlmIHRoaXMgcGF0
Y2ggZml4ZXMgeW91cgo+PiBpc3N1ZXM/Cj4gCj4gSSBhbSBnbGFkIHRvLiBGb3IgeW91ciB0ZXN0
aW5nLCB5b3UgY2FuIGp1c3Qga2lsbCBxZW11IGFuZCBkZXN0cm95IHRoZQo+IGd1ZXN0LiBUaGVu
IG1hc2thbGwgYml0IG9mIGEgcGFzcy10aHJ1IGRldmljZSB3aWxsIGJlIHNldC4gQW5kIGluIHRo
aXMKPiBjYXNlLCB0cnkgdG8gcmVjcmVhdGUgdGhlIGd1ZXN0IGFuZCBjaGVjayB3aGV0aGVyIHRo
ZSBtYXNrYWxsIGJpdCBpcwo+IGNsZWFyZWQgaW4gZ3Vlc3QuCj4gCj4gVGhlIHNvbHV0aW9uIGlz
IHNpbWlsYXIgdG8gbXkgdjEgWzFdLiBPbmUgcXVlc3Rpb24gSU1PIChJSVJDLCBpdCBpcyB3aHkK
PiBJIGNoYW5nZWQgdG8gYW5vdGhlciBhcHByb2FjaCkgaXM6IHdoeSBub3QgZG8gc3VjaCByZXNl
dCBhdCBkZWl2Y2UKPiBkZWFzc2lnbm1lbnQgc3VjaCB0aGF0IGRvbTAgY2FuIHVzZSBhIGNsZWFu
IGRldmljZS4gT3RoZXJ3aXNlLCB0aGUKPiBkZXZpY2Ugd29uJ3Qgd29yayBhZnRlciBiZWluZyB1
bmJvdW5kIGZyb20gcGNpYmFjay4gQnV0IEkgYW0gbm90IHNvCj4gc3VyZSwgSSBjYW4gY2hlY2sg
aXQgbmV4dCBUdWVzZGF5LgoKSSB0b28gZGlkIHRoaW5rIGFib3V0IHRoaXMsIGJ1dCBhaXVpIHBj
aWJhY2sgbmVlZHMgdG8gaXNzdWUKUEhZU0RFVk9QX3JlbGVhc2VfbXNpeCBhbnl3YXksIGFuZCBE
b20wIHdvdWxkIHRoZW4gcmUtc2V0dXAgTVNJLVgKImZyb20gc2NyYXRjaCIsIGkuZS4gd2UnZCBj
bGVhciB0aGUgZmxhZyBhbnl3YXkgaW4KbXNpeF9jYXBhYmlsaXR5X2luaXQoKSBkdWUgdG8gbXNp
eC0+dXNlZF9lbnRyaWVzIGJlaW5nIHplcm8gYXQKdGhlIGZpcnN0IChvZiBwb3NzaWJseSBzZXZl
cmFsKSBpbnZvY2F0aW9uKHMpLgoKSmFuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVs
