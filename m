Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E56414CC51
	for <lists+xen-devel@lfdr.de>; Wed, 29 Jan 2020 15:22:27 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iwoBT-0003js-SP; Wed, 29 Jan 2020 14:19:11 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=LL5N=3S=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iwoBS-0003jm-Tx
 for xen-devel@lists.xenproject.org; Wed, 29 Jan 2020 14:19:10 +0000
X-Inumbo-ID: 50efb4b2-42a2-11ea-8396-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 50efb4b2-42a2-11ea-8396-bc764e2007e4;
 Wed, 29 Jan 2020 14:19:10 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 0D4B2AD5F;
 Wed, 29 Jan 2020 14:19:07 +0000 (UTC)
To: Anthony PERARD <anthony.perard@citrix.com>
References: <20200117105358.607910-1-anthony.perard@citrix.com>
 <20200117105358.607910-3-anthony.perard@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <af46bb71-eb4b-d17c-f434-8d076083c12c@suse.com>
Date: Wed, 29 Jan 2020 15:19:05 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <20200117105358.607910-3-anthony.perard@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [XEN PATCH v2 02/12] xen/build: Use obj-y +=
 subdir/ instead of subdir-y
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
Cc: Kevin Tian <kevin.tian@intel.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, xen-devel@lists.xenproject.org,
 Daniel De Graaf <dgdegra@tycho.nsa.gov>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTcuMDEuMjAyMCAxMTo1MywgQW50aG9ueSBQRVJBUkQgd3JvdGU6Cj4gVGhpcyBpcyBwYXJ0
IG9mIHVwZ3JhZGluZyBvdXIgYnVpbGQgc3lzdGVtIGFuZCBpbXBvcnQgbW9yZSBvZiBMaW51eCdz
Cj4gb25lLgo+IAo+IEluIExpbnV4LCBzdWJkaXIteSBpbiBNYWtlZmlsZXMgaXMgb25seSB1c2Vk
IHRvIGRlc2NlbmQgaW50bwo+IHN1YmRpcmVjdG9yeSB3aGVuIHRoZXJlIGFyZSBubyBvYmplY3Qg
dG8gYnVpbGQsIFhlbiBkb2Vzbid0IGhhdmUgdGhhdAo+IGFuZCBhbGwgc3ViZGlyIGhhdmUgb2Jq
ZWN0IHRvIGJlIGluY2x1ZGVkIGluIHRoZSBmaW5hbCBiaW5hcnkuCj4gCj4gVG8gYWxsb3cgdGhl
IG5ldyBzeW50YXgsIHRoZSAib2JqLXkiIGFuZCAic3ViZGlyLSoiIGNhbGN1bGF0aW9uIGluCj4g
UnVsZXMubWsgaXMgY2hhbmdlZCBhbmQgcGFydGlhbGx5IGltcG9ydGVkIGZyb20gTGludXgncyBL
YnVpbGQuCj4gCj4gVGhlIGNvbW1hbmQgdXNlZCB0byBtb2RpZnkgdGhlIE1ha2VmaWxlIHdhczoK
PiAgICAgc2VkIC1pIC1yICdzI15zdWJkaXItKC4qKSNvYmotXDEvIzsnICoqL01ha2VmaWxlCj4g
Cj4gU2lnbmVkLW9mZi1ieTogQW50aG9ueSBQRVJBUkQgPGFudGhvbnkucGVyYXJkQGNpdHJpeC5j
b20+CgpSZXZpZXdlZC1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgp3aXRoIHR3
byByZW1hcmtzOgoKPiAtLS0gYS94ZW4vUnVsZXMubWsKPiArKysgYi94ZW4vUnVsZXMubWsKPiBA
QCAtMTA1LDE3ICsxMDUsMTYgQEAgZGVmaW5lIGdlbmRlcAo+ICBlbmRlZgo+ICAkKGZvcmVhY2gg
bywkKGZpbHRlci1vdXQgJS8sJChvYmoteSkgJChvYmotYmluLXkpICQoZXh0cmEteSkpLCQoZXZh
bCAkKGNhbGwgZ2VuZGVwLCQobykpKSkKPiAgCj4gLSMgRW5zdXJlIGVhY2ggc3ViZGlyZWN0b3J5
IGhhcyBleGFjdGx5IG9uZSB0cmFpbGluZyBzbGFzaC4KPiAtc3ViZGlyLW4gOj0gJChwYXRzdWJz
dCAlLCUvLCQocGF0c3Vic3QgJS8sJSwkKHN1YmRpci1uKSAkKHN1YmRpci0pKSkKPiAtc3ViZGly
LXkgOj0gJChwYXRzdWJzdCAlLCUvLCQocGF0c3Vic3QgJS8sJSwkKHN1YmRpci15KSkpCj4gLQo+
IC0jIEFkZCBleHBsaWNpdGx5IGRlY2xhcmVkIHN1YmRpcmVjdG9yaWVzIHRvIHRoZSBvYmplY3Qg
bGlzdHMuCj4gLW9iai15ICs9ICQocGF0c3Vic3QgJS8sJS9idWlsdF9pbi5vLCQoc3ViZGlyLXkp
KQo+IC0KPiAtIyBBZGQgaW1wbGljaXRseSBkZWNsYXJlZCBzdWJkaXJlY3RvcmllcyAoaW4gdGhl
IG9iamVjdCBsaXN0cykgdG8gdGhlCj4gLSMgc3ViZGlyZWN0b3J5IGxpc3QsIGFuZCByZXdyaXRl
IHRoZSBvYmplY3QtbGlzdCBlbnRyeS4KPiAtc3ViZGlyLXkgKz0gJChmaWx0ZXIgJS8sJChvYmot
eSkpCj4gLW9iai15ICAgIDo9ICQocGF0c3Vic3QgJS8sJS9idWlsdC1pbi5vLCQob2JqLXkpKQo+
ICsjIEhhbmRsZSBvYmplY3RzIGluIHN1YmRpcnMKPiArIyAtLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KPiAr
IyBvIGlmIHdlIGVuY291bnRlciBmb28vIGluICQob2JqLXkpLCByZXBsYWNlIGl0IGJ5IGZvby9i
dWlsdF9pbi5vCj4gKyMgICBhbmQgYWRkIHRoZSBkaXJlY3RvcnkgdG8gdGhlIGxpc3Qgb2YgZGly
cyB0byBkZXNjZW5kIGludG86ICQoc3ViZGlyLXkpCj4gK19fc3ViZGlyLXkJOj0gJChmaWx0ZXIg
JS8sICQob2JqLXkpKQo+ICtzdWJkaXIteQkrPSAkKF9fc3ViZGlyLXkpCgpJIHJlYWxpemUgSSds
bCBiZSBjYWxsZWQgZ3VpbHR5IG9mIGJpa2Utc2hlZGRpbmcgYWdhaW4sIGFuZCBJIGFsc28KcmVh
bGl6ZSB0aGlzIGlzIHRoZSB3YXkgTGludXggZG9lcyBpdCwgYnV0IHdoYXQgdXNlIGlzIHRoZQpp
bnRlcm1lZGlhdGUgX19zdWJkaXIteT8gTGludXggaGFzIG5vIDJuZCB1c2UsIGFuZCBoZW5jZSBJ
IGFsc28KZG9uJ3Qgc2VlIHdoeSB3ZSB3b3VsZCBnYWluIG9uZS4gSSBmdXJ0aGVyIHRoaW5rIGFj
Y29yZGluZyB0byBvdXIKc3R5bGUgdGhlcmUgc2hvdWxkIGJlIG5vIHVzZSBvZiB0YWJzIGhlcmUu
Cgo+ICtvYmoteQkJOj0gJChwYXRzdWJzdCAlLywgJS9idWlsdF9pbi5vLCAkKG9iai15KSkKPiAr
Cj4gK3N1YmRpci1uIDo9ICQoc3ViZGlyLW4pICQoc3ViZGlyLSkgXAo+ICsJCSQoZmlsdGVyICUv
LCAkKG9iai1uKSAkKG9iai0pKQoKVGhpcyB3aWxsIGVhc2lseSBmaXQgb24gb25lIGxpbmUgKGFu
ZCBpc24ndCBhbnl0aGluZyBjbG9uZWQgZnJvbQpMaW51eCkuCgpKYW4KCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QK
WGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5v
cmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
