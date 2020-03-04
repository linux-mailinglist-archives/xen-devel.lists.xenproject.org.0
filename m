Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C51517949D
	for <lists+xen-devel@lfdr.de>; Wed,  4 Mar 2020 17:11:37 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j9WaJ-00082D-57; Wed, 04 Mar 2020 16:09:23 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=bsO7=4V=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1j9WaI-000827-Bc
 for xen-devel@lists.xenproject.org; Wed, 04 Mar 2020 16:09:22 +0000
X-Inumbo-ID: 81d465b8-5e32-11ea-b52f-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 81d465b8-5e32-11ea-b52f-bc764e2007e4;
 Wed, 04 Mar 2020 16:09:21 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 45A40AC5F;
 Wed,  4 Mar 2020 16:09:20 +0000 (UTC)
To: Anthony PERARD <anthony.perard@citrix.com>
References: <20200226113355.2532224-1-anthony.perard@citrix.com>
 <20200226113355.2532224-20-anthony.perard@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <25d5c758-3234-eff8-4627-66cb5b232f78@suse.com>
Date: Wed, 4 Mar 2020 17:09:19 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200226113355.2532224-20-anthony.perard@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [XEN PATCH v3 19/23] xen/build: Use
 if_changed_rules with %.o:%.c targets
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjYuMDIuMjAyMCAxMjozMywgQW50aG9ueSBQRVJBUkQgd3JvdGU6Cj4gVXNlICQoZG90LXRh
cmdldCkgdG8gaGF2ZSB0aGUgdGFyZ2V0IG5hbWUgcHJlZml4IHdpdGggYSBkb3QuCj4gCj4gTm93
LCB3aGVuIHRoZSBDQyBjb21tYW5kIGhhcyBydW4sIGl0IGlzIHJlY29yZGVkIGluIC4qLmNtZAo+
IGZpbGUsIHRoZW4gaWZfY2hhbmdlZF9ydWxlcyB3aWxsIGNvbXBhcmUgaXQgb24gc3Vic2VxdWVu
dCBydW5zLgo+IAo+IFNpZ25lZC1vZmYtYnk6IEFudGhvbnkgUEVSQVJEIDxhbnRob255LnBlcmFy
ZEBjaXRyaXguY29tPgoKUmV2aWV3ZWQtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNv
bT4Kd2l0aCBvbmUgcXVlc3Rpb246Cgo+IC0tLSBhL3hlbi9SdWxlcy5tawo+ICsrKyBiL3hlbi9S
dWxlcy5tawo+IEBAIC0xNjcsMTkgKzE2NywyNyBAQCBGT1JDRToKPiAgCj4gIFNSQ1BBVEggOj0g
JChwYXRzdWJzdCAkKEJBU0VESVIpLyUsJSwkKENVUkRJUikpCj4gIAo+IC0lLm86ICUuYyBNYWtl
ZmlsZQo+ICtxdWlldF9jbWRfY2Nfb19jID0gQ0MgICAgICAkQAo+ICBpZmVxICgkKENPTkZJR19F
TkZPUkNFX1VOSVFVRV9TWU1CT0xTKSx5KQo+IC0JJChDQykgJChjX2ZsYWdzKSAtYyAkPCAtbyAk
KEBEKS8uJChARikudG1wIC1NUSAkQAo+IC1pZmVxICgkKENPTkZJR19DQ19JU19DTEFORykseSkK
PiAtCSQoT0JKQ09QWSkgLS1yZWRlZmluZS1zeW0gJDw9JChTUkNQQVRIKS8kPCAkKEBEKS8uJChA
RikudG1wICRACj4gLWVsc2UKPiAtCSQoT0JKQ09QWSkgLS1yZWRlZmluZS1zeW0gJCg8Rik9JChT
UkNQQVRIKS8kPCAkKEBEKS8uJChARikudG1wICRACj4gLWVuZGlmCj4gLQlybSAtZiAkKEBEKS8u
JChARikudG1wCj4gKyAgICBjbWRfY2Nfb19jID0gJChDQykgJChjX2ZsYWdzKSAtYyAkPCAtbyAk
KGRvdC10YXJnZXQpLnRtcCAtTVEgJEAKPiArICAgIGlmZXEgKCQoQ09ORklHX0NDX0lTX0NMQU5H
KSx5KQo+ICsgICAgICAgIGNtZF9vYmpjb3B5X2ZpeF9zeW0gPSAkKE9CSkNPUFkpIC0tcmVkZWZp
bmUtc3ltICQ8PSQoU1JDUEFUSCkvJDwgJChkb3QtdGFyZ2V0KS50bXAgJEAKPiArICAgIGVsc2UK
PiArICAgICAgICBjbWRfb2JqY29weV9maXhfc3ltID0gJChPQkpDT1BZKSAtLXJlZGVmaW5lLXN5
bSAkKDxGKT0kKFNSQ1BBVEgpLyQ8ICQoZG90LXRhcmdldCkudG1wICRACj4gKyAgICBlbmRpZgo+
ICsgICAgY21kX29iamNvcHlfZml4X3N5bSArPSAmJiBybSAtZiAkKGRvdC10YXJnZXQpLnRtcAo+
ICBlbHNlCj4gLQkkKENDKSAkKGNfZmxhZ3MpIC1jICQ8IC1vICRACj4gKyAgICBjbWRfY2Nfb19j
ID0gJChDQykgJChjX2ZsYWdzKSAtYyAkPCAtbyAkQAo+ICBlbmRpZgo+ICAKPiArZGVmaW5lIHJ1
bGVfY2Nfb19jCj4gKyAgICAkKGNhbGwgY21kX2FuZF9yZWNvcmQsY2Nfb19jKQo+ICsgICAgJChj
YWxsIGNtZCxvYmpjb3B5X2ZpeF9zeW0pCgpUaGUgbWFjaGluZXJ5IGlzIHJlc2lsaWVudCB0byBh
IGNvbW1hbmQgKGhlcmU6IGNtZF9vYmpjb3B5X2ZpeF9zeW0pCm5vdCBiZWluZyBkZWZpbmVkLCBh
bmQgd2lsbCBuZWl0aGVyIHByb2R1Y2UgYW55IHVuZHVlIG91dHB1dCBub3IKZWxzZSBpbmN1ciBh
bnkgdW5uZWNlc3Nhcnkgb3ZlcmhlYWQ/CgpKYW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby94ZW4tZGV2ZWw=
