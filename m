Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F38C8CB2D2
	for <lists+xen-devel@lfdr.de>; Fri,  4 Oct 2019 02:50:32 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iGBkU-0006kv-B9; Fri, 04 Oct 2019 00:47:10 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=raGW=X5=dornerworks.com=stewart.hildebrand@srs-us1.protection.inumbo.net>)
 id 1iGBkT-0006kp-1C
 for xen-devel@lists.xenproject.org; Fri, 04 Oct 2019 00:47:09 +0000
X-Inumbo-ID: 7cff86ea-e640-11e9-973b-12813bfff9fa
Received: from webmail.dornerworks.com (unknown [12.207.209.150])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 7cff86ea-e640-11e9-973b-12813bfff9fa;
 Fri, 04 Oct 2019 00:47:07 +0000 (UTC)
From: Stewart Hildebrand <Stewart.Hildebrand@dornerworks.com>
To: Julien Grall <julien.grall@arm.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>, Julien Grall <julien@xen.org>
Thread-Topic: [PATCH] xen/arm: platform: additional Raspberry Pi compatible
 string
Thread-Index: AQHVanxISmaoivLf3UmdskobjGzo9qcqR+5QgAW1roCAGcO/MA==
Date: Fri, 4 Oct 2019 00:47:20 +0000
Message-ID: <d3bc1282725e47e38afa26cc4dfb7c95@dornerworks.com>
References: <20190913191147.2323-1-stewart.hildebrand@dornerworks.com>
 <cdff00f6-be00-0b9a-924f-d3c6ffd84a22@arm.com>
 <595ffc9f14c64201b4c16ff356770cf2@dornerworks.com>
 <aa1b244f-9500-7798-0f2f-a93567a12e2b@arm.com>
In-Reply-To: <aa1b244f-9500-7798-0f2f-a93567a12e2b@arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.27.13.130]
MIME-Version: 1.0
X-spam-status: No, score=-2.9 required=4.3 tests=ALL_TRUSTED, BAYES_00,
 MAILSHELL_SCORE_0_4
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

T24gVHVlc2RheSwgU2VwdGVtYmVyIDE3LCAyMDE5IDc6MDUgQU0sIEp1bGllbiBHcmFsbCA8anVs
aWVuLmdyYWxsQGFybS5jb20+IHdyb3RlOg0KPkhpIFN0ZXdhcnQsDQo+DQo+T24gOS8xNC8xOSAy
OjIyIEFNLCBTdGV3YXJ0IEhpbGRlYnJhbmQgd3JvdGU6DQo+PiBPbiBGcmlkYXksIFNlcHRlbWJl
ciAxMywgMjAxOSA1OjQyIFBNLCBKdWxpZW4gR3JhbGwgPGp1bGllbi5ncmFsbEBhcm0uY29tPiB3
cm90ZToNCj4+PiAgICAgMikgSXMgdGhlIHBhdGNoIFsxXSBtZXJnZWQ/IElmIHNvLCB3aGljaCB2
ZXJzaW9uPw0KPj4NCj4+IE5vLg0KPg0KPkkgd291bGQgcmF0aGVyIHdhaXQgdW50aWwgdGhlIHBh
dGNoIGlzIG1lcmdlZCBpbiBMaW51eCBiZWZvcmUgYWRkaW5nIHRoZQ0KPmNvbXBhdGlibGUuDQoN
ClRoZSBkb3duc3RyZWFtIGtlcm5lbCBoYXMgY2hhbmdlZCB0aGVpciBjb21wYXRpYmxlIHRvICJi
cmNtLGJjbTI3MTEiIFs4XSwNCnNvICJicmNtLGJjbTI4MzgiIGlzIG9ic29sZXRlIG5vdy4gV2hp
bGUgdGhlIHVwc3RyZWFtIHNlcmllcyBoYXMgbm90IGJlZW4NCm1lcmdlZCB5ZXQgWzldLCB0aGUg
bGFjayBvZiAiYnJjbSxiY20yNzExIiBpbiBvdXIgY29tcGF0aWJsZSBsaXN0IGlzDQpwcmV2ZW50
aW5nIHVzIGZyb20gYm9vdGluZyB0aGUgZG93bnN0cmVhbSBrZXJuZWwuIEkgd2lsbCBzZW5kIGEg
djIgb2YgdGhlDQpwYXRjaC4NCg0KPlRoaXMgYWxzbyByYWlzZSB0aGUgcXVlc3Rpb24gb24gd2hh
dCdzIGdvaW5nIHRvIGhhcHBlbiBmb3IgYmxhY2tsaXN0DQo+ZGV2aWNlPyBBcmUgdGhleSBzdGls
bCBnb2luZyB0byBjb250YWluICJiY20yODM1Ij8NCg0KVGhlIHBlcmlwaGVyYWxzL2RldmljZXMg
c3RpbGwgaGF2ZSB0aGUgc2FtZSAiYnJjbSxiY20yODM1IiBwcmVmaXguIE5vIGNoYW5nZS4NCg0K
WzhdIGh0dHBzOi8vZ2l0aHViLmNvbS9yYXNwYmVycnlwaS9saW51eC9jb21taXQvNTNmZGQ3Yjhj
OGNiOWM4NzE5MGNhYWI0ZmQ0NTlmODllMWI0YTdmOA0KWzldIHYzIGh0dHBzOi8vcGF0Y2h3b3Jr
Lmtlcm5lbC5vcmcvY292ZXIvMTExNjUzOTUvDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVs
