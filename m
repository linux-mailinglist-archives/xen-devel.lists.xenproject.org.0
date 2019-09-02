Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C59D4A5A3E
	for <lists+xen-devel@lfdr.de>; Mon,  2 Sep 2019 17:11:46 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i4nwm-00007l-3i; Mon, 02 Sep 2019 15:08:48 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=kzGk=W5=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1i4nwl-00007g-1C
 for xen-devel@lists.xenproject.org; Mon, 02 Sep 2019 15:08:47 +0000
X-Inumbo-ID: 8ebb398a-cd93-11e9-b95f-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8ebb398a-cd93-11e9-b95f-bc764e2007e4;
 Mon, 02 Sep 2019 15:08:45 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 87909B69E;
 Mon,  2 Sep 2019 15:08:44 +0000 (UTC)
To: Paul Durrant <paul.durrant@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien.grall@arm.com>
References: <20190902145014.36442-1-paul.durrant@citrix.com>
 <20190902145014.36442-2-paul.durrant@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <b0d39084-457d-1faa-be8c-3995ff5957a7@suse.com>
Date: Mon, 2 Sep 2019 17:08:48 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190902145014.36442-2-paul.durrant@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v8 1/6] x86/domain: remove the 'oos_off' flag
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
Cc: Wei Liu <wl@xen.org>, George Dunlap <george.dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Tim Deegan <tim@xen.org>,
 xen-devel@lists.xenproject.org,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDIuMDkuMjAxOSAxNjo1MCwgUGF1bCBEdXJyYW50IHdyb3RlOgo+IFRoZSBmbGFnIGlzIG5v
dCBuZWVkZWQgc2luY2UgdGhlIGRvbWFpbiAnb3B0aW9ucycgY2FuIG5vdyBiZSB0ZXN0ZWQKPiBk
aXJlY3RseS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBQYXVsIER1cnJhbnQgPHBhdWwuZHVycmFudEBj
aXRyaXguY29tPgoKSW4gcHJpbmNpcGxlClJldmlld2VkLWJ5OiBKYW4gQmV1bGljaCA8amJldWxp
Y2hAc3VzZS5jb20+CmJ1dAoKSnVsaWVuLCBTdGVmYW5vLAoKSSdkIGxpa2UgdG8gdG8gYXNrIGZv
ciBhbiBleHBsaWNpdCBvcGluaW9uIG9mIGF0IGxlYXN0IG9uZSBvZiB5b3UKcmVnYXJkaW5nIHRo
ZSBiZWhhdmlvciBvbiBBcm0uIER1cmluZyB2NyByZXZpZXcgSSBkaWQgc3VnZ2VzdCB0aGF0CnRo
ZSBmbGFnIGJlaW5nIHNldCBzaG91bGQgZ2V0IHJlamVjdGVkIHRoZXJlLgoKSmFuCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGlu
ZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnBy
b2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
