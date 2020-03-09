Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D1E3817DF03
	for <lists+xen-devel@lfdr.de>; Mon,  9 Mar 2020 12:50:49 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jBGta-0000GF-Np; Mon, 09 Mar 2020 11:48:30 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Ocqq=42=gmail.com=julien.grall.oss@srs-us1.protection.inumbo.net>)
 id 1jBGtZ-0000GA-I2
 for xen-devel@lists.xenproject.org; Mon, 09 Mar 2020 11:48:29 +0000
X-Inumbo-ID: e410c92a-61fb-11ea-ac0c-12813bfff9fa
Received: from mail-ed1-f68.google.com (unknown [209.85.208.68])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e410c92a-61fb-11ea-ac0c-12813bfff9fa;
 Mon, 09 Mar 2020 11:48:28 +0000 (UTC)
Received: by mail-ed1-f68.google.com with SMTP id a20so5708728edj.2
 for <xen-devel@lists.xenproject.org>; Mon, 09 Mar 2020 04:48:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=f49qeLLMmnRWCE1uVI6ZN2bXe797RIRQhNQ9UHRoayE=;
 b=cGnsO/v6Owe1epdlqzU1I62MQ75LqVelq5nAiCGE+Lrej0Mkl6SLT8fH0AtROW6JbU
 X/mvrKahV+z2HnmWt/MVbKohjfo8/C/0PIJXUDx6Ir/l8Z2AaL95amwYFqvMzCdMnmy2
 hhZtNokug5pPo2oIK/ZQEgqiuR3fxkZkZBS18ssPJsN47xan6E7xCaZBtBVvZ0FNPDpn
 nZEPApkZHp/Ui5lKwhJuAlC7kmxp8gFABp8AZMXaFNw29luGrwo/eVnnPmJqMUOngLiz
 cVn0zzI+CeY+AhzwBhVtlIEi7VqKeh7oy8PLjYNbbN2pGMIV+FBgRv1VlvVTnJ+1TfWc
 fAMA==
X-Gm-Message-State: ANhLgQ0J4hP5yZIFgQm4E7ftDDYqTsX4FIfbDttKbbeRKDGiUMEAyK3L
 Nvk9zLQ4cm1VdOR7KwZpVSs=
X-Google-Smtp-Source: ADFU+vs2heVPc1OHh2SGBl6q9ZPRdAacd7V0HehF5VzxePV066BqAE/LJ1YWaHrP1StuJrhA02F0jw==
X-Received: by 2002:a50:d7c4:: with SMTP id m4mr17049613edj.89.1583754507572; 
 Mon, 09 Mar 2020 04:48:27 -0700 (PDT)
Received: from a483e7b01a66.ant.amazon.com (54-240-197-235.amazon.com.
 [54.240.197.235])
 by smtp.gmail.com with ESMTPSA id g20sm1254ejs.6.2020.03.09.04.48.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Mar 2020 04:48:27 -0700 (PDT)
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
References: <20200226124705.29212-1-jgross@suse.com>
 <20200226124705.29212-4-jgross@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <5bf4b576-5025-8b02-a0aa-42615784161d@xen.org>
Date: Mon, 9 Mar 2020 11:48:26 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200226124705.29212-4-jgross@suse.com>
Content-Language: en-GB
Subject: Re: [Xen-devel] [PATCH v6 03/12] docs: add feature document for Xen
 hypervisor sysfs-like support
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
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgSnVlcmdlbiwKCk9uIDI2LzAyLzIwMjAgMTI6NDYsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6Cj4g
T24gdGhlIDIwMTkgWGVuIGRldmVsb3BlciBzdW1taXQgdGhlcmUgd2FzIGFncmVlbWVudCB0aGF0
IHRoZSBYZW4KPiBoeXBlcnZpc29yIHNob3VsZCBnYWluIHN1cHBvcnQgZm9yIGEgaGllcmFyY2hp
Y2FsIG5hbWUtdmFsdWUgc3RvcmUKPiBzaW1pbGFyIHRvIHRoZSBMaW51eCBrZXJuZWwncyBzeXNm
cy4KPiAKPiBJbiB0aGUgYmVnaW5uaW5nIHRoZXJlIHNob3VsZCBvbmx5IGJlIGJhc2ljIHN1cHBv
cnQ6IGVudHJpZXMgY2FuIGJlCj4gYWRkZWQgZnJvbSB0aGUgaHlwZXJ2aXNvciBpdHNlbGYgb25s
eSwgdGhlcmUgaXMgYSBzaW1wbGUgaHlwZXJjYWxsCj4gaW50ZXJmYWNlIHRvIHJlYWQgdGhlIGRh
dGEuCj4gCj4gQWRkIGEgZmVhdHVyZSBkb2N1bWVudCBmb3Igc2V0dGluZyB0aGUgYmFzZSBvZiBh
IGRpc2N1c3Npb24gcmVnYXJkaW5nCj4gdGhlIGRlc2lyZWQgZnVuY3Rpb25hbGl0eSBhbmQgdGhl
IGVudHJpZXMgdG8gYWRkLgo+IAo+IFNpZ25lZC1vZmYtYnk6IEp1ZXJnZW4gR3Jvc3MgPGpncm9z
c0BzdXNlLmNvbT4KPiAtLS0KPiBWMToKPiAtIHJlbW92ZSB0aGUgIi0tIiBwcmVmaXhlcyBvZiB0
aGUgc3ViLWNvbW1hbmRzIG9mIHRoZSB1c2VyIHRvb2wKPiAgICAoSmFuIEJldWxpY2gpCj4gLSBy
ZW5hbWUgeGVuZnMgdG8geGVuaHlwZnMgKEphbiBCZXVsaWNoKQo+IC0gYWRkICJ0cmVlIiBhbmQg
IndyaXRlIiBvcHRpb25zIHRvIHVzZXIgdG9vbAo+IAo+IFYyOgo+IC0gbW92ZSBleGFtcGxlIHRy
ZWUgdG8gdGhlIHBhdGhzIGRlc2NyaXB0aW9uIChJYW4gSmFja3NvbikKPiAtIHNwZWNpZnkgYWxs
b3dlZCBjaGFyYWN0ZXJzIGZvciBrZXlzIGFuZCB2YWx1ZXMgKElhbiBKYWNrc29uKQo+IAo+IFYz
Ogo+IC0gY29ycmVjdCBpbnRyb2R1Y3Rpb24gKHdyaXRhYmxlIGVudHJpZXMpCj4gCj4gVjQ6Cj4g
LSBhZGQgbGlzdCBzcGVjaWZpY2F0aW9uCj4gLSBhZGQgZW50cnkgZXhhbXBsZSAoSnVsaWVuIEdy
YWxsKQo+IC0gY29ycmVjdCBkYXRlIGFuZCBYZW4gdmVyc2lvbiAoSnVsaWVuIEdyYWxsKQo+IC0g
YWRkIEFSTTY0IGFzIHBvc3NpYmxlIGFyY2hpdGVjdHVyZSAoSnVsaWVuIEdyYWxsKQo+IC0gYWRk
IHZlcnNpb24gZGVzY3JpcHRpb24gdG8gdGhlIGZlYXR1cmUgZG9jIChKYW4gQmV1bGljaCkKPiAt
LS0KPiAgIGRvY3MvZmVhdHVyZXMvaHlwZXJ2aXNvcmZzLnBhbmRvYyB8ICA5MiArKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysKPiAgIGRvY3MvbWlzYy9oeXBmcy1wYXRocy5wYW5kb2Mg
ICAgICB8IDEwNSArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKwo+ICAgMiBm
aWxlcyBjaGFuZ2VkLCAxOTcgaW5zZXJ0aW9ucygrKQo+ICAgY3JlYXRlIG1vZGUgMTAwNjQ0IGRv
Y3MvZmVhdHVyZXMvaHlwZXJ2aXNvcmZzLnBhbmRvYwo+ICAgY3JlYXRlIG1vZGUgMTAwNjQ0IGRv
Y3MvbWlzYy9oeXBmcy1wYXRocy5wYW5kb2MKPiAKPiBkaWZmIC0tZ2l0IGEvZG9jcy9mZWF0dXJl
cy9oeXBlcnZpc29yZnMucGFuZG9jIGIvZG9jcy9mZWF0dXJlcy9oeXBlcnZpc29yZnMucGFuZG9j
Cj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQKPiBpbmRleCAwMDAwMDAwMDAwLi5hMGEwZWFkMDU3Cj4g
LS0tIC9kZXYvbnVsbAo+ICsrKyBiL2RvY3MvZmVhdHVyZXMvaHlwZXJ2aXNvcmZzLnBhbmRvYwo+
IEBAIC0wLDAgKzEsOTIgQEAKPiArJSBIeXBlcnZpc29yIEZTCj4gKyUgUmV2aXNpb24gMQo+ICsK
PiArXGNsZWFycGFnZQo+ICsKPiArIyBCYXNpY3MKPiArLS0tLS0tLS0tLS0tLS0tLSAtLS0tLS0t
LS0tLS0tLS0tLS0tLS0KPiArICAgICAgICAgU3RhdHVzOiAqKlN1cHBvcnRlZCoqCgpJIHRoaW5r
IHlvdSBhbHNvIHdhbnQgdG8gdXBkYXRlIFNVUFBPUlQuTUQgd2l0aCB0aGUgc3RhdHVzIG9mIHRo
ZSBmZWF0dXJlLgoKT3RoZXIgdGhhbiB0aGF0OgoKQWNrZWQtYnk6IEp1bGllbiBHcmFsbCA8amdy
YWxsQGFtYXpvbi5jb20+Cgo+ICsKPiArICBBcmNoaXRlY3R1cmVzOiBhbGwKPiArCj4gKyAgICAg
Q29tcG9uZW50czogSHlwZXJ2aXNvciwgdG9vbHN0YWNrCj4gKy0tLS0tLS0tLS0tLS0tLS0gLS0t
LS0tLS0tLS0tLS0tLS0tLS0tCgpDaGVlcnMsCgotLSAKSnVsaWVuIEdyYWxsCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBs
aXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2pl
Y3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
