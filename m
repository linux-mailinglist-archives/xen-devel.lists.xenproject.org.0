Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B741E11A61
	for <lists+xen-devel@lfdr.de>; Thu,  2 May 2019 15:37:52 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hMBrn-0005Nh-D5; Thu, 02 May 2019 13:35:15 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=oUxd=TC=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hMBrm-0005Na-0j
 for xen-devel@lists.xenproject.org; Thu, 02 May 2019 13:35:14 +0000
X-Inumbo-ID: 1c58bf86-6cdf-11e9-843c-bc764e045a96
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 1c58bf86-6cdf-11e9-843c-bc764e045a96;
 Thu, 02 May 2019 13:35:12 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Thu, 02 May 2019 07:35:11 -0600
Message-Id: <5CCAF209020000780022B43B@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.0 
Date: Thu, 02 May 2019 07:35:05 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "Roger Pau Monne" <roger.pau@citrix.com>
References: <5CCAE256020000780022B35B@prv1-mh.provo.novell.com>
 <20190502130852.r3ohrwgr4wvfqfuf@Air-de-Roger>
In-Reply-To: <20190502130852.r3ohrwgr4wvfqfuf@Air-de-Roger>
Mime-Version: 1.0
Content-Disposition: inline
Subject: Re: [Xen-devel] [PATCH] VT-d: suppress individual flushes during
 hwdom setup
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
Cc: xen-devel <xen-devel@lists.xenproject.org>,
 Kevin Tian <kevin.tian@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Pj4+IE9uIDAyLjA1LjE5IGF0IDE1OjA4LCA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdyb3RlOgo+
IE9uIFRodSwgTWF5IDAyLCAyMDE5IGF0IDA2OjI4OjA2QU0gLTA2MDAsIEphbiBCZXVsaWNoIHdy
b3RlOgo+PiBUaGVyZSdzIGFuIGludm9jYXRpb24gb2YgaW9tbXVfZmx1c2hfYWxsKCkgaW1tZWRp
YXRlbHkgYWZ0ZXJ3YXJkcy4KPj4gCj4+IFNpZ25lZC1vZmYtYnk6IEphbiBCZXVsaWNoIDxqYmV1
bGljaEBzdXNlLmNvbT4KPj4gCj4+IC0tLSBhL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL3Z0ZC9p
b21tdS5jCj4+ICsrKyBiL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL3Z0ZC9pb21tdS5jCj4+IEBA
IC0xMzEwLDggKzEzMTAsMTEgQEAgc3RhdGljIHZvaWQgX19od2RvbV9pbml0IGludGVsX2lvbW11
X2h3ZAo+PiAgCj4+ICAgICAgc2V0dXBfaHdkb21fcGNpX2RldmljZXMoZCwgc2V0dXBfaHdkb21f
ZGV2aWNlKTsKPj4gICAgICBzZXR1cF9od2RvbV9ybXJyKGQpOwo+PiArCj4+ICAgICAgLyogTWFr
ZSBzdXJlIHdvcmthcm91bmRzIGFyZSBhcHBsaWVkIGJlZm9yZSBlbmFibGluZyB0aGUgSU9NTVUo
cykuICovCj4+ICsgICAgdGhpc19jcHUoaW9tbXVfZG9udF9mbHVzaF9pb3RsYikgPSB0cnVlOwo+
PiAgICAgIGFyY2hfaW9tbXVfaHdkb21faW5pdChkKTsKPj4gKyAgICB0aGlzX2NwdShpb21tdV9k
b250X2ZsdXNoX2lvdGxiKSA9IGZhbHNlOwo+IAo+IERvbid0IHlvdSB3YW50IHRvIGFsc28gYXZv
aWQgZmx1c2hlcyBpbiBzZXR1cF9od2RvbV9ybXJyIGFuZAo+IHNldHVwX2h3ZG9tX3BjaV9kZXZp
Y2VzPwoKV2UgcHJvYmFibHkgY291bGQsIGJ1dCB0aGUgZ2FpbiB3b3VsZCBiZSBtdWNoIGxvd2Vy
IGJlY2F1c2UKdGhlcmUgYXJlIGZhciBmZXdlciBwYWdlcyBpbnZvbHZlZCB0aGVyZS4KCkphbgoK
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2
ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xp
c3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
