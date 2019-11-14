Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 171F0FC6F1
	for <lists+xen-devel@lfdr.de>; Thu, 14 Nov 2019 14:09:19 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iVEov-00073V-Qw; Thu, 14 Nov 2019 13:05:57 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=RDJJ=ZG=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1iVEot-00073Q-NT
 for xen-devel@lists.xenproject.org; Thu, 14 Nov 2019 13:05:55 +0000
X-Inumbo-ID: 7daab38e-06df-11ea-a24b-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 7daab38e-06df-11ea-a24b-12813bfff9fa;
 Thu, 14 Nov 2019 13:05:54 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 8575CACA0;
 Thu, 14 Nov 2019 13:05:53 +0000 (UTC)
To: Jan Beulich <jbeulich@suse.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>
References: <a83f42ad-c380-c07f-7d22-7f19107db5d5@suse.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <51e9faaf-cfae-7a48-2fd9-56d034ba0064@suse.com>
Date: Thu, 14 Nov 2019 14:05:52 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <a83f42ad-c380-c07f-7d22-7f19107db5d5@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 0/3] xen/mcelog: assorted adjustments
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 lkml <linux-kernel@vger.kernel.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTEuMTEuMTkgMTU6NDMsIEphbiBCZXVsaWNoIHdyb3RlOgo+IFRoZSAxc3QgY2hhbmdlIGlz
IHNpbXBsZSBjbGVhbnVwLCBub3RpY2VkIHdoaWxlIHByZXBhcmluZyBmb3IgdGhlCj4gMm5kIHBh
dGNoLCB3aGljaCBwcmVzZW50cyB0aGUgY29uc3VtZXIgb2YgdGhlIGludGVyZmFjZSBleHRlbnNp
b24KPiBwcm9wb3NlZCBpbgo+IGh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvYXJjaGl2ZXMv
aHRtbC94ZW4tZGV2ZWwvMjAxOS0xMS9tc2cwMDM3Ny5odG1sLgo+IFRoZSAzcmQgcGF0Y2ggaXMg
c29ydCBvZiBvcHRpb25hbCwgY29uc2lkZXJpbmcgdGhhdCAzMi1iaXQgWGVuCj4gc3VwcG9ydCBp
cyBzbGF0ZWQgdG8gYmUgcGhhc2VkIG91dCBvZiB0aGUga2VybmVsLgo+IAo+IDE6IGRyb3AgX19N
Q19NU1JfTUNHQ0FQCj4gMjogYWRkIFBQSU4gdG8gcmVjb3JkIHdoZW4gYXZhaWxhYmxlCj4gMzog
YWxzbyBhbGxvdyBidWlsZGluZyBmb3IgMzItYml0IGtlcm5lbHMKClB1c2hlZCB0aGUgc2VyaWVz
IHRvIHhlbi90aXAuZ2l0IGZvci1saW51cy01LjVhCgoKSnVlcmdlbgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApY
ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
