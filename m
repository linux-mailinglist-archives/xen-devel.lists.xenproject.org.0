Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7ADE620298
	for <lists+xen-devel@lfdr.de>; Thu, 16 May 2019 11:32:00 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hRChY-0007aw-Cz; Thu, 16 May 2019 09:29:24 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=nM/z=TQ=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1hRChX-0007ar-4i
 for xen-devel@lists.xenproject.org; Thu, 16 May 2019 09:29:23 +0000
X-Inumbo-ID: 15099d4c-77bd-11e9-bfaa-772e32e80261
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 15099d4c-77bd-11e9-bfaa-772e32e80261;
 Thu, 16 May 2019 09:29:20 +0000 (UTC)
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=anthony.perard@citrix.com;
 spf=SoftFail smtp.mailfrom=anthony.perard@citrix.com;
 spf=None smtp.helo=postmaster@MIAPEX02MSOL01.citrite.net
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 anthony.perard@citrix.com) identity=pra;
 client-ip=23.29.105.83; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: SoftFail (esa3.hc3370-68.iphmx.com: domain of
 anthony.perard@citrix.com is inclined to not designate
 23.29.105.83 as permitted sender) identity=mailfrom;
 client-ip=23.29.105.83; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 include:spf.citrix.com
 include:spf2.citrix.com include:ironport.citrix.com
 exists:%{i}._spf.mta.salesforce.com ~all"
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@MIAPEX02MSOL01.citrite.net) identity=helo;
 client-ip=23.29.105.83; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="postmaster@MIAPEX02MSOL01.citrite.net";
 x-conformance=sidf_compatible
IronPort-SDR: Rwfmb9GMBPreXZ3em01iAg+7o7+YBzZJBqViSXlG+Vn61HB9OKUJHYDeiCY2lFYMEHVHe7yEA9
 etAbvxrM3BqJ98j2fltxtMoJdbjg2TyJw0fiizmX7zMu0T5ZgwuZJrEtrdau3bvBHazeyOkw86
 wINWIAjpPbGlDkNBMfkFGqbnkUA1K7bhqAGgY7DSSgCLv9GIXIxt/jkiWFyYrkginSWJCry0LZ
 4BHbY0ZxEAzexrAU8aKuPtksP8Z6b+Tp6sBxqQt//qofbluo8FWBwe21L9S3oBTLfprpsYtUFA
 +XY=
X-SBRS: 2.7
X-MesageID: 514990
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 23.29.105.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.60,476,1549947600"; 
   d="scan'208";a="514990"
Date: Thu, 16 May 2019 10:29:17 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: osstest service owner <osstest-admin@xenproject.org>, Ian Jackson
 <ian.jackson@citrix.com>
Message-ID: <20190516092917.GA5438@perard.uk.xensource.com>
References: <osstest-136177-mainreport@xen.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <osstest-136177-mainreport@xen.org>
User-Agent: Mutt/1.11.4 (2019-03-13)
Subject: Re: [Xen-devel] [qemu-upstream-4.12-testing test] 136177:
 regressions - FAIL
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
Cc: xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gV2VkLCBNYXkgMTUsIDIwMTkgYXQgMDQ6Mjg6MzVQTSArMDAwMCwgb3NzdGVzdCBzZXJ2aWNl
IG93bmVyIHdyb3RlOgo+IGZsaWdodCAxMzYxNzcgcWVtdS11cHN0cmVhbS00LjEyLXRlc3Rpbmcg
cmVhbCBbcmVhbF0KPiBodHRwOi8vbG9ncy50ZXN0LWxhYi54ZW5wcm9qZWN0Lm9yZy9vc3N0ZXN0
L2xvZ3MvMTM2MTc3Lwo+IAo+IFJlZ3Jlc3Npb25zIDotKAo+IAo+IFRlc3RzIHdoaWNoIGRpZCBu
b3Qgc3VjY2VlZCBhbmQgYXJlIGJsb2NraW5nLAo+IGluY2x1ZGluZyB0ZXN0cyB3aGljaCBjb3Vs
ZCBub3QgYmUgcnVuOgo+ICB0ZXN0LWFtZDY0LWFtZDY0LXhsLXFjb3cyICAgIDE3IGd1ZXN0LWxv
Y2FsbWlncmF0ZS94MTAgICBmYWlsIFJFR1IuIHZzLiAxMzM3MzQKPiAKPiBUZXN0cyB3aGljaCBh
cmUgZmFpbGluZyBpbnRlcm1pdHRlbnRseSAobm90IGJsb2NraW5nKToKPiAgdGVzdC1hbWQ2NC1h
bWQ2NC14bC1xY293MiAxNiBndWVzdC1zYXZlcmVzdG9yZS4yIGZhaWwgaW4gMTM2MDQ3IHBhc3Mg
aW4gMTM2MTc3Cj4gIHRlc3QtYXJtNjQtYXJtNjQteGwtY3JlZGl0MSAgMTcgZ3Vlc3Qtc3RhcnQu
MiAgICAgICAgICAgICAgZmFpbCBwYXNzIGluIDEzNjA0NwoKSWFuLCBjYW4geW91IGZvcmNlIHB1
c2ggdGhpcz8KClRoZSBxY293MiBmYWlsZWQgdGVzdCBzZWVtcyB0byBiZSB0aGUgc2FtZSBpc3N1
ZSBhcyBpbiB0aGUKeGVuLTQuMTItdGVzdGluZyBmbGlnaHQsIGEgZ3Vlc3Qga2VybmVsIHRocmVh
ZCBmYWlsaW5nIHRvIHN1c3BlbmQuCgpUaGUgYXJtNjQtY3JlZGl0MSB0ZXN0IGRvZXNuJ3QgZXZl
biBsYXVuY2ggcWVtdSwgc28gaXQncyByZXN1bHQgZG9lc24ndCBtYXR0ZXIKdG8gcWVtdS11cHN0
cmVhbS0qIGZsaWdodHMuCgpUaGFua3MsCgotLSAKQW50aG9ueSBQRVJBUkQKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxp
c3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVj
dC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
