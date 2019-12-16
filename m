Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C16D120327
	for <lists+xen-devel@lfdr.de>; Mon, 16 Dec 2019 12:03:50 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1igo75-00033C-Dg; Mon, 16 Dec 2019 11:00:31 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=L813=2G=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1igo74-000337-Se
 for xen-devel@lists.xenproject.org; Mon, 16 Dec 2019 11:00:30 +0000
X-Inumbo-ID: 404207fe-1ff3-11ea-b6f1-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 404207fe-1ff3-11ea-b6f1-bc764e2007e4;
 Mon, 16 Dec 2019 11:00:20 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id F2581ACD7;
 Mon, 16 Dec 2019 11:00:19 +0000 (UTC)
To: Jin Nan Wang <jnwang@suse.com>
References: <20191216082718.20922-1-jnwang@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <034e70b7-58df-a144-5339-697368410afb@suse.com>
Date: Mon, 16 Dec 2019 12:00:44 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20191216082718.20922-1-jnwang@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v2] Xen missing prompt log when exec-sp=off
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
Cc: Kevin Tian <kevin.tian@intel.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Jun Nakajima <jun.nakajima@intel.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTYuMTIuMjAxOSAwOToyNywgSmluIE5hbiBXYW5nIHdyb3RlOgo+IEZpeCBhIGlzc3VlIHdo
ZW4gdXNlciBkaXNhYmxlIEVUUCBleGVjLXNwLCB4ZW4gbWlzc2VkIGEgcHJvbXB0Cj4gbG9nIGlu
IGRtZXNnLgoKV2h5ICJtaXNzZWQiIChhbmQgd2h5ICJwcm9tcHQiKT8gSSB0aGluayB0aGUgb3Jp
Z2luYWwgaW50ZW50aW9uCndhcyB0byBsb2cgYSBtZXNzYWdlIG9ubHkgd2hlbiBubyBjb21tYW5k
IGxpbmUgb3B0aW9uIHdhcyBnaXZlbgphbmQgdGhlIHN5c3RlbSB3b3VsZCBiZSB2dWxuZXJhYmxl
IHdpdGhvdXQgdGhlIGRpc2FibGluZy4KCk5ldmVydGhlbGVzcyB0d28gc3R5bGUgcmVtYXJrcyBh
cyB3ZWxsOgoKPiAtLS0gYS94ZW4vYXJjaC94ODYvaHZtL3ZteC92bXguYwo+ICsrKyBiL3hlbi9h
cmNoL3g4Ni9odm0vdm14L3ZteC5jCj4gQEAgLTI0OTUsMTQgKzI0OTUsMTQgQEAgY29uc3Qgc3Ry
dWN0IGh2bV9mdW5jdGlvbl90YWJsZSAqIF9faW5pdCBzdGFydF92bXgodm9pZCkKPiAgICAgIHsK
PiAgICAgICAgICBib29sIGNwdV9oYXNfYnVnX3BzY2hhbmdlX21jID0gaGFzX2lmX3BzY2hhbmdl
X21jKCk7Cj4gIAo+ICsgICAgICAgIC8qIERlZmF1bHQgdG8gbm9uLWV4ZWN1dGFibGUgc3VwZXJw
YWdlcyBvbiB2dWxuZXJhYmxlIGhhcmR3YXJlLiAqLwo+ICAgICAgICAgIGlmICggb3B0X2VwdF9l
eGVjX3NwID09IC0xICkKPiAtICAgICAgICB7Cj4gLSAgICAgICAgICAgIC8qIERlZmF1bHQgdG8g
bm9uLWV4ZWN1dGFibGUgc3VwZXJwYWdlcyBvbiB2dWxuZXJhYmxlIGhhcmR3YXJlLiAqLwo+ICAg
ICAgICAgICAgICBvcHRfZXB0X2V4ZWNfc3AgPSAhY3B1X2hhc19idWdfcHNjaGFuZ2VfbWM7Cj4g
IAo+IC0gICAgICAgICAgICBpZiAoIGNwdV9oYXNfYnVnX3BzY2hhbmdlX21jICkKPiAtICAgICAg
ICAgICAgICAgIHByaW50aygiVk1YOiBEaXNhYmxpbmcgZXhlY3V0YWJsZSBFUFQgc3VwZXJwYWdl
cyBkdWUgdG8gQ1ZFLTIwMTgtMTIyMDdcbiIpOwo+IC0gICAgICAgIH0KPiArICAgICAgICBpZiAo
b3B0X2VwdF9leGVjX3NwKQoKTWlzc2luZyBibGFua3MgaW5zaWRlICgpLgoKPiArICAgICAgICAg
ICAgcHJpbnRrKCJWTVg6IEVuYWJsZSBleGVjdXRhYmxlIEVQVCBzdXBlcnBhZ2VzLlxuIik7CgpO
byBmdWxsIHN0b3AgaGVyZSBwbGVhc2UuCgpKYW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby94ZW4tZGV2ZWw=
