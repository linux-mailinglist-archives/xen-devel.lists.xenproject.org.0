Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CFBC417B942
	for <lists+xen-devel@lfdr.de>; Fri,  6 Mar 2020 10:30:29 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jA9Gi-000436-H9; Fri, 06 Mar 2020 09:27:44 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=D+BG=4X=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1jA9Gh-000431-5I
 for xen-devel@lists.xenproject.org; Fri, 06 Mar 2020 09:27:43 +0000
X-Inumbo-ID: ba8f5272-5f8c-11ea-a77d-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ba8f5272-5f8c-11ea-a77d-12813bfff9fa;
 Fri, 06 Mar 2020 09:27:42 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 4CC8FB1B4;
 Fri,  6 Mar 2020 09:27:41 +0000 (UTC)
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
 <9d239e78-49bd-43be-1096-8cdfa7a29e5a@suse.com>
 <a593f09f-1e79-8b87-7399-0c03161a5ad6@suse.com>
 <0b6e7f36-786c-f788-0c13-7e0ed41d77df@suse.com>
 <ca0ee3e7-bd09-bdeb-da6a-f4acaa96f27a@suse.com>
 <01015fd9-61bf-99a9-8e83-a87ddf4ed6b4@suse.com>
 <699d89f4-c18d-c49a-ed6f-deeaf9fe8caf@suse.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <dc331f28-7b37-8f34-2088-bba17cad06ce@suse.com>
Date: Fri, 6 Mar 2020 10:27:39 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <699d89f4-c18d-c49a-ed6f-deeaf9fe8caf@suse.com>
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

T24gMDYuMDMuMjAgMTA6MjIsIEphbiBCZXVsaWNoIHdyb3RlOgo+IE9uIDA2LjAzLjIwMjAgMTA6
MjAsIErDvHJnZW4gR3Jvw58gd3JvdGU6Cj4+IE9uIDA2LjAzLjIwIDEwOjA0LCBKYW4gQmV1bGlj
aCB3cm90ZToKPj4+IE9uIDA2LjAzLjIwMjAgMDk6NDcsIErDvHJnZW4gR3Jvw58gd3JvdGU6Cj4+
Pj4gT24gMDYuMDMuMjAgMDk6MjAsIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+PiBPbiAwNi4wMy4y
MDIwIDA3OjQyLCBKw7xyZ2VuIEdyb8OfIHdyb3RlOgo+Pj4+Pj4gT24gMDUuMDMuMjAgMDk6MjYs
IEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+Pj4+IE9uIDA1LjAzLjIwMjAgMDc6MDEsIErDvHJnZW4g
R3Jvw58gd3JvdGU6Cj4+Pj4+Pj4+IE9uIDA0LjAzLjIwIDE3OjU2LCBKYW4gQmV1bGljaCB3cm90
ZToKPj4+Pj4+Pj4+IE9uIDA0LjAzLjIwMjAgMTc6MzEsIErDvHJnZW4gR3Jvw58gd3JvdGU6Cj4+
Pj4+Pj4+Pj4gT24gMDQuMDMuMjAgMTY6MTksIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+Pj4+Pj4+
PiBPbiAwNC4wMy4yMDIwIDE2OjA3LCBKw7xyZ2VuIEdyb8OfIHdyb3RlOgo+Pj4+Pj4+Pj4+Pj4g
T24gMDQuMDMuMjAgMTI6MzIsIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+Pj4+Pj4+Pj4+IE9uIDI2
LjAyLjIwMjAgMTM6NDcsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6Cj4+Pj4+Pj4+Pj4+Pj4+ICtzdGF0
aWMgdm9pZCB1cGRhdGVfZXB0X3BhcmFtX2FwcGVuZChjb25zdCBjaGFyICpzdHIsIGludCB2YWwp
Cj4+Pj4+Pj4+Pj4+Pj4+ICt7Cj4+Pj4+Pj4+Pj4+Pj4+ICsgICAgY2hhciAqcG9zID0gb3B0X2Vw
dF9zZXR0aW5nICsgc3RybGVuKG9wdF9lcHRfc2V0dGluZyk7Cj4+Pj4+Pj4+Pj4+Pj4+ICsKPj4+
Pj4+Pj4+Pj4+Pj4gKyAgICBzbnByaW50Zihwb3MsIHNpemVvZihvcHRfZXB0X3NldHRpbmcpIC0g
KHBvcyAtIG9wdF9lcHRfc2V0dGluZyksCj4+Pj4+Pj4+Pj4+Pj4+ICsgICAgICAgICAgICAgIiwl
cz0lZCIsIHN0ciwgdmFsKTsKPj4+Pj4+Pj4+Pj4+Pj4gK30KPj4+Pj4+Pj4+Pj4+Pj4gKwo+Pj4+
Pj4+Pj4+Pj4+PiArc3RhdGljIHZvaWQgdXBkYXRlX2VwdF9wYXJhbSh2b2lkKQo+Pj4+Pj4+Pj4+
Pj4+PiArewo+Pj4+Pj4+Pj4+Pj4+PiArICAgIHNucHJpbnRmKG9wdF9lcHRfc2V0dGluZywgc2l6
ZW9mKG9wdF9lcHRfc2V0dGluZyksICJwbWw9JWQiLCBvcHRfZXB0X3BtbCk7Cj4+Pj4+Pj4+Pj4+
Pj4+ICsgICAgaWYgKCBvcHRfZXB0X2FkID49IDAgKQo+Pj4+Pj4+Pj4+Pj4+PiArICAgICAgICB1
cGRhdGVfZXB0X3BhcmFtX2FwcGVuZCgiYWQiLCBvcHRfZXB0X2FkKTsKPj4+Pj4+Pj4+Pj4+Pgo+
Pj4+Pj4+Pj4+Pj4+IFRoaXMgd29uJ3QgY29ycmVjdGx5IHJlZmxlY3QgcmVhbGl0eTogSWYgeW91
IGxvb2sgYXQKPj4+Pj4+Pj4+Pj4+PiB2bXhfaW5pdF92bWNzX2NvbmZpZygpLCBldmVuIGEgbmVn
YXRpdmUgdmFsdWUgbWVhbnMgInRydWUiIGhlcmUsCj4+Pj4+Pj4+Pj4+Pj4gdW5sZXNzIG9uIGEg
c3BlY2lmaWMgQXRvbSBtb2RlbC4gSSB0aGluayBpbml0X2VwdF9wYXJhbSgpIHdhbnRzCj4+Pj4+
Pj4+Pj4+Pj4gdG8gaGF2ZSB0aGF0IGVycmF0dW0gd29ya2Fyb3VuZCBsb2dpYyBtb3ZlZCB0aGVy
ZSwgc3VjaCB0aGF0Cj4+Pj4+Pj4+Pj4+Pj4geW91IGNhbiB0aGVuIGFzc21lIHRoZSB2YWx1ZSB0
byBiZSBub24tbmVnYXRpdmUgaGVyZS4KPj4+Pj4+Pj4+Pj4+Cj4+Pj4+Pj4+Pj4+PiBCdXQgaXNu
J3Qgbm90IG1lbnRpb25pbmcgaXQgaW4gdGhlIC0xIGNhc2UgY29ycmVjdD8gLTEgbWVhbnM6IGRv
IHRoZQo+Pj4+Pj4+Pj4+Pj4gY29ycmVjdCB0aGluZyBvbiB0aGUgY3VycmVudCBoYXJkd2FyZS4K
Pj4+Pj4+Pj4+Pj4KPj4+Pj4+Pj4+Pj4gV2VsbCwgSSB0aGluayB0aGUgb3V0cHV0IGhlcmUgc2hv
dWxkIHJlcHJlc2VudCBlZmZlY3RpdmUgc2V0dGluZ3MsCj4+Pj4+Pj4+Pj4KPj4+Pj4+Pj4+PiBU
aGUgbWluaW11bSByZXF1aXJlbWVudCBpcyB0byByZWZsZWN0IHRoZSBlZmZlY3RpdmUgcGFyYW1l
dGVycywgbGlrZQo+Pj4+Pj4+Pj4+IGNtZGxpbmUgaXMgZG9pbmcgZm9yIGJvb3QtdGltZSBvbmx5
IHBhcmFtZXRlcnMuIFdpdGggcnVudGltZSBwYXJhbWV0ZXJzCj4+Pj4+Pj4+Pj4gd2UgaGFkIG5v
IHdheSBvZiB0ZWxsaW5nIHdoYXQgd2FzIHNldCwgYW5kIHRoaXMgaXMgbm93IHBvc3NpYmxlLgo+
Pj4+Pj4+Pj4+Cj4+Pj4+Pj4+Pj4+IGFuZCBhIHN1Yi1pdGVtIHNob3VsZCBiZSBzdXBwcmVzc2Vk
IG9ubHkgaWYgYSBzZXR0aW5nIGhhcyBubyBlZmZlY3QKPj4+Pj4+Pj4+Pj4gYXQgYWxsIGluIHRo
ZSBjdXJyZW50IHNldHVwLCBsaWtlIC4uLgo+Pj4+Pj4+Pj4+Pgo+Pj4+Pj4+Pj4+Pj4+PiArICAg
IGlmICggb3B0X2VwdF9leGVjX3NwID49IDAgKQo+Pj4+Pj4+Pj4+Pj4+PiArICAgICAgICB1cGRh
dGVfZXB0X3BhcmFtX2FwcGVuZCgiZXhlYy1zcCIsIG9wdF9lcHRfZXhlY19zcCk7Cj4+Pj4+Pj4+
Pj4+Pj4KPj4+Pj4+Pj4+Pj4+PiBJIGFncmVlIGZvciB0aGlzIG9uZSAtIGlmIHRoZSB2YWx1ZSBp
cyBzdGlsbCAtMSwgaXQgaGFzIG5laXRoZXIKPj4+Pj4+Pj4+Pj4+PiBiZWVuIHNldCBub3IgaXMg
aXRzIHZhbHVlIG9mIGFueSBpbnRlcmVzdC4KPj4+Pj4+Pj4+Pj4KPj4+Pj4+Pj4+Pj4gLi4uIGhl
cmUuCj4+Pj4+Pj4+Pj4KPj4+Pj4+Pj4+PiBJIHRoaW5rIHdlIHNob3VsZCBub3QgbWl4IHVwIHNw
ZWNpZmllZCBwYXJhbWV0ZXJzIGFuZCBlZmZlY3RpdmUKPj4+Pj4+Pj4+PiBzZXR0aW5ncy4gSW4g
Y2FzZSBhbiBlZmZlY3RpdmUgc2V0dGluZyBpcyBvZiBjb21tb24gaW50ZXJlc3QgaXQgc2hvdWxk
Cj4+Pj4+Pj4+Pj4gYmUgcmVwb3J0ZWQgdmlhIGEgc3BlY2lmaWMgbm9kZSAobGlrZSBlLmcuIHNw
ZWNpZmljIG1pdGlnYXRpb24gc2V0dGluZ3MKPj4+Pj4+Pj4+PiB3aGVyZSB0aGUgY21kbGluZSBp
cyBub3QgcHJvdmlkaW5nIGVub3VnaCBkZXRhaWxzKS4KPj4+Pj4+Pj4+Cj4+Pj4+Pj4+PiBCdXQg
dGhlbiBhIGJvb2xlYW4gb3B0aW9uIHRoYXQgd2Fzbid0IHNwZWNpZmllZCBvbiB0aGUgY29tbWFu
ZCBsaW5lCj4+Pj4+Pj4+PiBzaG91bGQgcHJvZHVjZSBubyBvdXRwdXQgYXQgYWxsLiBBbmQgaGVu
Y2Ugd2UnZCBuZWVkIGEgd2F5IHRvIHRlbGwKPj4+Pj4+Pj4+IHdoZXRoZXIgYW4gb3B0aW9uIHdh
cyBzZXQgZnJvbSBjb21tYW5kIGxpbmUgZm9yIF9hbGxfIG9mIHRoZW0uIEkKPj4+Pj4+Pj4+IGRv
bid0IHRoaW5rIHRoaXMgd291bGQgYmUgdmVyeSBoZWxwZnVsLgo+Pj4+Pj4+Pgo+Pj4+Pj4+PiBJ
IGRpc2FncmVlIGhlcmUuCj4+Pj4+Pj4+Cj4+Pj4+Pj4+IFRoaXMgaXMgaW1wb3J0YW50IG9ubHkg
Zm9yIGNhc2VzIHdoZXJlIHRoZSBoeXBlcnZpc29yIHRyZWF0cyB0aGUKPj4+Pj4+Pj4gcGFyYW1l
dGVyIGFzIGEgdHJpc3RhdGU6IHRydWUvZmFsc2UvdW5zcGVjaWZpZWQuIEluIGFsbCBjYXNlcyB3
aGVyZQo+Pj4+Pj4+PiB0aGUgYm9vbCB2YWx1ZSBpcyByZWFsbHkgdHJ1ZSBvciBmYWxzZSBpdCBj
YW4gYmUgcmVwb3J0ZWQgYXMgc3VjaC4KPj4+Pj4+Pgo+Pj4+Pj4+IFRoZSBwcm9ibGVtIEknbSBo
YXZpbmcgd2l0aCB0aGlzIGlzIHRoZSByZXN1bHRpbmcgaW5jb25zaXN0ZW5jeToKPj4+Pj4+PiBX
aGVuIHdlIHdyaXRlIHRoZSB2YXJpYWJsZSB3aXRoIDAgb3IgMSBpbiBjYXNlIHdlIGZpbmQgaXQg
dG8gYmUKPj4+Pj4+PiAtMSBhZnRlciBjb21tYW5kIGxpbmUgcGFyc2luZywgdGhlIGV4dGVybmFs
bHkgdmlzaWJsZSBlZmZlY3Qgd2lsbAo+Pj4+Pj4+IGJlIGRpZmZlcmVudCBmcm9tIHRoZSBjYXNl
IHdoZXJlIHdlIGxlYXZlIGl0IHRvIGJlIC0xIHlldCBzdGlsbAo+Pj4+Pj4+IHRyZWF0IGl0IGFz
IChwc2V1ZG8tKWJvb2xlYW4uIFRoaXMsIGhvd2V2ZXIsIGlzIGFuIGltcGxlbWVudGF0aW9uCj4+
Pj4+Pj4gZGV0YWlsLCB3aGlsZSBpbW8gdGhlIGh5cGZzIHByZXNlbnRhdGlvbiBzaG91bGQgbm90
IGRlcGVuZCBvbgo+Pj4+Pj4+IHN1Y2ggaW1wbGVtZW50YXRpb24gZGV0YWlscy4KPj4+Pj4+Pgo+
Pj4+Pj4+PiBSZXBvcnRpbmcgMC8xIGZvciBlLmcuICJhZCIgaWYgb3B0X2VwdF9hZD09LTEgd291
bGQgYWRkIGEgbGF0ZW50IHByb2JsZW0KPj4+Pj4+Pj4gaWYgYW55IG90aGVyIGFjdGlvbiB3b3Vs
ZCBiZSBkZXJpdmVkIGZyb20gdGhlIHBhcmFtZXRlciB2YXJpYWJsZSBiZWluZwo+Pj4+Pj4+PiAt
MS4KPj4+Pj4+Pj4KPj4+Pj4+Pj4gU28gZWl0aGVyIG9wdF9lcHRfYWQgc2hvdWxkIGJlIG1vZGlm
aWVkIHRvIGNoYW5nZSBpdCB0byAwLzEgaW5zdGVhZCBvZgo+Pj4+Pj4+PiBvbmx5IHNldHRpbmcg
dGhlIFZDTVMgZmxhZywKPj4+Pj4+Pgo+Pj4+Pj4+IFRoYXQncyB3aGF0IEkgZGlkIHN1Z2dlc3Qu
Cj4+Pj4+Pj4KPj4+Pj4+Pj4gb3IgdGhlIGxvZ2ljIHNob3VsZCBiZSBrZXB0IGFzIGlzIGluIHRo
aXMKPj4+Pj4+Pj4gcGF0Y2guIElNTyBjaGFuZ2luZyB0aGUgc2V0dGluZyBvZiBvcHRfZXB0X2Fk
IHNob3VsZCBiZSBkb25lIGluIGFub3RoZXIKPj4+Pj4+Pj4gcGF0Y2ggaWYgdGhpcyBpcyByZWFs
bHkgd2FudGVkLgo+Pj4+Pj4+Cj4+Pj4+Pj4gQW5kIG9mIGNvdXJzZSBJIGRvbid0IG1pbmQgYXQg
YWxsIGRvaW5nIHNvIGluIGEgcHJlcmVxIHBhdGNoLgo+Pj4+Pj4+IEl0J3MganVzdCB0aGF0IHRo
ZSBwYXRjaCBoZXJlIHByb3ZpZGVzIGEgZ29vZCBwbGFjZSBfd2hlcmVfIHRvCj4+Pj4+Pj4gYWN0
dWFsbHkgZG8gc3VjaCBhbiBhZGp1c3RtZW50Lgo+Pj4+Pj4KPj4+Pj4+IEkgd2FzIHRoaW5raW5n
IG9mIHNvbWV0aGluZyBsaWtlIHRoaXM6Cj4+Pj4+Pgo+Pj4+Pj4gLS0tIGEveGVuL2FyY2gveDg2
L2h2bS92bXgvdm1jcy5jCj4+Pj4+PiArKysgYi94ZW4vYXJjaC94ODYvaHZtL3ZteC92bWNzLmMK
Pj4+Pj4+IEBAIC0zMTMsMTIgKzMxMywxMiBAQCBzdGF0aWMgaW50IHZteF9pbml0X3ZtY3NfY29u
ZmlnKHZvaWQpCj4+Pj4+PiAgICAgICAgICB7Cj4+Pj4+PiAgICAgICAgICAgICAgcmRtc3JsKE1T
Ul9JQTMyX1ZNWF9FUFRfVlBJRF9DQVAsIF92bXhfZXB0X3ZwaWRfY2FwKTsKPj4+Pj4+Cj4+Pj4+
PiArICAgICAgICBpZiAoIC8qIFdvcmsgYXJvdW5kIEVycmF0dW0gQVZSNDEgb24gQXZvdG9uIHBy
b2Nlc3NvcnMuICovCj4+Pj4+PiArICAgICAgICAgICAgIGJvb3RfY3B1X2RhdGEueDg2ID09IDYg
JiYgYm9vdF9jcHVfZGF0YS54ODZfbW9kZWwgPT0gMHg0ZCAmJgo+Pj4+Pj4gKyAgICAgICAgICAg
ICBvcHRfZXB0X2FkIDwgMCApCj4+Pj4+PiArICAgICAgICAgICAgb3B0X2VwdF9hZCA9IDA7Cj4+
Pj4+PiAgICAgICAgICAgICAgaWYgKCAhb3B0X2VwdF9hZCApCj4+Pj4+PiAgICAgICAgICAgICAg
ICAgIF92bXhfZXB0X3ZwaWRfY2FwICY9IH5WTVhfRVBUX0FEX0JJVDsKPj4+Pj4+IC0gICAgICAg
IGVsc2UgaWYgKCAvKiBXb3JrIGFyb3VuZCBFcnJhdHVtIEFWUjQxIG9uIEF2b3RvbiBwcm9jZXNz
b3JzLiAqLwo+Pj4+Pj4gLSAgICAgICAgICAgICAgICAgIGJvb3RfY3B1X2RhdGEueDg2ID09IDYg
JiYgYm9vdF9jcHVfZGF0YS54ODZfbW9kZWwgPT0gMHg0ZCAmJgo+Pj4+Pj4gLSAgICAgICAgICAg
ICAgICAgIG9wdF9lcHRfYWQgPCAwICkKPj4+Pj4+IC0gICAgICAgICAgICBfdm14X2VwdF92cGlk
X2NhcCAmPSB+Vk1YX0VQVF9BRF9CSVQ7Cj4+Pj4+Pgo+Pj4+Pj4gICAgICAgICAgICAgIC8qCj4+
Pj4+PiAgICAgICAgICAgICAgICogQWRkaXRpb25hbCBzYW5pdHkgY2hlY2tpbmcgYmVmb3JlIHVz
aW5nIEVQVDoKPj4+Pj4KPj4+Pj4gQW5kIEkgd2FzIHNwZWNpZmljYWxseSBob3BpbmcgdG8gYXZv
aWQgZG9pbmcgdGhpcyBpbiBhIG5vbi1fX2luaXQKPj4+Pj4gZnVuY3Rpb24uCj4+Pj4KPj4+PiBT
aG91bGQgYmUgZmFpcmx5IGVhc3kgKHNlZSBhdHRhY2hlZCBwYXRjaCkuCj4+Pgo+Pj4gV2h5IG5v
dCBwdXQgdGhlIG9wdF9lcHRfYWQgYWRqdXN0bWVudCByaWdodCBpbnRvIHN0YXJ0X3ZteCgpLAo+
Pj4ganVzdCBsaWtlIGUuZy4gdGhlIG9wdF9lcHRfZXhlY19zcCBnZXRzIGFsc28gZG9uZSB0aGVy
ZT8gUHVsbGluZwo+Pj4gdGhlIHNldHRpbmcgdXAgb2YgdGhlICd2JyBrZXkgaGFuZGxlciByaXNr
cyBpbnN0YWxsaW5nIGl0IGFoZWFkCj4+PiBvZiBhIHBvdGVudGlhbCBmdXR1cmUgbGF0ZXIgZXJy
b3IgZXhpdCBmcm9tIHN0YXJ0X3ZteCgpLiBCdXQgSSdtCj4+Cj4+IElzIHRoaXMgcmVhbGx5IHBy
b2JsZW1hdGljPwo+IAo+IE5vdCBfcmVhbGx5XywgYnV0IHN0aWxsLiBJbiBwYXJ0aWN1bGFyIEkn
ZCBwcmVmZXIgdGhlICd2JyBrZXkgdG8KPiBub3QgZXZlbiBiZSBsaXN0ZWQgYW1vbmcgJ2gnIGtl
eSBvdXRwdXQgaW4gc3VjaCBhIGNhc2UuCgpOb3cgdGhpcyBpcyBhbiBvcHRpbWl6YXRpb24gZm9y
IGEgc3VwcG9zZWRseSBuZXZlciB0byBoYXBwZW4gZXJyb3IKY2FzZSBvbmx5IHRoZW9yZXRpY2Fs
bHkgcG9zc2libGUgd2l0aCBmdXR1cmUgY29kZSBhZGRpdGlvbnMuCgpJbiBvcmRlciB0byBwcmVw
YXJlIGZvciB0aGlzIGNhc2UgSSBkb24ndCB0aGluayB3ZSBzaG91bGQgZXhwb3J0Cm9wdF9lcHRf
YWQgYW5kIHB1dCB0aGUgc2V0dGluZyBvZiBpdCBhdCB0aGUgdmVyeSBmaXJzdCB0aGluZyB0byBk
bwppbiBzdGFydF92bXgoKS4KCgpKdWVyZ2VuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVs
