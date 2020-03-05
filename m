Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4134D17A90B
	for <lists+xen-devel@lfdr.de>; Thu,  5 Mar 2020 16:40:48 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j9sZ6-0007pM-Ae; Thu, 05 Mar 2020 15:37:36 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=9ybd=4W=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1j9sZ4-0007pH-OP
 for xen-devel@lists.xenproject.org; Thu, 05 Mar 2020 15:37:34 +0000
X-Inumbo-ID: 3b7190da-5ef7-11ea-b52f-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3b7190da-5ef7-11ea-b52f-bc764e2007e4;
 Thu, 05 Mar 2020 15:37:34 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 05745B042;
 Thu,  5 Mar 2020 15:37:32 +0000 (UTC)
To: Roger Pau Monne <roger.pau@citrix.com>
References: <20200303172046.50569-1-roger.pau@citrix.com>
 <20200303172046.50569-3-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <f355d493-0e9b-a3b1-54f9-5a1ca19df55d@suse.com>
Date: Thu, 5 Mar 2020 16:37:33 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200303172046.50569-3-roger.pau@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v6 2/6] x86/paging: add TLB flush hooks
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
Cc: Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Paul Durrant <pdurrant@amazon.com>, Tim Deegan <tim@xen.org>,
 George Dunlap <george.dunlap@citrix.com>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDMuMDMuMjAyMCAxODoyMCwgUm9nZXIgUGF1IE1vbm5lIHdyb3RlOgo+IEFkZCBzaGFkb3cg
YW5kIGhhcCBpbXBsZW1lbnRhdGlvbiBzcGVjaWZpYyBoZWxwZXJzIHRvIHBlcmZvcm0gZ3Vlc3QK
PiBUTEIgZmx1c2hlcy4gTm90ZSB0aGF0IHRoZSBjb2RlIGZvciBib3RoIGlzIGV4YWN0bHkgdGhl
IHNhbWUgYXQgdGhlCj4gbW9tZW50LCBhbmQgaXMgY29waWVkIGZyb20gaHZtX2ZsdXNoX3ZjcHVf
dGxiLiBUaGlzIHdpbGwgYmUgY2hhbmdlZCBieQo+IGZ1cnRoZXIgcGF0Y2hlcyB0aGF0IHdpbGwg
YWRkIGltcGxlbWVudGF0aW9uIHNwZWNpZmljIG9wdGltaXphdGlvbnMgdG8KPiB0aGVtLgo+IAo+
IE5vIGZ1bmN0aW9uYWwgY2hhbmdlIGludGVuZGVkLgo+IAo+IFNpZ25lZC1vZmYtYnk6IFJvZ2Vy
IFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRyaXguY29tPgo+IFJldmlld2VkLWJ5OiBXZWkgTGl1
IDx3bEB4ZW4ub3JnPgo+IEFja2VkLWJ5OiBUaW0gRGVlZ2FuIDx0aW1AeGVuLm9yZz4KClJldmll
d2VkLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+CgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3Jn
L21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
