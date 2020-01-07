Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CA8F313215B
	for <lists+xen-devel@lfdr.de>; Tue,  7 Jan 2020 09:27:51 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iokAh-0000ov-Ba; Tue, 07 Jan 2020 08:25:03 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ISl9=24=amazon.co.uk=prvs=26871475a=pdurrant@srs-us1.protection.inumbo.net>)
 id 1iok9Z-0000nj-Sv
 for xen-devel@lists.xenproject.org; Tue, 07 Jan 2020 08:23:54 +0000
X-Inumbo-ID: 0a5d3d58-3127-11ea-abb1-12813bfff9fa
Received: from smtp-fw-4101.amazon.com (unknown [72.21.198.25])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 0a5d3d58-3127-11ea-abb1-12813bfff9fa;
 Tue, 07 Jan 2020 08:23:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.co.uk; i=@amazon.co.uk; q=dns/txt;
 s=amazon201209; t=1578385434; x=1609921434;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=ezM07kigP/Mxg1GTM4CJkwypXphV85tPLY7fjEO9NMY=;
 b=bzbbMXmOyavaitDptZ1XG2pkYiO3CWQn5alVFZXNINAKhDkoOW/dPaZI
 ZY6IMbMjO5ALp+ZrrvcGAY0dRFdOK1aNPIgTJP7SunU3Zg7OAhv1cPcwn
 dYyuGcYOUPJInNIWuEDiCahhbPHmclLEfTPGJxaiMWbQT5PFdeNPCgjZN o=;
IronPort-SDR: nbNEsZCvvBNt1srTLgRAAf+Ywl6UtRxeU3O0amwObeKOiz7xuRZRvdz2qAJY3E/vDq1ZqrskKn
 pWtUBnKYBTKA==
X-IronPort-AV: E=Sophos;i="5.69,405,1571702400"; d="scan'208";a="11212467"
Received: from iad12-co-svc-p1-lb1-vlan3.amazon.com (HELO
 email-inbound-relay-1d-9ec21598.us-east-1.amazon.com) ([10.43.8.6])
 by smtp-border-fw-out-4101.iad4.amazon.com with ESMTP;
 07 Jan 2020 08:23:53 +0000
Received: from EX13MTAUEA001.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan3.iad.amazon.com [10.40.159.166])
 by email-inbound-relay-1d-9ec21598.us-east-1.amazon.com (Postfix) with ESMTPS
 id 88441A1AF1; Tue,  7 Jan 2020 08:23:40 +0000 (UTC)
Received: from EX13D32EUC004.ant.amazon.com (10.43.164.121) by
 EX13MTAUEA001.ant.amazon.com (10.43.61.82) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Tue, 7 Jan 2020 08:23:34 +0000
Received: from EX13D32EUC003.ant.amazon.com (10.43.164.24) by
 EX13D32EUC004.ant.amazon.com (10.43.164.121) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Tue, 7 Jan 2020 08:23:33 +0000
Received: from EX13D32EUC003.ant.amazon.com ([10.43.164.24]) by
 EX13D32EUC003.ant.amazon.com ([10.43.164.24]) with mapi id 15.00.1367.000;
 Tue, 7 Jan 2020 08:23:33 +0000
From: "Durrant, Paul" <pdurrant@amazon.co.uk>
To: Andrew Cooper <andrew.cooper3@citrix.com>, Lars Kurth
 <lars.kurth@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>
Thread-Topic: [Xen-devel] Community Call: Call for Agenda Items and call
 details for Jan 9, 16:00 - 17:00 UTC
Thread-Index: AQHVxMtZ1OgMwMP+3E6j25NQq/tXUKfeWHiAgACETgA=
Date: Tue, 7 Jan 2020 08:23:33 +0000
Message-ID: <3403b9d5b51845aea20aba2ca76fde6e@EX13D32EUC003.ant.amazon.com>
References: <4545D260-7F67-42DC-A33E-2F466011ED20@citrix.com>
 <89173194-efd5-61fb-d3f5-dd1011579c91@citrix.com>
In-Reply-To: <89173194-efd5-61fb-d3f5-dd1011579c91@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.43.166.168]
MIME-Version: 1.0
Precedence: Bulk
X-Mailman-Approved-At: Tue, 07 Jan 2020 08:25:01 +0000
Subject: Re: [Xen-devel] Community Call: Call for Agenda Items and call
 details for Jan 9, 16:00 - 17:00 UTC
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Amit Shah <amit@infradead.org>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 Doug Goldstein <cardoe@cardoe.com>, Brian
 Woods <brian.woods@xilinx.com>, Rich Persaud <persaur@gmail.com>,
 "anastassios.nanos@onapp.com" <anastassios.nanos@onapp.com>,
 Matt Spencer <Matt.Spencer@arm.com>,
 Kevin Pearson <kevin.pearson@ortmanconsulting.com>,
 "edgar.iglesias@xilinx.com" <edgar.iglesias@xilinx.com>, "Natarajan,
 Janakarajan" <jnataraj@amd.com>,
 "robin.randhawa@arm.com" <robin.randhawa@arm.com>,
 "daniel.kiper@oracle.com" <daniel.kiper@oracle.com>,
 "mirela.simonovic@aggios.com" <mirela.simonovic@aggios.com>,
 Robert Townley <rob.townley@gmail.com>, Rian Quinn <rianquinn@gmail.com>,
 Varad Gautam <varadgautam@gmail.com>, Juergen
 Gross <jgross@suse.com>, Tamas K Lengyel <tamas.k.lengyel@gmail.com>,
 Christopher Clark <christopher.w.clark@gmail.com>,
 George Dunlap <George.Dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Ian Jackson <Ian.Jackson@citrix.com>,
 "vfachin@de.adit-jv.com" <vfachin@de.adit-jv.com>,
 "lambert.olivier@gmail.com" <lambert.olivier@gmail.com>,
 "intel-xen@intel.com" <intel-xen@intel.com>,
 Jarvis Roach <Jarvis.Roach@dornerworks.com>,
 Artem Mygaiev <Artem_Mygaiev@epam.com>,
 Sergey Dyasli <sergey.dyasli@citrix.com>, Julien
 Grall <julien.grall@arm.com>, Jeff Kubascik <Jeff.Kubascik@dornerworks.com>,
 "Ji, John" <john.ji@intel.com>,
 Stewart Hildebrand <Stewart.Hildebrand@dornerworks.com>,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>, "Woodhouse,
 David" <dwmw@amazon.co.uk>, Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBBbmRyZXcgQ29vcGVyIDxhbmRy
ZXcuY29vcGVyM0BjaXRyaXguY29tPg0KPiBTZW50OiAwNyBKYW51YXJ5IDIwMjAgMDA6MjYNCj4g
VG86IExhcnMgS3VydGggPGxhcnMua3VydGhAY2l0cml4LmNvbT47IHhlbi1kZXZlbCA8eGVuLQ0K
PiBkZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZz4NCj4gQ2M6IFJpYW4gUXVpbm4gPHJpYW5xdWlu
bkBnbWFpbC5jb20+OyBEYW5pZWwgUC4gU21pdGgNCj4gPGRwc21pdGhAYXBlcnR1c3NvbHV0aW9u
cy5jb20+OyBEb3VnIEdvbGRzdGVpbiA8Y2FyZG9lQGNhcmRvZS5jb20+OyBCcmlhbg0KPiBXb29k
cyA8YnJpYW4ud29vZHNAeGlsaW54LmNvbT47IFJpY2ggUGVyc2F1ZCA8cGVyc2F1ckBnbWFpbC5j
b20+Ow0KPiBhbmFzdGFzc2lvcy5uYW5vc0BvbmFwcC5jb207IG1pcmVsYS5zaW1vbm92aWNAYWdn
aW9zLmNvbTsNCj4gZWRnYXIuaWdsZXNpYXNAeGlsaW54LmNvbTsgSmksIEpvaG4gPGpvaG4uamlA
aW50ZWwuY29tPjsNCj4gcm9iaW4ucmFuZGhhd2FAYXJtLmNvbTsgZGFuaWVsLmtpcGVyQG9yYWNs
ZS5jb207IEFtaXQgU2hhaA0KPiA8YW1pdEBpbmZyYWRlYWQub3JnPjsgTWF0dCBTcGVuY2VyIDxN
YXR0LlNwZW5jZXJAYXJtLmNvbT47IFJvYmVydCBUb3dubGV5DQo+IDxyb2IudG93bmxleUBnbWFp
bC5jb20+OyBBcnRlbSBNeWdhaWV2IDxBcnRlbV9NeWdhaWV2QGVwYW0uY29tPjsgVmFyYWQNCj4g
R2F1dGFtIDx2YXJhZGdhdXRhbUBnbWFpbC5jb20+OyBUYW1hcyBLIExlbmd5ZWwNCj4gPHRhbWFz
LmsubGVuZ3llbEBnbWFpbC5jb20+OyBDaHJpc3RvcGhlciBDbGFyaw0KPiA8Y2hyaXN0b3BoZXIu
dy5jbGFya0BnbWFpbC5jb20+OyBHZW9yZ2UgRHVubGFwIDxHZW9yZ2UuRHVubGFwQGNpdHJpeC5j
b20+Ow0KPiBTdGVmYW5vIFN0YWJlbGxpbmkgPHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+OyBsYW1i
ZXJ0Lm9saXZpZXJAZ21haWwuY29tOw0KPiBJYW4gSmFja3NvbiA8SWFuLkphY2tzb25AY2l0cml4
LmNvbT47IHZmYWNoaW5AZGUuYWRpdC1qdi5jb207IEtldmluDQo+IFBlYXJzb24gPGtldmluLnBl
YXJzb25Ab3J0bWFuY29uc3VsdGluZy5jb20+OyBpbnRlbC14ZW5AaW50ZWwuY29tOyBKYXJ2aXMN
Cj4gUm9hY2ggPEphcnZpcy5Sb2FjaEBkb3JuZXJ3b3Jrcy5jb20+OyBKdWVyZ2VuIEdyb3NzIDxq
Z3Jvc3NAc3VzZS5jb20+Ow0KPiBTZXJnZXkgRHlhc2xpIDxzZXJnZXkuZHlhc2xpQGNpdHJpeC5j
b20+OyBEdXJyYW50LCBQYXVsDQo+IDxwZHVycmFudEBhbWF6b24uY28udWs+OyBKdWxpZW4gR3Jh
bGwgPGp1bGllbi5ncmFsbEBhcm0uY29tPjsgSmVmZg0KPiBLdWJhc2NpayA8SmVmZi5LdWJhc2Np
a0Bkb3JuZXJ3b3Jrcy5jb20+OyBOYXRhcmFqYW4sIEphbmFrYXJhamFuDQo+IDxqbmF0YXJhakBh
bWQuY29tPjsgU3Rld2FydCBIaWxkZWJyYW5kDQo+IDxTdGV3YXJ0LkhpbGRlYnJhbmRAZG9ybmVy
d29ya3MuY29tPjsgVm9sb2R5bXlyIEJhYmNodWsNCj4gPHZvbG9keW15cl9iYWJjaHVrQGVwYW0u
Y29tPjsgV29vZGhvdXNlLCBEYXZpZCA8ZHdtd0BhbWF6b24uY28udWs+OyBSb2dlcg0KPiBQYXUg
TW9ubmUgPHJvZ2VyLnBhdUBjaXRyaXguY29tPg0KPiBTdWJqZWN0OiBSZTogW1hlbi1kZXZlbF0g
Q29tbXVuaXR5IENhbGw6IENhbGwgZm9yIEFnZW5kYSBJdGVtcyBhbmQgY2FsbA0KPiBkZXRhaWxz
IGZvciBKYW4gOSwgMTY6MDAgLSAxNzowMCBVVEMNCj4gDQo+IE9uIDA2LzAxLzIwMjAgMTk6NTYs
IExhcnMgS3VydGggd3JvdGU6DQo+ID4gRGVhcsKgY29tbXVuaXR5wqBtZW1iZXJzLA0KPiA+DQo+
ID4gSSBob3BlIHlvdSBhbGwgaGFkIGEgcmVzdGZ1bCBob2xpZGF5IHBlcmlvZCBhbmQgYSBIYXBw
eSBOZXcgWWVhciENCj4gPg0KPiA+IFBsZWFzZSBzZW5kIG1lwqBhZ2VuZGHCoGl0ZW1zwqBmb3LC
oHRoaXMgVGh1cnNkYXknc8KgY29tbXVuaXR5wqBjYWxswqAod2UNCj4gYWdyZWVkIHRvIG1vdmUg
aXQgYnkgMSB3ZWVrKSBwcmVmZXJhYmx5IGJ5IFdlZG5lc2RheSENCj4gPg0KPiA+IEEgZHJhZnTC
oGFnZW5kYcKgaXMNCj4gYXTCoGh0dHBzOi8vY3J5cHRwYWQuZnIvcGFkLyMvMi9wYWQvZWRpdC9F
Ulp0TVlENWo2azBzdi1ORzZIdGwtQUovDQo+ID4gUGxlYXNlIGFkZMKgYWdlbmRhwqBpdGVtc8Kg
dG8gdGhlIGRvY3VtZW50IG9yIHJlcGx5IHRvIHRoaXMgZS1tYWlsDQo+IA0KPiBJIHRoaW5rIGl0
IHdvdWxkIGJlIHZlcnkgaGVscGZ1bCBmb3IgdGhlIGNvbW11bml0eSBpbiBnZW5lcmFsIHRvIGtu
b3cNCj4gYW55IHNwZWNpZmljIHBsYW5zIGVhY2ggb2YgdXMgaGF2ZSBmb3IgdGhlIDQuMTQgdGlt
ZWZyYW1lLg0KPiANCj4gSSBwZXJzb25hbGx5IGFtIGF3YXJlIG9mIGEgZmFpciBxdWFudGl0eSBv
ZiB3b3JrIGZyb20gdmFyaW91cyBwZW9wbGUsDQo+IGJ1dCBpdCBpcyBjbGVhciB0aGF0IHRoZSBj
b21tdW5pdHkgYXMgYSB3aG9sZSBkb2Vzbid0IHJlYWxseSBoYXZlIGFuDQo+IGlkZWEgb2Ygd2hv
IGlzIHdvcmtpbmcgb24gd2hhdC4NCj4gDQo+IE15IGNvbnRyaWJ1dGlvbiB0byB0aGUgZGlzY3Vz
c2lvbiBzdGFydHMgd2l0aA0KPiBodHRwczovL2xvcmUua2VybmVsLm9yZy94ZW4tZGV2ZWwvOTQx
Y2YyM2MtMTNlZC0xNGExLWZkMjUtDQo+IDQ1YjAwMWQ5NTY0YUBjaXRyaXguY29tL1QvI3UNCj4g
YnV0IEkgdGhpbmsgaXQgd291bGQgYmUgaGVscGZ1bCBpZiBvdGhlcnMgZ2F2ZSBhdCBsZWFzdCBh
IGJyaWVmIG92ZXJ2aWV3DQo+IG9mIGFueSBwbGFucyBhbmQgd2hldGhlciB0aGV5IGFyZSBpbnRl
bmRpbmcgdGhlIHdvcmsgdG8gaGl0IHRoZSBuZXh0DQo+IHJlbGVhc2UsIG9yIHdoZXRoZXIgaXQg
aXMgbW9yZSBsaWtlbHkgdG8gYmUgYSBmdXR1cmUgcmVsZWFzZS4NCg0KQWdyZWVkLiBJIG5lZWQg
YSBiYXNlbGluZSBsaXN0IG9mIGl0ZW1zIHRvIHRyYWNrIGZvciA0LjE0LiANCg0KICBQYXVsDQpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwg
bWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3Rz
LnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
