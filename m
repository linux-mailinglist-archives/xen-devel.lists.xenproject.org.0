Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 04B2914177B
	for <lists+xen-devel@lfdr.de>; Sat, 18 Jan 2020 13:36:15 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1isnHP-0004wI-UM; Sat, 18 Jan 2020 12:32:43 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=s8pn=3H=gmail.com=julien.grall.oss@srs-us1.protection.inumbo.net>)
 id 1isnHO-0004wD-Hr
 for xen-devel@lists.xenproject.org; Sat, 18 Jan 2020 12:32:42 +0000
X-Inumbo-ID: 9e5c993e-39ee-11ea-b70c-12813bfff9fa
Received: from mail-wm1-f65.google.com (unknown [209.85.128.65])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 9e5c993e-39ee-11ea-b70c-12813bfff9fa;
 Sat, 18 Jan 2020 12:32:41 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id d73so9946647wmd.1
 for <xen-devel@lists.xenproject.org>; Sat, 18 Jan 2020 04:32:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=wrEjArh6K8jRoPhMZ+20BKGr+NTs/TIYdMy5I2DECMw=;
 b=p+1i3NOA/fiyRK8B0qtA4El+dGM0x/GPxwWgsXQBTGtavSX4A56h9ZRMOG6+T3FmoT
 ogbRpGi0KpNdxsWnyOPZfDgAJc4XlFmzFGCEpbVEV/UyKhWPeI4zukebowYTk79Ea47l
 B1QT5fbXEE86FcS2NbguF9z71iGo0LZOAnV7sMW/CcnLZkTEmOzJGfG3Kuw/uU83D3ss
 +uw7sbL/ZQ+rvAzDVVuHW9/xMnBdpLTiXAkEevZ/2Hr6zR+dbI4s0oI2dxb8EoOJM9OD
 RMon4+YzNLFjLZPK0feLPXM41+MzjDhElc2nR9FOIRZttmTpqofCJtKXbLHYGkDlqN2m
 /vEg==
X-Gm-Message-State: APjAAAV8dhPSv42cC8wIrRItxQStWW9XCDHvQWHa9OIbTQzgjw0G8Qlz
 Lr60DutJwaxyRfiItmeZGXE=
X-Google-Smtp-Source: APXvYqwuph2gSFOtYc6ZotRs0r9RJ2Lg8N2pd4LahJhmL6VUjrd4yfaEVScdYQEQDlZhBVu6EHVwzw==
X-Received: by 2002:a1c:6308:: with SMTP id x8mr9534706wmb.80.1579350760575;
 Sat, 18 Jan 2020 04:32:40 -0800 (PST)
Received: from a483e7b01a66.ant.amazon.com (54-240-197-231.amazon.com.
 [54.240.197.231])
 by smtp.gmail.com with ESMTPSA id c15sm37855655wrt.1.2020.01.18.04.32.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 18 Jan 2020 04:32:39 -0800 (PST)
To: Jan Beulich <jbeulich@suse.com>, Wei Xu <xuwei5@hisilicon.com>
References: <1579232458-26803-1-git-send-email-xuwei5@hisilicon.com>
 <539d5900-1cc6-a490-7319-5357c6aa1219@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <d936960f-214d-788b-29cf-7be147332ea9@xen.org>
Date: Sat, 18 Jan 2020 12:32:37 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <539d5900-1cc6-a490-7319-5357c6aa1219@suse.com>
Content-Language: en-GB
Subject: Re: [Xen-devel] [PATCH] ns16550: Add ACPI support
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
Cc: sstabellini@kernel.org, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, linuxarm@huawei.com,
 shameerali.kolothum.thodi@huawei.com, prime.zeng@hisilicon.com,
 xen-devel@lists.xenproject.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgSmFuLAoKT24gMTcvMDEvMjAyMCAwODozMywgSmFuIEJldWxpY2ggd3JvdGU6Cj4gT24gMTcu
MDEuMjAyMCAwNDo0MCwgV2VpIFh1IHdyb3RlOgo+PiAtLS0gYS94ZW4vZHJpdmVycy9jaGFyL25z
MTY1NTAuYwo+PiArKysgYi94ZW4vZHJpdmVycy9jaGFyL25zMTY1NTAuYwo+PiBAQCAtMTYyMCw2
ICsxNjIwLDYxIEBAIERUX0RFVklDRV9TVEFSVChuczE2NTUwLCAiTlMxNjU1MCBVQVJUIiwgREVW
SUNFX1NFUklBTCkKPj4gICBEVF9ERVZJQ0VfRU5ECj4+ICAgCj4+ICAgI2VuZGlmIC8qIEhBU19E
RVZJQ0VfVFJFRSAqLwo+PiArCj4+ICsjaWZkZWYgQ09ORklHX0FDUEkKPj4gKyNpbmNsdWRlIDx4
ZW4vYWNwaS5oPgo+PiArCj4+ICtzdGF0aWMgaW50IF9faW5pdCBuczE2NTUwX2FjcGlfdWFydF9p
bml0KGNvbnN0IHZvaWQgKmRhdGEpCj4+ICt7Cj4+ICsgICAgc3RydWN0IGFjcGlfdGFibGVfc3Bj
ciAqc3BjciA9IE5VTEw7Cj4gCj4gVGhlIGluaXRpYWxpemVyIGlzbid0IHN0cmljdGx5IG5lZWRl
ZCwgaXMgaXQ/Cj4gCj4+ICsgICAgYWNwaV9zdGF0dXMgc3RhdHVzOwo+PiArICAgIHN0cnVjdCBu
czE2NTUwICp1YXJ0Owo+PiArCj4+ICsgICAgc3RhdHVzID0gYWNwaV9nZXRfdGFibGUoQUNQSV9T
SUdfU1BDUiwgMCwKPj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAoc3RydWN0IGFjcGlf
dGFibGVfaGVhZGVyICoqKSZzcGNyKTsKPj4gKwo+PiArICAgIGlmICggQUNQSV9GQUlMVVJFKHN0
YXR1cykgKQo+PiArICAgIHsKPj4gKyAgICAgICAgcHJpbnRrKCJuczE2NTUwOiBGYWlsZWQgdG8g
Z2V0IFNQQ1IgdGFibGVcbiIpOwo+PiArICAgICAgICByZXR1cm4gLUVJTlZBTDsKPj4gKyAgICB9
Cj4+ICsKPj4gKyAgICB1YXJ0ID0gJm5zMTY1NTBfY29tWzBdOwo+IAo+IFlvdSB3YW50IHRvIGp1
c3RpZnkgdGhlIGNob2ljZSBvZiB3aGF0IChvbiB4ODYgYXQgbGVhc3Q9IHdlJ2QgY2FsbAo+IGNv
bTEgaW4gdGhlIHBhdGNoIGRlc2NyaXB0aW9uLiBBbHNvIHRoaXMgY291bGQgYmUgdGhlIGluaXRp
YWxpemVyCj4gb2YgdGhlIHZhcmlhYmxlLgoKVGhpcyBpcyB0aGUgc2FtZSBjaG9pY2UgYXMgd2Ug
bWFkZSBmb3IgdGhlIERUIGJpbmRpbmcgKHNlZSAKbnMxNjU1MF91YXJ0KCkpLiBXZSBvbmx5IHN1
cHBvcnQgb25lIFVBUlQgb24gQXJtIHdoaWNoIGhhcHBlbiB0byBiZSAKbnMxNjU1MF9jb21bMF0g
KGJ1dCBuYW1lZCBkaWZlcnJlbnRseSkuCgpUaGUgY29kZSBiZWxvdyBpcyBhY3R1YWxseSBxdWl0
ZSBzaW1pbGFyIHRvIHRoZSBEVCBwYXJzaW5nLCBzbyBtYXliZSB3ZSAKd2FudCB0byBwcm92aWRl
IGEgY29tbW9uIGhlbHBlciBoZXJlLgoKPiAKPj4gKyAgICBuczE2NTUwX2luaXRfY29tbW9uKHVh
cnQpOwo+PiArCj4+ICsgICAgdWFydC0+YmF1ZCAgICAgID0gQkFVRF9BVVRPOwo+IAo+IFRoZXJl
J3MgYSBiYXVkX3JhdGUgZmllbGQgaW4gdGhlIHN0cnVjdHVyZS4gSWYgdGhlcmUncyBhIHJlYXNv
bgo+IHRvIGlnbm9yZSBpdCwgcGxlYXNlIGFkZCBhIGNvbW1lbnQuCgpTYW1lIGFzIGZvciB0aGUg
RFQgcGFydCwgd2UgYXNzdW1lIHRoZSBmaXJtd2FyZSB3aWxsIGNvbmZpZ3VyZSB0aGUgVUFSVCAK
Y29ycmVjdGx5LgoKPiAKPiBUaGVyZSdzIGFsc28gYW4gaW50ZXJmYWNlX3R5cGUgZmllbGQgLSBj
YW4geW91IHJlYWxseSBpZ25vcmUgaXQ/CgpJdCBpcyBub3QgaWdub3JlZC4gVGhpcyBpcyB1c2Vk
IGJ5IHRoZSB1cHBlciBsYXllciB0byBkZXRlY3Qgd2hpY2ggdWFydCAKZHJpdmVyIHRvIGNhbGwg
KHNlZSBhY3BpX3VhcnRfaW5pdCgpIGluIGFybS11YXJ0LmMpLgo+IAo+PiArICAgIHVhcnQtPmRh
dGFfYml0cyA9IDg7Cj4+ICsgICAgdWFydC0+cGFyaXR5ICAgID0gc3Bjci0+cGFyaXR5Owo+PiAr
ICAgIHVhcnQtPnN0b3BfYml0cyA9IHNwY3ItPnN0b3BfYml0czsKPiAKPiBUaGVyZSdzIGFsc28g
YSBmbG93X2NvbnRyb2wgZmllbGQsIHdoaWNoIEkgdGhpbmsgbmVlZHMgY2hlY2tpbmcKPiB0aGF0
IGl0IG1hdGNoZXMgbnMxNjU1MF9zZXR1cF9wcmVpcnEoKSBjb21tZW50Ogo+IAo+ICAgICAgLyog
Tm8gZmxvdyBjdHJsOiBEVFIgYW5kIFJUUyBhcmUgYm90aCB3ZWRnZWQgaGlnaCB0byBrZWVwIHJl
bW90ZSBoYXBweS4gKi8KPiAKPiBTaW1pbGFybHkgYW55IG90aGVyIGZpZWxkcyB5b3UgZG9uJ3Qg
ZXZhbHVhdGUgYXQgYWxsIGFuZCB3aGljaAo+IGFyZW4ndCBleHBsYWluZWQgYnkgdGhlIHNwZWMg
YXMgcG9zc2libGUgdG8gYmUgaWdub3JlZCAoYW5kIHRoZQo+IHNpdHVhdGlvbiBtYXRjaGluZyB0
aGUgdXNlIGNhc2UsIGxpa2UgeW91IG5vdCBjYXJpbmcgYWJvdXQgUENJCj4gYXNwZWN0cyBoZXJl
KSBuZWVkIHJlYXNvbmluZyBhYm91dCBpbiB0aGUgZGVzY3JpcHRpb24gb3IgYSBjb2RlCj4gY29t
bWVudC4KV2hhdCdzIG1pc3NpbmcgaW4gdGhlIGNvbW1pdCBtZXNzYWdlIGlzIHRoZSBmYWN0IHRo
aXMgaXMgb25seSB0YXJnZXRpbmcgCkFybS4gU28gdGhlcmUgYXJlIGEgbG90IHdlIGRvbid0IGNh
cmUgeWV0IChzdWNoIGFzIFBDSSkuCgo+IAo+PiArICAgIHVhcnQtPmlvX2Jhc2UgPSBzcGNyLT5z
ZXJpYWxfcG9ydC5hZGRyZXNzOwo+IAo+IFRoZSBmaWVsZCAob3IgcGVyaGFwcyB0aGUgd2hvbGUg
c3Bjci0+c2VyaWFsX3BvcnQpIGJlaW5nIHplcm8gbG9va3MKPiB0byBoYXZlIHNwZWNpYWwgbWVh
bmluZy4KPiAKPj4gKyAgICB1YXJ0LT5pb19zaXplID0gODsKPj4gKyAgICB1YXJ0LT5yZWdfc2hp
ZnQgPSBzcGNyLT5zZXJpYWxfcG9ydC5iaXRfb2Zmc2V0Owo+IAo+IHNwY3ItPnNlcmlhbF9wb3J0
IGhhcyBvdGhlciBmaWVsZHMgd2hpY2ggSSBkb24ndCB0aGluayB5b3Ugc2hvdWxkCj4gaWdub3Jl
Lgo+IAo+PiArICAgIHVhcnQtPnJlZ193aWR0aCA9IDE7Cj4gCj4gUGxlYXNlIHVzZSBjb25zaXN0
ZW50IHBsYWNlbWVudCBvZiA9IDogRWl0aGVyIGFsbCBvZiB0aGVtIGFyZQo+IGFsaWduZWQsIG9y
IGFsbCBvZiB0aGVtIGFyZSBwcmVjZWRlZCBieSBhIHNpbmdsZSBzcGFjZSBvbmx5Lgo+IAo+PiAr
ICAgIC8qIHRyaWdnZXIvcG9sYXJpdHkgaW5mb3JtYXRpb24gaXMgbm90IGF2YWlsYWJsZSBpbiBz
cGNyICovCj4+ICsgICAgaXJxX3NldF90eXBlKHNwY3ItPmludGVycnVwdCwgSVJRX1RZUEVfTEVW
RUxfSElHSCk7Cj4+ICsgICAgdWFydC0+aXJxID0gc3Bjci0+aW50ZXJydXB0Owo+PiArCj4+ICsg
ICAgdWFydC0+dnVhcnQuYmFzZV9hZGRyID0gdWFydC0+aW9fYmFzZTsKPj4gKyAgICB1YXJ0LT52
dWFydC5zaXplID0gdWFydC0+aW9fc2l6ZTsKPj4gKyAgICB1YXJ0LT52dWFydC5kYXRhX29mZiA9
IFVBUlRfVEhSIDw8IHVhcnQtPnJlZ19zaGlmdDsKPj4gKyAgICB1YXJ0LT52dWFydC5zdGF0dXNf
b2ZmID0gVUFSVF9MU1IgPDwgdWFydC0+cmVnX3NoaWZ0Owo+PiArICAgIHVhcnQtPnZ1YXJ0LnN0
YXR1cyA9IFVBUlRfTFNSX1RIUkUgfCBVQVJUX0xTUl9URU1UOwo+IAo+IFN0eWxlLXdpc2UgdGhp
cyBibG9jayBzaG91bGQgdGhlbiBtYXRjaCB3aGF0ZXZlciB0aGUgb3RoZXIKPiBibG9jayBhYm92
ZSBsb29rcy4KPiAKPj4gKyAgICAvKiAgUmVnaXN0ZXIgd2l0aCBnZW5lcmljIHNlcmlhbCBkcml2
ZXIuICovCj4+ICsgICAgc2VyaWFsX3JlZ2lzdGVyX3VhcnQodWFydCAtIG5zMTY1NTBfY29tLCAm
bnMxNjU1MF9kcml2ZXIsIHVhcnQpOwo+PiArCj4+ICsgICAgcmV0dXJuIDA7Cj4+ICt9Cj4+ICsK
Pj4gK0FDUElfREVWSUNFX1NUQVJUKGFuczE2NTUwLCAiTlMxNjU1MCBVQVJUIiwgREVWSUNFX1NF
UklBTCkKPj4gKyAgICAuY2xhc3NfdHlwZSA9IEFDUElfREJHMl8xNjU1MF9DT01QQVRJQkxFLAo+
PiArICAgIC5pbml0ID0gbnMxNjU1MF9hY3BpX3VhcnRfaW5pdCwKPj4gK0FDUElfREVWSUNFX0VO
RAo+IAo+IEkgZG9uJ3QgZXhwZWN0IHRoaXMgdG8gYnVpbGQgb24geDg2LgoKVGhpcyBpcyBvbmx5
IG1lYW50IHRvIHRhcmdldCBBcm0uIFNvIG1heWJlIHdlIHdhbnQgdG8gcHJvdGVjdCB0aGUgd2hv
bGUgCmNvZGUgd2l0aCBkZWZpbmVkKENPTkZJR19BQ1BJKSAmJiBkZWZpbmVkKENPTkZJR19BUk0p
LgoKQ2hlZXJzLAoKLS0gCkp1bGllbiBHcmFsbAoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3hlbi1kZXZlbA==
