Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 82443126F75
	for <lists+xen-devel@lfdr.de>; Thu, 19 Dec 2019 22:12:26 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ii32u-000098-IR; Thu, 19 Dec 2019 21:09:20 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=CEs5=2J=amazon.com=prvs=2492cfbf4=elnikety@srs-us1.protection.inumbo.net>)
 id 1ii32t-00008y-7e
 for xen-devel@lists.xenproject.org; Thu, 19 Dec 2019 21:09:19 +0000
X-Inumbo-ID: d1a2e08a-22a3-11ea-88e7-bc764e2007e4
Received: from smtp-fw-9102.amazon.com (unknown [207.171.184.29])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d1a2e08a-22a3-11ea-88e7-bc764e2007e4;
 Thu, 19 Dec 2019 21:09:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1576789758; x=1608325758;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=6MOqmUlSuQnmg1vAKvT5DVHZ10lv7UGY4LQfGtwGOko=;
 b=dN0ipbO4KfyEqf68ebl3e7o86y0u4uzCiff/tdiUKH+Do3mWnGRxEIhi
 cUxc+evijRRPiMLHu1p1vym68e0k4lK88FblMgNumzoH8LGdXyUV5WRBv
 CPCekeQ7y9ur1/1EPVnQyQ1KehCAb7PkJzkUkqU/4D0bn9R5bJoKwLOtM c=;
IronPort-SDR: P+265LeF0MVAz9tb5zdhIt3NkKSNuSbC86KiduFFca3GtSBOqCekoMaFS36lgtUHqWhlOwsoh1
 lxy6bBafv+Zw==
X-IronPort-AV: E=Sophos;i="5.69,333,1571702400"; d="scan'208";a="14553174"
Received: from sea32-co-svc-lb4-vlan3.sea.corp.amazon.com (HELO
 email-inbound-relay-2c-87a10be6.us-west-2.amazon.com) ([10.47.23.38])
 by smtp-border-fw-out-9102.sea19.amazon.com with ESMTP;
 19 Dec 2019 21:08:59 +0000
Received: from EX13MTAUEA002.ant.amazon.com
 (pdx4-ws-svc-p6-lb7-vlan2.pdx.amazon.com [10.170.41.162])
 by email-inbound-relay-2c-87a10be6.us-west-2.amazon.com (Postfix) with ESMTPS
 id 15B79A1D07; Thu, 19 Dec 2019 21:08:58 +0000 (UTC)
Received: from EX13D03EUA002.ant.amazon.com (10.43.165.166) by
 EX13MTAUEA002.ant.amazon.com (10.43.61.77) with Microsoft SMTP Server (TLS)
 id 15.0.1236.3; Thu, 19 Dec 2019 21:08:56 +0000
Received: from a483e73f63b0.ant.amazon.com (10.43.161.78) by
 EX13D03EUA002.ant.amazon.com (10.43.165.166) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Thu, 19 Dec 2019 21:08:51 +0000
To: Jan Beulich <jbeulich@suse.com>
References: <cover.1576630344.git.elnikety@amazon.com>
 <068a32f917937baca179d7ff4c483ec1584defb4.1576630344.git.elnikety@amazon.com>
 <bde6c6be-3d32-fa8b-6ccf-6d48e6104663@suse.com>
From: Eslam Elnikety <elnikety@amazon.com>
Message-ID: <ed080480-f5ab-59df-2c92-39d9e3b6c5ca@amazon.com>
Date: Thu, 19 Dec 2019 22:08:46 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.3.0
MIME-Version: 1.0
In-Reply-To: <bde6c6be-3d32-fa8b-6ccf-6d48e6104663@suse.com>
Content-Language: en-US
X-Originating-IP: [10.43.161.78]
X-ClientProxiedBy: EX13D34UWC003.ant.amazon.com (10.43.162.66) To
 EX13D03EUA002.ant.amazon.com (10.43.165.166)
Precedence: Bulk
Subject: Re: [Xen-devel] [PATCH v2 1/4] x86/microcode: Improve documentation
 and parsing for ucode=
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
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
 xen-devel@lists.xenproject.org, David Woodhouse <dwmw@amazon.co.uk>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTguMTIuMTkgMTI6NDksIEphbiBCZXVsaWNoIHdyb3RlOgo+IE9uIDE4LjEyLjIwMTkgMDI6
MzIsIEVzbGFtIEVsbmlrZXR5IHdyb3RlOgo+PiBEZWNvdXBsZSB0aGUgbWljcm9jb2RlIHJlZmVy
ZW5jaW5nIG1lY2hhbmlzbSB3aGVuIHVzaW5nIEdSVUIgdG8gdGhhdAo+PiB3aGVuIHVzaW5nIEVG
SS4gVGhpcyBhbGxvd3MgdXMgdG8gYXZvaWQgdGhlICJ1bnNwZWNpZmllZCBlZmZlY3QiIG9mCj4+
IHVzaW5nIGA8aW50ZWdlcj4gfCBzY2FuYCBhbG9uZyB4ZW4uZWZpLgo+IAo+IEkgZ3Vlc3MgInVu
c3BlY2lmaWVkIGVmZmVjdCIgaW4gdGhlIGRvYyB3YXMgcHJldHR5IHBvaW50bGVzcyAtIHN1Y2gK
PiBvcHRpb25zIGhhdmUgYmVlbiBpZ25vcmVkIGJlZm9yZTsgaW4gZmFjdCAuLi4KPiAKPj4gV2l0
aCB0aGF0LCBYZW4gY2FuIGV4cGxpY2l0bHkKPj4gaWdub3JlIHRob3NlIG5hbWVkIG9wdGlvbnMg
d2hlbiB1c2luZyBFRkkuCj4gCj4gLi4uIEkgZG9uJ3Qgc2VlIHRoaW5ncyBiZWNvbWluZyBhbnkg
bW9yZSBleHBsaWNpdCAobm90IGV2ZW4gcGFyc2luZwo+IHRoZSBvcHRpb25zIHdhcyBxdWl0ZSBl
eHBsaWNpdCB0byBtZSkuCj4gCgpJIGFncmVlIHRoYXQgdGhvc2Ugb3B0aW9ucyBoYXZlIGJlZW4g
aWdub3JlZCBzbyBmYXIgaW4gdGhlIGNhc2Ugb2YgRUZJLiAKVGhlIGRvY3VtZW50YXRpb24gY29u
dHJhZGljdHMgdGhhdCBob3dldmVyLiBUaGUgZG9jdW1lbnRhdGlvbjoKKiBzYXlzIDxpbnRlZ2Vy
PiBoYXMgdW5zcGVjaWZpZWQgZWZmZWN0LgoqIGRvZXMgbm90IG1lbnRpb24gYW55dGhpbmcgYWJv
dXQgc2NhbiBiZWluZyBpZ25vcmVkLgoKV2l0aCB0aGlzIHBhdGNoLCBpdCBpcyBleHBsaWNpdCBp
biBjb2RlIGFuZCBpbiBkb2N1bWVudGF0aW9uIHRoYXQgYm90aCAKb3B0aW9ucyBhcmUgaWdub3Jl
ZCBpbiBjYXNlIG9mIEVGSS4KCj4+IEFzIGFuIGFkZGVkIGJlbmVmaXQsCj4+IHdlIGdldCBhIHN0
cmFpZ2h0Zm93YXJkIHBhcnNpbmcgb2YgdGhlIHVjb2RlIHBhcmFtZXRlci4KPiAKPiBJdCdzIGEg
c2luZ2xlIGlmKCkgeW91IGVsaW1pbmF0ZSAtIGZvciBtZSB0aGlzIGRvZXNuJ3QgbWFrZSBpdAo+
IG1lYW5pbmdmdWxseSBtb3JlIHN0cmFpZ2h0Zm9yd2FyZC4KPiAKCkFzIHdlIGRlY291cGxlIHVj
b2RlX21vZF9pZHggYW5kIHVjb2RlX21vZF9lZmlfaWR4LCB0aGUgcGFyc2luZyBvZiB0aGUgCnVj
b2RlPSBqdXN0IGZvbGxvd3MgdGhlIHBhdHRlcm4gIlsgPGludGVnZXI+IHwgc2Nhbj08Ym9vbD4s
IG5taT08Ym9vbD4gCl0iIGFuZCBpdCBkb2VzIG5vdCBoYXZlIHRvIGNhdGVyIGZvciBjb3JuZXIg
Y2FzZXMuIEluIGVpdGhlciBjYXNlLCBpZiAKeW91IHN0cm9uZ2x5IGRpc2FncmVlIHdpdGggdGhl
IHdvcmRpbmcsIEkgY2FuIGRyb3AgdGhhdCBzZW50ZW5jZS4KCj4+IC0tLSBhL2RvY3MvbWlzYy94
ZW4tY29tbWFuZC1saW5lLnBhbmRvYwo+PiArKysgYi9kb2NzL21pc2MveGVuLWNvbW1hbmQtbGlu
ZS5wYW5kb2MKPj4gQEAgLTIxMjgsNyArMjEyOCwxMyBAQCBsb2dpYyBhcHBsaWVzOgo+PiAgICMj
IyB1Y29kZSAoeDg2KQo+PiAgID4gYD0gTGlzdCBvZiBbIDxpbnRlZ2VyPiB8IHNjYW49PGJvb2w+
LCBubWk9PGJvb2w+IF1gCj4+ICAgCj4+IC1TcGVjaWZ5IGhvdyBhbmQgd2hlcmUgdG8gZmluZCBD
UFUgbWljcm9jb2RlIHVwZGF0ZSBibG9iLgo+PiArICAgIEFwcGxpY2FiaWxpdHk6IHg4Ngo+PiAr
ICAgIERlZmF1bHQ6IGBubWlgCj4+ICsKPj4gK0NvbnRyb2xzIGZvciBDUFUgbWljcm9jb2RlIGxv
YWRpbmcuIEZvciBlYXJseSBsb2FkaW5nLCB0aGlzIHBhcmFtZXRlciBjYW4KPj4gK3NwZWNpZnkg
aG93IGFuZCB3aGVyZSB0byBmaW5kIHRoZSBtaWNyb2NvZGUgdXBkYXRlIGJsb2IuIEZvciBsYXRl
IGxvYWRpbmcsCj4+ICt0aGlzIHBhcmFtZXRlciBzcGVjaWZpZXMgaWYgdGhlIHVwZGF0ZSBoYXBw
ZW5zIHdpdGhpbiBhIE5NSSBoYW5kbGVyIG9yIGluCj4+ICthIHN0b3BfbWFjaGluZSBjb250ZXh0
Lgo+IAo+IEl0J3MgYWx3YXlzIHN0b3BfbWFjaGluZSBjb250ZXh0LCBpc24ndCBpdD8gSSBhbHNv
IGRvbid0IHRoaW5rIHRoaXMKPiBpbXBsZW1lbnRhdGlvbiBkZXRhaWwgYmVsb25ncyBoZXJlLgo+
IAoKTmVlZHMgYSBiZXR0ZXIgd29yZGluZyBpbmRlZWQuIExldCBtZSBrbm93IGlmIHlvdSBoYXZl
IHBhcnRpY3VsYXIgCnN1Z2dlc3Rpb25zLCBhbmQgSSB3aWxsIGluY29ycG9yYXRlIGluIHYzLgoK
Pj4gLS0tIGEveGVuL2FyY2gveDg2L21pY3JvY29kZS5jCj4+ICsrKyBiL3hlbi9hcmNoL3g4Ni9t
aWNyb2NvZGUuYwo+PiBAQCAtNjAsNyArNjAsNyBAQAo+PiAgIAo+PiAgIHN0YXRpYyBtb2R1bGVf
dCBfX2luaXRkYXRhIHVjb2RlX21vZDsKPj4gICBzdGF0aWMgc2lnbmVkIGludCBfX2luaXRkYXRh
IHVjb2RlX21vZF9pZHg7Cj4+IC1zdGF0aWMgYm9vbF90IF9faW5pdGRhdGEgdWNvZGVfbW9kX2Zv
cmNlZDsKPj4gK3N0YXRpYyBzaWduZWQgaW50IF9faW5pdGRhdGEgdWNvZGVfbW9kX2VmaV9pZHg7
Cj4gCj4gSSBkb24ndCBzZWUgYW55dGhpbmcgbmVnYXRpdmUgYmUgcHV0IGludG8gaGVyZSAtIHNo
b3VsZCBiZSB1bnNpZ25lZAo+IGludCB0aGVuLgo+IAoKQ29ycmVjdCEgVGhlIHR5cGUganVzdCBj
YXJyaWVkIG92ZXIgZnJvbSB0aGUgY291cGxpbmcgd2l0aCAKdWNvZGVfbW9kX2lkeC4gV2lsbCBh
ZGp1c3QgaW4gdjMuCgo+PiBAQCAtMTA1LDE2ICsxMDUsMTAgQEAgc3RhdGljIHN0cnVjdCBtaWNy
b2NvZGVfcGF0Y2ggKm1pY3JvY29kZV9jYWNoZTsKPj4gICAKPj4gICB2b2lkIF9faW5pdCBtaWNy
b2NvZGVfc2V0X21vZHVsZSh1bnNpZ25lZCBpbnQgaWR4KQo+PiAgIHsKPj4gLSAgICB1Y29kZV9t
b2RfaWR4ID0gaWR4Owo+PiAtICAgIHVjb2RlX21vZF9mb3JjZWQgPSAxOwo+PiArICAgIHVjb2Rl
X21vZF9lZmlfaWR4ID0gaWR4Owo+IAo+IElzIGl0IGd1YXJhbnRlZWQgKG5vdyBhbmQgZm9yZXZl
cikgdGhhdCB0aGUgaW5kZXggcGFzc2VkIGluIGlzCj4gbm9uLXplcm8/IFlvdSBjaGFuZ2VzIHRv
IG1pY3JvY29kZV9ncmFiX21vZHVsZSgpIGltcGx5IHNvLCBidXQKPiBqdXN0IGxvb2tpbmcgYXQg
dGhlIGNhbGwgc2l0ZSBvZiB0aGUgZnVuY3Rpb24gSSBjYW4ndCBjb252aW5jZQo+IG15c2VsZiB0
aGlzIGlzIHRoZSBjYXNlLiBfSWZfIGl0IGlzICh0aG91Z2h0IHRvIGJlKSBndWFyYW50ZWVkLAo+
IHRoZW4gSSB0aGluayB5b3UgYXQgbGVhc3Qgd2FudCB0byBBU1NFUlQoKSBoZXJlLCBwZXJoYXBz
IHdpdGgKPiBhIGNvbW1lbnQuCj4gCgpGb3IgeDg2LCBpdCBzZWVtcyB3ZSBoYXZlIHRoYXQgZ3Vh
cmFudGVlIChnaXZlbiB0aGF0IHdlIG11c3QgaGF2ZSBhIApkb20wKS4gUmlnaHQ/Cgo+PiAgIH0K
Pj4gICAKPj4gLS8qCj4+IC0gKiBUaGUgZm9ybWF0IGlzICdbPGludGVnZXI+fHNjYW49PGJvb2w+
LCBubWk9PGJvb2w+XScuIEJvdGggb3B0aW9ucyBhcmUKPj4gLSAqIG9wdGlvbmFsLiBJZiB0aGUg
RUZJIGhhcyBmb3JjZWQgd2hpY2ggb2YgdGhlIG11bHRpYm9vdCBwYXlsb2FkcyBpcyB0byBiZQo+
PiAtICogdXNlZCwgb25seSBubWk9PGJvb2w+IGlzIHBhcnNlZC4KPj4gLSAqLwo+PiAtc3RhdGlj
IGludCBfX2luaXQgcGFyc2VfdWNvZGUoY29uc3QgY2hhciAqcykKPj4gK3N0YXRpYyBpbnQgX19p
bml0IHBhcnNlX3Vjb2RlX3BhcmFtKGNvbnN0IGNoYXIgKnMpCj4gCj4gQW55IHBhcnRpY3VsYXIg
cmVhc29uIGZvciB0aGUgcmVuYW1pbmc/IFRoZSBmdW5jdGlvbiBuYW1lIHdhcyBxdWl0ZQo+IGZp
bmUgaW1vLgo+IAoKVG8gbWUsICJwYXJzZV91Y29kZSIgaXMgYSBtaXNub21lci4KClRoYW5rcyBm
b3IgeW91ciBjb21tZW50cywgSmFuLgoKLS0gRXNsYW0KCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1h
bi9saXN0aW5mby94ZW4tZGV2ZWw=
