Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BE0091F41AF
	for <lists+xen-devel@lfdr.de>; Tue,  9 Jun 2020 19:04:21 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jihfL-0005fL-3P; Tue, 09 Jun 2020 17:03:59 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=K0Bv=7W=citrix.com=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1jihfK-0005fE-8O
 for xen-devel@lists.xenproject.org; Tue, 09 Jun 2020 17:03:58 +0000
X-Inumbo-ID: 348258dc-aa73-11ea-b343-12813bfff9fa
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 348258dc-aa73-11ea-b343-12813bfff9fa;
 Tue, 09 Jun 2020 17:03:57 +0000 (UTC)
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: 92YMmYdspaKsWWzegUN3uFD6ESQEIgFua+4qZ0ywgpc64TVLM0al/RlOZl3l2teMO31/lNXJk7
 1vfNOu84G62JnaOpJxooihgzYRedx7++mtvtG0E29DvblK+esMHkk/VIUM8gx49pyaiDgfvsCf
 gYYJALZUIiBdXKBHY912AMtzhJz/kvkASlyC3ozN2LVERfjwYiBrYEq4YiBaPozMphty+4p1hX
 NTBVO5sJhR7prrkdWlKZJjYHtOw/srvh/s7j1aRPvFyP85ultgB9N721bCdCXD+23UBJ86yniP
 XxQ=
X-SBRS: 2.7
X-MesageID: 19950564
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,492,1583211600"; d="scan'208";a="19950564"
From: George Dunlap <George.Dunlap@citrix.com>
To: Paul Durrant <paul@xen.org>
Subject: Re: [TESTDAY] xl restore gives an error too soon after xl save
Thread-Topic: [TESTDAY] xl restore gives an error too soon after xl save
Thread-Index: AQHWPn1DuBRhzpMk9UKX8zBgGqSl9KjQXzkAgAACKIA=
Date: Tue, 9 Jun 2020 17:03:49 +0000
Message-ID: <5B09A89E-1321-4DC0-8830-396F4239058B@citrix.com>
References: <B965FD5D-549B-48E2-A05A-1E4D405F624A@citrix.com>
 <00d601d63e7e$df2eb570$9d8c2050$@xen.org>
In-Reply-To: <00d601d63e7e$df2eb570$9d8c2050$@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3608.80.23.2.2)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
Content-Type: text/plain; charset="utf-8"
Content-ID: <B5296BFF2FE8E84396635FF0ED1A0C20@citrix.com>
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
Cc: Anthony Perard <anthony.perard@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>,
 Ian Jackson <Ian.Jackson@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

DQoNCj4gT24gSnVuIDksIDIwMjAsIGF0IDU6NTYgUE0sIFBhdWwgRHVycmFudCA8eGFkaW1nbmlr
QGdtYWlsLmNvbT4gd3JvdGU6DQo+IA0KPj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4+
IEZyb206IEdlb3JnZSBEdW5sYXAgPEdlb3JnZS5EdW5sYXBAY2l0cml4LmNvbT4NCj4+IFNlbnQ6
IDA5IEp1bmUgMjAyMCAxNzo0NQ0KPj4gVG86IFhlbi1kZXZlbCA8eGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnPg0KPj4gQ2M6IFBhdWwgRHVycmFudCA8cGF1bEB4ZW4ub3JnPjsgSWFuIEph
Y2tzb24gPElhbi5KYWNrc29uQGNpdHJpeC5jb20+OyBXZWkgTGl1IDx3bEB4ZW4ub3JnPjsgQW50
aG9ueQ0KPj4gUGVyYXJkIDxhbnRob255LnBlcmFyZEBjaXRyaXguY29tPg0KPj4gU3ViamVjdDog
W1RFU1REQVldIHhsIHJlc3RvcmUgZ2l2ZXMgYW4gZXJyb3IgdG9vIHNvb24gYWZ0ZXIgeGwgc2F2
ZQ0KPj4gDQo+PiBTb21ld2hhdCBzdXJwcmlzaW5nIHRoYXQgaWYgeW91IHNhdmUgd2l0aCAtRCwg
eW91IGdldCBteXN0ZXJpb3VzIGVycm9yIG1lc3NhZ2VzIGZvciB0aGUgbmV4dCBzby1tYW55DQo+
PiBzZWNvbmRzOg0KPj4gDQo+PiByb290QGltbW9ydGFsOi9pbWFnZXMjIHhsIHNhdmUgLUQgYzYt
MDEgL2ltYWdlcy90bXAvYzYtMDEuc2F2ZQ0KPj4gU2F2aW5nIHRvIC9pbWFnZXMvdG1wL2M2LTAx
LnNhdmUgbmV3IHhsIGZvcm1hdCAoaW5mbyAweDMvMHgwLzk1MCkNCj4+IHhjOiBpbmZvOiBTYXZp
bmcgZG9tYWluIDE5NTA1LCB0eXBlIHg4NiBQVg0KPj4geGM6IEZyYW1lczogNTI0Mjg4LzUyNDI4
OCAgMTAwJQ0KPj4geGM6IEVuZCBvZiBzdHJlYW06IDAvMCAgICAwJQ0KPj4gcm9vdEBpbW1vcnRh
bDovaW1hZ2VzIyB4bCByZXN0b3JlIHRtcC9jNi0wMS5zYXZlDQo+PiBMb2FkaW5nIG5ldyBzYXZl
IGZpbGUgdG1wL2M2LTAxLnNhdmUgKG5ldyB4bCBmbXQgaW5mbyAweDMvMHgwLzk1MCkNCj4+IFNh
dmVmaWxlIGNvbnRhaW5zIHhsIGRvbWFpbiBjb25maWcgaW4gSlNPTiBmb3JtYXQNCj4+IFBhcnNp
bmcgY29uZmlnIGZyb20gPHNhdmVkPg0KPj4gbGlieGw6IGVycm9yOiBsaWJ4bF9jcmVhdGUuYzo2
OTI6bGlieGxfX2RvbWFpbl9tYWtlOiBEb21haW4gMTk1MDU6ZG9tYWluIGlkIHJlY2VudGx5IHVz
ZWQ6IE5vIHN1Y2gNCj4+IGZpbGUgb3IgZGlyZWN0b3J5DQo+PiBsaWJ4bDogZXJyb3I6IGxpYnhs
X2NyZWF0ZS5jOjEyMzM6aW5pdGlhdGVfZG9tYWluX2NyZWF0ZTogRG9tYWluIDE5NTA1OmNhbm5v
dCBtYWtlIGRvbWFpbjogLTMNCj4+IGxpYnhsOiBlcnJvcjogbGlieGxfZG9tYWluLmM6MTE4Mjps
aWJ4bF9fZGVzdHJveV9kb21pZDogRG9tYWluIDE5NTA1Ok5vbi1leGlzdGFudCBkb21haW4NCj4+
IGxpYnhsOiBlcnJvcjogbGlieGxfZG9tYWluLmM6MTEzNjpkb21haW5fZGVzdHJveV9jYWxsYmFj
azogRG9tYWluIDE5NTA1OlVuYWJsZSB0byBkZXN0cm95IGd1ZXN0DQo+PiBsaWJ4bDogZXJyb3I6
IGxpYnhsX2RvbWFpbi5jOjEwNjM6ZG9tYWluX2Rlc3Ryb3lfY2I6IERvbWFpbiAxOTUwNTpEZXN0
cnVjdGlvbiBvZiBkb21haW4gZmFpbGVkDQo+PiByb290QGltbW9ydGFsOi9pbWFnZXMjIHhsIHJl
c3RvcmUgdG1wL2M2LTAxLnNhdmUNCj4+IExvYWRpbmcgbmV3IHNhdmUgZmlsZSB0bXAvYzYtMDEu
c2F2ZSAobmV3IHhsIGZtdCBpbmZvIDB4My8weDAvOTUwKQ0KPj4gU2F2ZWZpbGUgY29udGFpbnMg
eGwgZG9tYWluIGNvbmZpZyBpbiBKU09OIGZvcm1hdA0KPj4gUGFyc2luZyBjb25maWcgZnJvbSA8
c2F2ZWQ+DQo+PiBsaWJ4bDogZXJyb3I6IGxpYnhsX2NyZWF0ZS5jOjY5MjpsaWJ4bF9fZG9tYWlu
X21ha2U6IERvbWFpbiAxOTUwNTpkb21haW4gaWQgcmVjZW50bHkgdXNlZDogTm8gc3VjaA0KPj4g
ZmlsZSBvciBkaXJlY3RvcnkNCj4+IGxpYnhsOiBlcnJvcjogbGlieGxfY3JlYXRlLmM6MTIzMzpp
bml0aWF0ZV9kb21haW5fY3JlYXRlOiBEb21haW4gMTk1MDU6Y2Fubm90IG1ha2UgZG9tYWluOiAt
Mw0KPj4gbGlieGw6IGVycm9yOiBsaWJ4bF9kb21haW4uYzoxMTgyOmxpYnhsX19kZXN0cm95X2Rv
bWlkOiBEb21haW4gMTk1MDU6Tm9uLWV4aXN0YW50IGRvbWFpbg0KPj4gbGlieGw6IGVycm9yOiBs
aWJ4bF9kb21haW4uYzoxMTM2OmRvbWFpbl9kZXN0cm95X2NhbGxiYWNrOiBEb21haW4gMTk1MDU6
VW5hYmxlIHRvIGRlc3Ryb3kgZ3Vlc3QNCj4+IGxpYnhsOiBlcnJvcjogbGlieGxfZG9tYWluLmM6
MTA2Mzpkb21haW5fZGVzdHJveV9jYjogRG9tYWluIDE5NTA1OkRlc3RydWN0aW9uIG9mIGRvbWFp
biBmYWlsZWQNCj4+IA0KPj4gW0EgZmV3IG1pbnV0ZXMgcGFzc10NCj4+IA0KPiANCj4gWWVzLCB0
aGlzIGlzIGJlY2F1c2UgaXQgaXMgbm90ICdzYWZlJyB0byByZS1jcmVhdGUgdGhlIGRvbWFpbiB3
aXRoIHRoZSBzYW1lIGRvbWlkIHVudGlsIGl0IGlzIGRlZW1lZCBub3QgJ3JlY2VudGx5IHVzZWQn
LiBUaGlzDQo+IHNob3VsZCBpbmRlZWQgYmUgZG9jdW1lbnRlZC4NCg0K4oCmYW5kIHByb2JhYmx5
IGhhdmUgYSBtb3JlIGluZm9ybWF0aXZlIGVycm9yIG1lc3NhZ2UuIDotKQ0KDQpJIGNhbiBzZWUg
d2h5IHlvdSB3b3VsZG7igJl0IHdhbnQgdG8gc3RhcnQgYSAqbmV3KiBkb21haW4gd2l0aCBhIHBy
ZXZpb3VzIGRvbWFpbiwgYnV0IHN1cmVseSBpZiB5b3XigJlyZSByZXN0b3JpbmcgdGhlICpzYW1l
KiBkb21haW4sIHRoYXQgY2hlY2sgc2hvdWxkIGJlIHNraXBwZWQ/DQoNCiAtR2Vvcmdl

