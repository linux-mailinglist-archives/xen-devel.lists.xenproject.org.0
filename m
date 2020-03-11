Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AE110181B07
	for <lists+xen-devel@lfdr.de>; Wed, 11 Mar 2020 15:20:36 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jC2BG-0000Vn-F7; Wed, 11 Mar 2020 14:17:54 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=LWSR=44=ainfosec.com=rosbrookn@srs-us1.protection.inumbo.net>)
 id 1jC2BF-0000Vi-8y
 for xen-devel@lists.xenproject.org; Wed, 11 Mar 2020 14:17:53 +0000
X-Inumbo-ID: 1774ad10-63a3-11ea-b34e-bc764e2007e4
Received: from mail.ainfosec.com (unknown [209.217.208.252])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1774ad10-63a3-11ea-b34e-bc764e2007e4;
 Wed, 11 Mar 2020 14:17:51 +0000 (UTC)
X-ASG-Debug-ID: 1583936270-0dce56145d150630001-RNp3Ad
Received: from mail.ainfosec.com ([10.201.1.88]) by mail.ainfosec.com with
 ESMTP id kOaOxFtZrFJ5d0QI (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384
 bits=256 verify=NO); Wed, 11 Mar 2020 10:17:50 -0400 (EDT)
X-Barracuda-Envelope-From: rosbrookn@ainfosec.com
Received: from AIS-Mustang.ainfosec.com (10.201.1.188) by AISEX01.ainfosec.com
 (10.201.1.88) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1779.2; Wed, 11
 Mar 2020 10:17:50 -0400
Received: from AIS-Mustang.ainfosec.com (10.201.1.188) by
 AIS-Mustang.ainfosec.com (10.201.1.188) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.1779.2; Wed, 11 Mar 2020 10:17:50 -0400
Received: from AIS-Mustang.ainfosec.com ([fe80::dd05:4fde:e2b2:58fb]) by
 AIS-Mustang.ainfosec.com ([fe80::dd05:4fde:e2b2:58fb%3]) with mapi id
 15.01.1779.007; Wed, 11 Mar 2020 10:17:50 -0400
From: Nicholas Rosbrook <rosbrookn@ainfosec.com>
To: George Dunlap <george.dunlap@citrix.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
Thread-Topic: [PATCH v4 1/3] golang/xenlight: Don't try to marshall
 zero-length arrays in fromC
X-ASG-Orig-Subj: Re: [PATCH v4 1/3] golang/xenlight: Don't try to marshall
 zero-length arrays in fromC
Thread-Index: AQHV9iH3IZCKiAH6f0CCMrxVbtLLd6hDcXtX
Date: Wed, 11 Mar 2020 14:17:49 +0000
Message-ID: <044f53600e85435dbb4355d62993303d@ainfosec.com>
References: <20200309144932.866097-1-george.dunlap@citrix.com>
In-Reply-To: <20200309144932.866097-1-george.dunlap@citrix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.16.101.172]
MIME-Version: 1.0
X-Barracuda-Connect: UNKNOWN[10.201.1.88]
X-Barracuda-Start-Time: 1583936270
X-Barracuda-Encrypted: ECDHE-RSA-AES256-SHA384
X-Barracuda-URL: https://10.69.69.46:443/cgi-mod/mark.cgi
X-Barracuda-BRTS-Status: 1
X-Virus-Scanned: by bsmtpd at ainfosec.com
X-Barracuda-Scan-Msg-Size: 424
X-Barracuda-Bayes: INNOCENT GLOBAL 0.8431 1.0000 2.6388
X-Barracuda-Spam-Score: 2.64
X-Barracuda-Spam-Status: No, SCORE=2.64 using global scores of TAG_LEVEL=1000.0
 QUARANTINE_LEVEL=1000.0 KILL_LEVEL=9.0 tests=
X-Barracuda-Spam-Report: Code version 3.2, rules version 3.2.3.80601
 Rule breakdown below
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
Subject: Re: [Xen-devel] [PATCH v4 1/3] golang/xenlight: Don't try to
 marshall zero-length arrays in fromC
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiBUaGUgY3VycmVudCBmcm9tQyBhcnJheSBjb2RlIHdpbGwgZG8gdGhlICJtYWdpYyIgY2FzdGlu
ZyBhbmQKPiBtYXJ0aWFsbGluZyBldmVuIHdoZW4gbnVtX2ZvbyB2YXJpYWJsZSBpcyAwLsKgIEdv
IGNyYXNoZXMgd2hlbiBkb2luZwo+IHRoZSBjYXN0Lgo+IAo+IE9ubHkgZG8gYXJyYXkgbWFyc2hh
bGxpbmcgaWYgdGhlIG51bWJlciBvZiBlbGVtZW50cyBpcyBub24temVybzsKPiBvdGhlcndpc2Us
IGxlYXZlIHRoZSB0YXJnZXQgcG9pbnRlciBlbXB0eSAobmlsIGZvciBHbyBzbGljZXMsIE5VTEwg
Zm9yCj4gQyBhcnJheXMpLgo+IAo+IFNpZ25lZC1vZmYtYnk6IEdlb3JnZSBEdW5sYXAgPGdlb3Jn
ZS5kdW5sYXBAY2l0cml4LmNvbT4KClJldmlld2VkLWJ5OiBOaWNrIFJvc2Jyb29rIDxyb3Nicm9v
a25AYWluZm9zZWMuY29tPgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRl
dmVs
