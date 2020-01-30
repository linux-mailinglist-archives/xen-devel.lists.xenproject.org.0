Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 968AC14DF81
	for <lists+xen-devel@lfdr.de>; Thu, 30 Jan 2020 17:56:56 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ixD56-00024A-EK; Thu, 30 Jan 2020 16:54:16 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=suiz=3T=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1ixD55-000245-7j
 for xen-devel@lists.xenproject.org; Thu, 30 Jan 2020 16:54:15 +0000
X-Inumbo-ID: 24a71541-4381-11ea-8abf-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 24a71541-4381-11ea-8abf-12813bfff9fa;
 Thu, 30 Jan 2020 16:54:14 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 8B4B0AD95;
 Thu, 30 Jan 2020 16:54:13 +0000 (UTC)
To: pgnet.dev@gmail.com
References: <4bd83180-1b44-bcdd-bfe6-42724cda8a44@gmail.com>
 <5ac8716e-daba-9788-c362-acad18a44dfe@suse.com>
 <81d0da4b-7b8d-5659-d1cc-ba2726af0fef@gmail.com>
 <7e94b98d-5037-3e33-a29e-6f89f09714c4@gmail.com>
 <f49a0af0-afa4-5c5b-77e2-c16d89b323ee@suse.com>
 <1d092341-15b4-e733-a7a2-7fcf3ecd30f5@suse.com>
 <15e05c2d-4708-0198-4a87-ffbd773b2f50@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <80c07fdf-bd41-0a5d-c18d-ac5d4c3b3454@suse.com>
Date: Thu, 30 Jan 2020 17:54:15 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <15e05c2d-4708-0198-4a87-ffbd773b2f50@gmail.com>
Content-Language: en-US
Subject: Re: [Xen-devel] FAILED/MISSING cstate/cpufreq/cpupower support with
 Xen 4.13 + kernel 5.4.14; withOUT xen/hypervisor, WORKS. bug or config?
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
Cc: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>,
 xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMzAuMDEuMjAyMCAxNzo0NSwgUEdOZXQgRGV2IHdyb3RlOgo+PiBJJ2QgbGlrZSB0byByZXF1
ZXN0IHlvdSBhZGRpbmcgdGhlIGRvbTAga2VybmVsIGJvb3QgcGFyYW1ldGVycywgdG9vOgo+PiBk
ZWJ1ZyBpbml0Y2FsbF9kZWJ1Zwo+IAo+IGFkZGVkCj4gCj4gd2l0aCBjdXJyZW50IGNvbmZpZywK
PiAKPiAJW2NvbmZpZy4xXQo+IAlvcHRpb25zPWRvbTBfbWF4X3ZjcHVzPTQgZG9tMF9tZW09NDAx
Nk0sbWF4OjQwOTZNIGNvbnNvbGVfdG9fcmluZyBjb25yaW5nX3NpemU9MjA0ODBrIGxvZ2x2bD1h
bGwgZ3Vlc3RfbG9nbHZsPWFsbCBzeW5jX2NvbnNvbGU9dHJ1ZSBpb21tdT12ZXJib3NlIGFwaWNf
dmVyYm9zaXR5PXZlcmJvc2Ugc2NoZWQ9Y3JlZGl0MiB1Y29kZT1zY2FuIGludGVsX3BzdGF0ZT1l
bmFibGUgY29tMT0xMTUyMDAsOG4xIGNvbnNvbGU9Y29tMSx2Z2EKPiAJa2VybmVsPXZtbGludXot
NS41LjAtMjQuZzNmMTgzYmYtZGVmYXVsdCByb290PS9kZXYvbWFwcGVyL1ZHMC1ST09UIHJkLnNo
ZWxsIHN5c3RlbWQubG9nX3RhcmdldD1rbXNnIHN5c3RlbWQubG9nX2xldmVsPWluZm8gc2hvd29w
dHMgbm9xdWlldCBwcmludF9mYXRhbF9zaWduYWxzPTEgbG9nX2J1Zl9sZW49MjBNIHByaW50ay5k
ZXZrbXNnPW9uIGVhcmx5cHJpbnRrPXhlbixrZWVwIGRlYnVnIGxvZ2xldmVsPTggbGFwaWM9ZGVi
dWcgYXBpY192ZXJib3NpdHk9ZGVidWcgYXBpYz1kZWJ1ZyBzY2hlZF9kZWJ1ZyBpbml0Y2FsbF9k
ZWJ1ZyByb290PS9kZXYvbWFwcGVyL1ZHMC1ST09UIHJvb3Rmc3R5cGU9ZXh0NCByb290ZmxhZ3M9
am91cm5hbF9jaGVja3N1bSBub3Jlc3VtZSBhdWRpdD0wIG1vZGVzZXQ9MSBub3V2ZWF1Lm1vZGVz
ZXQ9MSBmc2NrLm1vZGU9YXV0byBmc2NrLnJlcGFpcj1wcmVlbiBuZXQuaWZuYW1lcz0xIGJpb3Nk
ZXZuYW1lPTAgc2NzaV9tb2QudXNlX2Jsa19tcT0xIG1jZT1ib290bG9nIGNvbnNvbGU9aHZjMCBp
bnRlbF9wc3RhdGU9Zm9yY2UKPiAJcmFtZGlzaz1pbml0cmQtNS41LjAtMjQuZzNmMTgzYmYtZGVm
YXVsdAo+IAo+IGFzIGJlZm9yZSAtLSBubyBjcHVwb3dlciBmcmVxdWVuY3ktaW5mbyBkYXRhLCB4
ZW5wbSByZXBvcnRzIHNjYWxpbmdfZHJpdmVyID09IGFjcGk9Y3B1ZnJlcQo+IAo+IGxvZyBiZWxv
dwo+IAo+IE5PVEUgdGhlICIoWEVOKSBwYXJhbWV0ZXIgImludGVsX3BzdGF0ZSIgdW5rbm93biEi
IC4uLiB0aGF0J3MgY2xlYXJseSBub3QgYSBnb29kIHNpZ24uCgpPZiBjb3Vyc2UuIFRoZXJlJ3Mg
bm8gc3VjaCBjb21tYW5kIGxpbmUgb3B0aW9uIGluIFhlbi4KCj4+IFNvIEkgd29uZGVyIHdoYXQg
ZXhhY3RseSB5b3UgbWVhbiBieSBzYXlpbmcgInN0aWxsIHNlZWluZyBOTyBjcHVmcmVxL3NjYWxp
bmcgaW5mbwo+IAo+IHRoaXMKPiAKPiAJY3B1cG93ZXIgZnJlcXVlbmN5LWluZm8KPiAJCWFuYWx5
emluZyBDUFUgMDoKPiAJCSAgbm8gb3IgdW5rbm93biBjcHVmcmVxIGRyaXZlciBpcyBhY3RpdmUg
b24gdGhpcyBDUFUKPiAJCSAgQ1BVcyB3aGljaCBydW4gYXQgdGhlIHNhbWUgaGFyZHdhcmUgZnJl
cXVlbmN5OiBOb3QgQXZhaWxhYmxlCj4gCQkgIENQVXMgd2hpY2ggbmVlZCB0byBoYXZlIHRoZWly
IGZyZXF1ZW5jeSBjb29yZGluYXRlZCBieSBzb2Z0d2FyZTogTm90IEF2YWlsYWJsZQo+IAkJICBt
YXhpbXVtIHRyYW5zaXRpb24gbGF0ZW5jeTogIENhbm5vdCBkZXRlcm1pbmUgb3IgaXMgbm90IHN1
cHBvcnRlZC4KPiAJCU5vdCBBdmFpbGFibGUKPiAJCSAgYXZhaWxhYmxlIGNwdWZyZXEgZ292ZXJu
b3JzOiBOb3QgQXZhaWxhYmxlCj4gCQkgIFVuYWJsZSB0byBkZXRlcm1pbmUgY3VycmVudCBwb2xp
Y3kKPiAJCSAgY3VycmVudCBDUFUgZnJlcXVlbmN5OiBVbmFibGUgdG8gY2FsbCBoYXJkd2FyZQo+
IAkJICBjdXJyZW50IENQVSBmcmVxdWVuY3k6ICBVbmFibGUgdG8gY2FsbCB0byBrZXJuZWwKPiAJ
CSAgYm9vc3Qgc3RhdGUgc3VwcG9ydDoKPiAJCSAgICBTdXBwb3J0ZWQ6IG5vCj4gCQkgICAgQWN0
aXZlOiBubwo+IAo+IGNwdXBvd2VyIHJlcG9ydHMgbm8gZnJlcSBtZ210Cj4geGVucG0gZG9lcwo+
IAo+IG5vdCBjbGVhciAyIG1lIGlmIHRoYXQncyBleHBlY3RlZC4KCkFzIHNhaWQgKEkgdGhpbmsg
bW9yZSB0aGFuIG9uY2UpIGJlZm9yZSAtIHhlbnBtIGlzIHRoZSBvbmx5IHJlbGlhYmxlCmluZm9y
bWF0aW9uIHNvdXJjZS4gRm9yIG90aGVyIHVzZXIgc3BhY2UgdG9vbHMgeW91J2QgZmlyc3QgbmVl
ZCB0bwpmaWd1cmUgb3V0IHdoZXRoZXIgdGhleSdyZSBYZW4tYXdhcmU7IG1vc3Qgd291bGQgbWVy
ZWx5IHRyeSB0bwppbnRlcmZhY2Ugd2l0aCB0aGUgKERvbTApIGtlcm5lbCwgeWV0IHRoaXMgLSBh
cyBhbHNvIHNhaWQgYmVmb3JlIC0Kd29uJ3QgaGVscCwgYXMgdGhlIGtlcm5lbCBpcyB1bmF3YXJl
IG9mIHdoYXQgaXMgZ29pbmcgb24uIFBsZWFzZSBjYW4Kd2UgZm9jdXMgb24gdGhlIFhlbiBhc3Bl
Y3RzIGhlcmUgKGluY2x1ZGluZyBYZW4tc3BlY2lmaWMgTGludXggcGFydHMKYW5kIHRoZSB0b29s
cyBwcm92aWRlZCBhbG9uZ3NpZGUgWGVuKT8gVGhlIHF1ZXN0aW9uIGlzbid0IHdoYXQKcmFuZG9t
IHRvb2xzIHJlcG9ydC4gVGhlIHF1ZXN0aW9uIGlzIHdoZXRoZXIgUC0gYW5kIEMtc3RhdGUKbWFu
YWdlbWVudCBhY3R1YWxseSAoZG9uJ3QpIHdvcmsgb24geW91ciBzeXN0ZW0uIEZvciB0aGlzLCBy
ZWxldmFudApwYXJ0cyBvZiBYZW4gYW5kIERvbTAgbG9ncyBtYXkgYmUgbmVjZXNzYXJ5LCBhbmQv
b3IgeGVucG0gb3V0cHV0LgoKSmFuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5w
cm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8v
eGVuLWRldmVs
