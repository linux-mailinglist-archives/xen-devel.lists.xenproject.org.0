Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 665D41574AD
	for <lists+xen-devel@lfdr.de>; Mon, 10 Feb 2020 13:35:17 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j18FD-0002FO-3D; Mon, 10 Feb 2020 12:32:55 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=4wzj=36=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1j18FB-0002FJ-8P
 for xen-devel@lists.xenproject.org; Mon, 10 Feb 2020 12:32:53 +0000
X-Inumbo-ID: 7420a640-4c01-11ea-852a-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7420a640-4c01-11ea-852a-bc764e2007e4;
 Mon, 10 Feb 2020 12:32:52 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id D4477ACA4;
 Mon, 10 Feb 2020 12:32:50 +0000 (UTC)
To: Julien Grall <julien@xen.org>
References: <20200204173455.22020-1-roger.pau@citrix.com>
 <20200204173455.22020-3-roger.pau@citrix.com>
 <3d067f06-a054-bbe1-916e-ef43e2527f45@suse.com>
 <20200205132144.GS4679@Air-de-Roger>
 <775b8691-068d-2af9-1b59-d66233708595@suse.com>
 <69d410bd-2397-537d-6507-4c710d166396@xen.org>
 <1354b838-e30f-10dd-edbe-064fb159ef7e@suse.com>
 <0542d37e-8128-b94c-19ac-8506bf0d1b8a@xen.org>
 <58391072-5196-62e7-a09b-bc45993b50ef@suse.com>
 <4d6e9d92-d0cf-6f4e-0fe1-8cba69c72300@xen.org>
 <17344a8c-b5f5-ee48-a89d-8d5c0070e81f@suse.com>
 <910276d6-a55d-87d2-cb92-055c53b9898c@xen.org>
 <979c25c4-09c2-755e-51f9-ca644358b096@suse.com>
 <87208524-5c30-48cf-fe7a-e5d77a26414b@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <ea8e70a3-83d2-0491-115c-fbf18bd1d705@suse.com>
Date: Mon, 10 Feb 2020 13:32:49 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <87208524-5c30-48cf-fe7a-e5d77a26414b@xen.org>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v4 2/3] bitmap: import bitmap_{set/clear}
 from Linux 5.5
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
 Ian Jackson <ian.jackson@eu.citrix.com>, xen-devel@lists.xenproject.org,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTAuMDIuMjAyMCAxMzoyMSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IEhpLAo+IAo+IE9uIDEw
LzAyLzIwMjAgMTE6NTksIEphbiBCZXVsaWNoIHdyb3RlOgo+PiBPbiAxMC4wMi4yMDIwIDEyOjAw
LCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4+PiBPbiAxMC8wMi8yMDIwIDEwOjI4LCBKYW4gQmV1bGlj
aCB3cm90ZToKPj4+PiBPbiAxMC4wMi4yMDIwIDEwOjQ1LCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4+
Pj4+IFBsZWFzZSBzdWdnZXN0IGEgbmV3IG5hbWUgZm9yIEJJVF9XT1JEKCkgYW5kIHdlIGNhbiBy
ZXB1cnBvc2UgaXQuIFNvCj4+Pj4+IGZhciwgSSBoYXZlIG5vIGlkZWEgaG93IHRvIHJlbmFtZSBp
dC4KPj4+Pgo+Pj4+IF9CSVRfV09SRCgpIGlmIHlvdS93ZSB3ZXJlIHRvIGFjY2VwdCB0aGUgbmFt
ZSBzcGFjZSB2aW9sYXRpb24sIG9yCj4+Pj4gQklUTUFQX1dPUkQoKT8KPj4+Cj4+PiBCSVRNQVBf
V09SRCgpIGlzIG1pc2xlYWRpbmcgYXMgYml0bWFwIGFyZSB1c2luZyB1bnNpZ25lZCBsb25nLiBT
byBteQo+Pj4gcHJlZmVyZW5jZSBpcyBfQklUX1dPUkQoKS4KPj4+Cj4+PiBBbm90aGVyIGFsdGVy
bmF0aXZlIHdvdWxkIGJlIEFUT01JQ19XT1JEKCkuCj4+Cj4+IEV4Y2VwdCB0aGF0IHRoZXJlIGFy
ZSBhbHNvIG5vbi1hdG9taWMgYml0bWFwIG9wZXJhdGlvbnMsIEkgZG9uJ3QgcmVhbGx5Cj4+IGNh
cmUgYWJvdXQgdGhlIG5hbWUgYXMgbG9uZyBhcyBpdCdzIG5vdCBCSVRfV09SRCgpIChvciBhbnl0
aGluZyBlbHNlCj4+IHRoYXQncyBsaWtlbHkgdG8gY29sbGlkZSB3aXRoIG90aGVyIHN0dWZmLgo+
IAo+IEkgYW0gYWZyYWlkIHdlIGFyZSBkaXNhZ3JlaW5nIG9uIHdoYXQgaXMgY29sbGlkaW5nIHdp
dGggd2hhdCBoZXJlLiBUaGUgCj4gbmFtaW5nIG9uIEFybSBoYXMgYmVlbiBsaWtlIHRoYXQgZm9y
IHRoZSBwYXN0IGZldyB5ZWFycy4gV2hpbGUgdGhpcyBtYXkgCj4gbm90IGhhdmUgYmVlbiB0aGUg
YmVzdCBjaG9pY2UsIHRoaXMgaXMgeW91ciBzdWdnZXN0aW9uIGNvbGxpZGluZyB3aXRoIAo+IHdo
YXQgaXMgZXhpc3RpbmcuCgpJdCBpcyBhIHBsYWluIGltcG9ydCBmcm9tIExpbnV4IHdoaWNoIGhh
cyB0dXJuZWQgb3V0IGltcG9zc2libGUKYmVjYXVzZSBvZiB0aGUgY2hhbmdlIHRoYXQgd2FzIGRv
bmUgYXQgc29tZSBwb2ludCB0byBBcm0gY29kZQp3aGljaCwgSSBndWVzcywgYWxzbyBvcmlnaW5h
bGx5IGNhbWUgZnJvbSBMaW51eC4gVGhlcmUncyBubyBuZXcKbmFtaW5nIEkndmUgYmVlbiBzdWdn
ZXN0aW5nIGhlcmUgYXQgYWxsLgoKPiBJIGFtIG5vdCBlbnRpcmVseSBmdXNzZWQgYWJvdXQgdGhl
IG5hbWVzcGFjZSB2aW9sYXRpb24sIGFsdGhvdWdoIEkgdGhpbmsgCj4gdGhlIG5hbWUgaXMgcG90
ZW50aWFsbHkgbWlzbGVhZGluZy4gWWV0LCBJIHdvdWxkIGJlIGhhcHB5IHRvIHVzZSAKPiBfQklU
X1dPUkQoKSBhcyB0aGlzIGlzIHRoZSBiZXN0IG9mIGl0IHNvIGZhci4KPiAKPiBXaGlsZSB0aGlz
IGlzIGNvZGUgZmFsbHMgdW5kZXIgQXJtIG1haW50YWluZXJzaGlwLCBJIGFtIHN0aWxsIGhhcHB5
IHRvIAo+IGNvbnNpZGVyIG90aGVyIG5hbWluZy4gQnV0IGF0IHRoaXMgcG9pbnQsIHlvdSBzaG91
bGQgYmUgdGhlIG9uZSBzdWdnZXN0aW5nLgoKQklUX1VOSVQoKSBvciBCSVRPUF9VTklUKCkgb3Ig
QklUT1BfV09SRCgpPwoKSmFuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVu
LWRldmVs
