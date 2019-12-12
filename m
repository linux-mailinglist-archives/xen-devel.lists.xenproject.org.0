Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B916111CFAE
	for <lists+xen-devel@lfdr.de>; Thu, 12 Dec 2019 15:23:23 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ifPLH-0001as-7u; Thu, 12 Dec 2019 14:21:23 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Y65U=2C=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1ifPLF-0001aZ-2b
 for xen-devel@lists.xenproject.org; Thu, 12 Dec 2019 14:21:21 +0000
X-Inumbo-ID: a9908f7a-1cea-11ea-8d69-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a9908f7a-1cea-11ea-8d69-12813bfff9fa;
 Thu, 12 Dec 2019 14:21:18 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id CFF16B199;
 Thu, 12 Dec 2019 14:21:17 +0000 (UTC)
To: Nicholas Tsirakis <niko.tsirakis@gmail.com>, boris.ostrovsky@oracle.com
References: <CAFqpmVJ90bAV4vasH1Z0DcTUjT7asCJFPeJBxtxGZwAhTVP7=w@mail.gmail.com>
 <b02d053f-1b07-bd4f-20fc-9a26106145d1@suse.com>
 <CAFqpmVLnHPUZEpvmw1-f=2LoPkfUHO67ETdwtnsPA7DsXRSRSA@mail.gmail.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <7feb44ef-0957-3df1-3411-2a7b971d8931@suse.com>
Date: Thu, 12 Dec 2019 15:21:14 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <CAFqpmVLnHPUZEpvmw1-f=2LoPkfUHO67ETdwtnsPA7DsXRSRSA@mail.gmail.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [BUG] Xen-ballooned memory never returned to domain
 after partial-free
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
Cc: xen-devel <xen-devel@lists.xenproject.org>, linux-kernel@vger.kernel.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTIuMTIuMTkgMTU6MTAsIE5pY2hvbGFzIFRzaXJha2lzIHdyb3RlOgo+PiBBbmQgSSB0aGlu
ayB0aGlzIGlzIHRoZSBwcm9ibGVtLiBXZSB3YW50IGhlcmU6Cj4+Cj4+ICAgICAgYmFsbG9vbl9z
dGF0cy50YXJnZXRfcGFnZXMgPSBiYWxsb29uX3N0YXRzLmN1cnJlbnRfcGFnZXMgKwo+PiAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgYmFsbG9vbl9zdGF0cy50YXJnZXRfdW5wb3B1
bGF0ZWQ7Cj4gCj4gQWhoIEkga25ldyBJIHdhcyBtaXNzaW5nIHNvbWV0aGluZy4gVGVzdGVkIHRo
ZSBwYXRjaCwgd29ya3MgZ3JlYXQhICJSZXBvcnRlZCBieSIKPiBpcyBmaW5lIHdpdGggbWUuCgpU
aGFua3MuCgo+IAo+IERvIHlvdSBoYXBwZW4gdG8ga25vdyB0aGUgYW5zd2VyIHRvIG15IHNlY29u
ZCBxdWVzdGlvbj8gSXQncyBub3QgYXMgaW1wb3J0YW50LAo+IGJ1dCBpdCBkb2VzIGNvbmZ1c2Ug
bWUgYXMgSSB3b3VsZG4ndCBleHBlY3QgdGhlIHRvdGFsIG1lbW9yeSB0byBiZQo+IGJhbGxvb24t
YWJsZSBhdAo+IGFsbCB3aXRoIHRoZSBob3RwbHVnZ2luZyBjb25maWdzIGRpc2FibGVkLgoKQmFs
bG9vbmluZyAhPSBob3RwbHVnZ2luZyBtZW1vcnkKCldpdGggbWVtb3J5IGhvdHBsdWcgeW91IGNh
biBhZGQgKG9yIC0gaW4gdGhlb3J5IC0gcmVtb3ZlKSBtZW1vcnkgdG8gdGhlCmtlcm5lbCBpdCBk
aWRuJ3Qga25vdyBhYm91dCBiZWZvcmUuCgpXaXRoIGJhbGxvb25pbmcgeW91IGp1c3QgZ2l2ZSBz
b21lIG1lbW9yeSBiYWNrIHRvIHRoZSBoeXBlcnZpc29yLCBidXQKa2VybmVsIHN0aWxsIGhhcyBz
b21lIGtub3dsZWRnZSBhYm91dCBpdCAoZS5nLiBrZWVwcyBzdHJ1Y3QgcGFnZSBmb3IKZWFjaCBi
YWxsb29uZWQgbWVtb3J5IHBhZ2UpLgoKSFRILCBKdWVyZ2VuCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21h
aWxtYW4vbGlzdGluZm8veGVuLWRldmVs
