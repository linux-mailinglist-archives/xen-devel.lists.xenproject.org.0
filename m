Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 10CB611E2A1
	for <lists+xen-devel@lfdr.de>; Fri, 13 Dec 2019 12:17:04 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ifiuN-0001VE-3Y; Fri, 13 Dec 2019 11:14:55 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=HO2F=2D=gmail.com=julien.grall.oss@srs-us1.protection.inumbo.net>)
 id 1ifiuL-0001V7-GR
 for xen-devel@lists.xenproject.org; Fri, 13 Dec 2019 11:14:53 +0000
X-Inumbo-ID: c3f368a6-1d99-11ea-88e7-bc764e2007e4
Received: from mail-wr1-f45.google.com (unknown [209.85.221.45])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c3f368a6-1d99-11ea-88e7-bc764e2007e4;
 Fri, 13 Dec 2019 11:14:44 +0000 (UTC)
Received: by mail-wr1-f45.google.com with SMTP id q10so6185425wrm.11
 for <xen-devel@lists.xenproject.org>; Fri, 13 Dec 2019 03:14:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=rbV+XX6dDx9vGwrmv8JuEZbYV1uvbQ2mz9Kz2ZPSZT0=;
 b=QybyIpw63GZ3axS3XJ8q88iGBU4M/xjhc9pYo5fX6klUlPoMntsglC03UUjzDuwyZZ
 DlV2hKdsTb5PksoOw24V8EMWiYjW5I/8dGdN/BR+AHkwPkA8pKqM5saXKmkutEguSRKn
 jzF2Zj/9dcwUlDIrRmTTVu2ZzhircJnrKuDdZrq3P6Urvwc+T30O/ToqPh+kqDann8Ln
 dwR1vBzLhHF2fyOSM2KEhZbaK9TXU8aRITKM0DlPiItRJ7Dq/iWeZDj69l0RKwknYD/+
 hAW6auD1yz3CITmbRntOz4soC0Vdobkd8AUok1XwJRHSWRytL2KgA1kQRmsid7X+nrLA
 5qUg==
X-Gm-Message-State: APjAAAURMBlNGsiHj0eGpYqcrAkA3BffqqcS2U2VWoY/47uQuTK9hX0B
 7p/eNiRSPoEASXKFQ/zJuuk=
X-Google-Smtp-Source: APXvYqzr3fILO3Bn/IHt6iH7YiQ16ayNGLgQfkJBMeMuI7rTDXIaYQeUrBdngFozbhjBp2Ocu/wzkg==
X-Received: by 2002:adf:e5ce:: with SMTP id a14mr11833497wrn.214.1576235683888; 
 Fri, 13 Dec 2019 03:14:43 -0800 (PST)
Received: from a483e7b01a66.ant.amazon.com (54-240-197-224.amazon.com.
 [54.240.197.224])
 by smtp.gmail.com with ESMTPSA id c17sm9366644wrr.87.2019.12.13.03.14.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 13 Dec 2019 03:14:43 -0800 (PST)
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>,
 osstest service owner <osstest-admin@xenproject.org>,
 xen-devel@lists.xenproject.org, Ian Jackson <ian.jackson@eu.citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <osstest-144736-mainreport@xen.org>
 <e05a3bc4-2c1d-7e71-af42-d6362c4f6d07@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <6ea2af3c-b277-1118-7c83-ebcb0809d449@xen.org>
Date: Fri, 13 Dec 2019 11:14:42 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.3.0
MIME-Version: 1.0
In-Reply-To: <e05a3bc4-2c1d-7e71-af42-d6362c4f6d07@suse.com>
Content-Language: en-GB
Subject: Re: [Xen-devel] [xen-4.13-testing test] 144736: regressions - FAIL
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgSnVlcmdlbiwKCk9uIDEzLzEyLzIwMTkgMDg6MzEsIErDvHJnZW4gR3Jvw58gd3JvdGU6Cj4g
T24gMTIuMTIuMTkgMjM6MzUsIG9zc3Rlc3Qgc2VydmljZSBvd25lciB3cm90ZToKPj4gZmxpZ2h0
IDE0NDczNiB4ZW4tNC4xMy10ZXN0aW5nIHJlYWwgW3JlYWxdCj4+IGh0dHA6Ly9sb2dzLnRlc3Qt
bGFiLnhlbnByb2plY3Qub3JnL29zc3Rlc3QvbG9ncy8xNDQ3MzYvCj4+Cj4+IFJlZ3Jlc3Npb25z
IDotKAo+Pgo+PiBUZXN0cyB3aGljaCBkaWQgbm90IHN1Y2NlZWQgYW5kIGFyZSBibG9ja2luZywK
Pj4gaW5jbHVkaW5nIHRlc3RzIHdoaWNoIGNvdWxkIG5vdCBiZSBydW46Cj4+IMKgIHRlc3QtYXJt
NjQtYXJtNjQteGwtY3JlZGl0McKgwqAgNyB4ZW4tYm9vdMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgIGZhaWwgUkVHUi4gCj4+IHZzLiAxNDQ2NzMKPiAKPiBMb29raW5nIGludG8gdGhl
IHNlcmlhbCBsb2cgdGhpcyBsb29rcyBsaWtlIGEgaGFyZHdhcmUgcHJvYmxlbSB0byBtZS4KCkxv
b2tpbmcgYXQgWzFdLCB0aGUgYm9hcmQgd2VyZSBhYmxlIHRvIHBpY2sgdXAgbmV3IGpvYi4gU28g
SSB3b3VsZCAKYXNzdW1lIHRoaXMganVzdCBhIHRlbXBvcmFyeSBmYWlsdXJlLgoKQU1EIFNlYXR0
bGUgYm9hcmRzIChsYXh0b24qKSBhcmUga25vd24gdG8gZmFpbCBib290aW5nIHRpbWUgdG8gdGlt
ZSAKYmVjYXVzZSBvZiBQQ0kgdHJhaW5pbmcgaXNzdWUuIFdlIGhhdmUgd29ya2Fyb3VuZCBmb3Ig
aXQgKGludm9sdmluZyAKbG9uZ2VyIHBvd2VyIGN5Y2xlKSBidXQgdGhpcyBpcyBub3QgMTAwJSBy
ZWxpYWJsZS4KCj4gCj4gSWFuLCBkbyB5b3UgYWdyZWU/Cj4gCj4+IMKgIHRlc3QtYXJtaGYtYXJt
aGYteGwtdmhkwqDCoMKgwqDCoCAxOCBsZWFrLWNoZWNrL2NoZWNrwqDCoMKgwqDCoMKgwqDCoCBm
YWlsIFJFR1IuIAo+PiB2cy4gMTQ0NjczCj4gCj4gVGhhdCBvbmUgaXMgc3RyYW5nZS4gQSBxZW11
IHByb2Nlc3Mgc2VlbXMgdG8gaGF2ZSBoYXZlIGRpZWQgcHJvZHVjaW5nCj4gYSBjb3JlIGZpbGUs
IGJ1dCBJIGNvdWxkbid0IGZpbmQgYW55IGxvZyBjb250YWluaW5nIGFueSBvdGhlciBpbmRpY2F0
aW9uCj4gb2YgYSBjcmFzaGVkIHByb2dyYW0uCgpJIGhhdmVuJ3QgZm91bmQgYW55dGhpbmcgaW50
ZXJlc3RpbmcgaW4gdGhlIGxvZy4gQElhbiBjb3VsZCB5b3Ugc2V0IHVwIAphIHJlcHJvIGZvciB0
aGlzPwoKRm9yIHRoZSBmdXR1cmUsIGl0IHdvdWxkIGJlIHdvcnRoIGNvbnNpZGVyaW5nIHRvIGNv
bGxlY3QgY29yZSBmaWxlcy4KCj4gCj4gQW5kIEkgY2FuJ3QgYmVsaWV2ZSB0aGUgQVJNIGNoYW5n
ZXMgaW4gdGhlIGh5cGVydmlzb3Igd291bGQgcmVzdWx0IGluCj4gcWVtdSBjcmFzaGluZyBub3cu
Li4KCkkgaGF2ZSBzZWVuIHdlaXJkIGJlaGF2aW9yIGhhcHBlbmluZyBpbiBEb20wIGJlY2F1c2Ug
b2YgY2hhbmdlcyBpbiBYZW4gCmJlZm9yZS4gOikgRm9yIGluc3RhbmNlLCBnZXRfY3ljbGVzKCkg
d2FzIHdyb25nbHkgaW1wbGVtZW50ZWQgYW5kIApyZXN1bHRlZCB0byBuZXR3b3JrIGxvc3MuCgpB
bnl3YXksICBRRU1VIGlzIHRoZSBzYW1lIGFzIHRoZSBwcmV2aW91cyBmbGlnaHQuIFRoZSBvbmx5
IGRpZmZlcmVuY2UgCmhlcmUgaXMgaW4gWGVuOgoKZDg1MzhmNzFlZGM5NTRmOGM1MThkZTJmOWNj
OWFlODllZTA1ZjZhMQp4ODYrQXJtMzI6IG1ha2UgZmluZF9uZXh0X3ssemVyb199Yml0KCkgaGF2
ZSB3ZWxsIGRlZmluZWQgYmVoYXZpb3IKCj4gSnVsaWVuLCBjb3VsZCB5b3UgcGxlYXNlIGhhdmUg
YSBsb29rPwoKSSBkb24ndCBoYXZlIG11Y2ggaWRlYSB3aGF0J3MgaGFwcGVuaW5nLiBBIHJlcHJv
IHdvdWxkIHVzZWZ1bCB0byBiZSBhYmxlIAp0byBkbyBtb3JlIGRlYnVnLgoKQ2hlZXJzLAoKWzFd
IGh0dHA6Ly9sb2dzLnRlc3QtbGFiLnhlbnByb2plY3Qub3JnL29zc3Rlc3QvcmVzdWx0cy9ob3N0
L2xheHRvbjAuaHRtbAoKLS0gCkp1bGllbiBHcmFsbAoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxA
bGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL3hlbi1kZXZlbA==
