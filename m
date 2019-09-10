Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B168AE815
	for <lists+xen-devel@lfdr.de>; Tue, 10 Sep 2019 12:27:44 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i7dJs-0007VE-VF; Tue, 10 Sep 2019 10:24:20 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=6bdU=XF=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1i7dJr-0007V9-ML
 for xen-devel@lists.xenproject.org; Tue, 10 Sep 2019 10:24:19 +0000
X-Inumbo-ID: 25523b2e-d3b5-11e9-ac1a-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 25523b2e-d3b5-11e9-ac1a-12813bfff9fa;
 Tue, 10 Sep 2019 10:24:18 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 9A677ABED;
 Tue, 10 Sep 2019 10:24:17 +0000 (UTC)
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <20190909155124.19942-1-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <ba415d32-3b4e-1ac5-2968-ab01d526de00@suse.com>
Date: Tue, 10 Sep 2019 12:24:16 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20190909155124.19942-1-andrew.cooper3@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] x86/cpuid: Fix handling of the
 CPUID.7[0].eax levelling MSR
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
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDkuMDkuMjAxOSAxNzo1MSwgQW5kcmV3IENvb3BlciB3cm90ZToKPiAtLS0gYS94ZW4vYXJj
aC94ODYvZG9tY3RsLmMKPiArKysgYi94ZW4vYXJjaC94ODYvZG9tY3RsLmMKPiBAQCAtMjE4LDEx
ICsyMTgsMTYgQEAgc3RhdGljIGludCB1cGRhdGVfZG9tYWluX2NwdWlkX2luZm8oc3RydWN0IGRv
bWFpbiAqZCwKPiAgICAgICAgICBpZiAoIGlzX3B2X2RvbWFpbihkKSAmJiAoKGxldmVsbGluZ19j
YXBzICYgTENBUF83YWIwKSA9PSBMQ0FQXzdhYjApICkKPiAgICAgICAgICB7Cj4gICAgICAgICAg
ICAgIHVpbnQ2NF90IG1hc2sgPSBjcHVpZG1hc2tfZGVmYXVsdHMuXzdhYjA7Cj4gLSAgICAgICAg
ICAgIHVpbnQzMl90IGVheCA9IGN0bC0+ZWF4Owo+IC0gICAgICAgICAgICB1aW50MzJfdCBlYngg
PSBwLT5mZWF0Ll83YjA7Cj4gIAo+IC0gICAgICAgICAgICBpZiAoIGJvb3RfY3B1X2RhdGEueDg2
X3ZlbmRvciAmIChYODZfVkVORE9SX0FNRCB8IFg4Nl9WRU5ET1JfSFlHT04pICkKPiAtICAgICAg
ICAgICAgICAgIG1hc2sgJj0gKCh1aW50NjRfdCllYXggPDwgMzIpIHwgZWJ4Owo+ICsgICAgICAg
ICAgICAvKgo+ICsgICAgICAgICAgICAgKiBMZWFmIDdbMF0uZWF4IGlzIG1heF9zdWJsZWFmLCBu
b3QgYSBmZWF0dXJlIG1hc2suICBUYWtlIGl0Cj4gKyAgICAgICAgICAgICAqIHdob2xlc2FsZSBm
cm9tIHRoZSBwb2xpY3ksIGJ1dCBjbGFtcCB0aGUgZmVhdHVyZXMgaW4gN1swXS5lYngKPiArICAg
ICAgICAgICAgICogcGVyIHVzdWFsLgo+ICsgICAgICAgICAgICAgKi8KPiArICAgICAgICAgICAg
aWYgKCBib290X2NwdV9kYXRhLng4Nl92ZW5kb3IgJgo+ICsgICAgICAgICAgICAgICAgIChYODZf
VkVORE9SX0FNRCB8IFg4Nl9WRU5ET1JfSFlHT04pICkKPiArICAgICAgICAgICAgICAgIG1hc2sg
PSAoKCh1aW50NjRfdClwLT5mZWF0Lm1heF9zdWJsZWFmIDw8IDMyKSB8Cj4gKyAgICAgICAgICAg
ICAgICAgICAgICAgICgodWludDMyX3QpbWFzayB8IHAtPmZlYXQuXzdiMCkpOwoKQXNzdW1pbmcg
eW91IG1lYW4gJiBpbnN0ZWFkIG9mIHwgaGVyZSwgd2l0aCBpdCBmaXhlZApSZXZpZXdlZC1ieTog
SmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgpPdGhlcndpc2UgSSdtIGFmcmFpZCBJIGRv
bid0IHVuZGVyc3RhbmQsIGFuZCBuZWVkIGZ1cnRoZXIKZXhwbGFuYXRpb24uCgpKYW4KCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWls
aW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVu
cHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
