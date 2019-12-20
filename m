Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 10E3912798D
	for <lists+xen-devel@lfdr.de>; Fri, 20 Dec 2019 11:46:08 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iiFkA-0008AR-M3; Fri, 20 Dec 2019 10:42:50 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=fFWP=2K=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iiFk9-0008AM-NX
 for xen-devel@lists.xenproject.org; Fri, 20 Dec 2019 10:42:49 +0000
X-Inumbo-ID: 725eced2-2315-11ea-b6f1-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 725eced2-2315-11ea-b6f1-bc764e2007e4;
 Fri, 20 Dec 2019 10:42:41 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 50218ACF0;
 Fri, 20 Dec 2019 10:42:40 +0000 (UTC)
To: Paul Durrant <pdurrant@amazon.com>
References: <20191219173819.14065-1-pdurrant@amazon.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <f0b05cff-084d-8510-f6aa-3b347735d3ae@suse.com>
Date: Fri, 20 Dec 2019 11:43:09 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20191219173819.14065-1-pdurrant@amazon.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v3] x86/save: reserve HVM save record
 numbers that have been consumed...
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
Cc: xen-devel@lists.xenproject.org,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTkuMTIuMjAxOSAxODozOCwgUGF1bCBEdXJyYW50IHdyb3RlOgo+IC4uLmZvciBwYXRjaGVz
IG5vdCAoeWV0KSB1cHN0cmVhbS4KPiAKPiBUaGlzIHBhdGNoIGlzIHNpbXBseSBhZGRpbmcgYSBj
b21tZW50IHRvIHJlc2VydmUgc2F2ZSByZWNvcmQgbnVtYmVyIHNwYWNlCj4gdG8gYXZvaWQgdGhl
IHJpc2sgb2YgY2xhc2hlcyBiZXR3ZWVuIGV4aXN0ZW50IGRvd25zdHJlYW0gY2hhbmdlcyBtYWRl
IGJ5Cj4gQW1hem9uIGFuZCBmdXR1cmUgdXBzdHJlYW0gY2hhbmdlcyB3aGljaCBtYXkgYmUgaW5j
b21wYXRpYmxlLgo+IAo+IFNpZ25lZC1vZmYtYnk6IFBhdWwgRHVycmFudCA8cGR1cnJhbnRAYW1h
em9uLmNvbT4KPiBSZXZpZXdlZC1ieTogV2VpIExpdSA8d2xAeGVuLm9yZz4KCkFja2VkLWJ5OiBK
YW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+CihhbGJlaXQgc29tZXdoYXQgcmVsdWN0YW50
bHkpCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4t
ZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczov
L2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
