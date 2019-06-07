Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B8519387F8
	for <lists+xen-devel@lfdr.de>; Fri,  7 Jun 2019 12:31:12 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hZC70-0000tv-S6; Fri, 07 Jun 2019 10:28:42 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=/Vp6=UG=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hZC6z-0000tq-Gz
 for xen-devel@lists.xenproject.org; Fri, 07 Jun 2019 10:28:41 +0000
X-Inumbo-ID: 046dcb57-890f-11e9-8980-bc764e045a96
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 046dcb57-890f-11e9-8980-bc764e045a96;
 Fri, 07 Jun 2019 10:28:40 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Fri, 07 Jun 2019 04:28:39 -0600
Message-Id: <5CFA3C5602000078002362F2@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.1 
Date: Fri, 07 Jun 2019 04:28:38 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: <aisaila@bitdefender.com>
References: <20190607093741.9976-1-aisaila@bitdefender.com>
In-Reply-To: <20190607093741.9976-1-aisaila@bitdefender.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: Re: [Xen-devel] [PATCH v2] x86/altp2m: Add
 xc_altp2m_get_vcpu_p2m_idx
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

Pj4+IE9uIDA3LjA2LjE5IGF0IDExOjM3LCA8YWlzYWlsYUBiaXRkZWZlbmRlci5jb20+IHdyb3Rl
Ogo+IEBAIC00NzM1LDYgKzQ3MzYsMjkgQEAgc3RhdGljIGludCBkb19hbHRwMm1fb3AoCj4gICAg
ICAgICAgICAgICAgICAgICAgX2dmbihhLnUuY2hhbmdlX2dmbi5vbGRfZ2ZuKSwKPiAgICAgICAg
ICAgICAgICAgICAgICBfZ2ZuKGEudS5jaGFuZ2VfZ2ZuLm5ld19nZm4pKTsKPiAgICAgICAgICBi
cmVhazsKPiArCj4gKyAgICBjYXNlIEhWTU9QX2FsdHAybV9nZXRfcDJtX2lkeDoKPiArICAgIHsK
PiArICAgICAgICBzdHJ1Y3QgdmNwdSAqdjsKPiArCj4gKyAgICAgICAgaWYgKCBhLnUuZ2V0X3Zj
cHVfcDJtX2lkeC52Y3B1X2lkID49IGQtPm1heF92Y3B1cyApCgpJJ20gc29ycnkgaWYgaXQgd2Fz
bid0IG9idmlvdXMgZnJvbSBib3RoIG15IGVhcmxpZXIgcmVwbHkgYW5kIHlvdQpsb29raW5nIGF0
IHRoZSBmdW5jdGlvbiwgYnV0IHRoaXMgaXMgcmVkdW5kYW50IHdpdGggLi4uCgo+ICsgICAgICAg
IHsKPiArICAgICAgICAgICAgcmMgPSAtRUlOVkFMOwo+ICsgICAgICAgICAgICBicmVhazsKPiAr
ICAgICAgICB9Cj4gKwo+ICsgICAgICAgIGlmICggIWFsdHAybV9hY3RpdmUoZCkgKQo+ICsgICAg
ICAgIHsKPiArICAgICAgICAgICAgcmMgPSAtRU9QTk9UU1VQUDsKPiArICAgICAgICAgICAgYnJl
YWs7Cj4gKyAgICAgICAgfQo+ICsKPiArICAgICAgICB2ID0gZG9tYWluX3ZjcHUoZCwgYS51Lmdl
dF92Y3B1X3AybV9pZHgudmNwdV9pZCk7CgouLi4gdGhpcyBmdW5jdGlvbiBjYWxsLiBUaGUgZnVu
Y3Rpb24gc3BlY2lmaWNhbGx5IGV4aXN0cyB0byBhYnN0cmFjdAphd2F5IHRoYXQgYm91bmRzIGNo
ZWNrIGluIGEgY29ycmVjdCAvIHNhZmUgd2F5LiBPYnZpb3VzbHkgKEkKaG9wZSkgeW91IG5lZWQg
dG8gY2hlY2sgdGhlIHJldHVybiB2YWx1ZSBvZiB0aGUgZnVuY3Rpb24uCgpBbHNvIGEgbm90ZSBv
biB0aGUgdGl0bGU6IE5hbWluZyBhIGxpYnhjIGZ1bmN0aW9uIHRoYXQgZ2V0cyBpbnRyb2R1Y2Vk
CmFuZXcgZG9lc24ndCBzZWVtIG9wdGltYWwgdG8gbWU7IGluIHBhcnRpY3VsYXIgdGhpcyBkb2Vz
bid0IGNsYXJpZnkKdGhhdCB0aGVyZSdzIGEgbmV3IGh5cGVyY2FsbCBzdWItb3AgYmVpbmcgaW50
cm9kdWNlZC4gSSdkIHN1Z2dlc3QgdG8KZWl0aGVyIHVzZSBhIHB1cmVseSB0ZXh0dWFsIHRpdGxl
IGhlcmUsIG9yIHBvaW50IG91dCB0aGUgaHlwZXJjYWxsIG9wCnRoYXQgeW91IGludHJvZHVjZSAo
YW5kIHRoYXQgdGhlIGxpYnhjIGZ1bmN0aW9uIGlzIGp1c3Qgd3JhcHBpbmcpLgoKSmFuCgoKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBt
YWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMu
eGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
