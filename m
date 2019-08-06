Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D468830A1
	for <lists+xen-devel@lfdr.de>; Tue,  6 Aug 2019 13:28:09 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1huxaY-0004sV-0I; Tue, 06 Aug 2019 11:25:10 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=K458=WC=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1huxaW-0004sQ-Ir
 for xen-devel@lists.xenproject.org; Tue, 06 Aug 2019 11:25:08 +0000
X-Inumbo-ID: d7c311f4-b83c-11e9-8980-bc764e045a96
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id d7c311f4-b83c-11e9-8980-bc764e045a96;
 Tue, 06 Aug 2019 11:25:07 +0000 (UTC)
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ian.jackson@citrix.com;
 spf=Pass smtp.mailfrom=Ian.Jackson@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ian.jackson@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="ian.jackson@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa3.hc3370-68.iphmx.com: domain of
 Ian.Jackson@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="Ian.Jackson@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: G//RSC9TJh/7oAcAapZZbqNMH0aFHvuujkWsDFBSY6OaLVOrjUMcg2xidzGxX9wKYGNkrJsBZG
 ziV5O5Rh+5wGcEh0VBZXsTvKet5FPkhnrtUoy9nFlUXEZ3wPuSLabTj7LfXN9JKg8LzDqqZlPW
 42APRCgUjTXn+luvEAXeCHt6VhlVT1r2zrUQ52l1MPiMF2iHBbAsv31v747+8TqwTqni8bsZ+m
 WxzOQKDEQHDEPU91QLYlKA6oOqgwZ7fKL0DV0a/ppOZJ2FP5FPjY59dXgMkYJZ9YOX/f+/aCFP
 H2s=
X-SBRS: 2.7
X-MesageID: 3920488
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,353,1559534400"; 
   d="scan'208";a="3920488"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Message-ID: <23881.25458.352867.673439@mariner.uk.xensource.com>
Date: Tue, 6 Aug 2019 12:24:34 +0100
To: Anthony PERARD <anthony.perard@citrix.com>
In-Reply-To: <20190806111518.GM1242@perard.uk.xensource.com>
References: <20190805144910.20223-1-andrew.cooper3@citrix.com>
 <20190806111518.GM1242@perard.uk.xensource.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
Subject: Re: [Xen-devel] [PATCH] tools/xl: Make extra= usable in combination
 with cmdline=
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
Cc: Andrew Cooper <Andrew.Cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 Xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

QW50aG9ueSBQRVJBUkQgd3JpdGVzICgiUmU6IFtQQVRDSF0gdG9vbHMveGw6IE1ha2UgZXh0cmE9
IHVzYWJsZSBpbiBjb21iaW5hdGlvbiB3aXRoIGNtZGxpbmU9Iik6Cj4gT24gTW9uLCBBdWcgMDUs
IDIwMTkgYXQgMDM6NDk6MTBQTSArMDEwMCwgQW5kcmV3IENvb3BlciB3cm90ZToKPiA+ICAjIHhs
IGNyZWF0ZSBzaGltLmNmZyByYW1kaXNrPVwidGVzdC1odm02NC1leGFtcGxlXCIgZXh0cmE9XCJk
b20wPXB2aFwgZG9tMC1pb21tdT1ub25lXCIKPiA+IAo+ID4gd2l0aG91dCBuZWVkaW5nIHRvIGVk
aXQgc2hpbS5jZmcgaW5iZXR3ZWVuLgo+IAo+IDooLCB0aGlzIGZlZWxzIGxpa2UgdGhlIHdyb25n
IGFwcHJvYWNoLiBJdCBpcyB0aW1lIHRvIGludmVudCArPSA/IFNvIHdlCj4gY2FuIGRvIGNtZGxp
bmUrPSJ4IiwgZGlzays9Wyd4dmR6J10sIC4uLiA6LSkuCgorMQoKSWFuLgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlz
dApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
