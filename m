Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 622314EBDF
	for <lists+xen-devel@lfdr.de>; Fri, 21 Jun 2019 17:23:42 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1heLLD-0005lA-1b; Fri, 21 Jun 2019 15:20:39 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=jygh=UU=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1heLLB-0005l5-Oi
 for xen-devel@lists.xenproject.org; Fri, 21 Jun 2019 15:20:37 +0000
X-Inumbo-ID: 1e05e4a4-9438-11e9-8bc4-af4b02db92f0
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1e05e4a4-9438-11e9-8bc4-af4b02db92f0;
 Fri, 21 Jun 2019 15:20:36 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Fri, 21 Jun 2019 09:20:35 -0600
Message-Id: <5D0CF5BE020000780023A3C7@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.1 
Date: Fri, 21 Jun 2019 09:20:30 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "Paul Durrant" <paul.durrant@citrix.com>
References: <20190617082358.2734-1-paul.durrant@citrix.com>
 <a517fc98-cdd7-4bc4-e096-08826399ddf7@bitdefender.com>
 <e4ec7405ea9b4c9bb94f903a51561582@AMSPEX02CL03.citrite.net>
In-Reply-To: <e4ec7405ea9b4c9bb94f903a51561582@AMSPEX02CL03.citrite.net>
Mime-Version: 1.0
Content-Disposition: inline
Subject: Re: [Xen-devel] [PATCH v2] viridian: unify time sources
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
Cc: aisaila@bitdefender.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 xen-devel <xen-devel@lists.xenproject.org>, WeiLiu <wl@xen.org>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Pj4+IE9uIDIxLjA2LjE5IGF0IDE1OjU4LCA8UGF1bC5EdXJyYW50QGNpdHJpeC5jb20+IHdyb3Rl
Ogo+PiAgLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0KPj4gRnJvbTogQWxleGFuZHJ1IFN0ZWZh
biBJU0FJTEEgPGFpc2FpbGFAYml0ZGVmZW5kZXIuY29tPgo+PiBTZW50OiAyMSBKdW5lIDIwMTkg
MTQ6NDkKPj4gVG86IFBhdWwgRHVycmFudCA8UGF1bC5EdXJyYW50QGNpdHJpeC5jb20+OyB4ZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcgCj4+IENjOiBBbmRyZXcgQ29vcGVyIDxBbmRyZXcu
Q29vcGVyM0BjaXRyaXguY29tPjsgV2VpIExpdSA8d2xAeGVuLm9yZz47IEphbiBCZXVsaWNoIAo+
IDxqYmV1bGljaEBzdXNlLmNvbT47Cj4+IFJvZ2VyIFBhdSBNb25uZSA8cm9nZXIucGF1QGNpdHJp
eC5jb20+Cj4+IFN1YmplY3Q6IFJlOiBbWGVuLWRldmVsXSBbUEFUQ0ggdjJdIHZpcmlkaWFuOiB1
bmlmeSB0aW1lIHNvdXJjZXMKPj4gCj4+ID4gICAvKgo+PiA+IEBAIC0xMzYsNyArMTAwLDcgQEAg
c3RhdGljIGludDY0X3QgdGltZV9yZWZfY291bnQoY29uc3Qgc3RydWN0IGRvbWFpbiAqZCkKPj4g
PiAgICAqIDEyOCBiaXQgbnVtYmVyIHdoaWNoIGlzIHRoZW4gc2hpZnRlZCA2NCB0aW1lcyB0byB0
aGUgcmlnaHQgdG8gb2J0YWluCj4+ID4gICAgKiB0aGUgaGlnaCA2NCBiaXRzLiIKPj4gPiAgICAq
Lwo+PiAKPj4gSXMgdGhlcmUgYSBnb29kIHJlYXNvbiBmb3IgdXNpbmcgc2lnbmVkIG9mZnNldCBo
ZXJlPyBJZiBzbyB0aGVuIG1heWJlCj4+IHlvdSBzaG91bGQgY2hhbmdlIHRoZSByZXR1cm4gdHlw
ZSBvciBjaGVjayBmb3IgYm91bmRzLgo+IAo+IFRoZSBvZmZzZXQgaXMgYWN0dWFsbHkgbmVnYXRp
dmUgbW9zdCBvZiB0aGUgdGltZSBidXQgdGhlIHJlc3VsdGluZyByZWZlcmVuY2UgCj4gdGltZSBz
aG91bGQgYmUgdW5zaWduZWQgc28gdGhlIHJldHVybiB0eXBlIG9mIHRpbWVfcmVmX2NvdW50KCkg
ZG9lcyBuZWVkIAo+IGZpeGluZy4KCklzIHN3aXRjaGluZyBpdCBmcm9tIGludDY0X3QgdG8gdWlu
dDY0X3QgYWxsIHRoYXQncyBuZWVkZWQ/IEkgY291bGQKZG8gdGhpcyB3aGlsZSBjb21taXR0aW5n
ICh3aGljaCBJIHdhcyBhYm91dCB0bykuCgpKYW4KCgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxA
bGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL3hlbi1kZXZlbA==
