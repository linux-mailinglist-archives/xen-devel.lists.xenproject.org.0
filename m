Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BDCD51EB69
	for <lists+xen-devel@lfdr.de>; Wed, 15 May 2019 11:49:13 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hQqVJ-0001tQ-SR; Wed, 15 May 2019 09:47:17 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=0eB+=TP=citrix.com=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1hQqVI-0001tI-8Y
 for xen-devel@lists.xenproject.org; Wed, 15 May 2019 09:47:16 +0000
X-Inumbo-ID: 6b60e69c-76f6-11e9-8980-bc764e045a96
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 6b60e69c-76f6-11e9-8980-bc764e045a96;
 Wed, 15 May 2019 09:47:15 +0000 (UTC)
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=wei.liu2@citrix.com;
 spf=SoftFail smtp.mailfrom=wei.liu2@citrix.com;
 spf=None smtp.helo=postmaster@MIAPEX02MSOL02.citrite.net
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 wei.liu2@citrix.com) identity=pra; client-ip=23.29.105.83;
 receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="wei.liu2@citrix.com";
 x-sender="wei.liu2@citrix.com"; x-conformance=sidf_compatible
Received-SPF: SoftFail (esa1.hc3370-68.iphmx.com: domain of
 wei.liu2@citrix.com is inclined to not designate 23.29.105.83
 as permitted sender) identity=mailfrom;
 client-ip=23.29.105.83; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="wei.liu2@citrix.com";
 x-sender="wei.liu2@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 mx include:spf.citrix.com
 include:spf2.citrix.com include:ironport.citrix.com
 include:_spf.salesforce.com ~all"
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@MIAPEX02MSOL02.citrite.net) identity=helo;
 client-ip=23.29.105.83; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="wei.liu2@citrix.com";
 x-sender="postmaster@MIAPEX02MSOL02.citrite.net";
 x-conformance=sidf_compatible
IronPort-SDR: +G3r1J1rZVjLyabOpDdtpBEjqAMcW0GKhKC6clY3kvAyF42ivNfQ9cdCqLjh9oaMQbBEWR7UOz
 ElTKwxFeXrp29hmILTGj7pygQ4IHd8uuMqIJVrzpFRS0nlcyHIwh1tPlCO8ZjDGFW8kYiGxaGM
 cdeeHvNTOd06HBwZkiyC5/2eHr4PksKbnkhmF9y/mD2nnamX7ZRxift62DVrcruKZb9R935S9R
 uq76xK2mqOVuXuvgDTlG8/xR8oxBEkpPWNMeLNS+d37MkMTx6VG0F1Yc7zqZBh+2cL6y6mSOWU
 Vvo=
X-SBRS: 2.7
X-MesageID: 447584
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 23.29.105.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.60,472,1549947600"; 
   d="scan'208";a="447584"
Date: Wed, 15 May 2019 10:47:11 +0100
From: Wei Liu <wei.liu2@citrix.com>
To: Eslam Elnikety <elnikety@amazon.com>
Message-ID: <20190515094711.GM2798@zion.uk.xensource.com>
References: <20190514084325.43928-1-elnikety@amazon.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190514084325.43928-1-elnikety@amazon.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Subject: Re: [Xen-devel] [PATCH v3] libxl: make vkbd tunable for HVM guests
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
 Wei Liu <wei.liu2@citrix.com>, Amit Shah <aams@amazon.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVHVlLCBNYXkgMTQsIDIwMTkgYXQgMDg6NDM6MjVBTSArMDAwMCwgRXNsYW0gRWxuaWtldHkg
d3JvdGU6Cj4gRWFjaCBIVk0gZ3Vlc3QgY3VycmVudGx5IGdldHMgYSB2a2JkIGZyb250ZW5kL2Jh
Y2tlbmQgcGFpciAoYy9zIGViYmQyNTYxYjRjKS4KPiBUaGlzIGNvbnN1bWVzIGhvc3QgcmVzb3Vy
Y2VzIHVubmVjZXNzYXJpbHkgZm9yIGd1ZXN0cyB0aGF0IGhhdmUgbm8gdXNlIGZvcgo+IHZrYmQu
IE1ha2UgdGhpcyBiZWhhdmlvdXIgdHVuYWJsZSB0byBhbGxvdyBhbiBhZG1pbmlzdHJhdG9yIHRv
IGNob29zZS4gVGhlCj4gY29tbWl0IHJldGFpbnMgdGhlIGN1cnJlbnQgYmVoYXZpb3VyIC0tIEhW
TSBndWVzdHMgc3RpbGwgZ2V0IHZrZGIgdW5sZXNzCj4gc3BlY2lmaWVkIG90aGVyd2lzZS4KPiAK
PiBTaWduZWQtb2ZmLWJ5OiBFc2xhbSBFbG5pa2V0eSA8ZWxuaWtldHlAYW1hem9uLmNvbT4KPiAt
LS0KPiAgICAgQ2hhbmdlcyBpbiB2MjoKPiAgICAgICAgIC0gQWRkZWQgYSBtaXNzaW5nIGh1bmsg
LyBzZXR0aW5nIHZrYl9kZXZpY2UgcGVyIGNvbmZpZwo+IAo+ICAgICBDaGFuZ2VzIGluIHYzOgo+
ICAgICAgICAgLSBBZGRlZCBlbnRyaWVzIGluIGxpYnhsLmggYW5kIGluIGRvY3VtZW50YXRpb24K
PiAtLS0KPiAgZG9jcy9tYW4veGwuY2ZnLnBvZC41LmluICAgIHwgNCArKysrCgpJIHdvbmRlciB3
aGVyZSB5b3UgZ290IHRoaXMgZmlsZS4gOnAKClRoZSBjb3JyZWN0IGZpbGUgbmFtZSBpcyB4bC5j
ZmcuNS5wb2QuaW4uCgpBbnl3YXksIEkgaGF2ZSBmaXhlZCB1cCB5b3VyIHBhdGNoLCBzbyBubyBu
ZWVkIHRvIHJlc2VuZC4KCldlaS4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94
ZW4tZGV2ZWw=
