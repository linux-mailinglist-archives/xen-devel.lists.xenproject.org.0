Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C1F3D163E52
	for <lists+xen-devel@lfdr.de>; Wed, 19 Feb 2020 08:57:36 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j4KCf-0005u3-HI; Wed, 19 Feb 2020 07:55:29 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=wVCj=4H=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1j4KCe-0005ty-CH
 for xen-devel@lists.xenproject.org; Wed, 19 Feb 2020 07:55:28 +0000
X-Inumbo-ID: 30c720a2-52ed-11ea-ade5-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 30c720a2-52ed-11ea-ade5-bc764e2007e4;
 Wed, 19 Feb 2020 07:55:27 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 27A48ACE1;
 Wed, 19 Feb 2020 07:55:26 +0000 (UTC)
To: Anthony PERARD <anthony.perard@citrix.com>
References: <20191212182740.2190199-1-anthony.perard@citrix.com>
 <20191212182740.2190199-7-anthony.perard@citrix.com>
 <50800e04-ea99-777f-a268-e296ba18dca6@suse.com>
 <20191213121832.GH1155@perard.uk.xensource.com>
 <a4a398d4-f3f2-a0b4-678c-4586c0b4024f@suse.com>
 <20200218171330.GA2193@perard.uk.xensource.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <75cb93ea-defd-ef2d-3412-7e74a7240e45@suse.com>
Date: Wed, 19 Feb 2020 08:55:26 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <20200218171330.GA2193@perard.uk.xensource.com>
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
Cc: xen-devel@lists.xenproject.org, Andrew Cooper <andrew.cooper3@citrix.com>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTguMDIuMjAyMCAxODoxMywgQW50aG9ueSBQRVJBUkQgd3JvdGU6Cj4gT24gVHVlLCBGZWIg
MTgsIDIwMjAgYXQgMDU6NDM6MzBQTSArMDEwMCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+IE9uIDEz
LjEyLjIwMTkgMTM6MTgsIEFudGhvbnkgUEVSQVJEIHdyb3RlOgo+Pj4gT24gRnJpLCBEZWMgMTMs
IDIwMTkgYXQgMTI6MTM6NTNQTSArMDEwMCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4gT24gMTIu
MTIuMjAxOSAxOToyNywgQW50aG9ueSBQRVJBUkQgd3JvdGU6Cj4+Pj4+IC0tLSBhL3hlbi9hcmNo
L3g4Ni9LY29uZmlnCj4+Pj4+ICsrKyBiL3hlbi9hcmNoL3g4Ni9LY29uZmlnCj4+Pj4+IEBAIC0z
Miw2ICszMiw5IEBAIGNvbmZpZyBBUkNIX0RFRkNPTkZJRwo+Pj4+PiAgCXN0cmluZwo+Pj4+PiAg
CWRlZmF1bHQgImFyY2gveDg2L2NvbmZpZ3MveDg2XzY0X2RlZmNvbmZpZyIKPj4+Pj4gIAo+Pj4+
PiArY29uZmlnIElORElSRUNUX1RIVU5LCj4+Pj4+ICsJZGVmX2Jvb2wgJChjYy1vcHRpb24sLW1p
bmRpcmVjdC1icmFuY2gtcmVnaXN0ZXIpCj4+Pj4KPj4+PiBJJ20gbm90IGhhcHB5IHRvIHNlZSBj
b25zdHJ1Y3RzIGxpa2UgdGhpcyBhcHBlYXIuIFRoZXkgbGVhdmUgYQo+Pj4+ICIjIENPTkZJR18u
Li4gaXMgbm90IGRlZmluZWQiIGluIC5jb25maWcgZm9yIG5vIHJlYXNvbiB3aGVuCj4+Pj4gdGhl
IGV4cHJlc3Npb24gZXZhbHVhdGVzIHRvIG4uCj4+Pgo+Pj4gRm9yIHNvbWUgcmVhc29uLCB0aGlz
IGRvZXNuJ3QgaGFwcGVuLiBJZiAkKENDKSBkb2Vzbid0IHVuZGVyc3RhbmQgdGhlCj4+PiBvcHRp
b24sIHRoZSBDT05GSUdfIGRvZXNuJ3QgYXBwZWFyIGF0IGFsbCBpbiAuY29uZmlnLgo+Pj4KPj4+
IEkgZ3Vlc3MgIiMgQ09ORklHXy4uLiBpcyBub3QgZGVmaW5lZCIgY29tbWVudHMgYXJlIG9ubHkg
dXNlZnVsIGZvcgo+Pj4gb3B0aW9ucyB0aGF0IGNhbiBiZSBzZWxlY3RlZCBieSB1c2Vycywgc28g
S2NvbmZpZyB3b3VsZCBrbm93IG5vdCB0byBhc2sKPj4+IHRoZSB1c2VycyBhZ2Fpbi4gU28sIGZv
ciAib3B0aW9ucyIgdGhhdCBhcmVuJ3QgZm9yIHVzZXJzLCB0aGUgY29tbWVudAo+Pj4gZG9lc24n
dCBuZWVkIHRvIGV4aXN0Lgo+Pj4KPj4+PiBUaGlzIG1heSBub3QgbWF0dGVyIG11Y2ggd2hlbgo+
Pj4+IGNvbnNpZGVyaW5nIGp1c3Qgb25lIHN1Y2ggbGluZSwgYnV0IGl0IHdpbGwgd2hlbiB3ZSBn
YWluCj4+Pj4gZG96ZW5zIG9yIGh1bmRyZWRzLiBGb3Igb3B0aW9ucyB3aXRob3V0IHByb21wdHMg
SSB0aGluayB0aGUKPj4+PiBkZWZhdWx0IHNob3VsZCBvbmx5IGV2ZXIgYmUgc2V0IHRvIHkgKG9y
IG0sIHdoaWNoIHdlIGRvbid0Cj4+Pj4gdXNlKS4gVGhlIGFib3ZlIHdvdWxkIHRoZW4gYmUgd3Jp
dHRlbiBhcwo+Pj4KPj4+IEkgdGhpbmsgS2NvbmZpZyBkZXZlbG9wZXJzIGhhdmUgYWxyZWFkeSBk
b25lIHRoZSB3b3JrIGZvciB0aGF0IDotKS4gU28KPj4+IHRoZSBjb25zdHJ1Y3QgZGVmX2Jvb2wg
eSBpZiAkWCBpc24ndCBuZWVkZWQuCj4+Cj4+IFNvIEkndmUgY2hlY2tlZCAtIGluIExpbnV4IHRo
ZSBsb25nZXIgY29uc3RydWN0IGlzIG5lZWRlZCwgd2hpbGUgaW4KPj4gWGVuIGl0IGlzbid0LiBJ
IGNhbid0IGN1cnJlbnRseSBleHBsYWluIHdoeSB0aGlzIGlzLCBidXQgSSB0YWtlIGl0Cj4+IHRv
IG1lYW4gdGhhdCB3ZSdyZSBhdCByaXNrIG9mIGdldHRpbmcgdGhlIHN0cmF5IGV4dHJhIGxpbmVz
IGVtaXR0ZWQKPj4gd2hlbmV2ZXIgc29tZXRoaW5nIGluIG91ciBLY29uZmlnIGZpbGVzIGNoYW5n
ZXMgaW4gYSB3YXkgdHJpZ2dlcmluZwo+PiB0aGUgc2FtZSBiZWhhdmlvciBhcyBvYnNlcnZlZCBp
biBMaW51eC4KPiAKPiBXaGljaCB2ZXJzaW9uIG9mIExpbnV4PwoKNS41Cgo+IERpZCB5b3UgdGVz
dCB3aXRoICJkZWZfYm9vbCIgYXMgdGhlIHNvbGUgaXRlbSBpbiB0aGUgY29uZmlnIGVudHJ5PwoK
VGhpcwoKY29uZmlnIENDX0lTX0NMQU5HCglkZWZfYm9vbCAkKHN1Y2Nlc3MsJChDQykgLS12ZXJz
aW9uIHwgaGVhZCAtbiAxIHwgZ3JlcCAtcSBjbGFuZykKCnByb2R1Y2VzCgojIENPTkZJR19DQ19J
U19DTEFORyBpcyBub3Qgc2V0CgppbiBhbGwgY29uZmlncyBJJ20gYnVpbGRpbmcuIChBbmQgaXQn
cyBieSBmYXIgbm90IHRoZSBvbmx5IG9uZS4gSW4KZmFjdCBJJ3ZlIGJlZW4gY2FycnlpbmcgYSBw
YXRjaCB3aGljaCBjaGFuZ2VzIHZhcmlvdXMgc3VjaCBsaW5lcywKYW5kIGFzIGEgcmVzdWx0IG9m
IHlvdXIgZWFybGllciByZXBseSBJIHdhcyBpbnRlbmRpbmcgdG8gZHJvcCBpdC4KSnVzdCB0aGF0
IGl0IGRpZG4ndCB3b3JrIGFzIGV4cGVjdGVkLikKCj4gQW5kIGlzbid0IGEgZGVwZW5kZW5jeSBv
ZiBhbm90aGVyIGNvbmZpZz8KClRoaXMgaXNuJ3Qgc3VwcG9zZWQgdG8gbWF0dGVyIGZvciB0aGUg
cHJlc2VuY2UvYWJzZW5jZSBvZiBzYWlkIGxpbmUKaW4gdGhlIHJlc3VsdGluZyAuY29uZmlnLiBJ
J20gbm90IGdvaW5nIHRvIGV4Y2x1ZGUgdGhvdWdoIHRoYXQgdGhlCmN1cnJlbnQgbGFjayBvZiBh
bnkgZGVwZW5kZW5jeSBpbiBYZW4gaXMgdGhlIHJlYXNvbiBmb3IgdGhlCmRpZmZlcmVuY2UgaW4g
YmVoYXZpb3IuCgpKYW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2
ZWw=
