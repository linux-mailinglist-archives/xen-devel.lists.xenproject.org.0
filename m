Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3736BD14D0
	for <lists+xen-devel@lfdr.de>; Wed,  9 Oct 2019 19:04:27 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iIFJK-0005dc-L5; Wed, 09 Oct 2019 16:59:38 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=XYts=YC=dornerworks.com=stewart.hildebrand@srs-us1.protection.inumbo.net>)
 id 1iIFJI-0005dU-S9
 for xen-devel@lists.xenproject.org; Wed, 09 Oct 2019 16:59:36 +0000
X-Inumbo-ID: 2aab508e-eab6-11e9-97f7-12813bfff9fa
Received: from webmail.dornerworks.com (unknown [12.207.209.150])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 2aab508e-eab6-11e9-97f7-12813bfff9fa;
 Wed, 09 Oct 2019 16:59:35 +0000 (UTC)
From: Stewart Hildebrand <Stewart.Hildebrand@dornerworks.com>
To: Julien Grall <julien.grall@arm.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
Thread-Topic: [Xen-devel] [PATCH v2] xen/arm: platform: fix Raspberry Pi
 compatible string
Thread-Index: AQHVek1xYOB4vaPOaUer8mo/2jN186dSu1cA///MTVA=
Date: Wed, 9 Oct 2019 16:59:33 +0000
Message-ID: <2474d9869a5c46e39ea862a2c78a04c4@dornerworks.com>
References: <20191004004745.26522-1-stewart.hildebrand@dornerworks.com>
 <39153cd6-efe5-1b5d-baba-b567c151a5f3@arm.com>
In-Reply-To: <39153cd6-efe5-1b5d-baba-b567c151a5f3@arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.27.13.130]
MIME-Version: 1.0
X-spam-status: No, score=-2.9 required=3.5 tests=ALL_TRUSTED, BAYES_00,
 MAILSHELL_SCORE_0_4
X-Spam-Flag: NO
Subject: Re: [Xen-devel] [PATCH v2] xen/arm: platform: fix Raspberry Pi
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
Cc: Juergen Gross <jgross@suse.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gV2VkbmVzZGF5LCBPY3RvYmVyIDksIDIwMTkgMTE6MzAgQU0sIEp1bGllbiBHcmFsbCA8anVs
aWVuLmdyYWxsQGFybS5jb20+IHdyb3RlOg0KPk9uIDA0LzEwLzIwMTkgMDE6NDcsIFN0ZXdhcnQg
SGlsZGVicmFuZCB3cm90ZToNCj4+IEJvdGggdXBzdHJlYW0gWzFdIGFuZCBkb3duc3RyZWFtIFsy
XSBMaW51eCBrZXJuZWxzIHVzZSAiYnJjbSxiY20yNzExIg0KPj4gYXMgdGhlIGNvbXBhdGlibGUg
c3RyaW5nIGZvciBSYXNwYmVycnkgUGkgNC4gQWRkIHRoaXMgc3RyaW5nIHRvIG91cg0KPj4gcGxh
dGZvcm0gY29tcGF0aWJsZSBsaXN0Lg0KPg0KPkRpZCB0aGUgUlBJIGZvdW5kYXRpb24gcmVsZWFz
ZWQgYW55IGtlcm5lbCB3aXRoIHRoZSBvbGQgYmluZGluZz8NCg0KU3VyZSwgSSBzZWUgdGhlIGZv
bGxvd2luZyB0YWdzIGluIHRoZWlyIGxpbnV4IHRyZWUgc2luY2UgaW5pdGlhbCBSUGk0DQpzdXBw
b3J0IHVudGlsIHRoZSBiaW5kaW5nIHdhcyB1cGRhdGVkOg0KcmFzcGJlcnJ5cGkta2VybmVsXzEu
MjAxOTA3MDktMQ0KcmFzcGJlcnJ5cGkta2VybmVsXzEuMjAxOTA3MTgtMQ0KcmFzcGJlcnJ5cGkt
a2VybmVsXzEuMjAxOTA4MTktMQ0KcmFzcGJlcnJ5cGkta2VybmVsXzEuMjAxOTA5MjUtMQ0KDQpU
aGVzZSBjb3JyZXNwb25kIHdpdGggdGhlaXIgYmluYXJ5IHJlbGVhc2VzIGF0IFszXSwgZXhjZXB0
IHRoZSBiaW5hcnkNCnJlbGVhc2VzIGFsc28gaGF2ZSBhbiBlYXJsaWVyIDEuMjAxOTA2MjArMSB0
YWcgd2l0aCBSUGk0IHN1cHBvcnQuDQoNCkhvd2V2ZXIsIGV2ZW4gd2l0aCBYZW4gbG9va2luZyBm
b3IgYmNtMjgzOCwgeW91IHdvdWxkbid0IGJlIGFibGUgdG8NCmdyYWIgb25lIG9mIHRob3NlIHJl
bGVhc2VzIGFuZCBib290IHdpdGhvdXQgcnVubmluZyBpbnRvIG90aGVyIGlzc3Vlcy4NCllvdSdk
IHN0aWxsIG5lZWQgYSBjb3VwbGUgb2YgYWRkaXRpb25hbCBwYXRjaGVzIGF0IFs0XS4gQ3VycmVu
dGx5IHRoZQ0Kb25seSB3YXkgdGhhdCBJJ20gYXdhcmUgb2YgdG8gc3VjY2Vzc2Z1bGx5IGJvb3Qg
aW50byBkb20wIGFuZCBsYXVuY2gNCmRvbVUgaXMgdG8gYnVpbGQgdGhlIGRvbTAga2VybmVsIGZy
b20gc291cmNlIHdpdGggdGhlIGV4dHJhIHBhdGNoZXMNCmFwcGxpZWQgZm91bmQgYXQgWzRdLg0K
DQo+SWYgc28sIEkgYW0gb2sgaWYgd2UgZG9uJ3Qgc3VwcG9ydCB0aGUgY29tcGF0aWJsZSBpbiBY
ZW4gKHdlIGRvbid0IGhhdmUgYQ0KPnJlbGVhc2Ugd2l0aCBpdCB5ZXQhKSwgYnV0IGl0IHdvdWxk
IGJlIHdvcnRoIG1lbnRpb25pbmcgaW4gdGhlIGNvbW1pdCBtZXNzYWdlDQo+dGhhdCB0aGlzIGlz
IGdvaW5nIHRvIGJyZWFrIGZvciBzb21lIHVzZXJzIChUQkQpIHNvIHRoZXkgbmVlZCB0byB1cGdy
YWRlLg0KDQpTZWUgYmVsb3cgZm9yIHN1Z2dlc3Rpb24uDQoNCj5ASnVlcmdlbjogSSB3b3VsZCBs
aWtlIHRvIGNvbnNpZGVyIHRoaXMgcGF0Y2ggZm9yIFhlbiA0LjEzLiBUaGlzIGlzIGxpbWl0ZWQg
dG8NCj5SUEk0IGFuZCB3b3VsZCBhdm9pZCB1cyB0byBzaGlwIGl0IHdpdGggYSBjb21wYXRpYmxl
IHRoYXQgaXMgZ29pbmcgdG8gZGlzYXBwZWFyLg0KPg0KPj4NCj4+IFRoZSBicmNtLGJjbTI4Mzgg
Y29udmVudGlvbiBpcyBhYmFuZG9uZWQuIFJlbW92ZSBpdC4NCj4+DQo+PiBSZW5hbWUgdGhlIHZh
cmlhYmxlcyB3aXRoaW4gdGhlIGZpbGUgdG8gYSBycGk0XyogcHJlZml4IHNpbmNlIHRoZSBmaWxl
DQo+PiBpcyBtZWFudCB0byBjb3ZlciB0aGUgUmFzcGJlcnJ5IFBpIDQgcGxhdGZvcm0uDQoNCiJJ
ZiB5b3UgYXJlIHVzaW5nIGEgZGV2aWNlIHRyZWUgd2l0aCB0aGUgb2xkIGNvbXBhdGlibGUgc3Ry
aW5nDQpicmNtLGJjbTI4MzgsIHlvdSB3aWxsIG5lZWQgdG8gdXBncmFkZSB5b3VyIGRldmljZSB0
cmVlIHRvIG9uZSB0aGF0IGhhcw0KdGhlIG5ldyBicmNtLGJjbTI3MTEgY29tcGF0aWJsZSBzdHJp
bmcuIg0KDQo+Pg0KPj4gWzFdIGh0dHBzOi8vcGF0Y2h3b3JrLmtlcm5lbC5vcmcvcGF0Y2gvMTEx
NjU0MDcvDQo+PiBbMl0gaHR0cHM6Ly9naXRodWIuY29tL3Jhc3BiZXJyeXBpL2xpbnV4L2NvbW1p
dC81M2ZkZDdiOGM4Y2I5Yzg3MTkwY2FhYjRmZDQ1OWY4OWUxYjRhN2Y4DQo+Pg0KPj4gU2lnbmVk
LW9mZi1ieTogU3Rld2FydCBIaWxkZWJyYW5kIDxzdGV3YXJ0LmhpbGRlYnJhbmRAZG9ybmVyd29y
a3MuY29tPg0KDQpbM10gaHR0cHM6Ly9naXRodWIuY29tL3Jhc3BiZXJyeXBpL2Zpcm13YXJlDQpb
NF0gaHR0cHM6Ly9naXRodWIuY29tL2Rvcm5lcndvcmtzL3hlbi1ycGk0LWJ1aWxkZXIvdHJlZS9t
YXN0ZXIvcGF0Y2hlcy9saW51eA0KDQpTdGV3DQpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVs
