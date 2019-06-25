Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BD04C550AE
	for <lists+xen-devel@lfdr.de>; Tue, 25 Jun 2019 15:45:23 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hfljG-0006EW-VX; Tue, 25 Jun 2019 13:43:22 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ez/b=UY=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1hfljF-0006EP-OG
 for xen-devel@lists.xenproject.org; Tue, 25 Jun 2019 13:43:21 +0000
X-Inumbo-ID: 31821d5b-974f-11e9-8980-bc764e045a96
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 31821d5b-974f-11e9-8980-bc764e045a96;
 Tue, 25 Jun 2019 13:43:20 +0000 (UTC)
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: PK1TQNNxnszYFP8+S5Zb3hjBuZc516pjTawdE3FikRQci84SK6LmDyEtLiJV3xywNcr+uUD5Sj
 Goc4t8Onp2jV07WCJQRgDnHSV3siQECSsffjQpFt2fSEn2Z2hfgFyXjYZ7i0d8jUmIq7P59mFE
 td4QX624ap1Lrwa5clygIMQqAgMYuvO5Z0DgBWE2xftrP/oJw7NtopPlxDVh9dsT3L2hdcDbsf
 Cjq9fCW2WIr6GQEkOs4H6lYVJdlmpXyTj5LuKVlmwVrxfNz5X2hs14yCfAiP9nHeEF7hs10iEc
 Xj4=
X-SBRS: 2.7
X-MesageID: 2184413
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.63,416,1557201600"; 
   d="scan'208";a="2184413"
Date: Tue, 25 Jun 2019 15:43:13 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <20190625134313.ewr5bgca2kwan7je@MacBook-Air-de-Roger.local>
References: <20190625133944.36588-1-roger.pau@citrix.com>
 <bb5538bd-1f80-0455-3b57-1c98cd7be523@citrix.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <bb5538bd-1f80-0455-3b57-1c98cd7be523@citrix.com>
User-Agent: NeoMutt/20180716
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH] config: don't hardcode toolchain binaries
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, Konrad
 Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Julien Grall <julien.grall@arm.com>,
 Jan Beulich <jbeulich@suse.com>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVHVlLCBKdW4gMjUsIDIwMTkgYXQgMDI6NDE6MDlQTSArMDEwMCwgQW5kcmV3IENvb3BlciB3
cm90ZToKPiBPbiAyNS8wNi8yMDE5IDE0OjM5LCBSb2dlciBQYXUgTW9ubmUgd3JvdGU6Cj4gPiBD
dXJyZW50bHkgdGhlIG5hbWVzIG9mIHRoZSBidWlsZCB0b29sY2hhaW4gYmluYXJpZXMgYXJlIGhh
cmRjb2RlZCBpbgo+ID4gU3RkR05VLm1rLCBhbmQgdGhlIHZhbHVlcyBmcm9tIHRoZSBlbnZpcm9u
bWVudCBhcmUgaWdub3JlZC4KPiA+Cj4gPiBTd2l0Y2ggU3RkR05VLm1rIHRvIHVzZSAnPz0nIGlu
c3RlYWQgb2YgJz0nLCBzbyB0aGF0IHZhbHVlcyBmcm9tIHRoZQo+ID4gZW52aXJvbm1lbnQgYXJl
IHVzZWQgaWYgcHJlc2VudCwgZWxzZSBkZWZhdWx0IHRvIHRoZSB2YWx1ZXMgcHJvdmlkZWQKPiA+
IGJ5IHRoZSBjb25maWcgZmlsZS4KPiA+Cj4gPiBUaGlzIGNoYW5nZSBmaXhlcyB0aGUgZ2l0bGFi
IENJIGxvb3AsIHRoYXQgd2FzIHJlbHlpbmcgb24gcGFzc2luZwo+ID4gY3VzdG9tIHZhbHVlcyBp
biB0aGUgZW52aXJvbm1lbnQgdmFyaWFibGVzIGZvciB0aGUgY29tcGlsZXIgYW5kIHRoZQo+ID4g
bGlua2VyLgo+ID4KPiA+IFNpZ25lZC1vZmYtYnk6IFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBh
dUBjaXRyaXguY29tPgo+IAo+IEFja2VkLWJ5OiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVy
M0BjaXRyaXguY29tPgo+IAo+IERvIHdlIGtub3cgaWYgdGhlIENJIGxvb3Agc3RpbGwgaG9sZHMg
dG9nZXRoZXIgd2l0aCB0aGlzIGZpeGVkPwoKWWVzLCBJJ3ZlIGRvbmUgYSB0ZXN0LXJ1biB3aXRo
IHRoaXMsIHNlZToKCmh0dHBzOi8vZ2l0bGFiLmNvbS94ZW4tcHJvamVjdC9wZW9wbGUvcm95Z2Vy
L3hlbi9waXBlbGluZXMvNjc4ODI2NjcKCk5vIHJlZ3Jlc3Npb25zLCBldmVyeXRoaW5nIHdhcyBz
dGlsbCBPSy4KClRoYW5rcywgUm9nZXIuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVs
