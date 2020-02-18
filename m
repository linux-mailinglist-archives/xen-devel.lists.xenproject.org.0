Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 97178162729
	for <lists+xen-devel@lfdr.de>; Tue, 18 Feb 2020 14:31:53 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j42vZ-00047m-4g; Tue, 18 Feb 2020 13:28:41 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=u3z7=4G=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1j42vX-00047h-CX
 for xen-devel@lists.xenproject.org; Tue, 18 Feb 2020 13:28:39 +0000
X-Inumbo-ID: 924a36fc-5252-11ea-bc8e-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 924a36fc-5252-11ea-bc8e-bc764e2007e4;
 Tue, 18 Feb 2020 13:28:38 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 69A40BE13;
 Tue, 18 Feb 2020 13:28:37 +0000 (UTC)
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <20200214195510.22667-1-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <cc267e1f-afd3-fe34-97fb-0cae5ce86ecb@suse.com>
Date: Tue, 18 Feb 2020 14:28:37 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <20200214195510.22667-1-andrew.cooper3@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] x86/msr: Virtualise MSR_PLATFORM_ID properly
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

T24gMTQuMDIuMjAyMCAyMDo1NSwgQW5kcmV3IENvb3BlciB3cm90ZToKPiBUaGlzIGlzIGFuIElu
dGVsLW9ubHksIHJlYWQtb25seSBNU1IgcmVsYXRlZCB0byBtaWNyb2NvZGUgbG9hZGluZy4gIEV4
cG9zZSBpdAo+IGluIHNpbWlsYXIgY2lyY3Vtc3RhbmNlcyBhcyB0aGUgUEFUQ0hMRVZFTCBNU1Iu
Cj4gCj4gVGhpcyBzaG91bGQgaGF2ZSBiZWVuIGFsb25nc2lkZSBjL3MgMDEzODk2Y2I4YjIgIng4
Ni9tc3I6IEZpeCBoYW5kbGluZyBvZgo+IE1TUl9BTURfUEFUQ0hMRVZFTC9NU1JfSUEzMl9VQ09E
RV9SRVYiCj4gCj4gU2lnbmVkLW9mZi1ieTogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNA
Y2l0cml4LmNvbT4KClJldmlld2VkLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2
ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xp
c3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
