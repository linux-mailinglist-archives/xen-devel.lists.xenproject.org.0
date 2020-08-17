Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CB8DB2467A9
	for <lists+xen-devel@lfdr.de>; Mon, 17 Aug 2020 15:47:24 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k7fSs-00030y-4c; Mon, 17 Aug 2020 13:46:18 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Wavi=B3=citrix.com=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1k7fSq-00030t-F5
 for xen-devel@lists.xenproject.org; Mon, 17 Aug 2020 13:46:16 +0000
X-Inumbo-ID: 65240869-9db4-4d9d-ae3d-334a6dea9537
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 65240869-9db4-4d9d-ae3d-334a6dea9537;
 Mon, 17 Aug 2020 13:46:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1597671975;
 h=from:to:cc:subject:date:message-id:content-id:
 content-transfer-encoding:mime-version;
 bh=fM3BNGkIkHJ5HTnpmSzvEFP5B/dCZUVR+1uuEVI/iuU=;
 b=Q/ya/ejYg00trEGnFizigm7M/PF3ERdn08U5uVXSkPu1c5uumJ/rIRmi
 owxWOEmYTW04Ofwhk06qVyXHNE4PUcDbhOtF11w6qfMJp0zVntl3CFhnB
 BmjGypAMlCjfU1amTfyekGmqseIL643a3USFATI1boOQCmbDsb6+4uFE/ E=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: 3OUizERATxAQLAzpVeoxHqck7nqPdViiNzCK9UMon9vkU6qHoxmnO4uDwXQIU0CPOA/1Mp45ys
 M+TRt0Is9uI59C0ezmHYLenPgoxIoxRiEkUkQts0THJqIzqJV7PmjWk+fOI0YVxPioWEQuK6lI
 n2beoKQ0cZKxOmvMXTRuQsEG13cjI8gSyswv4e7VwWS0J0wgKnunLsMs/tvM4rD9vBRrAUxcV7
 1McrfDWhVSIK1zpYrwhnlRQm+0u8ee/T8t6g5ZxfOH1vP7McHjBer+Bk2wiFPIVfk/QwHwpTtC
 vWI=
X-SBRS: 2.7
X-MesageID: 25012738
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.76,322,1592884800"; d="scan'208";a="25012738"
From: George Dunlap <George.Dunlap@citrix.com>
To: "open list:X86" <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <Andrew.Cooper3@citrix.com>, Wei Liu <wl@xen.org>, "Doug
 Goldstein" <cardoe@cardoe.com>, Anthony Perard <anthony.perard@citrix.com>
Subject: CI loop working group
Thread-Topic: CI loop working group
Thread-Index: AQHWdJzETlSKKN7aekSfvGlaDQABUQ==
Date: Mon, 17 Aug 2020 13:46:10 +0000
Message-ID: <0695B028-1ABC-4172-8F53-8675E82C1042@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3608.120.23.2.1)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
Content-Type: text/plain; charset="utf-8"
Content-ID: <006BD95853CAA7458A68CA5FBEC6E5EA@citrix.com>
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

QXMgYSBicmllZiBzdW1tYXJ5LCBoZXJlIGlzIHdoYXQgd2UgZGlzY3Vzc2VkIGF0IHRoZSBYZW5T
dW1taXQgZGVzaWduIHNlc3Npb24gb24gQ0k7DQoNCiMgV2hhdCBpcyBuZWVkZWQgdG8gcnVuIENJ
IG9uIHBhdGNoZXMgcG9zdGVkIHRvIHRoZSBsaXN0Og0KDQoxLiBHZXQgYSBwYXRjaCBzZXJpZXMu
IERldGVybWluZSBpZiBpdCdzIGZvciBYZW4gb3Igbm90Lg0KMi4gZGV0ZXJtaW5lIHRoZSBiYXNl
IGJyYW5jaCAoc3RhZ2luZywgc3RhZ2luZy00LjEzLCBzdGFnaW5nLTQuMTIsIGV0YykgKCJmb3It
NC4xNCIgYWZ0ZXIgYSBicmFuY2gpIChhY3R1YWxseSwgcHJvYmFibHkgZXZlcnl0aGluZyBzaG91
bGQgZ28gaW50byBzdGFnaW5nIGZpcnN0KQ0KMy4gQXBwbHkgdGhhdCBwYXRjaCBzZXJpZXMgdG8g
YSBicmFuY2guDQo0LiBQdXNoIHRvIGEgZ2l0IHJlcG8gKHdoaWxlIGRldmVsb3BpbmcgcHVzaCBp
dCBzb21ld2hlcmUgb3RoZXIgdGhhbiB0aGUgbWFpbiByZXBvKQ0KNS4gTGV0IENJIHJ1bg0KNi4g
QWRkIHN0ZXAgYXQgdGhlIGVuZCBvZiB0aGUgQ0kgcnVuIHRvIGNvbW1lbnQgb24gdGhlIE1MIGxp
c3QgKGlkZWFsbHkgcmVwbHkgdG8gc2VyaWVzIG9uIGxpc3QpDQo3LiBIYXZlIGFuIG9wdC1vdXQg
ZmxhZy4NCg0KcGF0Y2hldyBhbHJlYWR5IHB1c2hlcyB0byBnaXRodWIuY29tLCBzbyB3ZSBqdXN0
IG5lZWQgdG8gZ2V0IGl0IHRvIHB1c2ggdG8gZ2l0bGFiLiAgU28gdGhlIHBsYW4gaXM6DQoNCiMg
UGxhbg0KDQotIGZpeCBjdXJyZW50IENJIGxvb3AgYnVpbHQgZmFpbHVyZQ0KLSBHZXQgYW4gYWNj
b3VudCBmb3IgcGF0Y2hldyBvbiBnaXRsYWINCi0gUmVjb25maWd1cmUgcGF0Y2hldy5vcmcgdG8g
cHVzaCB0aGVyZSBpbnN0ZWFkDQotIFJlY29uZmlndXJlIHBhdGNoZXcub3JnIHRvIHJlcGx5IHRv
IG1haWxpbmcgbGlzdCB3LyByZXN1bHQNCg0KV2XigJlkIGFsc28gZGlzY3Vzc2VkIGRyb3BwaW5n
IHRoZSDigJx0ZXN0IGV2ZXJ5IGNvbW1pdOKAnSBzY3JpcHQuDQoNCkFuZHkgc2FpZCBoZSB3b3Vs
ZCB2b2x1bnRlZXIgdG8gY2hhc2UgdGhpcy4NCg0KQXQgdGhlIG1vc3QgcmVjZW50IGNvbW11bml0
eSBjYWxsLCBBbmR5IHJlY29tbWVuZGVkIHdlIGZvcm0gYSB3b3JraW5nIGdyb3VwIHdpdGggcmVn
dWxhciBtZWV0aW5ncyB0byBtYWtlIHN1cmUgdGhpbmdzIGtlZXAgbW92aW5nIGZvcndhcmQuICBT
aGFsbCB3ZSBzYXkgYml3ZWVrbHk/ICBBbnkgcHJlZmVyZW5jZXMgZm9yIG1lZXRpbmcgdGltZSAv
IHZlbnVlPw0KDQpJIGFsc28gcHJvcG9zZSB3ZSBlbmFibGUgaXNzdWUgdHJhY2tpbmcgb24gZ2l0
bGFiLmNvbS94ZW4tcHJvamVjdCwgYXQgbGVhc3QgZm9yIHByb2plY3QgbWVtYmVycywgdG8gY29s
bGVjdCBhbmQgdHJhY2sgdGhpcyBzb3J0IG9mIHRoaW5nLiAgQW55IG9iamVjdGlvbnM/DQoNCiAt
R2Vvcmdl

