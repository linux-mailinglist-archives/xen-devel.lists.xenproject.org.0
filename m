Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EBEABF27B
	for <lists+xen-devel@lfdr.de>; Thu, 26 Sep 2019 14:05:38 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iDSTP-0005bN-Hn; Thu, 26 Sep 2019 12:02:15 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=fOM6=XV=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1iDSTO-0005bI-KZ
 for xen-devel@lists.xenproject.org; Thu, 26 Sep 2019 12:02:14 +0000
X-Inumbo-ID: 79b96a78-e055-11e9-9650-12813bfff9fa
Received: from foss.arm.com (unknown [217.140.110.172])
 by localhost (Halon) with ESMTP
 id 79b96a78-e055-11e9-9650-12813bfff9fa;
 Thu, 26 Sep 2019 12:02:13 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D4273142F;
 Thu, 26 Sep 2019 05:02:12 -0700 (PDT)
Received: from [10.37.8.90] (unknown [10.37.8.90])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A6DB03F67D;
 Thu, 26 Sep 2019 05:02:10 -0700 (PDT)
To: hongyax@amazon.com, xen-devel@lists.xenproject.org
References: <cover.1569489002.git.hongyax@amazon.com>
 <913e6e6b-189c-d318-7b73-4258d53c80f1@arm.com>
 <2e462fff-ddd6-cc72-b8a8-b825d707e96b@amazon.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <8392c34a-7224-2630-b236-1bd47843587e@arm.com>
Date: Thu, 26 Sep 2019 13:02:09 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <2e462fff-ddd6-cc72-b8a8-b825d707e96b@amazon.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [RFC PATCH 00/84] Remove direct map from Xen
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
 Jan Beulich <jbeulich@suse.com>, Dario Faggioli <dfaggioli@suse.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGksCgpPbiA5LzI2LzE5IDExOjMzIEFNLCBob25neWF4QGFtYXpvbi5jb20gd3JvdGU6Cj4gT24g
MjYvMDkvMjAxOSAxMToyMSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+PiBIaSwKPj4KPj4gVGhhbmsg
eW91IGZvciBwb3N0aW5nIHRoZSBzZXJpZXMuCj4+Cj4+IE9uIDkvMjYvMTkgMTA6NDUgQU0sIGhv
bmd5YXhAYW1hem9uLmNvbSB3cm90ZToKPj4+IEZyb206IEhvbmd5YW4gWGlhIDxob25neWF4QGFt
YXpvbi5jb20+Cj4+Pgo+Pj4gUHJldmlvdXNseSwgV2VpIExpdSBoYXMgY3JlYXRlZCB0aGUgcGF0
Y2ggc2VyaWVzIHRvIHN3aXRjaCB0bwo+Pj4gYWxsb2MvbWFwL3VubWFwL2ZyZWUgQVBJcyBmb3Ig
WGVuIHBhZ2UgdGFibGVzIHNvIHRoYXQgWGVuIHBhZ2UgdGFibGVzCj4+PiBhcmUgbWFwcGVkIHdp
dGggbWFwX2RvbWFpbl9wYWdlKCkuIFRoaXMgaXMgdGhlIGZpcnN0IHN0ZXAgdG93YXJkcwo+Pj4g
cmVtb3ZpbmcgdGhlIGRpcmVjdCBtYXAuIEkgaW1wbGVtZW50ZWQgcGF0Y2hlcyBvbiB0b3Agb2Yg
V2VpJ3MgdG8gcmVtb3ZlCj4+PiB0aGUgZGlyZWN0IG1hcCBjb21wbGV0ZWx5Lgo+Pj4KPj4+IElu
IGFkZGl0aW9uIHRvIFdlaSdzLCBteSBwYXRjaGVzOgo+Pj4gLSAoV2VpKSBpbXBsZW1lbnQgYSBw
cm9wZXIgUE1BUCBpbmZyYXN0cnVjdHVyZSBmb3IgYm9vdHN0cmFwcGluZwo+Pj4gLSByZW1vdmUg
ZGlyZWN0IG1hcCBjb2RlIGluIG1hcF9kb21haW5fcGFnZSgpIGFuZCB1c2UgbWFwY2FjaGUsIHVz
ZSBQTUFQCj4+PiDCoCB3aGVuIG1hcGNhY2hlIG5vdCByZWFkeQo+Pj4gLSBtYXAvdW5tYXAgeGVu
aGVhcCBhbGxvY2F0aW9ucyB0byB0aGUgZGlyZWN0IG1hcCByZWdpb24gc28gdGhhdCB2YTwtPnBh
Cj4+PiDCoCBtYWNyb3Mgc3RpbGwgd29yawo+Pj4gLSBpbnN0YWxsIGR1bW15IG1hcHBpbmdzIChu
byBwZXJtaXNzaW9ucywgSU5WQUxJRF9NRk4pIGluc3RlYWQgb2YgYWN0dWFsCj4+PiDCoCAxOjEg
bWFwcGluZ3MgZHVyaW5nIGJvb3QsIHNvIHRoZSBkaXJlY3QgbWFwIG5vIGxvbmdlciBleGlzdHMK
Pj4+IC0gZml4IG1hbnkgcGxhY2VzIHdoZXJlIGNvZGUgaW5jb3JyZWN0bHkgYXNzdW1lcyBhIGRp
cmVjdCBtYXAKPj4KPj4gSSBhbSBhIGJpdCBjb25mdXNlZC4gQXJlIHlvdXIgcGF0Y2hlcyBmaXhp
bmcgYnVnIGZyb20gV2VpJ3Mgc2VyaWVzPwo+Pgo+IAo+IFRoZSBnb2FsIGlzIHRvIHJlbW92ZSB0
aGUgZGlyZWN0IG1hcCBjb21wbGV0ZWx5IGZyb20gWGVuLiBXZWkncyBzZXJpZXMgCj4gaGFzIGRv
bmUgdGhlIGZpcnN0IHN0ZXAgYnV0IHdhcyBub3QgY29tcGxldGUuIE15IGFkZGl0aW9uYWwgcGF0
Y2hlcyAKPiBmaW5pc2hlZCB0aGUgcmVtYWluaW5nIHN0ZXBzIGFuZCByZW1vdmVkIHRoZSBkaXJl
Y3QgbWFwLgoKU28gSSB1bmRlcnN0YW5kIHRoaXMgY29ycmVjdGx5LCBXZWkncyBzZXJpZXMgaGFz
IG5vIGJ1ZyBpbiBpdCBhbmQgY291bGQgCmJlIGNvbW1pdHRlZCBhcyBpcyB3aXRob3V0IGJyZWFr
aW5nIFhlbi4gQW0gSSBjb3JyZWN0PwoKVGhlIHJlYXNvbiBJIGFtIGFza2luZyB0aGF0IGlmIHlv
dSBoYXZlIGEgZmV3IHBhdGNoZXMgdGhhdCBzYXkgZml4IApsZWFrL2J1Zy4gSWYgdGhleSBhcmUg
YnVnIGluIFdlaSdzIHNlcmllcywgdGhlbiB0aGV5IHNob3VsZCBiZSBzcXVhc2hlZCAKaW4gcGF0
Y2hlcyBpbnRyb2R1Y2luZyB0aGVtLgoKPiAKPj4+Cj4+PiBJIGhhdmUgbW9kZXJhdGVseSB0ZXN0
ZWQgdGhlIHBhdGNoZXMuIEkgYW0gYWJsZSB0byBib290IGludG8gZG9tMCwKPj4+IGNyZWF0ZS9k
ZXN0cm95IFBWL0hWTSBndWVzdHMgYW5kIHJ1biBYVEYgdGVzdHMuIFBlcnNvbmFsbHksIEkgZmlu
ZCBpdAo+Pj4gZGlmZmljdWx0IHRvIGRpc2NvdmVyIGFsbCBwbGFjZXMgd2hlcmUgaXQgaW5jb3Jy
ZWN0bHkgYXNzdW1lcyBhIGRpcmVjdAo+Pj4gbWFwLCBzbyByZXZpZXdzIGFuZCBmdXJ0aGVyIHRl
c3RpbmcgYXJlIG1vcmUgdGhhbiB3ZWxjb21lLgo+Pgo+PiBEbyB5b3UgaGF2ZSBhIGJyYW5jaCB3
aXRoIHRoaXMgc2VyaWVzIGFwcGxpZWQ/Cj4+Cj4gCj4gSSBhbSBzZXR0aW5nIHRoaXMgdXAuIFdp
bGwgc2VuZCBvdXQgdGhlIGxpbmsgdG8gdGhlIGJyYW5jaCBzb29uLgoKVGhhbmsgeW91LgoKQ2hl
ZXJzLAoKLS0gCkp1bGllbiBHcmFsbAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L3hlbi1kZXZlbA==
