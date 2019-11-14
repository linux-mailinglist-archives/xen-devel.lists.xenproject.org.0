Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B63EFBFE5
	for <lists+xen-devel@lfdr.de>; Thu, 14 Nov 2019 06:53:41 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iV826-0001Bs-Om; Thu, 14 Nov 2019 05:51:06 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=RDJJ=ZG=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1iV824-0001Bn-W3
 for xen-devel@lists.xenproject.org; Thu, 14 Nov 2019 05:51:05 +0000
X-Inumbo-ID: bdad1fb9-06a2-11ea-a246-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id bdad1fb9-06a2-11ea-a246-12813bfff9fa;
 Thu, 14 Nov 2019 05:51:03 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id EE062AF5B;
 Thu, 14 Nov 2019 05:51:02 +0000 (UTC)
To: osstest service owner <osstest-admin@xenproject.org>,
 xen-devel@lists.xenproject.org
References: <osstest-144067-mainreport@xen.org>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <75512f9c-a521-1aec-34f5-e11540dbe973@suse.com>
Date: Thu, 14 Nov 2019 06:51:02 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <osstest-144067-mainreport@xen.org>
Content-Language: en-US
Subject: Re: [Xen-devel] [xen-unstable test] 144067: regressions - FAIL
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

T24gMTQuMTEuMTkgMDA6MDYsIG9zc3Rlc3Qgc2VydmljZSBvd25lciB3cm90ZToKPiBmbGlnaHQg
MTQ0MDY3IHhlbi11bnN0YWJsZSByZWFsIFtyZWFsXQo+IGh0dHA6Ly9sb2dzLnRlc3QtbGFiLnhl
bnByb2plY3Qub3JnL29zc3Rlc3QvbG9ncy8xNDQwNjcvCj4gCj4gUmVncmVzc2lvbnMgOi0oCj4g
Cj4gVGVzdHMgd2hpY2ggZGlkIG5vdCBzdWNjZWVkIGFuZCBhcmUgYmxvY2tpbmcsCj4gaW5jbHVk
aW5nIHRlc3RzIHdoaWNoIGNvdWxkIG5vdCBiZSBydW46Cj4gICB0ZXN0LWFtZDY0LWkzODYteGwt
cWVtdXUtZG1yZXN0cmljdC1hbWQ2NC1kbXJlc3RyaWN0IDEyIGd1ZXN0LXN0YXJ0L2RlYmlhbmh2
bS5yZXBlYXQgZmFpbCBSRUdSLiB2cy4gMTQ0MDQyCgpxZW11IGhhZCBhIHNlZ2ZhdWx0LiBDb3Vs
ZCBzb21lb25lIGxvb2sgYXQgdGhhdCwgcGxlYXNlPwoKPiAgIHRlc3QtYW1kNjQtYW1kNjQtcWVt
dXUtbmVzdGVkLWludGVsIDE3IGRlYmlhbi1odm0taW5zdGFsbC9sMS9sMiBmYWlsIFJFR1IuIHZz
LiAxNDQwNDIKClNlZW1zIHRvIGJlIHRoZSBzYW1lIGlzc3VlIGFzIGFscmVhZHkgc2VlbiBvbiBv
bGRlciBYZW4gdmVyc2lvbnMuIEFueW9uZQphbHJlYWR5IGF0IGl0PwoKCkp1ZXJnZW4KCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWls
aW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVu
cHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
