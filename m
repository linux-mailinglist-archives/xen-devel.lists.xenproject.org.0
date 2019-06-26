Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 185F356B82
	for <lists+xen-devel@lfdr.de>; Wed, 26 Jun 2019 16:07:15 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hg8Wq-0000CV-SS; Wed, 26 Jun 2019 14:04:04 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=LltW=UZ=citrix.com=lars.kurth@srs-us1.protection.inumbo.net>)
 id 1hg8Wp-0000CQ-Ah
 for xen-devel@lists.xenproject.org; Wed, 26 Jun 2019 14:04:03 +0000
X-Inumbo-ID: 3f1e85f6-981b-11e9-8422-c30aca162f53
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 3f1e85f6-981b-11e9-8422-c30aca162f53;
 Wed, 26 Jun 2019 14:04:00 +0000 (UTC)
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=lars.kurth@citrix.com;
 spf=Pass smtp.mailfrom=lars.kurth@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 lars.kurth@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="lars.kurth@citrix.com";
 x-sender="lars.kurth@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa4.hc3370-68.iphmx.com: domain of
 lars.kurth@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="lars.kurth@citrix.com";
 x-sender="lars.kurth@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="lars.kurth@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: jTpjXEMBmGKz3qkYaf1jDPHernE9GxmTQJxUdZuczDqfZa8ILO9eNhTne1tFOP3A9IbILnNNg3
 I0adzvMqRvmuhtMfvKnS6Fs400kF8fuvWU0ua6u3U83VIIQ41RJwgFBZ8TIM7AaYV5nzGz4voI
 46lITIOOXG96ajClNSD5nKQKh9bPgddYkrLnVyoBaouHU8AseJwWsLpxmSwdrxrMqrr3RvIPtF
 g9AHkwbsmBTapnnGF1NWkaIAOr01kawjow8EXNlbG+25kJmEoLp9pBCyvlFRajpNiPdj40BW6b
 nWA=
X-SBRS: 2.7
X-MesageID: 2290040
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.63,420,1557201600"; 
   d="scan'208";a="2290040"
From: Lars Kurth <lars.kurth@citrix.com>
To: "committers@xenproject.org" <committers@xenproject.org>, xen-devel
 <xen-devel@lists.xenproject.org>
Thread-Topic: Xen Project Community Call Sign-up-sheet for future calls
Thread-Index: AQHVLCf+Jxs40Bi2gUy+DRARTFwg9g==
Date: Wed, 26 Jun 2019 14:03:55 +0000
Message-ID: <5C730654-DA76-4248-ACF2-FB70930850FC@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Microsoft-MacOutlook/10.10.b.190609
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
Content-ID: <9991FCA9A0848B40BADDEFC2D09CE0E1@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] Xen Project Community Call Sign-up-sheet for future
 calls
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
Cc: "davorin.mista@aggios.com" <davorin.mista@aggios.com>,
 Rich Persaud <persaur@gmail.com>,
 "anastassios.nanos@onapp.com" <anastassios.nanos@onapp.com>,
 "mirela.simonovic@aggios.com" <mirela.simonovic@aggios.com>,
 "edgar.iglesias@xilinx.com" <edgar.iglesias@xilinx.com>, "Ji,
 John" <john.ji@intel.com>, "robin.randhawa@arm.com" <robin.randhawa@arm.com>,
 "daniel.kiper@oracle.com" <daniel.kiper@oracle.com>, Matt
 Spencer <Matt.Spencer@arm.com>, Artem Mygaiev <Artem_Mygaiev@epam.com>,
 Tamas K Lengyel <tamas.k.lengyel@gmail.com>,
 Christopher Clark <christopher.w.clark@gmail.com>,
 Paul Durrant <Paul.Durrant@citrix.com>, Ian Jackson <Ian.Jackson@citrix.com>,
 "vfachin@de.adit-jv.com" <vfachin@de.adit-jv.com>,
 "intel-xen@intel.com" <intel-xen@intel.com>,
 Jarvis Roach <Jarvis.Roach@dornerworks.com>, Juergen Gross <jgross@suse.com>,
 Brian
 Woods <brian.woods@amd.com>, Julien Grall <julien.grall@arm.com>, "Natarajan, 
 Janakarajan" <jnataraj@amd.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Stewart Hildebrand <Stewart.Hildebrand@dornerworks.com>,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgYWxsLA0KDQpJIGhhdmUgYmVlbiB1c2luZyBhIHByb2JhYmx5IGEgZmFpcmx5IG9sZCBsaXN0
IG9mIHBlb3BsZSB0byBDQyBvbiBtYWlsIHJlbGF0ZWQgdG8gY29tbXVuaXR5IGNhbGxzLiBJZiB5
b3UgcmVjZWl2ZWQgdGhpcyBtYWlsIGFuZCBkb27igJl0IHdhbnQgdG8gYmUgb24gdGhlIENDIGxp
c3QsIHBsZWFzZSByZW1vdmUgeW91ciBuYW1lIGFuZCBlLW1haWwgYWRkcmVzcyBmcm9tIHRoZSBs
aXN0IGluIGh0dHBzOi8vY3J5cHRwYWQuZnIvcGFkLyMvMi9wYWQvZWRpdC9EOXZHemloUHh4QU9l
NlJGUHowc1JDZisvDQoNCklmIHlvdSB3YW50IHRvIGJlIG9uIGl0LCBwbGVhc2UgYWRkIHlvdXJz
ZWxmIGZvbGxvd2luZyB0aGUgZm9ybWF0IGluIHRoZSBzaGVldA0KDQpHb2luZyBmb3J3YXJkLCBJ
IHdpbGwgdXNlIHRoZSBzaWduLXVwIHNoZWV0IGZvciBDb21tdW5pdHkgY2FsbCByZWxhdGVkIGUt
bWFpbHMuIFRoZSBjYWxsIGlzIG5vcm1hbGx5IG9uIHRoZSAxc3QgVGh1cnNkYXkgb2YgZXZlcnkg
bW9udGggYXQgQDE1OjAwIFVUQywgZXhjZXB0IGluIGNhc2VzIHdoZXJlIHRoZXJlIGlzIGEgcHVi
bGljIGhvbGlkYXkgYWZmZWN0aW5nIG1vc3Qgb2YgdXMuIEluIHN1Y2ggY2FzZXMgd2Ugd2lsbCBj
aGFuZ2UgdGhlIGRhdGUgaW4gdGhlIG1lZXRpbmcgcHJpb3IgdG8gdGhlIGNhbGwuIA0KDQpCZXN0
IFJlZ2FyZHMNCkxhcnMNCg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVj
dC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1k
ZXZlbA==
