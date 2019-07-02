Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B29B55CEF2
	for <lists+xen-devel@lfdr.de>; Tue,  2 Jul 2019 13:57:30 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hiHKe-0001vq-Ol; Tue, 02 Jul 2019 11:52:20 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ftjz=U7=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1hiHKd-0001vl-2T
 for xen-devel@lists.xenproject.org; Tue, 02 Jul 2019 11:52:19 +0000
X-Inumbo-ID: d6ee2dc0-9cbf-11e9-8980-bc764e045a96
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id d6ee2dc0-9cbf-11e9-8980-bc764e045a96;
 Tue, 02 Jul 2019 11:52:17 +0000 (UTC)
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=anthony.perard@citrix.com;
 spf=Pass smtp.mailfrom=anthony.perard@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 anthony.perard@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 anthony.perard@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: dH0aqJmgDHUpaWVVGJMoqbF2o3HzRU1iqstmAbeLwbYRozuqfuBe182YrIB5YpOK+w9vnS50zu
 aEzBTOOzMnZBvXEYcF0VK661v83+HxAkeVRzvLymMqsuRlz4SfmXAuXC5qQLGkHMwmbDKr8mK6
 xhQ324LXDIzU04B+RbkDK+CKOrpYMU7P6xxaSIqWZL2NC+QkCAbdfQJE/QZ08eb9gqa1rmR82y
 Lip6un/QW+U7ZhHldpuxw4DGmvtd6i5FS5Gj1rHlx10jLSolp5MMFWZ+2E6aN1CHM3uz3B4zc3
 JCg=
X-SBRS: 2.7
X-MesageID: 2485648
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.63,443,1557201600"; 
   d="scan'208";a="2485648"
Date: Tue, 2 Jul 2019 12:52:14 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Zhang Chen <chen.zhang@intel.com>
Message-ID: <20190702115214.GA22182@perard.uk.xensource.com>
References: <20190610083336.18235-1-chen.zhang@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190610083336.18235-1-chen.zhang@intel.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Subject: Re: [Xen-devel] [PATCH] tools/libxl: Add iothread support for COLO
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
Cc: xen-devel@lists.xenproject.org, Ian Jackson <ian.jackson@eu.citrix.com>,
 Wei Liu <wl@xen.org>, Zhang Chen <zhangckid@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGksCgpUaGFua3MgZm9yIHRoZSBwYXRjaCwgSSd2ZSBnb3QgcGxlbnR5IG9mIHF1ZXN0aW9uLgoK
T24gTW9uLCBKdW4gMTAsIDIwMTkgYXQgMDQ6MzM6MzZQTSArMDgwMCwgWmhhbmcgQ2hlbiB3cm90
ZToKPiBGcm9tOiBaaGFuZyBDaGVuIDxjaGVuLnpoYW5nQGludGVsLmNvbT4KPiAKPiBYZW4gQ09M
TyBhbmQgS1ZNIENPTE8gc2hhcmVkIGxvdHMgb2YgY29kZSBpbiBRZW11Lgo+IEtWTSBDT0xPIGhh
cyBhZGRlZCB0aGUgaW90aHJlYWQgc3VwcG9ydCwgc28gd2UgYWRkIGl0IG9uIFhlbi4KPiAKPiBE
ZXRhaWw6Cj4gaHR0cHM6Ly93aWtpLnFlbXUub3JnL0ZlYXR1cmVzL0NPTE8KPiAKPiBTaWduZWQt
b2ZmLWJ5OiBaaGFuZyBDaGVuIDxjaGVuLnpoYW5nQGludGVsLmNvbT4KPiAtLS0KPiAgdG9vbHMv
bGlieGwvbGlieGxfZG0uYyAgICAgIHwgMTQgKysrKysrKysrKystLS0KPiAgdG9vbHMvbGlieGwv
bGlieGxfdHlwZXMuaWRsIHwgIDIgKysKPiAgdG9vbHMveGwveGxfcGFyc2UuYyAgICAgICAgIHwg
IDQgKysrKwo+ICAzIGZpbGVzIGNoYW5nZWQsIDE3IGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25z
KC0pCj4gCj4gZGlmZiAtLWdpdCBhL3Rvb2xzL2xpYnhsL2xpYnhsX2RtLmMgYi90b29scy9saWJ4
bC9saWJ4bF9kbS5jCj4gaW5kZXggZjRmYzk2NDE1ZC4uNmJiNDAwZWZkZiAxMDA2NDQKPiAtLS0g
YS90b29scy9saWJ4bC9saWJ4bF9kbS5jCj4gKysrIGIvdG9vbHMvbGlieGwvbGlieGxfZG0uYwo+
IEBAIC0xNjI5LDE3ICsxNjI5LDI1IEBAIHN0YXRpYyBpbnQgbGlieGxfX2J1aWxkX2RldmljZV9t
b2RlbF9hcmdzX25ldyhsaWJ4bF9fZ2MgKmdjLAo+ICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgbmljc1tpXS5jb2xvX2ZpbHRlcl9yZWRpcmVjdG9yMV9xdWV1ZSwKPiAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIG5pY3NbaV0uY29sb19maWx0ZXJfcmVk
aXJlY3RvcjFfb3V0ZGV2KSk7Cj4gICAgICAgICAgICAgICAgICAgICAgfQo+ICsgICAgICAgICAg
ICAgICAgICAgIGlmIChuaWNzW2ldLmNvbG9faW90aHJlYWQpIHsKPiArICAgICAgICAgICAgICAg
ICAgICAgICAgZmxleGFycmF5X2FwcGVuZChkbV9hcmdzLCAiLW9iamVjdCIpOwo+ICsgICAgICAg
ICAgICAgICAgICAgICAgICBmbGV4YXJyYXlfYXBwZW5kKGRtX2FyZ3MsCj4gKyAgICAgICAgICAg
ICAgICAgICAgICAgICAgIEdDU1BSSU5URigiaW90aHJlYWQsaWQ9JXMiLAo+ICsgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgbmljc1tpXS5jb2xvX2lvdGhyZWFkKSk7CgpUaGlz
IGNyZWF0ZXMgYW4gaW90aHJlYWQgb2JqZWN0LCBidXQgaXQgaXNuJ3QgdXNlZCBhbnl3aGVyZS4g
V2hhdCB0aGUKcHVycG9zZSBvZiBpdD8KQWxzbywgaW90aHJlYWRzIGhhdmUgb3B0aW9ucyBsaWtl
ICJwb2xsLWdyb3ciLCBJIGRvbid0IGtub3cgaWYgeW91IHdhbnQKdG8gaGF2ZSB0aGF0IGNvbmZp
Z3VyYWJsZSBvciBqdXN0IGtlZXAgdGhlIGRlZmF1bHQgdmFsdWVzLCBqdXN0CnNvbWV0aGluZyB0
byBrZWVwIGluIG1pbmQuCgo+ICsgICAgICAgICAgICAgICAgICAgIH0KPiAgICAgICAgICAgICAg
ICAgICAgICBpZiAobmljc1tpXS5jb2xvX2NvbXBhcmVfcHJpX2luICYmCj4gICAgICAgICAgICAg
ICAgICAgICAgICAgIG5pY3NbaV0uY29sb19jb21wYXJlX3NlY19pbiAmJgo+ICAgICAgICAgICAg
ICAgICAgICAgICAgICBuaWNzW2ldLmNvbG9fY29tcGFyZV9vdXQgJiYKPiAtICAgICAgICAgICAg
ICAgICAgICAgICAgbmljc1tpXS5jb2xvX2NvbXBhcmVfbm90aWZ5X2Rldikgewo+ICsgICAgICAg
ICAgICAgICAgICAgICAgICBuaWNzW2ldLmNvbG9fY29tcGFyZV9ub3RpZnlfZGV2ICYmCj4gKyAg
ICAgICAgICAgICAgICAgICAgICAgIG5pY3NbaV0uY29sb19jb21wYXJlX2lvdGhyZWFkKSB7Cj4g
ICAgICAgICAgICAgICAgICAgICAgICAgIGZsZXhhcnJheV9hcHBlbmQoZG1fYXJncywgIi1vYmpl
Y3QiKTsKPiAgICAgICAgICAgICAgICAgICAgICAgICAgZmxleGFycmF5X2FwcGVuZChkbV9hcmdz
LAo+IC0gICAgICAgICAgICAgICAgICAgICAgICAgICBHQ1NQUklOVEYoImNvbG8tY29tcGFyZSxp
ZD1jMSxwcmltYXJ5X2luPSVzLHNlY29uZGFyeV9pbj0lcyxvdXRkZXY9JXMsbm90aWZ5X2Rldj0l
cyIsCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgIEdDU1BSSU5URigiY29sby1jb21wYXJl
LGlkPWMxLHByaW1hcnlfaW49JXMsc2Vjb25kYXJ5X2luPSVzLG91dGRldj0lcyxub3RpZnlfZGV2
PSVzLGlvdGhyZWFkPSVzIiwKClNvLCBub3cgaW90aHJlYWQgYXJlIG1hbmRhdG9yeT8gSXQgd291
bGQgYWxzbyBtZWFuIHRoYXQgbGlieGwgY2Fubid0IHVzZQpRRU1VIG9sZGVyIHRoYXQgMi4xMSwg
SSB0aGluay4KQ2FuJ3QgUUVNVSBjcmVhdGVzIGFuIGlvdGhyZWFkIGF1dG9tYXRpY2FsbHkgaWYg
bm9uZSBhcmUgcHJvdmlkZWQ/CgpBbHNvLCBpdCBsb29rcyBsaWtlIHRoYXQgaWYgb25lIG9mIHRo
ZSBjb2xvLWNvbXBhcmUgb3B0aW9uIGlzIG1pc3NpbmcsCnRoZSBjb2xvLWNvbXBhcmUgb2JqZWN0
IGlzbid0IGNyZWF0ZWQgYXQgYWxsIHdpdGggbm8gd2FybmluZyBmb3IgdGhlCnVzZXJzIG9mIGxp
YnhsLgoKV2hhdCdzIHRoZSBkaWZmZXJlbmNlIGJldHdlZW4gYGNvbG9faW90aHJlYWQnIGFuZApg
Y29sb19jb21wYXJlX2lvdGhyZWFkJyA/CgpJZiBhIHVzZXIgb25seSBhcyB0aGUgY2hvaWNlIG9m
IGEgaW90aHJlYWQgaWQsIHdoeSBub3QgaGF2ZSBsaWJ4bCBjcmVhdGUKb25lIG9uIGl0cyBvd24g
aW5zdGVhZD8KClRoYW5rcywKCi0tIApBbnRob255IFBFUkFSRAoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
