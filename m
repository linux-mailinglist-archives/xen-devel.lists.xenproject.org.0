Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 420ECC46AC
	for <lists+xen-devel@lfdr.de>; Wed,  2 Oct 2019 06:40:11 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iFWNR-0004Po-Iy; Wed, 02 Oct 2019 04:36:37 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=lglc=X3=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1iFWNQ-0004Pj-6n
 for xen-devel@lists.xenproject.org; Wed, 02 Oct 2019 04:36:36 +0000
X-Inumbo-ID: 362860d4-e4ce-11e9-97fb-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by localhost (Halon) with ESMTPS
 id 362860d4-e4ce-11e9-97fb-bc764e2007e4;
 Wed, 02 Oct 2019 04:36:34 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id EA59AAF56;
 Wed,  2 Oct 2019 04:36:32 +0000 (UTC)
To: Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org
References: <20191001151633.1659-1-boris.ostrovsky@oracle.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <3fb02346-16b8-1885-32b3-8d136ad7118b@suse.com>
Date: Wed, 2 Oct 2019 06:36:31 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20191001151633.1659-1-boris.ostrovsky@oracle.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] x86/xen: Return from panic notifier
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
Cc: james@dingwall.me.uk
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDEuMTAuMTkgMTc6MTYsIEJvcmlzIE9zdHJvdnNreSB3cm90ZToKPiBDdXJyZW50bHkgZXhl
Y3V0aW9uIG9mIHBhbmljKCkgY29udGludWVzIHVudGlsIFhlbidzIHBhbmljIG5vdGlmaWVyCj4g
KHhlbl9wYW5pY19ldmVudCgpKSBpcyBjYWxsZWQgYXQgd2hpY2ggcG9pbnQgd2UgbWFrZSBhIGh5
cGVyY2FsbCB0aGF0Cj4gbmV2ZXIgcmV0dXJucy4KPiAKPiBUaGlzIG1lYW5zIHRoYXQgYW55IG5v
dGlmaWVyIHRoYXQgaXMgc3VwcG9zZWQgdG8gYmUgY2FsbGVkIGxhdGVyIGFzCj4gd2VsbCBhcyBz
aWduaWZpY2FudCBwYXJ0IG9mIHBhbmljKCkgY29kZSAoc3VjaCBhcyBwc3RvcmUgd3JpdGVzIGZy
b20KPiBrbXNnX2R1bXAoKSkgaXMgbmV2ZXIgZXhlY3V0ZWQuCj4gCj4gVGhlcmUgaXMgbm8gcmVh
c29uIGZvciB4ZW5fcGFuaWNfZXZlbnQoKSB0byBiZSB0aGlzIGxhc3QgcG9pbnQgaW4KPiBleGVj
dXRpb24gc2luY2UgcGFuaWMoKSdzIGVtZXJnZW5jeV9yZXN0YXJ0KCkgd2lsbCBjYWxsIGludG8K
PiB4ZW5fZW1lcmdlbmN5X3Jlc3RhcnQoKSBmcm9tIHdoZXJlIHdlIGNhbiBwZXJmb3JtIG91ciBo
eXBlcmNhbGwuCj4gCj4gUmVwb3J0ZWQtYnk6IEphbWVzIERpbmd3YWxsIDxqYW1lc0BkaW5nd2Fs
bC5tZS51az4KPiBTaWduZWQtb2ZmLWJ5OiBCb3JpcyBPc3Ryb3Zza3kgPGJvcmlzLm9zdHJvdnNr
eUBvcmFjbGUuY29tPgoKUmV2aWV3ZWQtYnk6IEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNv
bT4KCgpKdWVyZ2VuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9y
ZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
