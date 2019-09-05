Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 936F2A9BB3
	for <lists+xen-devel@lfdr.de>; Thu,  5 Sep 2019 09:23:38 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i5m58-00013I-Vc; Thu, 05 Sep 2019 07:21:26 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=ezPI=XA=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1i5m57-00013B-Ei
 for xen-devel@lists.xenproject.org; Thu, 05 Sep 2019 07:21:25 +0000
X-Inumbo-ID: c409158c-cfad-11e9-978d-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c409158c-cfad-11e9-978d-bc764e2007e4;
 Thu, 05 Sep 2019 07:21:24 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 5A716AF24;
 Thu,  5 Sep 2019 07:21:23 +0000 (UTC)
To: Juergen Gross <jgross@suse.com>
References: <20190905070649.13975-1-jgross@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <b65fbbbb-415f-3249-d0fa-2fbf7d944ad9@suse.com>
Date: Thu, 5 Sep 2019 09:21:30 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190905070649.13975-1-jgross@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] xen: remove sched-if.h includes from
 various sources
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
Cc: xen-devel@lists.xenproject.org,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDUuMDkuMjAxOSAwOTowNiwgSnVlcmdlbiBHcm9zcyB3cm90ZToKPiB4ZW4vc2NoZWQtaWYu
aCBpcyBpbmNsdWRlZCBpbiBtdWx0aXBsZSBzb3VyY2VzIHdoZXJlIGl0IGlzbid0IGRpcmVjdGx5
Cj4gbmVlZGVkLiBSZW1vdmUgdGhvc2UgI2luY2x1ZGUgc3RhdGVtZW50cy4KPiAKPiBTdWdnZXN0
ZWQtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiBK
dWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+CgpHaXZlbiB0aGUgdGFnIGluIHBsYWNlIGFs
cmVhZHkgSSdtIG5vdCBzdXJlIHRoaXMgaXMgbmVlZGVkLCBidXQganVzdAppbiBjYXNlOgpBY2tl
ZC1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgoKSmFuCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0
Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qu
b3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
