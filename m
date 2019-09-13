Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 62922B1827
	for <lists+xen-devel@lfdr.de>; Fri, 13 Sep 2019 08:17:28 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i8epx-0000VO-NF; Fri, 13 Sep 2019 06:13:41 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=f4Vg=XI=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1i8epw-0000VG-De
 for xen-devel@lists.xenproject.org; Fri, 13 Sep 2019 06:13:40 +0000
X-Inumbo-ID: a045dbbc-d5ed-11e9-978d-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a045dbbc-d5ed-11e9-978d-bc764e2007e4;
 Fri, 13 Sep 2019 06:13:38 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id F36BCB634;
 Fri, 13 Sep 2019 06:13:37 +0000 (UTC)
To: Juergen Gross <jgross@suse.com>
References: <20190913054435.3662-1-jgross@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <0c0cbcdb-cf4c-620e-0d77-b249017c167e@suse.com>
Date: Fri, 13 Sep 2019 08:13:34 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20190913054435.3662-1-jgross@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] xen: fix arm build with debugtrace
 configured
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
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTMuMDkuMjAxOSAwNzo0NCwgSnVlcmdlbiBHcm9zcyB3cm90ZToKPiBBZGQgbWlzc2luZyAj
aW5jbHVkZXMuCj4gCj4gU2lnbmVkLW9mZi1ieTogSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2Uu
Y29tPgoKQWNrZWQtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KCkFsYmVpdCBm
b3IgdGhlIGZ1dHVyZSBpdCB3b3VsZCBiZSBuaWNlIGlmIHRoZSBjb25uZWN0aW9uIHRvIHRoZQph
Y3R1YWwgYnJlYWthZ2Ugd2FzIGVzdGFibGlzaGVkIGluIHRoZSBkZXNjcmlwdGlvbiwgYnkgbWVu
dGlvbmluZwp0aGUgb2ZmZW5kaW5nIGNvbW1pdCBhbmQvb3IgYnkgbmFtaW5nIHRoZSBzcGVjaWZp
YyBidWlsZCBwcm9ibGVtLgoKSmFuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5w
cm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8v
eGVuLWRldmVs
