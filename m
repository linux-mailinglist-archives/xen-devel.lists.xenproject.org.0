Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 218BE1480A
	for <lists+xen-devel@lfdr.de>; Mon,  6 May 2019 12:01:43 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hNaN0-0000wT-34; Mon, 06 May 2019 09:57:14 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=DZ7u=TG=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hNaMy-0000wO-SA
 for xen-devel@lists.xenproject.org; Mon, 06 May 2019 09:57:12 +0000
X-Inumbo-ID: 512caba8-6fe5-11e9-843c-bc764e045a96
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 512caba8-6fe5-11e9-843c-bc764e045a96;
 Mon, 06 May 2019 09:57:11 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Mon, 06 May 2019 03:57:10 -0600
Message-Id: <5CD004F2020000780022C1B2@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.0 
Date: Mon, 06 May 2019 03:57:06 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "Marek Marczykowski" <marmarek@invisiblethingslab.com>,
 "Juergen Gross" <jgross@suse.com>
References: <20190505132740.GT1728@mail-itl>
 <a4435002-24ef-9565-f1fb-3de6c54b1fe7@suse.com>
In-Reply-To: <a4435002-24ef-9565-f1fb-3de6c54b1fe7@suse.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: Re: [Xen-devel] {xen,
 dom0}_vga_console_info.u.vesa_lfb.lfb_base field too small
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
Cc: xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Pj4+IE9uIDA2LjA1LjE5IGF0IDEwOjA0LCA8amdyb3NzQHN1c2UuY29tPiB3cm90ZToKPiBPbiAw
NS8wNS8yMDE5IDE1OjI3LCBNYXJlayBNYXJjenlrb3dza2ktR8OzcmVja2kgd3JvdGU6Cj4+IEhp
LAo+PiAKPj4gSSBoYXZlIGEgbWFjaGluZSB0aGF0IGFsbG9jYXRlIHZlc2EgTEZCIGFib3ZlIDRH
QiwgYXMgcmVwb3J0ZWQgYnkgVUVGSQo+PiBHT1AuIEF0IDB4NDAwMDAwMDAwMCB0byBiZSBzcGVj
aWZpYy4KPj4gdmdhX2NvbnNvbGVfaW5mby51LnZlc2FfbGZiLmxmYl9iYXNlIGlzIGEgMzJiaXQg
ZmllbGQsIHNvIGl0IGdldHMKPj4gdHJ1bmNhdGVkLCBsZWFkaW5nIHRvIGFsbCBraW5kIG9mIG1l
bW9yeSBjb3JydXB0aW9ucyB3aGVuIHNvbWV0aGluZwo+PiB3cml0ZXMgdGhlcmUuCj4+IElmIHRo
YXQgd291bGQgYmUgb25seSBhYm91dCBYZW4sIHRoYXQgd291bGRuJ3QgYmUgdGhhdCBiYWQsIGJ1
dAo+PiB1bmZvcnR1bmF0ZWx5IGV4YWN0bHkgdGhlIHNhbWUgc3RydWN0dXJlIGlzIHVzZWQgYXMg
YW4gaW50ZXJmYWNlIGZvcgo+PiBkb20wIHN0YXJ0IGluZm8gKGF0IGxlYXN0IFBWIG9uZSkuCj4+
IE15IG9ubHkgaWRlYSBpcyB0byBpbnRyb2R1Y2UgeWV0IGFub3RoZXIgZW50cnkgaW4gKl92Z2Ff
Y29uc29sZV9pbmZvLnUKPj4gdW5pb24gKGVmaV9sZmI2ND8pIHdpdGggYSA2NGJpdCBsZmJfYmFz
ZSBmaWVsZC4gQW5kIG1hcmsgaXQgaW4KPj4gdmlkZW9fdHlwZSAoWEVOX1ZHQVRZUEVfRUZJX0xG
QjY0PykuIEJ1dCBJJ20gbm90IHN1cmUgaG93IG5vbi1wYXRjaGVkCj4+IExpbnV4IChvciBvdGhl
ciBzdXBwb3J0ZWQgT1Nlcykgd291bGQgcmVzcG9uZCB0byB0aGlzLiB4ZW5faW5pdF92Z2EoKSBp
bgo+PiBMaW51eCBkb2Vzbid0IHNlZW0gdG8gYmFpbCBvbiB1bmtub3duIHZpZGVvX3R5cGUsIHNv
IGl0IG1heSBiZSBmcmFnaWxlLgo+PiAKPj4gQW55IGJldHRlciBpZGVhcz8KPiAKPiBJbiBMaW51
eCBrZXJuZWwgdGhlIHNjcmVlbl9pbmZvIHN0cnVjdHVyZSBoYXMgZXh0X2xmYl9iYXNlIGZvciB0
aGF0Cj4gcHVycG9zZSAoaXQgY29udGFpbnMgdGhlIHVwcGVyIDMyIGJpdHMgb2YgbGZiX2Jhc2Up
Lgo+IAo+IFdlIGNvdWxkIGFkZCBhIHNpbWlsYXIgbWVtYmVyIHRvIFhlbidzIGRvbTBfdmdhX2Nv
bnNvbGVfaW5mby51LnZlc2FfbGZiCj4gYW5kIGxldCB0aGUga2VybmVsIGRldGVjdCBpdHMgcHJl
c2VuY2UgYnkgdXNpbmcgdGhlIHZhbHVlIG9mCj4gc3RhcnRfaW5mby5jb25zb2xlLmRvbTAuaW5m
b19zaXplIC0gdGhpcyB3b3VsZG4ndCByZXF1aXJlIGEgbmV3IHZpZGVvCj4gdHlwZSBhbmQgb2xk
IGtlcm5lbHMgd291bGQgcnVuIGFzIHRvZGF5LiBUaGUgc2FtZSBzY2hlbWUgaXMgdXNlZCBmb3IK
PiBnYmxfY2FwcyBhbmQgbW9kZV9hdHRycyBhbHJlYWR5LgoKKzEKCj4gUmVsZWF0ZWQgdG8gdGhh
dDogSSBhc3N1bWUgdGhlIGNvbW1lbnQgaW4geGVuLmggcmVnYXJkaW5nIGxmYl9iYXNlIGFuZAo+
IGxmYl9zaXplIGJlaW5nIGluIHVuaXRzIG9mIDY0a0IgaXMgd3JvbmcgYW5kIHNob3VsZCBiZSBy
ZW1vdmVkPwoKVGhlIHJlbWFyayBhcHBsaWVzIHRvIGxmYl9zaXplIG9ubHksIGFuZCB0aGVyZSBp
dCdzIGNvcnJlY3Q6IFRoZQpCSU9TIGludGVyZmFjZSB1c2VkIGhhbmRzIGJhY2sgc3VjaCBhIHZh
bHVlIGFuZAplZmlfYXJjaF92aWRlb19pbml0KCkgYWRqdXN0cyB0aGUgaW5jb21pbmcgYnl0ZS1n
cmFudWxhciB2YWx1ZQphY2NvcmRpbmdseSAoYWxiZWl0IGl0J3MgZGViYXRhYmxlIHdoZXRoZXIg
cm91bmRpbmcgdXAgaXMKYXBwcm9wcmlhdGUpLgoKSmFuCgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2
ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
