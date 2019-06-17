Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D2B048015
	for <lists+xen-devel@lfdr.de>; Mon, 17 Jun 2019 12:59:06 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hcpJ1-0001CB-0B; Mon, 17 Jun 2019 10:56:07 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=wVRv=UQ=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1hcpIz-0001C6-Sz
 for xen-devel@lists.xenproject.org; Mon, 17 Jun 2019 10:56:05 +0000
X-Inumbo-ID: 7e972bf4-90ee-11e9-88a0-5bb0c8629976
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 7e972bf4-90ee-11e9-88a0-5bb0c8629976;
 Mon, 17 Jun 2019 10:56:01 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id A1C0CAB99;
 Mon, 17 Jun 2019 10:56:00 +0000 (UTC)
To: Ankur Arora <ankur.a.arora@oracle.com>, linux-kernel@vger.kernel.org,
 xen-devel@lists.xenproject.org
References: <20190509172540.12398-1-ankur.a.arora@oracle.com>
 <20190509172540.12398-17-ankur.a.arora@oracle.com>
From: Juergen Gross <jgross@suse.com>
Message-ID: <a35ab9a8-4874-fbc8-0148-aa07543e8672@suse.com>
Date: Mon, 17 Jun 2019 12:55:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190509172540.12398-17-ankur.a.arora@oracle.com>
Content-Language: de-DE
Subject: Re: [Xen-devel] [RFC PATCH 16/16] xen/grant-table: host_addr fixup
 in mapping on xenhost_r0
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
Cc: pbonzini@redhat.com, boris.ostrovsky@oracle.com, sstabellini@kernel.org,
 joao.m.martins@oracle.com, konrad.wilk@oracle.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDkuMDUuMTkgMTk6MjUsIEFua3VyIEFyb3JhIHdyb3RlOgo+IFhlbmhvc3QgdHlwZSB4ZW5o
b3N0X3IwIGRvZXMgbm90IHN1cHBvcnQgc3RhbmRhcmQgR05UVEFCT1BfbWFwX2dyYW50X3JlZgo+
IHNlbWFudGljcyAobWFwIGEgZ3JlZiBvbnRvIGEgc3BlY2lmaWVkIGhvc3RfYWRkcikuIFRoYXQn
cyBiZWNhdXNlCj4gc2luY2UgdGhlIGh5cGVydmlzb3IgaXMgbG9jYWwgKHNhbWUgYWRkcmVzcyBz
cGFjZSBhcyB0aGUgY2FsbGVyIG9mCj4gR05UVEFCT1BfbWFwX2dyYW50X3JlZiksIHRoZXJlIGlz
IG5vIGV4dGVybmFsIGVudGl0eSB0aGF0IGNvdWxkCj4gbWFwIGFuIGFyYml0cmFyeSBwYWdlIHVu
ZGVybmVhdGggYW4gYXJiaXRyYXJ5IGFkZHJlc3MuCj4gCj4gVG8gaGFuZGxlIHRoaXMsIHRoZSBH
TlRUQUJPUF9tYXBfZ3JhbnRfcmVmIGh5cGVyY2FsbCBvbiB4ZW5ob3N0X3IwCj4gdHJlYXRzIHRo
ZSBob3N0X2FkZHIgYXMgYW4gT1VUIHBhcmFtZXRlciBpbnN0ZWFkIG9mIElOIGFuZCBleHBlY3Rz
IHRoZQo+IGdudHRhYl9tYXBfcmVmcygpIGFuZCBzaW1pbGFyIHRvIGZpeHVwIGFueSBzdGF0ZSB0
aGF0IGNhY2hlcyB0aGUKPiB2YWx1ZSBvZiBob3N0X2FkZHIgZnJvbSBiZWZvcmUgdGhlIGh5cGVy
Y2FsbC4KPiAKPiBBY2NvcmRpbmdseSBnbnR0YWJfbWFwX3JlZnMoKSBub3cgYWRkcyB0d28gcGFy
YW1ldGVycywgYSBmaXh1cCBmdW5jdGlvbgo+IGFuZCBhIHBvaW50ZXIgdG8gY2FjaGVkIG1hcHMg
dG8gZml4dXA6Cj4gICBpbnQgZ250dGFiX21hcF9yZWZzKHhlbmhvc3RfdCAqeGgsIHN0cnVjdCBn
bnR0YWJfbWFwX2dyYW50X3JlZiAqbWFwX29wcywKPiAgIAkJICAgIHN0cnVjdCBnbnR0YWJfbWFw
X2dyYW50X3JlZiAqa21hcF9vcHMsCj4gLQkJICAgIHN0cnVjdCBwYWdlICoqcGFnZXMsIHVuc2ln
bmVkIGludCBjb3VudCkKPiArCQkgICAgc3RydWN0IHBhZ2UgKipwYWdlcywgZ250dGFiX21hcF9m
aXh1cF90IG1hcF9maXh1cF9mbiwKPiArCQkgICAgdm9pZCAqKm1hcF9maXh1cFtdLCB1bnNpZ25l
ZCBpbnQgY291bnQpCj4gCj4gVGhlIHJlYXNvbiB3ZSB1c2UgYSBmaXh1cCBmdW5jdGlvbiBhbmQg
bm90IGFuIGFkZGl0aW9uYWwgbWFwcGluZyBvcAo+IGluIHRoZSB4ZW5ob3N0X3QgaXMgYmVjYXVz
ZSwgZGVwZW5kaW5nIG9uIHRoZSBjYWxsZXIsIHdoYXQgd2UgYXJlIGZpeGluZwo+IG1pZ2h0IGJl
IGRpZmZlcmVudDogYmxrYmFjaywgbmV0YmFjayBmb3IgaW5zdGFuY2UgY2FjaGUgaG9zdF9hZGRy
IGluCj4gdmlhIGEgc3RydWN0IHBhZ2UgKiwgd2hpbGUgX194ZW5idXNfbWFwX3JpbmcoKSBjYWNo
ZXMgYSBwaHlzX2FkZHIuCj4gCj4gVGhpcyBwYXRjaCBmaXhlcyB1cCB4ZW4tYmxrYmFjayBhbmQg
eGVuLWdudGRldiBkcml2ZXJzLgo+IAo+IFRPRE86Cj4gICAgLSBhbHNvIHJld3JpdGUgZ250dGFi
X2JhdGNoX21hcCgpIGFuZCBfX3hlbmJ1c19tYXBfcmluZygpLgo+ICAgIC0gbW9kaWZ5IHhlbi1u
ZXRiYWNrLCBzY3NpYmFjaywgcGNpYmFjayBldGMKPiAKPiBDby1kZXZlbG9wZWQtYnk6IEpvYW8g
TWFydGlucyA8am9hby5tLm1hcnRpbnNAb3JhY2xlLmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiBBbmt1
ciBBcm9yYSA8YW5rdXIuYS5hcm9yYUBvcmFjbGUuY29tPgoKV2l0aG91dCBzZWVpbmcgdGhlIF9f
eGVuYnVzX21hcF9yaW5nKCkgbW9kaWZpY2F0aW9uIGl0IGlzIGltcG9zc2libGUgdG8KZG8gYSBw
cm9wZXIgcmV2aWV3IG9mIHRoaXMgcGF0Y2guCgoKSnVlcmdlbgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
