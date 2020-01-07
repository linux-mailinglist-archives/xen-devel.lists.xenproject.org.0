Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E8A621326A7
	for <lists+xen-devel@lfdr.de>; Tue,  7 Jan 2020 13:46:32 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iooDp-00012n-Rn; Tue, 07 Jan 2020 12:44:33 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=a7vm=24=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iooDn-00012i-KC
 for xen-devel@lists.xenproject.org; Tue, 07 Jan 2020 12:44:31 +0000
X-Inumbo-ID: 727b7a48-314b-11ea-abf4-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 727b7a48-314b-11ea-abf4-12813bfff9fa;
 Tue, 07 Jan 2020 12:44:30 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id A6390AD5F;
 Tue,  7 Jan 2020 12:44:29 +0000 (UTC)
To: George Dunlap <george.dunlap@citrix.com>
References: <20200107120243.222183-1-george.dunlap@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <c5c4a1a9-aa01-b228-50e8-46015bb6581e@suse.com>
Date: Tue, 7 Jan 2020 13:44:28 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20200107120243.222183-1-george.dunlap@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] CODING_STYLE: Document how to handle
 unexpected conditions
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Wilk <konrad.wilk@oracle.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@citrix.com>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDcuMDEuMjAyMCAxMzowMiwgR2VvcmdlIER1bmxhcCB3cm90ZToKPiBJdCdzIG5vdCBhbHdh
eXMgY2xlYXIgd2hhdCB0aGUgYmVzdCB3YXkgaXMgdG8gaGFuZGxlIHVuZXhwZWN0ZWQKPiBjb25k
aXRpb25zOiB3aGV0aGVyIHdpdGggQVNTRVJUKCksIGRvbWFpbl9jcmFzaCgpLCBCVUdfT04oKSwg
b3Igc29tZQo+IG90aGVyIG1ldGhvZC4gIEFsbCBtZXRob2RzIGhhdmUgYSByaXNrIG9mIGludHJv
ZHVjaW5nIHNlY3VyaXR5Cj4gdnVsbmVyYWJpbGl0aWVzIGFuZCB1bm5lY2Vzc2FyeSBpbnN0YWJp
bGl0aWVzIHRvIHByb2R1Y3Rpb24gc3lzdGVtcy4KPiAKPiBQcm92aWRlIGd1aWRlbGluZXMgZm9y
IGRpZmZlcmVudCBvcHRpb25zIGFuZCB3aGVuIHRvIHVzZSB0aGVtLgo+IAo+IFNpZ25lZC1vZmYt
Ynk6IEdlb3JnZSBEdW5sYXAgPGdlb3JnZS5kdW5sYXBAY2l0cml4LmNvbT4KCkFja2VkLWJ5OiBK
YW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+CgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8veGVuLWRldmVs
