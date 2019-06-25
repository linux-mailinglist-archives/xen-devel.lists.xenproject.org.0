Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 676F055154
	for <lists+xen-devel@lfdr.de>; Tue, 25 Jun 2019 16:15:03 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hfmBj-0000OF-Hx; Tue, 25 Jun 2019 14:12:47 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=XKpQ=UY=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1hfmBh-0000O8-Ky
 for xen-devel@lists.xenproject.org; Tue, 25 Jun 2019 14:12:45 +0000
X-Inumbo-ID: 4b498042-9753-11e9-aef3-2b20faac2625
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 4b498042-9753-11e9-aef3-2b20faac2625;
 Tue, 25 Jun 2019 14:12:42 +0000 (UTC)
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ian.jackson@citrix.com;
 spf=Pass smtp.mailfrom=Ian.Jackson@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ian.jackson@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="ian.jackson@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa6.hc3370-68.iphmx.com: domain of
 Ian.Jackson@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="Ian.Jackson@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: HeRRVuvDHb2eZ6s673h1VVCI8I9javO7W48KlKhR3kmlS3kxWvXrxE6y9g34JRahnNmJcjYWKk
 9OQNtQ6KxcmdfjBOeo+9NEbvQrKc+8zR6GuIPd99sizk0+MF8tsbediYo3QQX0sGI8CEIy2eIp
 9Vc2BJNiAHmMX2oDtSc0zK3t0crRiyrigZUC0Rzz0SMxAfb1lSGttEr3hVdBoBHLQYVNi9MScG
 mdIarJnHPky0cfPNNh0BZJyZg1rnmye1mdcFQyVVCfQXzrOwe8MmthbOMcNywGDVkijnREgSDj
 CRs=
X-SBRS: 2.7
X-MesageID: 2201566
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.63,416,1557201600"; 
   d="scan'208";a="2201566"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Message-ID: <23826.11187.707446.188402@mariner.uk.xensource.com>
Date: Tue, 25 Jun 2019 15:12:03 +0100
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Jan
 Beulich" <jbeulich@suse.com>
In-Reply-To: <23825.64696.25926.318881@mariner.uk.xensource.com>
References: <osstest-138333-mainreport@xen.org>
 <23824.55987.139222.778619@mariner.uk.xensource.com>
 <23824.56091.124052.340656@mariner.uk.xensource.com>
 <23824.56583.488225.205300@mariner.uk.xensource.com>
 <23825.64696.25926.318881@mariner.uk.xensource.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
Subject: Re: [Xen-devel] [xen-4.6-testing test] 138333: regressions - FAIL
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SWFuIEphY2tzb24gd3JpdGVzICgiUmU6IFt4ZW4tNC42LXRlc3RpbmcgdGVzdF0gMTM4MzMzOiBy
ZWdyZXNzaW9ucyAtIEZBSUwiKToKPiBJYW4gSmFja3NvbiB3cml0ZXMgKCJSZTogW3hlbi00LjYt
dGVzdGluZyB0ZXN0XSAxMzgzMzM6IHJlZ3Jlc3Npb25zIC0gRkFJTCIpOgo+ID4gSWFuIEphY2tz
b24gd3JpdGVzICgiUmU6IFt4ZW4tNC42LXRlc3RpbmcgdGVzdF0gMTM4MzMzOiByZWdyZXNzaW9u
cyAtIEZBSUwiKToKPiA+ID4gSWFuIEphY2tzb24gd3JpdGVzICgiUmU6IFt4ZW4tNC42LXRlc3Rp
bmcgdGVzdF0gMTM4MzMzOiByZWdyZXNzaW9ucyAtIEZBSUwiKToKPiA+ID4gPiBUaGVzZSBhbGwg
aGF2ZSBgcWVtdXQnIGluIGNvbW1vbi4KPiAuLi4KPiA+IEknbSB0cnlpbmcgYSB0ZXN0IHdpdGgg
NC43J3MgdmVyc2lvbiBvZiBxZW11IHRyYWQuCj4gCj4gVGhpcyBkb2VzIG5vdCB3b3JrLiAgNC43
J3MgcWVtdSB0cmFkIGRvZXNuJ3QgYnVpbGQgYmVjYXVzZSBvZiB0b29scwo+IGxpYnJhcnkgcmVv
cmdhbmlzYXRpb24uICBSZXZlcnRpbmcgdGhvc2UgY2hhbmdlcyB0byA0LjcgcHJvZHVjZXMgYQo+
IHFlbXUgdHJhZCB0aGF0IGlzIGlkZW50aWNhbCB0byA0LjYncy4gIFNvIHRoZSByZWdyZXNzaW9u
IGlzIG5vdCBpbgo+IHFlbXUuCj4gCj4gSSBzdXNwZWN0IGEgZmlybXdhcmUgb3IgaHZtbG9hZGVy
IHByb2JsZW0uCj4gCj4gVGhpcyBpcyBibG9ja2luZyB1cyBnZXR0aW5nIGEgcHVzaCBmb3IgdGhl
IFhlbiA0Ljggc3RhYmxlIGJyYW5jaGVzOgoKVGhlc2UgaGF2ZSBub3QgaGFkIGEgcHVzaCBmb3Is
IGluIHRoZSBjYXNlIG9mIDQuOSwgMTMzIGRheXMuCgpVbmxlc3Mgc29tZW9uZSBleHBsYWlucyB0
byBtZSBhIHBsYW4gZm9yIGhvdyB0byBnZXQgNC42IHRvIGFjdHVhbGx5CndvcmsgYWdhaW4gd2Vs
bCBlbm91Z2ggdG8gdGVzdCA0LjcsIG9yIHNvbWUgb3RoZXIgYmV0dGVyIHByb3Bvc2FsLCBJCmlu
dGVuZCB0byBmb3JjZSBwdXNoIDQuNiBhdCB0aGUgZW5kIG9mIHRoaXMgd2Vlay4KCklmLCBhcyBl
eHBlY3RlZCwgdGhpcyBjYXVzZXMgNC43IHRvIHdvcmsgZXhjZXB0IGZvciBzb21lIG9yIGFsbCBv
ZiB0aGUKNC42LT40LjcgbWlncmF0aW9uIHRlc3RzLCBJIHdpbGwgZm9yY2UgcHVzaCA0LjcgdG9v
LgoKSWFuLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
WGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0
cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
