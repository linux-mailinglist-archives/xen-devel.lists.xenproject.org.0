Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BC0F47FCA
	for <lists+xen-devel@lfdr.de>; Mon, 17 Jun 2019 12:35:58 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hcown-0007s8-ON; Mon, 17 Jun 2019 10:33:09 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=LqB1=UQ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hcown-0007s3-4u
 for xen-devel@lists.xen.org; Mon, 17 Jun 2019 10:33:09 +0000
X-Inumbo-ID: 4b78d93f-90eb-11e9-8980-bc764e045a96
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 4b78d93f-90eb-11e9-8980-bc764e045a96;
 Mon, 17 Jun 2019 10:33:07 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Mon, 17 Jun 2019 04:33:06 -0600
Message-Id: <5D076C5E0200007800238C6D@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.1 
Date: Mon, 17 Jun 2019 04:33:02 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "lcy985a" <lcy985a@126.com>
References: <12faee3a.750c.16b64f00e8e.Coremail.lcy985a@126.com>
In-Reply-To: <12faee3a.750c.16b64f00e8e.Coremail.lcy985a@126.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: Re: [Xen-devel] hvmloader crashed when passthrough bridge device
 but not intel piix4 acpi pm
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
Cc: xen-devel <xen-devel@lists.xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Pj4+IE9uIDE3LjA2LjE5IGF0IDEyOjE2LCA8bGN5OTg1YUAxMjYuY29tPiB3cm90ZToKPiBXaGVu
IHBhc3N0aHJvdWdoIGEgUExYIFBDSTkwNTYgUENJIHRvIElPQnVzIGJyaWRnZSwKPiAgICAgaHZt
bG9hZGVyIHdpbGwgY3Jhc2hlZCBmb3IgaXQgZGlzYWxsb3cgaW5pdCBicmlkZ2UgY2xhc3MgcGNp
IGRldmljZQo+ICAgICBleGNlcHQgaW50ZWwgUElJWDQgQUNQSSBQTS4KClJpZ2h0IG5vdyB0aGUg
Y29uY2VwdHVhbCBtb2RlbCBpbXBsaWVzIHRoYXQgYnJpZGdlcyBhcmVuJ3Qgc3VwcG9zZWQKdG8g
YmUgcGFzc2VkIHRocm91Z2ggaW4gdGhlIGZpcnN0IHBsYWNlLiBBdCBsZWFzdCB0aGF0J3MgbXkg
dW5kZXJzdGFuZGluZy4KQ291bGQgeW91IGV4cGxhaW4gd2h5IHlvdSBuZWVkIHRvIGRvIHNvIGlu
IHRoZSBmaXJzdCBwbGFjZT8KCkZ1cnRoZXJtb3JlIG1ha2luZyBhbiBleGNsdXNpb24gb24gYSB2
ZW5kb3IvZGV2aWNlIElEIGJhc2lzIGlzCnNvbWV0aGluZyB5b3UgY2FuIHVzZSBmb3IgeW91ciBv
d24gcHVycG9zZXMsIGJ1dCBpcyB1bmxpa2VseSB0byBiZQpzdWl0YWJsZSBmb3IgdXBzdHJlYW0g
aW5jbHVzaW9uOiBXaHkgd291bGQgdGhpcyBvbmUgc3BlY2lmaWMgZGV2aWNlCmJlIGRpZmZlcmVu
dCBmcm9tIGFsbCBvdGhlciBzaW1pbGFyIG9uZXM/CgpKYW4KCgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
