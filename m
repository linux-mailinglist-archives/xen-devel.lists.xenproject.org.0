Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C998CDCF9
	for <lists+xen-devel@lfdr.de>; Mon,  7 Oct 2019 10:16:38 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iHO8j-0002D2-O7; Mon, 07 Oct 2019 08:13:09 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=J9qX=YA=citrix.com=lars.kurth@srs-us1.protection.inumbo.net>)
 id 1iHO8h-0002Cx-Cw
 for xen-devel@lists.xenproject.org; Mon, 07 Oct 2019 08:13:07 +0000
X-Inumbo-ID: 4a8dbde8-e8da-11e9-8c93-bc764e2007e4
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4a8dbde8-e8da-11e9-8c93-bc764e2007e4;
 Mon, 07 Oct 2019 08:13:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1570435986;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=PaJSE++/5/8tQMpGbjLCwLDhjFzRMgSzQMljuMbcBi8=;
 b=g7VkfjVtbSJXwVb5Yplkk8IrDkBHvRacabIK/Qw54VwOz5kzI8RD1+Il
 yHFOwjbF4qFfGVkK6vjgxrAhSDmCEbDQxA07OgL6wnUNZgR6cUElaVDMT
 PGG1483ip6KkrJrmaCOEAET6oYL/TYjcGcQzCxhwnjl+FY8eYiaehJXiS 4=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=lars.kurth@citrix.com;
 spf=Pass smtp.mailfrom=lars.kurth@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 lars.kurth@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="lars.kurth@citrix.com";
 x-sender="lars.kurth@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa6.hc3370-68.iphmx.com: domain of
 lars.kurth@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="lars.kurth@citrix.com";
 x-sender="lars.kurth@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="lars.kurth@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: lAelCN+bSB51JkN2EORXDLPZENS0QGS6HYKo1OKkPHrV7lhSMyZ4fLfUE5aTVit29mNv7E6I5z
 kfxIveuCEu2RnJ9TCJjdZd8UY+ktKKgfEM22C6xql1fs+ie8UiSauRUktgUyb8SNa7vyFPVWdY
 L4XFR9yNla+vkeyDwZn1h7QQ0bKlC8Y2e8HfygStXe1iRNbwUnGdHuMTjesIRPLU7kM14pf8lU
 awViaLpcv+VyGvhlhJnN8yH9VEoGwBdZyiL8Y7Y2hHm7UFGvAc4HoUTB4lB45fYeBVk5O4i/iW
 P3U=
X-SBRS: 2.7
X-MesageID: 6838741
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.67,265,1566878400"; 
   d="scan'208";a="6838741"
From: Lars Kurth <lars.kurth@citrix.com>
To: Wei Liu <wl@xen.org>
Thread-Topic: [PATCH for-4.13] docs: update all URLs in man pages
Thread-Index: AQHVegVbVDevXTtO/kiOWKJCl1zny6dKDe0AgAS7WYA=
Date: Mon, 7 Oct 2019 08:13:03 +0000
Message-ID: <1B611AEA-677A-47CF-8F6D-BA811F0D5330@citrix.com>
References: <EABA07C5-13F3-4D78-BDB9-21A4B5C5772E@citrix.com>
 <20191004085728.ba4tpw6gfvhcaowz@debian>
In-Reply-To: <20191004085728.ba4tpw6gfvhcaowz@debian>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Microsoft-MacOutlook/10.10.e.190909
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
Content-ID: <1CCFA286A1B57242935F7839AAB50219@citrix.com>
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH for-4.13] docs: update all URLs in man pages
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
Cc: "jgross@suse.com" <jgross@suse.com>,
 xen-devel <xen-devel@lists.xenproject.org>,
 Ian Jackson <Ian.Jackson@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

DQoNCu+7v09uIDA0LzEwLzIwMTksIDA5OjU3LCAiV2VpIExpdSIgPHdsQHhlbi5vcmc+IHdyb3Rl
Og0KDQogICAgT24gVGh1LCBPY3QgMDMsIDIwMTkgYXQgMDQ6MTI6MzBQTSArMDAwMCwgTGFycyBL
dXJ0aCB3cm90ZToNCiAgICA+IFNwZWNpZmljYWxseQ0KICAgID4gKiB4ZW4ub3JnIHRvIHhlbnBy
b2plY3Qub3JnDQogICAgPiAqIGh0dHAgdG8gaHR0cHMNCiAgICA+ICogUmVwbGFjZWQgcGFnZXMg
d2hlcmUgcGFnZSBoYXMgbW92ZWQNCiAgICA+ICAgKGluY2x1ZGluZyBvbiB4ZW4gcGFnZXMgYXMg
d2VsbCBhcyBleHRlcm5hbCBwYWdlcykNCiAgICA+ICogUmVtb3ZlZCBzb21lIFVSTHMgKGUuZy4g
ZG93bmxvYWRzIGZvciBMaW51eCBQViBkcml2ZXJzKQ0KICAgID4gDQogICAgPiBUZXN0ZWQtYnk6
IExhcnMgS3VydGggPGxhcnMua3VydGhAY2l0cml4LmNvbT4NCiAgICA+IFNpZ25lZC1vZmYtYnk6
IExhcnMgS3VydGggPGxhcnMua3VydGhAY2l0cml4LmNvbT4NCiAgICANCiAgICBEbyB5b3UgaGF2
ZSBhIGJyYW5jaCBmb3IgdGhpcyBwYXRjaD8NCiAgICANClVuZm9ydHVuYXRlbHksIG5vdDogSSBu
ZXZlciBjcmVhdGVkIGEgcGVyc29uYWwgY29weSBvZiB4ZW4uZ2l0IG9uIHhlbmJpdHMNClJlYWxs
eSBzaG91bGQgZG8gdGhpcw0KTGFycw0KDQogICAgDQoNCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1h
bi9saXN0aW5mby94ZW4tZGV2ZWw=
