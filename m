Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 72A6AFFE47
	for <lists+xen-devel@lfdr.de>; Mon, 18 Nov 2019 07:18:34 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iWaJb-0000Yn-6m; Mon, 18 Nov 2019 06:15:11 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=eRBh=ZK=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1iWaJZ-0000Yi-OL
 for xen-devel@lists.xenproject.org; Mon, 18 Nov 2019 06:15:09 +0000
X-Inumbo-ID: c42f0eb6-09ca-11ea-b678-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c42f0eb6-09ca-11ea-b678-bc764e2007e4;
 Mon, 18 Nov 2019 06:15:07 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 331C1AE5E;
 Mon, 18 Nov 2019 06:15:06 +0000 (UTC)
To: Roman Shaposhnik <roman@zededa.com>, xen-devel@lists.xenproject.org
References: <CAMmSBy8qFCEssF6vdTTAgxpijGns4QFgKQpT6Kvj9AorQ5mSZQ@mail.gmail.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <365fbdb1-955a-37dc-eb45-83d2ebed3c3c@suse.com>
Date: Mon, 18 Nov 2019 07:15:05 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <CAMmSBy8qFCEssF6vdTTAgxpijGns4QFgKQpT6Kvj9AorQ5mSZQ@mail.gmail.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [TESTDAY] Test report
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

T24gMTYuMTEuMTkgMDI6MTIsIFJvbWFuIFNoYXBvc2huaWsgd3JvdGU6Cj4gTk9URTogdGhpcyBt
YXkgb3IgbWF5IG5vdCBiZSBhIGhhaXIgb24gZmlyZSBwcm9ibGVtLCByZXBvcnRpbmcgaXQKPiBh
bnl3YXkgc2luY2UgSSdkIGhhdGUgdG8gcGFzcyBvbiBzb21ldGhpbmcgdGhhdCBtYXliZSBhIHNl
cmlvdXMgaXNzdWUuCj4gSSBoYXZlbid0IGhhZCB0aW1lIHRvIGRlYnVnIHRoaXMganVzdCB5ZXQg
LS0gc28ganVzdCByZXBvcnRpbmcgaXQgaGVyZQo+IHByZXR0eSByYXcuCj4gCj4gU29mdHdhcmU6
Cj4gICAgIFhlbiA0LjEzIFJDMgo+ICAgICBMaW51eCBrZXJuZWwgNC4xOS41Cj4gSGFyZHdhcmU6
Cj4gICAgIFN1cGVybWljcm8gRTMwMAo+ICAgICAgICAgaHR0cHM6Ly93d3cuc3VwZXJtaWNyby5j
b20vZW4vcHJvZHVjdHMvc3lzdGVtL01pbmktSVRYL1NZUy1FMzAwLThELmNmbQo+ICAgICBTdXBl
cm1pY3JvIEUxMDAKPiAgICAgICAgIGh0dHBzOi8vd3d3LnN1cGVybWljcm8uY29tL2VuL3Byb2R1
Y3RzL3N5c3RlbS9Cb3hfUEMvU1lTLUUxMDAtOVMuY2ZtCj4gICAgIFN1cGVybWljcm8gRTUwCj4g
ICAgICAgICBodHRwczovL3d3dy5zdXBlcm1pY3JvLmNvbS9lbi9wcm9kdWN0cy9zeXN0ZW0vQm94
X1BDL1NZUy1FNTAtOUFQLmNmbQo+IAo+IEZ1bmN0aW9uYWxpdHkgdGVzdGVkOiB0cnlpbmcgdG8g
Ym9vdCBEb20wCj4gQ29tbWVudHM6IFhlbiBib290cyBjb21wbGV0ZWx5IGFuZCB0aGVuIHNlZW1z
IGxpa2UgaXQgZWl0aGVyIGRpZXMKPiByaWdodCBhZnRlciBzYXlpbmcKPiAgICAgIFhlbiByZWxp
bnF1aXNoaW5nIGEgY29uc29sZQo+IG9yIERvbTAgZGllcyAod2l0aG91dCBwcmludGluZyBhIHNp
bmdsZSBsaW5lIG9mIG91dHB1dCkKPiAKPiBGV0lXLCB0aGlzIHN0YXJ0ZWQgaGFwcGVuaW5nIGFm
dGVyIHVwZ3JhZGUgdG8gUkMyLiBJT1csIGlmIEkgdGFrZSBteQo+IHByZXZpb3VzIFJDMSBiaW5h
cnkgYW5kIHN0aWNrIGl0IGludG8gdGhlIHZlcnkgc2FtZSBzZXR1cCAtLQo+IGV2ZXJ5dGhpbmcg
Ym9vdHMgZmluZS4KPiAKPiBUaGUgaXNzdWUgZG9lc24ndCBzZWVtIHRvIGJlIHJlcHJvZHVjaWJs
ZSBvbiBEZWxsIGJveGVzIChhbmQgaW4gbXkKPiB2aXJ0dWFsIFFFbXUgc2V0dXApIHRoYXQgSSd2
ZSBnb3QuCgpDYW4geW91IHBsZWFzZSBhZGQgdGhlIGZvbGxvd2luZyB0byBkb20wJ3MgYm9vdCBw
YXJhbWV0ZXJzOgoKY29uc29sZT1odmMwIGVhcmx5cHJpbnRrPXhlbgoKYW5kIHNlbmQgdGhlIFhl
biBib290IGxvZyAob2J0YWluZWQgdmlhIHNlcmlhbCBsaW5lKT8KCgpKdWVyZ2VuCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGlu
ZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnBy
b2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
