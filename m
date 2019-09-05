Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CF85A9C4A
	for <lists+xen-devel@lfdr.de>; Thu,  5 Sep 2019 09:53:52 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i5mWa-0003PN-7J; Thu, 05 Sep 2019 07:49:48 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=L9s7=XA=citrix.com=lars.kurth@srs-us1.protection.inumbo.net>)
 id 1i5mWZ-0003PD-3W
 for xen-devel@lists.xenproject.org; Thu, 05 Sep 2019 07:49:47 +0000
X-Inumbo-ID: b9517357-cfb1-11e9-abc1-12813bfff9fa
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b9517357-cfb1-11e9-abc1-12813bfff9fa;
 Thu, 05 Sep 2019 07:49:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1567669786;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=Typff/ESDTvF1elGSjnpAoUPlX9Ct04mHGaC5/PtolU=;
 b=AD8zKVDK4kRjQxEx0Smg99Uhdf0dxGbXYkBtREbHdlNv6QD+k4sqyO0U
 FQNjemvIipaIOjG5oUBSeJ8lgpGNA0kiLNRbOyjmiZPAqRI0jssTARP4B
 EBHyRdDUfhcH+dy7CNZwFFcXuM2HxVYwBhxwxHKfZDPC5w+/KOxvmMv4G g=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=lars.kurth@citrix.com;
 spf=Pass smtp.mailfrom=lars.kurth@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 lars.kurth@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="lars.kurth@citrix.com";
 x-sender="lars.kurth@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa3.hc3370-68.iphmx.com: domain of
 lars.kurth@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="lars.kurth@citrix.com";
 x-sender="lars.kurth@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="lars.kurth@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: Zog6bF5ZGF2eFNP9gqUKXTFNE/1VWk5CLyjNp834+rXODrxLQY5Z79aGkAIlY3oXTKmcEkZn81
 nq5RoR8ES+CHG9HZHdaalWvKZR9eFAD9Wk2Jj0AYJlW1399pbzuwFp64xdR67kaiHfqEV5SmC7
 8UN5j6uH9pLPa+q65QtDt30oo4qF6Np2/5GXCqbB+N0qZO9FeRhcPi3Zk0USsmULGbXUCGY1Kx
 P+BTMa3I1QF8RUH88qvNW9ar0q/uiR7NhsFJw3BWp3iP3ZcooKhxCmbTKidEjz/LbCFwXtUidn
 P/U=
X-SBRS: 2.7
X-MesageID: 5169074
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,469,1559534400"; 
   d="scan'208";a="5169074"
From: Lars Kurth <lars.kurth@citrix.com>
To: Rich Persaud <persaur@gmail.com>, Jan Beulich <jbeulich@suse.com>
Thread-Topic: [Xen-devel] [ANNOUNCE] Call for agenda items for September 5th
 Community Call @ 15:00 UTC
Thread-Index: AQHVYynAq4l5UVCYY0OMdHHMFzgkkqccPIMAgABQNwCAAAYLAIAAExSA
Date: Thu, 5 Sep 2019 07:49:39 +0000
Message-ID: <FA118783-4079-460A-95F8-B628F3320637@citrix.com>
References: <6DA859DE-62FD-48C1-BBEE-C7A63D751B3E@citrix.com>
 <E8BC34C9-934A-4383-833B-B9AE6C9540A9@gmail.com>
 <b434d04f-d4e8-3b00-4efb-bf71c02e5075@suse.com>
 <11D8BF8A-BF9E-4610-8A80-8698B705AFAB@gmail.com>
In-Reply-To: <11D8BF8A-BF9E-4610-8A80-8698B705AFAB@gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Microsoft-MacOutlook/10.10.d.190811
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
Content-ID: <E59F994E32E9CE47A7A8742A7C0531F8@citrix.com>
MIME-Version: 1.0
Subject: Re: [Xen-devel] [ANNOUNCE] Call for agenda items for September 5th
 Community Call @ 15:00 UTC
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
Cc: "Daniel P.
 Smith" <dpsmith@apertussolutions.com>, Doug Goldstein <cardoe@cardoe.com>,
 Julien Grall <julien.grall@arm.com>,
 "anastassios.nanos@onapp.com" <anastassios.nanos@onapp.com>,
 Matt Spencer <Matt.Spencer@arm.com>,
 "edgar.iglesias@xilinx.com" <edgar.iglesias@xilinx.com>,
 John Ji <john.ji@intel.com>, "robin.randhawa@arm.com" <robin.randhawa@arm.com>,
 "daniel.kiper@oracle.com" <daniel.kiper@oracle.com>,
 "mirela.simonovic@aggios.com" <mirela.simonovic@aggios.com>,
 xen-devel <xen-devel@lists.xenproject.org>, Rian Quinn <rianquinn@gmail.com>,
 Juergen Gross <jgross@suse.com>, Tamas K
 Lengyel <tamas.k.lengyel@gmail.com>,
 Christopher Clark <christopher.w.clark@gmail.com>,
 Paul Durrant <Paul.Durrant@citrix.com>, Ian Jackson <Ian.Jackson@citrix.com>,
 "vfachin@de.adit-jv.com" <vfachin@de.adit-jv.com>,
 "intel-xen@intel.com" <intel-xen@intel.com>,
 Jarvis Roach <Jarvis.Roach@dornerworks.com>,
 Artem Mygaiev <Artem_Mygaiev@epam.com>,
 Sergey Dyasli <sergey.dyasli@citrix.com>, Brian Woods <brian.woods@amd.com>,
 Jeff Kubascik <Jeff.Kubascik@dornerworks.com>,
 Janakarajan Natarajan <jnataraj@amd.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Stewart Hildebrand <Stewart.Hildebrand@dornerworks.com>,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>, Roger Pau
 Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

DQoNCu+7v09uIDA1LzA5LzIwMTksIDA4OjQxLCAiUmljaCBQZXJzYXVkIiA8cGVyc2F1ckBnbWFp
bC5jb20+IHdyb3RlOg0KDQogICAgPiBPbiBTZXAgNSwgMjAxOSwgYXQgMDM6MTksIEphbiBCZXVs
aWNoIDxqYmV1bGljaEBzdXNlLmNvbT4gd3JvdGU6DQogICAgPiANCiAgICA+IEZvcmdpdmUgbWUg
YXNraW5nLCBidXQgd2h5IGlzIHRoaXMgcHV0IHVwIGFzIGFuIGFnZW5kYSBpdGVtIGhlcmU/DQog
ICAgPiBJTU8gdGhpcyBpcyB0aGUga2luZCBvZiB0aGluZyB3aGVyZSB5b3Ugd291bGQgc2VuZCBh
IHByb3Bvc2FsIGFuZA0KICAgID4gcmVxdWVzdCBmZWVkYmFjayBieSBlbWFpbCBmaXJzdCwgYW5k
IHB1dCBpdCB1cCBhcyBhbiBhZ2VuZGEgaXRlbQ0KICAgID4gaGVyZSBvbmx5IGlmIGl0IGdvdCBz
dGFsbGVkIHRoZXJlLiAoQXBvbG9naWVzIGlmIEkndmUgb3Zlcmxvb2tlZA0KICAgID4gc3VjaCBh
IHN0YWxsZWQgdGhyZWFkLikNCiAgICANCiAgICBJZiBYZW4gY29tbXVuaXR5IGNhbGwgdG9waWNz
IGFyZSBsaW1pdGVkIHRvIGVzY2FsYXRpb25zIG9mIHhlbi1kZXZlbCB0aHJlYWRzLCB0aGVuIGEg
bmV3IHRocmVhZCBjYW4gYmUgY3JlYXRlZCBmb3IgdGhpcyB0b3BpYy4gWGVuIGNvbW11bml0eSBj
YWxscyBoYXZlIGFsc28gcHJvdmlkZWQgcmVhbC10aW1lLCBpbnRlcmFjdGl2ZSBmZWVkYmFjayBv
biBjYW5kaWRhdGUgcHJvcG9zYWxzLCBhbG9uZyB3aXRoIGd1aWRhbmNlIG9uIGFyZWFzIHdoaWNo
IG5lZWQgZG9jdW1lbnRhdGlvbiBiZWZvcmUgYSBmb3JtYWwgcHJvcG9zYWwgaXMgbWFkZSB0byB4
ZW4tZGV2ZWwuICAgU3VjaCBhZ2VuZGEgaXRlbXMgYXJlIHR5cGljYWxseSBjb3ZlcmVkIGFmdGVy
IGFsbCBzZXJpZXMgYW5kIHByaW9yaXR5IHRvcGljcyBoYXZlIGJlZW4gYWRkcmVzc2VkLg0KICAg
IA0KSSBkb24ndCBtaW5kIGhhdmluZyBpdGVtcyBzdWNoIHRoZXNlIG9uIHRoZSBhZ2VuZGEgYW5k
IHRvIGJlIGZhaXIgaGF2ZSBhZGRlZCBzaW1pbGFyIGl0ZW1zIG9udG8gdGhlIGFnZW5kYSBpbiB0
aGUgcGFzdC4NCkNsZWFybHksIHRoZXkgYXJlIGZvcndhcmQgbG9va2luZyBbbGlrZSBhbiBSRkNd
LCBmb3Igd2hpY2ggcmVhc29uIEkgdGVuZCB0byBhZGQgdGhlbSB0byB0aGUgZW5kIG9mIGFuIGFn
ZW5kYSBpZiB0aGVyZSBpcyBhIGJ1c3kgc2NoZWR1bGUNCg0KUGVyc29uYWxseSwgb24gdGhpcyBz
cGVjaWZpYyBpdGVtLCBpdCBpcyBub3QgcmVhbGx5IGNsZWFyIHdoYXQgdGhlIHF1ZXN0aW9ucyBh
cmUuICBJbiBvdGhlciB3b3JkczogaXMgdGhpcyBhYm91dCBVVUlEUy9kb21haW4gaWRzIG9ubHks
IG9yIGlzIHRoZXJlIHNvbWV0aGluZyBlbHNlLiANCg0KTGFycw0KDQpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3Jn
L21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
