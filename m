Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EAAFDCC6C4
	for <lists+xen-devel@lfdr.de>; Sat,  5 Oct 2019 01:57:40 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iGXPY-0006W9-Hm; Fri, 04 Oct 2019 23:55:00 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=udET=X5=intel.com=chao.gao@srs-us1.protection.inumbo.net>)
 id 1iGXPX-0006W4-NH
 for xen-devel@lists.xenproject.org; Fri, 04 Oct 2019 23:54:59 +0000
X-Inumbo-ID: 5dfe65dc-e702-11e9-8c93-bc764e2007e4
Received: from mga04.intel.com (unknown [192.55.52.120])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5dfe65dc-e702-11e9-8c93-bc764e2007e4;
 Fri, 04 Oct 2019 23:54:57 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 04 Oct 2019 16:54:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.67,258,1566889200"; d="scan'208";a="191735085"
Received: from gao-cwp.sh.intel.com (HELO gao-cwp) ([10.239.159.26])
 by fmsmga008.fm.intel.com with ESMTP; 04 Oct 2019 16:54:54 -0700
Date: Sat, 5 Oct 2019 07:58:57 +0800
From: Chao Gao <chao.gao@intel.com>
To: Roger Pau Monne <roger.pau@citrix.com>
Message-ID: <20191004235855.GA10634@gao-cwp>
References: <20191002104935.60245-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191002104935.60245-1-roger.pau@citrix.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
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
Cc: xen-devel@lists.xenproject.org, "Spassov, Stanislav" <stanspas@amazon.de>,
 Jan Beulich <jbeulich@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gV2VkLCBPY3QgMDIsIDIwMTkgYXQgMTI6NDk6MzVQTSArMDIwMCwgUm9nZXIgUGF1IE1vbm5l
IHdyb3RlOgo+VGhlIGN1cnJlbnQgaW1wbGVtZW50YXRpb24gb2YgaG9zdF9tYXNrYWxsIG1ha2Vz
IGl0IHN0aWNreSBhY3Jvc3MKPmFzc2lnbiBhbmQgZGVhc3NpZ24gY2FsbHMsIHdoaWNoIG1lYW5z
IHRoYXQgb25jZSBhIGd1ZXN0IGZvcmNlcyBYZW4gdG8KPnNldCBob3N0X21hc2thbGwgdGhlIG1h
c2thbGwgYml0IGlzIG5vdCBnb2luZyB0byBiZSBjbGVhcmVkIHVudGlsIGEKPmNhbGwgdG8gUEhZ
U0RFVk9QX3ByZXBhcmVfbXNpeCBpcyBwZXJmb3JtZWQuIFN1Y2ggY2FsbCBob3dldmVyCj5zaG91
bGRuJ3QgYmUgcGFydCBvZiB0aGUgbm9ybWFsIGZsb3cgd2hlbiBkb2luZyBQQ0kgcGFzc3Rocm91
Z2gsIGFuZAo+aGVuY2UgdGhlIGZsYWcgbmVlZHMgdG8gYmUgY2xlYXJlZCB3aGVuIGFzc2lnbmlu
ZyBpbiBvcmRlciB0byBwcmV2ZW50Cj5ob3N0X21hc2thbGwgYmVpbmcgY2FycmllZCBvdmVyIGZy
b20gcHJldmlvdXMgYXNzaWduYXRpb25zLgo+Cj5Ob3RlIHRoYXQgb3RoZXIgbWFzayBmaWVsZHMs
IGxpa2UgZ3Vlc3RfbWFza2VkIG9yIHRoZSBlbnRyeSBtYXNrYml0Cj5hcmUgYWxyZWFkeSByZXNl
dCB3aGVuIHRoZSBtc2l4IGNhcGFiaWxpdHkgaXMgaW5pdGlhbGl6ZWQuIEFsc28gbm90ZQo+dGhh
dCBkb2luZyB0aGUgcmVzZXQgb2YgaG9zdF9tYXNrYWxsIHRoZXJlIHdvdWxkIGFsbG93IHRoZSBn
dWVzdCB0bwo+cmVzZXQgc3VjaCBmaWVsZCBieSBlbmFibGluZyBhbmQgZGlzYWJsaW5nIE1TSVgs
IHdoaWNoIGlzIG5vdAo+aW50ZW5kZWQuCj4KPlNpZ25lZC1vZmYtYnk6IFJvZ2VyIFBhdSBNb25u
w6kgPHJvZ2VyLnBhdUBjaXRyaXguY29tPgo+LS0tCj5DYzogQ2hhbyBHYW8gPGNoYW8uZ2FvQGlu
dGVsLmNvbT4KPkNjOiAiU3Bhc3NvdiwgU3RhbmlzbGF2IiA8c3RhbnNwYXNAYW1hem9uLmRlPgo+
Q2M6IFBhc2kgS8Okcmtrw6RpbmVuIDxwYXNpa0Bpa2kuZmk+Cj4tLS0KPkNoYW8sIFN0YW5pc2xh
diwgY2FuIHlvdSBwbGVhc2UgY2hlY2sgaWYgdGhpcyBwYXRjaCBmaXhlcyB5b3VyCj5pc3N1ZXM/
CgpJIGFtIGdsYWQgdG8uIEZvciB5b3VyIHRlc3RpbmcsIHlvdSBjYW4ganVzdCBraWxsIHFlbXUg
YW5kIGRlc3Ryb3kgdGhlCmd1ZXN0LiBUaGVuIG1hc2thbGwgYml0IG9mIGEgcGFzcy10aHJ1IGRl
dmljZSB3aWxsIGJlIHNldC4gQW5kIGluIHRoaXMKY2FzZSwgdHJ5IHRvIHJlY3JlYXRlIHRoZSBn
dWVzdCBhbmQgY2hlY2sgd2hldGhlciB0aGUgbWFza2FsbCBiaXQgaXMKY2xlYXJlZCBpbiBndWVz
dC4KClRoZSBzb2x1dGlvbiBpcyBzaW1pbGFyIHRvIG15IHYxIFsxXS4gT25lIHF1ZXN0aW9uIElN
TyAoSUlSQywgaXQgaXMgd2h5CkkgY2hhbmdlZCB0byBhbm90aGVyIGFwcHJvYWNoKSBpczogd2h5
IG5vdCBkbyBzdWNoIHJlc2V0IGF0IGRlaXZjZQpkZWFzc2lnbm1lbnQgc3VjaCB0aGF0IGRvbTAg
Y2FuIHVzZSBhIGNsZWFuIGRldmljZS4gT3RoZXJ3aXNlLCB0aGUKZGV2aWNlIHdvbid0IHdvcmsg
YWZ0ZXIgYmVpbmcgdW5ib3VuZCBmcm9tIHBjaWJhY2suIEJ1dCBJIGFtIG5vdCBzbwpzdXJlLCBJ
IGNhbiBjaGVjayBpdCBuZXh0IFR1ZXNkYXkuCgpbMV06IGh0dHBzOi8vbGlzdHMueGVucHJvamVj
dC5vcmcvYXJjaGl2ZXMvaHRtbC94ZW4tZGV2ZWwvMjAxOC0xMS9tc2cwMDg2My5odG1sCgpUaGFu
a3MKQ2hhbwoKPi0tLQo+IHhlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL3BjaS5jIHwgMyArKysKPiAx
IGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspCj4KPmRpZmYgLS1naXQgYS94ZW4vZHJpdmVy
cy9wYXNzdGhyb3VnaC9wY2kuYyBiL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL3BjaS5jCj5pbmRl
eCA3ZGVlZjJmMTJiLi5iNGYxYWMyZGQ5IDEwMDY0NAo+LS0tIGEveGVuL2RyaXZlcnMvcGFzc3Ro
cm91Z2gvcGNpLmMKPisrKyBiL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL3BjaS5jCj5AQCAtMTUw
NCw3ICsxNTA0LDEwIEBAIHN0YXRpYyBpbnQgYXNzaWduX2RldmljZShzdHJ1Y3QgZG9tYWluICpk
LCB1MTYgc2VnLCB1OCBidXMsIHU4IGRldmZuLCB1MzIgZmxhZykKPiAgICAgfQo+IAo+ICAgICBp
ZiAoIHBkZXYtPm1zaXggKQo+KyAgICB7Cj4gICAgICAgICBtc2l4dGJsX2luaXQoZCk7Cj4rICAg
ICAgICBwZGV2LT5tc2l4LT5ob3N0X21hc2thbGwgPSBmYWxzZTsKPisgICAgfQoKSXQgaXMgc2lt
aWxhciB0byBteSB2MSBwYXRjaCBoZXJlLgpbMV06IGh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5v
cmcvYXJjaGl2ZXMvaHRtbC94ZW4tZGV2ZWwvMjAxOC0xMS9tc2cwMDg2My5odG1sCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGlu
ZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnBy
b2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
