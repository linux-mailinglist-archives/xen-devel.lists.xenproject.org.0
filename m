Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D13A93CE08
	for <lists+xen-devel@lfdr.de>; Tue, 11 Jun 2019 16:07:24 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hahMx-0006in-RH; Tue, 11 Jun 2019 14:03:23 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=TTh1=UK=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hahMv-0006ii-Rf
 for xen-devel@lists.xenproject.org; Tue, 11 Jun 2019 14:03:21 +0000
X-Inumbo-ID: aad9355f-8c51-11e9-8980-bc764e045a96
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id aad9355f-8c51-11e9-8980-bc764e045a96;
 Tue, 11 Jun 2019 14:03:20 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Tue, 11 Jun 2019 08:03:19 -0600
Message-Id: <5CFFB4A30200007800237133@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.1 
Date: Tue, 11 Jun 2019 08:03:15 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "Baodong Chen" <chenbaodong@mxnavi.com>
References: <1560232949-10673-1-git-send-email-chenbaodong@mxnavi.com>
In-Reply-To: <1560232949-10673-1-git-send-email-chenbaodong@mxnavi.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: Re: [Xen-devel] [PATCH] xen/coverage: wrap coverage related things
 under 'CONFIG_COVERAGE'
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, WeiLiu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>,
 xen-devel <xen-devel@lists.xenproject.org>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Pj4+IE9uIDExLjA2LjE5IGF0IDA4OjAyLCA8Y2hlbmJhb2RvbmdAbXhuYXZpLmNvbT4gd3JvdGU6
Cj4gLS0tIGEveGVuL2FyY2gveDg2L3hlbi5sZHMuUwo+ICsrKyBiL3hlbi9hcmNoL3g4Ni94ZW4u
bGRzLlMKPiBAQCAtMjQwLDEyICsyNDAsMTQgQEAgU0VDVElPTlMKPiAgICAgICAgICAqKC5hbHRp
bnN0cnVjdGlvbnMpCj4gICAgICAgICAgX19hbHRfaW5zdHJ1Y3Rpb25zX2VuZCA9IC47Cj4gIAo+
ICsjaWYgZGVmaW5lZChDT05GSUdfQ09WRVJBR0UpCj4gICAgICAgICAuID0gQUxJR04oOCk7Cj4g
ICAgICAgICBfX2N0b3JzX3N0YXJ0ID0gLjsKPiAgICAgICAgICooLmN0b3JzKQo+ICAgICAgICAg
KiguaW5pdF9hcnJheSkKPiAgICAgICAgICooU09SVCguaW5pdF9hcnJheS4qKSkKPiAgICAgICAg
IF9fY3RvcnNfZW5kID0gLjsKPiArI2VuZGlmCgpIb3cgaXMgdGhpcyAob25seSkgY292ZXJhZ2Ug
cmVsYXRlZD8gQW5kIGhvdyBpcyBtYWtpbmcgdGhpcyBjb25kaXRpb25hbApnb2luZyB0byBoZWxw
IGluIGFueSB3YXk/CgpBbmQgaWYgd2Ugd2VyZSB0byB0YWtlIHRoaXMsIHRoZW4gcGxlYXNlIHVz
ZSB0aGUgc2hvcnRlciAjaWZkZWYuCgo+IC0tLSBhL3hlbi9jb21tb24vbGliLmMKPiArKysgYi94
ZW4vY29tbW9uL2xpYi5jCj4gQEAgLTQ5MSwxNSArNDkxLDIwIEBAIHVuc2lnbmVkIGxvbmcgbG9u
ZyBwYXJzZV9zaXplX2FuZF91bml0KGNvbnN0IGNoYXIgKnMsIGNvbnN0IGNoYXIgKipwcykKPiAg
ICAgIHJldHVybiByZXQ7Cj4gIH0KPiAgCj4gKyNpZiBkZWZpbmVkKENPTkZJR19DT1ZFUkFHRSkK
PiAgdHlwZWRlZiB2b2lkICgqY3Rvcl9mdW5jX3QpKHZvaWQpOwo+ICBleHRlcm4gY29uc3QgY3Rv
cl9mdW5jX3QgX19jdG9yc19zdGFydFtdLCBfX2N0b3JzX2VuZFtdOwo+ICsjZW5kaWYKCkFnYWlu
IC0gaG93IGRvZXMgdGhpcyBoZWxwPwoKPiArLyogc2VlICdkb2NzL2h5cGVydmlzb3ItZ3VpZGUv
Y29kZS1jb3ZlcmFnZS5yc3QnICovCj4gIHZvaWQgX19pbml0IGluaXRfY29uc3RydWN0b3JzKHZv
aWQpCgpUaGVyZSdzIG5vIG1lbnRpb24gb2YgdGhpcyBmdW5jdGlvbiBpbiB0aGUgcmVmZXJlbmNl
ZCBkb2NzIGZpbGUuCgo+ICB7Cj4gKyNpZiBkZWZpbmVkKENPTkZJR19DT1ZFUkFHRSkKPiAgICAg
IGNvbnN0IGN0b3JfZnVuY190ICpmOwo+ICAgICAgZm9yICggZiA9IF9fY3RvcnNfc3RhcnQ7IGYg
PCBfX2N0b3JzX2VuZDsgKytmICkKPiAgICAgICAgICAoKmYpKCk7Cj4gIAo+ICsjZW5kaWYKPiAg
ICAgIC8qIFB1dHRpbmcgdGhpcyBoZXJlIHNlZW1zIGFzIGdvb2QgKG9yIGJhZCkgYXMgYW55IG90
aGVyIHBsYWNlLiAqLwoKQWdhaW4sIGJlc2lkZXMgbGFja2luZyBzdWl0YWJsZSByZWFzb25pbmcg
eW91IGFsc28gc2hvdWxkIGxvb2sKbW9yZSBjbG9zZWx5LCBpbiB0aGlzIGNhc2Ugd2hlcmUgZXhh
Y3RseSBpdCBtYWtlcyBzZW5zZSB0byBwbGFjZQp0aGUgI2VuZGlmLgoKSmFuCgoKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5n
IGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJv
amVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
