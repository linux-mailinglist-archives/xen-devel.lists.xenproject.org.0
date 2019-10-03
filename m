Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ED872C9919
	for <lists+xen-devel@lfdr.de>; Thu,  3 Oct 2019 09:41:34 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iFvfu-0007EE-5W; Thu, 03 Oct 2019 07:37:22 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=P3td=X4=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1iFvft-0007E9-9l
 for xen-devel@lists.xenproject.org; Thu, 03 Oct 2019 07:37:21 +0000
X-Inumbo-ID: a0ef45bc-e5b0-11e9-bf31-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by localhost (Halon) with ESMTPS
 id a0ef45bc-e5b0-11e9-bf31-bc764e2007e4;
 Thu, 03 Oct 2019 07:37:19 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 29B41AEF9;
 Thu,  3 Oct 2019 07:37:18 +0000 (UTC)
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Julien Grall <julien.grall@arm.com>, xen-devel@lists.xenproject.org
References: <20191002180047.17144-1-julien.grall@arm.com>
Message-ID: <0a4347e5-da41-ce48-7d5f-864dc3101d9e@suse.com>
Date: Thu, 3 Oct 2019 09:37:16 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20191002180047.17144-1-julien.grall@arm.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH for-4.13 0/6] xen/arm: Add support to build
 with clang
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
Cc: Artem_Mygaiev@epam.com, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDIuMTAuMTkgMjA6MDAsIEp1bGllbiBHcmFsbCB3cm90ZToKPiBIaSBhbGwsCj4gCj4gQWZ0
ZXIgdGhpcyBzZXJpZXMsIEkgYW0gYWJsZSB0byBidWlsZCBYZW4gb24gQXJtNjQgd2l0aCBjbGFu
ZyA3LjAuIFRoZXJlCj4gYXJlIHN0aWxsIHNvbWUgaXNzdWVzIHdoZW4gYnVpbGRpbmcgWGVuIG9u
IEFybTMyIGFuZCBhbHNvIHVzaW5nIGxsZC4KPiAKPiBDcm9zcy1jb21waWxhdGlvbiBpcyBsZWZ0
IG91dHNpZGUgZm9yIG5vdywgYnV0IHRoaXMgaXMgc3RpbGwgYSBnb29kIHN0YXJ0Cj4gZm9yIGNs
YW5nIChhbmQgYXJtY2xhbmcpLgo+IAo+IENoZWVycywKPiAKPiBKdWxpZW4gR3JhbGwgKDYpOgo+
ICAgIHhlbi9hcm06IGZpeCBnZXRfY3B1X2luZm8oKSB3aGVuIGJ1aWx0IHdpdGggY2xhbmcKPiAg
ICB4ZW4vYXJtNjQ6IGJpdG9wczogTWF0Y2ggdGhlIHJlZ2lzdGVyIHNpemUgd2l0aCB0aGUgdmFs
dWUgc2l6ZSBpbiBmbHNsCj4gICAgeGVuL2FybTogY3B1ZXJyYXRhOiBNYXRjaCByZWdpc3RlciBz
aXplIHdpdGggdmFsdWUgc2l6ZSBpbgo+ICAgICAgY2hlY2tfd29ya2Fyb3VuZF8qCj4gICAgeGVu
L2FybTogY3B1ZmVhdHVyZTogTWF0Y2ggcmVnaXN0ZXIgc2l6ZSB3aXRoIHZhbHVlIHNpemUgaW4K
PiAgICAgIGNwdXNfaGF2ZV9jb25zdF9jYXAKPiAgICB4ZW4vYXJtOiBtbTogTWFyayBjaGVja19t
ZW1vcnlfbGF5b3V0X2FsaWdubWVudF9jb25zdHJhaW50cyBhcyB1bnVzZWQKPiAgICB4ZW4vYXJt
OiB0cmFwczogTWFyayBjaGVja19zdGFja19hbGlnbm1lbnRfY29uc3RyYWludHMgYXMgdW51c2Vk
CgpGb3IgdGhlIHNlcmllczoKClJlbGVhc2UtYWNrZWQtYnk6IEp1ZXJnZW4gR3Jvc3MgPGpncm9z
c0BzdXNlLmNvbT4KCgpKdWVyZ2VuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5w
cm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8v
eGVuLWRldmVs
