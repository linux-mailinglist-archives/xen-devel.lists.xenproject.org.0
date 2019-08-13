Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EDF4F8B357
	for <lists+xen-devel@lfdr.de>; Tue, 13 Aug 2019 11:05:23 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hxShN-0001ML-Hx; Tue, 13 Aug 2019 09:02:33 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=oXyX=WJ=redhat.com=lersek@srs-us1.protection.inumbo.net>)
 id 1hxShM-0001MG-HN
 for xen-devel@lists.xenproject.org; Tue, 13 Aug 2019 09:02:32 +0000
X-Inumbo-ID: 15389318-bda9-11e9-bf4e-9fb6492454ae
Received: from mx1.redhat.com (unknown [209.132.183.28])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 15389318-bda9-11e9-bf4e-9fb6492454ae;
 Tue, 13 Aug 2019 09:02:31 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 21B9F308A98C;
 Tue, 13 Aug 2019 09:02:31 +0000 (UTC)
Received: from lacos-laptop-7.usersys.redhat.com (ovpn-117-193.ams2.redhat.com
 [10.36.117.193])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3DBF88246F;
 Tue, 13 Aug 2019 09:02:29 +0000 (UTC)
To: Anthony PERARD <anthony.perard@citrix.com>
References: <20190729153944.24239-1-anthony.perard@citrix.com>
 <1ba55a93-e880-6fe3-abfc-a840d956bf3c@redhat.com>
 <20190812151237.GB1289@perard.uk.xensource.com>
From: Laszlo Ersek <lersek@redhat.com>
Message-ID: <7375a551-6d61-54a8-07a8-425ca7d6e8cb@redhat.com>
Date: Tue, 13 Aug 2019 11:02:28 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20190812151237.GB1289@perard.uk.xensource.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.41]); Tue, 13 Aug 2019 09:02:31 +0000 (UTC)
Subject: Re: [Xen-devel] [edk2-devel] [PATCH v4 00/35] Specific platform to
 run OVMF in Xen PVH and HVM guests
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
Cc: Ard Biesheuvel <ard.biesheuvel@linaro.org>,
 Jordan Justen <jordan.l.justen@intel.com>, devel@edk2.groups.io,
 Julien Grall <julien.grall@arm.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 xen-devel@lists.xenproject.org,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDgvMTIvMTkgMTc6MTIsIEFudGhvbnkgUEVSQVJEIHdyb3RlOgo+IE9uIFR1ZSwgSnVsIDMw
LCAyMDE5IGF0IDAzOjEwOjEzUE0gKzAyMDAsIExhc3psbyBFcnNlayB3cm90ZToKPj4gSGkgQW50
aG9ueSwKPj4KPj4gT24gMDcvMjkvMTkgMTc6MzksIEFudGhvbnkgUEVSQVJEIHdyb3RlOgo+Pj4g
UGF0Y2ggc2VyaWVzIGF2YWlsYWJsZSBpbiB0aGlzIGdpdCBicmFuY2g6Cj4+PiBodHRwczovL3hl
bmJpdHMueGVuLm9yZy9naXQtaHR0cC9wZW9wbGUvYXBlcmFyZC9vdm1mLmdpdCBici5wbGF0Zm9y
bS14ZW4tcHZoLXY0Cj4+Pgo+Pj4gQ2hhbmdlcyBpbiB2NDoKPj4+IC0gcGF0Y2ggIk92bWZQa2cv
WGVuUGxhdGZvcm1QZWk6IFJlc2VydmUgaHZtbG9hZGVyJ3MgbWVtb3J5IG9ubHkgd2hlbiBpdCBo
YXMKPj4+ICAgcnVuIiB3YXMgcmVtb3ZlZCwgYW5kIGluc3RlYWQgYSBkaWZmZXJlbnQgY2hhbmdl
IGlzIGRvbmUgaW4KPj4+ICAgIk92bWZQa2cvWGVuUGxhdGZvcm1QZWk6IFJld29yayBtZW1vcnkg
ZGV0ZWN0aW9uIgo+Pj4gLSBvdGhlciBjaGFuZ2VzIGRldGFpbGVkIGluIHRoZSBub3RlcyBvZiBl
YWNoIHBhdGNoCj4+Cj4+IEkndmUgZ29uZSB0aHJvdWdoIHRoZSB2NCBzZXJpZXMuIElmIHJldmll
d2VycyBvbiB0aGUgeGVuLWRldmVsIGxpc3QKPj4gdGhpbmsgdjQgaXMgb2theSB0byBtZXJnZSwg
SSBjYW4gZG8gdGhhdCAod2l0aCB0aGUgc21hbGwgZml4dXBzIEkKPj4gb2ZmZXJlZCBoZXJlIGFu
ZCB0aGVyZSkuIEkgc3VnZ2VzdCB0aGF0IHdlIHdhaXQgYSBmZXcgZGF5cyAtLSBwbGVhc2UKPj4g
cGluZyBtZSB3aGVuIHlvdSBiZWxpZXZlIHRoZSByZXZpZXcgb24geGVuLWRldmVsIGhhcyBjb25j
bHVkZWQuCj4+Cj4+IElmIHlvdSBwcmVmZXIgdG8gcG9zdCB2NSwgdGhhdCB3b3JrcyBhcyB3ZWxs
IG9mIGNvdXJzZS4KPiAKPiBUaGVyZSdzIGEgZmV3IG1vcmUgc21hbGwgZml4dXAgcHJvcG9zZWQg
YnkgUm9nZXIsIHNob3VsZCBJIHBvc3QgYSB2NSBmb3IKPiB0aGVtPyAoYW5kIG1heWJlIG9ubHkg
Q0MgeW91IGFuZCB0aGUgbGlzdHMuKQo+IAo+IE90aGVyd2lzZSwgSSd2ZSBwdXNoZWQgdGhlIGJy
YW5jaCBici5wbGF0Zm9ybS14ZW4tcHZoLXY0LjEgdG8gbXkgcmVwbyBbMV0KPiB3aGVyZSBJIGJl
bGlldmUgSSd2ZSBjb2xsZWN0ZWQgYWxsIHRoZSBzbWFsbCBmaXh1cHMuCj4gWzFdIGh0dHBzOi8v
eGVuYml0cy54ZW4ub3JnL2dpdC1odHRwL3Blb3BsZS9hcGVyYXJkL292bWYuZ2l0ICBici5wbGF0
Zm9ybS14ZW4tcHZoLXY0LjEKClBsZWFzZSBwb3N0IHY1LgoKVGhhbmtzIQpMYXN6bG8KCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWls
aW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVu
cHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
