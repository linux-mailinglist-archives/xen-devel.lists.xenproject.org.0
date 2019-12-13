Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 219FC11E2BF
	for <lists+xen-devel@lfdr.de>; Fri, 13 Dec 2019 12:26:42 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ifj3P-0002OO-1z; Fri, 13 Dec 2019 11:24:15 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=nbPo=2D=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1ifj3M-0002OJ-UY
 for xen-devel@lists.xenproject.org; Fri, 13 Dec 2019 11:24:12 +0000
X-Inumbo-ID: 15ed033c-1d9b-11ea-8ee2-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 15ed033c-1d9b-11ea-8ee2-12813bfff9fa;
 Fri, 13 Dec 2019 11:24:11 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id D8517AE6F;
 Fri, 13 Dec 2019 11:24:10 +0000 (UTC)
To: Julien Grall <julien@xen.org>,
 osstest service owner <osstest-admin@xenproject.org>,
 xen-devel@lists.xenproject.org, Ian Jackson <ian.jackson@eu.citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <osstest-144736-mainreport@xen.org>
 <e05a3bc4-2c1d-7e71-af42-d6362c4f6d07@suse.com>
 <6ea2af3c-b277-1118-7c83-ebcb0809d449@xen.org>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <880fed58-f67c-3f6c-134f-f370bdffef32@suse.com>
Date: Fri, 13 Dec 2019 12:24:08 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <6ea2af3c-b277-1118-7c83-ebcb0809d449@xen.org>
Content-Language: en-US
Subject: Re: [Xen-devel] [xen-4.13-testing test] 144736: regressions - FAIL
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTMuMTIuMTkgMTI6MTQsIEp1bGllbiBHcmFsbCB3cm90ZToKPiBIaSBKdWVyZ2VuLAo+IAo+
IE9uIDEzLzEyLzIwMTkgMDg6MzEsIErDvHJnZW4gR3Jvw58gd3JvdGU6Cj4+IE9uIDEyLjEyLjE5
IDIzOjM1LCBvc3N0ZXN0IHNlcnZpY2Ugb3duZXIgd3JvdGU6Cj4+PiBmbGlnaHQgMTQ0NzM2IHhl
bi00LjEzLXRlc3RpbmcgcmVhbCBbcmVhbF0KPj4+IGh0dHA6Ly9sb2dzLnRlc3QtbGFiLnhlbnBy
b2plY3Qub3JnL29zc3Rlc3QvbG9ncy8xNDQ3MzYvCj4+Pgo+Pj4gUmVncmVzc2lvbnMgOi0oCj4+
Pgo+Pj4gVGVzdHMgd2hpY2ggZGlkIG5vdCBzdWNjZWVkIGFuZCBhcmUgYmxvY2tpbmcsCj4+PiBp
bmNsdWRpbmcgdGVzdHMgd2hpY2ggY291bGQgbm90IGJlIHJ1bjoKPj4+IMKgIHRlc3QtYXJtNjQt
YXJtNjQteGwtY3JlZGl0McKgwqAgNyB4ZW4tYm9vdMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgIGZhaWwgUkVHUi4gCj4+PiB2cy4gMTQ0NjczCj4+Cj4+IExvb2tpbmcgaW50byB0aGUg
c2VyaWFsIGxvZyB0aGlzIGxvb2tzIGxpa2UgYSBoYXJkd2FyZSBwcm9ibGVtIHRvIG1lLgo+IAo+
IExvb2tpbmcgYXQgWzFdLCB0aGUgYm9hcmQgd2VyZSBhYmxlIHRvIHBpY2sgdXAgbmV3IGpvYi4g
U28gSSB3b3VsZCAKPiBhc3N1bWUgdGhpcyBqdXN0IGEgdGVtcG9yYXJ5IGZhaWx1cmUuCj4gCj4g
QU1EIFNlYXR0bGUgYm9hcmRzIChsYXh0b24qKSBhcmUga25vd24gdG8gZmFpbCBib290aW5nIHRp
bWUgdG8gdGltZSAKPiBiZWNhdXNlIG9mIFBDSSB0cmFpbmluZyBpc3N1ZS4gV2UgaGF2ZSB3b3Jr
YXJvdW5kIGZvciBpdCAoaW52b2x2aW5nIAo+IGxvbmdlciBwb3dlciBjeWNsZSkgYnV0IHRoaXMg
aXMgbm90IDEwMCUgcmVsaWFibGUuCgpJIGd1ZXNzIHJlcGVhdGluZyB0aGUgcG93ZXIgY3ljbGUg
c2hvdWxkIHdvcmssIHRvbyAoZXNwZWNpYWxseSBhcyB0aGUKbmV3IGpvYiBkaWQgd29yayBhcyB5
b3Ugc2FpZCk/Cgo+IAo+Pgo+PiBJYW4sIGRvIHlvdSBhZ3JlZT8KPj4KPj4+IMKgIHRlc3QtYXJt
aGYtYXJtaGYteGwtdmhkwqDCoMKgwqDCoCAxOCBsZWFrLWNoZWNrL2NoZWNrwqDCoMKgwqDCoMKg
wqDCoCBmYWlsIFJFR1IuIAo+Pj4gdnMuIDE0NDY3Mwo+Pgo+PiBUaGF0IG9uZSBpcyBzdHJhbmdl
LiBBIHFlbXUgcHJvY2VzcyBzZWVtcyB0byBoYXZlIGhhdmUgZGllZCBwcm9kdWNpbmcKPj4gYSBj
b3JlIGZpbGUsIGJ1dCBJIGNvdWxkbid0IGZpbmQgYW55IGxvZyBjb250YWluaW5nIGFueSBvdGhl
ciBpbmRpY2F0aW9uCj4+IG9mIGEgY3Jhc2hlZCBwcm9ncmFtLgo+IAo+IEkgaGF2ZW4ndCBmb3Vu
ZCBhbnl0aGluZyBpbnRlcmVzdGluZyBpbiB0aGUgbG9nLiBASWFuIGNvdWxkIHlvdSBzZXQgdXAg
YSAKPiByZXBybyBmb3IgdGhpcz8KPiAKPiBGb3IgdGhlIGZ1dHVyZSwgaXQgd291bGQgYmUgd29y
dGggY29uc2lkZXJpbmcgdG8gY29sbGVjdCBjb3JlIGZpbGVzLgoKT1NTdGVzdCBkb2VzOgoKaHR0
cDovL2xvZ3MudGVzdC1sYWIueGVucHJvamVjdC5vcmcvb3NzdGVzdC9sb2dzLzE0NDczNi90ZXN0
LWFybWhmLWFybWhmLXhsLXZoZC9jdWJpZXRydWNrLW1ldHppbmdlci0tLXZhci1jb3JlLTE1NzYx
NDcyODAuMTk3OS5xZW11LXN5c3RlbS1pMzguY29yZS5negoKPiAKPj4KPj4gQW5kIEkgY2FuJ3Qg
YmVsaWV2ZSB0aGUgQVJNIGNoYW5nZXMgaW4gdGhlIGh5cGVydmlzb3Igd291bGQgcmVzdWx0IGlu
Cj4+IHFlbXUgY3Jhc2hpbmcgbm93Li4uCj4gCj4gSSBoYXZlIHNlZW4gd2VpcmQgYmVoYXZpb3Ig
aGFwcGVuaW5nIGluIERvbTAgYmVjYXVzZSBvZiBjaGFuZ2VzIGluIFhlbiAKPiBiZWZvcmUuIDop
IEZvciBpbnN0YW5jZSwgZ2V0X2N5Y2xlcygpIHdhcyB3cm9uZ2x5IGltcGxlbWVudGVkIGFuZCAK
PiByZXN1bHRlZCB0byBuZXR3b3JrIGxvc3MuCj4gCj4gQW55d2F5LMKgIFFFTVUgaXMgdGhlIHNh
bWUgYXMgdGhlIHByZXZpb3VzIGZsaWdodC4gVGhlIG9ubHkgZGlmZmVyZW5jZSAKPiBoZXJlIGlz
IGluIFhlbjoKPiAKPiBkODUzOGY3MWVkYzk1NGY4YzUxOGRlMmY5Y2M5YWU4OWVlMDVmNmExCj4g
eDg2K0FybTMyOiBtYWtlIGZpbmRfbmV4dF97LHplcm9ffWJpdCgpIGhhdmUgd2VsbCBkZWZpbmVk
IGJlaGF2aW9yCgpSaWdodCwgdGhhdCB3YXMgd2hhdCBJIG1lYW50LiA6LSkKCj4gCj4+IEp1bGll
biwgY291bGQgeW91IHBsZWFzZSBoYXZlIGEgbG9vaz8KPiAKPiBJIGRvbid0IGhhdmUgbXVjaCBp
ZGVhIHdoYXQncyBoYXBwZW5pbmcuIEEgcmVwcm8gd291bGQgdXNlZnVsIHRvIGJlIGFibGUgCj4g
dG8gZG8gbW9yZSBkZWJ1Zy4KPiAKPiBDaGVlcnMsCj4gCj4gWzFdIGh0dHA6Ly9sb2dzLnRlc3Qt
bGFiLnhlbnByb2plY3Qub3JnL29zc3Rlc3QvcmVzdWx0cy9ob3N0L2xheHRvbjAuaHRtbAo+IAoK
SnVlcmdlbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
WGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0
cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
