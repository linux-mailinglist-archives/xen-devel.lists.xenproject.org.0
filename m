Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E1CD11E394
	for <lists+xen-devel@lfdr.de>; Fri, 13 Dec 2019 13:30:02 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ifk2R-0008Rl-S2; Fri, 13 Dec 2019 12:27:19 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=D6vH=2D=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1ifk2Q-0008Rg-OJ
 for xen-devel@lists.xenproject.org; Fri, 13 Dec 2019 12:27:18 +0000
X-Inumbo-ID: e510be08-1da3-11ea-8eee-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e510be08-1da3-11ea-8eee-12813bfff9fa;
 Fri, 13 Dec 2019 12:27:15 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 842EEAE35;
 Fri, 13 Dec 2019 12:27:14 +0000 (UTC)
To: Anthony PERARD <anthony.perard@citrix.com>
References: <20191212182740.2190199-1-anthony.perard@citrix.com>
 <20191212182740.2190199-7-anthony.perard@citrix.com>
 <50800e04-ea99-777f-a268-e296ba18dca6@suse.com>
 <20191213121832.GH1155@perard.uk.xensource.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <8ddcce61-fda0-9aa6-c47a-2398d7f3c91e@suse.com>
Date: Fri, 13 Dec 2019 13:27:36 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20191213121832.GH1155@perard.uk.xensource.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [XEN PATCH 6/8] xen: Move CONFIG_INDIRECT_THUNK to
 Kconfig
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
Cc: xen-devel@lists.xenproject.org,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTMuMTIuMjAxOSAxMzoxOCwgQW50aG9ueSBQRVJBUkQgd3JvdGU6Cj4gT24gRnJpLCBEZWMg
MTMsIDIwMTkgYXQgMTI6MTM6NTNQTSArMDEwMCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+IE9uIDEy
LjEyLjIwMTkgMTk6MjcsIEFudGhvbnkgUEVSQVJEIHdyb3RlOgo+Pj4gLS0tIGEveGVuL2FyY2gv
eDg2L0tjb25maWcKPj4+ICsrKyBiL3hlbi9hcmNoL3g4Ni9LY29uZmlnCj4+PiBAQCAtMzIsNiAr
MzIsOSBAQCBjb25maWcgQVJDSF9ERUZDT05GSUcKPj4+ICAJc3RyaW5nCj4+PiAgCWRlZmF1bHQg
ImFyY2gveDg2L2NvbmZpZ3MveDg2XzY0X2RlZmNvbmZpZyIKPj4+ICAKPj4+ICtjb25maWcgSU5E
SVJFQ1RfVEhVTksKPj4+ICsJZGVmX2Jvb2wgJChjYy1vcHRpb24sLW1pbmRpcmVjdC1icmFuY2gt
cmVnaXN0ZXIpCj4+Cj4+IEknbSBub3QgaGFwcHkgdG8gc2VlIGNvbnN0cnVjdHMgbGlrZSB0aGlz
IGFwcGVhci4gVGhleSBsZWF2ZSBhCj4+ICIjIENPTkZJR18uLi4gaXMgbm90IGRlZmluZWQiIGlu
IC5jb25maWcgZm9yIG5vIHJlYXNvbiB3aGVuCj4+IHRoZSBleHByZXNzaW9uIGV2YWx1YXRlcyB0
byBuLgo+IAo+IEZvciBzb21lIHJlYXNvbiwgdGhpcyBkb2Vzbid0IGhhcHBlbi4gSWYgJChDQykg
ZG9lc24ndCB1bmRlcnN0YW5kIHRoZQo+IG9wdGlvbiwgdGhlIENPTkZJR18gZG9lc24ndCBhcHBl
YXIgYXQgYWxsIGluIC5jb25maWcuCgpPaCwgdGhlbiBhbGwgaXMgZmluZSBoZXJlLiBJIGd1ZXNz
IHRoZXkgbWFkZSB0aGlzIHdvcmsgbW9yZSBuaWNlbHkKaW4gcmVjZW50IEtjb25maWcgLSBteSBj
b21tZW50IGFib3ZlIHdhcyBiYXNlZCBvbiBvYnNlcnZhdGlvbnMgaW4KdGhlIHBhc3QuCgpKYW4K
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZl
bCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlz
dHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
