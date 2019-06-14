Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E76CB45BE6
	for <lists+xen-devel@lfdr.de>; Fri, 14 Jun 2019 13:55:44 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hbkmI-0003Lt-2n; Fri, 14 Jun 2019 11:53:54 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Qdkl=UN=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1hbkmG-0003LC-H5
 for xen-devel@lists.xenproject.org; Fri, 14 Jun 2019 11:53:52 +0000
X-Inumbo-ID: 1347d290-8e9b-11e9-8980-bc764e045a96
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 1347d290-8e9b-11e9-8980-bc764e045a96;
 Fri, 14 Jun 2019 11:53:51 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 4E70AABD7;
 Fri, 14 Jun 2019 11:53:50 +0000 (UTC)
To: Ankur Arora <ankur.a.arora@oracle.com>, linux-kernel@vger.kernel.org,
 xen-devel@lists.xenproject.org
References: <20190509172540.12398-1-ankur.a.arora@oracle.com>
 <20190509172540.12398-8-ankur.a.arora@oracle.com>
From: Juergen Gross <jgross@suse.com>
Message-ID: <9f1323f4-06ae-93a5-c9b0-3b84ee549fa6@suse.com>
Date: Fri, 14 Jun 2019 13:53:49 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190509172540.12398-8-ankur.a.arora@oracle.com>
Content-Language: de-DE
Subject: Re: [Xen-devel] [RFC PATCH 07/16] x86/xen: make vcpu_info part of
 xenhost_t
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

T24gMDkuMDUuMTkgMTk6MjUsIEFua3VyIEFyb3JhIHdyb3RlOgo+IEFic3RyYWN0IG91dCB4ZW5f
dmNwdV9pZCBwcm9iaW5nIHZpYSAoKnByb2JlX3ZjcHVfaWQpKCkuIE9uY2UgdGhhdCBpcwo+IGF2
YWlsYWIsZSB0aGUgdmNwdV9pbmZvIHJlZ2lzdHJhdGlvbiBoYXBwZW5zIHZpYSB0aGUgVkNQVU9Q
IGh5cGVyY2FsbC4KPiAKPiBOb3RlIHRoYXQgZm9yIHRoZSBuZXN0ZWQgY2FzZSwgdGhlcmUgYXJl
IHR3byB2Y3B1X2lkcywgYW5kIHR3byB2Y3B1X2luZm8KPiBhcmVhcywgb25lIGVhY2ggZm9yIHRo
ZSBkZWZhdWx0IHhlbmhvc3QgYW5kIHRoZSByZW1vdGUgeGVuaG9zdC4KPiBUaGUgdmNwdV9pbmZv
IGlzIHVzZWQgdmlhIHB2X2lycV9vcHMsIGFuZCBldnRjaG4gc2lnbmFsaW5nLgo+IAo+IFRoZSBv
dGhlciBWQ1BVT1AgaHlwZXJjYWxscyBhcmUgdXNlZCBmb3IgbWFuYWdlbWVudCAoYW5kIHNjaGVk
dWxpbmcpCj4gd2hpY2ggaXMgZXhwZWN0ZWQgdG8gYmUgZG9uZSBwdXJlbHkgaW4gdGhlIGRlZmF1
bHQgaHlwZXJ2aXNvci4KPiBIb3dldmVyLCBzY2hlZHVsaW5nIG9mIEwxLWd1ZXN0IGRvZXMgaW1w
bHkgTDAtWGVuLXZjcHVfaW5mbyBzd2l0Y2hpbmcsCj4gd2hpY2ggbWlnaHQgbWVhbiB0aGF0IHRo
ZSByZW1vdGUgaHlwZXJ2aXNvciBuZWVkcyBzb21lIHZpc2liaWxpdHkKPiBpbnRvIHJlbGF0ZWQg
ZXZlbnRzL2h5cGVyY2FsbHMgaW4gdGhlIGRlZmF1bHQgaHlwZXJ2aXNvci4KCkFub3RoZXIgY2Fu
ZGlkYXRlIGZvciBkcm9wcGluZyBkdWUgdG8gbGF5ZXJpbmcgdmlvbGF0aW9uLCBJIGd1ZXNzLgoK
Ckp1ZXJnZW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Clhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0
dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
