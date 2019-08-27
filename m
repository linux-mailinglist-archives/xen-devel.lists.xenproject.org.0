Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E5E09EABE
	for <lists+xen-devel@lfdr.de>; Tue, 27 Aug 2019 16:19:37 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i2cHs-00084L-G0; Tue, 27 Aug 2019 14:17:32 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=72vU=WX=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1i2cHr-00084G-5A
 for xen-devel@lists.xenproject.org; Tue, 27 Aug 2019 14:17:31 +0000
X-Inumbo-ID: 6746f60e-c8d5-11e9-ae35-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 6746f60e-c8d5-11e9-ae35-12813bfff9fa;
 Tue, 27 Aug 2019 14:17:30 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 8742CACC1;
 Tue, 27 Aug 2019 14:17:29 +0000 (UTC)
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <20190812182125.18094-1-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <32c062c5-0813-f6af-3c0c-eaf17eff7958@suse.com>
Date: Tue, 27 Aug 2019 16:17:28 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190812182125.18094-1-andrew.cooper3@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] x86/suspend: Simplify resume path
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
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTIuMDguMjAxOSAyMDoyMSwgQW5kcmV3IENvb3BlciB3cm90ZToKPiBUaGlzIHN0YXJ0ZWQg
b2ZmIGFzICJnZXQgcmlkIG9mIGxvYWRfVFIoKSIgYXMgaWRlbnRpZmllZCBpbiB0aGUgVFNTIGNs
ZWFudXAKPiBzZXJpZXMsIGFuZCBtb3JwaGVkIHNsaWdodGx5Lgo+IAo+IEFuZHJldyBDb29wZXIg
KDMpOgo+ICAgIHg4Ni9zdXNwZW5kOiBTYW5pdHkgY2hlY2sgbW9yZSBwcm9wZXJ0aWVzIGluIGVu
dGVyX3N0YXRlKCkKPiAgICB4ODYvZGVzYzogTW92ZSBib290X2dkdHIgaW50byAucm9kYXRhCj4g
ICAgeDg2L3N1c3BlbmQ6IFNpbXBsaWZ5IHN5c3RlbSB0YWJsZSBoYW5kbGluZyBvbiByZXN1bWUK
CkFja2VkLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+CgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0
Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qu
b3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
