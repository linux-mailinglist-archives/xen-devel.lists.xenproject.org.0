Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DC6C5E2AF0
	for <lists+xen-devel@lfdr.de>; Thu, 24 Oct 2019 09:16:40 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iNXJD-0003lr-Vu; Thu, 24 Oct 2019 07:13:23 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=D++P=YR=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1iNXJB-0003lm-Mw
 for xen-devel@lists.xenproject.org; Thu, 24 Oct 2019 07:13:21 +0000
X-Inumbo-ID: bf937673-f62d-11e9-9497-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id bf937673-f62d-11e9-9497-12813bfff9fa;
 Thu, 24 Oct 2019 07:13:16 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 91ACEB30B;
 Thu, 24 Oct 2019 07:13:15 +0000 (UTC)
To: osstest service owner <osstest-admin@xenproject.org>,
 xen-devel@lists.xenproject.org
References: <osstest-143061-mainreport@xen.org>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <45b32f7a-4dcd-c576-4d3f-387cec4d91e2@suse.com>
Date: Thu, 24 Oct 2019 09:13:14 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <osstest-143061-mainreport@xen.org>
Content-Language: en-US
Subject: Re: [Xen-devel] [xen-unstable test] 143061: regressions - trouble:
 broken/fail/pass
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

T24gMjQuMTAuMTkgMDg6NDcsIG9zc3Rlc3Qgc2VydmljZSBvd25lciB3cm90ZToKPiBmbGlnaHQg
MTQzMDYxIHhlbi11bnN0YWJsZSByZWFsIFtyZWFsXQo+IGh0dHA6Ly9sb2dzLnRlc3QtbGFiLnhl
bnByb2plY3Qub3JnL29zc3Rlc3QvbG9ncy8xNDMwNjEvCj4gCj4gUmVncmVzc2lvbnMgOi0oCj4g
Cj4gVGVzdHMgd2hpY2ggZGlkIG5vdCBzdWNjZWVkIGFuZCBhcmUgYmxvY2tpbmcsCj4gaW5jbHVk
aW5nIHRlc3RzIHdoaWNoIGNvdWxkIG5vdCBiZSBydW46Cj4gICB0ZXN0LWFtZDY0LWFtZDY0LXhs
LXFlbXV0LXN0dWJkb20tZGViaWFuaHZtLWFtZDY0LXhzbSAgICA8am9iIHN0YXR1cz4gICBicm9r
ZW4KPiAgIHRlc3QtYW1kNjQtYW1kNjQteGwtcWVtdXQtc3R1YmRvbS1kZWJpYW5odm0tYW1kNjQt
eHNtIDQgaG9zdC1pbnN0YWxsKDQpIGJyb2tlbiBSRUdSLiB2cy4gMTQyNzUwCgpXaHkgaXMgTGlu
dXgga2VybmVsIDUuNC4wLXJjNCBiZWluZyB1c2VkIGZvciB0ZXN0aW5nIHhlbi11bnN0YWJsZSBo
ZXJlPwpPciBhbSBJIHJlYWRpbmcgdGhlIGxvZ3Mgd3Jvbmc/Cgo+ICAgdGVzdC1hcm02NC1hcm02
NC1leGFtaW5lICAgIDExIGV4YW1pbmUtc2VyaWFsL2Jvb3Rsb2FkZXIgZmFpbCBSRUdSLiB2cy4g
MTQyNzUwCgpJJ20gbm90IHN1cmUgd2hhdCBoYXMgZ29uZSB3cm9uZyBoZXJlPyBUaGUgc2VyaWFs
IGxvZ3Mgc2VlbSB0byBiZSBmaW5lCmZvciBtZSwgYnV0IG1heWJlIEknbSBtaXNzaW5nIHNvbWV0
aGluZz8KCgpKdWVyZ2VuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRl
dmVs
