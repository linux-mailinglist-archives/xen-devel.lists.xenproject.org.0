Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 56148D1F77
	for <lists+xen-devel@lfdr.de>; Thu, 10 Oct 2019 06:22:35 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iIPv6-00027Q-G0; Thu, 10 Oct 2019 04:19:20 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=E5Al=YD=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1iIPv4-00027L-Tq
 for xen-devel@lists.xenproject.org; Thu, 10 Oct 2019 04:19:18 +0000
X-Inumbo-ID: 1fe7afc7-eb15-11e9-97fb-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1fe7afc7-eb15-11e9-97fb-12813bfff9fa;
 Thu, 10 Oct 2019 04:19:17 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id BB4EFAF35;
 Thu, 10 Oct 2019 04:19:16 +0000 (UTC)
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20191009182114.9376-1-andrew.cooper3@citrix.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <d396f2da-ea5f-751c-f059-e3760c16703b@suse.com>
Date: Thu, 10 Oct 2019 06:19:15 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <20191009182114.9376-1-andrew.cooper3@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] x86/hvm: Fix the use of "hap=0" following
 c/s c0902a9a143a
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
Cc: Paul Durrant <paul@xen.org>, Wei Liu <wl@xen.org>,
 Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDkuMTAuMTkgMjA6MjEsIEFuZHJldyBDb29wZXIgd3JvdGU6Cj4gYy9zIGMwOTAyYTlhMTQz
YSByZWZhY3RvcmVkIGh2bV9lbmFibGUoKSBhIGxpdHRsZSwgYnV0IGRyb3BwZWQgdGhlIGxvZ2lj
IHdoaWNoCj4gY2xlYXJlZCBoYXBfc3VwcG9ydGVkIGluIHRoZSBjYXNlIHRoYXQgdGhlIHVzZXIg
aGFkIGFza2VkIGZvciBpdCBvZmYuCj4gCj4gVGhpcyByZXN1bHRzIGluIFhlbiBib290aW5nIHVw
LCBjbGFpbWluZzoKPiAKPiAgICAoWEVOKSBIVk06IEhhcmR3YXJlIEFzc2lzdGVkIFBhZ2luZyAo
SEFQKSBkZXRlY3RlZCBidXQgZGlzYWJsZWQKPiAKPiBidXQgd2l0aCBIQVAgYWR2ZXJ0aXNlZCB2
aWEgc3lzY3RsLCBhbmQgWEVOX0RPTUNUTF9DREZfaGFwIGJlaW5nIGFjY2VwdGVkIGluCj4gZG9t
YWluX2NyZWF0ZSgpLgo+IAo+IFNpZ25lZC1vZmYtYnk6IEFuZHJldyBDb29wZXIgPGFuZHJldy5j
b29wZXIzQGNpdHJpeC5jb20+CgpSZWxlYXNlLWFja2VkLWJ5OiBKdWVyZ2VuIEdyb3NzIDxqZ3Jv
c3NAc3VzZS5jb20+CgoKSnVlcmdlbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L3hlbi1kZXZlbA==
