Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A129FCB3F4
	for <lists+xen-devel@lfdr.de>; Fri,  4 Oct 2019 06:40:40 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iGFLl-0003Ew-Cc; Fri, 04 Oct 2019 04:37:53 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=lyic=X5=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1iGFLk-0003Er-3B
 for xen-devel@lists.xenproject.org; Fri, 04 Oct 2019 04:37:52 +0000
X-Inumbo-ID: b8b19a32-e660-11e9-973e-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b8b19a32-e660-11e9-973e-12813bfff9fa;
 Fri, 04 Oct 2019 04:37:50 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id B41FEADAA;
 Fri,  4 Oct 2019 04:37:49 +0000 (UTC)
To: Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org
References: <20191003181203.22405-1-boris.ostrovsky@oracle.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <9995b9f1-3d58-7caa-9ce6-13475445d4ac@suse.com>
Date: Fri, 4 Oct 2019 06:37:48 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20191003181203.22405-1-boris.ostrovsky@oracle.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v2] x86/xen: Return from panic notifier
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
Cc: Jan Beulich <jbeulich@suse.com>, james@dingwall.me.uk
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDMuMTAuMTkgMjA6MTIsIEJvcmlzIE9zdHJvdnNreSB3cm90ZToKPiBDdXJyZW50bHkgZXhl
Y3V0aW9uIG9mIHBhbmljKCkgY29udGludWVzIHVudGlsIFhlbidzIHBhbmljIG5vdGlmaWVyCj4g
KHhlbl9wYW5pY19ldmVudCgpKSBpcyBjYWxsZWQgYXQgd2hpY2ggcG9pbnQgd2UgbWFrZSBhIGh5
cGVyY2FsbCB0aGF0Cj4gbmV2ZXIgcmV0dXJucy4KPiAKPiBUaGlzIG1lYW5zIHRoYXQgYW55IG5v
dGlmaWVyIHRoYXQgaXMgc3VwcG9zZWQgdG8gYmUgY2FsbGVkIGxhdGVyIGFzCj4gd2VsbCBhcyBz
aWduaWZpY2FudCBwYXJ0IG9mIHBhbmljKCkgY29kZSAoc3VjaCBhcyBwc3RvcmUgd3JpdGVzIGZy
b20KPiBrbXNnX2R1bXAoKSkgaXMgbmV2ZXIgZXhlY3V0ZWQuCj4gCj4gVGhlcmUgaXMgbm8gcmVh
c29uIGZvciB4ZW5fcGFuaWNfZXZlbnQoKSB0byBiZSB0aGlzIGxhc3QgcG9pbnQgaW4KPiBleGVj
dXRpb24gc2luY2UgcGFuaWMoKSdzIGVtZXJnZW5jeV9yZXN0YXJ0KCkgd2lsbCBjYWxsIGludG8K
PiB4ZW5fZW1lcmdlbmN5X3Jlc3RhcnQoKSBmcm9tIHdoZXJlIHdlIGNhbiBwZXJmb3JtIG91ciBo
eXBlcmNhbGwuCj4gCj4gTmV2ZXJ0aGVsZXNzLCB3ZSB3aWxsIHByb3ZpZGUgeGVuX2xlZ2FjeV9j
cmFzaCBib290IG9wdGlvbiB0aGF0IHdpbGwKPiBwcmVzZXJ2ZSBvcmlnaW5hbCBiZWhhdmlvciBk
dXJpbmcgY3Jhc2guIFRoaXMgb3B0aW9uIGNvdWxkIGJlIHVzZWQsCj4gZm9yIGV4YW1wbGUsIGlm
IHJ1bm5pbmcga2VybmVsIGR1bXBlciAod2hpY2ggaGFwcGVucyBhZnRlciBwYW5pYwo+IG5vdGlm
aWVycykgaXMgdW5kZXNpcmFibGUuCj4gCj4gUmVwb3J0ZWQtYnk6IEphbWVzIERpbmd3YWxsIDxq
YW1lc0BkaW5nd2FsbC5tZS51az4KPiBTaWduZWQtb2ZmLWJ5OiBCb3JpcyBPc3Ryb3Zza3kgPGJv
cmlzLm9zdHJvdnNreUBvcmFjbGUuY29tPgoKUmV2aWV3ZWQtYnk6IEp1ZXJnZW4gR3Jvc3MgPGpn
cm9zc0BzdXNlLmNvbT4KCgpKdWVyZ2VuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVs
