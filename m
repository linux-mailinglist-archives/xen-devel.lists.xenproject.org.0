Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C65D750F9
	for <lists+xen-devel@lfdr.de>; Thu, 25 Jul 2019 16:25:22 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hqedx-0005Oy-9y; Thu, 25 Jul 2019 14:22:53 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=HEBQ=VW=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hqedv-0005Ot-Pz
 for xen-devel@lists.xenproject.org; Thu, 25 Jul 2019 14:22:51 +0000
X-Inumbo-ID: ae74fce1-aee7-11e9-8980-bc764e045a96
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTP
 id ae74fce1-aee7-11e9-8980-bc764e045a96;
 Thu, 25 Jul 2019 14:22:49 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B006728;
 Thu, 25 Jul 2019 07:22:49 -0700 (PDT)
Received: from [10.1.196.50] (e108454-lin.cambridge.arm.com [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DBEC03F71F;
 Thu, 25 Jul 2019 07:22:48 -0700 (PDT)
To: Amit Tomer <amittomer25@gmail.com>, xen-devel@lists.xenproject.org
References: <1559938596-5696-1-git-send-email-amittomer25@gmail.com>
 <CABHD4K87Z8QWtga6+FmkFXzJcot+WHH4KS7x-g1wOir8V2-tcQ@mail.gmail.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <44094e19-48c6-8281-4e04-2b2a24db98db@arm.com>
Date: Thu, 25 Jul 2019 15:22:47 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CABHD4K87Z8QWtga6+FmkFXzJcot+WHH4KS7x-g1wOir8V2-tcQ@mail.gmail.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [RFC PATCH 0/2] XEN booting on i.MX8M platform
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
Cc: Andre Przywara <andre.przywara@arm.com>, peng.fan@nxp.com,
 Stefano Stabellini <sstabellini@kernel.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjUvMDcvMjAxOSAxNToxNSwgQW1pdCBUb21lciB3cm90ZToKPiBIaSwKCkhpLAoKPiBPbiBT
YXQsIEp1biA4LCAyMDE5IGF0IDE6NDYgQU0gQW1pdCBTaW5naCBUb21hciA8YW1pdHRvbWVyMjVA
Z21haWwuY29tPiB3cm90ZToKPj4KPj4gVGhpcyBzZXJpZXMgdHJpZXMgdG8gZW5hYmxlIFhFTiBi
b290aW5nIG9uIGkuTVggOE1RdWFkIEFwcGxpY2F0aW9ucyBQcm9jZXNzb3JzWzFdLgo+Pgo+PiBQ
YXRjaC1zZXQgaW5jbHVkZXMgZHJpdmVyIGZvciBVQVJUIGNvbnRyb2xsZXIgZm91bmQgb24gaS5N
WDhNUSBTb0MgYW5kIGRlYnVnIGNvZGUKPj4gZm9yIGVhcmx5cHJpbnRrIHN1cHBvcnQuCj4+Cj4g
R2VudGxlIFBpbmcuCgpUaGlzIGlzIGluIG15IGxvbmcgbGlzdCBvZiBwYXRjaGVzIHRvIHJldmll
dyBhbmQgd29yayB0byBkby4gQW55IGhlbHAgdG8gcmVkdWNlIAp0aGUgbGlzdCB3aWxsIG1lYW4g
SSBjYW4gcmVhY2ggeW91ciBzZXJpZXMgcXVpY2tlci4uLgoKSSBoYXZlIHNlZW4gbXVsdGlwbGUg
dGhyZWFkcyBmcm9tIHlvdSBwb2ludGluZyBhdCBpc3N1ZXMgb24gdGhlIElNWC44LiBIYXZlIHRo
ZXkgCmJlZW4gcmVzb2x2ZWQ/IElzIHRoaXMgc2VyaWVzIGVub3VnaCB0byBnZXQgWGVuIGFuZCBE
b20wIGJvb3Rpbmcgb24gdGhlIE5YUCAKcGxhdGZvcm0/CgpDaGVlcnMsCgotLSAKSnVsaWVuIEdy
YWxsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4t
ZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczov
L2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
