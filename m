Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D2E3084B15
	for <lists+xen-devel@lfdr.de>; Wed,  7 Aug 2019 13:55:31 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hvKVU-0003rc-Ec; Wed, 07 Aug 2019 11:53:28 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=0f/x=WD=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hvKVS-0003rX-NM
 for xen-devel@lists.xenproject.org; Wed, 07 Aug 2019 11:53:26 +0000
X-Inumbo-ID: f652db71-b909-11e9-8980-bc764e045a96
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id f652db71-b909-11e9-8980-bc764e045a96;
 Wed, 07 Aug 2019 11:53:25 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 972A9AF25;
 Wed,  7 Aug 2019 11:53:24 +0000 (UTC)
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <20190807113439.12802-1-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <cbe2a4ff-614b-7236-dad8-6c19db706c47@suse.com>
Date: Wed, 7 Aug 2019 13:53:25 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190807113439.12802-1-andrew.cooper3@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] x86/boot: Set Accessed bits in boot_cpu_{,
 compat_}gdt_table[]
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDcuMDguMjAxOSAxMzozNCwgQW5kcmV3IENvb3BlciB3cm90ZToKPiBUaGVyZSBpcyBubyBw
b2ludCBjYXVzaW5nIHRoZSBDUFUgdG8gcGVyZm9ybWVkIGEgbG9ja2VkIHVwZGF0ZSBvZiB0aGUK
PiBkZXNjcmlwdG9ycyBvbiBmaXJzdCB1c2UuCj4gCj4gUmVwb3J0ZWQtYnk6IEphbiBCZXVsaWNo
IDxqYmV1bGljaEBzdXNlLmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiBBbmRyZXcgQ29vcGVyIDxhbmRy
ZXcuY29vcGVyM0BjaXRyaXguY29tPgoKUmV2aWV3ZWQtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGlj
aEBzdXNlLmNvbT4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
Cmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
