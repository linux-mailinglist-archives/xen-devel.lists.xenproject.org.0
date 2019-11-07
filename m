Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A6B71F2F2F
	for <lists+xen-devel@lfdr.de>; Thu,  7 Nov 2019 14:26:26 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iShm0-0004qF-A2; Thu, 07 Nov 2019 13:24:28 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Y2MP=Y7=citrix.com=lars.kurth@srs-us1.protection.inumbo.net>)
 id 1iShlz-0004qA-3V
 for xen-devel@lists.xenproject.org; Thu, 07 Nov 2019 13:24:27 +0000
X-Inumbo-ID: eaece288-0161-11ea-a1c7-12813bfff9fa
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id eaece288-0161-11ea-a1c7-12813bfff9fa;
 Thu, 07 Nov 2019 13:24:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1573133066;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=+m/ngolgTd/gYlTDqwdVs8tJNp1GI9a8r22jZ6WEpYw=;
 b=Gq3EeYjqPcWPTtG0IkRuCc3xghES/ntm2FObmXY8+8+MSjbK3jkpJf4a
 3R+mAhrGdqCzJNjKIbhAaXfZLhuGd+IxktFR6eiP3VCo3DigRSuAkYYVf
 G4YP21mpxbLVPJnGUQXw5/meVy7foTVYTnf+1L7IZ/tVDpGQ8uw4bt38X w=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=lars.kurth@citrix.com;
 spf=Pass smtp.mailfrom=lars.kurth@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 lars.kurth@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="lars.kurth@citrix.com";
 x-sender="lars.kurth@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 lars.kurth@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="lars.kurth@citrix.com";
 x-sender="lars.kurth@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="lars.kurth@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: lMh4JHkiV7Kz82sspZHsWV1NVSSofBdJ4tMMNqO2sHXOYNN31GWCrHy/qTn87HKtNEGyC246BR
 uzlpADSSIoVsV/P5m03Qz89t9SejveOIKlEqDB6rrEn8x+WiqBZBPTe8QUA4U4gq3kZkMdcvCx
 6iZwHnYAs+KHgh2RZidohMPH+7w+tfkjinlK9ou7iIS3LwN0K3rUyD9tVqjqAse6UStSfuU1AW
 AUVousBK30qyovPVouJmmgj0U0UnTPVAURtId18SS54IoCtv5FONiXhGtKd5TjnSWO5sGQ3Y+z
 I/M=
X-SBRS: 2.7
X-MesageID: 7991281
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.68,278,1569297600"; 
   d="scan'208";a="7991281"
From: Lars Kurth <lars.kurth@citrix.com>
To: xen-devel <xen-devel@lists.xenproject.org>
Thread-Topic: Community Call: Call for Agenda Items and call details for Nov
 7, 15:00 - 16:00 UTC
Thread-Index: AQHVkwQx8BA8PhnrqkSa9mHgVmP4Fqd/Qe8A
Date: Thu, 7 Nov 2019 13:24:19 +0000
Message-ID: <C508AAE6-5856-4850-888F-BB4DAA3A3ABB@citrix.com>
References: <5FBE7F80-B1A8-4545-A77A-3EDE1C7418E4@citrix.com>
In-Reply-To: <5FBE7F80-B1A8-4545-A77A-3EDE1C7418E4@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Microsoft-MacOutlook/10.10.f.191014
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
Content-ID: <5A3983D588BF364288F57B76D58A4396@citrix.com>
MIME-Version: 1.0
Subject: Re: [Xen-devel] Community Call: Call for Agenda Items and call
 details for Nov 7, 15:00 - 16:00 UTC
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
Cc: Rian Quinn <rianquinn@gmail.com>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 Doug Goldstein <cardoe@cardoe.com>, Brian
 Woods <brian.woods@xilinx.com>, Rich Persaud <persaur@gmail.com>,
 "anastassios.nanos@onapp.com" <anastassios.nanos@onapp.com>,
 "mirela.simonovic@aggios.com" <mirela.simonovic@aggios.com>,
 "edgar.iglesias@xilinx.com" <edgar.iglesias@xilinx.com>, "Ji,
 John" <john.ji@intel.com>, "robin.randhawa@arm.com" <robin.randhawa@arm.com>,
 "daniel.kiper@oracle.com" <daniel.kiper@oracle.com>,
 Amit Shah <amit@infradead.org>, Matt
 Spencer <Matt.Spencer@arm.com>, Artem Mygaiev <Artem_Mygaiev@epam.com>,
 Varad Gautam <varadgautam@gmail.com>,
 Tamas K Lengyel <tamas.k.lengyel@gmail.com>,
 Christopher Clark <christopher.w.clark@gmail.com>, George
 Dunlap <George.Dunlap@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Ian Jackson <Ian.Jackson@citrix.com>,
 "vfachin@de.adit-jv.com" <vfachin@de.adit-jv.com>,
 "lambert.olivier@gmail.com" <lambert.olivier@gmail.com>,
 "intel-xen@intel.com" <intel-xen@intel.com>,
 Jarvis Roach <Jarvis.Roach@dornerworks.com>, Juergen
 Gross <jgross@suse.com>, Sergey Dyasli <sergey.dyasli@citrix.com>,
 =?utf-8?B?UGF1bCBEdXJyYW50wqA=?= <pdurrant@amazon.com>,
 Julien Grall <julien.grall@arm.com>,
 Jeff Kubascik <Jeff.Kubascik@dornerworks.com>, "Natarajan, 
 Janakarajan" <jnataraj@amd.com>,
 Stewart Hildebrand <Stewart.Hildebrand@dornerworks.com>,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
 David Woodhouse <dwmw@amazon.co.uk>, Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgYWxsLA0KDQpxdWljayByZW1pbmRlciByZSBhZ2VuZGEgaXRlbXMuIFdoYXQgSSBoYXZlIHNv
IGZhciBpcyBhdCBodHRwczovL2NyeXB0cGFkLmZyL3BhZC8jLzIvcGFkL2VkaXQvU2tlVStaNUo5
V0lJVTlac1hsb2ppWGNRLyANCg0KQy4xKSBBbnkgbW9yZSA0LjEzIGNvb3JkaW5hdGlvbiAoSnVl
cmdlbikNCkMuMikgVm9sdW50ZWVycy9zdWdnZXN0aW9ucyBmb3IgUmVsZWFzZSBNYW5hZ2VycyBm
b3IgNC4xMyAoTGFycyAvIEp1ZXJnZW4pDQpDLjMpIDQuMTMgUmVsZWFzZSBOb3RlcyAvIEJsb2cg
UG9zdCAvIEZlYXR1cmUgTGlzdCAtIG5lZWRzIHJldmlldyAoTGFycykNClNlZcKgaHR0cHM6Ly9k
b2NzLmdvb2dsZS5jb20vZG9jdW1lbnQvZC8xRXBpZ3Z4RHplb2MxZE9NRndROWl0RFhZNHZZN252
eFBpTEdjTlFRbVgyOC9lZGl0P3VzcD1zaGFyaW5nDQoNCkFPQg0KMSkgVHJhdmVsIGFuZCBkaXNj
dXNzaW9ucw0KUmljaCBQZXJzYXVkLMKgQ2hyaXN0b3BoZXIgQ2xhcmsgJiBEYW5pZWwgU21pdGgg
d2lsbCBiZSBpbiBDYW1icmlkZ2UgRGVjIDEwIHBtICYgMTEgYW3CoA0KRGlzY3Vzc2lvbnMgYXJl
IHBsYW5uZWQgYXJvdW5kIGEgbnVtYmVyIG9mIHRvcGljcyBzdWNoIGFzIHN0YXRlIG9mIFhTTSwg
RG9tQsKgcHJvcG9zYWwgYXMgYSBzZWN1cmUgbWVhbnMgdG8gc3RhcnQgYW4gTDAvTDEgY29uZmln
dXJhdGlvbiwgS0NPTkZJRyBmb3IgTDAgdmVyc2lvbiBvZiBYZW4sIGV0Yy4NCkNpdHJpeCB3aWxs
IGhvc3QsIGJ1dCBvdGhlcnMgYXJlIHdlbGNvbWUgdG8gam9pbiAocGxlYXNlIGNvbnRhY3QgTGFy
cyBmb3IgbG9naXN0aWNzKQ0KDQpGZWVsIGZyZWUgdG8gcmVxdWVzdCBhZGRpdGlvbmFsIGl0ZW1z
DQoNClJlZ2FyZHMNCkxhcnMNCg0K77u/T24gMDQvMTEvMjAxOSwgMDU6MzcsICJMYXJzIEt1cnRo
IiA8bGFycy5rdXJ0aEBjaXRyaXguY29tPiB3cm90ZToNCg0KICAgIERlYXIgY29tbXVuaXR5IG1l
bWJlcnMsDQogICAgIA0KICAgIHBsZWFzZSBzZW5kIG1lIGFnZW5kYSBpdGVtcyBmb3IgbmV4dCB3
ZWVr4oCZcyBjb21tdW5pdHkgY2FsbC4gQSBkcmFmdCBhZ2VuZGEgaXMgYXQgaHR0cHM6Ly9jcnlw
dHBhZC5mci9wYWQvIy8yL3BhZC9lZGl0L1NrZVUrWjVKOVdJSVU5WnNYbG9qaVhjUS8NCiAgICBQ
bGVhc2UgYWRkIGFnZW5kYSBpdGVtcyB0byB0aGUgZG9jdW1lbnQgb3IgcmVwbHkgdG8gdGhpcyBl
LW1haWwNCiAgICBOb3RlIHRoYXQgSSBhbSBvbiBQVE8gdG9kYXkgYW5kIHRvbW9ycm93DQogICAg
IA0KICAgIExhc3QgbW9udGjigJlzIG1pbnV0ZXMgYXJlIGF0IGh0dHBzOi8vY3J5cHRwYWQuZnIv
cGFkLyMvMi9wYWQvZWRpdC80RkdFdzgxZmxQVWlpdmtqa3V2UUotQ0svDQogICAgIA0KICAgIEJl
c3QgUmVnYXJkcw0KICAgIExhcnMNCiAgICANCiAgICAjIyBNZWV0aW5nIHRpbWUgKHBsZWFzZSBk
b3VibGUgY2hlY2sgdGhlIHRpbWVzDQogICAgMTU6MDAgLSAxNjowMCBVVEMNCiAgICAwNzowMCAt
IDA4OjAwIFBTVCAoU2FuIEZyYW5jaXNjbykgLSBzb3JyeSBmb3IgdGhlIGVhcmx5IHRpbWUgc2xv
dC4gSWYgdGhpcyBpcyBhIHByb2JsZW0sIGxldCdzIGRpc2N1c3MgYXQgdGhlIGNhbGwNCiAgICAx
MDowMCAtIDExOjAwIEVTVCAoTmV3IFlvcmspDQogICAgMTU6MDAgLSAxNjowMCBGTVQgKExvbmRv
bikNCiAgICAxNjowMCAtIDE3OjAwIENFVCAoQmVybGluKQ0KICAgIDIzOjAwIC0gMjI6MDAgQ1NU
IChCZWlqaW5nKQ0KICAgIEZ1cnRoZXIgSW50ZXJuYXRpb25hbCBtZWV0aW5nIHRpbWVzOiBodHRw
czovL3d3dy50aW1lYW5kZGF0ZS5jb20vd29ybGRjbG9jay9tZWV0aW5nZGV0YWlscy5odG1sP3ll
YXI9MjAxOCZtb250aD0xMSZkYXk9NyZob3VyPTE1Jm1pbj0wJnNlYz0wJnAxPTIyNCZwMj0yNCZw
Mz0xNzkmcDQ9MTM2JnA1PTM3JnA2PTMzDQogICAgDQogICAgIyMgRGlhbCBpbiBkZXRhaWxzDQog
ICAgV2ViOiBodHRwczovL3d3dy5nb3RvbWVldC5tZS9sYXJza3VydGgNCiAgICANCiAgICBZb3Ug
Y2FuIGFsc28gZGlhbCBpbiB1c2luZyB5b3VyIHBob25lLg0KICAgIEFjY2VzcyBDb2RlOiA5MDYt
ODg2LTk2NQ0KICAgIA0KICAgIENoaW5hIChUb2xsIEZyZWUpOiA0MDA4IDgxMTA4NA0KICAgIEdl
cm1hbnk6ICs0OSA2OTIgNTczNiA3MzE3DQogICAgUG9sYW5kIChUb2xsIEZyZWUpOiAwMCA4MDAg
MTEyNDc1OQ0KICAgIFVuaXRlZCBLaW5nZG9tOiArNDQgMzMwIDIyMSAwMDg4DQogICAgVW5pdGVk
IFN0YXRlczogKzEgKDU3MSkgMzE3LTMxMjkNCiAgICANCiAgICBNb3JlIHBob25lIG51bWJlcnMN
CiAgICBBdXN0cmFsaWE6ICs2MSAyIDkwODcgMzYwNA0KICAgIEF1c3RyaWE6ICs0MyA3IDIwODEg
NTQyNw0KICAgIEFyZ2VudGluYSAoVG9sbCBGcmVlKTogMCA4MDAgNDQ0IDMzNzUNCiAgICBCYWhy
YWluIChUb2xsIEZyZWUpOiA4MDAgODEgMTExDQogICAgQmVsYXJ1cyAoVG9sbCBGcmVlKTogOCA4
MjAgMDAxMSAwNDAwDQogICAgQmVsZ2l1bTogKzMyIDI4IDkzIDcwMTgNCiAgICBCcmF6aWwgKFRv
bGwgRnJlZSk6IDAgODAwIDA0NyA0OTA2DQogICAgQnVsZ2FyaWEgKFRvbGwgRnJlZSk6IDAwODAw
IDEyMCA0NDE3DQogICAgQ2FuYWRhOiArMSAoNjQ3KSA0OTctOTM5MQ0KICAgIENoaWxlIChUb2xs
IEZyZWUpOiA4MDAgMzk1IDE1MA0KICAgIENvbG9tYmlhIChUb2xsIEZyZWUpOiAwMSA4MDAgNTE4
IDQ0ODMNCiAgICBDemVjaCBSZXB1YmxpYyAoVG9sbCBGcmVlKTogODAwIDUwMDQ0OA0KICAgIERl
bm1hcms6ICs0NSAzMiA3MiAwMyA4Mg0KICAgIEZpbmxhbmQ6ICszNTggOTIzIDE3IDA1NjgNCiAg
ICBGcmFuY2U6ICszMyAxNzAgOTUwIDU5NA0KICAgIEdyZWVjZSAoVG9sbCBGcmVlKTogMDAgODAw
IDQ0MTQgMzgzOA0KICAgIEhvbmcgS29uZyAoVG9sbCBGcmVlKTogMzA3MTMxNjkNCiAgICBIdW5n
YXJ5IChUb2xsIEZyZWUpOiAoMDYpIDgwIDk4NiAyNTUNCiAgICBJY2VsYW5kIChUb2xsIEZyZWUp
OiA4MDAgNzIwNA0KICAgIEluZGlhIChUb2xsIEZyZWUpOiAxODAwMjY2OTI3Mg0KICAgIEluZG9u
ZXNpYSAoVG9sbCBGcmVlKTogMDA3IDgwMyAwMjAgNTM3NQ0KICAgIElyZWxhbmQ6ICszNTMgMTUg
MzYwIDcyOA0KICAgIElzcmFlbCAoVG9sbCBGcmVlKTogMSA4MDkgNDU0IDgzMA0KICAgIEl0YWx5
OiArMzkgMCAyNDcgOTIgMTMgMDENCiAgICBKYXBhbiAoVG9sbCBGcmVlKTogMCAxMjAgNjYzIDgw
MA0KICAgIEtvcmVhLCBSZXB1YmxpYyBvZiAoVG9sbCBGcmVlKTogMDA3OTggMTQgMjA3IDQ5MTQN
CiAgICBMdXhlbWJvdXJnIChUb2xsIEZyZWUpOiA4MDAgODUxNTgNCiAgICBNYWxheXNpYSAoVG9s
bCBGcmVlKTogMSA4MDAgODEgNjg1NA0KICAgIE1leGljbyAoVG9sbCBGcmVlKTogMDEgODAwIDUy
MiAxMTMzDQogICAgTmV0aGVybGFuZHM6ICszMSAyMDcgOTQxIDM3Nw0KICAgIE5ldyBaZWFsYW5k
OiArNjQgOSAyODAgNjMwMg0KICAgIE5vcndheTogKzQ3IDIxIDkzIDM3IDUxDQogICAgUGFuYW1h
IChUb2xsIEZyZWUpOiAwMCA4MDAgMjI2IDc5MjgNCiAgICBQZXJ1IChUb2xsIEZyZWUpOiAwIDgw
MCA3NzAyMw0KICAgIFBoaWxpcHBpbmVzIChUb2xsIEZyZWUpOiAxIDgwMCAxMTEwIDE2NjENCiAg
ICBQb3J0dWdhbCAoVG9sbCBGcmVlKTogODAwIDgxOSA1NzUNCiAgICBSb21hbmlhIChUb2xsIEZy
ZWUpOiAwIDgwMCA0MTAgMDI5DQogICAgUnVzc2lhbiBGZWRlcmF0aW9uIChUb2xsIEZyZWUpOiA4
IDgwMCAxMDAgNjIwMw0KICAgIFNhdWRpIEFyYWJpYSAoVG9sbCBGcmVlKTogODAwIDg0NCAzNjMz
DQogICAgU2luZ2Fwb3JlIChUb2xsIEZyZWUpOiAxODAwNzIzMTMyMw0KICAgIFNvdXRoIEFmcmlj
YSAoVG9sbCBGcmVlKTogMCA4MDAgNTU1IDQ0Nw0KICAgIFNwYWluOiArMzQgOTMyIDc1IDIwMDQN
CiAgICBTd2VkZW46ICs0NiA4NTMgNTI3IDgyNw0KICAgIFN3aXR6ZXJsYW5kOiArNDEgMjI1IDQ1
OTkgNzgNCiAgICBUYWl3YW4gKFRvbGwgRnJlZSk6IDAgODAwIDY2NiA4NTQNCiAgICBUaGFpbGFu
ZCAoVG9sbCBGcmVlKTogMDAxIDgwMCAwMTEgMDIzDQogICAgVHVya2V5IChUb2xsIEZyZWUpOiAw
MCA4MDAgNDQ4OCAyMzY4Mw0KICAgIFVrcmFpbmUgKFRvbGwgRnJlZSk6IDAgODAwIDUwIDE3MzMN
CiAgICBVbml0ZWQgQXJhYiBFbWlyYXRlcyAoVG9sbCBGcmVlKTogODAwIDA0NCA0MDQzOQ0KICAg
IFVydWd1YXkgKFRvbGwgRnJlZSk6IDAwMDQgMDE5IDEwMTgNCiAgICBWaWV0IE5hbSAoVG9sbCBG
cmVlKTogMTIyIDgwIDQ4MQ0KICAgIA0KICAgIEZpcnN0IEdvVG9NZWV0aW5nPyBMZXQncyBkbyBh
IHF1aWNrIHN5c3RlbSBjaGVjazoNCiAgICBodHRwczovL2xpbmsuZ290b21lZXRpbmcuY29tL3N5
c3RlbS1jaGVjaw0KICAgIA0KICAgIA0KICAgIA0KDQpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8veGVuLWRldmVs
