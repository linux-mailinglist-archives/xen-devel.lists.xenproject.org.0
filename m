Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B21B776EF5
	for <lists+xen-devel@lfdr.de>; Fri, 26 Jul 2019 18:23:35 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hr2x2-0006sq-Pj; Fri, 26 Jul 2019 16:20:12 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=tvJk=VX=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1hr2x1-0006sk-05
 for xen-devel@lists.xenproject.org; Fri, 26 Jul 2019 16:20:11 +0000
X-Inumbo-ID: 39f8e9be-afc1-11e9-a54e-e7514db7ed0c
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 39f8e9be-afc1-11e9-a54e-e7514db7ed0c;
 Fri, 26 Jul 2019 16:20:05 +0000 (UTC)
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=anthony.perard@citrix.com;
 spf=Pass smtp.mailfrom=anthony.perard@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 anthony.perard@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa1.hc3370-68.iphmx.com: domain of
 anthony.perard@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: flWM2GWHFJxmSEsfl855GW1vpUkwimeN6VfV1owtpLhdA3tyVE8NL24FhM05tj0bF6YcZZ6Ezw
 SDTNnha59NuoryWqhrODOUOFJU4ojcvNzibyQgpK/aNWfUUmu74uxTp9GX8LPHqK7LvVB04O9j
 cbMFP9b9EYP3/J2p5qZ1CBh/6lPRJh1GEZUnIjnhmDgRUdkjLPwV9VQXVdkIEucyvh/zvcm/J6
 XCEY/8URxw/bSkmHwCbLmVSeLsT6UOWRtf5rZynZiBIZPeqxm4Y+gNdIKDav24azgN2sEGb0k4
 r04=
X-SBRS: 2.7
X-MesageID: 3523407
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,311,1559534400"; 
   d="scan'208";a="3523407"
Date: Fri, 26 Jul 2019 17:19:51 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Zhang Chen <chen.zhang@intel.com>
Message-ID: <20190726161951.GH1242@perard.uk.xensource.com>
References: <20190726154340.2950-1-chen.zhang@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190726154340.2950-1-chen.zhang@intel.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Subject: Re: [Xen-devel] [PATCH V3] tools/libxl: Add iothread support for
 COLO
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

T24gRnJpLCBKdWwgMjYsIDIwMTkgYXQgMTE6NDM6NDBQTSArMDgwMCwgWmhhbmcgQ2hlbiB3cm90
ZToKPiBGcm9tOiBaaGFuZyBDaGVuIDxjaGVuLnpoYW5nQGludGVsLmNvbT4KPiAKPiBYZW4gQ09M
TyBhbmQgS1ZNIENPTE8gc2hhcmVkIGxvdHMgb2YgY29kZSBpbiBRZW11Lgo+IFRoZSBjb2xvLWNv
bXBhcmUgb2JqZWN0IGluIFFlbXUgbm93IHJlcXVpcmVzIGFuICdpb3RocmVhZCcgcHJvcGVydHkg
c2luY2UgUUVNVSAyLjExLgo+IAo+IERldGFpbDoKPiBodHRwczovL3dpa2kucWVtdS5vcmcvRmVh
dHVyZXMvQ09MTwo+IAo+IFNpZ25lZC1vZmYtYnk6IFpoYW5nIENoZW4gPGNoZW4uemhhbmdAaW50
ZWwuY29tPgo+IC0tLQo+ICB0b29scy9saWJ4bC9saWJ4bF9kbS5jIHwgNSArKysrLQo+ICAxIGZp
bGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCj4gCj4gZGlmZiAtLWdp
dCBhL3Rvb2xzL2xpYnhsL2xpYnhsX2RtLmMgYi90b29scy9saWJ4bC9saWJ4bF9kbS5jCj4gaW5k
ZXggZjRmYzk2NDE1ZC4uNGIwMjlkNmM4ZSAxMDA2NDQKPiAtLS0gYS90b29scy9saWJ4bC9saWJ4
bF9kbS5jCj4gKysrIGIvdG9vbHMvbGlieGwvbGlieGxfZG0uYwo+IEBAIC0xNjM1LDcgKzE2MzUs
MTAgQEAgc3RhdGljIGludCBsaWJ4bF9fYnVpbGRfZGV2aWNlX21vZGVsX2FyZ3NfbmV3KGxpYnhs
X19nYyAqZ2MsCj4gICAgICAgICAgICAgICAgICAgICAgICAgIG5pY3NbaV0uY29sb19jb21wYXJl
X25vdGlmeV9kZXYpIHsKPiAgICAgICAgICAgICAgICAgICAgICAgICAgZmxleGFycmF5X2FwcGVu
ZChkbV9hcmdzLCAiLW9iamVjdCIpOwo+ICAgICAgICAgICAgICAgICAgICAgICAgICBmbGV4YXJy
YXlfYXBwZW5kKGRtX2FyZ3MsCj4gLSAgICAgICAgICAgICAgICAgICAgICAgICAgIEdDU1BSSU5U
RigiY29sby1jb21wYXJlLGlkPWMxLHByaW1hcnlfaW49JXMsc2Vjb25kYXJ5X2luPSVzLG91dGRl
dj0lcyxub3RpZnlfZGV2PSVzIiwKPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgR0NTUFJJ
TlRGKCJpb3RocmVhZCxpZD1jb2xvLWNvbXBhcmUtaW90aHJlYWQtMSIpKTsKCllvdSBkb24ndCBu
ZWVkIEdDU1BSSU5URiBoZXJlIGFueW1vcmUgOy0pLCBpbiBmYWN0LCBpdCBkb2Vzbid0IGJ1aWxk
IHdpdGgKaXQuIFdpdGggdGhhdCBmaXg6ClJldmlld2VkLWJ5OiBBbnRob255IFBFUkFSRCA8YW50
aG9ueS5wZXJhcmRAY2l0cml4LmNvbT4KClRoYW5rcywKCi0tIApBbnRob255IFBFUkFSRAoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1h
aWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54
ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
