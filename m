Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BEF412B4FF
	for <lists+xen-devel@lfdr.de>; Fri, 27 Dec 2019 14:55:58 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ikq3z-0004MA-Ha; Fri, 27 Dec 2019 13:53:59 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=j2i0=2R=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1ikq3y-0004M4-G3
 for xen-devel@lists.xenproject.org; Fri, 27 Dec 2019 13:53:58 +0000
X-Inumbo-ID: 4f1a2eee-28b0-11ea-a1e1-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4f1a2eee-28b0-11ea-a1e1-bc764e2007e4;
 Fri, 27 Dec 2019 13:53:49 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 311D0AC88;
 Fri, 27 Dec 2019 13:53:49 +0000 (UTC)
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <20191227133848.9776-1-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <67a3e5dc-1a00-2505-aa81-553cff64a499@suse.com>
Date: Fri, 27 Dec 2019 14:54:24 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20191227133848.9776-1-andrew.cooper3@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] tools/libxc: Fix HVM_PARAM_PAE_ENABLED
 handling in xc_cpuid_apply_policy()
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
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Ian Jackson <Ian.Jackson@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjcuMTIuMjAxOSAxNDozOCwgQW5kcmV3IENvb3BlciB3cm90ZToKPiBEZXNwaXRlIGFzIHN1
Z2dlc3RlZCBpbiBjL3MgNjg1ZTkyMmQ2ZjMsIG5vdCBhbGwgSFZNX1BBUkFNcyBhcmUgaGFuZGxl
ZAo+IGluIHRoZSBzYW1lIHdheS4gIEhWTV9QQVJBTV9QQUVfRU5BQkxFRCBpcyBhIHRvb2xzdGFj
ay1vbmx5IHZhbHVlLCBhbmQKPiB0aGUgeGNfY3B1aWRfYXBwbHlfcG9saWN5KCkgdXNlZCB0byBi
ZSB0aGUgb25seSBjb25zdW1lci4KPiAKPiBSZWluc3RhdGUgdGhlIG9sZCBiZWhhdmlvdXIgKG1h
ZCBhcyBpdCBpcykgdG8gYXZvaWQgcmVncmVzc2lvbnMuCj4gCj4gU2lnbmVkLW9mZi1ieTogQW5k
cmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4KCkFja2VkLWJ5OiBKYW4gQmV1
bGljaCA8amJldWxpY2hAc3VzZS5jb20+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVs
