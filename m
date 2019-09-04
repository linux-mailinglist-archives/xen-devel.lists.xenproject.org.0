Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F164A836B
	for <lists+xen-devel@lfdr.de>; Wed,  4 Sep 2019 15:14:49 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i5V3p-0000FH-Ur; Wed, 04 Sep 2019 13:10:57 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Tt/v=W7=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1i5V3o-0000FC-NO
 for xen-devel@lists.xenproject.org; Wed, 04 Sep 2019 13:10:56 +0000
X-Inumbo-ID: 6d1b4288-cf15-11e9-b299-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6d1b4288-cf15-11e9-b299-bc764e2007e4;
 Wed, 04 Sep 2019 13:10:54 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id A4C17AD18;
 Wed,  4 Sep 2019 13:10:53 +0000 (UTC)
To: Juergen Gross <jgross@suse.com>
References: <20190809145833.1020-1-jgross@suse.com>
 <20190809145833.1020-5-jgross@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <988df6a5-c64a-7244-3739-f6bf08b08f0c@suse.com>
Date: Wed, 4 Sep 2019 15:10:58 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190809145833.1020-5-jgross@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v2 04/48] xen/sched: introduce struct
 sched_resource
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
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <george.dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Dario Faggioli <dfaggioli@suse.com>,
 Julien Grall <julien.grall@arm.com>, Meng Xu <mengxu@cis.upenn.edu>,
 xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDkuMDguMjAxOSAxNjo1NywgSnVlcmdlbiBHcm9zcyB3cm90ZToKPiAtLS0gYS94ZW4vaW5j
bHVkZS94ZW4vc2NoZWQuaAo+ICsrKyBiL3hlbi9pbmNsdWRlL3hlbi9zY2hlZC5oCj4gQEAgLTI3
MywxMSArMjczLDE0IEBAIHN0cnVjdCB2Y3B1Cj4gICAgICBzdHJ1Y3QgYXJjaF92Y3B1IGFyY2g7
Cj4gIH07Cj4gIAo+ICtzdHJ1Y3Qgc2NoZWRfcmVzb3VyY2U7CgpBcyBtZW50aW9uZWQgZWxzZXdo
ZXJlLCBJIGRvbid0IHRoaW5rIHlvdSBuZWVkIHRoaXMgd2hlbiB0aGUgZmlyc3QKcmVmZXJlbmNl
IGlzIC4uLgoKPiAgc3RydWN0IHNjaGVkX3VuaXQgewo+ICAgICAgc3RydWN0IGRvbWFpbiAgICAg
ICAgICpkb21haW47Cj4gICAgICBzdHJ1Y3QgdmNwdSAgICAgICAgICAgKnZjcHVfbGlzdDsKPiAg
ICAgIHZvaWQgICAgICAgICAgICAgICAgICAqcHJpdjsgICAgICAvKiBzY2hlZHVsZXIgcHJpdmF0
ZSBkYXRhICovCj4gICAgICBzdHJ1Y3Qgc2NoZWRfdW5pdCAgICAgKm5leHRfaW5fbGlzdDsKPiAr
ICAgIHN0cnVjdCBzY2hlZF9yZXNvdXJjZSAqcmVzOwoKLi4uIGxpa2UgdGhpcy4gKE9yIGVsc2Ug
eW91IGNvdWxkbid0IHVzZSBzdHJ1Y3Qgc2NoZWRfdW5pdCBoZXJlCmVpdGhlciwgZm9yIHN0aWxs
IGJlaW5nIGFuIGluY29tcGxldGUgdHlwZSBhdCB0aGUgcG9pbnQgb2YgdGhlCmZpcnN0IHJlZmVy
ZW5jZSB0byBpdC4pCgpKYW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4t
ZGV2ZWw=
