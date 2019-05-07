Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F2157161A7
	for <lists+xen-devel@lfdr.de>; Tue,  7 May 2019 12:07:08 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hNwxC-00039E-SY; Tue, 07 May 2019 10:04:06 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=VLhp=TH=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hNwxB-000399-5u
 for xen-devel@lists.xenproject.org; Tue, 07 May 2019 10:04:05 +0000
X-Inumbo-ID: 70f6b85c-70af-11e9-843c-bc764e045a96
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 70f6b85c-70af-11e9-843c-bc764e045a96;
 Tue, 07 May 2019 10:04:03 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Tue, 07 May 2019 04:04:02 -0600
Message-Id: <5CD1580E020000780022C6D8@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.0 
Date: Tue, 07 May 2019 04:03:58 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "Eslam Elnikety" <elnikety@amazon.com>,<george.dunlap@citrix.com>
References: <20190506124624.54454-1-elnikety@amazon.com>
 <32d91d7a-a02d-65e3-d166-deb3b64ab592@citrix.com>
In-Reply-To: <32d91d7a-a02d-65e3-d166-deb3b64ab592@citrix.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: Re: [Xen-devel] [PATCH] mm: option to _always_ scrub freed domheap
 pages
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
 Julien Grall <julien.grall@arm.com>,
 xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Pj4+IE9uIDA3LjA1LjE5IGF0IDExOjU1LCA8Z2VvcmdlLmR1bmxhcEBjaXRyaXguY29tPiB3cm90
ZToKPiBPbiA1LzYvMTkgMTo0NiBQTSwgRXNsYW0gRWxuaWtldHkgd3JvdGU6Cj5bLi4uXQo+IEkn
bSB3b25kZXJpbmcgaWYgdGhpcyBzaG91bGQgZGVmYXVsdCB0byAndHJ1ZScsIGFuZCBwZW9wbGUg
d2hvIHJlYWxseQo+IHdhbnQgdGhlIGV4dHJhIHBlcmZvcm1hbmNlIHNob3VsZCB0dXJuIGl0IG9m
Zi4KCldoeSB3b3VsZCB3ZSB3YW50IHRvIGNhdGVyIGZvciBidWdneSBndWVzdHMgYnkgZGVmYXVs
dD8KCj4+IC0tLSBhL2RvY3MvbWlzYy94ZW4tY29tbWFuZC1saW5lLnBhbmRvYwo+PiArKysgYi9k
b2NzL21pc2MveGVuLWNvbW1hbmQtbGluZS5wYW5kb2MKPj4gQEAgLTI3MCw2ICsyNzAsMTQgQEAg
YW5kIG5vdCBydW5uaW5nIHNvZnRpcnFzLiBSZWR1Y2UgdGhpcyBpZiBzb2Z0aXJxcyBhcmUgbm90
IGJlaW5nIHJ1biBmcmVxdWVudGx5Cj4+ICBlbm91Z2guIFNldHRpbmcgdGhpcyB0byBhIGhpZ2gg
dmFsdWUgbWF5IGNhdXNlIGJvb3QgZmFpbHVyZSwgcGFydGljdWxhcmx5IGlmCj4+ICB0aGUgTk1J
IHdhdGNoZG9nIGlzIGFsc28gZW5hYmxlZC4KPj4gIAo+PiArIyMjIHNjcnViX2RvbWhlYXAKPj4g
Kz4gYD0gPGJvb2xlYW4+YAo+PiArCj4+ICs+IERlZmF1bHQ6IGBmYWxzZWAKPj4gKwo+PiArU2Ny
dWIgZG9tYWlucycgZnJlZWQgcGFnZXMuIFRoaXMgaXMgYSBzYWZldHkgbmV0IGFnYWluc3QgYSAo
YnVnZ3kpIGRvbWFpbgo+PiArYWNjaWRlbnRhbGx5IGxlYWtpbmcgc2VjcmV0cyBieSByZWxlYXNp
bmcgcGFnZXMgd2l0aG91dCBwcm9wZXIgc2FuaXRpemF0aW9uLgo+PiArCj4+ICAjIyMgY2xvY2tz
b3VyY2UgKHg4NikKPj4gID4gYD0gcGl0IHwgaHBldCB8IGFjcGkgfCB0c2NgCgpUaGUgZW50cmll
cyBoZXJlIGFyZSBhbHBoYWJldGljYWxseSBzb3J0ZWQsIHNvIHRoZSBhZGRpdGlvbiB3YW50cyB0
bwptb3ZlIGRvd24gcXVpdGUgYSBiaXQuCgo+PiAtLS0gYS94ZW4vY29tbW9uL3BhZ2VfYWxsb2Mu
Ywo+PiArKysgYi94ZW4vY29tbW9uL3BhZ2VfYWxsb2MuYwo+PiBAQCAtMjE0LDYgKzIxNCwxMiBA
QCBjdXN0b21fcGFyYW0oImJvb3RzY3J1YiIsIHBhcnNlX2Jvb3RzY3J1Yl9wYXJhbSk7Cj4+ICBz
dGF0aWMgdW5zaWduZWQgbG9uZyBfX2luaXRkYXRhIG9wdF9ib290c2NydWJfY2h1bmsgPSBNQigx
MjgpOwo+PiAgc2l6ZV9wYXJhbSgiYm9vdHNjcnViX2NodW5rIiwgb3B0X2Jvb3RzY3J1Yl9jaHVu
ayk7Cj4+ICAKPj4gKy8qCj4+ICsgKiBzY3J1Yl9kb21oZWFwIC0+IERvbWhlYXAgcGFnZXMgYXJl
IHNjcnViYmVkIHdoZW4gZnJlZWQKPj4gKyAqLwo+PiArc3RhdGljIGJvb2xfdCBvcHRfc2NydWJf
ZG9taGVhcCA9IDA7Cj4+ICtib29sZWFuX3BhcmFtKCJzY3J1Yl9kb21oZWFwIiwgb3B0X3NjcnVi
X2RvbWhlYXApOwo+IAo+IEknbSBzdXJlIEphbiB3aWxsIHJlcXVlc3QgdGhpcyB0byBiZSAnc2Ny
dWItZG9taGVhcCcgaW5zdGVhZCAobm90IHVzaW5nCj4gJ18nIHdoZW4geW91IGNhbiB1c2UgJy0n
KS4KCkluZGVlZCwgcGx1cyB1c2UgImJvb2wiLCBkcm9wIHRoZSBwb2ludGxlc3MgaW5pdGlhbGl6
ZXIsIGFuZCBjb3JyZWN0CnRoZSBzdHlsZSBvZiB0aGUgKHNpbmdsZSBsaW5lKSBjb21tZW50LgoK
SmFuCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhl
bi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBz
Oi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
