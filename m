Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9411869A4F
	for <lists+xen-devel@lfdr.de>; Mon, 15 Jul 2019 19:59:13 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hn5Dr-0005Bg-Nf; Mon, 15 Jul 2019 17:57:11 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=+Ns9=VM=infradead.org=amit@srs-us1.protection.inumbo.net>)
 id 1hn5Dq-0005BZ-81
 for xen-devel@lists.xenproject.org; Mon, 15 Jul 2019 17:57:10 +0000
X-Inumbo-ID: f6b1aff2-a729-11e9-8980-bc764e045a96
Received: from bombadil.infradead.org (unknown [2607:7c80:54:e::133])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id f6b1aff2-a729-11e9-8980-bc764e045a96;
 Mon, 15 Jul 2019 17:57:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
 Mime-Version:Content-Type:References:In-Reply-To:Date:To:From:Subject:
 Message-ID:Sender:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Cq0zuMOhbmxgLXZCYc9ct30OXaosGzqTK/9DuhxT404=; b=nM6N1ad4yYnf+lIoWOebNmJTE
 dN/sm31rHw5+LtJ09xPPGqOd4WA9WQNTJpQwFjFLwzuzwT7fl/scWEpLXbTmEITO+XSGXUbaJYJCB
 dzOlkZ5MEGcWuQRgvJDk6HEEEN9YN//RI1kNymF85omSugu9MiuZMP/DL5igIQnmdI6HDi0ABn1pY
 lV8YcvlbUl+amAtn7xxWVq6lJbnAPbKXqApWxyuJPL/+OTJNlB5u4idLZ9YhIArNk3PMAe9OVujJR
 W3Y6iHaRZBhNA+OvPviy/C7YBdc802OMcW7j6iX7XCXaDaDTl1itQzeZ8HcmSLEnu3vO+3HSo0p7F
 LHh1jKzQA==;
Received: from 72-21-196-64.amazon.com ([72.21.196.64]
 helo=vpn-10-50-67-212.iad2.amazon.com)
 by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
 id 1hn5Do-00075D-0w; Mon, 15 Jul 2019 17:57:08 +0000
Message-ID: <ab346fb3974edcf9341d4f5d5d755587869ba932.camel@infradead.org>
From: Amit Shah <amit@infradead.org>
To: George Dunlap <george.dunlap@citrix.com>, xen-devel
 <xen-devel@lists.xenproject.org>
Date: Mon, 15 Jul 2019 19:57:04 +0200
In-Reply-To: <3cc8ecd7-33a0-7128-c95e-90e39de6eeff@citrix.com>
References: <3cc8ecd7-33a0-7128-c95e-90e39de6eeff@citrix.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
Mime-Version: 1.0
Subject: Re: [Xen-devel] Design Session report: Toolstacks
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gTW9uLCAyMDE5LTA3LTE1IGF0IDE0OjU5ICswMTAwLCBHZW9yZ2UgRHVubGFwIHdyb3RlOgo+
IExvb2tpbmcgdGhyb3VnaCB0aGUgbm90ZXMsIGl0IHNlZW1zIGxpa2UgdGhlIGZpcnN0IHBhcnQg
b2YgdGhpcwo+IGRpc2N1c3Npb24sIHJlIGh5cGVydmlzb3IgdXBncmFkZSAvIGRvd25ncmFkZSAm
IGxpYnJhcmllcywgd2FzIHBhcnRseQo+IGNvdmVyZWQgaW4gdGhlIGRpc3RybyBzZXNzaW9uLCBp
biB3aGljaCBEZWJpYW4ncyBYZW4gdmVyc2lvbiBjby0KPiBpbnN0YWxsCj4gd2FzIGRpc2N1c3Nl
ZCBhbmQgZm91bmQgdXNlZnVsIGV2ZW4gaWYgd2UgaGFkIGEgaHlwZXJ2aXNvciAsIElhbgo+IEph
Y2tzb24KPiBhZ3JlZWQgdG8gcG9zdCBEZWJpYW4ncyBjby1pbnN0YWxsIHBhdGNoZXMuCgpZZWEu
CgpUaGF0J3MgYWxzbyB1c2VmdWwgZm9yIHRoZSBsaXZlLXVwZGF0ZSBwcm9qZWN0LCB3aGVyZSB3
ZSB3YW50IHRvIChpbgp0aGUgZnV0dXJlKSB1c2UgdGhlIHVzZXJzcGFjZSB0b29scyBhbmQgbGli
cmFyaWVzIGRlcGVuZGluZyBvbiB3aGljaApYZW4gdmVyc2lvbiBpcyBpbiB1c2UgYXQgYSB0aW1l
LgoKSXQgZG9lc24ndCBuZWVkIHRvIGJlIG11Y2ggc21hcnRlciB0aGFuIHN5bWxpbmtzIGZvciBi
aW5hcmllcyBhdCB0aGUKZmlyc3QgZ28sIGFuZCB0aGUgc3ltbGlua3MgdXBkYXRlZCBlYWNoIHRp
bWUgYSBsaXZlLXVwZGF0ZSBvcGVyYXRpb24Kc3VjY2VlZHMuCgpCZXlvbmQgdGhhdCwgZm9yIGxp
YnJhcmllcywgd2UnbGwgaGF2ZSB0byBkbyBtdWNoIHNtYXJ0ZXIgdGhpbmdzCmV2ZW50dWFsbHku
CgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1k
ZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8v
bGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
