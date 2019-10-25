Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D6252E50FB
	for <lists+xen-devel@lfdr.de>; Fri, 25 Oct 2019 18:14:57 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iO2Cg-00040E-HX; Fri, 25 Oct 2019 16:12:42 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=AepH=YS=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1iO2Cf-000409-3Z
 for xen-devel@lists.xenproject.org; Fri, 25 Oct 2019 16:12:41 +0000
X-Inumbo-ID: 4441a14a-f742-11e9-94ca-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 4441a14a-f742-11e9-94ca-12813bfff9fa;
 Fri, 25 Oct 2019 16:12:40 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 4B589B6AC;
 Fri, 25 Oct 2019 16:12:39 +0000 (UTC)
To: Ian Jackson <ian.jackson@eu.citrix.com>, xen-devel@lists.xenproject.org
References: <20191025154819.26593-1-ian.jackson@eu.citrix.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <04d3c2f7-2b3d-cb26-6d9d-9b77cfa94ff1@suse.com>
Date: Fri, 25 Oct 2019 18:12:38 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <20191025154819.26593-1-ian.jackson@eu.citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [OSSTEST PATCH 1/5] make-flight: Rework
 arch_branch_filter_callback slightly
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

T24gMjUuMTAuMTkgMTc6NDgsIElhbiBKYWNrc29uIHdyb3RlOgo+IE5vdyB3ZSBoYXZlIHR3byBs
aXN0cyBvZiB0aGluZ3Mgbm90IHN1cHBvcnRlZCBvbiBBUk06IG9uZSBvZiBicmFuY2hlcwo+IHdo
ZXJlIHRoYXQncyBpbmhlcmVudCBpbiB0aGUgYnJhbmNoIHNvbWVob3csIGFuZCBvbmUgZm9yIHRo
b3NlIHdoZXJlCj4gdGhlIGtlcm5lbCBpcyBzaW1wbHkgdG9vIG9sZC4gIFRoZSBsYXR0ZXIgYXJl
IGdvaW5nIHRvIGRpZmZlciBiZXR3ZWVuCj4gYXJtaGYgYW5kIGFybTY0Lgo+IAo+IE5vIGZ1bmN0
aW9uYWwgY2hhbmdlLgo+IChWZXJpZmllZCB3aXRoIHN0YW5kYWxvbmUtZ2VuZXJhdGUtZHVtcC1m
bGlnaHQtcnVudmFycy4pCj4gCj4gU2lnbmVkLW9mZi1ieTogSWFuIEphY2tzb24gPGlhbi5qYWNr
c29uQGV1LmNpdHJpeC5jb20+CgpGb3IgdGhlIGNvbXBsZXRlIHNlcmllczoKClJlbGVhc2UtYWNr
ZWQtYnk6IEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4KCgpKdWVyZ2VuCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGlu
ZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnBy
b2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
