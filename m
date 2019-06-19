Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DA7B4BC8A
	for <lists+xen-devel@lfdr.de>; Wed, 19 Jun 2019 17:09:41 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hdcAq-0000T7-K8; Wed, 19 Jun 2019 15:06:56 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=hb7b=US=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hdcAp-0000Sv-GE
 for xen-devel@lists.xenproject.org; Wed, 19 Jun 2019 15:06:55 +0000
X-Inumbo-ID: df66e4ea-92a3-11e9-bff9-777e5e6ad4e9
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id df66e4ea-92a3-11e9-bff9-777e5e6ad4e9;
 Wed, 19 Jun 2019 15:06:53 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 776D0C0A;
 Wed, 19 Jun 2019 08:06:53 -0700 (PDT)
Received: from [10.1.196.50] (e108454-lin.cambridge.arm.com [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 71A753F246;
 Wed, 19 Jun 2019 08:06:52 -0700 (PDT)
To: Denis Obrezkov <denisobrezkov@gmail.com>
References: <287117b9-952c-1a92-26e0-9597df936c27@gmail.com>
 <f3596bd5-ede3-7299-e28f-033ad32e6c99@gmail.com>
 <62194faf-0bf8-61b8-a69f-e41934fb5a43@arm.com>
 <0c900a15-14ab-9947-bffe-2fbeed176486@gmail.com>
 <CALC81-vaVKgZoi27MauGTxjda8mchy5GRLipu5z=v1vh9fyvAg@mail.gmail.com>
 <747dd124-3511-f010-dac7-b9b23d7b44ad@gmail.com>
 <CALC81-tewzAtaaH94U1nVc-UiacR_YvqhaYcPXtXcviTFHAG8A@mail.gmail.com>
 <ecb2cf41-51e5-2ff2-5e61-72be64399e40@arm.com>
 <AM6PR0302MB32215CD7FAED139C682D92A386EA0@AM6PR0302MB3221.eurprd03.prod.outlook.com>
 <ef82a028-9e4e-9976-d205-42cbc4bfc8ac@arm.com>
 <AM6PR0302MB3221D649900B54C2FFA7003A86EA0@AM6PR0302MB3221.eurprd03.prod.outlook.com>
 <AM6PR03MB49190A0828A49569B64611B4E6EA0@AM6PR03MB4919.eurprd03.prod.outlook.com>
 <07a7084a-b798-0cc7-cca4-3fe58ea95835@arm.com>
 <666fc807-af6a-231c-9d7e-48ecabb07371@gmail.com>
 <2c0cced8-27ec-a3bb-b2bf-c037176a162a@arm.com>
 <4a2ae4d4-493a-d5f6-64da-1da313db3962@gmail.com>
 <CAGPpAzUpeFEmFX9FMkQDn+2gWnL1GmyEsL49DPLxWKBQ=_W0Eg@mail.gmail.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <8f6fafd5-6cab-b57c-b68b-ceb0ec88cfb2@arm.com>
Date: Wed, 19 Jun 2019 16:06:50 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <CAGPpAzUpeFEmFX9FMkQDn+2gWnL1GmyEsL49DPLxWKBQ=_W0Eg@mail.gmail.com>
Content-Language: en-US
Subject: Re: [Xen-devel] Starting to port xen on beagleboard-x15 (GSoC 2019
 project)
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
Cc: Hunyue Yau <hy-gsoc@hy-research.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Iain Hunter <drhunter95@gmail.com>, Andre Przywara <andre.przywara@arm.com>,
 Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

CgpPbiAxOS8wNi8yMDE5IDE1OjMzLCBEZW5pcyBPYnJlemtvdiB3cm90ZToKPiBIaSwKCkhpIERl
bmlzLAoKPiDRgdGALCAxOSDQuNGO0L0uIDIwMTkg0LMuINCyIDE0OjAxLCBBbmRyaWkgQW5pc292
IDxhbmRyaWkuYW5pc292QGdtYWlsLmNvbT46Cj4+Cj4+Cj4+Cj4+IE9uIDE4LjA2LjE5IDE5OjE5
LCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4+PiBEZW5pcyAodGhlIGF1dGhvciBvZiB0aGUgdGhyZWFk
KSBpcyBkb2luZyBhIEdTT0MgdG8gcG9ydCBYZW4gb24gdGhlIEJlYWdsZUJvYXJkIFgxNS4gWW91
IGVuZGVkIHVwIENDZWQgYmVjYXVzZSB5b3UgY2FuIHByb3ZpZGUgZmVlZGJhY2sgaG93IHRvIHBy
b2NlZWQuIE5vdCBiZWNhdXNlIHdlIHdhbnRlZCB5b3UgdG8gaW1wbGVtZW50IGl0Li4uCj4+Cj4+
IE9LIHRoZW4uCj4+Cj4+IERlbmlzLAo+Pgo+PiBGZWVsIGZyZWUgdG8gY29udGFjdCBtZSBpbiBj
YXNlIHlvdSBuZWVkIGNsYXJpZmljYXRpb25zIGFib3V0IHRoZSBzdHVmZi4KPiB0aGFuayB5b3UK
Pj4KPj4gLS0KPj4gU2luY2VyZWx5LAo+PiBBbmRyaWkgQW5pc292LgoKRG9uJ3QgZm9yZ2V0IHRv
IHN0cmlwIHVubmVjZXNzYXJ5IGJpdHMgb2YgdGhlIGUtbWFpbCB5b3UgcXVvdGUgOikuCgo+IAo+
IFNvLCByaWdodCBub3cgSSBnZXQgYSBiaXQgZnVydGhlciBhbmQgaXQgc2VlbXMgdGhhdCBDUFUx
IHdhcyBzd2l0Y2hlZAo+IHRvIGh5cCBtb2RlOgo+IGh0dHBzOi8vZ2l0aHViLmNvbS9lbWJlZGRl
ZGRlbi94ZW4vY29tbWl0LzJkNzZhZTdhYWNiN2MwZWE3MzEyZWFkZGI5MWMzZWIxZTE5NjNjYzkK
Ck5pY2UgdG8gc2VlIHNvbWUgcHJvZ3Jlc3MgaGVyZSEgOikKCkp1c3QgdG8ga2VlcCByZWNvcmQg
b2YgdGhlIGRpc2N1c3Npb24gb24gSVJDOgoKCS0gb21hcDVfaW5pdF9zZWNvbmRhcnkgaXMgdGhl
IGVudHJ5IHBvaW50IHRvIFhlbiBhbmQgU01DICMwIGlzIGNhbGxlZCByaWdodCAKYWZ0ZXIuIFRo
ZXJlIGFyZSBub3RoaW5nIGluIHIyLXIxMiB0aGF0IHdlIGNhcmUgYWJvdXQsIHNvIHRoZXJlIGFy
ZSBubyBuZWVkIHRvIApzYXZlL3Jlc3RvcmUgdGhlbS4gT24gYSBzaWRlIG5vdGUsIHlvdSBjb3Vs
ZCBub3QgdXNlIHNwIGJlY2F1c2Ugd2UgZG9uJ3Qga25vdyAKdGhlIHZhbHVlIHN0b3JlZCBpbiBp
dC4gU28geW91IG1heSByZXdyaXRlIFhlbiAob3IgYW55IG90aGVyIG1vZHVsZXMpLgoJCgktIEZy
b20gdGhlIHBhc3RlYmluICIoWEVOKSBHZW5lcmljIFRpbWVyIElSUTogcGh5cz0zMCBoeXA9MjYg
dmlydD0yNyBGcmVxOiAwIApLSHoiLiBJdCBsb29rcyBsaWtlIHRoZSByZWdpc3RlciBDTlRGUkVR
IGlzIG5vdCBjb25maWd1cmVkIGNvcnJlY3RseSBvbiB0aGUgQ1BVLiAKTG9va2luZyBhdCBMaW51
eCwgdGhleSBoYXZlIGNvZGUgdG8gc2V0dXAgQ05URlJRIChzZXRfY250ZnJxKSBmb3IgYWxsIHRo
ZSBDUFVzIAooc2VlIHJlYWx0aW1lX2NvdW50ZXJfaW5pdCBpbiBhcmNoL2FybS9tYWNoLW9tYXAy
L3RpbWVyLmMgYW5kIApvbWFwNF9zZWNvbmRhcnlfaW5pdCBpbiBhcmNoL2FybS9tYWNoLW9tYXAy
L29tYXAtc21wLmMpLgoJICBJbiB0aGUgY2FzZSBvZiBYZW4sIEkgdGhpbmsgd2Ugd2FudCB0byBj
YWxsIHNldF9jbnRmcmVxIGluIG9tYXA1X2luaXRfdGltZSgpIApmb3IgdGhlIGJvb3QgQ1BVLiBG
b3IgdGhlIHNlY29uZGFyeSBDUFVzLCB3ZSBtYXkgbmVlZCB0byBpbnRyb2R1Y2UgYSBjYWxsYmFj
ayBpbiAKc3RydWN0IHBsYXRmb3JtX2Rlc2MgdG8gYmUgY2FsbGVkIGR1cmluZyBzZWNvbmRhcnkg
c3RhcnR1cC4KCkxhc3RseSwgcGxlYXNlIGNsZWFuLXVwIHRoZSBjb2RlIGFuZCBzZW5kIHRoZSBw
YXRjaCBvbiB4ZW4tZGV2ZWwuIEkgd2lsbCBoYXZlIGEgCmNsb3NlciBsb29rIGF0IHRoYXQgdGlt
ZS4gRmVlbCBmcmVlIHRvIHBpbmcgbWUgb24gSVJDIGlmIHlvdSBoYXZlIGFueSBkb3VidCBob3cg
CnRvIHByb2NlZWQuCgo+IGFuZCB0aGUgb3V0cHV0Ogo+IGh0dHBzOi8vcGFzdGViaW4uY29tLzNK
Qnc2UzRLCgooWEVOKSAqKiogTE9BRElORyBET01BSU4gMCAqKioKKFhFTikgTWlzc2luZyBrZXJu
ZWwgYm9vdCBtb2R1bGU/CihYRU4pCihYRU4pICoqKioqKioqKioqKioqKioqKioqKioqKioqKioq
KioqKioqKioqKioKKFhFTikgUGFuaWMgb24gQ1BVIDA6CihYRU4pIENvdWxkIG5vdCBzZXQgdXAg
RE9NMCBndWVzdCBPUwooWEVOKSAqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioq
KioqCgpZb3UgcHJvYmFibHkgaGF2ZW4ndCBzZXQgdXAgdGhlIERvbTAga2VybmVsIGhlcmUuIENo
ZWNrIHlvdSB1LWJvb3QgcnVuZXMgZm9yIHRoaXMuCgpDaGVlcnMsCgotLSAKSnVsaWVuIEdyYWxs
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2
ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xp
c3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
