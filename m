Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B7D20E58B5
	for <lists+xen-devel@lfdr.de>; Sat, 26 Oct 2019 07:27:14 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iOEX5-0002Wk-MT; Sat, 26 Oct 2019 05:22:35 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=dGwN=YT=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1iOEX4-0002Wf-7R
 for xen-devel@lists.xenproject.org; Sat, 26 Oct 2019 05:22:34 +0000
X-Inumbo-ID: 99ddb8bf-f7b0-11e9-94d0-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 99ddb8bf-f7b0-11e9-94d0-12813bfff9fa;
 Sat, 26 Oct 2019 05:22:28 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 66BC4AC1C;
 Sat, 26 Oct 2019 05:22:27 +0000 (UTC)
To: Andrew Cooper <andrew.cooper3@citrix.com>, Steven Haigh
 <netwiz@crc.id.au>, xen-devel <xen-devel@lists.xenproject.org>,
 Jan Beulich <JBeulich@suse.com>
References: <1571918276.2606.0@crc.id.au>
 <f5bb6057-7d01-92ad-9ab5-45f4b5bf57a5@citrix.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <42d3409e-6081-eec6-bf75-27798d5dd447@suse.com>
Date: Sat, 26 Oct 2019 07:22:25 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <f5bb6057-7d01-92ad-9ab5-45f4b5bf57a5@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] Debugging Windows HVM crashes on Ryzen 3xxx series
 CPUs.
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
Cc: Lars Kurth <lars.kurth@citrix.com>, Paul Durrant <paul@xen.org>,
 Wei Liu <wei.liu2@citrix.com>, Roger Pau Monne <roger.pau@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjUuMTAuMTkgMTk6MDEsIEFuZHJldyBDb29wZXIgd3JvdGU6Cj4gT24gMjQvMTAvMjAxOSAx
Mjo1NywgU3RldmVuIEhhaWdoIHdyb3RlOgo+PiBIaSBhbGwsCj4+Cj4+IEkndmUgbWFuYWdlZCB0
byBnZXQgdGhlIGdpdCBtYXN0ZXIgdmVyc2lvbiBvZiBYZW4gb24gdGhpcyBhZmZlY3RlZAo+PiBz
eXN0ZW0gYW5kIHRyaWVzIHRvIGJvb3QgYSBXaW5kb3dzIFNlcnZlciAyMDE2IHN5c3RlbS4gSXQg
Y3Jhc2hlcyBhcwo+PiBwZXIgbm9ybWFsLgo+Pgo+PiBJIG1hbmFnZWQgdG8gZ2V0IHRoZXNlIGxv
Z3MsIGJ1dCBJJ20gbm90IHF1aXRlIHN1cmUgd2hhdCBlbHNlIHRvIGRvIHRvCj4+IGRlYnVnIHRo
aXMgaXNzdWUgZnVydGhlci4KPiAKPiBBZnRlciBhIGNvbGxhYm9yYXRpdmUgZGVidWdnaW5nIHNl
c3Npb24gb24gSVJDLCB3ZSd2ZSBpZGVudGlmaWVkIHRoZQo+IHByb2JsZW0uwqAgSGVyZSBpcyBh
IHN1bW1hcnkuCj4gCj4gaHR0cHM6Ly93d3cucmVkZGl0LmNvbS9yL0FtZC9jb21tZW50cy9ja3I1
ZjQvYW1kX3J5emVuXzMwMDBfc2VyaWVzX2xpbnV4X3N1cHBvcnRfYW5kLwo+IGlzIGNvbmNlcm5p
bmcgS1ZNLCBidXQgaXQgaWRlbnRpZmllZCB0aGF0IHRoZSBUT1BPRVhUIGZlYXR1cmUgd2FzCj4g
aW1wb3J0YW50IHRvIGdldHRpbmcgd2luZG93cyB0byBib290Lgo+IAo+IFhlbiBkb2Vzbid0IGN1
cnJlbnRseSBvZmZlciBUT1BPRVhUIHRvIGd1ZXN0cyBhdCBhbGwuwqAgRml4aW5nIHRoaXMgaXMg
b24KPiB0aGUgVE9ETyBsaXN0IGFsb25nIHdpdGggdGhlIHJlc3Qgb2YgdGhlIHRvcG9sb2d5IHJl
cHJlc2VudGF0aW9uIHN3YW1wLgo+IAo+IE9uIGEgaHVuY2gsIEkgb2ZmZXJlZCB1cCBhIFhlblNl
cnZlciBwYXRjaCB3aGljaCB3ZSBhcmUgc3RpbGwgdXNpbmcsIGluCj4gbGlldSBvZiBmaXhpbmcg
dG9wb2xvZ3kgcHJvcGVybHkuwqAgSXQgaXMgbG9naWNhbGx5IGEgcmV2ZXJ0IG9mCj4gY2EyZWVl
OTJkZjQ0IGFzIHRoYXQgY2hhbmdlIHdhc24ndCBtaWdyYXRpb24gc2FmZS4KPiAKPiBXaXRoIHRo
aXMgcGF0Y2ggaW4gcGxhY2UsIHdpbmRvd3Mgd29ya3MgZmluZS7CoCBIb3dldmVyLCBJIGRvbid0
IHRoaW5rCj4gdGhlIHBhdGNoIGlzIGFwcHJvcHJpYXRlIHRvIHRha2UgaW50byA0LjEzLgo+IAo+
IEZ1cnRoZXJtb3JlLCB0aGVyZSBpcyBubyBjaGFuY2Ugb2YgZ2V0dGluZyB0aGUgdG9wb2xvZ3kg
d29yayBzb3J0ZWQgaW4KPiB0aGUgcmVtYWluaW5nIDQuMTMgdGltZWZyYW1lLgo+IAo+IEknbSBh
dCBhIGxvc3MgZm9yIGlkZWFzLCBvdGhlciB0aGFuIHJlbGVhc2Ugbm90ZSBpdCBhcyBicm9rZW4g
YW5kIG1ha2UKPiBmaXhpbmcgaXQgYSBibG9ja2VyIGZvciA0LjE0Lgo+IAo+IFRob3VnaHRzPwoK
V2hhdCBhYm91dCBhIGRvbWFpbiBjb25maWcgZW50cnkgZGVmYXVsdGluZyB0byAib2ZmIiBzZWxl
Y3RpbmcgdGhlCnRvcG9sb2d5IG1vZGlmaWNhdGlvbiBpbiBsaWJ4YyB5b3UgcHJvdmlkZWQgZm9y
IHRoZSB0ZXN0PyBUaGF0IHdvdWxkCmp1c3QgcmVxdWlyZSB0byBhZGQgYSBib29sIHBhcmFtZXRl
ciB0byB4Y19jcHVpZF9hcHBseV9wb2xpY3koKS4gSXQKbWlnaHQgZXZlbiBiZSBwb3NzaWJsZSB0
byBzZWxlY3QgdGhlIHNldHRpbmcgb24gdGhlIGFmZmVjdGVkIGhhcmR3YXJlCmF1dG9tYXRpY2Fs
bHkuCgoKSnVlcmdlbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5v
cmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZl
bA==
