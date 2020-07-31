Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AF52C234622
	for <lists+xen-devel@lfdr.de>; Fri, 31 Jul 2020 14:51:15 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k1UVC-0001Fy-49; Fri, 31 Jul 2020 12:51:10 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GLoN=BK=citrix.com=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1k1UVA-0001Fk-LD
 for xen-devel@lists.xenproject.org; Fri, 31 Jul 2020 12:51:08 +0000
X-Inumbo-ID: 804b01ce-d32c-11ea-8e30-bc764e2007e4
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 804b01ce-d32c-11ea-8e30-bc764e2007e4;
 Fri, 31 Jul 2020 12:51:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1596199867;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=AWD6VIBU2O2rySUu4GtSw+XVYuDNY3yDptplia+3xUU=;
 b=aoXL3ly1kBc7dGw/+YMUUMav/csBTCjOo+AWDNwbckyl8KekZa+s+rCJ
 TSGd4192OzsCvdhhK5mwWLFKWjGKpOqE2UZo1t2QWl+sMFw1kWaeCF3v+
 FKl3kcHd4IoEBxOnp/ReUZO2RPa7VI/Y2X9Rd5oCDbyIHyJ86fEv3jQ5L o=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: k+cm+PS9Xt9tBzpmVhGXo87klSehMgbvJb+C83jGjZnOUcOut2TiYj+NFMqlsIoXjC3AYbbSDX
 z+qcIeNdptJ5jCVMXlT+vGXtID6NpMo+FBPHEFtGPDoFLCvAelfVDyWxQ3V56oTfzKSXdlQVBC
 R/T5zyP01feIJTu6VH/Hl6C8TIsfoeYapHxAP0QQmmvC6uJH98wHzkKpEch04Zlm+aTuqljUyj
 e4N607P+hGjtipCaS+TDFfK6zenE67DT4F65QRQuxNtN8iQo+3LVz+5Npk0ys0td8Aggs5uCS0
 ro4=
X-SBRS: 3.7
X-MesageID: 23946838
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.75,418,1589256000"; d="scan'208";a="23946838"
From: George Dunlap <George.Dunlap@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Subject: Re: kernel-doc and xen.git
Thread-Topic: kernel-doc and xen.git
Thread-Index: AQHWZhCpvoHj9qYsqUS/BmcPWnpp8KkhbiaAgAAWsIA=
Date: Fri, 31 Jul 2020 12:51:03 +0000
Message-ID: <F09D32F7-4826-421B-99A6-3E94756FFCEF@citrix.com>
References: <alpine.DEB.2.21.2007291644330.1767@sstabellini-ThinkPad-T480s>
 <9421ec73-1ec0-844f-0014-bd5a36a4036f@suse.com>
In-Reply-To: <9421ec73-1ec0-844f-0014-bd5a36a4036f@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3608.80.23.2.2)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
Content-Type: text/plain; charset="utf-8"
Content-ID: <5C281D85B9670B4694BB3759D2D24023@citrix.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "committers@xenproject.org" <committers@xenproject.org>,
 "Bertrand.Marquis@arm.com" <Bertrand.Marquis@arm.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

DQoNCj4gT24gSnVsIDMxLCAyMDIwLCBhdCAxMjoyOSBQTSwgSmFuIEJldWxpY2ggPGpiZXVsaWNo
QHN1c2UuY29tPiB3cm90ZToNCj4gDQo+IE9uIDMwLjA3LjIwMjAgMDM6MjcsIFN0ZWZhbm8gU3Rh
YmVsbGluaSB3cm90ZToNCj4+IEhpIGFsbCwNCj4+IA0KPj4gSSB3b3VsZCBsaWtlIHRvIGFzayBm
b3IgeW91ciBmZWVkYmFjayBvbiB0aGUgYWRvcHRpb24gb2YgdGhlIGtlcm5lbC1kb2MNCj4+IGZv
cm1hdCBmb3IgaW4tY29kZSBjb21tZW50cy4NCj4+IA0KPj4gSW4gdGhlIEZ1U2EgU0lHIHdlIGhh
dmUgc3RhcnRlZCBsb29raW5nIGludG8gRnVTYSBkb2N1bWVudHMgZm9yIFhlbi4gT25lDQo+PiBv
ZiB0aGUgdGhpbmdzIHdlIGFyZSBpbnZlc3RpZ2F0aW5nIGFyZSB3YXlzIHRvIGxpbmsgdGhlc2Ug
ZG9jdW1lbnRzIHRvDQo+PiBpbi1jb2RlIGNvbW1lbnRzIGluIHhlbi5naXQgYW5kIHZpY2UgdmVy
c2EuDQo+PiANCj4+IEluIHRoaXMgY29udGV4dCwgQW5kcmV3IENvb3BlciBzdWdnZXN0ZWQgdG8g
aGF2ZSBhIGxvb2sgYXQgImtlcm5lbC1kb2MiDQo+PiBbMV0gZHVyaW5nIG9uZSBvZiB0aGUgdmly
dHVhbCBiZWVyIHNlc3Npb25zIGF0IHRoZSBsYXN0IFhlbiBTdW1taXQuDQo+PiANCj4+IEkgZGlk
IGdpdmUgYSBsb29rIGF0IGtlcm5lbC1kb2MgYW5kIGl0IGlzIHZlcnkgcHJvbWlzaW5nLiBrZXJu
ZWwtZG9jIGlzDQo+PiBhIHNjcmlwdCB0aGF0IGNhbiBnZW5lcmF0ZSBuaWNlIHJzdCB0ZXh0IGRv
Y3VtZW50cyBmcm9tIGluLWNvZGUNCj4+IGNvbW1lbnRzLiAoVGhlIGdlbmVyYXRlZCByc3QgZmls
ZXMgY2FuIHRoZW4gYmUgdXNlZCBhcyBpbnB1dCBmb3Igc3BoaW54DQo+PiB0byBnZW5lcmF0ZSBo
dG1sIGRvY3MuKSBUaGUgY29tbWVudCBzeW50YXggWzJdIGlzIHNpbXBsZSBhbmQgc2ltaWxhciB0
bw0KPj4gRG94eWdlbjoNCj4+IA0KPj4gICAgLyoqDQo+PiAgICAgKiBmdW5jdGlvbl9uYW1lKCkg
LSBCcmllZiBkZXNjcmlwdGlvbiBvZiBmdW5jdGlvbi4NCj4+ICAgICAqIEBhcmcxOiBEZXNjcmli
ZSB0aGUgZmlyc3QgYXJndW1lbnQuDQo+PiAgICAgKiBAYXJnMjogRGVzY3JpYmUgdGhlIHNlY29u
ZCBhcmd1bWVudC4NCj4+ICAgICAqICAgICAgICBPbmUgY2FuIHByb3ZpZGUgbXVsdGlwbGUgbGlu
ZSBkZXNjcmlwdGlvbnMNCj4+ICAgICAqICAgICAgICBmb3IgYXJndW1lbnRzLg0KPj4gICAgICov
DQo+PiANCj4+IGtlcm5lbC1kb2MgaXMgYWN0dWFsbHkgYmV0dGVyIHRoYW4gRG94eWdlbiBiZWNh
dXNlIGl0IGlzIGEgbXVjaCBzaW1wbGVyDQo+PiB0b29sLCBvbmUgd2UgY291bGQgY3VzdG9taXpl
IHRvIG91ciBuZWVkcyBhbmQgd2l0aCBwcmVkaWN0YWJsZSBvdXRwdXQuDQo+PiBTcGVjaWZpY2Fs
bHksIHdlIGNvdWxkIGFkZCB0aGUgdGFnZ2luZywgbnVtYmVyaW5nLCBhbmQgcmVmZXJlbmNpbmcN
Cj4+IHJlcXVpcmVkIGJ5IEZ1U2EgcmVxdWlyZW1lbnQgZG9jdW1lbnRzLg0KPj4gDQo+PiBJIHdv
dWxkIGxpa2UgeW91ciBmZWVkYmFjayBvbiB3aGV0aGVyIGl0IHdvdWxkIGJlIGdvb2QgdG8gc3Rh
cnQNCj4+IGNvbnZlcnRpbmcgeGVuLmdpdCBpbi1jb2RlIGNvbW1lbnRzIHRvIHRoZSBrZXJuZWwt
ZG9jIGZvcm1hdCBzbyB0aGF0DQo+PiBwcm9wZXIgZG9jdW1lbnRzIGNhbiBiZSBnZW5lcmF0ZWQg
b3V0IG9mIHRoZW0uIE9uZSBkYXkgd2UgY291bGQgaW1wb3J0DQo+PiBrZXJuZWwtZG9jIGludG8g
eGVuLmdpdC9zY3JpcHRzIGFuZCB1c2UgaXQgdG8gZ2VuZXJhdGUgYSBzZXQgb2YgaHRtbA0KPj4g
ZG9jdW1lbnRzIHZpYSBzcGhpbnguDQo+IA0KPiBIb3cgZmFyIGlzIHRoaXMgaW50ZW5kZWQgdG8g
Z28/IFRoZSBleGFtcGxlIGlzIGRlc2NyaXB0aW9uIG9mIGENCj4gZnVuY3Rpb24ncyBwYXJhbWV0
ZXJzLCB3aGljaCBpcyBkZWZpbml0ZWx5IGZpbmUgKGFsYmVpdCBJIHdvbmRlcg0KPiBpZiB0aGVy
ZSdzIGEgaGlkZGVuIGltcGxpY2F0aW9uIHRoZW4gdGhhdCBfYWxsXyBmdW5jdGlvbnMNCj4gd2hh
dHNvZXZlciBhcmUgc3VwcG9zZWQgdG8gZ2FpbiBzdWNoIGNvbW1lbnRzKS4gQnV0IHRoZSB0ZXh0
IGp1c3QNCj4gc2F5cyBtdWNoIG1vcmUgZ2VuZXJhbGx5ICJpbi1jb2RlIGNvbW1lbnRzIiwgd2hp
Y2ggY291bGQgbWVhbiBhbGwNCj4gb2YgdGhlbS4gSSdkIGNvbnNpZGVyIHRoZSBsYXR0ZXIgYXMg
bGlrZWx5IGdvaW5nIHRvbyBmYXIuDQoNCkkgdG9vayBoaW0gdG8gbWVhbiBjb21tZW50cyBpbiB0
aGUgY29kZSBhdCB0aGUgbW9tZW50LCB3aGljaCBkZXNjcmliZSBzb21lIGludGVyZmFjZSwgYnV0
IGFyZW7igJl0IGluIGtlcm5lbC1kb2MgZm9ybWF0LiAgTmF0dXJhbGx5IHdlIHdvdWxkbuKAmXQg
d2FudCAqYWxsKiBjb21tZW50cyB0byBiZSBzdHVmZmVkIGludG8gYSBkb2N1bWVudCBzb21ld2hl
cmUuDQoNCiAtR2Vvcmdl

