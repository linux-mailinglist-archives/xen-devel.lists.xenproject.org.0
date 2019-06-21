Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DCEF04E9D6
	for <lists+xen-devel@lfdr.de>; Fri, 21 Jun 2019 15:48:14 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1heJqh-0004D1-N1; Fri, 21 Jun 2019 13:45:03 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=jygh=UU=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1heJqg-0004Ct-Cf
 for xen-devel@lists.xenproject.org; Fri, 21 Jun 2019 13:45:02 +0000
X-Inumbo-ID: c1a85f6e-942a-11e9-af48-eb368223392a
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c1a85f6e-942a-11e9-af48-eb368223392a;
 Fri, 21 Jun 2019 13:44:57 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Fri, 21 Jun 2019 07:44:56 -0600
Message-Id: <5D0CDF58020000780023A22E@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.1 
Date: Fri, 21 Jun 2019 07:44:56 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "Andrew Cooper" <andrew.cooper3@citrix.com>
References: <5B6BF83602000078001DC548@prv1-mh.provo.novell.com>
 <5C8B7EC0020000780021F10B@prv1-mh.provo.novell.com>
 <5C8B86FB020000780021F31D@prv1-mh.provo.novell.com>
 <9436d6db-f87e-a97b-f1da-0b00af99d422@citrix.com>
In-Reply-To: <9436d6db-f87e-a97b-f1da-0b00af99d422@citrix.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: Re: [Xen-devel] [PATCH v8 44/50] x86emul: support VPCLMULQDQ insns
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
Cc: George Dunlap <George.Dunlap@eu.citrix.com>,
 xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wei.liu2@citrix.com>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Pj4+IE9uIDIxLjA2LjE5IGF0IDE0OjUyLCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gT24gMTUvMDMvMjAxOSAxMTowNSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+IEFzIHRvIHRo
ZSBmZWF0dXJlIGRlcGVuZGVuY3kgYWRqdXN0bWVudCwgd2hpbGUgc3RyaWN0bHkgc3BlYWtpbmcg
QVZYIGlzCj4+IGEgc3VmZmljaWVudCBwcmVyZXEgKHRvIGhhdmUgWU1NIHJlZ2lzdGVycyksIDI1
Ni1iaXQgdmVjdG9ycyBvZiBpbnRlZ2Vycwo+PiBoYXZlIGdvdCBmdWxseSBpbnRyb2R1Y2VkIHdp
dGggQVZYMiBvbmx5LiBTYWRseSBnY2MgY2FuJ3QgYmUgdXNlZCBhcyBhCj4+IHJlZmVyZW5jZSBo
ZXJlOiBUaGV5IGRvbid0IHByb3ZpZGUgYW55IEFWWDUxMi1pbmRlcGVuZGVudCBidWlsdC1pbiBh
dAo+PiBhbGwuCj4+Cj4+IEFsb25nIHRoZSBsaW5lcyBvZiBQQ0xNVUxRRFEsIHNpbmNlIHRoZSBp
bnNucyBoZXJlIGFuZCBpbiBwYXJ0aWN1bGFyCj4+IHRoZWlyIG1lbW9yeSBhY2Nlc3MgcGF0dGVy
bnMgZm9sbG93IHRoZSB1c3VhbCBzY2hlbWUsIEkgZGlkbid0IHRoaW5rIGl0Cj4+IHdhcyBuZWNl
c3NhcnkgdG8gYWRkIGEgY29udHJpdmVkIHRlc3Qgc3BlY2lmaWNhbGx5IGZvciB0aGVtLCBiZXlv
bmQgdGhlCj4+IERpc3A4IHNjYWxpbmcgb25lLgo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBKYW4gQmV1
bGljaCA8amJldWxpY2hAc3VzZS5jb20+Cj4+IC0tLQo+PiBUQkQ6IFNob3VsZCBWUENMTVVMUURR
IGFsc28gZGVwZW5kIG9uIFBDTE1VTFFEUT8KPiAKPiBJIHRoaW5rIHNvLCB5ZXMuICBUaGVzZSBh
cmUgYWxsIDY0IGJ5IDY0IG11bHRpcGxpZXMgd2l0aCBhIDEyOCBiaXQKPiByZXN1bHQsIGFuZCBh
biBpbW04IHRvIGNob29zZSB3aGljaCBxdWFkd29yZHMgZ2V0IHVzZWQsIHNvIGJvdGggdGhlc2UK
PiBmZWF0dXJlcyB3aWxsIGJlIHVzaW5nIHRoZSBzaWxpY29uIGJsb2NrIGluIHRoZSB2ZWN0b3Ig
cGlwZWxpbmUuICBUaGUKPiBvbmx5IGRpZmZlcmVuY2UgaXMgd2hldGhlciBpdHMgd2lyZWQgdGhy
b3VnaCBmcm9tIHRoZSBsZWdhY3kgU1NFCj4gaW5zdHJ1Y3Rpb25zLCBvciB0aGUgW0VdVkVYIGlu
c3RydWN0aW9ucy4KPiAKPiBJIGNlcnRhaW5seSBkb24ndCBleHBlY3QgdG8gZXZlciBzZWUgaGFy
ZHdhcmUgd2l0aCBWUENMTVVMUURRIGJ1dAo+IGxhY2tpbmcgUENMTVVMUURRLgoKT2theSwgd2ls
bCBkbywgYW5kIEknbGwgYXNzdW1lIHRoYXQgLi4uCgo+PiAtLS0gYS94ZW4vdG9vbHMvZ2VuLWNw
dWlkLnB5Cj4+ICsrKyBiL3hlbi90b29scy9nZW4tY3B1aWQucHkKPj4gQEAgLTI1NSw4ICsyNTUs
OSBAQCBkZWYgY3J1bmNoX251bWJlcnMoc3RhdGUpOgo+PiAgCj4+ICAgICAgICAgICMgVGhpcyBp
cyBqdXN0IHRoZSBkZXBlbmRlbmN5IGJldHdlZW4gQVZYNTEyIGFuZCBBVlgyIG9mIFhTVEFURQo+
PiAgICAgICAgICAjIGZlYXR1cmUgZmxhZ3MuICBJZiB3YW50IHRvIHVzZSBBVlg1MTIsIEFWWDIg
bXVzdCBiZSBzdXBwb3J0ZWQgYW5kCj4+IC0gICAgICAgICMgZW5hYmxlZC4KPj4gLSAgICAgICAg
QVZYMjogW0FWWDUxMkZdLAo+PiArICAgICAgICAjIGVuYWJsZWQuICBDZXJ0YWluIGxhdGVyIGV4
dGVuc2lvbnMsIGFjdGluZyBvbiAyNTYtYml0IHZlY3RvcnMgb2YKPj4gKyAgICAgICAgIyBpbnRl
Z2VycywgYmV0dGVyIGRlcGVuZCBvbiBBVlgyIHRoYW4gQVZYLgo+PiArICAgICAgICBBVlgyOiBb
QVZYNTEyRiwgVlBDTE1VTFFEUV0sCj4gCj4gSG1tIC0gdGhpcyBpcyBhd2t3YXJkLCBiZWNhdXNl
IGluIHByYWN0aWNlLCB0aGVyZSB3b24ndCBiZSBhbnkgaGFyZHdhcmUKPiBpbiBleGlzdGVuY2Ug
d2l0aCBWUENMTVVMUURRIGFuZCBBVlgyIGJ1dCBsYWNraW5nIEFWWDUxMi4KPiAKPiBIb3dldmVy
LCB0aGUgVkVYIGVuY29kaW5nIGlzIGxlZ2l0aW1hdGUgaW4gdGhlIGFic2VuY2Ugb2YgdGhlIEVW
RVgKPiBlbmNvZGluZywgYW5kIGRvZXNuJ3QgZGVwZW5kIG9uIHRoZSBBVlg1MTIgWENSMCBzdGF0
ZS4KPiAKPiBBY2tlZC1ieTogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNv
bT4KCi4uLiB0aGlzIGlzIG1lYW50IGZvciBhIHBhdGNoIHdpdGggdGhhdCBhZGRpdGlvbiB0byB0
aGUgZGVwZW5kZW5jeSB0cmVlLgoKQnR3IC0gZm9yIEdGTkkgYW5kIGl0cyBWRVgvRVZFWCBmb3Jt
cyB0aGlzIGdldHMgZXZlbiBtb3JlIGludGVyZXN0aW5nLgpJdCBkaWRuJ3QgZXZlbiBvY2N1ciB0
byBtZSB0aGF0IHRoZXJlIGNvdWxkIGJlIG5ldyBoYXJkd2FyZSBzdXBwb3J0aW5nCkdGTkkgYnV0
IG5vIEFWWCogd2hhdHNvZXZlciwgYnV0IEkndmUgYmVlbiB0b2xkIHRoZSBjdXJyZW50IHNwbGl0
CmJldHdlZW4gU0RNIGFuZCBJU0EgZXh0ZW5zaW9ucyBkb2MgaXMgdG8gcmVmbGVjdCBleGFjdGx5
IHRoaXMuCgpKYW4KCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5v
cmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZl
bA==
