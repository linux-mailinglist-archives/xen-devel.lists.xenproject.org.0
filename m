Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 43B4477414
	for <lists+xen-devel@lfdr.de>; Sat, 27 Jul 2019 00:38:24 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hr8ni-00081F-VK; Fri, 26 Jul 2019 22:34:58 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ymAH=VX=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hr8nh-00081A-Jv
 for xen-devel@lists.xenproject.org; Fri, 26 Jul 2019 22:34:57 +0000
X-Inumbo-ID: 975d07e6-aff5-11e9-ba89-ff4633e55e2b
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 975d07e6-aff5-11e9-ba89-ff4633e55e2b;
 Fri, 26 Jul 2019 22:34:55 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2525E337;
 Fri, 26 Jul 2019 15:34:55 -0700 (PDT)
Received: from [10.37.8.53] (unknown [10.37.8.53])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E73483F71F;
 Fri, 26 Jul 2019 15:34:53 -0700 (PDT)
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20190726210854.6408-1-andrew.cooper3@citrix.com>
 <20190726210854.6408-5-andrew.cooper3@citrix.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <45b06e2f-a51a-c6a7-33aa-530da9f3d67d@arm.com>
Date: Fri, 26 Jul 2019 23:34:52 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190726210854.6408-5-andrew.cooper3@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 4/4] xen/percpu: Make DECLARE_PER_CPU() and
 __DEFINE_PER_CPU() common
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
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Wei Liu <wl@xen.org>,
 Jan Beulich <JBeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgQW5kcmV3LAoKT24gNy8yNi8xOSAxMDowOCBQTSwgQW5kcmV3IENvb3BlciB3cm90ZToKPiBU
aGVzZSBtYWNyb3MgYXJlIGlkZW50aWNhbCBhY3Jvc3MgdGhlIGFyY2hpdGVjdHVyZXMsIGFuZCBz
aG91bGRuJ3QgYmUgc2VwYXJhdGUKPiBmcm9tIHRoZSBERUZJTkVfUEVSX0NQVSooKSBpbmZyYXN0
cnVjdHVyZS4KPiAKPiBUaGlzIGNvbnZlcnRzIHRoZSBmaW5hbCBhc20vcGVyY3B1LmggaW5jbHVk
ZXMsIHdoaWNoIHdlcmUgYWxsIHVzaW5nCj4gREVDTEFSRV9QRVJfQ1BVKCksIHRvIGluY2x1ZGUg
eGVuL3BlcmNwdS5oIGluc3RlYWQuCj4gCj4gU2lnbmVkLW9mZi1ieTogQW5kcmV3IENvb3BlciA8
YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4KCkFja2VkLWJ5OiBKdWxpZW4gR3JhbGwgPGp1bGll
bi5ncmFsbEBhcm0uY29tPgoKQ2hlZXJzLAoKLS0gCkp1bGllbiBHcmFsbAoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlz
dApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
