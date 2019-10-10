Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E94D8D223D
	for <lists+xen-devel@lfdr.de>; Thu, 10 Oct 2019 10:02:30 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iITJ8-0005WU-8N; Thu, 10 Oct 2019 07:56:22 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=E5Al=YD=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1iITJ7-0005WP-9j
 for xen-devel@lists.xenproject.org; Thu, 10 Oct 2019 07:56:21 +0000
X-Inumbo-ID: 71cb7ad4-eb33-11e9-9bee-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 71cb7ad4-eb33-11e9-9bee-bc764e2007e4;
 Thu, 10 Oct 2019 07:56:20 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id ADE86B2AE;
 Thu, 10 Oct 2019 07:56:18 +0000 (UTC)
To: Igor Druzhinin <igor.druzhinin@citrix.com>, xen-devel@lists.xenproject.org
References: <1570653603-9889-1-git-send-email-igor.druzhinin@citrix.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <6eb26fab-3978-5c94-8a40-774c37582352@suse.com>
Date: Thu, 10 Oct 2019 09:56:15 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <1570653603-9889-1-git-send-email-igor.druzhinin@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH for-4.13 v2 0/3] EFI GOP fixes
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
Cc: andrew.cooper3@citrix.com, wl@xen.org, Jan Beulich <jbeulich@suse.com>,
 roger.pau@citrix.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDkuMTAuMTkgMjI6NDAsIElnb3IgRHJ1emhpbmluIHdyb3RlOgo+IElnb3IgRHJ1emhpbmlu
ICgzKToKPiAgICBlZmkvYm9vdDogYWRkIG1pc3NpbmcgcG9pbnRlciBkZXJlZmVyZW5jZSBpbiBz
ZXRfY29sb3IKPiAgICB4ODYvZWZpOiBwcm9wZXJseSBoYW5kbGUgMCBpbiBwaXhlbCByZXNlcnZl
ZCBiaXRtYXNrCj4gICAgZWZpL2Jvb3Q6IG1ha2Ugc3VyZSBncmFwaGljcyBtb2RlIGlzIHNldCB3
aGlsZSBib290aW5nIHRocm91Z2ggTUIyCj4gCj4gICB4ZW4vYXJjaC94ODYvZWZpL2VmaS1ib290
LmggfCAxMiArKysrKysrKystLS0KPiAgIHhlbi9jb21tb24vZWZpL2Jvb3QuYyAgICAgICB8IDEw
ICsrKysrKystLS0KPiAgIDIgZmlsZXMgY2hhbmdlZCwgMTYgaW5zZXJ0aW9ucygrKSwgNiBkZWxl
dGlvbnMoLSkKPiAKCkZvciB0aGUgc2VyaWVzOgoKUmVsZWFzZS1hY2tlZC1ieTogSnVlcmdlbiBH
cm9zcyA8amdyb3NzQHN1c2UuY29tPgoKCkp1ZXJnZW4KCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1h
bi9saXN0aW5mby94ZW4tZGV2ZWw=
