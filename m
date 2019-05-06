Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 87BA8146E9
	for <lists+xen-devel@lfdr.de>; Mon,  6 May 2019 11:00:52 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hNZRA-0002eq-Ny; Mon, 06 May 2019 08:57:28 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=DZ7u=TG=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hNZR9-0002el-KX
 for xen-devel@lists.xenproject.org; Mon, 06 May 2019 08:57:27 +0000
X-Inumbo-ID: f870fd0e-6fdc-11e9-843c-bc764e045a96
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id f870fd0e-6fdc-11e9-843c-bc764e045a96;
 Mon, 06 May 2019 08:57:26 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Mon, 06 May 2019 02:57:25 -0600
Message-Id: <5CCFF6F1020000780022C12B@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.0 
Date: Mon, 06 May 2019 02:57:21 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "Juergen Gross" <jgross@suse.com>
References: <20190506065644.7415-1-jgross@suse.com>
 <20190506065644.7415-46-jgross@suse.com>
In-Reply-To: <20190506065644.7415-46-jgross@suse.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: Re: [Xen-devel] [PATCH RFC V2 45/45] xen/sched: add scheduling
 granularity enum
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
Cc: Tim Deegan <tim@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <Ian.Jackson@eu.citrix.com>, Dario Faggioli <dfaggioli@suse.com>,
 Julien Grall <julien.grall@arm.com>,
 xen-devel <xen-devel@lists.xenproject.org>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Pj4+IE9uIDA2LjA1LjE5IGF0IDA4OjU2LCA8amdyb3NzQHN1c2UuY29tPiB3cm90ZToKPiAtLS0g
YS94ZW4vYXJjaC94ODYvc2V0dXAuYwo+ICsrKyBiL3hlbi9hcmNoL3g4Ni9zZXR1cC5jCj4gQEAg
LTE3MDEsNiArMTcwMSw4IEBAIHZvaWQgX19pbml0IG5vcmV0dXJuIF9fc3RhcnRfeGVuKHVuc2ln
bmVkIGxvbmcgbWJpX3ApCj4gICAgICAgICAgcHJpbnRrKFhFTkxPR19JTkZPICJQYXJrZWQgJXUg
Q1BVc1xuIiwgbnVtX3BhcmtlZCk7Cj4gICAgICBzbXBfY3B1c19kb25lKCk7Cj4gIAo+ICsgICAg
c2NoZWR1bGVyX3NtcF9pbml0KCk7Cj4gKwo+ICAgICAgZG9faW5pdGNhbGxzKCk7CgpUaGlzIHBs
YWNlbWVudCBhbmQgdGhlIGFjdHVhbCBpbXBsZW1lbnRhdGlvbiBvZiB0aGUgZnVuY3Rpb24gbWFr
ZQptZSB3b25kZXI6IFdoeSBkaWRuJ3QgeW91IG1ha2UgdGhpcyBhbiBpbml0Y2FsbCwgdGh1cyB0
YWtpbmcgY2FyZSBvZgpBcm0gKGF0IGxlYXN0IGluIGFuIGFic3RyYWN0IHdheSkgYXQgdGhlIHNh
bWUgdGltZT8KCj4gIHZvaWQgc2NoZWR1bGVyX3BlcmNwdV9pbml0KHVuc2lnbmVkIGludCBjcHUp
Cj4gIHsKPiAgICAgIHN0cnVjdCBzY2hlZHVsZXIgKnNjaGVkID0gcGVyX2NwdShzY2hlZHVsZXIs
IGNwdSk7Cj4gICAgICBzdHJ1Y3Qgc2NoZWRfcmVzb3VyY2UgKnNkID0gcGVyX2NwdShzY2hlZF9y
ZXMsIGNwdSk7Cj4gKyAgICBjb25zdCBjcHVtYXNrX3QgKm1hc2s7Cj4gKyAgICB1bnNpZ25lZCBp
bnQgbWFzdGVyX2NwdTsKPiArICAgIHNwaW5sb2NrX3QgKmxvY2s7Cj4gKyAgICBzdHJ1Y3Qgc2No
ZWRfaXRlbSAqb2xkX2l0ZW0sICptYXN0ZXJfaXRlbTsKPiArCj4gKyAgICBpZiAoIHN5c3RlbV9z
dGF0ZSA9PSBTWVNfU1RBVEVfcmVzdW1lICkKPiArICAgICAgICByZXR1cm47Cj4gKwo+ICsgICAg
c3dpdGNoICggb3B0X3NjaGVkX2dyYW51bGFyaXR5ICkKPiArICAgIHsKPiArICAgIGNhc2UgU0NI
RURfR1JBTl9jcHU6Cj4gKyAgICAgICAgbWFzayA9IGNwdW1hc2tfb2YoY3B1KTsKPiArICAgICAg
ICBicmVhazsKPiArICAgIGNhc2UgU0NIRURfR1JBTl9jb3JlOgo+ICsgICAgICAgIG1hc2sgPSBw
ZXJfY3B1KGNwdV9zaWJsaW5nX21hc2ssIGNwdSk7Cj4gKyAgICAgICAgYnJlYWs7Cj4gKyAgICBj
YXNlIFNDSEVEX0dSQU5fc29ja2V0Ogo+ICsgICAgICAgIG1hc2sgPSBwZXJfY3B1KGNwdV9jb3Jl
X21hc2ssIGNwdSk7Cj4gKyAgICAgICAgYnJlYWs7Cj4gKyAgICBkZWZhdWx0Ogo+ICsgICAgICAg
IEFTU0VSVF9VTlJFQUNIQUJMRSgpOwo+ICsgICAgICAgIHJldHVybjsKPiArICAgIH0KPiAgCj4g
LSAgICBpZiAoIHN5c3RlbV9zdGF0ZSAhPSBTWVNfU1RBVEVfcmVzdW1lICkKPiArICAgIGlmICgg
Y3B1ID09IDAgfHwgY3B1bWFza193ZWlnaHQobWFzaykgPT0gMSApCgpBdCBsZWFzdCBvdXRzaWRl
IG9mIHg4NiBzcGVjaWZpYyBjb2RlIEkgdGhpbmsgd2Ugc2hvdWxkIGF2b2lkCmludHJvZHVjaW5n
IChmdXJ0aGVyPykgYXNzdW1wdGlvbnMgdGhhdCBzZWVpbmcgQ1BVIDAgb24gYQpDUFUgaW5pdGlh
bGl6YXRpb24gcGF0aCBpbXBsaWVzIHRoaXMgYmVpbmcgd2hpbGUgYm9vdGluZyB0aGUKc3lzdGVt
LiBJIHdvbmRlciBhbnl3YXkgd2hldGhlciB0aGUgcmlnaHQgc2lkZSBvZiB0aGUgfHwKZG9lc24n
dCByZW5kZXIgdGhlIGxlZnQgc2lkZSByZWR1bmRhbnQuCgo+ICtzdGF0aWMgdW5zaWduZWQgaW50
IF9faW5pdCBzY2hlZF9jaGVja19ncmFudWxhcml0eSh2b2lkKQo+ICt7Cj4gKyAgICB1bnNpZ25l
ZCBpbnQgY3B1Owo+ICsgICAgdW5zaWduZWQgaW50IHNpYmxpbmdzLCBncmFuID0gMDsKPiArCj4g
KyAgICBmb3JfZWFjaF9vbmxpbmVfY3B1KCBjcHUgKQoKWW91IHdhbnQgdG8gZGVjaWRlIGZvciBv
bmUgb2YgdHdvIHBvc3NpYmxlIHN0eWxlcywgYnV0IG5vdCBhIG1peHR1cmUKb2YgYm90aDoKCiAg
ICBmb3JfZWFjaF9vbmxpbmVfY3B1ICggY3B1ICkKCm9yCgogICAgZm9yX2VhY2hfb25saW5lX2Nw
dShjcHUpCgouIFlldCB0aGVuIEknbSBhIGxpdHRsZSBwdXp6bGVkIGJ5IGl0cyB1c2UgaGVyZSBp
biB0aGUgZmlyc3QgcGxhY2UuCkdlbmVyYWxseSBJIHRoaW5rIGZvcl9lYWNoX2NwdSgpIHVzZXMg
aW4gX19pbml0IGZ1bmN0aW9ucyBhcmUKcHJvYmxlbWF0aWMsIGFzIHRoZXkgdGhlbiByZXF1aXJl
IGZ1cnRoZXIgY29kZSBlbHNld2hlcmUgdG8KZGVhbCB3aXRoIGhvdC1vbmxpbmluZy4gQSBwcmUt
U01QLWluaXRjYWxsIHBsdXMgdXNlIG9mIENQVQpub3RpZmllcnMgaXMgdHlwaWNhbGx5IG1vcmUg
YXBwcm9wcmlhdGUuCgpKYW4KCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hl
bi1kZXZlbA==
