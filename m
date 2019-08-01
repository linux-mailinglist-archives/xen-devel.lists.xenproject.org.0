Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F2AC17DD24
	for <lists+xen-devel@lfdr.de>; Thu,  1 Aug 2019 16:01:26 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1htBbI-0002B2-Uf; Thu, 01 Aug 2019 13:58:36 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=qeGT=V5=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1htBbH-0002As-FT
 for xen-devel@lists.xenproject.org; Thu, 01 Aug 2019 13:58:35 +0000
X-Inumbo-ID: 724bbd9e-b464-11e9-bc37-f7db2a609a44
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 724bbd9e-b464-11e9-bc37-f7db2a609a44;
 Thu, 01 Aug 2019 13:58:31 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8BE30337;
 Thu,  1 Aug 2019 06:58:31 -0700 (PDT)
Received: from [10.1.196.50] (e108454-lin.cambridge.arm.com [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D54F93F71F;
 Thu,  1 Aug 2019 06:58:30 -0700 (PDT)
From: Julien Grall <julien.grall@arm.com>
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Viktor Mitin <viktor.mitin.19@gmail.com>
References: <20190801120452.6814-1-viktor.mitin.19@gmail.com>
 <20190801120452.6814-3-viktor.mitin.19@gmail.com> <87zhktgfml.fsf@epam.com>
 <ffa8c4f2-8b49-b32a-8f4f-8931dead0c80@arm.com>
Message-ID: <43ea6ddd-5f48-865d-c25d-6d0b13845275@arm.com>
Date: Thu, 1 Aug 2019 14:58:29 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <ffa8c4f2-8b49-b32a-8f4f-8931dead0c80@arm.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v5 2/2] xen/arm: consolidate make_timer_node
 and make_timer_domU_node
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Viktor Mitin <Viktor_Mitin@epam.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

CgpPbiAwMS8wOC8yMDE5IDE0OjU3LCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4gSGksCj4gCj4gT24g
MDEvMDgvMjAxOSAxNDo0OSwgVm9sb2R5bXlyIEJhYmNodWsgd3JvdGU6Cj4+Cj4+IFZpa3RvciBN
aXRpbiB3cml0ZXM6Cj4+Cj4+PiBGdW5jdGlvbnMgbWFrZV90aW1lcl9ub2RlIGFuZCBtYWtlX3Rp
bWVyX2RvbVVfbm9kZSBhcmUgcXVpdGUgc2ltaWxhci4KPj4+IFNvIGl0IGlzIGJldHRlciB0byBj
b25zb2xpZGF0ZSB0aGVtIHRvIGF2b2lkIGRpc2NyZXBhbmN5Lgo+Pj4gVGhlIG1haW4gZGlmZmVy
ZW5jZSBiZXR3ZWVuIHRoZSBmdW5jdGlvbnMgaXMgdGhlIHRpbWVyIGludGVycnVwdHMgdXNlZC4K
Pj4+Cj4+PiBLZWVwIHRoZSBkb21VIHZlcnNpb24gZm9yIHRoZSBjb21wYXRpYmxlIGFzIGl0IGlz
IHNpbXBsZXIuCj4+PiBNZWFuIGRvIG5vdCBjb3B5IHBsYXRmb3JtJ3MgJ2NvbXBhdGlibGUnIHBy
b3BlcnR5IGludG8gaHdkb20KPj4+IGRldmljZSB0cmVlLCBpbnN0ZWFkIHNldCBlaXRoZXIgYXJt
LGFybXY3LXRpbWVyIG9yIGFybSxhcm12OC10aW1lciwKPj4+IGRlcGVuZGluZyBvbiB0aGUgcGxh
dGZvcm0gdHlwZS4KPj4gSXQgaXMgaGFyZCB0byBwYXJzZSB0aGUgbGFzdCBzZW50ZW5jZS4gV2hh
dCBhYm91dCAiS2VlcCB0aGUgZG9tVSB2ZXJzaW9uCj4+IGZvciB0aGUgY29tcGF0aWJsZSBhcyBp
dCBpcyBzaW1wbGVyOiBkbyBub3QgY29weSBwbGF0Zm9ybSdzCj4+ICdjb21wYXRpYmxlJyBwcm9w
ZXJ0eSBpbnRvIGh3ZG9tIGRldmljZSB0cmVlLCBpbnN0ZWFkIHNldCBlaXRoZXIKPj4gYXJtLGFy
bXY3LXRpbWVyIG9yIGFybSxhcm12OC10aW1lciwgZGVwZW5kaW5nIG9uIHRoZSBwbGF0Zm9ybSB0
eXBlLiIgPwo+Pgo+Pgo+Pj4gS2VlcCB0aGUgaHcgdmVyc2lvbiBmb3IgdGhlIGNsb2NrIGFzIGl0
IGlzIHJlbGV2YW50IGZvciB0aGUgYm90aCBjYXNlcy4KPj4+Cj4+PiBUaGUgbmV3IGZ1bmN0aW9u
IGhhcyBjaGFuZ2VkIHByb3RvdHlwZSBkdWUgdG8gZmR0X3Byb3BlcnR5X2ludGVycnVwdHMKPj4+
IMKgwqAgbWFrZV90aW1lcl9ub2RlKGNvbnN0IHN0cnVjdCBrZXJuZWxfaW5mbyAqa2luZm8pCj4+
Pgo+Pj4gU3VnZ2VzdGVkLWJ5OiBKdWxpZW4gR3JhbGwgPGp1bGllbi5ncmFsbEBhcm0uY29tPgo+
Pj4gU2lnbmVkLW9mZi1ieTogVmlrdG9yIE1pdGluIDx2aWt0b3JfbWl0aW5AZXBhbS5jb20+Cj4+
PiAtLS0KPj4+IHY0IHVwZGF0ZXM6Cj4+PiDCoMKgwqAgdXBkYXRlZCAiS2VlcCB0aGUgZG9tVSB2
ZXJzaW9uIGZvciB0aGUgY29tcGF0aWJsZSBhcyBpdCBpcyBzaW1wbGVyIgo+Pj4KPj4+IHY1IHVw
ZGF0ZXM6Cj4+PiDCoMKgwqDCoCAtIGNoYW5nZWQgJ2tlcHQnIHRvICdrZWVwJywgZXRjLgo+Pj4g
wqDCoMKgwqAgLSByZW1vdmVkIGVtcHR5IGxpbmUKPj4+IMKgwqDCoMKgIC0gdXBkYXRlZCBpbmRl
bnRhdGlvbiBvZiBwYXJhbWV0ZXJzIGluIGZ1bmN0aW9ucyBjYWxscwo+Pj4gwqDCoMKgwqAgLSBm
aXhlZCBOSVRzCj4+PiDCoMKgwqDCoCAtIHVwZGF0ZWQgY29tbWl0IG1lc3NhZ2UKPj4+IC0tLQo+
Pj4gwqAgeGVuL2FyY2gvYXJtL2RvbWFpbl9idWlsZC5jIHwgMTA2ICsrKysrKysrKysrKystLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLQo+Pj4gwqAgMSBmaWxlIGNoYW5nZWQsIDM5IGluc2VydGlvbnMo
KyksIDY3IGRlbGV0aW9ucygtKQo+Pj4KPj4+IGRpZmYgLS1naXQgYS94ZW4vYXJjaC9hcm0vZG9t
YWluX2J1aWxkLmMgYi94ZW4vYXJjaC9hcm0vZG9tYWluX2J1aWxkLmMKPj4+IGluZGV4IGJjN2Qx
N2RkMmMuLjU4NTQyMTMwY2EgMTAwNjQ0Cj4+PiAtLS0gYS94ZW4vYXJjaC9hcm0vZG9tYWluX2J1
aWxkLmMKPj4+ICsrKyBiL3hlbi9hcmNoL2FybS9kb21haW5fYnVpbGQuYwo+Pj4gQEAgLTk3Mywx
MCArOTczLDggQEAgc3RhdGljIGludCBfX2luaXQgbWFrZV90aW1lcl9ub2RlKGNvbnN0IHN0cnVj
dCAKPj4+IGtlcm5lbF9pbmZvICpraW5mbykKPj4+IMKgwqDCoMKgwqDCoMKgwqDCoCB7IC8qIHNl
bnRpbmVsICovIH0sCj4+PiDCoMKgwqDCoMKgIH07Cj4+PiDCoMKgwqDCoMKgIHN0cnVjdCBkdF9k
ZXZpY2Vfbm9kZSAqZGV2Owo+Pj4gLcKgwqDCoCB1MzIgbGVuOwo+Pj4gLcKgwqDCoCBjb25zdCB2
b2lkICpjb21wYXRpYmxlOwo+Pj4gwqDCoMKgwqDCoCBpbnQgcmVzOwo+Pj4gLcKgwqDCoCB1bnNp
Z25lZCBpbnQgaXJxOwo+Pj4gK8KgwqDCoCB1bnNpZ25lZCBpbnQgaXJxW01BWF9USU1FUl9QUEld
Owo+PiBBcyBJIHNhaWQgaW4gdGhlIHByZXZpb3VzIHZlcnNpb24sIHlvdSBhcmUgd2FzdGluZyBz
dGFjayBzcGFjZQo+PiB0aGVyZS4gQWxzbywgdGhpcyBpcyBtaXNsZWFkaW5nLiBXaGVuIEkgc2Vl
IGFycmF5IG9mIDQgaXRlbXMsIEkgZXhwZWN0Cj4+IHRoYXQgYWxsIDQgaXRlbXMgd2lsbCBiZSB1
c2VkLiBCdXQgeW91IGFyZSB1c2luZyBvbmx5IDMsIHNvIGl0IGxlYWRzIHRvCj4+IHR3byBjb25j
bHVzaW9uczogZWl0aGVyIHlvdSBtYWRlIGEgbWlzdGFrZSwgb3IgSSBkb24ndCB1bmRlcnN0YW5k
IHdoYXQKPj4gaXQgaGFwcGVuaW5nLiBFaXRoZXIgb3B0aW9uIGlzIGJhZC4KPiAKPiA0IGJ5dGUg
b24gYSBzdGFjayBvZiAxNktCLi4uIHRoYXQncyBub3QgcmVhbGx5IGEgd2FzdGUgd29ydGggYW4g
YXJndW1lbnQuIFRoZSAKPiBtb3JlIHRoZSBzdGFjayBpcyBwcmV0dHkgZW1wdHkgYXMgdGhpcyBp
cyBib290LiBTbyB5ZXMsIHlvdSB3aWxsIG5vdCB1c2UgdGhlIAo+IGxhc3QgaW5kZXggYmVjYXVz
ZSB5b3UgZG9uJ3QgZXhwb3NlIGh5cGVydmlzb3IgdGltZXIgdG8gZ3Vlc3QgeWV0ISAoSW1hZ2lu
ZSAKPiBuZXN0ZWQgdmlydCkuIEJ1dCBhdCBsZWFzdCBpdCBhdm9pZHMgaGFyZGNvZGluZyBhIG51
bWJlciBvZiBpbmRleCBhbmQgbWF0Y2ggdGhlIAo+IGVudW0uCgpJIGZvcmdvdCB0byBtZW50aW9u
LiBAVmlrdG9yLCBpdCBpcyBnb29kIHRvIHRyeSB0byByZXBseSB0byBlYWNoIGNvbW1lbnQgYXQg
CmxlYXN0IHRob3NlIHlvdSBkb24ndCBwbGFuIHRvIGFkZHJlc3MuIFNvIHRoZSByZXZpZXdlciBk
b2Vzbid0IGhhdmUgdGhlIGZlZWxpbmcgCmNvbW1lbnRzIGFyZSBpZ25vcmVkLi4uCgpDaGVlcnMs
CgotLSAKSnVsaWVuIEdyYWxsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVu
LWRldmVs
