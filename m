Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BB6D7255906
	for <lists+xen-devel@lfdr.de>; Fri, 28 Aug 2020 13:01:50 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kBc8H-0007Oe-OF; Fri, 28 Aug 2020 11:01:21 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HK1f=CG=amazon.co.uk=prvs=50283cf21=pdurrant@srs-us1.protection.inumbo.net>)
 id 1kBc8G-0007OY-Su
 for xen-devel@lists.xenproject.org; Fri, 28 Aug 2020 11:01:20 +0000
X-Inumbo-ID: c93c298e-149c-494c-9e4e-d94598de7b37
Received: from smtp-fw-9101.amazon.com (unknown [207.171.184.25])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c93c298e-149c-494c-9e4e-d94598de7b37;
 Fri, 28 Aug 2020 11:01:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.co.uk; i=@amazon.co.uk; q=dns/txt;
 s=amazon201209; t=1598612481; x=1630148481;
 h=from:to:cc:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version:subject;
 bh=EaMBGKGGz3ldmQf5zMxNS+gogcYmQGMlz7Ds56d+nTY=;
 b=ssegOAsb3PR8GHndEKkkc0BXynDGO3wE3WUzvNZw+dFt88VKxNUnhS6B
 UjJmSXVMYnL/Cq95aOVink97tNdPhWhKHt2I7hkDgHZx/sabcTi4c+hl7
 T9q/z9H/G7hW0lXSP8eyfY5glz35tusl0vOU1CB/Wa+1KL2I1nmd+cImF s=;
X-IronPort-AV: E=Sophos;i="5.76,363,1592870400"; d="scan'208";a="63429292"
Subject: RE: [ANNOUNCE] Call for agenda items for 3 September Community Call @
 15:00 UTC
Thread-Topic: [ANNOUNCE] Call for agenda items for 3 September Community Call
 @ 15:00 UTC
Received: from sea32-co-svc-lb4-vlan3.sea.corp.amazon.com (HELO
 email-inbound-relay-1a-821c648d.us-east-1.amazon.com) ([10.47.23.38])
 by smtp-border-fw-out-9101.sea19.amazon.com with ESMTP;
 28 Aug 2020 11:01:15 +0000
Received: from EX13D32EUC002.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan2.iad.amazon.com [10.40.159.162])
 by email-inbound-relay-1a-821c648d.us-east-1.amazon.com (Postfix) with ESMTPS
 id 30608A2202; Fri, 28 Aug 2020 11:01:02 +0000 (UTC)
Received: from EX13D32EUC003.ant.amazon.com (10.43.164.24) by
 EX13D32EUC002.ant.amazon.com (10.43.164.94) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Fri, 28 Aug 2020 11:01:02 +0000
Received: from EX13D32EUC003.ant.amazon.com ([10.43.164.24]) by
 EX13D32EUC003.ant.amazon.com ([10.43.164.24]) with mapi id 15.00.1497.006;
 Fri, 28 Aug 2020 11:01:01 +0000
From: "Durrant, Paul" <pdurrant@amazon.co.uk>
To: George Dunlap <George.Dunlap@citrix.com>, Tamas K Lengyel
 <tamas.k.lengyel@gmail.com>, "intel-xen@intel.com" <intel-xen@intel.com>,
 "daniel.kiper@oracle.com" <daniel.kiper@oracle.com>, Roger Pau Monne
 <roger.pau@citrix.com>, Sergey Dyasli <sergey.dyasli@citrix.com>,
 "Christopher Clark" <christopher.w.clark@gmail.com>, Rich Persaud
 <persaur@gmail.com>, Kevin Pearson <kevin.pearson@ortmanconsulting.com>,
 Juergen Gross <jgross@suse.com>, "Ji, John" <john.ji@intel.com>,
 "edgar.iglesias@xilinx.com" <edgar.iglesias@xilinx.com>,
 "robin.randhawa@arm.com" <robin.randhawa@arm.com>, Artem Mygaiev
 <Artem_Mygaiev@epam.com>, Matt Spencer <Matt.Spencer@arm.com>,
 "anastassios.nanos@onapp.com" <anastassios.nanos@onapp.com>, "Stewart
 Hildebrand" <Stewart.Hildebrand@dornerworks.com>, Volodymyr Babchuk
 <volodymyr_babchuk@epam.com>, "mirela.simonovic@aggios.com"
 <mirela.simonovic@aggios.com>, Jarvis Roach <Jarvis.Roach@dornerworks.com>,
 Jeff Kubascik <Jeff.Kubascik@dornerworks.com>, Stefano Stabellini
 <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Ian Jackson
 <Ian.Jackson@citrix.com>, Rian Quinn <rianquinn@gmail.com>, "Daniel P. Smith"
 <dpsmith@apertussolutions.com>,
 =?utf-8?B?4oCL4oCL4oCL4oCL4oCL4oCL4oCLRG91ZyBHb2xkc3RlaW4=?=
 <cardoe@cardoe.com>, "Woodhouse, David" <dwmw@amazon.co.uk>,
 =?utf-8?B?4oCL4oCL4oCL4oCL4oCL4oCL4oCLQW1pdCBTaGFo?= <amit@infradead.org>,
 =?utf-8?B?4oCL4oCL4oCL4oCL4oCL4oCL4oCLVmFyYWQgR2F1dGFt?=
 <varadgautam@gmail.com>, Brian Woods <brian.woods@xilinx.com>, Robert Townley
 <rob.townley@gmail.com>, Bobby Eshleman <bobby.eshleman@gmail.com>, "Olivier
 Lambert" <olivier.lambert@vates.fr>, Andrew Cooper
 <Andrew.Cooper3@citrix.com>, Wei Liu <wl@xen.org>
CC: "open list:X86" <xen-devel@lists.xenproject.org>
Thread-Index: AQHWfSjCftSKszlqLUuptDIy6yV9XKlNWncw
Date: Fri, 28 Aug 2020 11:01:01 +0000
Message-ID: <964f910bb7b9495ab2612eaeedb17e06@EX13D32EUC003.ant.amazon.com>
References: <0CF41EE7-BA9F-4CB6-A431-28AA0A145BE6@citrix.com>
In-Reply-To: <0CF41EE7-BA9F-4CB6-A431-28AA0A145BE6@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.43.166.196]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Precedence: Bulk
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBHZW9yZ2UgRHVubGFwIDxHZW9y
Z2UuRHVubGFwQGNpdHJpeC5jb20+DQo+IFNlbnQ6IDI4IEF1Z3VzdCAyMDIwIDExOjQ4DQo+IFRv
OiBUYW1hcyBLIExlbmd5ZWwgPHRhbWFzLmsubGVuZ3llbEBnbWFpbC5jb20+OyBpbnRlbC14ZW5A
aW50ZWwuY29tOyBkYW5pZWwua2lwZXJAb3JhY2xlLmNvbTsgUm9nZXINCj4gUGF1IE1vbm5lIDxy
b2dlci5wYXVAY2l0cml4LmNvbT47IFNlcmdleSBEeWFzbGkgPHNlcmdleS5keWFzbGlAY2l0cml4
LmNvbT47IENocmlzdG9waGVyIENsYXJrDQo+IDxjaHJpc3RvcGhlci53LmNsYXJrQGdtYWlsLmNv
bT47IFJpY2ggUGVyc2F1ZCA8cGVyc2F1ckBnbWFpbC5jb20+OyBLZXZpbiBQZWFyc29uDQo+IDxr
ZXZpbi5wZWFyc29uQG9ydG1hbmNvbnN1bHRpbmcuY29tPjsgSnVlcmdlbiBHcm9zcyA8amdyb3Nz
QHN1c2UuY29tPjsgRHVycmFudCwgUGF1bA0KPiA8cGR1cnJhbnRAYW1hem9uLmNvLnVrPjsgSmks
IEpvaG4gPGpvaG4uamlAaW50ZWwuY29tPjsgZWRnYXIuaWdsZXNpYXNAeGlsaW54LmNvbTsNCj4g
cm9iaW4ucmFuZGhhd2FAYXJtLmNvbTsgQXJ0ZW0gTXlnYWlldiA8QXJ0ZW1fTXlnYWlldkBlcGFt
LmNvbT47IE1hdHQgU3BlbmNlciA8TWF0dC5TcGVuY2VyQGFybS5jb20+Ow0KPiBhbmFzdGFzc2lv
cy5uYW5vc0BvbmFwcC5jb207IFN0ZXdhcnQgSGlsZGVicmFuZCA8U3Rld2FydC5IaWxkZWJyYW5k
QGRvcm5lcndvcmtzLmNvbT47IFZvbG9keW15cg0KPiBCYWJjaHVrIDx2b2xvZHlteXJfYmFiY2h1
a0BlcGFtLmNvbT47IG1pcmVsYS5zaW1vbm92aWNAYWdnaW9zLmNvbTsgSmFydmlzIFJvYWNoDQo+
IDxKYXJ2aXMuUm9hY2hAZG9ybmVyd29ya3MuY29tPjsgSmVmZiBLdWJhc2NpayA8SmVmZi5LdWJh
c2Npa0Bkb3JuZXJ3b3Jrcy5jb20+OyBTdGVmYW5vIFN0YWJlbGxpbmkNCj4gPHNzdGFiZWxsaW5p
QGtlcm5lbC5vcmc+OyBKdWxpZW4gR3JhbGwgPGp1bGllbkB4ZW4ub3JnPjsgSWFuIEphY2tzb24g
PElhbi5KYWNrc29uQGNpdHJpeC5jb20+OyBSaWFuDQo+IFF1aW5uIDxyaWFucXVpbm5AZ21haWwu
Y29tPjsgRGFuaWVsIFAuIFNtaXRoIDxkcHNtaXRoQGFwZXJ0dXNzb2x1dGlvbnMuY29tPjsg4oCL
4oCL4oCL4oCL4oCL4oCL4oCLRG91ZyBHb2xkc3RlaW4NCj4gPGNhcmRvZUBjYXJkb2UuY29tPjsg
R2VvcmdlIER1bmxhcCA8R2VvcmdlLkR1bmxhcEBjaXRyaXguY29tPjsgV29vZGhvdXNlLCBEYXZp
ZCA8ZHdtd0BhbWF6b24uY28udWs+OyDigIvigIvigIvigIvigIvigIsNCj4gQW1pdCBTaGFoIDxh
bWl0QGluZnJhZGVhZC5vcmc+OyDigIvigIvigIvigIvigIvigIvigItWYXJhZCBHYXV0YW0gPHZh
cmFkZ2F1dGFtQGdtYWlsLmNvbT47IEJyaWFuIFdvb2RzDQo+IDxicmlhbi53b29kc0B4aWxpbngu
Y29tPjsgUm9iZXJ0IFRvd25sZXkgPHJvYi50b3dubGV5QGdtYWlsLmNvbT47IEJvYmJ5IEVzaGxl
bWFuDQo+IDxib2JieS5lc2hsZW1hbkBnbWFpbC5jb20+OyBPbGl2aWVyIExhbWJlcnQgPG9saXZp
ZXIubGFtYmVydEB2YXRlcy5mcj47IEFuZHJldyBDb29wZXINCj4gPEFuZHJldy5Db29wZXIzQGNp
dHJpeC5jb20+OyBXZWkgTGl1IDx3bEB4ZW4ub3JnPg0KPiBDYzogb3BlbiBsaXN0Olg4NiA8eGVu
LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnPg0KPiBTdWJqZWN0OiBbRVhURVJOQUxdIFtBTk5P
VU5DRV0gQ2FsbCBmb3IgYWdlbmRhIGl0ZW1zIGZvciAzIFNlcHRlbWJlciBDb21tdW5pdHkgQ2Fs
bCBAIDE1OjAwIFVUQw0KPiANCj4gQ0FVVElPTjogVGhpcyBlbWFpbCBvcmlnaW5hdGVkIGZyb20g
b3V0c2lkZSBvZiB0aGUgb3JnYW5pemF0aW9uLiBEbyBub3QgY2xpY2sgbGlua3Mgb3Igb3Blbg0K
PiBhdHRhY2htZW50cyB1bmxlc3MgeW91IGNhbiBjb25maXJtIHRoZSBzZW5kZXIgYW5kIGtub3cg
dGhlIGNvbnRlbnQgaXMgc2FmZS4NCj4gDQo+IA0KPiANCj4gSGkgYWxsLA0KPiANCj4gVGhlIHBy
b3Bvc2VkIGFnZW5kYSBpcyBpbiBodHRwczovL2NyeXB0cGFkLmZyL3BhZC8jLzMvcGFkL2VkaXQv
ZjE0N2IwYWVkOGZlMjZhZjcyMWNhM2NkMDA0MjUzNjEvIGFuZA0KPiB5b3UgY2FuIGVkaXQgdG8g
YWRkIGl0ZW1zLiAgQWx0ZXJuYXRpdmVseSwgeW91IGNhbiByZXBseSB0byB0aGlzIG1haWwgZGly
ZWN0bHkuDQoNCkdlb3JnZSwNCg0KSSBkb24ndCBzZWVtIHRvIGJlIGFibGUgdG8gYWNjZXNzIHRo
ZSBkb2MgdmlhIHRoYXQgbGluay4gRG8geW91IG5lZWQgdG8gZ2l2ZSBwZXJtaXNzaW9ucz8NCg0K
ICBQYXVsDQoNCj4gDQo+IEFnZW5kYSBpdGVtcyBhcHByZWNpYXRlZCBhIGZldyBkYXlzIGJlZm9y
ZSB0aGUgY2FsbDogcGxlYXNlIHB1dCB5b3VyIG5hbWUgYmVzaWRlcyBpdGVtcyBpZiB5b3UgZWRp
dA0KPiB0aGUgZG9jdW1lbnQuDQo+IA0KPiBOb3RlIHRoZSBmb2xsb3dpbmcgYWRtaW5pc3RyYXRp
dmUgY29udmVudGlvbnMgZm9yIHRoZSBjYWxsOg0KPiAqIFVubGVzcywgYWdyZWVkIGluIHRoZSBw
ZXJ2aW91cyBtZWV0aW5nIG90aGVyd2lzZSwgdGhlIGNhbGwgaXMgb24gdGhlIDFzdCBUaHVyc2Rh
eSBvZiBlYWNoIG1vbnRoIGF0DQo+IDE2MDAgQnJpdGlzaCBUaW1lIChlaXRoZXIgR01UIG9yIEJT
VCkNCj4gKiBJIHVzdWFsbHkgc2VuZCBvdXQgYSBtZWV0aW5nIHJlbWluZGVyIGEgZmV3IGRheXMg
YmVmb3JlIHdpdGggYSBwcm92aXNpb25hbCBhZ2VuZGENCj4gDQo+ICogSWYgeW91IHdhbnQgdG8g
YmUgQ0MnZWQgcGxlYXNlIGFkZCBvciByZW1vdmUgeW91cnNlbGYgZnJvbSB0aGUgc2lnbi11cC1z
aGVldCBhdA0KPiBodHRwczovL2NyeXB0cGFkLmZyL3BhZC8jLzIvcGFkL2VkaXQvRDl2R3ppaFB4
eEFPZTZSRlB6MHNSQ2YrLw0KPiANCj4gQmVzdCBSZWdhcmRzDQo+IEdlb3JnZQ0KPiANCj4gDQo+
ID09IERpYWwtaW4gSW5mb3JtYXRpb24gPT0NCj4gIyMgTWVldGluZyB0aW1lDQo+IDE1OjAwIC0g
MTY6MDAgVVRDIChkdXJpbmcgQlNUKQ0KPiBGdXJ0aGVyIEludGVybmF0aW9uYWwgbWVldGluZyB0
aW1lczoNCj4gaHR0cHM6Ly93d3cudGltZWFuZGRhdGUuY29tL3dvcmxkY2xvY2svbWVldGluZ2Rl
dGFpbHMuaHRtbD95ZWFyPTIwMjAmbW9udGg9NSZkYXk9NyZob3VyPTE1Jm1pbj0wJnNlYz0wDQo+
ICZwMT0xMjM0JnAyPTM3JnAzPTIyNCZwND0xNzkNCj4gDQo+IA0KPiAjIyBEaWFsIGluIGRldGFp
bHMNCj4gV2ViOiBodHRwczovL3d3dy5nb3RvbWVldC5tZS9HZW9yZ2VEdW5sYXANCj4gDQo+IFlv
dSBjYW4gYWxzbyBkaWFsIGluIHVzaW5nIHlvdXIgcGhvbmUuDQo+IEFjY2VzcyBDb2RlOiAxNjgt
NjgyLTEwOQ0KPiANCj4gQ2hpbmEgKFRvbGwgRnJlZSk6IDQwMDggODExMDg0DQo+IEdlcm1hbnk6
ICs0OSA2OTIgNTczNiA3MzE3DQo+IFBvbGFuZCAoVG9sbCBGcmVlKTogMDAgODAwIDExMjQ3NTkN
Cj4gVWtyYWluZSAoVG9sbCBGcmVlKTogMCA4MDAgNTAgMTczMw0KPiBVbml0ZWQgS2luZ2RvbTog
KzQ0IDMzMCAyMjEgMDA4OA0KPiBVbml0ZWQgU3RhdGVzOiArMSAoNTcxKSAzMTctMzEyOQ0KPiBT
cGFpbjogKzM0IDkzMiA3NSAyMDA0DQo+IA0KPiANCj4gTW9yZSBwaG9uZSBudW1iZXJzDQo+IEF1
c3RyYWxpYTogKzYxIDIgOTA4NyAzNjA0DQo+IEF1c3RyaWE6ICs0MyA3IDIwODEgNTQyNw0KPiBB
cmdlbnRpbmEgKFRvbGwgRnJlZSk6IDAgODAwIDQ0NCAzMzc1DQo+IEJhaHJhaW4gKFRvbGwgRnJl
ZSk6IDgwMCA4MSAxMTENCj4gQmVsYXJ1cyAoVG9sbCBGcmVlKTogOCA4MjAgMDAxMSAwNDAwDQo+
IEJlbGdpdW06ICszMiAyOCA5MyA3MDE4DQo+IEJyYXppbCAoVG9sbCBGcmVlKTogMCA4MDAgMDQ3
IDQ5MDYNCj4gQnVsZ2FyaWEgKFRvbGwgRnJlZSk6IDAwODAwIDEyMCA0NDE3DQo+IENhbmFkYTog
KzEgKDY0NykgNDk3LTkzOTENCj4gQ2hpbGUgKFRvbGwgRnJlZSk6IDgwMCAzOTUgMTUwDQo+IENv
bG9tYmlhIChUb2xsIEZyZWUpOiAwMSA4MDAgNTE4IDQ0ODMNCj4gQ3plY2ggUmVwdWJsaWMgKFRv
bGwgRnJlZSk6IDgwMCA1MDA0NDgNCj4gRGVubWFyazogKzQ1IDMyIDcyIDAzIDgyDQo+IEZpbmxh
bmQ6ICszNTggOTIzIDE3IDA1NjgNCj4gRnJhbmNlOiArMzMgMTcwIDk1MCA1OTQNCj4gR3JlZWNl
IChUb2xsIEZyZWUpOiAwMCA4MDAgNDQxNCAzODM4DQo+IEhvbmcgS29uZyAoVG9sbCBGcmVlKTog
MzA3MTMxNjk5MDYtODg2LTk2NQ0KPiBIdW5nYXJ5IChUb2xsIEZyZWUpOiAoMDYpIDgwIDk4NiAy
NTUNCj4gSWNlbGFuZCAoVG9sbCBGcmVlKTogODAwIDcyMDQNCj4gSW5kaWEgKFRvbGwgRnJlZSk6
IDE4MDAyNjY5MjcyDQo+IEluZG9uZXNpYSAoVG9sbCBGcmVlKTogMDA3IDgwMyAwMjAgNTM3NQ0K
PiBJcmVsYW5kOiArMzUzIDE1IDM2MCA3MjgNCj4gSXNyYWVsIChUb2xsIEZyZWUpOiAxIDgwOSA0
NTQgODMwDQo+IEl0YWx5OiArMzkgMCAyNDcgOTIgMTMgMDENCj4gSmFwYW4gKFRvbGwgRnJlZSk6
IDAgMTIwIDY2MyA4MDANCj4gS29yZWEsIFJlcHVibGljIG9mIChUb2xsIEZyZWUpOiAwMDc5OCAx
NCAyMDcgNDkxNA0KPiBMdXhlbWJvdXJnIChUb2xsIEZyZWUpOiA4MDAgODUxNTgNCj4gTWFsYXlz
aWEgKFRvbGwgRnJlZSk6IDEgODAwIDgxIDY4NTQNCj4gTWV4aWNvIChUb2xsIEZyZWUpOiAwMSA4
MDAgNTIyIDExMzMNCj4gTmV0aGVybGFuZHM6ICszMSAyMDcgOTQxIDM3Nw0KPiBOZXcgWmVhbGFu
ZDogKzY0IDkgMjgwIDYzMDINCj4gTm9yd2F5OiArNDcgMjEgOTMgMzcgNTENCj4gUGFuYW1hIChU
b2xsIEZyZWUpOiAwMCA4MDAgMjI2IDc5MjgNCj4gUGVydSAoVG9sbCBGcmVlKTogMCA4MDAgNzcw
MjMNCj4gUGhpbGlwcGluZXMgKFRvbGwgRnJlZSk6IDEgODAwIDExMTAgMTY2MQ0KPiBQb3J0dWdh
bCAoVG9sbCBGcmVlKTogODAwIDgxOSA1NzUNCj4gUm9tYW5pYSAoVG9sbCBGcmVlKTogMCA4MDAg
NDEwIDAyOQ0KPiBSdXNzaWFuIEZlZGVyYXRpb24gKFRvbGwgRnJlZSk6IDggODAwIDEwMCA2MjAz
DQo+IFNhdWRpIEFyYWJpYSAoVG9sbCBGcmVlKTogODAwIDg0NCAzNjMzDQo+IFNpbmdhcG9yZSAo
VG9sbCBGcmVlKTogMTgwMDcyMzEzMjMNCj4gU291dGggQWZyaWNhIChUb2xsIEZyZWUpOiAwIDgw
MCA1NTUgNDQ3DQo+IFN3ZWRlbjogKzQ2IDg1MyA1MjcgODI3DQo+IFN3aXR6ZXJsYW5kOiArNDEg
MjI1IDQ1OTkgNzgNCj4gVGFpd2FuIChUb2xsIEZyZWUpOiAwIDgwMCA2NjYgODU0DQo+IFRoYWls
YW5kIChUb2xsIEZyZWUpOiAwMDEgODAwIDAxMSAwMjMNCj4gVHVya2V5IChUb2xsIEZyZWUpOiAw
MCA4MDAgNDQ4OCAyMzY4Mw0KPiBVbml0ZWQgQXJhYiBFbWlyYXRlcyAoVG9sbCBGcmVlKTogODAw
IDA0NCA0MDQzOQ0KPiBVcnVndWF5IChUb2xsIEZyZWUpOiAwMDA0IDAxOSAxMDE4DQo+IFZpZXQg
TmFtIChUb2xsIEZyZWUpOiAxMjIgODAgNDgxDQo+IOKAi+KAi+KAi+KAi+KAi+KAi+KAiw0KPiAN
Cj4gRmlyc3QgR29Ub01lZXRpbmc/IExldCdzIGRvIGEgcXVpY2sgc3lzdGVtIGNoZWNrOg0KPiAN
Cj4gaHR0cHM6Ly9saW5rLmdvdG9tZWV0aW5nLmNvbS9zeXN0ZW0tY2hlY2sNCg==

