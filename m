Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C3097119E7C
	for <lists+xen-devel@lfdr.de>; Tue, 10 Dec 2019 23:45:30 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ieoBa-0008Be-9W; Tue, 10 Dec 2019 22:40:54 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Ka1f=2A=amazon.com=prvs=2409a09a6=elnikety@srs-us1.protection.inumbo.net>)
 id 1ieoBY-0008BZ-5H
 for xen-devel@lists.xenproject.org; Tue, 10 Dec 2019 22:40:52 +0000
X-Inumbo-ID: 1e41776a-1b9e-11ea-b6f1-bc764e2007e4
Received: from smtp-fw-6002.amazon.com (unknown [52.95.49.90])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1e41776a-1b9e-11ea-b6f1-bc764e2007e4;
 Tue, 10 Dec 2019 22:40:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1576017652; x=1607553652;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=8o0SGqhnKHtigEgsI/hX8dyCvAjdr2lwLx5U8GRanGQ=;
 b=dy4OV5uf/ZAA/3ZeMjvu5NWWB1lJUluVf4zc4doBerxRhRny4DN3l7Lr
 szIZmFCWpclG/btXOtkW+pUkGr5d+TFAdSfGPC0JJeKzXzjOeiFouvp3z
 zbIo/ubmtZaM6SQY/HX1rfnsv8BfsmKZnF21wkdib0HaavfkcowKnCMK+ k=;
IronPort-SDR: MwtFv24PP0aqAYZzLqjJ99k8tGDOgIXRbxGIXqQw+EtpJLZtCQV80SVsO9we3FhI2ZLfqM8dvO
 bZHP1dmK4nnw==
X-IronPort-AV: E=Sophos;i="5.69,301,1571702400"; 
   d="scan'208";a="7068722"
Received: from iad6-co-svc-p1-lb1-vlan3.amazon.com (HELO
 email-inbound-relay-1d-9ec21598.us-east-1.amazon.com) ([10.124.125.6])
 by smtp-border-fw-out-6002.iad6.amazon.com with ESMTP;
 10 Dec 2019 22:40:51 +0000
Received: from EX13MTAUEA001.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan3.iad.amazon.com [10.40.159.166])
 by email-inbound-relay-1d-9ec21598.us-east-1.amazon.com (Postfix) with ESMTPS
 id 80F31A241B; Tue, 10 Dec 2019 22:40:47 +0000 (UTC)
Received: from EX13D03EUA002.ant.amazon.com (10.43.165.166) by
 EX13MTAUEA001.ant.amazon.com (10.43.61.243) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Tue, 10 Dec 2019 22:40:46 +0000
Received: from a483e73f63b0.ant.amazon.com (10.43.162.171) by
 EX13D03EUA002.ant.amazon.com (10.43.165.166) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Tue, 10 Dec 2019 22:40:42 +0000
To: Jan Beulich <jbeulich@suse.com>
References: <20191209084119.87563-1-elnikety@amazon.com>
 <180013ce-7b18-335a-f04b-1db0d4f2adf4@citrix.com>
 <eca670cd-7f8c-a662-320a-43981ba60c9a@amazon.com>
 <5bdb27b7-f827-23bd-a1dd-a0cec039ce54@suse.com>
From: Eslam Elnikety <elnikety@amazon.com>
Message-ID: <e25e1ae4-d5b1-7ce8-348f-f2d1809d0635@amazon.com>
Date: Tue, 10 Dec 2019 23:40:34 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.3.0
MIME-Version: 1.0
In-Reply-To: <5bdb27b7-f827-23bd-a1dd-a0cec039ce54@suse.com>
Content-Language: en-US
X-Originating-IP: [10.43.162.171]
X-ClientProxiedBy: EX13d09UWC004.ant.amazon.com (10.43.162.114) To
 EX13D03EUA002.ant.amazon.com (10.43.165.166)
Precedence: Bulk
Subject: Re: [Xen-devel] [PATCH] x86/microcode: Support builtin CPU microcode
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
 xen-devel@lists.xenproject.org, David Woodhouse <dwmw@amazon.co.uk>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTAuMTIuMTkgMTA6MjEsIEphbiBCZXVsaWNoIHdyb3RlOgo+IE9uIDA5LjEyLjIwMTkgMjI6
NDksIEVzbGFtIEVsbmlrZXR5IHdyb3RlOgo+PiBPbiAwOS4xMi4xOSAxNjoxOSwgQW5kcmV3IENv
b3BlciB3cm90ZToKPj4+IE9uIDA5LzEyLzIwMTkgMDg6NDEsIEVzbGFtIEVsbmlrZXR5IHdyb3Rl
Ogo+Pj4+IC0tLSAvZGV2L251bGwKPj4+PiArKysgYi94ZW4vYXJjaC94ODYvbWljcm9jb2RlL01h
a2VmaWxlCj4+Pj4gQEAgLTAsMCArMSw0MCBAQAo+Pj4+ICsjIENvcHlyaWdodCAoQykgMjAxOSBB
bWF6b24uY29tLCBJbmMuIG9yIGl0cyBhZmZpbGlhdGVzLgo+Pj4+ICsjIEF1dGhvcjogRXNsYW0g
RWxuaWtldHkgPGVsbmlrZXR5QGFtYXpvbi5jb20+Cj4+Pj4gKyMKPj4+PiArIyBUaGlzIHByb2dy
YW0gaXMgZnJlZSBzb2Z0d2FyZTsgeW91IGNhbiByZWRpc3RyaWJ1dGUgaXQgYW5kL29yIG1vZGlm
eQo+Pj4+ICsjIGl0IHVuZGVyIHRoZSB0ZXJtcyBvZiB0aGUgR05VIEdlbmVyYWwgUHVibGljIExp
Y2Vuc2UgYXMgcHVibGlzaGVkIGJ5Cj4+Pj4gKyMgdGhlIEZyZWUgU29mdHdhcmUgRm91bmRhdGlv
bjsgZWl0aGVyIHZlcnNpb24gMiBvZiB0aGUgTGljZW5zZSwgb3IKPj4+PiArIyAoYXQgeW91ciBv
cHRpb24pIGFueSBsYXRlciB2ZXJzaW9uLgo+Pj4+ICsjCj4+Pj4gKyMgVGhpcyBwcm9ncmFtIGlz
IGRpc3RyaWJ1dGVkIGluIHRoZSBob3BlIHRoYXQgaXQgd2lsbCBiZSB1c2VmdWwsCj4+Pj4gKyMg
YnV0IFdJVEhPVVQgQU5ZIFdBUlJBTlRZOyB3aXRob3V0IGV2ZW4gdGhlIGltcGxpZWQgd2FycmFu
dHkgb2YKPj4+PiArIyBNRVJDSEFOVEFCSUxJVFkgb3IgRklUTkVTUyBGT1IgQSBQQVJUSUNVTEFS
IFBVUlBPU0UuICBTZWUgdGhlCj4+Pj4gKyMgR05VIEdlbmVyYWwgUHVibGljIExpY2Vuc2UgZm9y
IG1vcmUgZGV0YWlscy4KPj4+PiArCj4+Pj4gK29iai15ICs9IGJ1aWx0aW5fdWNvZGUubwo+Pj4+
ICsKPj4+PiArIyBEaXJlY3RvcnkgaG9sZGluZyB0aGUgbWljcm9jb2RlIHVwZGF0ZXMuCj4+Pj4g
K1VDT0RFX0RJUj0kKHBhdHN1YnN0ICIlIiwlLCQoQ09ORklHX0JVSUxUSU5fVUNPREVfRElSKSkK
Pj4+PiArYW1kLWJsb2JzIDo9ICQod2lsZGNhcmQgJChVQ09ERV9ESVIpL2FtZC11Y29kZS8qKQo+
Pj4+ICtpbnRlbC1ibG9icyA6PSAkKHdpbGRjYXJkICQoVUNPREVfRElSKS9pbnRlbC11Y29kZS8q
KQo+Pj4KPj4+IFRoaXMgaXMgYSBsaXR0bGUgZGFuZ2Vyb3VzLsKgIEkgY2FuIHNlZSB3aHkgeW91
IHdhbnQgdG8gZG8gaXQgbGlrZSB0aGlzLAo+Pj4gYW5kIEkgY2FuJ3QgcHJvdmlkZSBhbnkgb2J2
aW91cyBzdWdnZXN0aW9ucywgYnV0IGlmIHRoaXMgZ2xvYiBwaWNrcyB1cAo+Pj4gYW55dGhpbmcg
d2hpY2ggaXNuJ3QgYSBtaWNyb2NvZGUgZmlsZSwgaXQgd2lsbCBicmVhayB0aGUgbG9naWMgdG8g
c2VhcmNoCj4+PiBmb3IgdGhlIHJpZ2h0IGJsb2IuCj4+Pgo+Pgo+PiBXZSBjYW4gbGltaXQgdGhl
IGFtZC1ibG9icyBhbmQgaW50ZWwtYmxvYiB0byBiaW5hcmllcyBmb2xsb3dpbmcgdGhlCj4+IG5h
bWluZyBjb252ZW50aW9uIEF1dGhlbnRpY0FNRC5iaW4gYW5kIEdlbnVpbmVJbnRlbC5iaW4gZm9y
IGFtZCBhbmQKPj4gaW50ZWwsIHJlc3BlY3RpdmVseS4gWWV0LCB0aGlzIHdvdWxkIGJlIGltcG9z
aW5nIGFuIHVubmVjZXNzYXJ5Cj4+IHJlc3RyaWN0aW9uIG9uIGFkbWluaXN0cmF0b3JzIHdobyBt
YXkgd2FudCB0byBiZSBpbm5vdmF0aXZlIHdpdGggbmFtaW5nCj4+IChvciB3YW50IHRvIHVzZSB0
aGUgbmFtaW5nIG1pY3JvY29kZV9hbWRfKi5iaW4gb3IgRkYtTU0tU1MgaW5zdGVhZCkuCj4+Cj4+
IEFsdGVybmF0aXZlbHksIHdlIGNhbiBpbnRyb2R1Y2UgQ09ORklHX0JVSUxUSU5fVUNPREVfSU5U
RUwgYW5kCj4+IENPTkZJR19CVUlMVElOX1VDT0RFX0FNRC4gQm90aCBkZWZhdWx0IHRvIGVtcHR5
IHN0cmluZ3MuIFRoZW4sIGFuCj4+IGFkbWluaXN0cmF0b3IgY2FuIHNwZWNpZnkgZXhhY3RseSB0
aGUgbWljcm9jb2RlcyB0byBpbmNsdWRlIHJlbGF0aXZlIHRvCj4+IHRoZSBDT05GSUdfQlVJTFRJ
Tl9VQ09ERV9ESVIuIEZvciBleGFtcGxlOgo+PiBDT05GSUdfQlVJTFRJTl9VQ09ERV9JTlRFTD0i
aW50ZWwtdWNvZGUvMDYtM2EtMDkiCj4+IENPTkZJR19CVUlMVElOX1VDT0RFX0FNRD0iYW1kLXVj
b2RlL21pY3JvY29kZV9hbWRfZmFtMTVoLmJpbiIKPiAKPiBUaGlzIHdvdWxkIG1ha2UgdGhlIGZl
YXR1cmUgZXZlbiBsZXNzIGdlbmVyaWMgLSBJIGFscmVhZHkgbWVhbnQgdG8KCkkgZG8gbm90IGZv
bGxvdyB0aGUgcG9pbnQgYWJvdXQgYmVpbmcgbGVzcyBnZW5lcmljLiAoSSBob3BlIG15IGV4YW1w
bGUgCmRpZCBub3QgZ2l2ZSB0aGUgZmFsc2UgaW1wcmVzc2lvbiB0aGF0IENPTkZJR19CVUlMVElO
X1VDT0RFX3tBTUQsSU5URUx9IAphbGxvdyBmb3Igb25seSBhIHNpbmdsZSBtaWNyb2NvZGUgYmxv
YiBmb3IgYSBzaW5nbGUgc2lnbmF0dXJlKS4KCj4gYXNrIHdoZXRoZXIgYnVpbGRpbmcgdWNvZGUg
aW50byBiaW5hcmllcyBpcyByZWFsbHkgYSB1c2VmdWwgdGhpbmcKPiB3aGVuIHdlIGFscmVhZHkg
aGF2ZSBtb3JlIGZsZXhpYmxlIHdheXMuIEkgY291bGQgc2VlIHRoaXMgYmVpbmcKPiB1c2VmdWwg
aWYgdGhlcmUgd2FzIG5vIG90aGVyIHdheSB0byBtYWtlIHVjb2RlIGF2YWlsYWJsZSBhdCBib290
Cj4gdGltZS4KCkl0IGlzIHVzZWZ1bCBpbiBhZGRpdGlvbiB0byB0aGUgZXhpc3Rpbmcgd2F5cyB0
byBkbyBlYXJseSBtaWNyb2NvZGUgCnVwZGF0ZXMuIEZpcnN0LCB3aGVuIG9wZXJhdGluZyBtYW55
IGhvc3RzLCB1c2luZyBib290IG1vZHVsZXMgKGVpdGhlciBhIApkaXN0aW5jdCBtaWNyb2NvZGUg
bW9kdWxlIG9yIHdpdGhpbiBhbiBpbml0cmQpIGJlY29tZXMgaW52b2x2ZWQuIEZvciAKaW5zdGFu
Y2UsIHRvb2xzIHRvIHVwZGF0ZSBib290IGVudHJpZXMgKGUuZy4sIApodHRwczovL2xpbnV4LmRp
ZS5uZXQvbWFuLzgvZ3J1YmJ5KSBkbyBub3Qgc3VwcG9ydCBhZGRpbmcgYXJiaXRyYXJ5IAoobWlj
cm9jb2RlKSBtb2R1bGVzLgoKU2Vjb25kLCB0aGVyZSBpcyBvZnRlbiBuZWVkIHRvIGNvdXBsZSBh
IFhlbiBidWlsZCB3aXRoIGEgbWluaW11bSAKbWljcm9jb2RlIHBhdGNoIGxldmVsLiBIYXZpbmcg
dGhlIG1pY3JvY29kZSBidWlsdCB3aXRoaW4gdGhlIFhlbiBpbWFnZSAKaXRzZWxmIGlzIGEgc3Ry
ZWFtbGluZWQsIG5hdHVyYWwgd2F5IG9mIGFjaGlldmluZyB0aGF0LgoKVGhhbmtzLApFc2xhbQoK
PiAKPiBKYW4KPiAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9y
ZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
