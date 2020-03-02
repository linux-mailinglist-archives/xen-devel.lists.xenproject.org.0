Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AB84D175751
	for <lists+xen-devel@lfdr.de>; Mon,  2 Mar 2020 10:39:39 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j8hV1-0004Ru-Rw; Mon, 02 Mar 2020 09:36:31 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=GA0H=4T=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1j8hV0-0004Rp-6y
 for xen-devel@lists.xenproject.org; Mon, 02 Mar 2020 09:36:30 +0000
X-Inumbo-ID: 4b1dd416-5c69-11ea-9f13-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 4b1dd416-5c69-11ea-9f13-12813bfff9fa;
 Mon, 02 Mar 2020 09:36:29 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 7716BAC7C;
 Mon,  2 Mar 2020 09:36:28 +0000 (UTC)
From: Jan Beulich <jbeulich@suse.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <f189462f-702f-0726-9b3c-c6fd1fec8407@citrix.com>
 <edb1954d-ac57-462a-6c71-5f90cceb3dfb@suse.com>
Message-ID: <9e447942-325e-f422-9755-4090f6cf222d@suse.com>
Date: Mon, 2 Mar 2020 10:36:27 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <edb1954d-ac57-462a-6c71-5f90cceb3dfb@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] PVH dom0 construction timeout
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
Cc: xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDIuMDMuMjAyMCAxMDoyNCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gT24gMjguMDIuMjAyMCAy
MjowOCwgQW5kcmV3IENvb3BlciB3cm90ZToKPj4gcGFnZV9nZXRfcmFtX3R5cGUoKSBpcyBkZWZp
bml0ZWx5IHN1Ym9wdGltYWwgaGVyZS7CoCBXZSBoYXZlIGFuIGxpbmVhcgo+PiBzZWFyY2ggb3Zl
ciBhIChsYXJnZS1pc2gpIHNvcnRlZCBsaXN0LCBhbmQgYSBjYWxsZXIgd2hpY2ggaGFzIGV2ZXJ5
IE1GTgo+PiBpbiB0aGUgc3lzdGVtIHBhc3NlZCBpbnRvIGl0LCB3aGljaCBtYWtlcyB0aGUgdG90
YWwgcnVudGltZSBvZgo+PiBhcmNoX2lvbW11X2h3ZG9tX2luaXQoKSBxdWFkcmF0aWMgd2l0aCB0
aGUgc2l6ZSBvZiB0aGUgc3lzdGVtLgo+IAo+IFRoaXMgbGluZWFyIHNlYXJjaCBpcyB0aGUgc2Ft
ZSBmb3IgUFZIIGFuZCBQViwgaXNuJ3QgaXQ/IEluCj4gZmFjdCBod2RvbV9pb21tdV9tYXAoKSwg
b24gdGhlIGF2ZXJhZ2UsIG1heSBkbyBtb3JlIHdvcmsgZm9yCj4gUFYgdGhhbiBmb3IgUFZILCBj
b25zaWRlcmluZyB0aGUgaXNfaHZtX2RvbWFpbigpLWJhc2VkIHJldHVybgo+IGZyb20gdGhlIHN3
aXRjaCgpJ3MgZGVmYXVsdCBjYXNlLiBTbyBmb3IgdGhlIG1vbWVudCBJIGNvdWxkCj4gZXhwbGFp
biBzdWNoIGEgaHVnZSBkaWZmZXJlbmNlIGluIGNvbnN1bWVkIHRpbWUgb25seSBpZiB0aGUKPiBQ
ViBjYXNlIHJhbiB3aXRoIGlvbW11X2h3ZG9tX3Bhc3N0aHJvdWdoIHNldCB0byB0cnVlICh3aGlj
aAo+IGlzbid0IHBvc3NpYmxlIGZvciBQVkgpLgoKQWN0dWFsbHkgdGhlIGRpZmZlcmluZyBpb21t
dV9od2RvbV9zdHJpY3Qgc2V0dGluZyBtYXkgbWF0dGVyCmhlcmUsIGJ1dCBpdCBiZWluZyBjbGVh
ciAocG9zc2libGUgb25seSBpbiB0aGUgUFYgY2FzZSkgd291bGQKbWVhbiBtb3JlIGFjdHVhbCBt
YXBwaW5nIG9wZXJhdGlvbnMgZ2V0IGNhcnJpZWQgb3V0LCBpLmUuCnNob3VsZCByZXN1bHQgaW4g
c2xvd2VyIG92ZXJhbGwgZXhlY3V0aW9uLiBTbyBJJ20gc3RpbGwKcHV6emxlZCBieSB0aGUgb2Jz
ZXJ2ZWQgZGlmZmVyZW5jZSBpbiBjb25zdW1lZCB0aW1lLgoKSmFuCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3Jn
L21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
