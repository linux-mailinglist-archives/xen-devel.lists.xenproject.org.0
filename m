Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4ED7F7FDDA
	for <lists+xen-devel@lfdr.de>; Fri,  2 Aug 2019 17:55:20 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1htZrS-0005Xi-Ud; Fri, 02 Aug 2019 15:52:54 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Qji5=V6=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1htZrR-0005Xd-Ru
 for xen-devel@lists.xenproject.org; Fri, 02 Aug 2019 15:52:53 +0000
X-Inumbo-ID: 94e5f3b8-b53d-11e9-9206-53819030cdd4
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 94e5f3b8-b53d-11e9-9206-53819030cdd4;
 Fri, 02 Aug 2019 15:52:51 +0000 (UTC)
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
IronPort-SDR: i5paQJTdkknQ/RLY+YfjtjjdZVoiMvdMCUkF2O6oX8OpbOP+fZ4LVwrgwcQB3CIcEjqi2QH3y9
 /Amcsvjwnl1YyS3dMUKTiFJEUmjPqNde6kcffr1U4TsB9R6tIjEo6wg3SvoSpAH5B9s9/ueW13
 2Eabl/Tvb7IyFXou8q/cSP3G07DBokR452g1P0mRK5cu/JovTEcJRZZciZwfZKVr+fo7E5oNrA
 cSLnNh9QPDC11uWRVHzLiL0AbzMNf9gcEKR/TEN9aIPAwur6li4EVORt6HtADxuTBjpO96IrlE
 /DE=
X-SBRS: 2.7
X-MesageID: 3826512
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,338,1559534400"; 
   d="scan'208";a="3826512"
Date: Fri, 2 Aug 2019 16:52:46 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>, <jgross@suse.com>
Message-ID: <20190802155246.GD5791@perard.uk.xensource.com>
References: <20190801160048.11031-1-jgross@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190801160048.11031-1-jgross@suse.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Subject: Re: [Xen-devel] [ANNOUNCE] Xen 4.13 Development Update
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

T24gVGh1LCBBdWcgMDEsIDIwMTkgYXQgMDY6MDA6NDhQTSArMDIwMCwgSnVlcmdlbiBHcm9zcyB3
cm90ZToKPiBUaGlzIGVtYWlsIG9ubHkgdHJhY2tzIGJpZyBpdGVtcyBmb3IgeGVuLmdpdCB0cmVl
LiBQbGVhc2UgcmVwbHkgZm9yIGl0ZW1zIHlvdQo+IHdvdWxkIGxpa2UgdG8gc2VlIGluIDQuMTMg
c28gdGhhdCBwZW9wbGUgaGF2ZSBhbiBpZGVhIHdoYXQgaXMgZ29pbmcgb24gYW5kCj4gcHJpb3Jp
dGlzZSBhY2NvcmRpbmdseS4KCklmIEkgY2FuIGJlIGJvbGQsIEknZCBsaWtlIHRvIHNlZSBzb21l
IG1vcmUgUUVNVSBkZXByaXYgd29yayBnb2luZyBpbnRvCjQuMTMuIEknbSBub3Qgc3VyZSBmb3Ig
dGhlIGNhdGVnb3J5LCBidXQgbWF5YmU6Cgo9PT0geDg2ID09PQoKKiAgUUVNVSBkZXByaXYsIHNv
bWUgbGlieGwgd29yayAodjIsIHYxLCB2MSkKICAtICBBbnRob255IFBFUkFSRAoKVGhlIGRpZmZl
cmVudCBzZXJpZXMgY3VycmVudGx5IG9uIHRoZSBsaXN0IGFyZToKLSBbdjJdIGxpYnhsOiBOZXcg
c2xvdyBsb2NrICsgZml4IGxpYnhsX2Nkcm9tX2luc2VydCB3aXRoIFFFTVUgZGVwcml2Ci0gW3Yx
XSBTb21lIGNsZWFudXAgb2YgbGlieGwKLSBbdjFdIGxpYnhsIHJlZmFjdG9yaW5nIHRvIHVzZSBl
dl9xbXAgKHdpdGggQVBJIGNoYW5nZXMpCgpUaGFua3MsCgotLSAKQW50aG9ueSBQRVJBUkQKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBt
YWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMu
eGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
