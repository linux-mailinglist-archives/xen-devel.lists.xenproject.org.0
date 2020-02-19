Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ACBA164A0F
	for <lists+xen-devel@lfdr.de>; Wed, 19 Feb 2020 17:21:32 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j4S42-0000RZ-3d; Wed, 19 Feb 2020 16:19:06 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=gcDT=4H=gmail.com=julien.grall.oss@srs-us1.protection.inumbo.net>)
 id 1j4S40-0000RN-DG
 for xen-devel@lists.xenproject.org; Wed, 19 Feb 2020 16:19:04 +0000
X-Inumbo-ID: 8b516a5a-5333-11ea-83c6-12813bfff9fa
Received: from mail-wr1-f65.google.com (unknown [209.85.221.65])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 8b516a5a-5333-11ea-83c6-12813bfff9fa;
 Wed, 19 Feb 2020 16:19:03 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id k11so1204348wrd.9
 for <xen-devel@lists.xenproject.org>; Wed, 19 Feb 2020 08:19:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=17DjWFH+xTFzNXtZM0ZM2Wf5b99U4Tbhzru5Ub9RC9I=;
 b=MvH+cVJ7kvzsNRdS8NtibjpcOJqNOK88qQjpPOHjKPjaa/9t9NnjZWBQYsmHDOnVLV
 6XE19qGTCwiVUIZtNjF/IXmyrCs8KoklgdHEHqkgzSIZsgG5sJIUtX/tg8WS0ZpCEq37
 98K6q3RhLpmEgSBbO9CGlX/gtqKRKcuOR1TOgIT3EppxlTmYBwziqSVk5gmaPsS/Dxvj
 GsxqtqF9+R6UBkmpXRtLM3R3zkAC3HpLrrfGLq37AoCI/2cpG1pgZfLlxNio3XxweePd
 3PYrLShmkdt9/+Bw6fPFVv0meGnLD+l3L/4kszOmKkyGL1GNGO/W6Rit7DAJMMF6SXnh
 K7JQ==
X-Gm-Message-State: APjAAAWBRG/bxkZ0QDTMUPXsVkAzQPxgc00CYe+PVjGRjOG1E3yhL3cn
 ZBN23gfXqG2y2dRM9eBuUn8=
X-Google-Smtp-Source: APXvYqwv0OT1tYwL8U4iIRvblo4qVQX9glUyYUWZI6v8m9v12jui2mBPGH4fhCnid3SKD7h0GePCsg==
X-Received: by 2002:adf:e6cb:: with SMTP id y11mr36919136wrm.59.1582129142928; 
 Wed, 19 Feb 2020 08:19:02 -0800 (PST)
Received: from a483e7b01a66.ant.amazon.com (54-240-197-238.amazon.com.
 [54.240.197.238])
 by smtp.gmail.com with ESMTPSA id f8sm310284wrt.28.2020.02.19.08.19.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 Feb 2020 08:19:02 -0800 (PST)
To: Jan Beulich <jbeulich@suse.com>, Juergen Gross <jgross@suse.com>
References: <20200219081126.29534-1-jgross@suse.com>
 <20200219081126.29534-4-jgross@suse.com>
 <1e04b723-58d2-cb2b-6571-3e041eecf6cd@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <d248b760-e4c9-7878-760a-c25730a43c1e@xen.org>
Date: Wed, 19 Feb 2020 16:19:01 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <1e04b723-58d2-cb2b-6571-3e041eecf6cd@suse.com>
Content-Language: en-GB
Subject: Re: [Xen-devel] [PATCH v5 3/8] xen: add basic hypervisor filesystem
 support
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
 Ian Jackson <ian.jackson@eu.citrix.com>, xen-devel@lists.xenproject.org,
 Daniel De Graaf <dgdegra@tycho.nsa.gov>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGksCgpPbiAxOS8wMi8yMDIwIDE1OjQ5LCBKYW4gQmV1bGljaCB3cm90ZToKPiBPbiAxOS4wMi4y
MDIwIDA5OjExLCBKdWVyZ2VuIEdyb3NzIHdyb3RlOgo+PiAraW50IGh5cGZzX3dyaXRlX2Jvb2wo
c3RydWN0IGh5cGZzX2VudHJ5X2xlYWYgKmxlYWYsCj4+ICsgICAgICAgICAgICAgICAgICAgICBY
RU5fR1VFU1RfSEFORExFX1BBUkFNKHZvaWQpIHVhZGRyLCB1bnNpZ25lZCBsb25nIHVsZW4pCj4+
ICt7Cj4+ICsgICAgdW5pb24gewo+PiArICAgICAgICBjaGFyIGJ1Zls4XTsKPj4gKyAgICAgICAg
dWludDhfdCB1ODsKPj4gKyAgICAgICAgdWludDE2X3QgdTE2Owo+PiArICAgICAgICB1aW50MzJf
dCB1MzI7Cj4+ICsgICAgICAgIHVpbnQ2NF90IHU2NDsKPj4gKyAgICB9IHU7Cj4+ICsKPj4gKyAg
ICBBU1NFUlQobGVhZi0+ZS50eXBlID09IFhFTl9IWVBGU19UWVBFX1VJTlQgJiYgbGVhZi0+ZS5z
aXplIDw9IDgpOwo+PiArCj4+ICsgICAgaWYgKCB1bGVuICE9IGxlYWYtPmUuc2l6ZSApCj4+ICsg
ICAgICAgIHJldHVybiAtRURPTTsKPj4gKwo+PiArICAgIGlmICggY29weV9mcm9tX2d1ZXN0KHUu
YnVmLCB1YWRkciwgdWxlbikgKQo+PiArICAgICAgICByZXR1cm4gLUVGQVVMVDsKPj4gKwo+PiAr
ICAgIHN3aXRjaCAoIGxlYWYtPmUuc2l6ZSApCj4+ICsgICAgewo+PiArICAgIGNhc2UgMToKPj4g
KyAgICAgICAgKih1aW50OF90ICopbGVhZi0+d3JpdGVfcHRyID0gISF1LnU4Owo+PiArICAgICAg
ICBicmVhazsKPj4gKyAgICBjYXNlIDI6Cj4+ICsgICAgICAgICoodWludDE2X3QgKilsZWFmLT53
cml0ZV9wdHIgPSAhIXUudTE2Owo+PiArICAgICAgICBicmVhazsKPj4gKyAgICBjYXNlIDQ6Cj4+
ICsgICAgICAgICoodWludDMyX3QgKilsZWFmLT53cml0ZV9wdHIgPSAhIXUudTMyOwo+PiArICAg
ICAgICBicmVhazsKPj4gKyAgICBjYXNlIDg6Cj4+ICsgICAgICAgICoodWludDY0X3QgKilsZWFm
LT53cml0ZV9wdHIgPSAhIXUudTY0Owo+PiArICAgICAgICBicmVhazsKPj4gKyAgICB9Cj4gCj4g
TG9va2luZyBhdCB0aGlzIGFnYWluLCBpcyB0aGVyZSByZWFsbHkgYSBuZWVkIGZvciB1aW50NjRf
dCBzdXBwb3J0Cj4gaGVyZT8gSS5lLiBjYW4ndCB5b3UgY2FwIGF0IHVuc2lnbmVkIGxvbmcgKG9y
IGV2ZW4gdW5zaWduZWQgaW50KSwKPiBhbmQgcGVyaGFwcyBhZGRpdGlvbmFsbHkgYXZvaWQgdXNl
IG9mIGZpeGVkIHdpZHRoIHR5cGVzIGhlcmUKPiBhbHRvZ2V0aGVyIChzb21lIHRyaWNrZXJ5IG1h
eSBiZSBuZWVkZWQgZm9yIDMyLWJpdCdzCj4gc2l6ZW9mKGxvbmcpID09IHNpemVvZihpbnQpKT8K
Ck9uIEFybSwgd2Ugd2FudCB0byBoYXZlIHRoZSBpbnRlcmZhY2UgZXhhY3RseSB0aGUgc2FtZSBm
b3IgNjQtYml0IGFuZCAKMzItYml0LiBJZiB5b3UgcGxhbiB0byBub3Qgc3VwcG9ydCA4LWJ5dGUg
aGVyZSwgdGhpcyB3b3VsZCBlZmZlY3RpdmVseSAKbWVhbiB0aGF0IDgtYnl0ZSBjb3VsZCBub3Qg
YmUgdXNlZCBvbiBBcm0uCgpIb3dldmVyLCBJIGNhbid0IGZpbmQgYW55IHVzZSBvZiBoeXBmc193
cml0ZV9ib29sLCBzbyBJIGFtIG5vdCBlbnRpcmVseSAKc3VyZSB3aHkgd2Ugd291bGQgd2FudCB0
byBjYXRlciBzaXplIG90aGVyIHRoYW4gMS4gSnVlcmdlLCBkbyB5b3UgbWluZCAKZXhwYW5kaW5n
IHlvdXIgdGhvdWdodHM/CgpDaGVlcnMsCgotLSAKSnVsaWVuIEdyYWxsCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0
Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qu
b3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
