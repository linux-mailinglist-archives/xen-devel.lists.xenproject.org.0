Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 06C4E1B872
	for <lists+xen-devel@lfdr.de>; Mon, 13 May 2019 16:37:48 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hQC2b-00028Z-7d; Mon, 13 May 2019 14:34:57 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=nxsn=TN=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hQC2a-00028H-6A
 for xen-devel@lists.xen.org; Mon, 13 May 2019 14:34:56 +0000
X-Inumbo-ID: 46546a54-758c-11e9-b173-270d533819c3
Received: from foss.arm.com (unknown [217.140.101.70])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 46546a54-758c-11e9-b173-270d533819c3;
 Mon, 13 May 2019 14:34:54 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5A821341;
 Mon, 13 May 2019 07:34:54 -0700 (PDT)
Received: from [10.37.12.148] (unknown [10.37.12.148])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 07F2D3F71E;
 Mon, 13 May 2019 07:34:52 -0700 (PDT)
To: Andrii Anisov <andrii.anisov@gmail.com>, xen-devel@lists.xen.org
References: <1556007026-31057-1-git-send-email-andrii.anisov@gmail.com>
 <8f8a401d-bdfc-4a40-61bc-4ceb8c518ade@arm.com>
 <9553a5cc-ac8b-04c4-3b89-13b1d92e306e@gmail.com>
 <0e06d98d-f366-ff85-5f19-541c3079012c@arm.com>
 <539f8230-87af-9ffd-0b9b-4f44a2e26599@gmail.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <256009a8-c960-5342-ee8e-3e0721af8658@arm.com>
Date: Mon, 13 May 2019 15:34:50 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <539f8230-87af-9ffd-0b9b-4f44a2e26599@gmail.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v2 0/2] Introduce runstate area registration
 with phys address
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
Cc: Andrii Anisov <andrii_anisov@epam.com>, Jan Beulich <JBeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

CgpPbiA1LzEzLzE5IDM6MTQgUE0sIEFuZHJpaSBBbmlzb3Ygd3JvdGU6Cj4gSGVsbG8gSnVsaWVu
LAoKSGVsbG8sCgo+IE9uIDEzLjA1LjE5IDE0OjE2LCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4+Pj4g
SSBhbSBhZnJhaWQgSSBjYW4ndCBwb3NzaWJsZSBiYWNrIHRoaXMgYXNzdW1wdGlvbi4gQXMgSSBw
b2ludGVkIG91dCAKPj4+PiBpbiB0aGUgcHJldmlvdXMgdmVyc2lvbiwgSSB3b3VsZCBiZSBPSyB3
aXRoIHRoZSBhbHdheXMgbWFwIHNvbHV0aW9uIAo+Pj4+IG9uIEFybTMyIChwZW5kaW5nIHBlcmZv
cm1hbmNlKSBiZWNhdXNlIGl0IHdvdWxkIGJlIHBvc3NpYmxlIHRvIAo+Pj4+IGluY3JlYXNlIHRo
ZSB2aXJ0dWFsIGFkZHJlc3MgYXJlYSBieSByZXdvcmtpbmcgdGhlIGFkZHJlc3Mgc3BhY2UuCj4+
Pgo+Pj4gSSdtIHNvcnJ5LCBJJ20gbm90IHN1cmUgd2hhdCBzaG91bGQgYmUgbXkgYWN0aW9ucyBh
Ym91dCB0aGF0Lgo+Pgo+PiBUaGVyZSBubyBjb2RlIG1vZGlmaWNhdGlvbiBpbnZvbHZlZCBzbyBm
YXIuIEp1c3QgdXBkYXRpbmcgeW91ciBjb3ZlciAKPj4gbGV0dGVyIHdpdGggd2hhdCBJIGp1c3Qg
c2FpZCBhYm92ZS4KPiAKPiBPSywgSSdsbCB0YWtlIGl0IGZvciB0aGUgbmV4dCB2ZXJzaW9uLgo+
IAo+Pj4+IFRoZSBwYXRjaCBsb29rcyB3cm9uZyB0byBtZS4gWW91IGFyZSB1c2luZyB2aXJ0X3Rv
X3BoeXMoKSBvbiBhIAo+Pj4+IHBlcmNwdSBhcmVhLiBXaGF0IGRvZXMgYWN0dWFsbHkgcHJvbWlz
ZSB5b3UgdGhlIHBoeXNpY2FsIGFkZHJlc3MgCj4+Pj4gd2lsbCBhbHdheXMgYmUgdGhlIHNhbWU/
Cj4+Pgo+Pj4gU29ycnkgZm9yIG15IGlnbm9yYW5jZSBoZXJlLCBjb3VsZCB5b3UgcGxlYXNlIGVs
YWJvcmF0ZSBtb3JlIGFib3V0IAo+Pj4gd2hhdCBpcyB3cm9uZyBoZXJlPwo+Pgo+PiBXaGlsZSB0
aGUgdmlydHVhbCBhZGRyZXNzIHdpbGwgbmV2ZXIgY2hhbmdlIG92ZXIgb3ZlciB0aGUgbGlmZSBj
eWNsZSAKPj4gb2YgYSB2YXJpYWJsZSwgSSBhbSBub3QgZW50aXJlbHkgc3VyZSB3ZSBjYW4gbWFr
ZSB0aGUgc2FtZSBhc3N1bXB0aW9uIAo+PiBmb3IgdGhlIHBoeXNpY2FsIGFkZHJlc3MuCj4+Cj4+
IEkga25vdyB0aGF0IGttYWxsb2MoKSBpcyBwcm9taXNpbmcgeW91IHRoYXQgdGhlIHBoeXNpY2Fs
IGFkZHJlc3Mgd2lsbCAKPj4gbm90IGNoYW5nZS4gQnV0IHBlcmNwdSBkb2VzIG5vdCBzZWVtIHRv
IHVzZSBrbWFsbG9jKCkgc28gaGF2ZSB5b3UgCj4+IGNvbmZpcm1lZCB0aGlzIGFzc3VtcHRpb24g
Y2FuIGhvbGQ/Cj4gCj4gSSBuZWVkIGEgYml0IG1vcmUgdGltZSB0byBpbnZlc3RpZ2F0ZS4KPiAK
PiAKPj4+PiBBcmUgeW91IHNheWluZyB0aGF0IHRoZSBjb21tYW5kIGRkIGlzIHRoZSBDUFVCdXJu
PyBJIGFtIG5vdCBzdXJlIGhvdyAKPj4+PiB0aGlzIGNvdWxkIGJlIGNvbnNpZGVyZWQgYXMgYSBD
UFVCdXJuLiBJSE1PLCB0aGlzIGlzIG1vcmUgSU8gcmVsYXRlZC4KPj4+Cj4+PiBCb3RoIC9kZXYv
bnVsbCBhbmQgL2Rldi96ZXJvIGFyZSB2aXJ0dWFsIGRldmljZXMgbm8gYWN0dWFsIElPIGlzIAo+
Pj4gcGVyZm9ybWVkIGR1cmluZyB0aGVpciBvcGVyYXRpb25zLCBhbGwgdGhlIGxvYWQgaXMgQ1BV
ICh1c2VyIGFuZCBzeXMpLgo+Pgo+PiBUaGFuayB5b3UgZm9yIHRoZSBleHBsYW5hdGlvbi4gU2hh
bGwgSSBndWVzcyB0aGlzIGlzIGFuIGV4aXN0aW5nIAo+PiBiZW5jaG1hcmsgWzFdPwo+IAo+IFdl
bGwsICJkZCBpZj0vZGV2L3plcm8gb2Y9L2Rldi9udWxsIiBpcyBqdXN0IGEgdHJpdmlhbCB3YXkg
dG8gZ2V0IG9uZSBybgo+IENQVSBjb3JlIGJ1c3kuIEl0IHdvcmtzIGZvciAoYWxtb3N0KSBhbnkg
TGludXggc3lzdGVtIHdpdGhvdXQgYW55IAo+IGFkZGl0aW9uYWwgbW92ZW1lbnRzLgo+IFVzaW5n
IGFub3RoZXIgdHJpdmlhbCBHTyBhcHBsaWNhdGlvbiBmb3IgdGhhdCBwdXJwb3NlLCBzZWVtcyB0
byBtZSBsaWtlIAo+IGFuIG92ZXJraWxsLiBZZXQgaWYgeW91IGluc2lzdCwgSSBjYW4gdXNlIGl0
LgoKTXkgcG9pbnQgb2YgbXkgbWVzc2FnZSBpcyB0byB1bmRlcnN0YW5kIHRoZSBleGFjdCB3b3Jr
bG9hZC9zZXR1cCB5b3UgYXJlIAp1c2luZy4gImRkIiB3YXMgbm90IGFuIGVudGlyZWx5IG9idmlv
dXMgY2hvaWNlIGZvciBDUFVCdXJuIGFuZCBHb29nbGUgCmRpZG4ndCBwcm92aWRlIGEgbG90IG9m
IHdlYnNpdGUgYmFja2luZyB0aGlzIGluZm9ybWF0aW9uLgoKQW55d2F5LCBub3cgSSB1bmRlcnN0
YW5kIGEgYml0IG1vcmUgdGhlIHdvcmtsb2FkLCBhIGNvdXBsZSBvZiBtb3JlIApxdWVzdGlvbnM6
CiAgICAtIEhvdyBtYW55IHZDUFVzIGFyZSB5b3UgdXNpbmcgaW4gZWFjaCBkb21haW4/CiAgICAt
IFdoYXQgc2NoZWR1bGVyIGFyZSB5b3UgdXNpbmc/CiAgICAtIFdoYXQgaXMgdGhlIGFmZmluaXR5
PwoKQ2hlZXJzLAoKLS0gCkp1bGllbiBHcmFsbAoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3hlbi1kZXZlbA==
