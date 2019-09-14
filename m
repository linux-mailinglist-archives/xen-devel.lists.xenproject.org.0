Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 111E7B294E
	for <lists+xen-devel@lfdr.de>; Sat, 14 Sep 2019 03:25:10 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i8wkc-0004lH-V5; Sat, 14 Sep 2019 01:21:22 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ARrW=XJ=dornerworks.com=stewart.hildebrand@srs-us1.protection.inumbo.net>)
 id 1i8wkb-0004lC-Vw
 for xen-devel@lists.xenproject.org; Sat, 14 Sep 2019 01:21:22 +0000
X-Inumbo-ID: f0a35152-d68d-11e9-95be-12813bfff9fa
Received: from webmail.dornerworks.com (unknown [12.207.209.150])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id f0a35152-d68d-11e9-95be-12813bfff9fa;
 Sat, 14 Sep 2019 01:21:16 +0000 (UTC)
From: Stewart Hildebrand <Stewart.Hildebrand@dornerworks.com>
To: Julien Grall <julien.grall@arm.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
Thread-Topic: [PATCH] xen/arm: platform: additional Raspberry Pi compatible
 string
Thread-Index: AQHVanxISmaoivLf3UmdskobjGzo9qcqR+5Q
Date: Sat, 14 Sep 2019 01:22:11 +0000
Message-ID: <595ffc9f14c64201b4c16ff356770cf2@dornerworks.com>
References: <20190913191147.2323-1-stewart.hildebrand@dornerworks.com>
 <cdff00f6-be00-0b9a-924f-d3c6ffd84a22@arm.com>
In-Reply-To: <cdff00f6-be00-0b9a-924f-d3c6ffd84a22@arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.58.139.46]
MIME-Version: 1.0
X-spam-status: No, score=2.2 required=4.3 tests=RCVD_IN_PBL, BAYES_00,
 MAILSHELL_SCORE_0_4, HELO_NO_DOMAIN, RDNS_NONE
X-Spam-Flag: NO
Subject: Re: [Xen-devel] [PATCH] xen/arm: platform: additional Raspberry Pi
 compatible string
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
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gRnJpZGF5LCBTZXB0ZW1iZXIgMTMsIDIwMTkgNTo0MiBQTSwgSnVsaWVuIEdyYWxsIDxqdWxp
ZW4uZ3JhbGxAYXJtLmNvbT4gd3JvdGU6DQo+SGksDQo+DQo+T24gOS8xMy8xOSA4OjExIFBNLCBT
dGV3YXJ0IEhpbGRlYnJhbmQgd3JvdGU6DQo+PiBVcHN0cmVhbSBMaW51eCBrZXJuZWwgd2lsbCB1
c2UgImJyY20sYmNtMjcxMSIgYXMgdGhlIGNvbXBhdGlibGUgc3RyaW5nDQo+PiBmb3IgUmFzcGJl
cnJ5IFBpIDQgWzFdLiBBZGQgdGhpcyBzdHJpbmcgdG8gb3VyIHBsYXRmb3JtIGNvbXBhdGlibGUg
bGlzdA0KPj4gZm9yIGNvbXBhdGliaWxpdHkgd2l0aCB0aGUgdXBzdHJlYW0ga2VybmVsLg0KPg0K
PlRoaXMgcmFpc2VzIGEgZmV3IHF1ZXN0aW9uczoNCj4gICAgMSkgV2h5IHN1Y2ggZGlzY3JlcGFu
Y2llcyBpbiBuYW1pbmc/DQoNClRyYWRpdGlvbmFsbHkgdGhlIHJhc3BiZXJyeSBwaSB0cmVlIGhh
cyB1c2VkIHRoZSBiY20yNzA4LzkvMTAgbmFtaW5nIGNvbnZlbnRpb24sIGFuZCB1cHN0cmVhbSBi
Y20yODM1LzYvNy4gSXQgc2VlbXMgdGhleSd2ZSBzd2l0Y2hlZCBpdCB1cCBmb3IgdGhlIFJQaTQu
IEluIHRoZSBSRkMgdmVyc2lvbiBvZiB0aGUgc2VyaWVzIGludGVuZGVkIGZvciB1cHN0cmVhbSwg
dGhleSBpbmRlZWQgaGFkIGl0IGFzIDI4MzggWzJdLCBidXQgYWZ0ZXIgdGhhdCBpdCBjaGFuZ2Vk
IHRvIDI3MTEgWzNdIFs0XS4NCg0KVGhlIFNvQyBuYW1lIGluIGRvY3VtZW50YXRpb24gaXMgQkNN
MjcxMSBbNV0gWzZdLg0KDQo+ICAgIDIpIElzIHRoZSBwYXRjaCBbMV0gbWVyZ2VkPyBJZiBzbywg
d2hpY2ggdmVyc2lvbj8NCg0KTm8uDQoNCj4gICAgMykgQm90aCB1cHN0cmVhbSBhbmQgbm9uLXVw
c3RyZWFtIHNlZW0gdG8gaGF2ZSB0aGUgY29tcGF0aWJsZQ0KPiJyYXNwYmVycnlwaSw0LW1vZGVs
LWIiLCBzbyB3b3VsZCBpdCBtYWtlIHNlbnNlIHRvIGNoZWNrIHRoYXQgaW5zdGVhZD8NCg0KInJh
c3BiZXJyeXBpLDQtbW9kZWwtYiIgZGVzY3JpYmVzIGEgYm9hcmQsIGFuZCAiYnJjbSxiY20yeHh4
IiBkZXNjcmliZXMgYSBTb0MuIEl0IGlzIGZlYXNpYmxlIHRoYXQgdGhlcmUgd2lsbCBiZSBtb3Jl
IGJvYXJkcyBiYXNlZCBvbiB0aGlzIFNvQywgaW4gd2hpY2ggY2FzZSB3ZSdkIGhhdmUgdG8gYWRk
IHRob3NlIGh5cG90aGV0aWNhbCBuZXcgYm9hcmRzIHNlcGFyYXRlbHkuIElmIHdlIGxpc3QgYm90
aCAiYnJjbSxiY20yNzExIiBhbmQgImJyY20sYmNtMjgzOCIsIHRoZW4gaXQgc2VlbXMgdG8gbWUg
d2UnZCBoYXZlIGEgYmV0dGVyIGNoYW5jZSBhdCBtYXRjaGluZyBmdXR1cmUgYm9hcmRzIHdpdGgg
dGhpcyBwYXJ0aWN1bGFyIFNvQywgd2hpbGUgYWxzbyBtYXRjaGluZyBib3RoIHVwc3RyZWFtIGFu
ZCBub24tdXBzdHJlYW0gdHJlZXMuDQoNCj4+ICAgc3RhdGljIGNvbnN0IGNoYXIgKmNvbnN0IGJy
Y21fYmNtMjgzOF9kdF9jb21wYXRbXSBfX2luaXRjb25zdCA9DQo+PiAgIHsNCj4+ICsgICAgImJy
Y20sYmNtMjcxMSIsDQo+DQo+SWYgYSBuZXcgY29tcGF0aWJsZSBpcyBhZGRlZCwgdGhlbiB5b3Ug
bGlrZWx5IG5lZWQgdG8gcmVuYW1lIHRoZQ0KPmRpZmZlcmVudCBzdHJ1Y3R1cmUgd2l0aGluIHRo
aXMgZmlsZS4NCg0KR29vZCBwb2ludC4gU2luY2UgdGhlIGRvY3VtZW50YXRpb24gdXNlcyB0aGUg
QkNNMjcxMSBjb252ZW50aW9uLCBpdCB3b3VsZCBtYWtlIHNlbnNlIHRvIG1lIHRvIHJlbmFtZSBp
dCByZWZsZWN0aW5nIHRoaXMsIGV2ZW4gd2hlbiB0aGUgbGlzdCBjb250YWlucyBib3RoIGJyY20s
YmNtMjcxMSBhbmQgYnJjbSxiY20yODM4LiBBbmQgcGVyaGFwcyBhbHNvIGFkZCBhIGNvbW1lbnQg
YnkgdGhlIGJyY20sYmNtMjgzOCBlbnRyeSB0byBleHBsYWluIHRoZSBvZGRpdHkuDQoNCnN0YXRp
YyBjb25zdCBjaGFyICpjb25zdCBicmNtX2JjbTI3MTFfZHRfY29tcGF0W10gX19pbml0Y29uc3Qg
PQ0Kew0KICAgICJicmNtLGJjbTI3MTEiLA0KICAgIC8qDQogICAgICogV2hpbGUgdGhlIG5hbWUg
b2YgdGhlIFNvQyBpcyBCQ00yNzExLCBzb21lIHZhcmlhbnRzIG9mIExpbnV4DQogICAgICogaGF2
ZSBhbHNvIHVzZWQgdGhlIGJyY20sYmNtMjgzOCBuYW1pbmcgY29udmVudGlvbi4gV2UgY29uc2lk
ZXINCiAgICAgKiBlaXRoZXIgY29tcGF0aWJsZSBzdHJpbmcgdG8gYmUgYSB2YWxpZCBtYXRjaCBm
b3IgdGhlIEJDTTI3MTEgU29DLg0KICAgICAqLw0KICAgICJicmNtLGJjbTI4MzgiLA0KDQpUaGUg
YmNtMjgzOCBuYW1pbmcgY29udmVudGlvbiBzdGF0ZW1lbnQgaXJvbmljYWxseSByZWZlcnMgdG8g
dGhlIHJhc3BiZXJyeSBwaSB0cmVlIFs3XS4NCg0KWzJdIFJGQyBodHRwczovL3BhdGNod29yay5r
ZXJuZWwub3JnL2NvdmVyLzExMDQ4MjE1LyMyMjc2NzEwNw0KWzNdIHYxIGh0dHBzOi8vcGF0Y2h3
b3JrLmtlcm5lbC5vcmcvY292ZXIvMTEwNTE2NTMvDQpbNF0gdjIgaHR0cHM6Ly9wYXRjaHdvcmsu
a2VybmVsLm9yZy9jb3Zlci8xMTA5MjY0MS8NCls1XSBodHRwczovL3d3dy5yYXNwYmVycnlwaS5v
cmcvZG9jdW1lbnRhdGlvbi9oYXJkd2FyZS9yYXNwYmVycnlwaS9iY20yNzExL1JFQURNRS5tZA0K
WzZdIGh0dHBzOi8vd3d3LnJhc3BiZXJyeXBpLm9yZy9kb2N1bWVudGF0aW9uL2hhcmR3YXJlL3Jh
c3BiZXJyeXBpL2JjbTI3MTEvcnBpX0RBVEFfMjcxMV8xcDBfcHJlbGltaW5hcnkucGRmDQpbN10g
aHR0cHM6Ly9naXRodWIuY29tL3Jhc3BiZXJyeXBpL2xpbnV4L2Jsb2IvcnBpLTQuMTkueS9hcmNo
L2FybS9ib290L2R0cy9iY20yNzExLXJwaS00LWIuZHRzI0w4DQpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21h
aWxtYW4vbGlzdGluZm8veGVuLWRldmVs
