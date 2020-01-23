Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C696E146C6B
	for <lists+xen-devel@lfdr.de>; Thu, 23 Jan 2020 16:15:10 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iueAH-0006oK-5M; Thu, 23 Jan 2020 15:13:01 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=UGQU=3M=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iueAG-0006oF-06
 for xen-devel@lists.xenproject.org; Thu, 23 Jan 2020 15:13:00 +0000
X-Inumbo-ID: d70fc8d5-3df2-11ea-be5c-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d70fc8d5-3df2-11ea-be5c-12813bfff9fa;
 Thu, 23 Jan 2020 15:12:59 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 52D6EAF21;
 Thu, 23 Jan 2020 15:12:58 +0000 (UTC)
To: Paul Durrant <pdurrant@amazon.com>
References: <20200123140305.21050-1-pdurrant@amazon.com>
 <20200123140305.21050-3-pdurrant@amazon.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <f3266c4d-3cac-0363-0d75-c4125efab888@suse.com>
Date: Thu, 23 Jan 2020 16:13:06 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20200123140305.21050-3-pdurrant@amazon.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v3 2/3] x86 / hvm: add
 domain_relinquish_resources() method
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
Cc: Kevin Tian <kevin.tian@intel.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Jun Nakajima <jun.nakajima@intel.com>, xen-devel@lists.xenproject.org,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjMuMDEuMjAyMCAxNTowMywgUGF1bCBEdXJyYW50IHdyb3RlOgo+IFRoZXJlIGFyZSB0d28g
ZnVuY3Rpb25zIGluIGh2bS5jIHRvIGRlYWwgd2l0aCB0ZWFyLWRvd24gYW5kIGEgZG9tYWluOgo+
IGh2bV9kb21haW5fcmVsaW5xdWlzaF9yZXNvdXJjZXMoKSBhbmQgaHZtX2RvbWFpbl9kZXN0cm95
KCkuIEhvd2V2ZXIsIG9ubHkKPiB0aGUgbGF0dGVyIGhhcyBhbiBhc3NvY2lhdGVkIG1ldGhvZCBp
biAnaHZtX2Z1bmNzJy4gVGhpcyBwYXRjaCBhZGRzCj4gYSBtZXRob2QgZm9yIHRoZSBmb3JtZXIu
Cj4gCj4gQSBzdWJzZXF1ZW50IHBhdGNoIHdpbGwgZGVmaW5lIGEgVk1YIGltcGxlbWVudGF0aW9u
Lgo+IAo+IFNpZ25lZC1vZmYtYnk6IFBhdWwgRHVycmFudCA8cGR1cnJhbnRAYW1hem9uLmNvbT4K
CkFja2VkLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+CgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0
Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qu
b3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
