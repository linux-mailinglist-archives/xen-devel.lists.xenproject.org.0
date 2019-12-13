Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A0FB311E4B9
	for <lists+xen-devel@lfdr.de>; Fri, 13 Dec 2019 14:34:06 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ifl2G-00071U-Av; Fri, 13 Dec 2019 13:31:12 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=nbPo=2D=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1ifl2E-00071O-EY
 for xen-devel@lists.xenproject.org; Fri, 13 Dec 2019 13:31:10 +0000
X-Inumbo-ID: d1de6cd2-1dac-11ea-8f04-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d1de6cd2-1dac-11ea-8f04-12813bfff9fa;
 Fri, 13 Dec 2019 13:31:08 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 92E77AF22;
 Fri, 13 Dec 2019 13:31:07 +0000 (UTC)
To: Jan Beulich <jbeulich@suse.com>
References: <be16ddaa-ae99-f696-53c0-6a680ffa8504@suse.com>
 <083b525e-c6db-a94b-1c50-604e8798488b@suse.com>
 <7eff12d8-ae10-331e-53b8-7239e8456c3a@suse.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <dd23ae64-24df-e3bb-351f-fe577e61c6df@suse.com>
Date: Fri, 13 Dec 2019 14:31:05 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <7eff12d8-ae10-331e-53b8-7239e8456c3a@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v2] IOMMU: make DMA containment of
 quarantined devices optional
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
Cc: Kevin Tian <kevin.tian@intel.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <paul@xen.org>,
 Ian Jackson <ian.jackson@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTMuMTIuMTkgMTQ6MjEsIEphbiBCZXVsaWNoIHdyb3RlOgo+IE9uIDEzLjEyLjIwMTkgMTQ6
MTEsIErDvHJnZW4gR3Jvw58gd3JvdGU6Cj4+IE9uIDEzLjEyLjE5IDEzOjUzLCBKYW4gQmV1bGlj
aCB3cm90ZToKPj4+IENvbnRhaW5pbmcgc3RpbGwgaW4gZmxpZ2h0IERNQSB3YXMgaW50cm9kdWNl
ZCB0byB3b3JrIGFyb3VuZCBjZXJ0YWluCj4+PiBkZXZpY2VzIC8gc3lzdGVtcyBoYW5naW5nIGhh
cmQgdXBvbiBoaXR0aW5nIGFuIElPTU1VIGZhdWx0LiBQYXNzaW5nCj4+PiB0aHJvdWdoIChzdWNo
KSBkZXZpY2VzIChvbiBzdWNoIHN5c3RlbXMpIGlzIGluaGVyZW50bHkgaW5zZWN1cmUgKGFzCj4+
PiBndWVzdHMgY291bGQgZWFzaWx5IGFycmFuZ2UgZm9yIElPTU1VIGZhdWx0cyB0byBvY2N1ciku
IERlZmF1bHRpbmcgdG8KPj4+IGEgbW9kZSB3aGVyZSBhZG1pbnMgbWF5IG5vdCBldmVuIGJlY29t
ZSBhd2FyZSBvZiBpc3N1ZXMgd2l0aCBkZXZpY2VzIGNhbgo+Pj4gYmUgY29uc2lkZXJlZCB1bmRl
c2lyYWJsZS4gVGhlcmVmb3JlIGNvbnZlcnQgdGhpcyBtb2RlIG9mIG9wZXJhdGlvbiB0bwo+Pj4g
YW4gb3B0aW9uYWwgb25lLCBub3Qgb25lIGVuYWJsZWQgYnkgZGVmYXVsdC4KPj4+Cj4+PiBUaGlz
IGludm9sdmVzIHJlc3VycmVjdGluZyBjb2RlIGNvbW1pdCBlYTM4ODY3ODMxZGEgKCJ4ODYgLyBp
b21tdTogc2V0Cj4+PiB1cCBhIHNjcmF0Y2ggcGFnZSBpbiB0aGUgcXVhcmFudGluZSBkb21haW4i
KSBkaWQgcmVtb3ZlLCBpbiBhIHNsaWdodGx5Cj4+PiBleHRlbmRlZCBhbmQgYWJzdHJhY3RlZCBm
YXNoaW9uLiBIZXJlLCBpbnN0ZWFkIG9mIHJlaW50cm9kdWNpbmcgYSBwcmV0dHkKPj4+IHBvaW50
bGVzcyB1c2Ugb2YgImdvdG8iIGluIGRvbWFpbl9jb250ZXh0X3VubWFwKCksIGFuZCBpbnN0ZWFk
IG9mIG1ha2luZwo+Pj4gdGhlIGZ1bmN0aW9uIChhdCBsZWFzdCB0ZW1wb3JhcmlseSkgaW5jb25z
aXN0ZW50LCB0YWtlIHRoZSBvcHBvcnR1bml0eQo+Pj4gYW5kIHJlcGxhY2UgdGhlIG90aGVyIHNp
bWlsYXJseSBwb2ludGxlc3MgImdvdG8iIGFzIHdlbGwuCj4+Pgo+Pj4gSW4gb3JkZXIgdG8ga2V5
IHRoZSByZS1pbnN0YXRlZCBieXBhc3NlcyBvZmYgb2YgdGhlcmUgKG5vdCkgYmVpbmcgYSByb290
Cj4+PiBwYWdlIHRhYmxlIHRoaXMgZnVydGhlciByZXF1aXJlcyBtb3ZpbmcgdGhlIGFsbG9jYXRl
X2RvbWFpbl9yZXNvdXJjZXMoKQo+Pj4gaW52b2NhdGlvbiBmcm9tIHJlYXNzaWduX2RldmljZSgp
IHRvIGFtZF9pb21tdV9zZXR1cF9kb21haW5fZGV2aWNlKCkgKG9yCj4+PiBlbHNlIHJlYXNzaWdu
X2RldmljZSgpIHdvdWxkIGFsbG9jYXRlIGEgcm9vdCBwYWdlIHRhYmxlIGFueXdheSk7IHRoaXMg
aXMKPj4+IGJlbmlnbiB0byB0aGUgc2Vjb25kIGNhbGxlciBvZiB0aGUgbGF0dGVyIGZ1bmN0aW9u
Lgo+Pj4KPj4+IFNpZ25lZC1vZmYtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4K
Pj4+IC0tLQo+Pj4gQXMgZmFyIGFzIDQuMTMgaXMgY29uY2VybmVkLCBJIGd1ZXNzIGlmIHdlIGNh
bid0IGNvbWUgdG8gYW4gYWdyZWVtZW50Cj4+PiBoZXJlLCB0aGUgb25seSBvdGhlciBvcHRpb24g
aXMgdG8gcmV2ZXJ0IGVhMzg4Njc4MzFkYSBmcm9tIHRoZSBicmFuY2gsCj4+PiBmb3IgaGF2aW5n
IGJlZW4gY29tbWl0dGVkIHByZW1hdHVyZWx5IChJJ20gbm90IHNvIG11Y2ggd29ycmllZCBhYm91
dCB0aGUKPj4+IG1hc3RlciBicmFuY2gsIHdoZXJlIHdlIGhhdmUgYW1wbGUgdGltZSB1bnRpbCA0
LjE0KS4gV2hhdCBJIHN1cmVseSB3YW50Cj4+PiB0byBzZWUgdXMgYXZvaWQgaXMgYSBiYWNrIGFu
ZCBmb3J0aCBpbiBiZWhhdmlvciBvZiByZWxlYXNlZCB2ZXJzaW9ucy4KPj4+IChOb3RlIHRoYXQg
NC4xMi4yIGlzIHNpbWlsYXJseSBibG9ja2VkIG9uIGEgZGVjaXNpb24gZWl0aGVyIHdheSBoZXJl
LikKPj4KPj4gSSdtIG5vdCByZWFsbHkgc3VyZSB3ZSByZWFsbHkgbmVlZCB0byByZXZlcnQgZWEz
ODg2NzgzMWRhIGJlZm9yZSB0aGUKPj4gNC4xMyByZWxlYXNlLiBJdCBtaWdodCBub3QgYmUgb3B0
aW1hbCwgYnV0IEknbSBxdWl0ZSBzdXJlIHRoZSBudW1iZXIgb2YKPj4gY2FzZXMgd2hlcmUgdGhp
cyBjb3VsZCBiZSBhbiBpc3N1ZSBpcyByYXRoZXIgc21hbGwgYWxyZWFkeSwgYW5kIEkgdGVuZAo+
PiB0byBhZ3JlZSB3aXRoIFBhdWwgdGhhdCBhZG1pbnMgd2hvIHJlYWxseSBjYXJlIHdpbGwgbW9y
ZSBsaWtlbHkgd2FudCB0bwo+PiBzZWxlY3QgdGhlIG9wdGlvbiB3aGVyZSB0aGUgc3lzdGVtIHdp
bGwgImp1c3Qgd29yayIuIElNTyB0aGUgIm5vdGljZWFibGUKPj4gZmFpbHVyZSIgaXMgc29tZXRo
aW5nIHdoaWNoIHdpbGwgYmUgc2VsZWN0ZWQgbW9zdGx5IGJ5IGRldmVsb3BlcnMuIEJ1dAo+PiBJ
J20gbm90IGFuIGV4cGVydCBpbiB0aGF0IGFyZWEsIHNvIEkgZG9uJ3Qgd2FudCB0byBpbmZsdWVu
Y2UgdGhlCj4+IGRlY2lzaW9uIHJlZ2FyZGluZyB0aGUgdG8gYmUgc2VsZWN0ZWQgZGVmYXVsdCB0
b28gbXVjaC4KPiAKPiBBbiBhZG1pbiBub3Qgd2FudGluZyB0byBrbm93IGlzLCB0byBtZSwgdGhl
IHNhbWUgYXMgdGhlbSBub3Qgd2FudGluZwo+IHRvIGtub3cgYWJvdXQgc2VjdXJpdHkgaXNzdWVz
LCBhbmQgaGVuY2Ugbm90IHN1YnNjcmliaW5nIHRvIG91cgo+IGFubm91bmNlbWVudHMgbGlzdHMu
IEkgY2FuIGFjY2VwdCB0aGlzIGJlaW5nIGEgcmVhc29uYWJsZSB0aGluZyB0bwo+IGRvIHdoZW4g
aXQgaXMgYW4gX2luZm9ybWVkXyBkZWNpc2lvbi4gQnV0IHdpdGggdGhlIGN1cnJlbnQKPiBhcnJh
bmdlbWVudHMgdGhlcmUncyBubyB3YXkgd2hhdHNvZXZlciBmb3IgYW4gYWRtaW4gdG8ga25vdy4K
Ck1heWJlIEkgaGF2ZSBtaXN1bmRlcnN0b29kIHRoZSBjdXJyZW50IHN0YXRlLCBidXQgSSB0aG91
Z2h0IHRoYXQgaXQKd291bGQganVzdCBzaWxlbnRseSBoaWRlIHF1aXJreSBkZXZpY2VzIHdpdGhv
dXQgaW1wb3NpbmcgYSBzZWN1cml0eQpyaXNrLiBXZSB3b3VsZCBub3QgbGVhcm4gd2hpY2ggZGV2
aWNlcyBhcmUgcXVpcmt5LCBidXQgT1RPSCBJIGRvdWJ0CndlJ2QgZ2V0IG1hbnkgcmVwb3J0cyBh
Ym91dCB0aG9zZSBpbiBjYXNlIHlvdXIgcGF0Y2ggZ29lcyBpbi4KCgpKdWVyZ2VuCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGlu
ZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnBy
b2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
