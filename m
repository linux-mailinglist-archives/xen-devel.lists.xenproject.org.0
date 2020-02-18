Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FC0D162AFA
	for <lists+xen-devel@lfdr.de>; Tue, 18 Feb 2020 17:46:32 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j45yA-0007Dl-6T; Tue, 18 Feb 2020 16:43:34 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=u3z7=4G=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1j45y9-0007Dg-49
 for xen-devel@lists.xenproject.org; Tue, 18 Feb 2020 16:43:33 +0000
X-Inumbo-ID: cc4f7522-526d-11ea-81db-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id cc4f7522-526d-11ea-81db-12813bfff9fa;
 Tue, 18 Feb 2020 16:43:32 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id A7F19C275;
 Tue, 18 Feb 2020 16:43:31 +0000 (UTC)
To: Anthony PERARD <anthony.perard@citrix.com>
References: <20191212182740.2190199-1-anthony.perard@citrix.com>
 <20191212182740.2190199-7-anthony.perard@citrix.com>
 <50800e04-ea99-777f-a268-e296ba18dca6@suse.com>
 <20191213121832.GH1155@perard.uk.xensource.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <a4a398d4-f3f2-a0b4-678c-4586c0b4024f@suse.com>
Date: Tue, 18 Feb 2020 17:43:30 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
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
YXIgYXQgYWxsIGluIC5jb25maWcuCj4gCj4gSSBndWVzcyAiIyBDT05GSUdfLi4uIGlzIG5vdCBk
ZWZpbmVkIiBjb21tZW50cyBhcmUgb25seSB1c2VmdWwgZm9yCj4gb3B0aW9ucyB0aGF0IGNhbiBi
ZSBzZWxlY3RlZCBieSB1c2Vycywgc28gS2NvbmZpZyB3b3VsZCBrbm93IG5vdCB0byBhc2sKPiB0
aGUgdXNlcnMgYWdhaW4uIFNvLCBmb3IgIm9wdGlvbnMiIHRoYXQgYXJlbid0IGZvciB1c2Vycywg
dGhlIGNvbW1lbnQKPiBkb2Vzbid0IG5lZWQgdG8gZXhpc3QuCj4gCj4+IFRoaXMgbWF5IG5vdCBt
YXR0ZXIgbXVjaCB3aGVuCj4+IGNvbnNpZGVyaW5nIGp1c3Qgb25lIHN1Y2ggbGluZSwgYnV0IGl0
IHdpbGwgd2hlbiB3ZSBnYWluCj4+IGRvemVucyBvciBodW5kcmVkcy4gRm9yIG9wdGlvbnMgd2l0
aG91dCBwcm9tcHRzIEkgdGhpbmsgdGhlCj4+IGRlZmF1bHQgc2hvdWxkIG9ubHkgZXZlciBiZSBz
ZXQgdG8geSAob3IgbSwgd2hpY2ggd2UgZG9uJ3QKPj4gdXNlKS4gVGhlIGFib3ZlIHdvdWxkIHRo
ZW4gYmUgd3JpdHRlbiBhcwo+IAo+IEkgdGhpbmsgS2NvbmZpZyBkZXZlbG9wZXJzIGhhdmUgYWxy
ZWFkeSBkb25lIHRoZSB3b3JrIGZvciB0aGF0IDotKS4gU28KPiB0aGUgY29uc3RydWN0IGRlZl9i
b29sIHkgaWYgJFggaXNuJ3QgbmVlZGVkLgoKU28gSSd2ZSBjaGVja2VkIC0gaW4gTGludXggdGhl
IGxvbmdlciBjb25zdHJ1Y3QgaXMgbmVlZGVkLCB3aGlsZSBpbgpYZW4gaXQgaXNuJ3QuIEkgY2Fu
J3QgY3VycmVudGx5IGV4cGxhaW4gd2h5IHRoaXMgaXMsIGJ1dCBJIHRha2UgaXQKdG8gbWVhbiB0
aGF0IHdlJ3JlIGF0IHJpc2sgb2YgZ2V0dGluZyB0aGUgc3RyYXkgZXh0cmEgbGluZXMgZW1pdHRl
ZAp3aGVuZXZlciBzb21ldGhpbmcgaW4gb3VyIEtjb25maWcgZmlsZXMgY2hhbmdlcyBpbiBhIHdh
eSB0cmlnZ2VyaW5nCnRoZSBzYW1lIGJlaGF2aW9yIGFzIG9ic2VydmVkIGluIExpbnV4LgoKSmFu
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2
ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xp
c3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
