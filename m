Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 65B4010A1CA
	for <lists+xen-devel@lfdr.de>; Tue, 26 Nov 2019 17:17:45 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iZdUq-0004Nq-2Y; Tue, 26 Nov 2019 16:15:24 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=/0/a=ZS=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1iZdUo-0004Ng-4D
 for xen-devel@lists.xenproject.org; Tue, 26 Nov 2019 16:15:22 +0000
X-Inumbo-ID: f1c01d72-1067-11ea-9db0-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f1c01d72-1067-11ea-9db0-bc764e2007e4;
 Tue, 26 Nov 2019 16:15:21 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id EA39ABA81
 for <xen-devel@lists.xenproject.org>; Tue, 26 Nov 2019 16:15:20 +0000 (UTC)
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <5d4b95d1-7e70-ea94-4291-3e2f4df621b5@suse.com>
Date: Tue, 26 Nov 2019 17:15:20 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
Content-Language: en-US
Subject: [Xen-devel] 4.13 Release blockers
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SW4gb3JkZXIgdG8gYmUgYWJsZSB0byByZWxlYXNlIFhlbiA0LjEzIHdlIG5lZWQgdG8gZ2V0IGFs
bCByZWdyZXNzaW9ucwpmaXhlZCByYXRoZXIgc29vbi4gSSBrbm93IHRoZXJlIGFyZSBxdWl0ZSBz
b21lIHBhdGNoZXMgd2FpdGluZyB0byBiZQp0YWtlbiBmb3IgNC4xMy4KClNvIHBsZWFzZSwgZG9u
J3QgdGFnIGFueSBmdXJ0aGVyIHBhdGNoZXMgYXMgImZvciA0LjEzIiBpZiB0aGV5IGFyZSBub3QK
Zml4aW5nIGVpdGhlcjoKCi0gYSByZWdyZXNzaW9uIGludHJvZHVjZWQgc2luY2UgNC4xMgotIGEg
c2V2ZXJlIGJ1ZyBvZiBhIDQuMTMgZmVhdHVyZQoKSSdkIGxpa2UgdG8gYXNrIGFsbCBwYXRjaCBh
dXRob3JzIHdobyBoYXZlIHBlbmRpbmcgcGF0Y2hlcyAiZm9yIDQuMTMiCnRvIHJlcGx5IHRvIHRo
ZWlyIHBhdGNoZXMgY2xlYXJseSBzdGF0aW5nIHdoZXRoZXIgdGhlIHBhdGNoIHF1YWxpZmllcwpm
b3IgNC4xMyByZWdhcmRpbmcgYWJvdmUgcnVsZXMuCgpGb3IgYW55IHN1Y2ggcGVuZGluZyBwYXRj
aGVzIEknZCBsaWtlIHRoZSBtYWludGFpbmVycyB0byByZXZpZXcgdGhvc2UKcGF0Y2hlcyBhdCBo
aWdoIHByaW9yaXR5LgoKCkp1ZXJnZW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5m
by94ZW4tZGV2ZWw=
