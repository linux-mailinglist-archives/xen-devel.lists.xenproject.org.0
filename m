Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 82943B126F
	for <lists+xen-devel@lfdr.de>; Thu, 12 Sep 2019 17:51:21 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i8RKV-00038h-Rq; Thu, 12 Sep 2019 15:48:19 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=ncEf=XH=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1i8RKU-00038b-DQ
 for xen-devel@lists.xenproject.org; Thu, 12 Sep 2019 15:48:18 +0000
X-Inumbo-ID: bc9a3c28-d574-11e9-b299-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id bc9a3c28-d574-11e9-b299-bc764e2007e4;
 Thu, 12 Sep 2019 15:48:17 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id D517CB6A2;
 Thu, 12 Sep 2019 15:48:15 +0000 (UTC)
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <f6accb8b-38d9-ad9a-ec68-992d75f36a88@suse.com>
 <f44f12f3-6449-8014-43e4-1f08100be251@suse.com>
 <20190912153147.nhxdrifqney752lc@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <38a24f1a-9ed4-edb1-a0e2-193170fc6eee@suse.com>
Date: Thu, 12 Sep 2019 17:48:16 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20190912153147.nhxdrifqney752lc@Air-de-Roger>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 9/9] x86: PCID is unused when !PV
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
Cc: George Dunlap <George.Dunlap@eu.citrix.com>,
 AndrewCooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTIuMDkuMjAxOSAxNzozMSwgUm9nZXIgUGF1IE1vbm7DqSAgd3JvdGU6Cj4gT24gV2VkLCBT
ZXAgMTEsIDIwMTkgYXQgMDU6MjY6NDZQTSArMDIwMCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+IEBA
IC0zMDEsOCArMzA1LDEyIEBAIHN0YXRpYyBpbmxpbmUgdm9pZCB3cml0ZV9jcjQodW5zaWduZWQg
bG8KPj4gIHsKPj4gICAgICBzdHJ1Y3QgY3B1X2luZm8gKmluZm8gPSBnZXRfY3B1X2luZm8oKTsK
Pj4gIAo+PiArI2lmZGVmIENPTkZJR19QVgo+PiAgICAgIC8qIE5vIGdsb2JhbCBwYWdlcyBpbiBj
YXNlIG9mIFBDSURzIGVuYWJsZWQhICovCj4+ICAgICAgQVNTRVJUKCEodmFsICYgWDg2X0NSNF9Q
R0UpIHx8ICEodmFsICYgWDg2X0NSNF9QQ0lERSkpOwo+PiArI2Vsc2UKPj4gKyAgICBBU1NFUlQo
ISh2YWwgJiBYODZfQ1I0X1BDSURFKSk7Cj4gCj4gVGhhdCBhc3NlcnQgc2VlbXMgcXVpdGUgcG9p
bnRsZXNzLCB5b3UgaGF2ZSBzZXQgWDg2X0NSNF9QQ0lERSB0byAwLCBzbwo+IHRoaXMgaXMgbmV2
ZXIgZ29pbmcgdG8gdHJpZ2dlcj8KCkkgd2FzIGFib3V0IHRvIGRyb3AgdGhpcywgYnV0IEkgaGF2
ZSB0byB0YWtlIGJhY2sgbXkgZWFybGllcgpyZXBseTogVGhlICNpZmRlZiB5b3UgdGFsayBhYm91
dCBpcyBpbiBmbHVzaHRsYi5jLCB3aGVyZWFzCmhlcmUgd2UncmUgaW4gcHJvY2Vzc29yLmguCgpK
YW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1k
ZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8v
bGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
