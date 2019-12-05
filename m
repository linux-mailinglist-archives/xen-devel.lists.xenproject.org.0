Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F7D7113FBE
	for <lists+xen-devel@lfdr.de>; Thu,  5 Dec 2019 11:55:18 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1icoky-0007y9-Tl; Thu, 05 Dec 2019 10:53:12 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=90OC=Z3=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1icokx-0007y0-7w
 for xen-devel@lists.xenproject.org; Thu, 05 Dec 2019 10:53:11 +0000
X-Inumbo-ID: 6bf32cbb-174d-11ea-821d-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 6bf32cbb-174d-11ea-821d-12813bfff9fa;
 Thu, 05 Dec 2019 10:53:09 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 5574EAE12;
 Thu,  5 Dec 2019 10:53:08 +0000 (UTC)
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <20191204094335.24603-1-andrew.cooper3@citrix.com>
 <20191205105134.7801-1-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <8240c6a1-2131-bbc4-093c-02e08ef237dd@suse.com>
Date: Thu, 5 Dec 2019 11:53:23 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20191205105134.7801-1-andrew.cooper3@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 5/4] x86/svm: Minor cleanup to start_svm()
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDUuMTIuMjAxOSAxMTo1MSwgQW5kcmV3IENvb3BlciB3cm90ZToKPiBUaGUgZnVuY3Rpb24g
aXMgaW5pdCwgc28gY2FuIHVzZSBib290X2NwdV9kYXRhIGRpcmVjdGx5Lgo+IAo+IFRoZXJlIGlz
IG5vIG5lZWQgdG8gd3JpdGUgMCB0byBzdm1fZmVhdHVyZV9mbGFncyBpbiB0aGUgY2FzZSBvZiBh
IENQVUlECj4gbWlzbWF0Y2ggKG5vdCBsZWFzdCBiZWNhdXNlIHRoaXMgaXMgZGVhZCBjb2RlIG9u
IHJlYWwgaGFyZHdhcmUpLCBhbmQgbm8gbmVlZAo+IHRvIHVzZSBsb2NrZWQgYXRvbWljIG9wZXJh
dGlvbnMuCj4gCj4gU2lnbmVkLW9mZi1ieTogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNA
Y2l0cml4LmNvbT4KClJldmlld2VkLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2
ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xp
c3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
