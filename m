Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 39E42A9C8C
	for <lists+xen-devel@lfdr.de>; Thu,  5 Sep 2019 10:04:49 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i5mh8-0005iB-EH; Thu, 05 Sep 2019 08:00:42 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=L9s7=XA=citrix.com=lars.kurth@srs-us1.protection.inumbo.net>)
 id 1i5mh7-0005hz-49
 for xen-devel@lists.xenproject.org; Thu, 05 Sep 2019 08:00:41 +0000
X-Inumbo-ID: 4032c496-cfb3-11e9-abc1-12813bfff9fa
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 4032c496-cfb3-11e9-abc1-12813bfff9fa;
 Thu, 05 Sep 2019 08:00:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1567670439;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=LJEzc+sIgsEetina7MmLyl52qbqhle2y2xjhNmdgCJA=;
 b=crr8rr0hxAVrFEc9aU/8EugoHA87gAW1o7wmXVTEXOk1ZMTdznyFZePB
 79dNaLdKI6lG4wBL8JAQnXOyAVrHRlpVZnlenO2ltC0wPAtY30DI7px4y
 N9vYbc5VAw1E/VAbrRoYovu9CK32faePGtqkuof83iRW3c0Dvao8VABFh A=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=lars.kurth@citrix.com;
 spf=Pass smtp.mailfrom=lars.kurth@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 lars.kurth@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="lars.kurth@citrix.com";
 x-sender="lars.kurth@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 lars.kurth@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="lars.kurth@citrix.com";
 x-sender="lars.kurth@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="lars.kurth@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: 4hV0Uco4gk/znhPKtdb+SjPhU0EJ467T8wrU43oX8thPtsDuWOQX4+4A+EUMrGRkCMjf62SxIO
 SG+FNnVn42wYmDrwlZofhtwnBMlEgLd8IhV0FFaQ8FwXvgJc1oTsBSWqy9/JZR0nA/FZ7XoY1j
 3NqXu31+Rml+eXRxdGDpStgje1Ke40igjVY924jP/xUSD4MJbjWP/YsEdnPyB1o6SJxe8nfkX4
 oPm+ZKA9THZsDRafJzTEki3pOni+jjj+99YbMWn66/Zg2Yy17oC3HCulfTot+/X/3h4jJG6wCN
 Ze8=
X-SBRS: 2.7
X-MesageID: 5350249
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,469,1559534400"; 
   d="scan'208";a="5350249"
From: Lars Kurth <lars.kurth@citrix.com>
To: Jan Beulich <jbeulich@suse.com>, Rich Persaud <persaur@gmail.com>
Thread-Topic: [Xen-devel] [ANNOUNCE] Call for agenda items for September 5th
 Community Call @ 15:00 UTC
Thread-Index: AQHVYynAq4l5UVCYY0OMdHHMFzgkkqccPIMAgABQNwCAAAYLAIAAApwAgAAThQA=
Date: Thu, 5 Sep 2019 08:00:34 +0000
Message-ID: <EC6DDB1D-BAFF-4079-BBD9-837383A5E3A5@citrix.com>
References: <6DA859DE-62FD-48C1-BBEE-C7A63D751B3E@citrix.com>
 <E8BC34C9-934A-4383-833B-B9AE6C9540A9@gmail.com>
 <b434d04f-d4e8-3b00-4efb-bf71c02e5075@suse.com>
 <11D8BF8A-BF9E-4610-8A80-8698B705AFAB@gmail.com>
 <fbee4b0d-6ca7-d2d8-4933-7602e4840d9c@suse.com>
In-Reply-To: <fbee4b0d-6ca7-d2d8-4933-7602e4840d9c@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Microsoft-MacOutlook/10.10.d.190811
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
Content-ID: <C4F98F9774642E49A45C1BB38B794B37@citrix.com>
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
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 Doug Goldstein <cardoe@cardoe.com>, Julien Grall <julien.grall@arm.com>,
 "anastassios.nanos@onapp.com" <anastassios.nanos@onapp.com>, Matt
 Spencer <Matt.Spencer@arm.com>,
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
 Sergey Dyasli <sergey.dyasli@citrix.com>,
 Jeff Kubascik <Jeff.Kubascik@dornerworks.com>, Janakarajan
 Natarajan <jnataraj@amd.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Stewart Hildebrand <Stewart.Hildebrand@dornerworks.com>,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>, Roger Pau
 Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

DQoNCu+7v09uIDA1LzA5LzIwMTksIDA4OjUwLCAiSmFuIEJldWxpY2giIDxqYmV1bGljaEBzdXNl
LmNvbT4gd3JvdGU6DQoNCiAgICBPbiAwNS4wOS4yMDE5IDA5OjQxLCBSaWNoIFBlcnNhdWQgd3Jv
dGU6DQogICAgPiBJZiBYZW4gY29tbXVuaXR5IGNhbGwgdG9waWNzIGFyZSBsaW1pdGVkIHRvIGVz
Y2FsYXRpb25zIG9mIHhlbi1kZXZlbCB0aHJlYWRzLCB0aGVuIGEgbmV3IHRocmVhZCBjYW4gYmUg
Y3JlYXRlZCBmb3IgdGhpcyB0b3BpYy4gWGVuIGNvbW11bml0eSBjYWxscyBoYXZlIGFsc28gcHJv
dmlkZWQgcmVhbC10aW1lLCBpbnRlcmFjdGl2ZSBmZWVkYmFjayBvbiBjYW5kaWRhdGUgcHJvcG9z
YWxzLCBhbG9uZyB3aXRoIGd1aWRhbmNlIG9uIGFyZWFzIHdoaWNoIG5lZWQgZG9jdW1lbnRhdGlv
biBiZWZvcmUgYSBmb3JtYWwgcHJvcG9zYWwgaXMgbWFkZSB0byB4ZW4tZGV2ZWwuICAgU3VjaCBh
Z2VuZGEgaXRlbXMgYXJlIHR5cGljYWxseSBjb3ZlcmVkIGFmdGVyIGFsbCBzZXJpZXMgYW5kIHBy
aW9yaXR5IHRvcGljcyBoYXZlIGJlZW4gYWRkcmVzc2VkLg0KICAgIA0KICAgIEknbGwgY2VydGFp
bmx5IGxpc3RlbiB0byB3aGF0IG90aGVycyB0aGluaywgYnV0IEkgaGF2ZSB0byBjb25mZXNzIHRo
YXQNCiAgICBvbiBzdWNoIHByaW9yIGluc3RhbmNlcyBJIHdhcyBhbHJlYWR5IG9uIHRoZSBlZGdl
IG9mIHJlcXVlc3RpbmcgdGhhdA0KICAgIHRpbWUgbm90IGJlIHNwZW50IGluIHN1Y2ggYSB3YXku
IFBsZWFzZSByZWNhbGwgdGhhdCBjYWxscywgb3RoZXIgdGhhbg0KICAgIG1haWxzLCB0YWtlIGV2
ZXJ5Ym9keSdzIHRpbWUsIGFuZCBleGFjdGx5IGF0IHRoZSBzYW1lIHRpbWUuIFRoZXJlZm9yZQ0K
ICAgIG15IHBlcnNvbmFsIG9waW5pb24gaXMgdGhhdCB0b3BpY3Mgb24gY2FsbHMgc2hvdWxkIGJl
IGxpbWl0ZWQgdG8gaXRlbXMNCiAgICB3aGljaCBjYW5ub3QgYmUgcmVzb2x2ZWQgYnkgb3RoZXIg
bWVhbnMsIG9yIHdoaWNoIGFyZSBjZXJ0YWluIHRvIG5lZWQNCiAgICAoYWxtb3N0KSBldmVyeWJv
ZHkncyBhdHRlbnRpb24gcmlnaHQgYXdheS4NCiAgICANCkkgZGlzYWdyZWUgd2l0aCB5b3Ugb24g
dGhpcyBvbmUuIA0KDQpTbyB5ZXMsIGl0IGlzIHRydWUgdGhhdCBhIGNhbGwgY29zdHMgZXZlcnlv
bmUgdGltZS4gQnV0IGl0J3MgYSBmaXhlZCBjb3N0IG9uY2UgcGVyIG1vbnRoDQoqICBTb21ldGhp
bmcgZXhwZXJpbWVudGFsIGNvdWxkIGJlIHBvc3RlZCBvbiB0aGUgbGlzdCBhbmQgaXQgbWF5IHRh
a2UgZXZlcnlvbmUgbW9yZSB0aW1lIHRvIHJlYWQgYW5kIHJlc3BvbmQgdGhhbiBhIDUgbWludXRl
IGVhcmx5IGRpc2N1c3Npb24gb24gdGhlIGNhbGwNCiogQWxzbywgb2YgY291cnNlIGV2ZXJ5b25l
IGhhcyB0aGUgb3B0aW9uIHRvIGRyb3Agb3V0IG9yIG5vdCBhdHRlbmQgYSBjYWxsIGJhc2VkIG9u
IHRoZSBhZ2VuZGENCiogSWYgd2UgaGFkIG1vcmUgdXJnZW50IHN0dWZmIHRvIGRpc2N1c3MgYWxs
IHRoZSB0aW1lIGFuZCB3ZSB3b3VsZCBoYXZlIHRvIGRpc3BsYWNlIHVyZ2VudCBkaXNjdXNzaW9u
cyB0byBjb3ZlciBkaXNjdXNzaW9ucyB3aGljaCBjYW4gd2FpdCwgSSBtYXkgYWdyZWUgd2l0aCB5
b3UsIGJ1dCB0aGlzIGlzIG5vdCBjdXJyZW50bHkgdGhlIGNhc2UNCg0KSSB3aWxsIGxvb2sgYXQg
dGhlIGFnZW5kYSB0aG91Z2ggYW5kIHJlLXN0cnVjdHVyZSBpdCBpbiBzdWNoIGEgd2F5IHRoYXQg
dGhpcyBpcyBjbGVhcg0KDQpJTVBPUlRBTlQ6IEkgaGFkIGEgZmV3IGFkZGl0aW9ucyB0byB0aGUg
YWdlbmRhLCBidXQgZG8gbm90IGtub3cgV0hPIGFkZGVkIHRoZXNlLiBJIGJlbGlldmUgb25lIHdh
cyBKdWVyZ2VuLiBXaG8gYWRkZWQgdGhlIGl0ZW1zIHJlbGF0ZWQgdG8gTUEgWW91bmdzIHBhdGNo
ZXM/IEFuZCBpZiB5b3UgYWRkIHNlcmllcyB0byBkaXNjdXNzIGNhbiB5b3UgcGxlYXNlIGFkZCBV
UkxzIG9yIG1lc3NhZ2UgSURzDQoNClJlZ2FyZHMNCkxhcnMNCg0KDQpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3Jn
L21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
