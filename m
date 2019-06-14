Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BFC0545C0D
	for <lists+xen-devel@lfdr.de>; Fri, 14 Jun 2019 14:04:37 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hbktT-0004Df-6M; Fri, 14 Jun 2019 12:01:19 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Qdkl=UN=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1hbktR-0004Da-O6
 for xen-devel@lists.xenproject.org; Fri, 14 Jun 2019 12:01:17 +0000
X-Inumbo-ID: 1c9cafd6-8e9c-11e9-81b5-a32c0e5d5641
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1c9cafd6-8e9c-11e9-81b5-a32c0e5d5641;
 Fri, 14 Jun 2019 12:01:16 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 60B4FADCB;
 Fri, 14 Jun 2019 12:01:15 +0000 (UTC)
To: Ankur Arora <ankur.a.arora@oracle.com>, linux-kernel@vger.kernel.org,
 xen-devel@lists.xenproject.org
References: <20190509172540.12398-1-ankur.a.arora@oracle.com>
 <20190509172540.12398-9-ankur.a.arora@oracle.com>
From: Juergen Gross <jgross@suse.com>
Message-ID: <7eb08024-73c8-ef1f-cacc-e5105102c28d@suse.com>
Date: Fri, 14 Jun 2019 14:01:14 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190509172540.12398-9-ankur.a.arora@oracle.com>
Content-Language: de-DE
Subject: Re: [Xen-devel] [RFC PATCH 08/16] x86/xen: irq/upcall handling with
 multiple xenhosts
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

T24gMDkuMDUuMTkgMTk6MjUsIEFua3VyIEFyb3JhIHdyb3RlOgo+IEZvciBjb25maWd1cmF0aW9u
cyB3aXRoIG11bHRpcGxlIHhlbmhvc3RzLCB3ZSBuZWVkIHRvIGhhbmRsZSBldmVudHMKPiBnZW5l
cmF0ZWQgZnJvbSBtdWx0aXBsZSB4ZW5ob3N0cy4KPiAKPiBIYXZpbmcgbW9yZSB0aGFuIG9uZSB1
cGNhbGwgaGFuZGxlciBtaWdodCBiZSBxdWl0ZSBoYWlyeSwgYW5kIGl0IHdvdWxkCj4gYmUgc2lt
cGxlciBpZiB0aGUgY2FsbGJhY2sgZnJvbSBMMC1YZW4gY291bGQgYmUgYm91bmNlZCB2aWEgTDEt
WGVuLgo+IFRoaXMgd2lsbCBhbHNvIG1lYW4gc2ltcGxlciBwdl9pcnFfb3BzIGNvZGUgYmVjYXVz
ZSBub3cgdGhlIElGIGZsYWcKPiBtYXBzIG9udG8gdGhlIHhoX2RlZmF1bHQtPnZjcHVfaW5mby0+
ZXZ0Y2huX3VwY2FsbF9tYXNrLgo+IAo+IEhvd2V2ZXIsIHdlIHN0aWxsIHVwZGF0ZSB0aGUgeGhf
cmVtb3RlLT52Y3B1X2luZm8tPmV2dGNobl91cGNhbGxfbWFzawo+IG9uIGEgYmVzdCBlZmZvcnQg
YmFzaXMgdG8gbWluaW1pemUgdW5uZWNlc3Nhcnkgd29yayBpbiByZW1vdGUgeGVuaG9zdC4KClRo
aXMgaXMgYW5vdGhlciBkZXNpZ24gZGVjaXNpb24geWV0IHRvIGJlIHRha2VuLgoKTXkgY3VycmVu
dCBwcmVmZXJuY2UgaXMgTDEgWGVuIG1hcHBpbmcgZXZlbnRzIGZyb20gTDAgdG8gTDEgZ3Vlc3QK
ZXZlbnRzLgoKCkp1ZXJnZW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4t
ZGV2ZWw=
