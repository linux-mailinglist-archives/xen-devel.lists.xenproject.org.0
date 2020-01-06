Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EEACC1313C4
	for <lists+xen-devel@lfdr.de>; Mon,  6 Jan 2020 15:36:15 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ioTSC-0003tG-Ll; Mon, 06 Jan 2020 14:34:00 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=5DW6=23=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1ioTSB-0003tA-Sa
 for xen-devel@lists.xenproject.org; Mon, 06 Jan 2020 14:33:59 +0000
X-Inumbo-ID: 93310c7c-3091-11ea-ab11-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 93310c7c-3091-11ea-ab11-12813bfff9fa;
 Mon, 06 Jan 2020 14:33:59 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 04F1FAB3D;
 Mon,  6 Jan 2020 14:33:58 +0000 (UTC)
To: Anthony PERARD <anthony.perard@citrix.com>
References: <20191217105901.68158-1-anthony.perard@citrix.com>
 <20191217105901.68158-3-anthony.perard@citrix.com>
 <c2285ab6-8627-545b-eedc-61e3c9e46769@suse.com>
 <20200106140147.GI1267@perard.uk.xensource.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <0a9b734c-b6fd-046f-83c9-68fe486d46d6@suse.com>
Date: Mon, 6 Jan 2020 15:34:43 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20200106140147.GI1267@perard.uk.xensource.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [XEN PATCH v2 2/6] xen: Have Kconfig check $(CC)'s
 version
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
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDYuMDEuMjAyMCAxNTowMSwgQW50aG9ueSBQRVJBUkQgd3JvdGU6Cj4gT24gRnJpLCBKYW4g
MDMsIDIwMjAgYXQgMDU6NDI6MThQTSArMDEwMCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+IE9uIDE3
LjEyLjIwMTkgMTE6NTgsIEFudGhvbnkgUEVSQVJEIHdyb3RlOgo+Pj4gLS0tIGEveGVuL0tjb25m
aWcKPj4+ICsrKyBiL3hlbi9LY29uZmlnCj4+PiBAQCAtNCw5ICs0LDI2IEBACj4+PiAgIwo+Pj4g
IG1haW5tZW51ICJYZW4vJChTUkNBUkNIKSAkKFhFTl9GVUxMVkVSU0lPTikgQ29uZmlndXJhdGlv
biIKPj4+ICAKPj4+ICtzb3VyY2UgInNjcmlwdHMvS2NvbmZpZy5pbmNsdWRlIgo+Pj4gKwo+Pj4g
IGNvbmZpZyBCUk9LRU4KPj4+ICAJYm9vbAo+Pj4gIAo+Pj4gK2NvbmZpZyBDQ19JU19HQ0MKPj4+
ICsJZGVmX2Jvb2wgJChzdWNjZXNzLCQoQ0MpIC0tdmVyc2lvbiB8IGhlYWQgLW4gMSB8IGdyZXAg
LXEgZ2NjKQo+Pj4gKwo+Pj4gK2NvbmZpZyBHQ0NfVkVSU0lPTgo+Pj4gKwlpbnQKPj4+ICsJZGVm
YXVsdCAkKHNoZWxsLCQoQkFTRURJUikvc2NyaXB0cy9nY2MtdmVyc2lvbi5zaCAkKENDKSkgaWYg
Q0NfSVNfR0NDCj4+PiArCWRlZmF1bHQgMAo+Pgo+PiBXaHkgImlmIiBhbmQgYSAybmQgImRlZmF1
bHQiIGxpbmUgaGVyZSBidXQgLi4uCj4+Cj4+PiArY29uZmlnIENDX0lTX0NMQU5HCj4+PiArCWRl
Zl9ib29sICQoc3VjY2VzcywkKENDKSAtLXZlcnNpb24gfCBoZWFkIC1uIDEgfCBncmVwIC1xIGNs
YW5nKQo+Pj4gKwo+Pj4gK2NvbmZpZyBDTEFOR19WRVJTSU9OCj4+PiArCWludAo+Pj4gKwlkZWZh
dWx0ICQoc2hlbGwsJChCQVNFRElSKS9zY3JpcHRzL2NsYW5nLXZlcnNpb24uc2ggJChDQykpCj4+
Cj4+IC4uLiBqdXN0IGEgc2luZ2xlLCB1bmNvbmRpdGlvbmFsIG9uZSBoZXJlPwo+IAo+IGNsYW5n
LXZlcnNpb24uc2ggcmV0dXJucyAwIHdoZW4gQ0MgaXNuJ3QgY2xhbmcsIGJ1dCBnY2MtdmVyc2lv
bi5zaAo+IGRvZXNuJ3QgY2hlY2sgaWYgQ0MgaXMgZ2NjLCBhbmQgcmV0dXJucyBhIGJvZ3VzIHZh
bHVlcyBpbnN0ZWFkLgo+IAo+IGUuZy46Cj4gCj4gJCAuL2NsYW5nLXZlcnNpb24uc2ggY2xhbmcK
PiA5MDAwMAo+ICQgLi9nY2MtdmVyc2lvbi5zaCBjbGFuZwo+IDQwMjAxCgpJbW8gYm90aCBzY3Jp
cHRzIHNob3VsZCBiZWhhdmUgaWRlbnRpY2FsbHkgaW4gdGhpcyByZWdhcmQgKGFuZCBpbiBmYWN0
CmluIGFsbCB1c2FnZSByZWxhdGVkIG9uZXMpLiBJZiBhZGp1c3RpbmcgdGhlIHNjcmlwdHMgaXMg
ZW50aXJlbHkKdW5hY2NlcHRhYmxlIGZvciBzb21lIHJlYXNvbiwgdGhlbiB0aGUgZGVzY3JpcHRp
b24gc2hvdWxkIGhpZ2hsaWdodAp0aGUgbmVlZCBmb3IgdGhlIGRpZmZlcmVuY2VzLgoKPj4gV291
bGRuJ3QgYm90aCBiZXR0ZXIKPj4gaGF2ZSBhICJkZXBlbmRzIG9uIENDX0lTXyoiIGxpbmUgaW5z
dGVhZD8gVGhpcyB3b3VsZCB0aGVuIGFsc28KPj4gcmVzdWx0IChhZmFpY3QpIGluIG5vIENPTkZJ
R19DTEFOR19WRVJTSU9OIGluIC5jb25maWcgaWYgYnVpbGRpbmcKPj4gd2l0aCBnY2MgKGFuZCB2
aWNlIHZlcnNhKSwgaW5zdGVhZCBvZiBhIGJvZ3VzIENPTkZJR19DTEFOR19WRVJTSU9OPTAuCj4g
Cj4gSXQgc291bmRzIGF0dHJhY3RpbmcgdG8gcmVtb3ZlIHZhcmlhYmxlcyBmcm9tIC5jb25maWcs
IGJ1dCBpdCBpcyBlcXVhbGx5Cj4gYXR0cmFjdGluZyB0byBhbHdheXMgaGF2ZSBhIHZhcmlhYmxl
IHNldC4gSXQgY2FuIGJlIHVzZWQKPiB1bmNvbmRpdGlvbmFsbHkgd2hlbiBhbHdheXMgc2V0ICh3
aXRob3V0IHJpc2tpbmcgaW52YWxpZCBzeW50YXggZm9yCj4gZXhhbXBsZSkuCgpIbW0sIHllcywg
YXMgbG9uZyBhcyB3ZSBkb24ndCBoYXZlIChieSBtZWNoYW5pY2FsIGNvbnZlcnNpb24pIG9yIGdh
aW4KY29uc3RydWN0cyBsaWtlCgojaWYgQ09ORklHX0dDQ19WRVJTSU9OIDwgNTAwMDAgLyogbXVz
dCBiZSBnY2MgNC54ICovCgpQbHVzIC0gd2hhdCdzIENPTkZJR19DQ19JU197R0NDLENMQU5HfSBn
b29kIGZvciB0aGVuPyBUaGUgc2FtZSBjYW4KdGhlbiBiZSBhY2hpZXZlZCBieSBjb21wYXJpbmcg
Q09ORklHX3tHQ0MsQ0xBTkd9X1ZFUlNJT04gYWdhaW5zdCB6ZXJvLgoKSmFuCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBs
aXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2pl
Y3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
