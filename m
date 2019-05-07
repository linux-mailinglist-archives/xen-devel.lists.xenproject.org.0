Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 64EC115E3D
	for <lists+xen-devel@lfdr.de>; Tue,  7 May 2019 09:32:31 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hNuWz-0002uj-A0; Tue, 07 May 2019 07:28:53 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=VLhp=TH=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hNuWx-0002ue-Hq
 for xen-devel@lists.xenproject.org; Tue, 07 May 2019 07:28:51 +0000
X-Inumbo-ID: c1bee786-7099-11e9-843c-bc764e045a96
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id c1bee786-7099-11e9-843c-bc764e045a96;
 Tue, 07 May 2019 07:28:49 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Tue, 07 May 2019 01:28:49 -0600
Message-Id: <5CD133A4020000780022C58D@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.0 
Date: Tue, 07 May 2019 01:28:36 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "Roger Pau Monne" <roger.pau@citrix.com>
References: <5CC6DD090200007800229E80@prv1-mh.provo.novell.com>
 <5CC6DEA80200007800229E9D@prv1-mh.provo.novell.com>
 <20190503152142.icdzlax4arik3beg@Air-de-Roger>
In-Reply-To: <20190503152142.icdzlax4arik3beg@Air-de-Roger>
Mime-Version: 1.0
Content-Disposition: inline
Subject: Re: [Xen-devel] [PATCH 2/9] x86/IRQ: deal with move cleanup count
 state in fixup_irqs()
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>,
 xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Pj4+IE9uIDAzLjA1LjE5IGF0IDE3OjIxLCA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdyb3RlOgo+
IE9uIE1vbiwgQXByIDI5LCAyMDE5IGF0IDA1OjIzOjIwQU0gLTA2MDAsIEphbiBCZXVsaWNoIHdy
b3RlOgo+PiAtLS0KPj4gVEJEOiBUaGUgcHJvcGVyIHJlY29yZGluZyBvZiB0aGUgSVBJIGRlc3Rp
bmF0aW9ucyBhY3R1YWxseSBtYWtlcyB0aGUKPj4gICAgICBtb3ZlX2NsZWFudXBfY291bnQgZmll
bGQgcmVkdW5kYW50LiBEbyB3ZSB3YW50IHRvIGRyb3AgaXQsIGF0IHRoZQo+PiAgICAgIHByaWNl
IG9mIGEgZmV3IG1vcmUgQ1BVLW1hc2sgb3BlcmF0aW9ucz8KPiAKPiBBRkFJQ1QgdGhpcyBpcyBu
b3QgYSBob3QgcGF0aCwgc28gSSB3b3VsZCByZW1vdmUgdGhlCj4gbW92ZV9jbGVhbnVwX2NvdW50
IGZpZWxkIGFuZCBqdXN0IHdlaWdodCB0aGUgY3B1IGJpdG1hcCB3aGVuIG5lZWRlZC4KCkZUUjog
SXQncyBub3QgZnVsbHkgcmVkdW5kYW50IC0gdGhlIHBhdGNoIHJlbW92aW5nIGl0IHRoYXQgSSBo
YWQKYWRkZWQgd2FzIGFjdHVhbGx5IHRoZSByZWFzb24gZm9yIHNlZWluZyB0aGUgQVNTRVJUKCkg
dHJpZ2dlcgp0aGF0IHlvdSBkaWQgYXNrIHRvIGFkZCBpbiBwYXRjaCAxLiBUaGUgcmVhc29uIGlz
IHRoYXQgdGhlIGZpZWxkCnNlcnZlcyBhcyBhIGZsYWcgZm9yIGlycV9tb3ZlX2NsZWFudXBfaW50
ZXJydXB0KCkgd2hldGhlciB0bwphY3Qgb24gYW4gSVJRIGluIHRoZSBmaXJzdCBwbGFjZS4gV2l0
aG91dCBpdCwgdGhlIGZ1bmN0aW9uIHdpbGwKcHJlbWF0dXJlbHkgY2xlYW4gdXAgdGhlIHZlY3Rv
ciwgdGh1cyBjb25mdXNpbmcgc3Vic2VxdWVudApjb2RlIHRyeWluZyB0byBkbyB0aGUgY2xlYW51
cCB3aGVuIGl0J3MgYWN0dWFsbHkgZHVlLgoKSmFuCgoKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1h
bi9saXN0aW5mby94ZW4tZGV2ZWw=
