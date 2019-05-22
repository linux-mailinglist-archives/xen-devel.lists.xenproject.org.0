Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 27BD72615D
	for <lists+xen-devel@lfdr.de>; Wed, 22 May 2019 12:05:35 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hTO4m-0000Gg-0O; Wed, 22 May 2019 10:02:24 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=3DNt=TW=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hTO4j-0000GZ-TE
 for xen-devel@lists.xenproject.org; Wed, 22 May 2019 10:02:21 +0000
X-Inumbo-ID: b02703c4-7c78-11e9-8980-bc764e045a96
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id b02703c4-7c78-11e9-8980-bc764e045a96;
 Wed, 22 May 2019 10:02:20 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Wed, 22 May 2019 04:02:19 -0600
Message-Id: <5CE51E2A020000780023144D@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.0 
Date: Wed, 22 May 2019 04:02:18 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "Julien Grall" <julien.grall@arm.com>
References: <20190521212530.12706-1-volodymyr_babchuk@epam.com>
 <20190521212530.12706-2-volodymyr_babchuk@epam.com>
 <5CE50C12020000780023137C@prv1-mh.provo.novell.com>
 <55b6761c-152a-a6fa-085d-5f78443831d1@arm.com>
In-Reply-To: <55b6761c-152a-a6fa-085d-5f78443831d1@arm.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: Re: [Xen-devel] [PATCH v5 01/10] xen/arm: add generic TEE mediator
 framework
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 tee-dev@lists.linaro.org, xen-devel <xen-devel@lists.xenproject.org>,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Pj4+IE9uIDIyLjA1LjE5IGF0IDExOjI3LCA8anVsaWVuLmdyYWxsQGFybS5jb20+IHdyb3RlOgoK
PiAKPiBPbiAyMi8wNS8yMDE5IDA5OjQ1LCBKYW4gQmV1bGljaCB3cm90ZToKPj4+Pj4gT24gMjEu
MDUuMTkgYXQgMjM6MjUsIDxWb2xvZHlteXJfQmFiY2h1a0BlcGFtLmNvbT4gd3JvdGU6Cj4+PiAg
IE1BSU5UQUlORVJTICAgICAgICAgICAgICAgICAgIHwgICA2ICsrCj4+PiAgIHhlbi9hcmNoL2Fy
bS9LY29uZmlnICAgICAgICAgIHwgICA3ICsrKwo+Pj4gICB4ZW4vYXJjaC9hcm0vTWFrZWZpbGUg
ICAgICAgICB8ICAgMSArCj4+PiAgIHhlbi9hcmNoL2FybS9kb21haW4uYyAgICAgICAgIHwgIDE4
ICsrKysrKwo+Pj4gICB4ZW4vYXJjaC9hcm0vc2V0dXAuYyAgICAgICAgICB8ICAgMiArCj4+PiAg
IHhlbi9hcmNoL2FybS90ZWUvTWFrZWZpbGUgICAgIHwgICAxICsKPj4+ICAgeGVuL2FyY2gvYXJt
L3RlZS90ZWUuYyAgICAgICAgfCAgOTMgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysKPj4+
ICAgeGVuL2FyY2gvYXJtL3ZzbWMuYyAgICAgICAgICAgfCAgIDUgKysKPj4+ICAgeGVuL2FyY2gv
YXJtL3hlbi5sZHMuUyAgICAgICAgfCAgIDcgKysrCj4+PiAgIHhlbi9pbmNsdWRlL2FzbS1hcm0v
ZG9tYWluLmggIHwgICAxICsKPj4+ICAgeGVuL2luY2x1ZGUvYXNtLWFybS90ZWUvdGVlLmggfCAx
MDkgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKwo+Pj4gICB4ZW4vaW5jbHVkZS9w
dWJsaWMvYXJjaC1hcm0uaCB8ICAgMyArCj4+PiAgIDEyIGZpbGVzIGNoYW5nZWQsIDI1MyBpbnNl
cnRpb25zKCspCj4+PiAgIGNyZWF0ZSBtb2RlIDEwMDY0NCB4ZW4vYXJjaC9hcm0vdGVlL01ha2Vm
aWxlCj4+PiAgIGNyZWF0ZSBtb2RlIDEwMDY0NCB4ZW4vYXJjaC9hcm0vdGVlL3RlZS5jCj4+PiAg
IGNyZWF0ZSBtb2RlIDEwMDY0NCB4ZW4vaW5jbHVkZS9hc20tYXJtL3RlZS90ZWUuaAo+PiAKPj4g
SSBkb24ndCB0aGluayBJJ20gYXNraW5nIHRoaXMgZm9yIHRoZSBmaXJzdCB0aW1lOiBXaHkgYW0g
SSBiZWluZyBDYy1lZAo+PiBoZXJlPyBJdCdzIGFsbCBBcm0gY29kZSB0aGF0IGdldHMgY2hhbmdl
ZCwgYW5kIHRoZSBNQUlOVEFJTkVSUwo+PiBhZGRpdGlvbiBhbG9uZSBpbW8gZG9lc24ndCB3YXJy
YW50IHdpZGVuaW5nIHRoZSBDYyBsaXN0Lgo+IAo+IEEgbG90IG9mIHVzZXJzIHVzZXMgdGhlIHNj
cmlwdHMve2FkZCwgZ2V0fV9tYWludGFpbmVycy5wbCB0byBnZXQgdGhlIGxpc3Qgb2YgCj4gCj4g
bWFpbnRhaW5lcnMgdG8gQ0NlZC4gQm90aCBvZiB0aGVtIG91dHB1dCAiVEhFIFJFU1QiIGJlY2F1
c2Ugb2YgdGhlIGZpbGUgCj4gTUFJTlRBSU5FUlMgaXMgbW9kaWZpZWQuCj4gCj4gSSBkb24ndCB0
aGluayBpdCBpcyBzZW5zaWJsZSB0byBleHBlY3QgdXNlcnMgdG8ga25vdyB3aGVuIHRvIHN0cmlw
IHRoZSAKPiBsaXN0Li4uCgpIbW0sIHdlbGwsIEkgc2VlIHlvdXIgcG9pbnQsIGJ1dCBJIHRoaW5r
IGFwcGx5aW5nIHNvbWUgY29tbW9uIHNlbnNlCnN0aWxsIGNhbiBiZSBleHBlY3RlZC4gSXQncyBh
bHNvIG5vdCBzZW5zaWJsZSBmb3IgdW5yZWxhdGVkIHBlb3BsZSB0bwpnZXQgQ2MtZWQuIEkgdGhp
bmsgYW55b25lIGtub3dpbmcgZW5vdWdoIHRvIG1vZGlmeSBNQUlOVEFJTkVSUwpjYW4gYmUgZXhw
ZWN0ZWQgdG8ga25vdyB3aG9tIHRvIENjLgoKSmFuCgoKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1h
bi9saXN0aW5mby94ZW4tZGV2ZWw=
