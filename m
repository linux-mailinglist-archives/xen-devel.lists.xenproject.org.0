Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 51D841350CA
	for <lists+xen-devel@lfdr.de>; Thu,  9 Jan 2020 02:03:01 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ipM9j-0002Dl-W6; Thu, 09 Jan 2020 00:58:35 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=noqg=26=intel.com=tao3.xu@srs-us1.protection.inumbo.net>)
 id 1ipM9i-0002Dg-US
 for xen-devel@lists.xenproject.org; Thu, 09 Jan 2020 00:58:34 +0000
X-Inumbo-ID: 287ebb90-327b-11ea-b92f-12813bfff9fa
Received: from mga01.intel.com (unknown [192.55.52.88])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 287ebb90-327b-11ea-b92f-12813bfff9fa;
 Thu, 09 Jan 2020 00:58:33 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 08 Jan 2020 16:58:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,412,1571727600"; d="scan'208";a="371160897"
Received: from txu2-mobl.ccr.corp.intel.com (HELO [10.239.197.127])
 ([10.239.197.127])
 by orsmga004.jf.intel.com with ESMTP; 08 Jan 2020 16:58:31 -0800
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>,
 xen-devel@lists.xenproject.org
References: <764d3c88-ce22-c968-9169-896892aa55e5@intel.com>
 <61d03b85-fd54-f6a0-dcd5-8fda2194a9f0@suse.com>
 <2a111e1a-9016-7488-1e48-4ac2e2e34351@intel.com>
 <4d2c8710-e544-3f9b-a036-5dab073d46bf@suse.com>
From: Tao Xu <tao3.xu@intel.com>
Message-ID: <bd062c97-3e10-9ac0-e11f-50a6828304eb@intel.com>
Date: Thu, 9 Jan 2020 08:58:30 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <4d2c8710-e544-3f9b-a036-5dab073d46bf@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [BUG] XEN crash and double fault when doing cpu
 online/offline
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

T24gMS84LzIwMjAgNjo0NSBQTSwgSsO8cmdlbiBHcm/DnyB3cm90ZToKPiBPbiAwOC4wMS4yMCAw
OTozMiwgVGFvIFh1IHdyb3RlOgo+Pgo+PiBPbiAxLzgvMjAgMzo1MCBQTSwgSsO8cmdlbiBHcm/D
nyB3cm90ZToKPj4+IE9uIDA4LjAxLjIwIDA2OjUwLCBUYW8gWHUgd3JvdGU6Cj4+Pj4gSGksCj4+
Pj4KPj4+PiBXaGVuIEkgdXNlIHhlbi1ocHRvb2wgY3B1LW9mZmxpbmUvY3B1LW9ubGluZSB0byBs
ZXQgQ1BVIGluIGEgc29ja2V0IAo+Pj4+IG9ubGluZS9vZmZsaW5lIHVzaW5nIHRoZSBzY3JpcHQg
YXMgZm9sbG93czoKPj4+Pgo+Pj4+IGZvcigoaj00ODtqPD05NTtqKyspKTsKPj4+PiBkbwo+Pj4+
IMKgwqAgeGVuLWhwdG9vbCBjcHUtb2ZmbGluZSAkago+Pj4+IGRvbmUKPj4+Pgo+Pj4+IGZvcigo
aj00ODtqPD05NTtqKyspKTsKPj4+PiBkbwo+Pj4+IMKgwqAgeGVuLWhwdG9vbCBjcHUtb25saW5l
ICRqCj4+Pj4gZG9uZQo+Pj4+Cj4+Pj4gWGVuIGNyYXNoIHdoZW4gY3B1IHJlLW9ubGluZS4gSSB1
c2UgdGhlIHVwc3RyZWFtIFhFTigwZGQ5MjY4OCkgYW5kIAo+Pj4+IHRyeSBtYW55IGRheXMsIGl0
IHN0aWxsIGNyYXNoLiBCdXQgaWYgSSBvbmx5IGRvIGNwdSBvbmxpbmUvb2ZmbGluZSAKPj4+PiBm
b3IgQ1BVIDQ4fjU5LCBYZW4gd2lsbCBub3QgY3Jhc2guIFRoZSBidWcgY2FuIGJlIHJlcHJvZHVj
ZWQgd2hlbiB3ZSAKPj4+PiBkbyBjcHUgb25saW5lL29mZmxpbmUgZm9yIG1vc3QgQ1BVIGluIGEg
c29ja2V0LiBBbmQgaW50ZXJlc3RpbmcgCj4+Pj4gdGhpbmcgaXMgd2hlbiB3ZSB1c2UgdGhlIHNj
cmlwdCBhcyBmb2xsb3c6Cj4+Pj4KPj4+PiBmb3IoKGo9NDg7ajw9OTU7aisrKSk7Cj4+Pj4gZG8K
Pj4+PiDCoMKgIHhlbi1ocHRvb2wgY3B1LW9mZmxpbmUgJGoKPj4+PiDCoMKgIHhlbi1ocHRvb2wg
Y3B1LW9ubGluZSAkago+Pj4+IGRvbmUKPj4+Pgo+Pj4+IFhlbiB3aWxsIG5vdCBjcmFzaCB0b28u
IElzIHRoZXJlIGEgYnVnIGluIHNjaGVkX2NyZWRpdDI/Cj4+Pj4KPj4+PiBUaGUgY3Jhc2ggbWVz
c2FnZSBhcyBmb2xsb3dzOgo+Pj4+Cj4+Pj4gKFhFTikgQWRkaW5nIGNwdSA3NyB0byBydW5xdWV1
ZSAxCj4+Pj4gKFhFTikgQWRkaW5nIGNwdSA3OCB0byBydW5xdWV1ZSAxCj4+Pj4gKFhFTikgQWRk
aW5nIGNwdSA3OSB0byBydW5xdWV1ZSAxCj4+Pj4gKFhFTikgQWRkaW5nIGNwdSA4MCB0byBydW5x
dWV1ZSAxCj4+Pj4gKFgoRU5YRSkgTikgKioqIERPVUJMRSBGQVVMVCAqKioKPj4+PiAoWEVOKSBB
c3NlcnRpb24gJ2RlYnVnLT5jcHUgPT0gc21wX3Byb2Nlc3Nvcl9pZCgpJyBmYWlsZWQgYXQgCj4+
Pj4gc3BpbmxvY2suYzo4OAo+Pj4+IChYRU4pIC0tLS1bIFhlbi00LjE0LXVuc3RhYmxlwqAgeDg2
XzY0wqAgZGVidWc9ecKgwqAgTm90IHRhaW50ZWQgXS0tLS0KPj4+PiAoWEVOKSBEZWJ1Z2dpbmcg
Y29ubmVjdGlvbiBub3Qgc2V0IHVwLgo+Pj4+IChYRU4pIENQVTrCoMKgwqAgNDgKPj4+PiAoWEVO
KSAtLS0tWyBYZW4tNC4xNC11bnN0YWJsZcKgIHg4Nl82NMKgIGRlYnVnPXnCoMKgIE5vdCB0YWlu
dGVkIF0tLS0tCj4+Pj4gKFhFTikgQ1BVOsKgwqDCoCAwCj4+Pj4gKFhFTikgUklQOsKgwqDCoCBl
MDA4Ols8ZmZmZjgyZDA4MDI0MGJmYz5dIF9zcGluX3VubG9jaysweDQwLzB4NDIKPj4+Cj4+PiBT
byB0aGUgb3JpZ2luYWwgcHJvYmxlbSBjYXVzZXMgYSBkb3VibGUgZmF1bHQsIGJ1dCBzcGlubG9j
ayBkZWJ1Z2dpbmcKPj4+IGNhdXNlcyBhIHN1YnNlcXVlbnQgcGFuaWMuCj4+Pgo+Pj4gQ2FuIHlv
dSBwbGVhc2UgcmV0cnkgdGhlIHRlc3RzIHdpdGggdGhlIGF0dGFjaGVkIHBhdGNoPyBJdCBzaG91
bGQKPj4+IHJlc3VsdCBpbiBkaWFnbm9zdGljIGRhdGEgcmVsYXRlZCB0byB0aGUgcmVhbCBwcm9i
bGVtLgo+Pj4KPj4+Cj4+PiBKdWVyZ2VuCj4+Cj4+IEhpIEp1ZXJnZW4sCj4+Cj4+IEFmdGVyIGFw
cGx5IHlvdXIgcGF0Y2gsIHNwaW5fbG9jayBzdGlsbCBhc3NlcnQuIEFuZCB0aGUgYWRkcmVzcyAK
Pj4gZmZmZjgyZDBiZmZjZTg4MCBpcyBub3QgaW4gdGhlIHhlbi1zeW1zLgo+IAo+IFllcywgSSBo
YWQgYSBidWcgaW4gbXkgbW9kaWZpZWQgQVNTRVJUKCksIGJ1dCB0aGlzIHRpbWUgdGhlIGRhdGEg
aXMKPiBiZXR0ZXIuCj4gCj4+Cj4+IChYRU4pIEFkZGluZyBjcHUgNzggdG8gcnVucXVldWUgMQo+
PiAoWEVOKSAqKiogRE9VQkxFIEZBVUxUICoqKgo+PiAoWEVOKSAtLS0tWyBYZW4tNC4xNC11bnN0
YWJsZcKgIHg4Nl82NMKgIGRlYnVnPXnCoMKgIE5vdCB0YWludGVkIF0tLS0tCj4+IChYRU4pIENQ
VTrCoMKgwqAgNDkKPj4gKFhFTikgUklQOsKgwqDCoCBlMDA4Ols8ZmZmZjgyZDBiZmZjZTg4MD5d
IGZmZmY4MmQwYmZmY2U4ODAKPiAKPiBUaGlzIHNlZW1zIHRvIGJlIGEgY3Jhc2ggaW4gdGhlIHN0
dWIgcGFnZSBvZiBjcHUgNDguCj4gCj4gSSBkb24ndCB0aGluayB0aGlzIGlzIHJlbGF0ZWQgdG8g
dGhlIHNjaGVkdWxlciwgYnV0IHRvIHN0dWIgcGFnZQo+IGhhbmRsaW5nLgo+IAo+IENhbiB5b3Ug
cGxlYXNlIHRyeSB0aGUgYXR0YWNoZWQgcGF0Y2g/Cj4gCj4gCj4gSnVlcmdlbgoKVGhhbmsgeW91
IEp1ZXJnZW4sIHRoaXMgcGF0Y2ggd29ya3MuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVs
