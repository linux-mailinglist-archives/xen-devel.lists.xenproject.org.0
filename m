Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A7DA513277D
	for <lists+xen-devel@lfdr.de>; Tue,  7 Jan 2020 14:22:44 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ioomm-0004wE-ND; Tue, 07 Jan 2020 13:20:40 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=a7vm=24=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1ioomk-0004w9-TI
 for xen-devel@lists.xenproject.org; Tue, 07 Jan 2020 13:20:38 +0000
X-Inumbo-ID: 7e218ce9-3150-11ea-ac00-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 7e218ce9-3150-11ea-ac00-12813bfff9fa;
 Tue, 07 Jan 2020 13:20:37 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id EB572AE2C;
 Tue,  7 Jan 2020 13:20:36 +0000 (UTC)
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <20200107122501.15511-1-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <81563bfb-0e7b-f3b2-caca-186ba185a4b9@suse.com>
Date: Tue, 7 Jan 2020 14:20:35 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20200107122501.15511-1-andrew.cooper3@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] x86/vmx: Shrink TASK_SWITCH's
 hvm_task_switch_reason reasons[]
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
 Kevin Tian <kevin.tian@intel.com>, Jun Nakajima <jun.nakajima@intel.com>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDcuMDEuMjAyMCAxMzoyNSwgQW5kcmV3IENvb3BlciB3cm90ZToKPiBObyBuZWVkIHRvIHVz
ZSA0LWJ5dGUgaW50ZWdlcnMgdG8gc3RvcmUgdHdvIGJpdHMgb2YgaW5mb3JtYXRpb24uCj4gCj4g
U2lnbmVkLW9mZi1ieTogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4K
CkluIHByaW5jaXBsZQpSZXZpZXdlZC1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29t
PgpCdXQgLi4uCgo+IC0tLSBhL3hlbi9hcmNoL3g4Ni9odm0vdm14L3ZteC5jCj4gKysrIGIveGVu
L2FyY2gveDg2L2h2bS92bXgvdm14LmMKPiBAQCAtMzk3OCw3ICszOTc4LDcgQEAgdm9pZCB2bXhf
dm1leGl0X2hhbmRsZXIoc3RydWN0IGNwdV91c2VyX3JlZ3MgKnJlZ3MpCj4gICAgICAgICAgdm14
X3VwZGF0ZV9jcHVfZXhlY19jb250cm9sKHYpOwo+ICAgICAgICAgIGJyZWFrOwo+ICAgICAgY2Fz
ZSBFWElUX1JFQVNPTl9UQVNLX1NXSVRDSDogewo+IC0gICAgICAgIHN0YXRpYyBjb25zdCBlbnVt
IGh2bV90YXNrX3N3aXRjaF9yZWFzb24gcmVhc29uc1tdID0gewo+ICsgICAgICAgIHN0YXRpYyBj
b25zdCBpbnQ4X3QgcmVhc29uc1tdID0gewo+ICAgICAgICAgICAgICBUU1dfY2FsbF9vcl9pbnQs
IFRTV19pcmV0LCBUU1dfam1wLCBUU1dfY2FsbF9vcl9pbnQKPiAgICAgICAgICB9OwoKLi4uIGdp
dmVuIG91ciBnZW5lcmFsIHByZWZlcmVuY2Ugb2YgdW5zaWduZWQgdHlwZXMgd2hlbiB2YWx1ZXMK
Y2FuJ3QgYmVjb21lIG5lZ2F0aXZlLCB3aHkgbm90IHVpbnQ4X3Q/CgpBcyBhbiBhc2lkZSwgZWxz
ZXdoZXJlIEkgc2F3IHBlb3BsZSBzdGFydGluZyB0byBjb252ZXJ0IGNvZGUKYmVjYXVzZSBhcHBh
cmVudGx5IGdjYyAxMCB3aWxsIHdhcm4gYWJvdXQgZW51bSB0eXBlIG1pc21hdGNoZXMuCkkgZGlk
bid0IGludmVzdGlnYXRlIHlldCB3aGV0aGVyIHRoYXQncyBqdXN0IGZvciBlbnVtIC0+IGVudW0K
Y29udmVyc2lvbnMsIG9yIGFsc28gZm9yIGVudW0gPC0gLyAtPiBpbnRlZ2VyIG9uZXMuIE9mIGNv
dXJzZQppdCB3b3VsZG4ndCBiZSB0aGUgZW5kIG9mIHRoZSB3b3JsZCBpZiB3ZSBoYWQgdG8gcmV2
ZXJ0IHRoZQpjaGFuZ2UgYWJvdmU7IGRpZCB5b3UgY29uc2lkZXIgdGhlIGFsdGVybmF0aXZlIG9m
IG1ha2luZyB0aGUKZW51bSBhIF9fcGFja2VkIG9uZSAod2hpY2ggd291bGQgYXZvaWQgcG90ZW50
aWFsIGlzc3VlcyBsaWtlCnRoZSBvbmUgbmFtZWQpPwoKSmFuCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21h
aWxtYW4vbGlzdGluZm8veGVuLWRldmVs
