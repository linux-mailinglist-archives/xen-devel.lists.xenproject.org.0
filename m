Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1700F33F8D
	for <lists+xen-devel@lfdr.de>; Tue,  4 Jun 2019 09:12:45 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hY3ae-0003ic-NH; Tue, 04 Jun 2019 07:10:36 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=8ILU=UD=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hY3ad-0003iX-1p
 for xen-devel@lists.xenproject.org; Tue, 04 Jun 2019 07:10:35 +0000
X-Inumbo-ID: d839c8d4-8697-11e9-8980-bc764e045a96
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id d839c8d4-8697-11e9-8980-bc764e045a96;
 Tue, 04 Jun 2019 07:10:34 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Tue, 04 Jun 2019 01:10:33 -0600
Message-Id: <5CF619640200007800234E6E@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.1 
Date: Tue, 04 Jun 2019 01:10:28 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "Baodong Chen" <chenbaodong@mxnavi.com>
References: <1559609096-11356-1-git-send-email-chenbaodong@mxnavi.com>
In-Reply-To: <1559609096-11356-1-git-send-email-chenbaodong@mxnavi.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: Re: [Xen-devel] [PATCH v1] xen: make tracebuffer configurable
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, WeiLiu <wei.liu2@citrix.com>,
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

Pj4+IE9uIDA0LjA2LjE5IGF0IDAyOjQ0LCA8Y2hlbmJhb2RvbmdAbXhuYXZpLmNvbT4gd3JvdGU6
Cj4gLS0tIGEveGVuL2luY2x1ZGUveGVuL3RyYWNlLmgKPiArKysgYi94ZW4vaW5jbHVkZS94ZW4v
dHJhY2UuaAo+IEBAIC0yMSwxMiArMjEsMTUgQEAKPiAgI2lmbmRlZiBfX1hFTl9UUkFDRV9IX18K
PiAgI2RlZmluZSBfX1hFTl9UUkFDRV9IX18KPiAgCj4gKyNpZmRlZiBDT05GSUdfVFJBQ0VCVUZG
RVIKPiAgZXh0ZXJuIGludCB0Yl9pbml0X2RvbmU7Cj4gKyNlbmRpZgoKSWYgdGhpcyBpcyB0byBz
dGF5IHVwIGhlcmUgKHdoaWNoIEknbSBzdGlsbCBub3Qgc3VyZSBpdCBuZWVkcyB0bzsgSSBoYWQK
bWVyZWx5IGluZGljYXRlZCB0aGF0IHRoZXJlIGxpa2VseSBpcyBhIHJlYXNvbiBmb3IgdGhpcyB3
aXRob3V0IGFjdHVhbGx5Cmtub3dpbmcgd2hhdCB0aGF0IHJlYXNvbiBtaWdodCBiZSksIHRoZW4g
SSB0aGluayB0aGUgI2RlZmluZSBuZWVkcwp0byBnbyBoZXJlIGFzIHdlbGwsIGluIGFuICNlbHNl
LgoKPiBAQCAtNDcsNiArNTAsMjAgQEAgc3RhdGljIGlubGluZSB2b2lkIHRyYWNlX3Zhcih1MzIg
ZXZlbnQsIGludCBjeWNsZXMsIGludCBleHRyYSwKPiAgdm9pZCBfX3RyYWNlX2h5cGVyY2FsbCh1
aW50MzJfdCBldmVudCwgdW5zaWduZWQgbG9uZyBvcCwKPiAgICAgICAgICAgICAgICAgICAgICAg
ICBjb25zdCB4ZW5fdWxvbmdfdCAqYXJncyk7Cj4gIAo+ICsjZWxzZQo+ICsjZGVmaW5lIHRiX2lu
aXRfZG9uZSBmYWxzZQo+ICtzdGF0aWMgaW5saW5lIHZvaWQgaW5pdF90cmFjZV9idWZzKHZvaWQp
IHt9Cj4gK3N0YXRpYyBpbmxpbmUgaW50IHRiX2NvbnRyb2woc3RydWN0IHhlbl9zeXNjdGxfdGJ1
Zl9vcCAqdGJjKSB7IHJldHVybiAtRU5PU1lTOyB9CgotRU9QTk9UU1VQUAoKSmFuCgoKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWls
aW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVu
cHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
