Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 667F8168106
	for <lists+xen-devel@lfdr.de>; Fri, 21 Feb 2020 16:00:48 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j59kg-00055p-7a; Fri, 21 Feb 2020 14:58:02 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=jzOO=4J=gmail.com=julien.grall.oss@srs-us1.protection.inumbo.net>)
 id 1j59ke-00055h-JR
 for xen-devel@lists.xenproject.org; Fri, 21 Feb 2020 14:58:00 +0000
X-Inumbo-ID: 8cfb5f36-54ba-11ea-8692-12813bfff9fa
Received: from mail-wm1-f67.google.com (unknown [209.85.128.67])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 8cfb5f36-54ba-11ea-8692-12813bfff9fa;
 Fri, 21 Feb 2020 14:57:59 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id s10so2102818wmh.3
 for <xen-devel@lists.xenproject.org>; Fri, 21 Feb 2020 06:57:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=1dliH96Feg5NQGF/+KD9UPhB3x42WPteTO1hg9616Bc=;
 b=b6MulqmRKae7nBnVZcTBMORFB9i6nfJDaZ0jnUm39Buwm19GxZvb5+aqEvIvaR2WrF
 RLGGIdLwqO1edSDuZ+dcWwt3EnV8D5e6q65t5brdwoIrZyZg3WsOMIuAMEPvYWYzxR9r
 LHaRMxltnHZTS11dmGMBDtjLNxCL2f+3MSeOcAiYgKWBBqSjTe958RQbwS08PKh3sUtd
 jHIwm/ucoFcJ+mUB0IhCYOV6PowjVtXOIg4DgpL0rV7nM+hfiBu6sOcS20EiVW733fsb
 Cf1X3FDqqLmEXMBsW60u9Hca72AmK/nXKIh2WmpRW96UJ/Eqwv4zj0s79XIZVaYXipIa
 A0ng==
X-Gm-Message-State: APjAAAXjr09OMo3Q98dNqjaleKCj6YTPayBvzvY9prIj4kck2k7qRCuT
 s4n+S+6JgpouKktWMS2sZyo=
X-Google-Smtp-Source: APXvYqwPoOF0RuCTPlTRf2n+kUyFmK04ekS//0sr+MKzv/NVuUVuy2QlyEmvH6kXQJu4zSSqX56kKg==
X-Received: by 2002:a05:600c:2042:: with SMTP id
 p2mr4434235wmg.79.1582297079009; 
 Fri, 21 Feb 2020 06:57:59 -0800 (PST)
Received: from a483e7b01a66.ant.amazon.com (54-240-197-235.amazon.com.
 [54.240.197.235])
 by smtp.gmail.com with ESMTPSA id f65sm4056995wmf.29.2020.02.21.06.57.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 21 Feb 2020 06:57:58 -0800 (PST)
To: Jan Beulich <jbeulich@suse.com>, Wei Xu <xuwei5@hisilicon.com>
References: <5E4F3EF4.4050701@hisilicon.com>
 <3a4f47ed-215f-f518-e819-a4b6503968c0@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <d21dd32d-8a5b-bb91-f83b-ed7aa72d2758@xen.org>
Date: Fri, 21 Feb 2020 14:57:57 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <3a4f47ed-215f-f518-e819-a4b6503968c0@suse.com>
Content-Language: en-GB
Subject: Re: [Xen-devel] [PATCH v4] ns16550: Add ACPI support for ARM only
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Linuxarm <linuxarm@huawei.com>,
 Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>,
 "Zengtao \(B\)" <prime.zeng@hisilicon.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

CgpPbiAyMS8wMi8yMDIwIDE0OjAyLCBKYW4gQmV1bGljaCB3cm90ZToKPiBPbiAyMS4wMi4yMDIw
IDAzOjIyLCBXZWkgWHUgd3JvdGU6Cj4+IC0tLSBhL3hlbi9kcml2ZXJzL2NoYXIvbnMxNjU1MC5j
Cj4+ICsrKyBiL3hlbi9kcml2ZXJzL2NoYXIvbnMxNjU1MC5jCj4+IEBAIC0xNjIwLDYgKzE2MjAs
ODUgQEAgRFRfREVWSUNFX1NUQVJUKG5zMTY1NTAsICJOUzE2NTUwIFVBUlQiLCBERVZJQ0VfU0VS
SUFMKQo+PiAgIERUX0RFVklDRV9FTkQKPj4KPj4gICAjZW5kaWYgLyogSEFTX0RFVklDRV9UUkVF
ICovCj4+ICsKPj4gKyNpZiBkZWZpbmVkKENPTkZJR19BQ1BJKSAmJiBkZWZpbmVkKENPTkZJR19B
Uk0pCj4+ICsjaW5jbHVkZSA8eGVuL2FjcGkuaD4KPj4gKwo+PiArc3RhdGljIGludCBfX2luaXQg
bnMxNjU1MF9hY3BpX3VhcnRfaW5pdChjb25zdCB2b2lkICpkYXRhKQo+PiArewo+PiArICAgIHN0
cnVjdCBhY3BpX3RhYmxlX2hlYWRlciAqdGFibGU7Cj4+ICsgICAgc3RydWN0IGFjcGlfdGFibGVf
c3BjciAqc3BjcjsKPj4gKyAgICBhY3BpX3N0YXR1cyBzdGF0dXM7Cj4+ICsgICAgLyoKPj4gKyAg
ICAgKiBTYW1lIGFzIHRoZSBEVCBwYXJ0Lgo+PiArICAgICAqIE9ubHkgc3VwcG9ydCBvbmUgVUFS
VCBvbiBBUk0gd2hpY2ggaGFwcGVuIHRvIGJlIG5zMTY1NTBfY29tWzBdLgo+PiArICAgICAqLwo+
PiArICAgIHN0cnVjdCBuczE2NTUwICp1YXJ0ID0gJm5zMTY1NTBfY29tWzBdOwo+PiArCj4+ICsg
ICAgc3RhdHVzID0gYWNwaV9nZXRfdGFibGUoQUNQSV9TSUdfU1BDUiwgMCwgJnRhYmxlKTsKPj4g
KyAgICBpZiAoIEFDUElfRkFJTFVSRShzdGF0dXMpICkKPj4gKyAgICB7Cj4+ICsgICAgICAgIHBy
aW50aygibnMxNjU1MDogRmFpbGVkIHRvIGdldCBTUENSIHRhYmxlXG4iKTsKPj4gKyAgICAgICAg
cmV0dXJuIC1FSU5WQUw7Cj4+ICsgICAgfQo+PiArCj4+ICsgICAgc3BjciA9IGNvbnRhaW5lcl9v
Zih0YWJsZSwgc3RydWN0IGFjcGlfdGFibGVfc3BjciwgaGVhZGVyKTsKPj4gKwo+PiArICAgIC8q
Cj4+ICsgICAgICogVGhlIHNlcmlhbCBwb3J0IGFkZHJlc3MgbWF5IGJlIDAgZm9yIGV4YW1wbGUK
Pj4gKyAgICAgKiBpZiB0aGUgY29uc29sZSByZWRpcmVjdGlvbiBpcyBkaXNhYmxlZC4KPj4gKyAg
ICAgKi8KPj4gKyAgICBpZiAoIHVubGlrZWx5KCFzcGNyLT5zZXJpYWxfcG9ydC5hZGRyZXNzKSAp
Cj4+ICsgICAgewo+PiArICAgICAgICBwcmludGsoIm5zMTY1NTA6IENvbnNvbGUgcmVkaXJlY3Rp
b24gaXMgZGlzYWJsZWRcbiIpOwo+PiArICAgICAgICByZXR1cm4gLUVJTlZBTDsKPj4gKyAgICB9
Cj4+ICsKPj4gKyAgICBpZiAoIHVubGlrZWx5KHNwY3ItPnNlcmlhbF9wb3J0LnNwYWNlX2lkICE9
IEFDUElfQURSX1NQQUNFX1NZU1RFTV9NRU1PUlkpICkKPj4gKyAgICB7Cj4+ICsgICAgICAgIHBy
aW50aygibnMxNjU1MDogQWRkcmVzcyBzcGFjZSB0eXBlIGlzIG5vdCBtbWlvXG4iKTsKPj4gKyAg
ICAgICAgcmV0dXJuIC1FSU5WQUw7Cj4+ICsgICAgfQo+IAo+IFRoZSBzcGFjZV9pZCBmaWVsZCBx
dWFsaWZpZXMgdGhlIGFkZHJlc3Mgb25lLCBpLmUuIHdoZXRoZXIgYSB2YWx1ZSBvZgo+IHplcm8g
Y2FuIHNlbnNpYmx5IG1lYW4gImRpc2FibGVkIiBkZXBlbmRzIG9uIHRoZSBhZGRyZXNzIHNwYWNl
LiBIZW5jZQo+IGxvZ2ljYWxseSB0aGUgYWRkcmVzcyBzcGFjZSBjaGVjayBzaG91bGQgY29tZSBm
aXJzdC4KPiAKPiBUaGlzIGlzIHRoZSBsYXN0IHRoaW5nIEknZCBsaWtlIHRvIHNlZSBjaGFuZ2Vk
LiBJIHdvbid0IGdpdmUgdGhlCj4gcGF0Y2ggbXkgYWNrIHRob3VnaCwgYXMgSSB0aGluayBpdCBz
aG91bGQgYmUgYW4gQXJtIG1haW50YWluZXIgdG8gYWNrCj4gaXQuCgpBY2tlZC1ieTogSnVsaWVu
IEdyYWxsIDxqdWxpZW5AeGVuLm9yZz4KCkFsdGhvdWdoLCBhIHJldmlld2VkLWJ5IHRhZyBmcm9t
IHlvdSB3b3VsZCBiZSBuaWNlIGFzIHlvdSBkaWQgbW9zdCBvZiAKdGhlIHJldmlldyBmb3IgdGhp
cyBwYXRjaC4KCkNoZWVycywKCi0tIApKdWxpZW4gR3JhbGwKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRl
dmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFp
bG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
