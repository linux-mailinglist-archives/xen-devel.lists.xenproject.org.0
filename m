Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6911DDE6AC
	for <lists+xen-devel@lfdr.de>; Mon, 21 Oct 2019 10:37:19 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iMT8p-0002qu-8S; Mon, 21 Oct 2019 08:34:15 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=QP7N=YO=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1iMT8o-0002qp-J7
 for xen-devel@lists.xenproject.org; Mon, 21 Oct 2019 08:34:14 +0000
X-Inumbo-ID: 8e7ba69e-f3dd-11e9-9442-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 8e7ba69e-f3dd-11e9-9442-12813bfff9fa;
 Mon, 21 Oct 2019 08:34:13 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 2E8DEB15E;
 Mon, 21 Oct 2019 08:34:12 +0000 (UTC)
To: xen-devel@lists.xenproject.org, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>
References: <osstest-142973-mainreport@xen.org>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <7002deb3-d5e2-19fa-0641-25eedac805a0@suse.com>
Date: Mon, 21 Oct 2019 10:34:11 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <osstest-142973-mainreport@xen.org>
Content-Language: en-US
Subject: Re: [Xen-devel] [xen-unstable test] 142973: regressions - FAIL
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

T24gMjEuMTAuMTkgMTA6MjMsIG9zc3Rlc3Qgc2VydmljZSBvd25lciB3cm90ZToKPiBmbGlnaHQg
MTQyOTczIHhlbi11bnN0YWJsZSByZWFsIFtyZWFsXQo+IGh0dHA6Ly9sb2dzLnRlc3QtbGFiLnhl
bnByb2plY3Qub3JnL29zc3Rlc3QvbG9ncy8xNDI5NzMvCj4gCj4gUmVncmVzc2lvbnMgOi0oCj4g
Cj4gVGVzdHMgd2hpY2ggZGlkIG5vdCBzdWNjZWVkIGFuZCBhcmUgYmxvY2tpbmcsCj4gaW5jbHVk
aW5nIHRlc3RzIHdoaWNoIGNvdWxkIG5vdCBiZSBydW46Cj4gICB0ZXN0LWFtZDY0LWFtZDY0LXhs
LXB2c2hpbSAgIDE4IGd1ZXN0LWxvY2FsbWlncmF0ZS94MTAgICBmYWlsIFJFR1IuIHZzLiAxNDI3
NTAKClJvZ2VyLCBJIGJlbGlldmUgeW91IGhhdmUgbG9va2VkIGludG8gdGhhdCBvbmU/CgpJIGd1
ZXNzIHRoZSBjb252ZXJzYXRpb24gdmlhIElSQyB3aXRoIElhbiByZWdhcmRpbmcgdGhlIHJhY2Ug
YmV0d2VlbgpibGtiYWNrIGFuZCBPU1N0ZXN0IHdhcyByZWxhdGVkIHRvIHRoZSBpc3N1ZT8KCklm
IHRoaXMgaXMgdGhlIGNhc2UsIGNvdWxkIHlvdSwgSWFuLCBwbGVhc2UgYWRkIHRoZSB3b3JrYXJv
dW5kIHlvdSB3ZXJlCnRoaW5raW5nIG9mIHRvIE9TU3Rlc3QgKHVuY29uZGl0aW9uYWwgYnkgbm93
LCBtYXliZSBtYWtlIGl0IGNvbmR0aXRpb25hbApsYXRlcik/CgoKSnVlcmdlbgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcg
bGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9q
ZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
