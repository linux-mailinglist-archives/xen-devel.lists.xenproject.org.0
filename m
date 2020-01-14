Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3215813ADEF
	for <lists+xen-devel@lfdr.de>; Tue, 14 Jan 2020 16:45:18 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1irOLJ-0007E7-Hf; Tue, 14 Jan 2020 15:42:57 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=2XF3=3D=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1irOLI-0007E1-CE
 for xen-devel@lists.xenproject.org; Tue, 14 Jan 2020 15:42:56 +0000
X-Inumbo-ID: 85c23a12-36e4-11ea-83e7-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 85c23a12-36e4-11ea-83e7-12813bfff9fa;
 Tue, 14 Jan 2020 15:42:51 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id F262EADFF;
 Tue, 14 Jan 2020 15:42:50 +0000 (UTC)
To: Jan Beulich <jbeulich@suse.com>
References: <20200108152328.27194-1-jgross@suse.com>
 <20200108152328.27194-4-jgross@suse.com>
 <07d8090e-bec9-e175-7f21-395080031115@suse.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <54e852b3-b938-b0c2-b691-95649e6f0bcb@suse.com>
Date: Tue, 14 Jan 2020 16:42:50 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <07d8090e-bec9-e175-7f21-395080031115@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v2 3/9] xen/sched: cleanup sched.h
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
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <george.dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Dario Faggioli <dfaggioli@suse.com>,
 xen-devel@lists.xenproject.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTQuMDEuMjAgMTY6MzgsIEphbiBCZXVsaWNoIHdyb3RlOgo+IE9uIDA4LjAxLjIwMjAgMTY6
MjMsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6Cj4+IC0tLSBhL3hlbi9jb21tb24vc2NoZWQvcHJpdmF0
ZS5oCj4+ICsrKyBiL3hlbi9jb21tb24vc2NoZWQvcHJpdmF0ZS5oCj4+IEBAIC01MzMsNiArNTMz
LDcgQEAgc3RhdGljIGlubGluZSB2b2lkIHNjaGVkX3VuaXRfdW5wYXVzZShjb25zdCBzdHJ1Y3Qg
c2NoZWRfdW5pdCAqdW5pdCkKPj4gICBzdHJ1Y3QgY3B1cG9vbAo+PiAgIHsKPj4gICAgICAgaW50
ICAgICAgICAgICAgICBjcHVwb29sX2lkOwo+PiArI2RlZmluZSBDUFVQT09MSURfTk9ORSAgICAt
MQo+IAo+IFdvdWxkIHlvdSBtaW5kIHRha2luZyB0aGUgb3Bwb3J0dW5pdHkgYW5kIGdpdmluZyB0
aGlzIHRoZQo+IHBhcmVudGhlc2VzIGl0IGhhcyBiZWVuIGxhY2tpbmc/CgpZZXMsIG9mIGNvdXJz
ZS4KCgpKdWVyZ2VuCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5v
cmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZl
bA==
