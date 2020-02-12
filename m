Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9877B15A54E
	for <lists+xen-devel@lfdr.de>; Wed, 12 Feb 2020 10:49:35 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j1oYu-0003dY-LV; Wed, 12 Feb 2020 09:44:04 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=JFaq=4A=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1j1oYt-0003dT-Oo
 for xen-devel@lists.xenproject.org; Wed, 12 Feb 2020 09:44:03 +0000
X-Inumbo-ID: 3388c37a-4d7c-11ea-b707-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 3388c37a-4d7c-11ea-b707-12813bfff9fa;
 Wed, 12 Feb 2020 09:44:02 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id CBAAAB1DD;
 Wed, 12 Feb 2020 09:44:01 +0000 (UTC)
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <20200211140825.1192-1-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <e4beb383-c703-fb75-1dea-1b7889dabfa4@suse.com>
Date: Wed, 12 Feb 2020 10:44:03 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <20200211140825.1192-1-andrew.cooper3@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] hvmloader: Drop use of XENVER_extraversion
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

T24gMTEuMDIuMjAyMCAxNTowOCwgQW5kcmV3IENvb3BlciB3cm90ZToKPiBUaGUgcHJpbnRmKCkg
aW4gaW5pdF9oeXBlcmNhbGxzKCkgb25seSBlbmRzIHVwIGluIHRoZSBoeXBlcnZpc29yIGNvbnNv
bGUgbG9nLAo+IHNvIGV4dHJhdmVyc2lvbiByZWFsbHkgaXNuJ3QgaW50ZXJlc3RpbmcuCj4gCj4g
VGhlIFNNQmlvcyB0YWJsZSBkb2Vzbid0IG5lZWQgZXh0cmF2ZXJzaW9uLCBhbmQgcmVtb3Zpbmcg
aXQgcmVkdWNlcyB0aGUKPiBhYmlsaXR5IGZvciBhIGd1ZXN0IHRvIGZpbmdlcnByaW50IHRoZSBl
eGFjdCBoeXBlcnZpc29yIGl0IGlzIHJ1bm5pbmcgdW5kZXIuCgpXaGlsZSBJJ20gbm90IGVudGly
ZWx5IG9wcG9zZWQsIGxldCdzIGNvbXBhcmUgd2l0aCBiYXJlIGhhcmR3YXJlJ3MKQklPU2VzIC8g
U01CSU9TIHRhYmxlczogRG9uJ3QgeW91IHNlZSwganVzdCBsaWtlIEkgZG8sIHR5cGljYWxseQp2
ZXJ5IGRldGFpbGVkIEJJT1MgZXRjIHZlcnNpb24gaW5mb3JtYXRpb24gKHNvbWV0aW1lcyBpbmNs
dWRpbmcKZXZlbiBzb21ldGhpbmcgbGlrZSBidWlsZCBudW1iZXJzKSB0aGVyZT8gSSBjYW4gYWNj
ZXB0IHRoYXQgZXhjZXNzCmRhdGEgaW4gZXh0cmF2ZXJzaW9uIG1heSBnbyB0b28gZmFyLCBidXQg
dGhlIG1pbm9yIHZlcnNpb24gbnVtYmVyCndlIHB1dCB0aGVyZSBieSBkZWZhdWx0IGlzIGhhcmRs
eSBvZiBhbnkgY29uY2VybiwgYW5kIG1heSBlbmQgdXAKYmVpbmcgdXNlZnVsLiBUaGUgb25lIGFy
Z3VtZW50IGFnYWluc3QgaXRzIHVzZWZ1bG5lc3MgaXMgdGhhdCBpdCdzCmdlbmVyYWxseSBzdHJp
bmcgb2Ygbm8td2hlcmUgc3RhbmRhcmRpemVkIGNvbnRlbnRzLgoKUGVyc29uYWxseSBJIGxpa2Ug
U2VyZ2V5J3MgYXBwcm9hY2ggYmV0dGVyLCBidXQgSSByZWFsaXplIHlvdQpkaXNsaWtlIGl0IHRv
IGEgZGVncmVlIHRoYXQsIGFzIGl0IHNlZW1zLCB5b3UncmUgbm90IGV2ZW4gd2lsbGluZwp0byBo
YXZlIGEgcmVhc29uYWJsZSBkaXNwdXRlIG92ZXIgaXQuCgpKYW4KCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVu
LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcv
bWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
