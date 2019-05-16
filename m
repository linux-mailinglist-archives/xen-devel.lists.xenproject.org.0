Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 83E63203BA
	for <lists+xen-devel@lfdr.de>; Thu, 16 May 2019 12:40:42 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hRDlU-00058O-Gi; Thu, 16 May 2019 10:37:32 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=nM/z=TQ=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1hRDlS-00058J-RN
 for xen-devel@lists.xenproject.org; Thu, 16 May 2019 10:37:30 +0000
X-Inumbo-ID: 9aafb64c-77c6-11e9-8980-bc764e045a96
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 9aafb64c-77c6-11e9-8980-bc764e045a96;
 Thu, 16 May 2019 10:37:29 +0000 (UTC)
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=anthony.perard@citrix.com;
 spf=SoftFail smtp.mailfrom=anthony.perard@citrix.com;
 spf=None smtp.helo=postmaster@MIAPEX02MSOL02.citrite.net
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 anthony.perard@citrix.com) identity=pra;
 client-ip=23.29.105.83; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: SoftFail (esa6.hc3370-68.iphmx.com: domain of
 anthony.perard@citrix.com is inclined to not designate
 23.29.105.83 as permitted sender) identity=mailfrom;
 client-ip=23.29.105.83; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 include:spf.citrix.com
 include:spf2.citrix.com include:ironport.citrix.com
 exists:%{i}._spf.mta.salesforce.com ~all"
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@MIAPEX02MSOL02.citrite.net) identity=helo;
 client-ip=23.29.105.83; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="postmaster@MIAPEX02MSOL02.citrite.net";
 x-conformance=sidf_compatible
IronPort-SDR: otarHWevlXCAKkNo+pYsviMwbH9JG/i10j28h2sbnyH1IIVZdmykWVzNzab8S2grc9lITRpseJ
 2OhaqyYFWLVN642kWc2+J4tXitgj+HEyqCCkamyl0s40esTck7vYWAO1LQksPkybaKmzDF8o0p
 2ZnATWQFXj3/RDYFC7uAyUXwijjXNN3BY/d+oSDHCDYoJlo6NYJwifzxC0eHgOswmXVSq5iqsD
 206KzFrPNbIcehXAjURwUtcVyeG+vuFMOBCbsmIapKudjzlEb75bmPMvzUFt36+OSpxuald/VS
 0ss=
X-SBRS: 2.7
X-MesageID: 495563
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 23.29.105.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.60,476,1549947600"; 
   d="scan'208";a="495563"
Date: Thu, 16 May 2019 11:37:27 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: osstest service owner <osstest-admin@xenproject.org>, Ian Jackson
 <ian.jackson@citrix.com>, Julien Grall <julien.grall@arm.com>
Message-ID: <20190516103727.GB5438@perard.uk.xensource.com>
References: <osstest-136184-mainreport@xen.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <osstest-136184-mainreport@xen.org>
User-Agent: Mutt/1.11.4 (2019-03-13)
Subject: Re: [Xen-devel] [qemu-upstream-4.11-testing test] 136184:
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

T24gV2VkLCBNYXkgMTUsIDIwMTkgYXQgMDc6NDg6MTdQTSArMDAwMCwgb3NzdGVzdCBzZXJ2aWNl
IG93bmVyIHdyb3RlOgo+IGZsaWdodCAxMzYxODQgcWVtdS11cHN0cmVhbS00LjExLXRlc3Rpbmcg
cmVhbCBbcmVhbF0KPiBodHRwOi8vbG9ncy50ZXN0LWxhYi54ZW5wcm9qZWN0Lm9yZy9vc3N0ZXN0
L2xvZ3MvMTM2MTg0Lwo+IAo+IFJlZ3Jlc3Npb25zIDotKAo+IAo+IFRlc3RzIHdoaWNoIGRpZCBu
b3Qgc3VjY2VlZCBhbmQgYXJlIGJsb2NraW5nLAo+IGluY2x1ZGluZyB0ZXN0cyB3aGljaCBjb3Vs
ZCBub3QgYmUgcnVuOgo+ICBidWlsZC1hcm02NC1wdm9wcyAgICAgICAgICAgICAgIDxqb2Igc3Rh
dHVzPiAgICAgICAgICAgICAgICAgYnJva2VuICBpbiAxMzQ1OTQKPiAgYnVpbGQtYXJtNjQgICAg
ICAgICAgICAgICAgICAgICA8am9iIHN0YXR1cz4gICAgICAgICAgICAgICAgIGJyb2tlbiAgaW4g
MTM0NTk0Cj4gIGJ1aWxkLWFybTY0LXhzbSAgICAgICAgICAgICAgICAgPGpvYiBzdGF0dXM+ICAg
ICAgICAgICAgICAgICBicm9rZW4gIGluIDEzNDU5NAo+ICBidWlsZC1hcm02NC14c20gICAgICAg
ICAgICA0IGhvc3QtaW5zdGFsbCg0KSBicm9rZW4gaW4gMTM0NTk0IFJFR1IuIHZzLiAxMjU1NzUK
PiAgYnVpbGQtYXJtNjQtcHZvcHMgICAgICAgICAgNCBob3N0LWluc3RhbGwoNCkgYnJva2VuIGlu
IDEzNDU5NCBSRUdSLiB2cy4gMTI1NTc1Cj4gIGJ1aWxkLWFybTY0ICAgICAgICAgICAgICAgIDQg
aG9zdC1pbnN0YWxsKDQpIGJyb2tlbiBpbiAxMzQ1OTQgUkVHUi4gdnMuIDEyNTU3NQo+ICB0ZXN0
LWFybTY0LWFybTY0LWxpYnZpcnQteHNtICA3IHhlbi1ib290ICAgICAgICAgICAgICAgICBmYWls
IFJFR1IuIHZzLiAxMjU1NzUKPiAgdGVzdC1hcm02NC1hcm02NC14bCAgICAgICAgICAgNyB4ZW4t
Ym9vdCAgICAgICAgICAgICAgICAgZmFpbCBSRUdSLiB2cy4gMTI1NTc1Cj4gIHRlc3QtYXJtNjQt
YXJtNjQteGwteHNtICAgICAgIDcgeGVuLWJvb3QgICAgICAgICAgICAgICAgIGZhaWwgUkVHUi4g
dnMuIDEyNTU3NQo+ICB0ZXN0LWFybTY0LWFybTY0LXhsLWNyZWRpdDIgICA3IHhlbi1ib290ICAg
ICAgICAgICAgICAgICBmYWlsIFJFR1IuIHZzLiAxMjU1NzUKPiAKCklhbiwgSnVsaWVuLAoKSSBj
YW4ndCBmaWd1cmUgb3V0IHdoeSBYZW4gY29uc2lzdGVudGx5IGZhaWxzIHRvIGJvb3Qgb24gcm9j
aGVzdGVyKiBpbgp0aGUgcWVtdS11cHN0cmVhbS00LjExLXRlc3RpbmcgZmxpZ2h0cy4gVGhlIHhl
bi00LjExLXRlc3Rpbmcgc2VlbXMgdG8KcGFzcy4KCkF0IGJvb3QsIHRoZSBib290IGxvYWRlciBz
ZWVtcyB0byBsb2FkIGJsb2JzLCBidXQgd2hlbiBpdCdzIHRpbWUgdG8gWGVuCnRvIHNoaW5lLCB0
aGVyZSBhcmUgbm8gb3V0cHV0IGZyb20gWGVuIG9uIHRoZSBzZXJpYWwuCgpEbyB5b3Uga25vdyB3
aGF0IGNvdWxkIGNhdXNlIHhlbiB0byBmYWlsIHRvIGJvb3Q/CkkgZG9uJ3QgYmVsaWV2ZSBhIGZl
dyBtb3JlIHBhdGNoIG9uIHRvcCBvZiBxZW11LXhlbiB3b3VsZC4KClRoYW5rcywKCi0tIApBbnRo
b255IFBFUkFSRAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcK
aHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
