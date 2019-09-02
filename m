Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 91C59A58A8
	for <lists+xen-devel@lfdr.de>; Mon,  2 Sep 2019 15:59:01 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i4mpG-0000sp-G1; Mon, 02 Sep 2019 13:56:58 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=kzGk=W5=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1i4mpE-0000sk-RK
 for xen-devel@lists.xenproject.org; Mon, 02 Sep 2019 13:56:56 +0000
X-Inumbo-ID: 861c5386-cd89-11e9-aea3-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 861c5386-cd89-11e9-aea3-12813bfff9fa;
 Mon, 02 Sep 2019 13:56:56 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 5221DABE9;
 Mon,  2 Sep 2019 13:56:55 +0000 (UTC)
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <20190902121151.11384-1-andrew.cooper3@citrix.com>
 <20190902121459.11855-1-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <23d839bb-75fb-407e-f584-eff085214d8c@suse.com>
Date: Mon, 2 Sep 2019 15:56:59 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190902121459.11855-1-andrew.cooper3@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 2/2] x86/apci: Adjust command line parsing
 for "acpi_sleep"
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

T24gMDIuMDkuMjAxOSAxNDoxNCwgQW5kcmV3IENvb3BlciB3cm90ZToKPiAtLS0gYS94ZW4vYXJj
aC94ODYvYWNwaS9wb3dlci5jCj4gKysrIGIveGVuL2FyY2gveDg2L2FjcGkvcG93ZXIuYwo+IEBA
IC0zMyw4ICszMywzMiBAQAo+ICAKPiAgdWludDMyX3Qgc3lzdGVtX3Jlc2V0X2NvdW50ZXIgPSAx
Owo+ICAKPiAtc3RhdGljIGNoYXIgX19pbml0ZGF0YSBvcHRfYWNwaV9zbGVlcFsyMF07Cj4gLXN0
cmluZ19wYXJhbSgiYWNwaV9zbGVlcCIsIG9wdF9hY3BpX3NsZWVwKTsKPiArc3RhdGljIGludCBf
X2luaXQgcGFyc2VfYWNwaV9zbGVlcChjb25zdCBjaGFyICpzKQo+ICt7Cj4gKyAgICBjb25zdCBj
aGFyICpzczsKPiArICAgIHVuc2lnbmVkIGludCBmbGFnID0gMDsKPiArICAgIGludCByYyA9IDA7
Cj4gKwo+ICsgICAgZG8gewo+ICsgICAgICAgIHNzID0gc3RyY2hyKHMsICcsJyk7Cj4gKyAgICAg
ICAgaWYgKCAhc3MgKQo+ICsgICAgICAgICAgICBzcyA9IHN0cmNocihzLCAnXDAnKTsKPiArCj4g
KyAgICAgICAgaWYgKCAhY21kbGluZV9zdHJjbXAocywgInMzX2Jpb3MiKSApCj4gKyAgICAgICAg
ICAgIGZsYWcgfD0gMTsKPiArICAgICAgICBlbHNlIGlmICggIWNtZGxpbmVfc3RyY21wKHMsICJz
M19tb2RlIikgKQo+ICsgICAgICAgICAgICBmbGFnIHw9IDI7CgpZb3UgZGlkbid0IGZhbmN5IHVz
aW5nIHBhcnNlX2Jvb2xlYW4oKSBoZXJlICh0byBhbHNvIGFsbG93CnNwZWNpZnlpbmcgdGhlIG5l
Z2F0aXZlIGZvcm1zKSwgZGlkIHlvdT8KCj4gKyAgICAgICAgZWxzZQo+ICsgICAgICAgICAgICBy
YyA9IC1FSU5WQUw7Cj4gKwo+ICsgICAgICAgIHMgPSBzcyArIDE7Cj4gKyAgICB9IHdoaWxlICgg
KnNzICk7Cj4gKwo+ICsgICAgYWNwaV92aWRlb19mbGFncyA9IGZsYWc7CgpUaGlzIHdhbnRzIHRv
IGJlIHw9ICwgc3VjaCB0aGF0ICJhY3BpX3NsZWVwPXMzX2Jpb3MgYWNwaV9zbGVlcD1zM19tb2Rl
IgpoYXMgdGhlIHNhbWUgZWZmZWN0IGFzICJhY3BpX3NsZWVwPXMzX21vZGUsczNfYmlvcyIuIFdp
dGggYXQgbGVhc3QgdGhpcwphZGp1c3RtZW50ClJldmlld2VkLWJ5OiBKYW4gQmV1bGljaCA8amJl
dWxpY2hAc3VzZS5jb20+CgpKYW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94
ZW4tZGV2ZWw=
