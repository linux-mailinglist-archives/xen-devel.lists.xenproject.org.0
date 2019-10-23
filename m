Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B8798E1CFC
	for <lists+xen-devel@lfdr.de>; Wed, 23 Oct 2019 15:43:58 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iNGt7-0002Ie-LC; Wed, 23 Oct 2019 13:41:21 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Og4R=YQ=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1iNGt5-0002IS-K5
 for xen-devel@lists.xenproject.org; Wed, 23 Oct 2019 13:41:19 +0000
X-Inumbo-ID: c9c5dd28-f59a-11e9-947e-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c9c5dd28-f59a-11e9-947e-12813bfff9fa;
 Wed, 23 Oct 2019 13:41:18 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id EC7C6B963;
 Wed, 23 Oct 2019 13:41:17 +0000 (UTC)
To: Ian Jackson <ian.jackson@eu.citrix.com>, xen-devel@lists.xenproject.org
References: <20191023130013.32382-1-ian.jackson@eu.citrix.com>
 <20191023130013.32382-5-ian.jackson@eu.citrix.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <1841e757-e630-2dcc-b4dd-9481268edbc0@suse.com>
Date: Wed, 23 Oct 2019 15:41:17 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <20191023130013.32382-5-ian.jackson@eu.citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [XEN PATCH for-4.13 v7 04/11] libxl:
 libxl_domain_need_memory: Make it take a domain_config
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
Cc: Anthony PERARD <anthony.perard@citrix.com>, Wei Liu <wl@xen.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjMuMTAuMTkgMTU6MDAsIElhbiBKYWNrc29uIHdyb3RlOgo+IFRoaXMgc2hvdWxkIGNhbGN1
bGF0ZSB0aGUgZXh0cmEgbWVtb3J5IG5lZWRlZCBmb3Igc2hhZG93IGFuZCBpb21tdSwKPiB0aGUg
ZGVmYXVsdHMgZm9yIHdoaWNoIGRlcGVuZCBvbiB2YWx1ZXMgaW4gY19pbmZvLiAgU28gd2UgbmVl
ZCB0aGlzIHRvCj4gaGF2ZSB0aGUgY29tcGxldGUgZG9tYWluIGNvbmZpZyBhdmFpbGFibGUuCj4g
Cj4gQW5kIHRoZSBkZWZhdWx0cyBzaG91bGQgYWN0dWFsbHkgYmUgdXBkYXRlZCBhbmQgc3RvcmVk
LiAgU28gbWFrZSBpdAo+IG5vbi1jb25zdC4KPiAKPiBXZSBwcm92aWRlIHRoZSB1c3VhbCBraW5k
IG9mIGNvbXBhdGliaWxpdHkgZnVuY3Rpb24gZm9yIGNhbGxlcnMKPiBleHBlY3RpbmcgNC4xMiBh
bmQgZWFybGllci4gIFRoaXMgZnVuY3Rpb24gYmVjb21lcyByZXNwb25zaWJsZSBmb3IgdGhlCj4g
Y2xvbmUtYW5kLW1vZGlmeSBvZiB0aGUgYl9pbmZvLgo+IAo+IE5vIG92ZXJhbGwgZnVuY3Rpb25h
bCBjaGFuZ2UgZm9yIGV4dGVybmFsIGxpYnhsIGNhbGxlcnMgd2hpY2ggdXNlIHRoZQo+IEFQSSB2
ZXJzaW9uIHN5c3RlbSB0byByZXF1ZXN0IGEgcGFydGljdWxhciBBUEkgdmVyc2lvbi4KPiAKPiBP
dGhlciBleHRlcm5hbCBsaWJ4bCBjYWxsZXJzIHdpbGwgbmVlZCB0byB1cGRhdGUgdGhlaXIgY2Fs
bGluZyBjb2RlLAo+IGFuZCB3aWxsIHRoZW4gZmluZCB0aGF0IHRoZSBuZXcgdmVyc2lvbiBvZiB0
aGlzIGZ1bmN0aW9uIGZpbGxzIGluIG1vc3QKPiBvZiB0aGUgZGVmYXVsdHMgaW4gZF9jb25maWcu
ICBCZWNhdXNlIGxpYnhsX19kb21haW5fY29uZmlnX3NldGRlZmF1bHQKPiBkb2Vzbid0IHF1aXRl
IGRvIGFsbCBvZiB0aGUgZGVmYXVsdHMsIHRoYXQncyBvbmx5IHBhcnRpYWwuICBGb3IKPiBwcmVz
ZW50IHB1cnBvc2VzIHRoYXQgZG9lc24ndCBtYXR0ZXIgYmVjYXVzZSBub25lIG9mIHRoZSBtaXNz
aW5nCj4gc2V0dGluZ3MgYXJlIHVzZWQgYnkgdGhlIG1lbW9yeSBjYWxjdWxhdGlvbnMuICBJdCBk
b2VzIG1lYW4gd2UgbmVlZCB0bwo+IGRvY3VtZW50IGluIHRoZSBBUEkgc3BlYyB0aGF0IHRoZSBk
ZWZhdWx0aW5nIGlzIG9ubHkgcGFydGlhbC4KPiAKPiBUaGlzIGxhY2sgb2YgZnVuY3Rpb25hbCBj
aGFuZ2UgaXMgZGVzcGl0ZSB0aGUgZmFjdCB0aGF0Cj4gbnVtYV9wbGFjZV9kb21haW4gbm93IG5v
IGxvbmdlciBjYWxscwo+IGxpYnhsX19kb21haW5fYnVpbGRfaW5mb19zZXRkZWZhdWx0ICh2aWEg
bGlieGxfZG9tYWluX25lZWRfbWVtb3J5KS4KPiBUaGF0IGlzIE9LIGJlY2F1c2UgaXQncyBpZGVt
cG90ZW50IGFuZCBudW1hX3BsYWNlX2RvbWFpbidzIG9uZSBjYWxsCj4gc2l0ZSBpcyBsaWJ4bF9f
YnVpbGRfcHJlIHdoaWNoIGlzIGNhbGxlZCBmcm9tIGxpYnhsX19kb21haW5fYnVpbGQKPiB3aGlj
aCBpcyBjYWxsZWQgZnJvbSBkb21jcmVhdGVfYm9vdGxvYWRlcl9kb25lLCB3ZWxsIGFmdGVyIHRo
ZQo+IGRlZmF1bHRzIGFyZSBzZXQgYnkgaW5pdGlhdGVfZG9tYWluX2NyZWF0ZS4KPiAKPiBTaWdu
ZWQtb2ZmLWJ5OiBJYW4gSmFja3NvbiA8aWFuLmphY2tzb25AZXUuY2l0cml4LmNvbT4KPiBSZXZp
ZXdlZC1ieTogQW50aG9ueSBQRVJBUkQgPGFudGhvbnkucGVyYXJkQGNpdHJpeC5jb20+CgpSZWxl
YXNlLWFja2VkLWJ5OiBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+CgoKSnVlcmdlbgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
