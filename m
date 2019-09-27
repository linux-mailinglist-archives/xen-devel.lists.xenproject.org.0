Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 707A8C048E
	for <lists+xen-devel@lfdr.de>; Fri, 27 Sep 2019 13:45:53 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iDoea-0000XO-CG; Fri, 27 Sep 2019 11:43:16 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Rbpq=XW=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1iDoeY-0000XA-Vj
 for xen-devel@lists.xenproject.org; Fri, 27 Sep 2019 11:43:15 +0000
X-Inumbo-ID: fd17242a-e11b-11e9-9676-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by localhost (Halon) with ESMTPS
 id fd17242a-e11b-11e9-9676-12813bfff9fa;
 Fri, 27 Sep 2019 11:43:14 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 7F2DBAF5B;
 Fri, 27 Sep 2019 11:43:13 +0000 (UTC)
To: Ian Jackson <ian.jackson@citrix.com>
References: <20190927090048.28872-1-jgross@suse.com>
 <20190927090048.28872-5-jgross@suse.com>
 <23949.59282.886951.844540@mariner.uk.xensource.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <60e030a8-01a0-73b0-5884-c96c4f8bd7ad@suse.com>
Date: Fri, 27 Sep 2019 13:43:12 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <23949.59282.886951.844540@mariner.uk.xensource.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v1 4/6] tools: add xenfs tool
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
 AndrewCooper <Andrew.Cooper3@citrix.com>, "Tim \(Xen.org\)" <tim@xen.org>,
 George Dunlap <George.Dunlap@citrix.com>, Julien Grall <julien.grall@arm.com>,
 Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjcuMDkuMTkgMTI6NDIsIElhbiBKYWNrc29uIHdyb3RlOgo+IEp1ZXJnZW4gR3Jvc3Mgd3Jp
dGVzICgiW1BBVENIIHYxIDQvNl0gdG9vbHM6IGFkZCB4ZW5mcyB0b29sIik6Cj4+IEFkZCB0aGUg
eGVuZnMgdG9vbCBmb3IgYWNjZXNzaW5nIHRoZSBoeXBlcnZpc29yIGZpbGVzeXN0ZW0uCj4gCj4g
VGhhbmtzIGZvciB0YWtpbmcgY2FyZSBhYm91dCBleGl0IHN0YXR1cy4gIENhbiB5b3UgZG9jdW1l
bnQgdGhlIGV4aXQKPiBzdGF0dXNlcyBzb21ld2hlcmUgPwoKWWVzLiBNaWdodCBiZSBhIGdvb2Qg
cmVhc29uIHRvIGFkZCBhIG1hbi1wYWdlLiA6LSkKCgpKdWVyZ2VuCgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApY
ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
