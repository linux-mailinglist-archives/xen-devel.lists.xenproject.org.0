Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C49C1528A5
	for <lists+xen-devel@lfdr.de>; Wed,  5 Feb 2020 10:49:15 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1izHGq-0000WZ-Ce; Wed, 05 Feb 2020 09:46:56 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=rprq=3Z=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1izHGo-0000WU-TN
 for xen-devel@lists.xenproject.org; Wed, 05 Feb 2020 09:46:54 +0000
X-Inumbo-ID: 70bdbf5a-47fc-11ea-90af-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 70bdbf5a-47fc-11ea-90af-12813bfff9fa;
 Wed, 05 Feb 2020 09:46:54 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 2D929AB7F;
 Wed,  5 Feb 2020 09:46:53 +0000 (UTC)
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <20200203144340.4614-1-andrew.cooper3@citrix.com>
 <20200203144340.4614-2-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <199147c5-1769-5cbb-9848-325e42952bcc@suse.com>
Date: Wed, 5 Feb 2020 10:47:00 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <20200203144340.4614-2-andrew.cooper3@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 1/4] AMD/IOMMU: Move headers to be local
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
Cc: George Dunlap <george.dunlap@eu.citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDMuMDIuMjAyMCAxNTo0MywgQW5kcmV3IENvb3BlciB3cm90ZToKPiBXZSBjdXJyZW50bHkg
aGF2ZSBhbWQtaW9tbXUtZGVmcy5oLCBhbWQtaW9tbXUtcHJvdG8uaCBhbmQgYW1kLWlvbW11Lmgs
IGFuZCBubwo+IHJlZmVyZW5jZXMgb3V0c2lkZSBvZiB0aGUgQU1EIElPTU1VIGRyaXZlci4KPiAK
PiBLZWVwIGlvbW11LWRlZnMuaCBhcyBpcywgYnV0IG1lcmdlIGFtZC1pb21tdS5oIGFuZCBhbWQt
aW9tbXUtcHJvdG8uaCB0byBqdXN0Cj4gaW9tbXUuaCwgYW5kIG1vdmUgdGhlbSBib3RoIGludG8g
ZHJpdmVycy9wYXNzdGhyb3VnaC9hbWQvLiAgKFdoaWxlIG1lcmdpbmcsCj4gZHJvcCB0aGUgYm9n
dXMgI3ByYWdtYSBwYWNrIGFyb3VuZCB0aGUgKl9lbnRyeSBzdHJ1Y3R1cmVzLikKPiAKPiBUYWtl
IHRoZSBvcHBvcnR1bml0eSB0byB0cmltIHRoZSBpbmNsdWRlIGxpc3RzLCBpbmNsdWRpbmcgeDg2
L21tL3AybS5jCgpJIGd1ZXNzIHlvdSBtZWFuIHAybS5oIGhlcmUuCgo+IHdoaWNoIChBRkFJQ1Qp
IGhhc24ndCBuZWVkZWQgdGhpcyBpbmNsdWRlIHNpbmNlIGMvcyBhZWYzZjIyNzUgIng4Ni9tbS9w
Mm06Cj4gYnJlYWsgaW50byBjb21tb24sIHB0LWltcGxlbWVudGF0aW9uIGFuZCBwb2QgcGFydHMi
IGluIDIwMTEuCj4gCj4gTm8gZnVuY3Rpb25hbCBjaGFuZ2UuCj4gCj4gU2lnbmVkLW9mZi1ieTog
QW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4KCkFja2VkLWJ5OiBKYW4g
QmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVs
