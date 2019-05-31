Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BC5E430CE8
	for <lists+xen-devel@lfdr.de>; Fri, 31 May 2019 12:54:30 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hWf8v-0003mA-SS; Fri, 31 May 2019 10:52:13 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=2tza=T7=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hWf8v-0003m5-2b
 for xen-devel@lists.xenproject.org; Fri, 31 May 2019 10:52:13 +0000
X-Inumbo-ID: 2504b124-8392-11e9-a266-bf60509a05e7
Received: from foss.arm.com (unknown [217.140.101.70])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 2504b124-8392-11e9-a266-bf60509a05e7;
 Fri, 31 May 2019 10:52:12 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DB3F0341;
 Fri, 31 May 2019 03:52:11 -0700 (PDT)
Received: from [10.37.12.213] (unknown [10.37.12.213])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1CF763F59C;
 Fri, 31 May 2019 03:52:09 -0700 (PDT)
To: Baodong Chen <chenbaodong@mxnavi.com>, xen-devel@lists.xenproject.org
References: <1559272702-13459-1-git-send-email-chenbaodong@mxnavi.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <f3dbafae-4865-5233-3c8f-ede397c5f293@arm.com>
Date: Fri, 31 May 2019 11:52:08 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <1559272702-13459-1-git-send-email-chenbaodong@mxnavi.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] xen: put cpupool's member 'n_dom' after
 'cpupool_id'
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Jan Beulich <jbeulich@suse.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGksCgpPbiA1LzMxLzE5IDQ6MTggQU0sIEJhb2RvbmcgQ2hlbiB3cm90ZToKPiBUaHVzLCBzaXpl
b2Yoc3RydWN0IGNwdXBvb2wpIHdpbGwgc2F2ZSA4IGJ5dGVzIGZvciA2NC1iaXQgc3lzdGVtLgoK
SSBhbSBoYXBweSB3aXRoIHRoZSBjaGFuZ2UsIGFsdGhvdWdoIEFGQUlLIGNwdXBvb2wgaXMgbm90
IGluc3RhbnRpYXRlZCAKdGhhdCBvZnRlbi4gQXJlIHlvdSBwbGFubmluZyB0byBoYXZlIG1vcmUg
aW5zdGFudGlhdGlvbiBvZiBpdD8KCkNoZWVycywKCj4gCj4gU2lnbmVkLW9mZi1ieTogQmFvZG9u
ZyBDaGVuIDxjaGVuYmFvZG9uZ0BteG5hdmkuY29tPgo+IC0tLQo+ICAgeGVuL2luY2x1ZGUveGVu
L3NjaGVkLWlmLmggfCAyICstCj4gICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEg
ZGVsZXRpb24oLSkKPiAKPiBkaWZmIC0tZ2l0IGEveGVuL2luY2x1ZGUveGVuL3NjaGVkLWlmLmgg
Yi94ZW4vaW5jbHVkZS94ZW4vc2NoZWQtaWYuaAo+IGluZGV4IDkyYmM3YTAuLmYwY2YyMTAgMTAw
NjQ0Cj4gLS0tIGEveGVuL2luY2x1ZGUveGVuL3NjaGVkLWlmLmgKPiArKysgYi94ZW4vaW5jbHVk
ZS94ZW4vc2NoZWQtaWYuaAo+IEBAIC0yMTMsOSArMjEzLDkgQEAgc3RhdGljIGlubGluZSB2b2lk
IHNjaGVkX2ZyZWVfZG9tZGF0YShjb25zdCBzdHJ1Y3Qgc2NoZWR1bGVyICpzLAo+ICAgc3RydWN0
IGNwdXBvb2wKPiAgIHsKPiAgICAgICBpbnQgICAgICAgICAgICAgIGNwdXBvb2xfaWQ7Cj4gKyAg
ICB1bnNpZ25lZCBpbnQgICAgIG5fZG9tOwo+ICAgICAgIGNwdW1hc2tfdmFyX3QgICAgY3B1X3Zh
bGlkOyAgICAgIC8qIGFsbCBjcHVzIGFzc2lnbmVkIHRvIHBvb2wgKi8KPiAgICAgICBzdHJ1Y3Qg
Y3B1cG9vbCAgICpuZXh0Owo+IC0gICAgdW5zaWduZWQgaW50ICAgICBuX2RvbTsKPiAgICAgICBz
dHJ1Y3Qgc2NoZWR1bGVyICpzY2hlZDsKPiAgICAgICBhdG9taWNfdCAgICAgICAgIHJlZmNudDsK
PiAgIH07Cj4gCgotLSAKSnVsaWVuIEdyYWxsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVs
