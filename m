Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EEA8ABA09
	for <lists+xen-devel@lfdr.de>; Fri,  6 Sep 2019 15:57:01 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i6Egq-0005FK-DC; Fri, 06 Sep 2019 13:54:16 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=ai1O=XB=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1i6Ego-0005FB-BJ
 for xen-devel@lists.xenproject.org; Fri, 06 Sep 2019 13:54:14 +0000
X-Inumbo-ID: ce79b5de-d0ad-11e9-abf6-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ce79b5de-d0ad-11e9-abf6-12813bfff9fa;
 Fri, 06 Sep 2019 13:54:12 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id F2850AD3E;
 Fri,  6 Sep 2019 13:54:11 +0000 (UTC)
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <1233e6e5-060a-ef1e-6e90-1df9aa38c71a@suse.com>
Date: Fri, 6 Sep 2019 15:54:20 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
Content-Language: en-US
Subject: [Xen-devel] [PATCH] x86/mwait-idle: add support for Jacobsville
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RnJvbTogWmhhbmcgUnVpIDxydWkuemhhbmdAaW50ZWwuY29tPgoKSmFjb2JzdmlsbGUgdXNlcyB0
aGUgc2FtZSBDLXN0YXRlcyBhcyBEZW52ZXJ0b24uCgpTaWduZWQtb2ZmLWJ5OiBaaGFuZyBSdWkg
PHJ1aS56aGFuZ0BpbnRlbC5jb20+CltMaW51eCBjb21taXQgMDRiMWQ1ZDA5ODQ5MTI0NGY1MDZj
NDI2NWNjOTViODcyMTBlZWYyZl0KU2lnbmVkLW9mZi1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNo
QHN1c2UuY29tPgoKLS0tIGEveGVuL2FyY2gveDg2L2NwdS9td2FpdC1pZGxlLmMKKysrIGIveGVu
L2FyY2gveDg2L2NwdS9td2FpdC1pZGxlLmMKQEAgLTk2Miw2ICs5NjIsNyBAQCBzdGF0aWMgY29u
c3Qgc3RydWN0IHg4Nl9jcHVfaWQgaW50ZWxfaWRsCiAJSUNQVSgweDVjLCBieHQpLAogCUlDUFUo
MHg3YSwgYnh0KSwKIAlJQ1BVKDB4NWYsIGRudiksCisJSUNQVSgweDg2LCBkbnYpLAogCXt9CiB9
OwogCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4t
ZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczov
L2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
