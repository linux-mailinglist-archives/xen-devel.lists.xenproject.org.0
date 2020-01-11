Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ED9B3138262
	for <lists+xen-devel@lfdr.de>; Sat, 11 Jan 2020 17:29:45 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iqJbf-0006mD-W7; Sat, 11 Jan 2020 16:27:23 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=BHOt=3A=gmail.com=julien.grall.oss@srs-us1.protection.inumbo.net>)
 id 1iqJbe-0006m8-8r
 for xen-devel@lists.xenproject.org; Sat, 11 Jan 2020 16:27:22 +0000
X-Inumbo-ID: 3db90e1e-348f-11ea-8094-12813bfff9fa
Received: from mail-wr1-f67.google.com (unknown [209.85.221.67])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 3db90e1e-348f-11ea-8094-12813bfff9fa;
 Sat, 11 Jan 2020 16:27:21 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id g17so4583212wro.2
 for <xen-devel@lists.xenproject.org>; Sat, 11 Jan 2020 08:27:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=jCLq1djN+YbRqItgmQ/iSlRfamRl5U9ZLoOO+WE5c+Y=;
 b=N4s2p3HYb8O2GgyW2M6VZoHJT/9S1mQ8n+XxJRULp93CI1SWmlYIW81bXVQWz3Nmbw
 JACWCUwKraAN9ma36Tyc7/XD726vTTHs3KRPAdem51cztcMc9gDrUuCigx0nZfmkq/gq
 iZoOS/sp3ktVdy34t/t45TN5GIFj/VwbwzlUbZfvaPpLygSvePR92/vMGhXRj7vRXD4N
 kb+Krfxy55ip5obpJFLtis2MntHYZPp/6ZTceghFQ9lVsAS51go1bTo7qDZNFDD2GpHI
 EVkAQT8tpUvbhfx1utE0QOHC9zibW5KFwDTCEDVAMAjoOpfXwcif0eyBIYl7NO5rv3Ry
 xfbg==
X-Gm-Message-State: APjAAAWagU0QvROBF6tEIlC1GxSOmAq2jO+uwS10Oku081k9cbZpOv7T
 U7Fda43vUWi+5mjmxfB/6fM=
X-Google-Smtp-Source: APXvYqzVvYo78OmfwNG1W6+mMbZlbKD8inE8Q+TeG84z2PdKl9vltSvZMI6Ow3hKWWtzi5tmJm1zUg==
X-Received: by 2002:a5d:4044:: with SMTP id w4mr9534338wrp.322.1578760040449; 
 Sat, 11 Jan 2020 08:27:20 -0800 (PST)
Received: from a483e7b01a66.ant.amazon.com (54-240-197-228.amazon.com.
 [54.240.197.228])
 by smtp.gmail.com with ESMTPSA id q14sm7028937wmj.14.2020.01.11.08.27.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 11 Jan 2020 08:27:19 -0800 (PST)
To: Jan Beulich <jbeulich@suse.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien.grall@arm.com>
References: <5c88239b-de0f-5f81-72c4-7fdb07524278@suse.com>
 <91d9f45c-e0e1-a01c-d812-2dd3345fff48@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <90e88e64-e93e-6fff-851f-ecb8c9203516@xen.org>
Date: Sat, 11 Jan 2020 16:27:17 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.3.1
MIME-Version: 1.0
In-Reply-To: <91d9f45c-e0e1-a01c-d812-2dd3345fff48@suse.com>
Content-Language: en-GB
Subject: Re: [Xen-devel] Ping: [PATCH v2] dom0-build: fix build with clang5
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

CgpPbiAyMC8xMi8yMDE5IDE2OjI2LCBKYW4gQmV1bGljaCB3cm90ZToKPiBPbiAxNy4wNy4yMDE5
IDA4OjQ3LCBKYW4gQmV1bGljaCB3cm90ZToKPj4gV2l0aCBub24tZW1wdHkgQ09ORklHX0RPTTBf
TUVNIGNsYW5nNSBwcm9kdWNlcwo+Pgo+PiBkb20wX2J1aWxkLmM6MzQ0OjI0OiBlcnJvcjogdXNl
IG9mIGxvZ2ljYWwgJyYmJyB3aXRoIGNvbnN0YW50IG9wZXJhbmQgWy1XZXJyb3IsLVdjb25zdGFu
dC1sb2dpY2FsLW9wZXJhbmRdCj4+ICAgICAgIGlmICggIWRvbTBfbWVtX3NldCAmJiBDT05GSUdf
RE9NMF9NRU1bMF0gKQo+PiAgICAgICAgICAgICAgICAgICAgICAgICAgXiAgfn5+fn5+fn5+fn5+
fn5+fn5+Cj4+IGRvbTBfYnVpbGQuYzozNDQ6MjQ6IG5vdGU6IHVzZSAnJicgZm9yIGEgYml0d2lz
ZSBvcGVyYXRpb24KPj4gICAgICAgaWYgKCAhZG9tMF9tZW1fc2V0ICYmIENPTkZJR19ET00wX01F
TVswXSApCj4+ICAgICAgICAgICAgICAgICAgICAgICAgICBefgo+PiAgICAgICAgICAgICAgICAg
ICAgICAgICAgJgo+PiBkb20wX2J1aWxkLmM6MzQ0OjI0OiBub3RlOiByZW1vdmUgY29uc3RhbnQg
dG8gc2lsZW5jZSB0aGlzIHdhcm5pbmcKPj4gICAgICAgaWYgKCAhZG9tMF9tZW1fc2V0ICYmIENP
TkZJR19ET00wX01FTVswXSApCj4+ICAgICAgICAgICAgICAgICAgICAgICAgIH5efn5+fn5+fn5+
fn5+fn5+fn5+fn4KPj4gMSBlcnJvciBnZW5lcmF0ZWQuCj4+Cj4+IE9idmlvdXNseSBuZWl0aGVy
IG9mIHRoZSB0d28gc3VnZ2VzdGlvbnMgYXJlIGFuIG9wdGlvbiBoZXJlLiBPZGRseQo+PiBlbm91
Z2ggc3dhcHBpbmcgdGhlIG9wZXJhbmRzIG9mIHRoZSAmJiBoZWxwcywgd2hpbGUgZS5nLiBjYXN0
aW5nIG9yCj4+IHBhcmVudGhlc2l6aW5nIGRvZXNuJ3QuIEFub3RoZXIgd29ya2FibGUgdmFyaWFu
dCBsb29rcyB0byBiZSB0aGUgdXNlIG9mCj4+ICEhIG9uIHRoZSBjb25zdGFudC4KPj4KPj4gU2ln
bmVkLW9mZi1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgo+PiAtLS0KPj4gdjI6
IEFsc28gYWRqdXN0IHRoZSBBcm0gaW5jYXJuYXRpb24gb2YgdGhlIHNhbWUgY29uc3RydWN0Lgo+
PiAtLS0KPj4gSSdtIG9wZW4gdG8gZ29pbmcgdGhlICEhIG9yIHlldCBzb21lIGRpZmZlcmVudCBy
b3V0ZSAoYnV0IG5vdCByZWFsbHkgdGhlCj4+IHN1Z2dlc3RlZCBzdHJsZW4oKSBvbmUpLiBObyBt
YXR0ZXIgd2hpY2ggb25lIHdlIGNob29zZSwgSSdtIGFmcmFpZCBpdCBpcwo+PiBnb2luZyB0byBy
ZW1haW4gZ3Vlc3N3b3JrIHdoYXQgbmV3ZXIgKGFuZCBmdXR1cmUpIHZlcnNpb25zIG9mIGNsYW5n
IHdpbGwKPj4gY2hva2Ugb24uCj4gCj4gSSBndWVzcyB0aGUgZGlzYWdyZWVtZW50IG9uIGhvdyB0
byBleGFjdGx5IGFkZHJlc3MgdGhlIGlzc3VlIGhhcwo+IHN0YWxsZWQgdGhpcy4gQnV0IEkgdGhp
bmsgd2Ugc2hvdWxkIHJhdGhlciBoYXZlIF9zb21lXyAoZS5nLgo+IHRoaXMpIHNvbHV0aW9uIGlu
IHRoZSByZXBvLCB0aGFuIGNvbnRpbnVlIHRvIHNoaXAgdmVyc2lvbnMgd2hpY2gKPiBkb24ndCBi
dWlsZC4gUGVvcGxlIHdhbnRpbmcgdG8gYmVhdXRpZnkgdGhlIGNvZGUgZnVydGhlciBjb3VsZAo+
IHRoZW4gc3VibWl0IGluY3JlbWVudGFsIHBhdGNoZXMuCgpJIHdvdWxkIHByZWZlciBhIG1vcmUg
cmVhZGFibGUgY29kZSBidXQgZm9yIHRoZSBzYWtlIG9mIHVuYmxvY2tpbmc6CgpBY2tlZC1ieTog
SnVsaWVuIEdyYWxsIDxqdWxpZW5AeGVuLm9yZz4KCk5vdGUgdGhhdCBjbGFuZyBpcyBub3Qgb2Zm
aWNpYWxseSBzdXBwb3J0ZWQgdG8gYnVpbGQgWGVuIG9uIEFybS4gU28gdGhlIApidWlsZCBjb25j
ZXJuIGlzIHg4NiBvbmx5LgoKQ2hlZXJzLAoKLS0gCkp1bGllbiBHcmFsbAoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlz
dApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
