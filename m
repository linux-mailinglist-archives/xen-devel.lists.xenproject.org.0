Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1008F7DD25
	for <lists+xen-devel@lfdr.de>; Thu,  1 Aug 2019 16:01:29 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1htBaG-00027Z-Il; Thu, 01 Aug 2019 13:57:32 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=qeGT=V5=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1htBaF-00027U-9s
 for xen-devel@lists.xenproject.org; Thu, 01 Aug 2019 13:57:31 +0000
X-Inumbo-ID: 4b13a3d6-b464-11e9-a7c1-d7ff3b991419
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 4b13a3d6-b464-11e9-a7c1-d7ff3b991419;
 Thu, 01 Aug 2019 13:57:26 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A72D2337;
 Thu,  1 Aug 2019 06:57:25 -0700 (PDT)
Received: from [10.1.196.50] (e108454-lin.cambridge.arm.com [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 010153F71F;
 Thu,  1 Aug 2019 06:57:24 -0700 (PDT)
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Viktor Mitin <viktor.mitin.19@gmail.com>
References: <20190801120452.6814-1-viktor.mitin.19@gmail.com>
 <20190801120452.6814-3-viktor.mitin.19@gmail.com> <87zhktgfml.fsf@epam.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <ffa8c4f2-8b49-b32a-8f4f-8931dead0c80@arm.com>
Date: Thu, 1 Aug 2019 14:57:23 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <87zhktgfml.fsf@epam.com>
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

SGksCgpPbiAwMS8wOC8yMDE5IDE0OjQ5LCBWb2xvZHlteXIgQmFiY2h1ayB3cm90ZToKPiAKPiBW
aWt0b3IgTWl0aW4gd3JpdGVzOgo+IAo+PiBGdW5jdGlvbnMgbWFrZV90aW1lcl9ub2RlIGFuZCBt
YWtlX3RpbWVyX2RvbVVfbm9kZSBhcmUgcXVpdGUgc2ltaWxhci4KPj4gU28gaXQgaXMgYmV0dGVy
IHRvIGNvbnNvbGlkYXRlIHRoZW0gdG8gYXZvaWQgZGlzY3JlcGFuY3kuCj4+IFRoZSBtYWluIGRp
ZmZlcmVuY2UgYmV0d2VlbiB0aGUgZnVuY3Rpb25zIGlzIHRoZSB0aW1lciBpbnRlcnJ1cHRzIHVz
ZWQuCj4+Cj4+IEtlZXAgdGhlIGRvbVUgdmVyc2lvbiBmb3IgdGhlIGNvbXBhdGlibGUgYXMgaXQg
aXMgc2ltcGxlci4KPj4gTWVhbiBkbyBub3QgY29weSBwbGF0Zm9ybSdzICdjb21wYXRpYmxlJyBw
cm9wZXJ0eSBpbnRvIGh3ZG9tCj4+IGRldmljZSB0cmVlLCBpbnN0ZWFkIHNldCBlaXRoZXIgYXJt
LGFybXY3LXRpbWVyIG9yIGFybSxhcm12OC10aW1lciwKPj4gZGVwZW5kaW5nIG9uIHRoZSBwbGF0
Zm9ybSB0eXBlLgo+IEl0IGlzIGhhcmQgdG8gcGFyc2UgdGhlIGxhc3Qgc2VudGVuY2UuIFdoYXQg
YWJvdXQgIktlZXAgdGhlIGRvbVUgdmVyc2lvbgo+IGZvciB0aGUgY29tcGF0aWJsZSBhcyBpdCBp
cyBzaW1wbGVyOiBkbyBub3QgY29weSBwbGF0Zm9ybSdzCj4gJ2NvbXBhdGlibGUnIHByb3BlcnR5
IGludG8gaHdkb20gZGV2aWNlIHRyZWUsIGluc3RlYWQgc2V0IGVpdGhlcgo+IGFybSxhcm12Ny10
aW1lciBvciBhcm0sYXJtdjgtdGltZXIsIGRlcGVuZGluZyBvbiB0aGUgcGxhdGZvcm0gdHlwZS4i
ID8KPiAKPiAKPj4gS2VlcCB0aGUgaHcgdmVyc2lvbiBmb3IgdGhlIGNsb2NrIGFzIGl0IGlzIHJl
bGV2YW50IGZvciB0aGUgYm90aCBjYXNlcy4KPj4KPj4gVGhlIG5ldyBmdW5jdGlvbiBoYXMgY2hh
bmdlZCBwcm90b3R5cGUgZHVlIHRvIGZkdF9wcm9wZXJ0eV9pbnRlcnJ1cHRzCj4+ICAgIG1ha2Vf
dGltZXJfbm9kZShjb25zdCBzdHJ1Y3Qga2VybmVsX2luZm8gKmtpbmZvKQo+Pgo+PiBTdWdnZXN0
ZWQtYnk6IEp1bGllbiBHcmFsbCA8anVsaWVuLmdyYWxsQGFybS5jb20+Cj4+IFNpZ25lZC1vZmYt
Ynk6IFZpa3RvciBNaXRpbiA8dmlrdG9yX21pdGluQGVwYW0uY29tPgo+PiAtLS0KPj4gdjQgdXBk
YXRlczoKPj4gICAgIHVwZGF0ZWQgIktlZXAgdGhlIGRvbVUgdmVyc2lvbiBmb3IgdGhlIGNvbXBh
dGlibGUgYXMgaXQgaXMgc2ltcGxlciIKPj4KPj4gdjUgdXBkYXRlczoKPj4gICAgICAtIGNoYW5n
ZWQgJ2tlcHQnIHRvICdrZWVwJywgZXRjLgo+PiAgICAgIC0gcmVtb3ZlZCBlbXB0eSBsaW5lCj4+
ICAgICAgLSB1cGRhdGVkIGluZGVudGF0aW9uIG9mIHBhcmFtZXRlcnMgaW4gZnVuY3Rpb25zIGNh
bGxzCj4+ICAgICAgLSBmaXhlZCBOSVRzCj4+ICAgICAgLSB1cGRhdGVkIGNvbW1pdCBtZXNzYWdl
Cj4+IC0tLQo+PiAgIHhlbi9hcmNoL2FybS9kb21haW5fYnVpbGQuYyB8IDEwNiArKysrKysrKysr
KysrLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KPj4gICAxIGZpbGUgY2hhbmdlZCwgMzkgaW5zZXJ0
aW9ucygrKSwgNjcgZGVsZXRpb25zKC0pCj4+Cj4+IGRpZmYgLS1naXQgYS94ZW4vYXJjaC9hcm0v
ZG9tYWluX2J1aWxkLmMgYi94ZW4vYXJjaC9hcm0vZG9tYWluX2J1aWxkLmMKPj4gaW5kZXggYmM3
ZDE3ZGQyYy4uNTg1NDIxMzBjYSAxMDA2NDQKPj4gLS0tIGEveGVuL2FyY2gvYXJtL2RvbWFpbl9i
dWlsZC5jCj4+ICsrKyBiL3hlbi9hcmNoL2FybS9kb21haW5fYnVpbGQuYwo+PiBAQCAtOTczLDEw
ICs5NzMsOCBAQCBzdGF0aWMgaW50IF9faW5pdCBtYWtlX3RpbWVyX25vZGUoY29uc3Qgc3RydWN0
IGtlcm5lbF9pbmZvICpraW5mbykKPj4gICAgICAgICAgIHsgLyogc2VudGluZWwgKi8gfSwKPj4g
ICAgICAgfTsKPj4gICAgICAgc3RydWN0IGR0X2RldmljZV9ub2RlICpkZXY7Cj4+IC0gICAgdTMy
IGxlbjsKPj4gLSAgICBjb25zdCB2b2lkICpjb21wYXRpYmxlOwo+PiAgICAgICBpbnQgcmVzOwo+
PiAtICAgIHVuc2lnbmVkIGludCBpcnE7Cj4+ICsgICAgdW5zaWduZWQgaW50IGlycVtNQVhfVElN
RVJfUFBJXTsKPiBBcyBJIHNhaWQgaW4gdGhlIHByZXZpb3VzIHZlcnNpb24sIHlvdSBhcmUgd2Fz
dGluZyBzdGFjayBzcGFjZQo+IHRoZXJlLiBBbHNvLCB0aGlzIGlzIG1pc2xlYWRpbmcuIFdoZW4g
SSBzZWUgYXJyYXkgb2YgNCBpdGVtcywgSSBleHBlY3QKPiB0aGF0IGFsbCA0IGl0ZW1zIHdpbGwg
YmUgdXNlZC4gQnV0IHlvdSBhcmUgdXNpbmcgb25seSAzLCBzbyBpdCBsZWFkcyB0bwo+IHR3byBj
b25jbHVzaW9uczogZWl0aGVyIHlvdSBtYWRlIGEgbWlzdGFrZSwgb3IgSSBkb24ndCB1bmRlcnN0
YW5kIHdoYXQKPiBpdCBoYXBwZW5pbmcuIEVpdGhlciBvcHRpb24gaXMgYmFkLgoKNCBieXRlIG9u
IGEgc3RhY2sgb2YgMTZLQi4uLiB0aGF0J3Mgbm90IHJlYWxseSBhIHdhc3RlIHdvcnRoIGFuIGFy
Z3VtZW50LiBUaGUgCm1vcmUgdGhlIHN0YWNrIGlzIHByZXR0eSBlbXB0eSBhcyB0aGlzIGlzIGJv
b3QuIFNvIHllcywgeW91IHdpbGwgbm90IHVzZSB0aGUgCmxhc3QgaW5kZXggYmVjYXVzZSB5b3Ug
ZG9uJ3QgZXhwb3NlIGh5cGVydmlzb3IgdGltZXIgdG8gZ3Vlc3QgeWV0ISAoSW1hZ2luZSAKbmVz
dGVkIHZpcnQpLiBCdXQgYXQgbGVhc3QgaXQgYXZvaWRzIGhhcmRjb2RpbmcgYSBudW1iZXIgb2Yg
aW5kZXggYW5kIG1hdGNoIHRoZSAKZW51bS4KCkNoZWVycywKCi0tIApKdWxpZW4gR3JhbGwKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBt
YWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMu
eGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
