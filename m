Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 942F811E2CB
	for <lists+xen-devel@lfdr.de>; Fri, 13 Dec 2019 12:29:46 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ifj62-0002WG-GP; Fri, 13 Dec 2019 11:26:58 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=D6vH=2D=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1ifj60-0002WA-Qm
 for xen-devel@lists.xenproject.org; Fri, 13 Dec 2019 11:26:56 +0000
X-Inumbo-ID: 732df8da-1d9b-11ea-b6f1-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 732df8da-1d9b-11ea-b6f1-bc764e2007e4;
 Fri, 13 Dec 2019 11:26:48 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 6ED86ACEF;
 Fri, 13 Dec 2019 11:26:47 +0000 (UTC)
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <20191212182740.2190199-1-anthony.perard@citrix.com>
 <20191212182740.2190199-9-anthony.perard@citrix.com>
 <dfebae5a-90a6-e898-5f49-701d6e2aa7fd@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <e7e4c191-1f6c-616d-98b9-3f1fbd0dcb42@suse.com>
Date: Fri, 13 Dec 2019 12:27:09 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <dfebae5a-90a6-e898-5f49-701d6e2aa7fd@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [XEN PATCH 8/8] xen: Move
 GCC_HAS_VISIBILITY_ATTRIBUTE to Kconfig and common
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
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 Anthony PERARD <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTIuMTIuMjAxOSAyMDowNCwgQW5kcmV3IENvb3BlciB3cm90ZToKPiBPbiAxMi8xMi8yMDE5
IDE4OjI3LCBBbnRob255IFBFUkFSRCB3cm90ZToKPj4gZGlmZiAtLWdpdCBhL3hlbi9pbmNsdWRl
L3hlbi9jb21waWxlci5oIGIveGVuL2luY2x1ZGUveGVuL2NvbXBpbGVyLmgKPj4gaW5kZXggZmY2
YzBmNWNkZDE4Li44Yzg0NjI2MWQyNDEgMTAwNjQ0Cj4+IC0tLSBhL3hlbi9pbmNsdWRlL3hlbi9j
b21waWxlci5oCj4+ICsrKyBiL3hlbi9pbmNsdWRlL3hlbi9jb21waWxlci5oCj4+IEBAIC03OCw3
ICs3OCw3IEBACj4+ICAjZGVmaW5lIF9fbXVzdF9iZV9hcnJheShhKSBcCj4+ICAgIEJVSUxEX0JV
R19PTl9aRVJPKF9fYnVpbHRpbl90eXBlc19jb21wYXRpYmxlX3AodHlwZW9mKGEpLCB0eXBlb2Yo
JmFbMF0pKSkKPj4gIAo+PiAtI2lmZGVmIEdDQ19IQVNfVklTSUJJTElUWV9BVFRSSUJVVEUKPj4g
KyNpZmRlZiBDT05GSUdfQ0NfSEFTX1ZJU0lCSUxJVFlfQVRUUklCVVRFCj4+ICAvKiBSZXN1bHRz
IGluIG1vcmUgZWZmaWNpZW50IFBJQyBjb2RlIChubyBpbmRpcmVjdGlvbnMgdGhyb3VnaCBHT1Qg
b3IgUExUKS4gKi8KPj4gICNwcmFnbWEgR0NDIHZpc2liaWxpdHkgcHVzaChoaWRkZW4pCj4gCj4g
KEkgcmVhbGlzZSB3ZSBhcmUgZ2V0dGluZyBpbnRvIGFyY2hhZW9sb2d5LCBidXQpIFdoeSBkbyB3
ZSBoYXZlIHRoaXMgYXMKPiBhIHByYWdtYSBnY2M/Cj4gCj4gU3VyZWx5IGl0IHdvdWxkIGJlIHNp
bXBsZXIgdG8ganVzdCBmZWVkIC1mdmlzaWJpbGl0eT1oaWRkZW4gaW50byBDRkxBR1M/CgpObywg
YXMgcGVyIHRoZSAoYWRtaXR0ZWRseSBub3QgdmVyeSBleHBsaWNpdCkgY29tbWl0IG1lc3NhZ2Ug
b2YgdGhlCmNoYW5nZSBpbnRyb2R1Y2luZyBpdC4gUXVvdGluZyBnY2MgZG9jdW1lbnRhdGlvbiBm
b3IgbWFraW5nIGl0IG1vcmUKb2J2aW91czoKCiJleHRlcm4gZGVjbGFyYXRpb25zIGFyZSBub3Qg
YWZmZWN0ZWQgYnkg4oCYLWZ2aXNpYmlsaXR54oCZLCBzbyBhIGxvdCBvZiBjb2RlCiBjYW4gYmUg
cmVjb21waWxlZCB3aXRoIOKAmC1mdmlzaWJpbGl0eT1oaWRkZW7igJkgd2l0aCBubyBtb2RpZmlj
YXRpb25zLgogSG93ZXZlciwgdGhpcyBtZWFucyB0aGF0IGNhbGxzIHRvIGV4dGVybiBmdW5jdGlv
bnMgd2l0aCBubyBleHBsaWNpdAogdmlzaWJpbGl0eSB1c2UgdGhlIFBMVCwgc28gaXQgaXMgbW9y
ZSBlZmZlY3RpdmUgdG8gdXNlCiBfX2F0dHJpYnV0ZSAoKHZpc2liaWxpdHkpKSBhbmQvb3IgI3By
YWdtYSBHQ0MgdmlzaWJpbGl0eSB0byB0ZWxsIHRoZQogY29tcGlsZXIgd2hpY2ggZXh0ZXJuIGRl
Y2xhcmF0aW9ucyBzaG91bGQgYmUgdHJlYXRlZCBhcyBoaWRkZW4uIgoKSmFuCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBs
aXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2pl
Y3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
