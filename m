Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ED787AFBF2
	for <lists+xen-devel@lfdr.de>; Wed, 11 Sep 2019 13:53:39 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i8191-0000AX-JO; Wed, 11 Sep 2019 11:50:43 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=/an7=XG=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1i8190-0000AP-Fh
 for xen-devel@lists.xenproject.org; Wed, 11 Sep 2019 11:50:42 +0000
X-Inumbo-ID: 60ddb544-d48a-11e9-a337-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 60ddb544-d48a-11e9-a337-bc764e2007e4;
 Wed, 11 Sep 2019 11:50:41 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id BCF99B78C;
 Wed, 11 Sep 2019 11:50:39 +0000 (UTC)
To: Juergen Gross <jgross@suse.com>
References: <20190911062001.25931-1-jgross@suse.com>
 <20190911062001.25931-5-jgross@suse.com>
 <97a771af-32a3-596d-30e2-7042374d14e3@suse.com>
 <4ffa80f0-5d63-9d84-9030-9c5eaecc1541@suse.com>
 <a00f9b2a-1a2d-145f-daaf-6cd8cc4d3f25@suse.com>
 <21bad2b6-8487-a59c-71b3-aedf475e5170@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <8f7b8a19-3723-fd03-c612-856486eb96b5@suse.com>
Date: Wed, 11 Sep 2019 13:50:38 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <21bad2b6-8487-a59c-71b3-aedf475e5170@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [RFC PATCH 4/5] tools: add xenfs tool
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
Cc: xen-devel@lists.xenproject.org, Ian Jackson <ian.jackson@eu.citrix.com>,
 Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTEuMDkuMjAxOSAxMzozNCwgSnVlcmdlbiBHcm9zcyB3cm90ZToKPiBPbiAxMS4wOS4xOSAx
MjowNywgSmFuIEJldWxpY2ggd3JvdGU6Cj4+IE9uIDExLjA5LjIwMTkgMTE6NTcsIEp1ZXJnZW4g
R3Jvc3Mgd3JvdGU6Cj4+PiBPbiAxMS4wOS4xOSAxMTozMCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+
Pj4gT24gMTEuMDkuMjAxOSAwODoyMCwgSnVlcmdlbiBHcm9zcyB3cm90ZToKPj4+Pj4gLS0tIGEv
dG9vbHMvbWlzYy9NYWtlZmlsZQo+Pj4+PiArKysgYi90b29scy9taXNjL01ha2VmaWxlCj4+Pj4+
IEBAIC0yNCw2ICsyNCw3IEBAIElOU1RBTExfU0JJTi0kKENPTkZJR19YODYpICAgICArPSB4ZW4t
bG93bWVtZAo+Pj4+PiAgICBJTlNUQUxMX1NCSU4tJChDT05GSUdfWDg2KSAgICAgKz0geGVuLW1m
bmR1bXAKPj4+Pj4gICAgSU5TVEFMTF9TQklOLSQoQ09ORklHX1g4NikgICAgICs9IHhlbi11Y29k
ZQo+Pj4+PiAgICBJTlNUQUxMX1NCSU4gICAgICAgICAgICAgICAgICAgKz0geGVuY292Cj4+Pj4+
ICtJTlNUQUxMX1NCSU4gICAgICAgICAgICAgICAgICAgKz0geGVuZnMKPj4+Pgo+Pj4+IFdoeSBT
QklOPyBJcyB0aGVyZSBhbnl0aGluZyB3cm9uZyB3aXRoIGFsbG93aW5nIHVucHJpdmlsZWdlZAo+
Pj4+IHVzZXJzIHIvbyBhY2Nlc3M/IE9yIGlzIHRoaXMgYmVjYXVzZSBpbiBvcmRlciB0byBhY2Nl
c3MgdGhlCj4+Pj4gaHlwZXJjYWxsIGludGVyZmFjZSBvbmUgbmVlZHMgdG8gYmUgcm9vdD8gSWYg
c28sIHdlIG1heSB3YW50Cj4+Pj4gdG8gY29uc2lkZXIgcmVsYXhpbmcvYXZvaWRpbmcvYnlwYXNz
aW5nIHRoaXMgaW4gc29tZSBzZW5zaWJsZQo+Pj4+IHdheS4KPj4+Cj4+PiBJbnN0YWxsaW5nIHRv
IGJpbiBpcyBmaW5lIHdpdGggbWUsIGJ1dCByZWxheGluZyB0aGUgcm9vdCByZXN0cmljdGlvbgo+
Pj4gbWlnaHQgYmUgbW9yZSBkaWZmaWN1bHQgYW5kL29yIHF1ZXN0aW9uYWJsZS4KPj4+Cj4+PiBJ
IHdhcyB0aGlua2luZyBvZiAibW91bnRpbmciIHRoZSB4ZW4tc3lzZnMgdG8gZWl0aGVyIFhlbnN0
b3JlIG9yCj4+PiB0aGUga2VybmVsJ3Mgc3lzZnMgKHByb2JhYmx5IHRoZSBsYXR0ZXIsIGFzIFhl
bnN0b3JlIGluIGEgc3R1YmRvbQo+Pj4gd291bGQgbmVlZCB0byBlbmFibGUgYWNjZXNzIHRvIHhl
bi1zeXNmcyBmb3IgdGhhdCBzdHViZG9tICx0b28pLgo+Pj4KPj4+IFRoaXMgd291bGQgdGhlbiBl
bmFibGUgYWNjZXNzaW5nIHNvbWUgb3IgYWxsIGVudHJpZXMgZnJvbSBub24tcm9vdC4KPj4KPj4g
UmlnaHQsIGdvaW5nIHRocm91Z2ggdGhlIGtlcm5lbCdzIHN5c2ZzIGlzIHdoYXQgSSB0b28gd2Fz
Cj4+IGNvbnNpZGVyaW5nIChJIGRvbid0IHRoaW5rIHhlbnN0b3JlIGlzIGFwcHJvcHJpYXRlIGZv
ciB0aGlzKS4KPj4gVGhlIG1haW4gaXNzdWUgSSdkIHNlZSB3aXRoIHRoaXMgaXMgdGhlIHNwbGl0
IGJyYWluIHBlcm1pc3Npb25zCj4+IGhhbmRsaW5nLiBJJ2QgcHJlZmVyIGZvciB0aGVyZSB0byBi
ZSBqdXN0IG9uZSBwYXJ0eSBkZXRlcm1pbmluZwo+PiB3aG8gaXMgYWxsb3dlZCB0byBzZWUgd2hh
dCwgYnV0IGV2ZW4gaWYgdGhlIGh5cGVydmlzb3IgdG9sZCB0aGUKPj4ga2VybmVsLCB0aGVyZSB3
b3VsZCBzdGlsbCBiZSBhIGRlcGVuZGVuY3kgdXBvbiB0aGUga2VybmVsIGFsc28KPj4gcmVzcGVj
dGluZyB0aGUgcmVxdWVzdC4gV2hpbGUgbm90IG11Y2ggb2YgYSBwcm9ibGVtIGFzIGxvbmcgYXMK
Pj4gYWxsIG9mIHRoaXMgaXMgRG9tMC1vbmx5LCB3aXRoIERvbVUtcyBpbiBtaW5kIHRoaXMgd291
bGQgbmVlZAo+PiB0YWtpbmcgY2FyZSBvZi4KPiAKPiBIbW0sIHdoeT8gSSB0aGluayB3ZSBhZ3Jl
ZSB0aGF0IERvbVVzIHNob3VsZCBnZXQgYWNjZXNzIG9ubHkgdG8gZWl0aGVyCj4gZ2xvYmFsIGRh
dGEgKHJlYWQtb25seSkgd2hpY2ggZG9lc24ndCBkbyBhbnkgaGFybSwKCkkgZ3Vlc3Mgb3Bpbmlv
bnMgdGVuZCB0byBkaWZmZXIgaGVyZTogVGhlcmUgbWF5IHdlbGwgYmUgcGVvcGxlCnRoaW5raW5n
IHRoYXQgY2VydGFpbiB0aGluZ3Mgc2hvdWxkbid0IGJlIHNlZW4gYnkgZXZlcnlvbmUuCgo+IG9y
IHRvIGRhdGEgcmVsYXRlZAo+IG9ubHkgdG8gdGhlbSAoc28gcGVyLWRvbWFpbiBkYXRhKS4gTWF5
YmUgZHJpdmVyLWRvbWFpbnMgb3IgZGV2aWNlIG1vZGVsCj4gc3R1YmRvbXMgd291bGQgbmVlZCBh
Y2Nlc3MgdG8gZGF0YSByZWxhdGVkIHRvIHRoZSBkb21haW5zIHRoZXkgYXJlCj4gc2VydmluZy4K
PiAKPiBXaGV0aGVyIGEgZG9tVSBsZXRzIGEgdXNlciBhY2Nlc3MgdGhhdCBkYXRhIG9yIG5vdCBz
aG91bGQgb25seSBiZQo+IGRlY2lkZWQgYnkgdGhlIGRvbVUgKGFwcGxpZXMgdG8gZG9tMCwgdG9v
KS4KCkxpa2UgYWJvdmUsIHRoZXJlIG1heSBiZSBkaWZmZXJlbnQgdmlld3MgaGVyZSBhcyB3ZWxs
LgoKSmFuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpY
ZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRw
czovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
