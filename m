Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BD6214CB75
	for <lists+xen-devel@lfdr.de>; Wed, 29 Jan 2020 14:29:05 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iwnNG-00074o-1y; Wed, 29 Jan 2020 13:27:18 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=LL5N=3S=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iwnNE-00074c-Hv
 for xen-devel@lists.xenproject.org; Wed, 29 Jan 2020 13:27:16 +0000
X-Inumbo-ID: 10aa558a-429b-11ea-8396-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 10aa558a-429b-11ea-8396-bc764e2007e4;
 Wed, 29 Jan 2020 13:27:16 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 13CE9AC66;
 Wed, 29 Jan 2020 13:27:15 +0000 (UTC)
To: Tamas K Lengyel <tamas.k.lengyel@gmail.com>
References: <cover.1580148227.git.tamas.lengyel@intel.com>
 <ae2142231342bfc6fb9731303130a2c0fa381576.1580148227.git.tamas.lengyel@intel.com>
 <88661ce4-ef90-c525-586a-4668d4b0001e@suse.com>
 <CABfawhnZTSzh5X0Zctiikw7xhMEDdSGTnW2-eBVC_FsGN9-Ksg@mail.gmail.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <1835b6f4-7361-8979-5a0e-27df5148873a@suse.com>
Date: Wed, 29 Jan 2020 14:27:15 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <CABfawhnZTSzh5X0Zctiikw7xhMEDdSGTnW2-eBVC_FsGN9-Ksg@mail.gmail.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v6 5/9] x86/mem_sharing: use default_access
 in add_to_physmap
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
 Tamas K Lengyel <tamas.lengyel@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjguMDEuMjAyMCAxODowMiwgVGFtYXMgSyBMZW5neWVsIHdyb3RlOgo+IE9uIFR1ZSwgSmFu
IDI4LCAyMDIwIGF0IDk6NTYgQU0gSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPiB3cm90
ZToKPj4KPj4gT24gMjcuMDEuMjAyMCAxOTowNiwgVGFtYXMgSyBMZW5neWVsIHdyb3RlOgo+Pj4g
V2hlbiBwbHVnZ2luZyBhIGhvbGUgaW4gdGhlIHRhcmdldCBwaHlzbWFwIGRvbid0IHVzZSB0aGUg
YWNjZXNzIHBlcm1pc3Npb24KPj4+IHJldHVybmVkIGJ5IF9fZ2V0X2dmbl90eXBlX2FjY2VzcyBh
cyBpdCBjYW4gYmUgbm9uLXNlbnNpY2FsLCBsZWFkaW5nIHRvCj4+PiBzcHVyaW91cyB2bV9ldmVu
dHMgYmVpbmcgc2VudCBvdXQgZm9yIGFjY2VzcyB2aW9sYXRpb25zIGF0IHVuZXhwZWN0ZWQKPj4+
IGxvY2F0aW9ucy4gTWFrZSB1c2Ugb2YgcDJtLT5kZWZhdWx0X2FjY2VzcyBpbnN0ZWFkLgo+Pgo+
PiBBcyBiZWZvcmUsIHRvIG1lICJjYW4gYmUgbm9uLXNlbnNpY2FsIiBpcyBpbnN1ZmZpY2llbnQg
YXMgYSByZWFzb24KPj4gaGVyZS4gSWYgaXQgY2FuIGFsc28gYmUgYSAiZ29vZCIgdmFsdWUsIGl0
IHN0aWxsIHJlbWFpbnMgdW5jbGVhcgo+PiB3aHkgaW4gdGhhdCBjYXNlIHAybS0+ZGVmYXVsdF9h
Y2Nlc3MgaXMgbmV2ZXJ0aGVsZXNzIHRoZSByaWdodAo+PiB2YWx1ZSB0byB1c2UuCj4gCj4gSSBo
YXZlIGFscmVhZHkgZXhwbGFpbmVkIGluIHRoZSBwcmV2aW91cyB2ZXJzaW9uIG9mIHRoZSBwYXRj
aCB3aHkgSQo+IHNhaWQgImNhbiBiZSIuIEZvcmdvdCB0byBjaGFuZ2UgdGhlIGNvbW1pdCBtZXNz
YWdlIGZyb20gImNhbiBiZSIgdG8KPiAiaXMiLgoKQ2hhbmdpbmcganVzdCB0aGUgY29tbWl0IG1l
c3NhZ2Ugd291bGQgYmUgZWFzeSB3aGlsZSBjb21taXR0aW5nLgpCdXQgZXZlbiB3aXRoIHRoZSBj
aGFuZ2UgSSB3b3VsZCBhc2sgd2h5IHRoaXMgaXMuIExvb2tpbmcgYXQKZXB0X2dldF9lbnRyeSgp
IChhbmQgYXNzdW1pbmcgcDJtX3B0X2dldF9lbnRyeSgpIHdpbGwgd29yawpzaW1pbGFybHksIG1p
bnVzIHRoZSBwMm1fYWNjZXNzX3Qgd2hpY2ggY2FuJ3QgY29tZSBvdXQgb2YgdGhlClBURSBqdXN0
IHlldCksIEkgc2VlCgogICAgaWYgKCBpc19lcHRlX3ZhbGlkKGVwdF9lbnRyeSkgKQogICAgewog
ICAgICAgICp0ID0gcDJtX3JlY2FsY190eXBlKHJlY2FsYyB8fCBlcHRfZW50cnktPnJlY2FsYywK
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICBlcHRfZW50cnktPnNhX3AybXQsIHAybSwgZ2Zu
KTsKICAgICAgICAqYSA9IGVwdF9lbnRyeS0+YWNjZXNzOwoKbmVhciBpdHMgZW5kLiBXaGljaCBt
ZWFucyBldmVuIGEgaG9sZSBjYW4gaGF2ZSBpdHMgYWNjZXNzIGZpZWxkCnNldC4gU28gaXQncyBz
dGlsbCBub3QgY2xlYXIgdG8gbWUgZnJvbSB0aGUgZGVzY3JpcHRpb24gd2h5CnAybS0+ZGVmYXVs
dF9hY2Nlc3MgaXMgdW5pZm9ybWx5IHRoZSB2YWx1ZSB0byB1c2UuIFdvdWxkbid0IHlvdQpyYXRo
ZXIgd2FudCB0byBvdmVycmlkZSB0aGUgb3JpZ2luYWwgdmFsdWUgb25seSBpZiBpdCdzCnAybV9h
Y2Nlc3NfbiB0b2dldGhlciB3aXRoIHAybV9pbnZhbGlkIG9yIHAybV9tbWlvX2RtIChidXQgbm90
CnBhZ2VkLW91dCBwYWdlcyk/IE9mIGNvdXJzZSB0aGVuIHRoZSBxdWVzdGlvbiBpcyB3aGV0aGVy
IHRoZXJlCndvdWxkbid0IGJlIGFuIGFtYmlndWl0eSB3aXRoIHAybV9hY2Nlc3NfbiBoYXZpbmcg
Z290IHNldApleHBsaWNpdGx5IG9uIHRoZSBwYWdlLiBCdXQgbWF5YmUgdGhpcyBpcyBpbXBvc3Np
YmxlIGZvcgpwMm1faW52YWxpZCAvIHAybV9tbWlvX2RtPwoKSmFuCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3Jn
L21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
