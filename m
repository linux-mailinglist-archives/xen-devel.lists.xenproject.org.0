Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2368245C26
	for <lists+xen-devel@lfdr.de>; Fri, 14 Jun 2019 14:07:22 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hbkwM-0004PA-QQ; Fri, 14 Jun 2019 12:04:18 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Qdkl=UN=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1hbkwL-0004P3-3G
 for xen-devel@lists.xenproject.org; Fri, 14 Jun 2019 12:04:17 +0000
X-Inumbo-ID: 870e7ab6-8e9c-11e9-89d2-ffb2d36e2260
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 870e7ab6-8e9c-11e9-89d2-ffb2d36e2260;
 Fri, 14 Jun 2019 12:04:14 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 1A226AD0C;
 Fri, 14 Jun 2019 12:04:14 +0000 (UTC)
To: Ankur Arora <ankur.a.arora@oracle.com>, linux-kernel@vger.kernel.org,
 xen-devel@lists.xenproject.org
References: <20190509172540.12398-1-ankur.a.arora@oracle.com>
 <20190509172540.12398-10-ankur.a.arora@oracle.com>
From: Juergen Gross <jgross@suse.com>
Message-ID: <c91abc40-03e3-2ebd-a878-b251a97869db@suse.com>
Date: Fri, 14 Jun 2019 14:04:13 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190509172540.12398-10-ankur.a.arora@oracle.com>
Content-Language: de-DE
Subject: Re: [Xen-devel] [RFC PATCH 09/16] xen/evtchn: support evtchn in
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

T24gMDkuMDUuMTkgMTk6MjUsIEFua3VyIEFyb3JhIHdyb3RlOgo+IExhcmdlbHkgbWVjaGFuaWNh
bCBwYXRjaCB0aGF0IGFkZHMgYSBuZXcgcGFyYW0sIHhlbmhvc3RfdCAqIHRvIHRoZQo+IGV2dGNo
biBpbnRlcmZhY2VzLiBUaGUgZXZ0Y2huIHBvcnQgaW5zdGVhZCBvZiBiZWluZyBkb21haW4gdW5p
cXVlLCBpcwo+IG5vdyBzY29wZWQgdG8geGVuaG9zdF90Lgo+IAo+IEFzIHBhcnQgb2YgdXBjYWxs
IGhhbmRsaW5nIHdlIG5vdyBsb29rIGF0IGFsbCB0aGUgeGVuaG9zdHMgYW5kLCBmb3IKPiBldnRj
aG5fMmwsIHRoZSB4ZW5ob3N0J3Mgc2hhcmVkX2luZm8gYW5kIHZjcHVfaW5mby4gT3RoZXIgdGhh
biB0aGlzCj4gZXZlbnQgaGFuZGxpbmcgaXMgbGFyZ2xleSB1bmNoYW5nZWQuCj4gCj4gTm90ZSB0
aGF0IHRoZSBJUEksIHRpbWVyLCBWSVJRLCBGVU5DVElPTiwgUE1VIGV0YyB2ZWN0b3JzIHJlbWFp
bgo+IGF0dGFjaGVkIHRvIHhoX2RlZmF1bHQuIE9ubHkgaW50ZXJkb21haW4gZXZ0Y2hucyBhcmUg
YWxsb3dhYmxlIGFzCj4geGhfcmVtb3RlLgoKSSdkIGRvIG9ubHkgdGhlIGludGVyZmFjZSBjaGFu
Z2VzIGZvciBub3cgKGluY2x1ZGluZyBldnRjaG4gRklGTykuCgpUaGUgbWFpbiBkaWZmZXJlbmNl
IHdpbGwgYmUgaG93IHRvIGNhbGwgdGhlIGh5cGVydmlzb3IgZm9yIHNlbmRpbmcgYW4KZXZlbnQg
KGVpdGhlciBkaXJlY3Qgb3IgdmlhIGEgcGFzc3Rocm91Z2gtaHlwZXJjYWxsKS4KCgpKdWVyZ2Vu
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2
ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xp
c3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
