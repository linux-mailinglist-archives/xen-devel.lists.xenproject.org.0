Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A0B1B34DF7
	for <lists+xen-devel@lfdr.de>; Tue,  4 Jun 2019 18:48:48 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hYCaE-0003Tf-EH; Tue, 04 Jun 2019 16:46:46 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ygn2=UD=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1hYCaC-0003TY-Ez
 for xen-devel@lists.xenproject.org; Tue, 04 Jun 2019 16:46:44 +0000
X-Inumbo-ID: 53fd7ebc-86e8-11e9-85fe-2fa2dc6e6b87
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 53fd7ebc-86e8-11e9-85fe-2fa2dc6e6b87;
 Tue, 04 Jun 2019 16:46:41 +0000 (UTC)
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ian.jackson@citrix.com;
 spf=Pass smtp.mailfrom=Ian.Jackson@citrix.com;
 spf=None smtp.helo=postmaster@MIAPEX02MSOL01.citrite.net
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ian.jackson@citrix.com) identity=pra; client-ip=23.29.105.83;
 receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="ian.jackson@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa4.hc3370-68.iphmx.com: domain of
 Ian.Jackson@citrix.com designates 23.29.105.83 as permitted
 sender) identity=mailfrom; client-ip=23.29.105.83;
 receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="Ian.Jackson@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:23.29.105.83 ip4:162.221.156.50 ~all"
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@MIAPEX02MSOL01.citrite.net) identity=helo;
 client-ip=23.29.105.83; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@MIAPEX02MSOL01.citrite.net";
 x-conformance=sidf_compatible
IronPort-SDR: t67uewZ28rq7uBEjKL9OX8IYhsMrA5otW+13a73jNi9Msto7Q3nwe7AUyBAWJtJ/ATVTXL6z3U
 7ZwItOXmGf/y+bD6OP0ttBY+760lgERu4+duCE8AQTLTE2JQ6z4cY+cXR/EZ8h4DW4z5sB+7NV
 joupg/A2f1V58otXNgNapLg087fHOSQ+c/vweOPMZ3YZsDqLnmdWz6rtiJljOl+Kou+w59BTlY
 De5hczBvLqaNZIikHJvMt5GVmBlcPXN68MhBdqv0wz7EEP4uNXRaszSDSO7XwWZWQWapAgAeOE
 BUk=
X-SBRS: 2.7
X-MesageID: 1302651
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 23.29.105.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.60,550,1549947600"; 
   d="scan'208";a="1302651"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Message-ID: <23798.41040.151794.166649@mariner.uk.xensource.com>
Date: Tue, 4 Jun 2019 17:46:08 +0100
To: Anthony PERARD <anthony.perard@citrix.com>
In-Reply-To: <20190409164542.30274-3-anthony.perard@citrix.com>
References: <20190409164542.30274-1-anthony.perard@citrix.com>
 <20190409164542.30274-3-anthony.perard@citrix.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
Subject: Re: [Xen-devel] [PATCH 2/9] libxl: Pointer on usage of
 libxl__domain_userdata_lock
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Wei Liu <wei.liu2@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

QW50aG9ueSBQRVJBUkQgd3JpdGVzICgiW1BBVENIIDIvOV0gbGlieGw6IFBvaW50ZXIgb24gdXNh
Z2Ugb2YgbGlieGxfX2RvbWFpbl91c2VyZGF0YV9sb2NrIik6Cj4gSXQgaXMgY3VycmVudGx5IGRp
ZmZpY3VsdCB0byBrbm93IGhvdy93aGVuL3doeSB0aGUgdXNlcmRhdGEgbG9jayBpcwo+IHN1cHBv
c2VkIHRvIGJlIHVzZWQuIEFkZCBzb21lIHBvaW50ZXJzIHRvIHRoZSBob3RwbHVnIGNvbW1lbnRz
LgoKQWNrZWQtYnk6IElhbiBKYWNrc29uIDxpYW4uamFja3NvbkBldS5jaXRyaXguY29tPgoKPiBk
aWZmIC0tZ2l0IGEvdG9vbHMvbGlieGwvbGlieGxfaW50ZXJuYWwuaCBiL3Rvb2xzL2xpYnhsL2xp
YnhsX2ludGVybmFsLmgKPiBpbmRleCA5OGExZWU2MTU5Li43MDJhY2M2ZDVkIDEwMDY0NAo+IC0t
LSBhL3Rvb2xzL2xpYnhsL2xpYnhsX2ludGVybmFsLmgKPiArKysgYi90b29scy9saWJ4bC9saWJ4
bF9pbnRlcm5hbC5oCj4gQEAgLTQ1MDAsNiArNDUwMCwxMiBAQCB2b2lkIGxpYnhsX191bmxvY2tf
ZG9tYWluX3VzZXJkYXRhKGxpYnhsX19kb21haW5fdXNlcmRhdGFfbG9jayAqbG9jayk7Cj4gICAq
IGRhdGEgc3RvcmUuIFRoZSByZWdpc3RyeSBlbnRyeSBpbiBsaWJ4bCBwcml2YXRlIGRhdGEgc3Rv
cmUKPiAgICogaXMgImxpYnhsLWpzb24iLgo+ICAgKiBDYWxsZXIgbXVzdCBob2xkIHVzZXIgZGF0
YSBsb2NrLgo+ICsgKgo+ICsgKiBPdGhlciBuYW1lcyB1c2VkIGZvciB0aGlzIGxvY2sgdGhyb3Vn
aG91dCB0aGUgbGlieGwgY29kZSBhcmUganNvbl9sb2NrLAo+ICsgKiBsaWJ4bF9fZG9tYWluX3Vz
ZXJkYXRhX2xvY2ssICJsaWJ4bC1qc29uIiwgZGF0YSBzdG9yZSBsb2NrLgo+ICsgKgo+ICsgKiBT
ZWUgY29tbWVudHMgYWJvdXQgbGlieGxfX2FvX2RldmljZSBhbmQgIkFsZ29yaXRobSBmb3IgaGFu
ZGxpbmcgZGV2aWNlCj4gKyAqIHJlbW92YWwiIG9uIGhvdyB0aGUgbGlieGwtanNvbiBsb2NrIC8g
anNvbl9sb2NrIGNhbiBiZSB1c2VkLgoKQmV0dGVyIGdyYW1tYXIgZm9yIHRoaXMgd291bGQgYmU6
CgogICsgKiBTZWUgdGhlIGNvbW1lbnQgZm9yIGxpYnhsX19hb19kZXZpY2UsIGFuZCAiQWxnb3Jp
dGhtIGZvcgogICsgKiBoYW5kbGluZyBkZXZpY2UgcmVtb3ZhbCIsIGZvciBpbmZvcm1hdGlvbiBh
Ym91dCB1c2luZyB0aGUKICArICogbGlieGwtanNvbiBsb2NrIC8ganNvbl9sb2NrLgoKVGhhbmtz
LApJYW4uCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpY
ZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRw
czovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
