Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DE84A6867
	for <lists+xen-devel@lfdr.de>; Tue,  3 Sep 2019 14:13:54 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i57dz-0003bO-Jg; Tue, 03 Sep 2019 12:10:43 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=j28/=W6=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1i57dy-0003bE-AM
 for xen-devel@lists.xenproject.org; Tue, 03 Sep 2019 12:10:42 +0000
X-Inumbo-ID: d8d241d4-ce43-11e9-ab91-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d8d241d4-ce43-11e9-ab91-12813bfff9fa;
 Tue, 03 Sep 2019 12:10:41 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 6BC67AD3C;
 Tue,  3 Sep 2019 12:10:40 +0000 (UTC)
To: Jan Beulich <jbeulich@suse.com>
References: <20190828080028.18205-1-jgross@suse.com>
 <20190828080028.18205-5-jgross@suse.com>
 <1c59fe9b-299f-61b9-bd9c-35930a759728@suse.com>
 <556c3cce-90aa-6ce3-4ebf-4f97252aeb38@suse.com>
 <1acbfafa-0ca7-05d4-393a-040f54245fa5@suse.com>
From: Juergen Gross <jgross@suse.com>
Message-ID: <aa583e97-6f74-7c05-5121-914bab72a645@suse.com>
Date: Tue, 3 Sep 2019 14:10:39 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <1acbfafa-0ca7-05d4-393a-040f54245fa5@suse.com>
Content-Language: de-DE
Subject: Re: [Xen-devel] [PATCH v3 4/4] xen: add per-cpu buffer option to
 debugtrace
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>, xen-devel@lists.xenproject.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDMuMDkuMTkgMTQ6MDEsIEphbiBCZXVsaWNoIHdyb3RlOgo+IE9uIDAzLjA5LjIwMTkgMTM6
MTAsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6Cj4+IE9uIDAzLjA5LjE5IDEyOjUxLCBKYW4gQmV1bGlj
aCB3cm90ZToKPj4+IE9uIDI4LjA4LjIwMTkgMTA6MDAsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6Cj4+
Pj4gK3N0YXRpYyB2b2lkIGRlYnVndHJhY2VfZHVtcF9idWZmZXIoc3RydWN0IGRlYnVndHJhY2Vf
ZGF0YV9zICpkYXRhLAo+Pj4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGNv
bnN0IGNoYXIgKndoaWNoKQo+Pj4+ICAgIHsKPj4+PiAtICAgIGlmICggIWRlYnRyX2RhdGEgfHwg
IWRlYnVndHJhY2VfdXNlZCApCj4+Pj4gKyAgICBpZiAoICFkYXRhICkKPj4+PiAgICAgICAgICAg
IHJldHVybjsKPj4+PiAgICAKPj4+PiAtICAgIHByaW50aygiZGVidWd0cmFjZV9kdW1wKCkgc3Rh
cnRpbmdcbiIpOwo+Pj4+ICsgICAgcHJpbnRrKCJkZWJ1Z3RyYWNlX2R1bXAoKSAlcyBidWZmZXIg
c3RhcnRpbmdcbiIsIHdoaWNoKTsKPj4+PiAgICAKPj4+PiAgICAgICAgLyogUHJpbnQgb2xkZXN0
IHBvcnRpb24gb2YgdGhlIHJpbmcuICovCj4+Pj4gLSAgICBBU1NFUlQoZGVidHJfZGF0YS0+YnVm
W2RlYnRyX2RhdGEtPmJ5dGVzIC0gMV0gPT0gMCk7Cj4+Pj4gLSAgICBpZiAoIGRlYnRyX2RhdGEt
PmJ1ZltkZWJ0cl9kYXRhLT5wcmRdICE9ICdcMCcgKQo+Pj4+IC0gICAgICAgIGNvbnNvbGVfc2Vy
aWFsX3B1dHMoJmRlYnRyX2RhdGEtPmJ1ZltkZWJ0cl9kYXRhLT5wcmRdLAo+Pj4+IC0gICAgICAg
ICAgICAgICAgICAgICAgICAgICAgZGVidHJfZGF0YS0+Ynl0ZXMgLSBkZWJ0cl9kYXRhLT5wcmQg
LSAxKTsKPj4+PiArICAgIEFTU0VSVChkYXRhLT5idWZbZGF0YS0+Ynl0ZXMgLSAxXSA9PSAwKTsK
Pj4+PiArICAgIGlmICggZGF0YS0+YnVmW2RhdGEtPnByZF0gIT0gJ1wwJyApCj4+Pj4gKyAgICAg
ICAgY29uc29sZV9zZXJpYWxfcHV0cygmZGF0YS0+YnVmW2RhdGEtPnByZF0sIGRhdGEtPmJ5dGVz
IC0gZGF0YS0+cHJkIC0gMSk7Cj4+Pgo+Pj4gU2VlaW5nIHRoaXMgZ2V0dGluZyBjaGFuZ2VkIHll
dCBhbm90aGVyIHRpbWUgSSBub3cgcmVhbGx5IHdvbmRlciBpZgo+Pj4gdGhpcyBudWwgdGVybWlu
YXRpb24gaXMgcmVhbGx5IHN0aWxsIG5lZWRlZCBub3cgdGhhdCBhIHNpemUgaXMgYmVpbmcKPj4+
IHBhc3NlZCBpbnRvIHRoZSBhY3R1YWwgb3V0cHV0IGZ1bmN0aW9uLiBJZiB5b3UgZ290IHJpZCBv
ZiB0aGlzIGluIGFuCj4+PiBlYXJseSBwcmVyZXEgcGF0Y2gsIHRoZSBzdWJzZXF1ZW50ICh0byB0
aGF0IG9uZSkgb25lcyB3b3VsZCBzaHJpbmsuCj4+Cj4+IFllcy4KPj4KPj4+Cj4+PiBGdXJ0aGVy
bW9yZSBJIGNhbid0IGhlbHAgdGhpbmtpbmcgdGhhdCBzYWlkIGNoYW5nZSB0byBwYXNzIHRoZSBz
aXplCj4+PiBpbnRvIHRoZSBhY3R1YWwgb3V0cHV0IGZ1bmN0aW9ucyBhY3R1YWxseSBicm9rZSB0
aGUgbG9naWMgaGVyZTogQnkKPj4+IG1lbXNldCgpLWluZyB0aGUgYnVmZmVyIHRvIHplcm8sIG91
dHB1dCBvbiBhIHN1YnNlcXVlbnQgaW52b2NhdGlvbgo+Pj4gd291bGQgaGF2ZSBiZWVuIHN1aXRh
Ymx5IHRydW5jYXRlZCAoaW4gZmFjdCwgdW50aWwgcHJkIGhhZCB3cmFwcGVkLAo+Pj4gSSB0aGlu
ayBpdCB3b3VsZCBoYXZlIGdvdCB0cnVuY2F0ZWQgbW9yZSB0aGFuIGludGVuZGVkKS4gSnVsaWVu
LAo+Pj4gY2FuIHlvdSBwbGVhc2UgbG9vayBpbnRvIHRoaXMgYXBwYXJlbnQgcmVncmVzc2lvbj8K
Pj4KPj4gSSBjYW4gZG8gdGhhdC4gUmVzZXR0aW5nIHByZCB0byAwIHdoZW4gY2xlYXJpbmcgdGhl
IGJ1ZmZlciBpcwo+PiByZXF1aXJlZCBoZXJlLgo+IAo+IEknbSBhZnJhaWQgaXQncyBub3QgdGhp
cyBzaW1wbGU6IERvaW5nIHNvIHdpbGwgY29uZnVzZQo+IGRlYnVndHJhY2VfcHJpbnRrKCkgLSBj
b25zaWRlciB0aGUgZnVuY3Rpb24gdGhlbiBzdG9yaW5nIHRoZQo+IHByZXZpb3VzbHkgbGF0Y2hl
ZCBsYXN0X3ByZCBpbnRvIGRlYnVndHJhY2VfcHJkLgoKU3VyZSwgdGhpcyBoYXMgdG8gYmUgaGFu
ZGxlZCAoYW5kIGl0IGlzIHN0aWxsIGVhc3kgdG8gZG8gc28pLgoKPiAKPj4+PiAtICAgIG9yZGVy
ID0gZ2V0X29yZGVyX2Zyb21fYnl0ZXMoYnl0ZXMpOwo+Pj4+ICsgICAgb3JkZXIgPSBnZXRfb3Jk
ZXJfZnJvbV9ieXRlcyhkZWJ1Z3RyYWNlX2J5dGVzKTsKPj4+PiAgICAgICAgZGF0YSA9IGFsbG9j
X3hlbmhlYXBfcGFnZXMob3JkZXIsIDApOwo+Pj4+ICAgICAgICBpZiAoICFkYXRhICkKPj4+PiAt
ICAgICAgICByZXR1cm4gLUVOT01FTTsKPj4+PiArICAgIHsKPj4+PiArICAgICAgICBwcmludGso
ImZhaWxlZCB0byBhbGxvY2F0ZSBkZWJ1Z3RyYWNlIGJ1ZmZlclxuIik7Cj4+Pgo+Pj4gUGVyaGFw
cyBiZXR0ZXIgdG8gYWxzbyBpbmRpY2F0ZSB3aGljaC93aG9zZSBidWZmZXI/Cj4+Cj4+IEhtbSwg
SSdtIG5vdCBzdXJlIHRoaXMgaXMgcmVhbGx5IHJlcXVpcmVkLiBJIGNhbiBhZGQgaXQgaWYgeW91
IHdhbnQsIGJ1dAo+PiBhcyBhIHVzZXIgb2YgZGVidWd0cmFjZSBJJ2QgYmUgb25seSBpbnRlcmVz
dGVkIGluIHRoZSBpbmZvcm1hdGlvbgo+PiB3aGV0aGVyIEkgY2FuIGV4cGVjdCBhbGwgdHJhY2Ug
ZW50cmllcyB0byBiZSBzZWVuIG9yIG5vdC4KPiAKPiBXZWxsLCBpZiB0aGUgYWxsb2NhdGlvbiBm
YWlscyBmb3IgYSBDUFUsIGl0J3Mgbm90IGltcG9zc2libGUgZm9yCj4gdGhlIENQVSBicmluZ3Vw
IHRvIHRoZW4gYWxzbyBmYWlsLiBTdWJzZXF1ZW50IHRvIHRoaXMgdGhlIHN5c3RlbQo+IHdvdWxk
IHRoZW4gc3RpbGwgcHJvdmlkZSBhbiBhbG1vc3QgY29tcGxldGUgc2V0IG9mIGRlYnVndHJhY2UK
PiBlbnRyaWVzIChvbmVzIGlzc3VlZCBieSBzdWJzZXF1ZW50IGJyaW5ndXAgYWN0aW9ucyB3b3Vs
ZCBiZQo+IG1pc3NpbmcpLCBfZGVzcGl0ZV8gdGhpcyBsb2cgbWVzc2FnZS4KCllvdSBzZWVtIHRv
IHdhbnQgdGhlIGluZm9ybWF0aW9uLCBzbyBJIGNhbiBhZGQgaXQuCgoKSnVlcmdlbgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxp
bmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5w
cm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
