Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A6D3B13A3FA
	for <lists+xen-devel@lfdr.de>; Tue, 14 Jan 2020 10:38:48 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1irIZZ-0006oy-VI; Tue, 14 Jan 2020 09:33:17 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=XZPm=3D=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1irIZY-0006or-Sy
 for xen-devel@lists.xenproject.org; Tue, 14 Jan 2020 09:33:16 +0000
X-Inumbo-ID: df6acc52-36b0-11ea-ac27-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id df6acc52-36b0-11ea-ac27-bc764e2007e4;
 Tue, 14 Jan 2020 09:33:08 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 8F65BACD6;
 Tue, 14 Jan 2020 09:33:07 +0000 (UTC)
To: Julien Grall <julien@xen.org>
References: <20200113213342.8206-1-julien@xen.org>
 <20200113213342.8206-3-julien@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <d33d195f-1d8d-5ca2-00aa-dac4cf2db5e1@suse.com>
Date: Tue, 14 Jan 2020 10:33:08 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20200113213342.8206-3-julien@xen.org>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 2/4] xen/char: ehci: Directly include
 xen/timer.h rather rely on dependency
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <jgrall@amazon.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTMuMDEuMjAyMCAyMjozMywgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IEZyb206IEp1bGllbiBH
cmFsbCA8amdyYWxsQGFtYXpvbi5jb20+Cj4gCj4gVGhlIGVoY2kgY2hhciBkcml2ZXIgaXMgdXNp
bmcgdGltZXJzIGJ1dCByZWx5aW5nIG9uIHRoZSBoZWFkZXIKPiB4ZW4vdGltZXIuaCB0byBiZSBp
bmNsdWRlZCB2aWEgYXNtLXg4Ni9odm0vaXJxLmggd2hpY2ggaXMgbm90IGV2ZW4KPiBkaXJlY3Rs
eSBpbmNsdWRlZCEKPiAKPiBGdXR1cmUgcmV3b3JrIHdpbGwgcmVkdWNlIHRoZSBudW1iZXIgb2Yg
cGxhY2VzIHdoZXJlIGFzbS14ODYvaHZtL2lycS5oCj4gd2lsbCBiZSBpbmNsdWRlZC4gSW5jbHVk
ZSB4ZW4vdGltZXIuaCBkaXJlY3RseSB0byBhdm9pZCBhbnkgYnJlYWthZ2UuCj4gCj4gU2lnbmVk
LW9mZi1ieTogSnVsaWVuIEdyYWxsIDxqZ3JhbGxAYW1hem9uLmNvbT4KCkFja2VkLWJ5OiBKYW4g
QmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVs
