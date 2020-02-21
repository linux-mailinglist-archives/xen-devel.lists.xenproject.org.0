Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ADD8216807E
	for <lists+xen-devel@lfdr.de>; Fri, 21 Feb 2020 15:42:14 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j59Sf-0002Fy-Hj; Fri, 21 Feb 2020 14:39:25 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=aa0I=4J=xen.org=wl@srs-us1.protection.inumbo.net>)
 id 1j59Se-0002Fs-Kr
 for xen-devel@lists.xenproject.org; Fri, 21 Feb 2020 14:39:24 +0000
X-Inumbo-ID: f40524da-54b7-11ea-868e-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f40524da-54b7-11ea-868e-12813bfff9fa;
 Fri, 21 Feb 2020 14:39:23 +0000 (UTC)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <wl@xen.org>)
 id 1j59Sb-0004dc-UB; Fri, 21 Feb 2020 14:39:21 +0000
Received: from [62.60.63.48] (helo=debian)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <wl@xen.org>)
 id 1j59Sb-0000fD-Id; Fri, 21 Feb 2020 14:39:21 +0000
Date: Fri, 21 Feb 2020 14:39:18 +0000
From: Wei Liu <wl@xen.org>
To: "Xia, Hongyan" <hongyxia@amazon.com>
Message-ID: <20200221143918.o32sq4nx3xiqc7py@debian>
References: <4058e92ce21627731c49b588a95809dc0affd83a.1581015491.git.hongyxia@amazon.com>
 <20200221115017.tuo2i5db5mhd5yyt@debian>
 <2326943257e6f04bc9a858ef5667295651395c85.camel@amazon.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <2326943257e6f04bc9a858ef5667295651395c85.camel@amazon.com>
User-Agent: NeoMutt/20180716
Subject: Re: [Xen-devel] [PATCH v2] x86/domain_page: implement pure per-vCPU
 mapping infrastructure
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
Cc: "wl@xen.org" <wl@xen.org>,
 "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>, "Grall,
 Julien" <jgrall@amazon.com>, "jbeulich@suse.com" <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "roger.pau@citrix.com" <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gRnJpLCBGZWIgMjEsIDIwMjAgYXQgMTI6NTI6MDdQTSArMDAwMCwgWGlhLCBIb25neWFuIHdy
b3RlOgo+IE9uIEZyaSwgMjAyMC0wMi0yMSBhdCAxMTo1MCArMDAwMCwgV2VpIExpdSB3cm90ZToK
PiA+IE9uIFRodSwgRmViIDA2LCAyMDIwIGF0IDA2OjU4OjIzUE0gKzAwMDAsIEhvbmd5YW4gWGlh
IHdyb3RlOgo+ID4gPiAuLi4KPiA+ID4gCj4gPiA+IEJlbmNobWFya3MKPiA+ID4gKGJhc2VsaW5l
IHVzZXMgZGlyZWN0IG1hcCBpbnN0ZWFkIG9mIHRoZSBtYXBjYWNoZSBpbgo+ID4gPiBtYXBfZG9t
YWluX3BhZ2UsCj4gPiA+IG9sZCBpcyB0aGUgZXhpc3RpbmcgbWFwY2FjaGUgYW5kIG5ldyBpcyBh
ZnRlciB0aGlzIHBhdGNoKToKPiA+ID4gCj4gPiA+IEdlZWtiZW5jaCBvbiBhIDMyLXZDUFUgZ3Vl
c3QsCj4gPiA+IAo+ID4gPiBwZXJmb3JtYW5jZSBkcm9wICAgICBvbGQgICAgICAgIG5ldwo+ID4g
PiBzaW5nbGUgY29yZSAgICAgICAgIDAuMDQlICAgICAgMC4xOCUKPiA+IAo+ID4gRG8geW91IGtu
b3cgd2h5IHRoZSBuZXcgbWFwY2FjaGUgaGFzIG1vcmUgb3ZlcmhlYWQgdGhhbiB0aGUgb2xkIG9u
ZQo+ID4gaW4KPiA+IHRoZSBzaW5nbGUgY29yZSBjYXNlPwo+IAo+IFRvIGJlIGhvbmVzdCBJIHRo
aW5rIHRoaXMgaXMgd2l0aGluIG5vaXNlIHRlcnJpdG9yeS4gVGhlIGJlbmNobWFya3MKPiB3ZXJl
IHJ1biA1IHRpbWVzLCBJIGNhbiBhdmVyYWdlIG92ZXIgZXZlbiBtb3JlIHJ1bnMgdG8gY29uZmly
bS4KCkkgd291bGQgdGhpbmsgc28gdG9vLCBiZWNhdXNlIHRoZXJlIHNob3VsZG4ndCBiZSBjb250
ZW50aW9uIGluIHNpbmdsZQp2Y3B1IGNhc2UuIEkgd2FzIGEgYml0IHN1cnByaXNlZCB0byBzZWUg
dGhlIG51bWJlcnMuCgoKWy4uLl0KPiA+ID4gKyAgICAgICAgcmMgPSBjcmVhdGVfcGVyZG9tYWlu
X21hcHBpbmcoZCwgTUFQQ0FDSEVfVklSVF9TVEFSVCwKPiA+ID4gZW50cywKPiA+ID4gICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIE5JTChsMV9wZ2VudHJ5X3QgKiks
Cj4gPiA+IE5VTEwpOwo+ID4gPiAgCj4gPiA+IC0gICAgICAgIC8qIFBvcHVsYXRlIGJpdCBtYXBz
LiAqLwo+ID4gPiAtICAgICAgICBpZiAoICFyYyApCj4gPiA+IC0gICAgICAgICAgICByYyA9IGNy
ZWF0ZV9wZXJkb21haW5fbWFwcGluZyhkLCAodW5zaWduZWQKPiA+ID4gbG9uZylkY2FjaGUtPmlu
dXNlLAo+ID4gPiAtICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgbnIs
IE5VTEwsIE5JTChzdHJ1Y3QKPiA+ID4gcGFnZV9pbmZvICopKTsKPiA+ID4gLSAgICAgICAgaWYg
KCAhcmMgKQo+ID4gPiAtICAgICAgICAgICAgcmMgPSBjcmVhdGVfcGVyZG9tYWluX21hcHBpbmco
ZCwgKHVuc2lnbmVkCj4gPiA+IGxvbmcpZGNhY2hlLT5nYXJiYWdlLAo+ID4gPiAtICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgbnIsIE5VTEwsIE5JTChzdHJ1Y3QKPiA+
ID4gcGFnZV9pbmZvICopKTsKPiA+ID4gLQo+ID4gPiAgICAgICAgICBpZiAoIHJjICkKPiA+ID4g
ICAgICAgICAgICAgIHJldHVybiByYzsKPiA+ID4gIAo+ID4gPiAgICAgICAgICBkY2FjaGUtPmVu
dHJpZXMgPSBlbnRzOwo+ID4gCj4gPiBHaXZlbiB0aGF0Ogo+ID4gCj4gPiAxLiBtYXBjYWNoZV9k
b21haW4gaXMgbm93IGEgc3RydWN0dXJlIHdpdGggb25seSBvbmUgbWVtYmVyLgo+ID4gMi4gZW50
cyBpcyBhIGNvbnN0YW50IHRocm91Z2hvdXQgZG9tYWluJ3MgbGlmZWN5Y2xlLgo+ID4gCj4gPiBZ
b3UgY2FuIHJlcGxhY2UgbWFwY2FjaGVfZG9tYWluIHdpdGggYSBib29sZWFuIC0tCj4gPiBtYXBj
YWNoZV9tYXBwaW5nX3BvcHVsYXRlZCAoPykgaW4gYXJjaC5wdi4KPiA+IAo+ID4gSWYgSSdtIG5v
dCBtaXN0YWtlbiwgdGhlIHNpemUgb2YgdGhlIG1hcHBpbmcgaXMgZGVyaXZlZCBmcm9tIHRoZSB2
Y3B1CgpJIHJlYWxseSBtZWFudCAiaXNuJ3QiIGhlcmUuCgo+ID4gYmVpbmcgaW5pdGlhbGlzZWQs
IHNvIGEgZnVydGhlciBpbXByb3ZlbWVudCBpcyB0byBsaWZ0IHRoZSBtYXBwaW5nCj4gPiBjcmVh
dGlvbiBvdXQgb2YgbWFwY2FjaGVfdmNwdV9pbml0Lgo+IAo+IEJ1dCB5b3UgY2FuIGp1c3QgWEVO
X0RPTUNUTF9tYXhfdmNwdXMgb24gYSBydW5uaW5nIGRvbWFpbiB0byBpbmNyZWFzZQo+IGl0cyBt
YXhfdmNwdXMgY291bnQsIHNvIHRoYXQgZW50cyBpcyBub3QgY29uc3RhbnQ/Cj4gCgpXaGF0IEFu
ZHJldyBzYWlkIGluIGhpcyBtYWlsLgoKV2VpLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3hlbi1kZXZlbA==
