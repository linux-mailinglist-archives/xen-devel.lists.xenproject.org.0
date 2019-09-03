Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AD7F9A6808
	for <lists+xen-devel@lfdr.de>; Tue,  3 Sep 2019 14:04:27 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i57VW-0002ik-G3; Tue, 03 Sep 2019 12:01:58 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=CRa/=W6=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1i57VU-0002id-7e
 for xen-devel@lists.xenproject.org; Tue, 03 Sep 2019 12:01:56 +0000
X-Inumbo-ID: 9f74d722-ce42-11e9-a1fa-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9f74d722-ce42-11e9-a1fa-bc764e2007e4;
 Tue, 03 Sep 2019 12:01:55 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id AF2D2AD3C;
 Tue,  3 Sep 2019 12:01:54 +0000 (UTC)
To: Juergen Gross <jgross@suse.com>
References: <20190828080028.18205-1-jgross@suse.com>
 <20190828080028.18205-5-jgross@suse.com>
 <1c59fe9b-299f-61b9-bd9c-35930a759728@suse.com>
 <556c3cce-90aa-6ce3-4ebf-4f97252aeb38@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <1acbfafa-0ca7-05d4-393a-040f54245fa5@suse.com>
Date: Tue, 3 Sep 2019 14:01:59 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <556c3cce-90aa-6ce3-4ebf-4f97252aeb38@suse.com>
Content-Language: en-US
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDMuMDkuMjAxOSAxMzoxMCwgSnVlcmdlbiBHcm9zcyB3cm90ZToKPiBPbiAwMy4wOS4xOSAx
Mjo1MSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+IE9uIDI4LjA4LjIwMTkgMTA6MDAsIEp1ZXJnZW4g
R3Jvc3Mgd3JvdGU6Cj4+PiArc3RhdGljIHZvaWQgZGVidWd0cmFjZV9kdW1wX2J1ZmZlcihzdHJ1
Y3QgZGVidWd0cmFjZV9kYXRhX3MgKmRhdGEsCj4+PiArICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICBjb25zdCBjaGFyICp3aGljaCkKPj4+ICAgewo+Pj4gLSAgICBpZiAoICFkZWJ0
cl9kYXRhIHx8ICFkZWJ1Z3RyYWNlX3VzZWQgKQo+Pj4gKyAgICBpZiAoICFkYXRhICkKPj4+ICAg
ICAgICAgICByZXR1cm47Cj4+PiAgIAo+Pj4gLSAgICBwcmludGsoImRlYnVndHJhY2VfZHVtcCgp
IHN0YXJ0aW5nXG4iKTsKPj4+ICsgICAgcHJpbnRrKCJkZWJ1Z3RyYWNlX2R1bXAoKSAlcyBidWZm
ZXIgc3RhcnRpbmdcbiIsIHdoaWNoKTsKPj4+ICAgCj4+PiAgICAgICAvKiBQcmludCBvbGRlc3Qg
cG9ydGlvbiBvZiB0aGUgcmluZy4gKi8KPj4+IC0gICAgQVNTRVJUKGRlYnRyX2RhdGEtPmJ1Zltk
ZWJ0cl9kYXRhLT5ieXRlcyAtIDFdID09IDApOwo+Pj4gLSAgICBpZiAoIGRlYnRyX2RhdGEtPmJ1
ZltkZWJ0cl9kYXRhLT5wcmRdICE9ICdcMCcgKQo+Pj4gLSAgICAgICAgY29uc29sZV9zZXJpYWxf
cHV0cygmZGVidHJfZGF0YS0+YnVmW2RlYnRyX2RhdGEtPnByZF0sCj4+PiAtICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIGRlYnRyX2RhdGEtPmJ5dGVzIC0gZGVidHJfZGF0YS0+cHJkIC0gMSk7
Cj4+PiArICAgIEFTU0VSVChkYXRhLT5idWZbZGF0YS0+Ynl0ZXMgLSAxXSA9PSAwKTsKPj4+ICsg
ICAgaWYgKCBkYXRhLT5idWZbZGF0YS0+cHJkXSAhPSAnXDAnICkKPj4+ICsgICAgICAgIGNvbnNv
bGVfc2VyaWFsX3B1dHMoJmRhdGEtPmJ1ZltkYXRhLT5wcmRdLCBkYXRhLT5ieXRlcyAtIGRhdGEt
PnByZCAtIDEpOwo+Pgo+PiBTZWVpbmcgdGhpcyBnZXR0aW5nIGNoYW5nZWQgeWV0IGFub3RoZXIg
dGltZSBJIG5vdyByZWFsbHkgd29uZGVyIGlmCj4+IHRoaXMgbnVsIHRlcm1pbmF0aW9uIGlzIHJl
YWxseSBzdGlsbCBuZWVkZWQgbm93IHRoYXQgYSBzaXplIGlzIGJlaW5nCj4+IHBhc3NlZCBpbnRv
IHRoZSBhY3R1YWwgb3V0cHV0IGZ1bmN0aW9uLiBJZiB5b3UgZ290IHJpZCBvZiB0aGlzIGluIGFu
Cj4+IGVhcmx5IHByZXJlcSBwYXRjaCwgdGhlIHN1YnNlcXVlbnQgKHRvIHRoYXQgb25lKSBvbmVz
IHdvdWxkIHNocmluay4KPiAKPiBZZXMuCj4gCj4+Cj4+IEZ1cnRoZXJtb3JlIEkgY2FuJ3QgaGVs
cCB0aGlua2luZyB0aGF0IHNhaWQgY2hhbmdlIHRvIHBhc3MgdGhlIHNpemUKPj4gaW50byB0aGUg
YWN0dWFsIG91dHB1dCBmdW5jdGlvbnMgYWN0dWFsbHkgYnJva2UgdGhlIGxvZ2ljIGhlcmU6IEJ5
Cj4+IG1lbXNldCgpLWluZyB0aGUgYnVmZmVyIHRvIHplcm8sIG91dHB1dCBvbiBhIHN1YnNlcXVl
bnQgaW52b2NhdGlvbgo+PiB3b3VsZCBoYXZlIGJlZW4gc3VpdGFibHkgdHJ1bmNhdGVkIChpbiBm
YWN0LCB1bnRpbCBwcmQgaGFkIHdyYXBwZWQsCj4+IEkgdGhpbmsgaXQgd291bGQgaGF2ZSBnb3Qg
dHJ1bmNhdGVkIG1vcmUgdGhhbiBpbnRlbmRlZCkuIEp1bGllbiwKPj4gY2FuIHlvdSBwbGVhc2Ug
bG9vayBpbnRvIHRoaXMgYXBwYXJlbnQgcmVncmVzc2lvbj8KPiAKPiBJIGNhbiBkbyB0aGF0LiBS
ZXNldHRpbmcgcHJkIHRvIDAgd2hlbiBjbGVhcmluZyB0aGUgYnVmZmVyIGlzCj4gcmVxdWlyZWQg
aGVyZS4KCkknbSBhZnJhaWQgaXQncyBub3QgdGhpcyBzaW1wbGU6IERvaW5nIHNvIHdpbGwgY29u
ZnVzZQpkZWJ1Z3RyYWNlX3ByaW50aygpIC0gY29uc2lkZXIgdGhlIGZ1bmN0aW9uIHRoZW4gc3Rv
cmluZyB0aGUKcHJldmlvdXNseSBsYXRjaGVkIGxhc3RfcHJkIGludG8gZGVidWd0cmFjZV9wcmQu
Cgo+Pj4gLSAgICBvcmRlciA9IGdldF9vcmRlcl9mcm9tX2J5dGVzKGJ5dGVzKTsKPj4+ICsgICAg
b3JkZXIgPSBnZXRfb3JkZXJfZnJvbV9ieXRlcyhkZWJ1Z3RyYWNlX2J5dGVzKTsKPj4+ICAgICAg
IGRhdGEgPSBhbGxvY194ZW5oZWFwX3BhZ2VzKG9yZGVyLCAwKTsKPj4+ICAgICAgIGlmICggIWRh
dGEgKQo+Pj4gLSAgICAgICAgcmV0dXJuIC1FTk9NRU07Cj4+PiArICAgIHsKPj4+ICsgICAgICAg
IHByaW50aygiZmFpbGVkIHRvIGFsbG9jYXRlIGRlYnVndHJhY2UgYnVmZmVyXG4iKTsKPj4KPj4g
UGVyaGFwcyBiZXR0ZXIgdG8gYWxzbyBpbmRpY2F0ZSB3aGljaC93aG9zZSBidWZmZXI/Cj4gCj4g
SG1tLCBJJ20gbm90IHN1cmUgdGhpcyBpcyByZWFsbHkgcmVxdWlyZWQuIEkgY2FuIGFkZCBpdCBp
ZiB5b3Ugd2FudCwgYnV0Cj4gYXMgYSB1c2VyIG9mIGRlYnVndHJhY2UgSSdkIGJlIG9ubHkgaW50
ZXJlc3RlZCBpbiB0aGUgaW5mb3JtYXRpb24KPiB3aGV0aGVyIEkgY2FuIGV4cGVjdCBhbGwgdHJh
Y2UgZW50cmllcyB0byBiZSBzZWVuIG9yIG5vdC4KCldlbGwsIGlmIHRoZSBhbGxvY2F0aW9uIGZh
aWxzIGZvciBhIENQVSwgaXQncyBub3QgaW1wb3NzaWJsZSBmb3IKdGhlIENQVSBicmluZ3VwIHRv
IHRoZW4gYWxzbyBmYWlsLiBTdWJzZXF1ZW50IHRvIHRoaXMgdGhlIHN5c3RlbQp3b3VsZCB0aGVu
IHN0aWxsIHByb3ZpZGUgYW4gYWxtb3N0IGNvbXBsZXRlIHNldCBvZiBkZWJ1Z3RyYWNlCmVudHJp
ZXMgKG9uZXMgaXNzdWVkIGJ5IHN1YnNlcXVlbnQgYnJpbmd1cCBhY3Rpb25zIHdvdWxkIGJlCm1p
c3NpbmcpLCBfZGVzcGl0ZV8gdGhpcyBsb2cgbWVzc2FnZS4KCkphbgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApY
ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
