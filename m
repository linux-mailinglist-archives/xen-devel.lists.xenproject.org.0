Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F0C3F3280D
	for <lists+xen-devel@lfdr.de>; Mon,  3 Jun 2019 07:38:38 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hXfdT-0005PY-UV; Mon, 03 Jun 2019 05:35:55 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=WQxh=UC=mxnavi.com=chenbaodong@srs-us1.protection.inumbo.net>)
 id 1hXfdS-0005PT-1w
 for xen-devel@lists.xenproject.org; Mon, 03 Jun 2019 05:35:54 +0000
X-Inumbo-ID: 72337618-85c1-11e9-8980-bc764e045a96
Received: from mxnavi-mail.mxnavi.com (unknown [116.90.87.199])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 72337618-85c1-11e9-8980-bc764e045a96;
 Mon, 03 Jun 2019 05:35:51 +0000 (UTC)
Received: from [192.168.51.47] (61.161.186.150) by mxnavi-mail.mxnavi.com
 (116.90.87.199) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1591.10; Mon, 3 Jun
 2019 13:33:37 +0800
To: Andrew Cooper <andrew.cooper3@citrix.com>, <xen-devel@lists.xenproject.org>
References: <4574c000e77fae38b87d69cad06a3c74@sslemail.net>
 <a42a8cc4-f5dc-f6f4-d17b-a8b7f673c7f5@citrix.com>
From: chenbaodong <chenbaodong@mxnavi.com>
Message-ID: <f5ec0bff-4018-fad9-2cfc-c4bb926bc94f@mxnavi.com>
Date: Mon, 3 Jun 2019 13:35:45 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <a42a8cc4-f5dc-f6f4-d17b-a8b7f673c7f5@citrix.com>
Content-Language: en-US
X-Originating-IP: [61.161.186.150]
X-ClientProxiedBy: mxnavi-mail.mxnavi.com (116.90.87.199) To
 mxnavi-mail.mxnavi.com (116.90.87.199)
Subject: Re: [Xen-devel] [PATCH] xen: make keyhanler configurable
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
Cc: Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Dario Faggioli <dfaggioli@suse.com>,
 Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Ck9uIDYvMS8xOSAwNjozMCwgQW5kcmV3IENvb3BlciB3cm90ZToKPiBPbiAzMC8wNS8yMDE5IDE4
OjU4LCBCYW9kb25nIENoZW4gd3JvdGU6Cj4+IGtleWhhbmRsZXIgbWFpbmx5IHVzZWQgZm9yIGRl
YnVnIHVzYWdlIGJ5IGRldmVsb3BlcnMgd2hpY2ggY2FuIGR1bXAKPj4geGVuIG1vZHVsZShlZy4g
dGltZXIsIHNjaGVkdWxlcikgc3RhdHVzIGF0IHJ1bnRpbWUgYnkgaW5wdXQKPj4gY2hhcmFjdGVy
IGZyb20gY29uc29sZS4KPj4KPj4gU2lnbmVkLW9mZi1ieTogQmFvZG9uZyBDaGVuIDxjaGVuYmFv
ZG9uZ0BteG5hdmkuY29tPgo+IFdoYXQgaXMgdGhlIG1vdGl2YXRpb24gaGVyZT/CoCBJIGRvbid0
IGhhdmUgYSBzcGVjaWZpYyBvYmplY3Rpb24gdG8KPiBtYWtpbmcgdGhpcyBjb25maWd1cmFibGUg
KHNvIGxvbmcgYXMgaXQgZXhjaXNlcyB0aGUgZW50aXJlIGtleWhhbmRsZXIKPiBpbmZyYXN0cnVj
dHVyZSwgd2hpY2ggaXMgcmF0aGVyIG1vcmUgdGhhbiB0aGlzIHBhdGNoIGRvZXMpLCBidXQgSSBh
bHNvCj4gZG9uJ3Qgc2VlIHdoeSB3ZSB3b3VsZCB3YW50IHRvIGRvIHNvIGluIHRoZSBmaXJzdCBw
bGFjZS4KPgo+IEluIHBhcnRpY3VsYXIsIGl0IGRvZXNuJ3QgcmVxdWlyZSBhIHNlcmlhbCBjb25z
b2xlIHRvIGZ1bmN0aW9uIGNvcnJlY3RseQo+IGluIHRoZSBmaXJzdCBwbGFjZS7CoCBUaGlzIGZ1
bmN0aW9uYWxpdHkgY2FuIGJlIHVzZWQgd2l0aCBgeGwgZGVidWcta2V5cwo+ICRjaGFyOyB4bCBk
bWVzZ2AKCklJVUMgdGhlIGNvbmZpZyBjdXQgbmVhcmx5IHRoZSBlbnRpcmUga2V5aGFuZGxlciBp
bmZyYXN0cnVjdHVyZS4KCkknbSBpbnRlcmVzdGVkIGluIGFybTY0IGF1dG9tb3RpdmUgdXNlIGNh
c2UsIHNhZmV0eSBjZXJ0aWZpY2F0aW9uCgppcyBuaWNlIHRvIGhhdmUuCgpzbyB0aGUgc21hbGxl
ciBjb2RlIGJhc2UgaXMgcHJlZmVycmVkLgoKQlRXLCBpIGhlYXJkIHRoZSB3b3JrcyAiZG9tMGxl
c3MiLCBpcyBpdCBwb3NzaWJsZSBydW4gdm1zIG92ZXIgeGVuIAp3aXRob3V0IHhsPwoKPiB+QW5k
cmV3Cj4gLgo+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpo
dHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
