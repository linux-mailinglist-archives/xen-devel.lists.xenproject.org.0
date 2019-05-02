Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 14FA011A6D
	for <lists+xen-devel@lfdr.de>; Thu,  2 May 2019 15:43:59 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hMByF-0006BF-96; Thu, 02 May 2019 13:41:55 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=oUxd=TC=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hMByE-0006BA-8S
 for xen-devel@lists.xenproject.org; Thu, 02 May 2019 13:41:54 +0000
X-Inumbo-ID: 05bcc89c-6ce0-11e9-9d25-a7257b172248
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 05bcc89c-6ce0-11e9-9d25-a7257b172248;
 Thu, 02 May 2019 13:41:44 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Thu, 02 May 2019 07:41:43 -0600
Message-Id: <5CCAF395020000780022B469@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.0 
Date: Thu, 02 May 2019 07:41:41 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "Paul Durrant" <paul.durrant@citrix.com>
References: <5CCAE256020000780022B35B@prv1-mh.provo.novell.com>
 <8305316c7a2848418c030b048dff498a@AMSPEX02CL03.citrite.net>
In-Reply-To: <8305316c7a2848418c030b048dff498a@AMSPEX02CL03.citrite.net>
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

Pj4+IE9uIDAyLjA1LjE5IGF0IDE1OjEyLCA8UGF1bC5EdXJyYW50QGNpdHJpeC5jb20+IHdyb3Rl
Ogo+PiBGcm9tOiBYZW4tZGV2ZWwgW21haWx0bzp4ZW4tZGV2ZWwtYm91bmNlc0BsaXN0cy54ZW5w
cm9qZWN0Lm9yZ10gT24gQmVoYWxmIE9mIAo+IEphbiBCZXVsaWNoCj4+IFNlbnQ6IDAyIE1heSAy
MDE5IDEzOjI4Cj4+IAo+PiAtLS0gYS94ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC92dGQvaW9tbXUu
Ywo+PiArKysgYi94ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC92dGQvaW9tbXUuYwo+PiBAQCAtMTMx
MCw4ICsxMzEwLDExIEBAIHN0YXRpYyB2b2lkIF9faHdkb21faW5pdCBpbnRlbF9pb21tdV9od2QK
Pj4gCj4+ICAgICAgc2V0dXBfaHdkb21fcGNpX2RldmljZXMoZCwgc2V0dXBfaHdkb21fZGV2aWNl
KTsKPj4gICAgICBzZXR1cF9od2RvbV9ybXJyKGQpOwo+PiArCj4+ICAgICAgLyogTWFrZSBzdXJl
IHdvcmthcm91bmRzIGFyZSBhcHBsaWVkIGJlZm9yZSBlbmFibGluZyB0aGUgSU9NTVUocykuICov
Cj4+ICsgICAgdGhpc19jcHUoaW9tbXVfZG9udF9mbHVzaF9pb3RsYikgPSB0cnVlOwo+PiAgICAg
IGFyY2hfaW9tbXVfaHdkb21faW5pdChkKTsKPj4gKyAgICB0aGlzX2NwdShpb21tdV9kb250X2Zs
dXNoX2lvdGxiKSA9IGZhbHNlOwo+IAo+IFRoZXJlIHNob3VsZCBiZSBubyBuZWVkIGZvciB0aGlz
LiBhcmNoX2lvbW11X2h3ZG9tX2luaXQoKSBpcyB1c2luZyAKPiBpb21tdV9tYXAoKSwgd2hpY2gg
bm8gbG9uZ2VyIGRvZXMgaW1wbGljaXQgZmx1c2hpbmcuCgpPaCwgZ29vZCBwb2ludC4gSSBzaG91
bGQgaGF2ZSBkcm9wcGVkIHRoaXMgcGF0Y2ggKGRhdGluZyBiYWNrCnRvIE9jdG9iZXIgbGFzdCB5
ZWFyKSB3aGVuIHlvdXIgcmVzcGVjdGl2ZSBjaGFuZ2UgaGFkIGxhbmRlZC4KCkphbgoKCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFp
bGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhl
bnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
