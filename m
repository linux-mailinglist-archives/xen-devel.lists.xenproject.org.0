Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 579D64CDC5
	for <lists+xen-devel@lfdr.de>; Thu, 20 Jun 2019 14:32:06 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hdwCC-0007q1-2s; Thu, 20 Jun 2019 12:29:40 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=1Q6/=UT=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hdwCB-0007pw-2e
 for xen-devel@lists.xenproject.org; Thu, 20 Jun 2019 12:29:39 +0000
X-Inumbo-ID: 11337ecf-9357-11e9-8980-bc764e045a96
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTP
 id 11337ecf-9357-11e9-8980-bc764e045a96;
 Thu, 20 Jun 2019 12:29:37 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EC18B360;
 Thu, 20 Jun 2019 05:29:36 -0700 (PDT)
Received: from [10.37.9.222] (unknown [10.37.9.222])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7CABD3F718;
 Thu, 20 Jun 2019 05:29:35 -0700 (PDT)
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <1560975087-25632-1-git-send-email-andrew.cooper3@citrix.com>
 <1560975087-25632-5-git-send-email-andrew.cooper3@citrix.com>
 <efda4435-f685-7830-4f58-1b62d062fab5@arm.com>
 <f898001f-3cf2-699d-6bd6-cb527c87c863@citrix.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <f8cb1913-be53-7916-63c2-a2b33aa2ccea@arm.com>
Date: Thu, 20 Jun 2019 13:29:34 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <f898001f-3cf2-699d-6bd6-cb527c87c863@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 4/4] xen/link: Misc cleanup
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
 Jan Beulich <JBeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgQW5kcmV3LAoKT24gNi8xOS8xOSAxMDozOCBQTSwgQW5kcmV3IENvb3BlciB3cm90ZToKPiBP
biAxOS8wNi8yMDE5IDIyOjMwLCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4+IEhpLAo+Pgo+PiBPbiA2
LzE5LzE5IDk6MTEgUE0sIEFuZHJldyBDb29wZXIgd3JvdGU6Cj4+PiAgwqAgKiBEcm9wIC5nbnUu
d2FybmluZy7CoCBYZW4sIG5vdCBiZWluZyBhIGxpYnJhcnksIGhhcyBubyBuZWVkIGZvcgo+Pj4g
IMKgwqDCoCBfX2F0dHJpYnV0ZV9fKChfX3dhcm5pbmdfXygic3RyIikpKSBhbmQgaXNuJ3QgbGlh
YmxlIHRvIGV2ZXIgZ2Fpbgo+Pj4gc3VjaAo+Pj4gIMKgwqDCoCBhbm5vdGF0aW9ucyBmb3IgbGlu
ayB0aW1lIHdhcm5pbmdzLgo+Pgo+PiBXaGF0IGlmIHRoaXMgaXMgaW50cm9kdWNlZD8KPiAKPiBU
aGVuIGF0dGVtcHRpbmcgdG8gbGluayBYZW4gYXMgYSBsaWJyYXJ5IGFnYWluc3QgYW5vdGhlciBv
YmplY3QgZmlsZQo+IHdvbid0IGVtaXQgdGhlIGN1c3RvbSBsaW5rZXIgd2FybmluZy4KCk9rLCBz
byBpdCBpcyBub3QgbGlrZSBYZW4gd2lsbCBjcmFzaC4KCj4gSXRzIG1haW4gdXNlIGlzIGZvciBw
aGFzZS1vdXQgb2YgcHJvYmxlbWF0aWMgQVBJJ3MsIGJ1dCBmb3IgWGVuIChhbmQKPiBvdGhlciBz
dGFuZGFsb25lIGJpbmFyaWVzKSB3ZSBkbyB0aGF0IGJ5IHJlcGxhY2luZyBwcm9ibGVtYXRpYyBm
dW5jdGlvbnMKPiBlbnRpcmVseS4KPj4gSG93IGRvIHdlIGNhdGNoIGl0Pwo+IAo+IENvZGUgcmV2
aWV3PwoKSSB1c3VhbGx5IHF1aXRlIGxpa2Ugd2hlbiB0aGUgdG9vbHMgaGVscCB1cyB0byBjYXRj
aCBzdWNoIGlzc3VlIDopLgoKQW55d2F5LCBhcyB0aGlzIGlzIG5vdCBvdmVybHkgY3JpdGljYWw6
CgpBY2tlZC1ieTogSnVsaWVuIEdyYWxsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4KCkNoZWVycywK
Ci0tIApKdWxpZW4gR3JhbGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4t
ZGV2ZWw=
