Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 60C1017B6F6
	for <lists+xen-devel@lfdr.de>; Fri,  6 Mar 2020 07:46:09 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jA6gj-0005iv-Rp; Fri, 06 Mar 2020 06:42:25 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=D+BG=4X=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1jA6gj-0005iq-3G
 for xen-devel@lists.xenproject.org; Fri, 06 Mar 2020 06:42:25 +0000
X-Inumbo-ID: a2524803-5f75-11ea-a732-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a2524803-5f75-11ea-a732-12813bfff9fa;
 Fri, 06 Mar 2020 06:42:23 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 78839B1C9;
 Fri,  6 Mar 2020 06:42:22 +0000 (UTC)
To: Jan Beulich <jbeulich@suse.com>
References: <20200226124705.29212-1-jgross@suse.com>
 <20200226124705.29212-10-jgross@suse.com>
 <61640156-0e35-6808-829a-2eb8accbfb94@suse.com>
 <1a6e1c6c-7e88-3396-885b-62371bb24db4@suse.com>
 <36259bf3-8469-5aac-fb02-3966ae1500fd@suse.com>
 <fab9f226-e3a8-85c1-669c-07fd19325d18@suse.com>
 <725efae2-d7e4-1d13-5b25-7cd1a52a2a63@suse.com>
 <bd54ba1a-ce9e-35a3-3b15-82f74040baea@suse.com>
 <1c86f9c7-c2fd-e2d9-67ef-ceefa95a9851@suse.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <9d239e78-49bd-43be-1096-8cdfa7a29e5a@suse.com>
Date: Fri, 6 Mar 2020 07:42:20 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <1c86f9c7-c2fd-e2d9-67ef-ceefa95a9851@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v6 09/12] xen: add runtime parameter access
 support to hypfs
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
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Jun Nakajima <jun.nakajima@intel.com>, xen-devel@lists.xenproject.org,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDUuMDMuMjAgMDk6MjYsIEphbiBCZXVsaWNoIHdyb3RlOgo+IE9uIDA1LjAzLjIwMjAgMDc6
MDEsIErDvHJnZW4gR3Jvw58gd3JvdGU6Cj4+IE9uIDA0LjAzLjIwIDE3OjU2LCBKYW4gQmV1bGlj
aCB3cm90ZToKPj4+IE9uIDA0LjAzLjIwMjAgMTc6MzEsIErDvHJnZW4gR3Jvw58gd3JvdGU6Cj4+
Pj4gT24gMDQuMDMuMjAgMTY6MTksIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+PiBPbiAwNC4wMy4y
MDIwIDE2OjA3LCBKw7xyZ2VuIEdyb8OfIHdyb3RlOgo+Pj4+Pj4gT24gMDQuMDMuMjAgMTI6MzIs
IEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+Pj4+IE9uIDI2LjAyLjIwMjAgMTM6NDcsIEp1ZXJnZW4g
R3Jvc3Mgd3JvdGU6Cj4+Pj4+Pj4+ICtzdGF0aWMgdm9pZCB1cGRhdGVfZXB0X3BhcmFtX2FwcGVu
ZChjb25zdCBjaGFyICpzdHIsIGludCB2YWwpCj4+Pj4+Pj4+ICt7Cj4+Pj4+Pj4+ICsgICAgY2hh
ciAqcG9zID0gb3B0X2VwdF9zZXR0aW5nICsgc3RybGVuKG9wdF9lcHRfc2V0dGluZyk7Cj4+Pj4+
Pj4+ICsKPj4+Pj4+Pj4gKyAgICBzbnByaW50Zihwb3MsIHNpemVvZihvcHRfZXB0X3NldHRpbmcp
IC0gKHBvcyAtIG9wdF9lcHRfc2V0dGluZyksCj4+Pj4+Pj4+ICsgICAgICAgICAgICAgIiwlcz0l
ZCIsIHN0ciwgdmFsKTsKPj4+Pj4+Pj4gK30KPj4+Pj4+Pj4gKwo+Pj4+Pj4+PiArc3RhdGljIHZv
aWQgdXBkYXRlX2VwdF9wYXJhbSh2b2lkKQo+Pj4+Pj4+PiArewo+Pj4+Pj4+PiArICAgIHNucHJp
bnRmKG9wdF9lcHRfc2V0dGluZywgc2l6ZW9mKG9wdF9lcHRfc2V0dGluZyksICJwbWw9JWQiLCBv
cHRfZXB0X3BtbCk7Cj4+Pj4+Pj4+ICsgICAgaWYgKCBvcHRfZXB0X2FkID49IDAgKQo+Pj4+Pj4+
PiArICAgICAgICB1cGRhdGVfZXB0X3BhcmFtX2FwcGVuZCgiYWQiLCBvcHRfZXB0X2FkKTsKPj4+
Pj4+Pgo+Pj4+Pj4+IFRoaXMgd29uJ3QgY29ycmVjdGx5IHJlZmxlY3QgcmVhbGl0eTogSWYgeW91
IGxvb2sgYXQKPj4+Pj4+PiB2bXhfaW5pdF92bWNzX2NvbmZpZygpLCBldmVuIGEgbmVnYXRpdmUg
dmFsdWUgbWVhbnMgInRydWUiIGhlcmUsCj4+Pj4+Pj4gdW5sZXNzIG9uIGEgc3BlY2lmaWMgQXRv
bSBtb2RlbC4gSSB0aGluayBpbml0X2VwdF9wYXJhbSgpIHdhbnRzCj4+Pj4+Pj4gdG8gaGF2ZSB0
aGF0IGVycmF0dW0gd29ya2Fyb3VuZCBsb2dpYyBtb3ZlZCB0aGVyZSwgc3VjaCB0aGF0Cj4+Pj4+
Pj4geW91IGNhbiB0aGVuIGFzc21lIHRoZSB2YWx1ZSB0byBiZSBub24tbmVnYXRpdmUgaGVyZS4K
Pj4+Pj4+Cj4+Pj4+PiBCdXQgaXNuJ3Qgbm90IG1lbnRpb25pbmcgaXQgaW4gdGhlIC0xIGNhc2Ug
Y29ycmVjdD8gLTEgbWVhbnM6IGRvIHRoZQo+Pj4+Pj4gY29ycmVjdCB0aGluZyBvbiB0aGUgY3Vy
cmVudCBoYXJkd2FyZS4KPj4+Pj4KPj4+Pj4gV2VsbCwgSSB0aGluayB0aGUgb3V0cHV0IGhlcmUg
c2hvdWxkIHJlcHJlc2VudCBlZmZlY3RpdmUgc2V0dGluZ3MsCj4+Pj4KPj4+PiBUaGUgbWluaW11
bSByZXF1aXJlbWVudCBpcyB0byByZWZsZWN0IHRoZSBlZmZlY3RpdmUgcGFyYW1ldGVycywgbGlr
ZQo+Pj4+IGNtZGxpbmUgaXMgZG9pbmcgZm9yIGJvb3QtdGltZSBvbmx5IHBhcmFtZXRlcnMuIFdp
dGggcnVudGltZSBwYXJhbWV0ZXJzCj4+Pj4gd2UgaGFkIG5vIHdheSBvZiB0ZWxsaW5nIHdoYXQg
d2FzIHNldCwgYW5kIHRoaXMgaXMgbm93IHBvc3NpYmxlLgo+Pj4+Cj4+Pj4+IGFuZCBhIHN1Yi1p
dGVtIHNob3VsZCBiZSBzdXBwcmVzc2VkIG9ubHkgaWYgYSBzZXR0aW5nIGhhcyBubyBlZmZlY3QK
Pj4+Pj4gYXQgYWxsIGluIHRoZSBjdXJyZW50IHNldHVwLCBsaWtlIC4uLgo+Pj4+Pgo+Pj4+Pj4+
PiArICAgIGlmICggb3B0X2VwdF9leGVjX3NwID49IDAgKQo+Pj4+Pj4+PiArICAgICAgICB1cGRh
dGVfZXB0X3BhcmFtX2FwcGVuZCgiZXhlYy1zcCIsIG9wdF9lcHRfZXhlY19zcCk7Cj4+Pj4+Pj4K
Pj4+Pj4+PiBJIGFncmVlIGZvciB0aGlzIG9uZSAtIGlmIHRoZSB2YWx1ZSBpcyBzdGlsbCAtMSwg
aXQgaGFzIG5laXRoZXIKPj4+Pj4+PiBiZWVuIHNldCBub3IgaXMgaXRzIHZhbHVlIG9mIGFueSBp
bnRlcmVzdC4KPj4+Pj4KPj4+Pj4gLi4uIGhlcmUuCj4+Pj4KPj4+PiBJIHRoaW5rIHdlIHNob3Vs
ZCBub3QgbWl4IHVwIHNwZWNpZmllZCBwYXJhbWV0ZXJzIGFuZCBlZmZlY3RpdmUKPj4+PiBzZXR0
aW5ncy4gSW4gY2FzZSBhbiBlZmZlY3RpdmUgc2V0dGluZyBpcyBvZiBjb21tb24gaW50ZXJlc3Qg
aXQgc2hvdWxkCj4+Pj4gYmUgcmVwb3J0ZWQgdmlhIGEgc3BlY2lmaWMgbm9kZSAobGlrZSBlLmcu
IHNwZWNpZmljIG1pdGlnYXRpb24gc2V0dGluZ3MKPj4+PiB3aGVyZSB0aGUgY21kbGluZSBpcyBu
b3QgcHJvdmlkaW5nIGVub3VnaCBkZXRhaWxzKS4KPj4+Cj4+PiBCdXQgdGhlbiBhIGJvb2xlYW4g
b3B0aW9uIHRoYXQgd2Fzbid0IHNwZWNpZmllZCBvbiB0aGUgY29tbWFuZCBsaW5lCj4+PiBzaG91
bGQgcHJvZHVjZSBubyBvdXRwdXQgYXQgYWxsLiBBbmQgaGVuY2Ugd2UnZCBuZWVkIGEgd2F5IHRv
IHRlbGwKPj4+IHdoZXRoZXIgYW4gb3B0aW9uIHdhcyBzZXQgZnJvbSBjb21tYW5kIGxpbmUgZm9y
IF9hbGxfIG9mIHRoZW0uIEkKPj4+IGRvbid0IHRoaW5rIHRoaXMgd291bGQgYmUgdmVyeSBoZWxw
ZnVsLgo+Pgo+PiBJIGRpc2FncmVlIGhlcmUuCj4+Cj4+IFRoaXMgaXMgaW1wb3J0YW50IG9ubHkg
Zm9yIGNhc2VzIHdoZXJlIHRoZSBoeXBlcnZpc29yIHRyZWF0cyB0aGUKPj4gcGFyYW1ldGVyIGFz
IGEgdHJpc3RhdGU6IHRydWUvZmFsc2UvdW5zcGVjaWZpZWQuIEluIGFsbCBjYXNlcyB3aGVyZQo+
PiB0aGUgYm9vbCB2YWx1ZSBpcyByZWFsbHkgdHJ1ZSBvciBmYWxzZSBpdCBjYW4gYmUgcmVwb3J0
ZWQgYXMgc3VjaC4KPiAKPiBUaGUgcHJvYmxlbSBJJ20gaGF2aW5nIHdpdGggdGhpcyBpcyB0aGUg
cmVzdWx0aW5nIGluY29uc2lzdGVuY3k6Cj4gV2hlbiB3ZSB3cml0ZSB0aGUgdmFyaWFibGUgd2l0
aCAwIG9yIDEgaW4gY2FzZSB3ZSBmaW5kIGl0IHRvIGJlCj4gLTEgYWZ0ZXIgY29tbWFuZCBsaW5l
IHBhcnNpbmcsIHRoZSBleHRlcm5hbGx5IHZpc2libGUgZWZmZWN0IHdpbGwKPiBiZSBkaWZmZXJl
bnQgZnJvbSB0aGUgY2FzZSB3aGVyZSB3ZSBsZWF2ZSBpdCB0byBiZSAtMSB5ZXQgc3RpbGwKPiB0
cmVhdCBpdCBhcyAocHNldWRvLSlib29sZWFuLiBUaGlzLCBob3dldmVyLCBpcyBhbiBpbXBsZW1l
bnRhdGlvbgo+IGRldGFpbCwgd2hpbGUgaW1vIHRoZSBoeXBmcyBwcmVzZW50YXRpb24gc2hvdWxk
IG5vdCBkZXBlbmQgb24KPiBzdWNoIGltcGxlbWVudGF0aW9uIGRldGFpbHMuCj4gCj4+IFJlcG9y
dGluZyAwLzEgZm9yIGUuZy4gImFkIiBpZiBvcHRfZXB0X2FkPT0tMSB3b3VsZCBhZGQgYSBsYXRl
bnQgcHJvYmxlbQo+PiBpZiBhbnkgb3RoZXIgYWN0aW9uIHdvdWxkIGJlIGRlcml2ZWQgZnJvbSB0
aGUgcGFyYW1ldGVyIHZhcmlhYmxlIGJlaW5nCj4+IC0xLgo+Pgo+PiBTbyBlaXRoZXIgb3B0X2Vw
dF9hZCBzaG91bGQgYmUgbW9kaWZpZWQgdG8gY2hhbmdlIGl0IHRvIDAvMSBpbnN0ZWFkIG9mCj4+
IG9ubHkgc2V0dGluZyB0aGUgVkNNUyBmbGFnLAo+IAo+IFRoYXQncyB3aGF0IEkgZGlkIHN1Z2dl
c3QuCj4gCj4+IG9yIHRoZSBsb2dpYyBzaG91bGQgYmUga2VwdCBhcyBpcyBpbiB0aGlzCj4+IHBh
dGNoLiBJTU8gY2hhbmdpbmcgdGhlIHNldHRpbmcgb2Ygb3B0X2VwdF9hZCBzaG91bGQgYmUgZG9u
ZSBpbiBhbm90aGVyCj4+IHBhdGNoIGlmIHRoaXMgaXMgcmVhbGx5IHdhbnRlZC4KPiAKPiBBbmQg
b2YgY291cnNlIEkgZG9uJ3QgbWluZCBhdCBhbGwgZG9pbmcgc28gaW4gYSBwcmVyZXEgcGF0Y2gu
Cj4gSXQncyBqdXN0IHRoYXQgdGhlIHBhdGNoIGhlcmUgcHJvdmlkZXMgYSBnb29kIHBsYWNlIF93
aGVyZV8gdG8KPiBhY3R1YWxseSBkbyBzdWNoIGFuIGFkanVzdG1lbnQuCgpJIHdhcyB0aGlua2lu
ZyBvZiBzb21ldGhpbmcgbGlrZSB0aGlzOgoKLS0tIGEveGVuL2FyY2gveDg2L2h2bS92bXgvdm1j
cy5jCisrKyBiL3hlbi9hcmNoL3g4Ni9odm0vdm14L3ZtY3MuYwpAQCAtMzEzLDEyICszMTMsMTIg
QEAgc3RhdGljIGludCB2bXhfaW5pdF92bWNzX2NvbmZpZyh2b2lkKQogICAgICB7CiAgICAgICAg
ICByZG1zcmwoTVNSX0lBMzJfVk1YX0VQVF9WUElEX0NBUCwgX3ZteF9lcHRfdnBpZF9jYXApOwoK
KyAgICAgICAgaWYgKCAvKiBXb3JrIGFyb3VuZCBFcnJhdHVtIEFWUjQxIG9uIEF2b3RvbiBwcm9j
ZXNzb3JzLiAqLworICAgICAgICAgICAgIGJvb3RfY3B1X2RhdGEueDg2ID09IDYgJiYgYm9vdF9j
cHVfZGF0YS54ODZfbW9kZWwgPT0gMHg0ZCAmJgorICAgICAgICAgICAgIG9wdF9lcHRfYWQgPCAw
ICkKKyAgICAgICAgICAgIG9wdF9lcHRfYWQgPSAwOwogICAgICAgICAgaWYgKCAhb3B0X2VwdF9h
ZCApCiAgICAgICAgICAgICAgX3ZteF9lcHRfdnBpZF9jYXAgJj0gflZNWF9FUFRfQURfQklUOwot
ICAgICAgICBlbHNlIGlmICggLyogV29yayBhcm91bmQgRXJyYXR1bSBBVlI0MSBvbiBBdm90b24g
cHJvY2Vzc29ycy4gKi8KLSAgICAgICAgICAgICAgICAgIGJvb3RfY3B1X2RhdGEueDg2ID09IDYg
JiYgYm9vdF9jcHVfZGF0YS54ODZfbW9kZWwgPT0gCjB4NGQgJiYKLSAgICAgICAgICAgICAgICAg
IG9wdF9lcHRfYWQgPCAwICkKLSAgICAgICAgICAgIF92bXhfZXB0X3ZwaWRfY2FwICY9IH5WTVhf
RVBUX0FEX0JJVDsKCiAgICAgICAgICAvKgogICAgICAgICAgICogQWRkaXRpb25hbCBzYW5pdHkg
Y2hlY2tpbmcgYmVmb3JlIHVzaW5nIEVQVDoKCkp1ZXJnZW4KCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRl
dmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFp
bG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
