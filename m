Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C42D315031B
	for <lists+xen-devel@lfdr.de>; Mon,  3 Feb 2020 10:16:18 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iyXmA-00078m-Bh; Mon, 03 Feb 2020 09:12:14 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=jVpM=3X=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1iyXm9-00078h-Ks
 for xen-devel@lists.xenproject.org; Mon, 03 Feb 2020 09:12:13 +0000
X-Inumbo-ID: 42b2c256-4665-11ea-8e3e-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 42b2c256-4665-11ea-8e3e-12813bfff9fa;
 Mon, 03 Feb 2020 09:12:12 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 9A407ADFF;
 Mon,  3 Feb 2020 09:12:10 +0000 (UTC)
To: Wei Liu <wl@xen.org>
References: <20200121084330.18309-1-jgross@suse.com>
 <20200121084330.18309-5-jgross@suse.com>
 <20200131155043.d4a2rwarveiynl6t@debian>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <25a37009-d29c-3061-7c3b-184cbacf3227@suse.com>
Date: Mon, 3 Feb 2020 10:12:08 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <20200131155043.d4a2rwarveiynl6t@debian>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v3 4/9] xen: add basic hypervisor filesystem
 support
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, xen-devel@lists.xenproject.org,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMzEuMDEuMjAgMTY6NTAsIFdlaSBMaXUgd3JvdGU6Cj4gT24gVHVlLCBKYW4gMjEsIDIwMjAg
YXQgMDk6NDM6MjVBTSArMDEwMCwgSnVlcmdlbiBHcm9zcyB3cm90ZToKPiBbLi4uXQo+PiBkaWZm
IC0tZ2l0IGEveGVuL2NvbW1vbi9oeXBmcy5jIGIveGVuL2NvbW1vbi9oeXBmcy5jCj4+IG5ldyBm
aWxlIG1vZGUgMTAwNjQ0Cj4+IGluZGV4IDAwMDAwMDAwMDAuLjY3NjJkMjBkZmQKPj4gLS0tIC9k
ZXYvbnVsbAo+PiArKysgYi94ZW4vY29tbW9uL2h5cGZzLmMKPj4gQEAgLTAsMCArMSwzNjUgQEAK
Pj4gKy8qKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioq
KioqKioqKioqKioqKioqKioqKioqKioqKioKPj4gKyAqCj4+ICsgKiBoeXBmcy5jCj4+ICsgKgo+
PiArICogU2ltcGxlIHN5c2ZzLWxpa2UgZmlsZSBzeXN0ZW0gZm9yIHRoZSBoeXBlcnZpc29yLgo+
PiArICovCj4+ICsKPj4gKyNpbmNsdWRlIDx4ZW4vbGliLmg+Cj4gCj4gVGhpcyBzaG91bGQgY29t
ZSBhZnRlciBoeXBmcy5oLgo+IAo+IElmIGl0IGhhcyBjb21lIGZpcnN0IGl0IHByb2JhYmx5IG1l
YW5zIG9uZSBvZiB0aGUgaGVhZGVycyBiZWxvdyBoYXNuJ3QKPiBpbmNsdWRlZCBpdCBwcm9wZXJs
eT8KCkknbGwgbW92ZSBpdCwgYXMgdGhlIGJ1aWxkIHdpbGwgc3RpbGwgYmUgZmluZS4KCgpKdWVy
Z2VuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4t
ZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczov
L2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
