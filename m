Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E605B27C06
	for <lists+xen-devel@lfdr.de>; Thu, 23 May 2019 13:45:12 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hTm6L-0002eL-Hi; Thu, 23 May 2019 11:41:37 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=oIoO=TX=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hTm6K-0002eG-LG
 for xen-devel@lists.xenproject.org; Thu, 23 May 2019 11:41:36 +0000
X-Inumbo-ID: b7c9b94f-7d4f-11e9-8980-bc764e045a96
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id b7c9b94f-7d4f-11e9-8980-bc764e045a96;
 Thu, 23 May 2019 11:41:35 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Thu, 23 May 2019 05:41:34 -0600
Message-Id: <5CE686ED0200007800231AC4@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.0 
Date: Thu, 23 May 2019 05:41:33 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "Andrew Cooper" <andrew.cooper3@citrix.com>
References: <1558606816-17842-1-git-send-email-andrew.cooper3@citrix.com>
 <1558606816-17842-3-git-send-email-andrew.cooper3@citrix.com>
 <5CE67C5B0200007800231A83@prv1-mh.provo.novell.com>
 <701d553c-20a8-7b1a-6023-35ed1008ce65@citrix.com>
In-Reply-To: <701d553c-20a8-7b1a-6023-35ed1008ce65@citrix.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: Re: [Xen-devel] [PATCH 2/2] docs: Introduce some hypercall page
 documentation
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
 George Dunlap <George.Dunlap@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>,
 xen-devel <xen-devel@lists.xenproject.org>,
 Ian Jackson <ian.jackson@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Pj4+IE9uIDIzLjA1LjE5IGF0IDEzOjAxLCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gT24gMjMvMDUvMjAxOSAxMTo1NiwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4+IE9uIDIz
LjA1LjE5IGF0IDEyOjIwLCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3JvdGU6Cj4+PiBU
aGlzIGFsc28gaW50cm9kdWNlZCB0aGUgdG9wLWxldmVsIEd1ZXN0IERvY3VtZW50YXRpb24gc2Vj
dGlvbi4KPj4+Cj4+PiBTaWduZWQtb2ZmLWJ5OiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVy
M0BjaXRyaXguY29tPgo+PiBMYXJnZSBwYXJ0cyBvZiB0aGlzIGFyZSBlbnRpcmVseSB4ODYtY2Vu
dHJpYywgeWV0IGh5cGVyY2FsbHMgZXhpc3QKPj4gZm9yIEFybSBhcyB3ZWxsLiBJZiB0aGlzIGlz
IGludGVudGlvbmFsLCB0aGVuIEkgdGhpbmsgeW91IHNob3VsZCBzYXkKPj4gc28gYWJvdmUuCj4g
Cj4gSXQgaXMgYWxsIHg4NiBzcGVjaWZpYywgd2hpY2ggaXMgd2h5IGl0IGlzIGdyb3VwZWQgdW5k
ZXIgIng4NiBndWVzdAo+IGRvY3VtZW50YXRpb24iLgoKTmVpdGhlciB0aGUgcGF0aCBub3IgYW55
dGhpbmcgbmVhciB0aGUgdG9wIG9mIHRoZSBhZGRlZCBmaWxlIHN1Z2dlc3QKdGhpcyBpcyAieDg2
IGd1ZXN0IGRvY3VtZW50YXRpb24iLiBIb3cgaXMgb25lIHRvIG1ha2UgdGhpcwpjb25uZWN0aW9u
PyBPciBhcmUgeW91IHJlZmVycmluZyB0byB0aGUgc29sZSBlbnRyeSB0aGF0IGVuZHMgdXAgaW4K
ZG9jcy9ndWVzdC1ndWlkZS9pbmRleC5yc3Q/CgpPbmUgb3RoZXIgcmVtYXJrOiBXaG8ncyB0aGUg
aW50ZW5kZWQgYXVkaWVuY2U/IFBlb3BsZQp3cml0aW5nIGNvZGUgdGFyZ2V0aW5nIHRoZSBoeXBl
cmNhbGwgaW50ZXJmYWNlLCBJIGFzc3VtZS4gVGhpcwppbmNsdWRlcyBwZW9wbGUgd2hvIG1heSBu
b3QgYXQgYWxsIGJlIGZhbWlsaWFyIHdpdGggdGhlIEFUJlQKcGVjdWxpYXJpdGllcyBvZiB0aGUg
YXNzZW1ibHkgbGFuZ3VhZ2UgdXNlZCAobWFpbmx5IGZvcgpuYW1pbmcgcmVnaXN0ZXJzKS4gSXQn
cyBlYXN5IGZvciB0aGUgdG8gdW5kZXJzdGFuZCB3aGF0IGlzCm1lYW50IG5ldmVydGhlbGVzcywg
YnV0IHRvIGJlIGhvbmVzdCBJJ2QgcHJlZmVyIGlmIHRoZSBTRE0gLwpQTSByZWdpc3RlciBuYW1l
cyB3ZXJlIHVzZWQgaW5zdGVhZCwgaS5lLiBpbiBwYXJ0aWN1bGFyCndpdGhvdXQgdGhlICUgcHJl
Zml4ZXMgKGJ1dCBhbHNvIG9taXR0aW5nIHRoZSAkIG9uIHRoZSBJTlQKb3BlcmFuZCkuCgo+IEFz
IGZvciBmdXR1cmUgcGxhbnMsIHRoZSBhY3R1YWwgaHlwZXJjYWxscyB3aWxsIGxpdmUgaW4gdGhl
IGFyY2hpdGVjdHVyZQo+IG5ldXRyYWwgZ3Vlc3QgZG9jdW1lbnRhdGlvbiBzZWN0aW9uLgo+IAo+
IEFSTSBkb2Vzbid0IGFjdHVhbGx5IHVzZSBhbnl0aGluZyBoZXJlLCBiZWNhdXNlIHRoZXkgaGF2
ZSBhIHNpbmdsZQo+IHNwZWMtZGVmaW5lZCBpbnN0cnVjdGlvbiBmb3IgbWFraW5nIGh5cGVyY2Fs
bHMgd2hpY2ggZXhpc3RzIGluIGFsbAo+IHZpcnQtY2FwYWJsZSBoYXJkd2FyZS4KCkJ1dCByZWdp
c3RlciB1c2FnZSB3b3VsZCBzdGlsbCBiZSByZWxldmFudCB0byBkZXNjcmliZSwgZXZlbiBpZgpp
dCBtYXkganVzdCBiZSBieSBzdGF0aW5nIHRoYXQgaXQgbWF0Y2hlcyBhIGNlcnRhaW4gQUJJIGRl
ZmluZWQKZWxzZXdoZXJlLgoKSmFuCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5m
by94ZW4tZGV2ZWw=
