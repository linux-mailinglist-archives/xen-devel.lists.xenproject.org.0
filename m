Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A04CA11A850
	for <lists+xen-devel@lfdr.de>; Wed, 11 Dec 2019 10:57:29 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ieyh6-0008CQ-SV; Wed, 11 Dec 2019 09:54:08 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=bHGM=2B=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1ieyh5-0008CL-85
 for xen-devel@lists.xenproject.org; Wed, 11 Dec 2019 09:54:07 +0000
X-Inumbo-ID: 2acdfe78-1bfc-11ea-8ae3-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 2acdfe78-1bfc-11ea-8ae3-12813bfff9fa;
 Wed, 11 Dec 2019 09:54:05 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 93C56AFE8;
 Wed, 11 Dec 2019 09:54:04 +0000 (UTC)
To: Eslam Elnikety <elnikety@amazon.com>
References: <20191209084119.87563-1-elnikety@amazon.com>
 <09e75904-8faa-fbae-39ea-d9bd026ea4fa@suse.com>
 <1a17bb6d-6f32-280e-0d00-6d06f3520052@amazon.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <0fe3d33f-b83c-4640-c999-fa773c0264a6@suse.com>
Date: Wed, 11 Dec 2019 10:54:25 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <1a17bb6d-6f32-280e-0d00-6d06f3520052@amazon.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] x86/microcode: Support builtin CPU microcode
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Paul Durrant <pdurrant@amazon.co.uk>,
 xen-devel@lists.xenproject.org, David Woodhouse <dwmw@amazon.co.uk>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTEuMTIuMjAxOSAwMDoxOCwgRXNsYW0gRWxuaWtldHkgd3JvdGU6Cj4gT24gMTAuMTIuMTkg
MTA6MzcsIEphbiBCZXVsaWNoIHdyb3RlOgo+PiBPbiAwOS4xMi4yMDE5IDA5OjQxLCBFc2xhbSBF
bG5pa2V0eSB3cm90ZToKPj4+IC0tLSBhL2RvY3MvbWlzYy94ZW4tY29tbWFuZC1saW5lLnBhbmRv
Ywo+Pj4gKysrIGIvZG9jcy9taXNjL3hlbi1jb21tYW5kLWxpbmUucGFuZG9jCj4+PiBAQCAtMjEx
Myw3ICsyMTEzLDcgQEAgbG9naWMgYXBwbGllczoKPj4+ICAgICAgYWN0aXZlIGJ5IGRlZmF1bHQu
Cj4+PiAgIAo+Pj4gICAjIyMgdWNvZGUgKHg4NikKPj4+IC0+IGA9IExpc3Qgb2YgWyA8aW50ZWdl
cj4gfCBzY2FuPTxib29sPiwgbm1pPTxib29sPiBdYAo+Pj4gKz4gYD0gTGlzdCBvZiBbIDxpbnRl
Z2VyPiB8IHNjYW49PGJvb2w+IHwgYnVpbHRpbj08Ym9vbD4sIG5taT08Ym9vbD4gXWAKPj4KPj4g
RGVzcGl0ZSBteSBvdGhlciBxdWVzdGlvbiByZWdhcmRpbmcgdGhlIHVzZWZ1bG5lc3Mgb2YgdGhp
cyBhcyBhCj4+IHdob2xlIGEgZmV3IGNvbW1lbnRzLgo+Pgo+PiBEbyAic2NhbiIgYW5kICJidWls
dGluIiByZWFsbHkgbmVlZCB0byBleGNsdWRlIGVhY2ggb3RoZXI/IEkuZS4KPj4gZG9uJ3QgeW91
IG1lYW4gLCBpbnN0ZWFkIG9mIHwgPwo+IFRoZSB1c2VmdWwgY2FzZSBoZXJlIHdvdWxkIGJlIHNw
ZWNpZnlpbmcgdWNvZGU9c2NhbixidWlsdGluIHdoaWNoIHdvdWxkIAo+IHRyYW5zbGF0ZSB0byBm
YWxsYmFjayBvbnRvIHRoZSBidWlsdGluIG1pY3JvY29kZSBpZiBhIHNjYW4gZmFpbHMuIEluIAo+
IGZhY3QsIHRoaXMgaXMgYWxyZWFkeSB0aGUgY2FzZSBnaXZlbiB0aGUgaW1wbGVtZW50YXRpb24g
aW4gdjEuIEl0IHdpbGwgCj4gYmUgYmV0dGVyIHRvIGNsYXJpZnkgdGhpcyBzZW1hbnRpYyBieSBh
bGxvd2luZyBzY2FuLGJ1aWx0aW4uCj4gCj4gT24gdGhhdCBub3RlLCBJIHJlYWxseSBzZWUgdGhl
ICI8aW50ZWdlcj4iIGFuZCAic2Nhbj08Ym9vbD4iIHRvIGJlIAo+IGVxdWFsLiBGb2xsb3dpbmcg
dGhlIGxvZ2ljIGVhcmxpZXIgd2Ugc2hvdWxkIHByb2JhYmx5IGFsc28gYWxsb3cgCj4gdWNvZGU9
PGludGVnZXI+LGJ1aWx0aW4uIFRoaXMgdHJhbnNsYXRlcyB0byBmYWxsYmFjayB0byBidWlsdGlu
IGlmIHRoZXJlIAo+IGFyZSBubyBtb2R1bGVzIGF0IGluZGV4IDxpbnRlZ2VyPi4KCkFsbW9zdCAt
IGlmIHRoZSBidWlsdGluIG9uZSBpcyBuZXdlciB0aGFuIHRoZSBzZXBhcmF0ZSBibG9iLCB0aGVu
CmVpdGhlciBvZiB0aGUgY21kbGluZSBvcHRpb25zIHlvdSBuYW1lIHNob3VsZCBzdGlsbCBjYXVz
ZSB0aGUKYnVpbHRpbiBvbmUgdG8gYmUgbG9hZGVkLiBJT1cgeW91IHdhbnQgdG8gaG9ub3IgYm90
aCBvcHRpb25zLCBub3QKcHJlZmVyIHRoZSBlYXJsaWVyIG92ZXIgYSBsYXRlciBvbmUuCgo+Pj4g
KwktLS1oZWxwLS0tCj4+PiArCSAgSW5jbHVkZSB0aGUgQ1BVIG1pY3JvY29kZSB1cGRhdGUgaW4g
dGhlIFhlbiBpbWFnZSBpdHNlbGYuIFdpdGggdGhpcwo+Pj4gKwkgIHN1cHBvcnQsIFhlbiBjYW4g
dXBkYXRlIHRoZSBDUFUgbWljcm9jb2RlIHVwb24gYm9vdCB1c2luZyB0aGUgYnVpbHRpbgo+Pj4g
KwkgIG1pY3JvY29kZSwgd2l0aCBubyBuZWVkIGZvciBhbiBhZGRpdGlvbmFsIG1pY3JvY29kZSBi
b290IG1vZHVsZXMuCj4+PiArCj4+PiArCSAgSWYgdW5zdXJlLCBzYXkgTi4KPj4+ICsKPj4+ICtj
b25maWcgQlVJTFRJTl9VQ09ERV9ESVIKPj4+ICsJc3RyaW5nCj4+PiArCWRlZmF1bHQgIi9saWIv
ZmlybXdhcmUiCj4+PiArCWRlcGVuZHMgb24gQlVJTFRJTl9VQ09ERQo+Pgo+PiAuLi4gYXJlIHR3
byBzZXBhcmF0ZSBvcHRpb25zIG5lZWRlZCBhdCBhbGw/IENhbid0IHRoaXMgbGF0dGVyIG9uZQo+
PiBiZWluZyB0aGUgZW1wdHkgc3RyaW5nIGp1c3QgaW1wbHkgdGhlIGZlYXR1cmUgdG8gYmUgZGlz
YWJsZWQ/Cj4gCj4gSSBjYW4gZ28gZWl0aGVyIHdheSBoZXJlLiBUbyBtZSwgdHdvIG9wdGlvbnMg
aXMgY2xlYXJlci4KCkl0J3MgdGhlIG90aGVyIHdheSBhcm91bmQgaGVyZSwgYnV0IEknZCBhY2Nl
cHQgYmVpbmcgb3V0dm90ZWQuCgo+Pj4gKyAgICB1Y29kZV9ibG9iLmRhdGEgPSB4bWFsbG9jX2J5
dGVzKHVjb2RlX2Jsb2Iuc2l6ZSk7Cj4+PiArICAgIGlmICggIXVjb2RlX2Jsb2IuZGF0YSApCj4+
PiArICAgICAgICByZXR1cm47Cj4+PiArCj4+PiArICAgIGlmICggYm9vdF9jcHVfZGF0YS54ODZf
dmVuZG9yID09IFg4Nl9WRU5ET1JfQU1EICkKPj4+ICsgICAgICAgIG1lbWNweSh1Y29kZV9ibG9i
LmRhdGEsIF9fYnVpbHRpbl9hbWRfdWNvZGVfc3RhcnQsIHVjb2RlX2Jsb2Iuc2l6ZSk7Cj4+PiAr
ICAgIGVsc2UKPj4+ICsgICAgICAgIG1lbWNweSh1Y29kZV9ibG9iLmRhdGEsIF9fYnVpbHRpbl9p
bnRlbF91Y29kZV9zdGFydCwgdWNvZGVfYmxvYi5zaXplKTsKPj4KPj4gLi4uIHdoeSB0aGUgY29w
eWluZz8gQ2FuJ3QgeW91IHNpbXBseSBwb2ludCB1Y29kZV9ibG9iLmRhdGEgYXQKPj4gX19idWls
dGluX3thbWQsaW50ZWx9X3Vjb2RlX3N0YXJ0Pwo+IAo+IEkgYW0gYWxsIG9uYm9hcmQuIFNlZSBt
eSBlYXJsaWVyIHJlc3BvbnNlIHRvIEFuZHJldy4gSSB1c2VkIHRoZSBzYW1lIAo+IGxvZ2ljIHRo
YXQgYWxyZWFkeSBleGlzdHMgZm9yIHNjYW4gKHdoaWNoIGFzc3VtZXMgdGhhdCB1Y29kZV9ibG9i
LmRhdGEgCj4gaXMgYWxsb2NhdGVkIGFuZCBzaG91bGQgYmUgZnJlZWQgd2hlbiBhbGwgQ1BVcyBh
cmUgdXBkYXRlZCkuCgpUaGUgc2NhbiBjYXNlIG1heSBiZSBkaWZmZXJlbnQgaW4gdGhhdCBpdCBt
YXkgbm90IGxlbmQgaXRzZWxmCnRvIHJlLXVzaW5nIHRoZSBibG9iIGluIGl0cyBvcmlnaW5hbCBs
b2NhdGlvbi4gSWYgdGhhdCdzIG5vdAp0aGUgcmVhc29uIGZvciB0aGUgcHJlc2VudCBiZWhhdmlv
ciwgdGhlbiBJIHRoaW5rIHdlIHdvdWxkCndhbnQgdG8gZG8gYXdheSB3aXRoIHRoZSB1bm5lY2Vz
c2FyeSBjb3B5aW5nIHRoZXJlIGFzIHdlbGwuCgpKYW4KCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1h
bi9saXN0aW5mby94ZW4tZGV2ZWw=
