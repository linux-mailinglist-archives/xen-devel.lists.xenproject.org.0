Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D9E8010705A
	for <lists+xen-devel@lfdr.de>; Fri, 22 Nov 2019 12:22:23 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iY6yZ-0002xr-7h; Fri, 22 Nov 2019 11:19:47 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=28IZ=ZO=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iY6yX-0002xm-8o
 for xen-devel@lists.xen.org; Fri, 22 Nov 2019 11:19:45 +0000
X-Inumbo-ID: fb76d0a0-0d19-11ea-9631-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id fb76d0a0-0d19-11ea-9631-bc764e2007e4;
 Fri, 22 Nov 2019 11:19:43 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id C73FAAC9D;
 Fri, 22 Nov 2019 11:19:42 +0000 (UTC)
To: Sergey Dyasli <sergey.dyasli@citrix.com>
References: <20191122105202.25507-1-sergey.dyasli@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <22b7b490-6140-36ab-d49a-2177c817d28d@suse.com>
Date: Fri, 22 Nov 2019 12:19:41 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20191122105202.25507-1-sergey.dyasli@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v1 for 4.13] x86/microcode: refuse to load
 the same revision ucode
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
Cc: Juergen Gross <jgross@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Chao Gao <chao.gao@intel.com>, xen-devel@lists.xen.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjIuMTEuMjAxOSAxMTo1MiwgU2VyZ2V5IER5YXNsaSB3cm90ZToKPiBDdXJyZW50bHkgaWYg
YSB1c2VyIHRyaWVzIHRvIGxpdmUtbG9hZCB0aGUgc2FtZSB1Y29kZSByZXZpc2lvbiB0aGF0IENQ
VQo+IGFscmVhZHkgaGFzLCBoZSB3aWxsIGdldCBhIHNpbmdsZSBtZXNzYWdlIGluIFhlbiBsb2cg
bGlrZToKPiAKPiAgICAgKFhFTikgMTI4IGNvcmVzIGFyZSB0byB1cGRhdGUgdGhlaXIgbWljcm9j
b2RlCj4gCj4gTm8gYWN0dWFsIHVjb2RlIGxvYWRpbmcgd2lsbCBoYXBwZW4gYW5kIHRoaXMgc2l0
dWF0aW9uIGNhbiBiZSBxdWl0ZQo+IGNvbmZ1c2luZy4gRml4IHRoaXMgYnkgc3RhcnRpbmcgdWNv
ZGUgdXBkYXRlIG9ubHkgd2hlbiBhIG5ld2VyIHVjb2RlCj4gcmV2aXNpb24gaGFzIGJlZW4gcHJv
dmlkZWQuIFRoaXMgaXMgYmFzZWQgb24gYW4gYXNzdW1wdGlvbiB0aGF0IGFsbCBDUFVzCj4gaW4g
dGhlIHN5c3RlbSBoYXZlIHRoZSBzYW1lIHVjb2RlIHJldmlzaW9uLiBJZiB0aGF0J3Mgbm90IHRo
ZSBjYXNlLAo+IHRoZSBzeXN0ZW0gbXVzdCBiZSBjb25zaWRlcmVkIHVuc3RhYmxlLgoKVW5zdGFi
bGUgb3Igbm90LCBJIGRpZCBzcGVjaWZpY2FsbHkgY29udmluY2UgQ2hhbyB0byBoYW5kbGUgc3Vj
aApzeXN0ZW1zLCBicmluZ2luZyB0aGVtIGludG8gYmV0dGVyIHNoYXBlLiBJIGNhbiBvbmx5IHJl
cGVhdCB0aGF0CkkgYWN0dWFsbHkgaGF2ZSBhIHN5c3RlbSB3aGVyZSBvbiBlYWNoIHNvY2tldCBm
aXJtd2FyZSBsb2FkcyB1Y29kZQpvbmx5IG9uIHRoZSBmaXJzdCBjb3JlLiBJIGRvbid0IHNlZSB3
aHkgYm9vdCB0aW1lIGxvYWRpbmcgYW5kIGxhdGUKbG9hZGluZyBzaG91bGQgZGlmZmVyIGluIGJl
aGF2aW9yIGZvciBzdWNoIGEgc3lzdGVtLgoKSmFuCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8veGVuLWRldmVs
