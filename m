Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8526FFB154
	for <lists+xen-devel@lfdr.de>; Wed, 13 Nov 2019 14:31:09 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iUshl-0008Ug-Cz; Wed, 13 Nov 2019 13:29:05 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=SDLk=ZF=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iUshk-0008Ub-Id
 for xen-devel@lists.xenproject.org; Wed, 13 Nov 2019 13:29:04 +0000
X-Inumbo-ID: 8e6136cf-0619-11ea-a22d-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 8e6136cf-0619-11ea-a22d-12813bfff9fa;
 Wed, 13 Nov 2019 13:29:03 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id AB699B11B;
 Wed, 13 Nov 2019 13:29:01 +0000 (UTC)
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <20191101202502.31750-1-andrew.cooper3@citrix.com>
 <20191101202502.31750-2-andrew.cooper3@citrix.com>
 <618aa239-278d-ab34-0f91-3cf7f257a612@suse.com>
 <447d5543-dcca-0126-b987-7b5de86e7c66@citrix.com>
 <77d8c562-2541-3d69-f03b-451dad94751e@suse.com>
 <708290ba-9d5f-1ec7-889a-1e90488a6016@citrix.com>
 <0776abb4-fbf7-d3e7-67ea-c1516fa3894c@suse.com>
 <b5c38b70-b8c9-8435-2dd8-3632a77170c3@citrix.com>
 <54628e08-fa04-ed20-9255-9de58b219184@suse.com>
 <646c50cb-a54d-694a-b081-adc50e3700ca@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <629f8acb-4777-2fcb-a903-e53b735a6c48@suse.com>
Date: Wed, 13 Nov 2019 14:29:17 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <646c50cb-a54d-694a-b081-adc50e3700ca@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 1/3] x86/boot: Remove cached CPUID data from
 the trampoline
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
Cc: Juergen Gross <jgross@suse.com>, Sergey Dyasli <sergey.dyasli@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTMuMTEuMjAxOSAxNDoyMiwgQW5kcmV3IENvb3BlciB3cm90ZToKPiBJIGFtIG5vdCBjb252
aW5jZWQgdGhlIGJlaGF2aW91ciBpcyB3b3J0aCBjaGFuZ2luZywgYW5kIEkgZG9uJ3QgaGF2ZQo+
IHRpbWUgZm9yIHRoaXMgc2NvcGUgY3JlZXAuCgpUaGVyZSdzIG5vIHNjb3BlIGNyZWVwIGhlcmUg
YXQgYWxsLiBBbGwgSSdtIGFza2luZyBmb3IgaXMgdGhhdCB5b3UKZG9uJ3QgYmxpbmRseSBPUiBp
biBFRkVSX05YIGludG8gdHJhbXBvbGluZV9lZmVyLCBidXQgcmF0aGVyIGNoZWNrCnRoYXQgaXQg
d2lsbCBiZSBwb3NzaWJsZSB0byBzdWNjZXNzZnVsbHkgc2V0IGl0IGFmdGVyIHRoZQpNSVNDX0VO
QUJMRSB3cml0ZSAoYnkgcmVhZGluZyBiYWNrIHRoZSB2YWx1ZSwgb3IgYnkgcmVhZGluZwpDUFVJ
RFsweDgwMDAwMDAxXS5OWCBhZ2FpbikuCgpKYW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby94ZW4tZGV2ZWw=
