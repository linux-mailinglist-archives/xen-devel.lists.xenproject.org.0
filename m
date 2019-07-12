Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B114B671F0
	for <lists+xen-devel@lfdr.de>; Fri, 12 Jul 2019 17:04:21 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hlx2d-0007O7-OA; Fri, 12 Jul 2019 15:00:55 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=F70t=VJ=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hlx2b-0007O2-TC
 for xen-devel@lists.xenproject.org; Fri, 12 Jul 2019 15:00:53 +0000
X-Inumbo-ID: d74679f9-a4b5-11e9-8980-bc764e045a96
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTP
 id d74679f9-a4b5-11e9-8980-bc764e045a96;
 Fri, 12 Jul 2019 15:00:51 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D26B52B;
 Fri, 12 Jul 2019 08:00:51 -0700 (PDT)
Received: from [10.119.48.83] (unknown [10.119.48.83])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 865313F59C;
 Fri, 12 Jul 2019 08:00:51 -0700 (PDT)
To: Denis Obrezkov <denisobrezkov@gmail.com>,
 Hunyue Yau <hy-gsoc@hy-research.com>
References: <25386cfa-d0b7-83fe-4d87-5af3459d54bd@gmail.com>
 <alpine.DEB.2.21.1907101512230.12168@sstabellini-ThinkPad-T480s>
 <e7104450-54ae-6720-9d9f-f4e8889946c8@gmail.com> <520937670.d9P0eaHOQZ@acer0>
 <28955848-fdc0-5311-580b-23fd8ce7bea2@gmail.com>
 <d1d8514d-05e6-66f3-ef8d-95f1b48ccfd4@arm.com>
 <1de0763d-0945-378d-6838-aeae13191059@gmail.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <74730e97-ed3e-1e93-603a-2e0f9730879e@arm.com>
Date: Fri, 12 Jul 2019 16:00:50 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <1de0763d-0945-378d-6838-aeae13191059@gmail.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [GSoC-2019] About the crossbar and xen
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
 Iain Hunter <drhunter95@gmail.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gNy8xMS8xOSA3OjI5IFBNLCBEZW5pcyBPYnJlemtvdiB3cm90ZToKPiBIaSwKCkhpLAoKPiBP
biA3LzExLzE5IDc6MzIgUE0sIEp1bGllbiBHcmFsbCB3cm90ZToKPiAKPj4+Cj4+PiBXaGF0IGRv
IHlvdSB0aGluaz8KPj4KPj4gSGF2ZSB5b3UgbG9va2VkIGF0IHRoZSBzZXJpZXMgSSBwb2ludGVk
IG91dCBlYXJsaWVyIG9uPyBJdCBleHRlbmRzIFhlbgo+PiB0byBzdXBwb3J0IG90aGVyIGludGVy
cnVwdCBjb250cm9sbGVyIHBhcmVudC4KPj4KPiBZZXMsIGJ1dCB5b3Ugc2FpZCBvbmNlIHRoYXQg
dGhlc2UgcGF0Y2ggc2VyaWVzIHdhc24ndCBhY2NlcHRlZCBiZWNhdXNlCj4gbWFpbnRhaW5lcnMg
ZGlkbid0IGxpa2Ugc29tZXRoaW5nLiBTbywgSSB3YW50ZWQgdG8gdW5kZXJzdGFuZCB3aGV0aGVy
Cj4gdGhpcyBhcHByb2FjaCBpcyBhY2NlcHRhYmxlLgoKVGhlIHNlcmllcyB3YXMgcmV2aWV3ZWQg
cHVibGljbHkuIExvb2tpbmcgdGhyb3VnaCB0aGUgc2VyaWVzLCBJIGRvbid0IAp0aGluayBtYWpv
ciBjb25jZXJuIG9uIHRoZSBhcHByb2FjaCBzdWdnZXN0ZWQuCgpIb3cgYWJvdXQgeW91IGhhdmUg
YSB0cnkgYXQgdGhlIHNlcmllcyBhbmQgc2VlIGhvdyBmYXIgeW91IGNhbiBnbz8gV2UgCmNhbiBk
aXNjdXNzIGFib3V0IGltcHJvdmVtZW50IG9uY2UgeW91IGhhdmUgdGhlIGNyb3NzYmFyIHVwIGFu
ZCBydW5uaW5nLgoKQ2hlZXJzLAoKLS0gCkp1bGllbiBHcmFsbAoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
