Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 23904E24BF
	for <lists+xen-devel@lfdr.de>; Wed, 23 Oct 2019 22:48:04 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iNNVH-0005P0-IW; Wed, 23 Oct 2019 20:45:11 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Nz2q=YQ=zytor.com=hpa@srs-us1.protection.inumbo.net>)
 id 1iNNVF-0005Ov-Hd
 for xen-devel@lists.xenproject.org; Wed, 23 Oct 2019 20:45:09 +0000
X-Inumbo-ID: feec464e-f5d5-11e9-beca-bc764e2007e4
Received: from mail.zytor.com (unknown [198.137.202.136])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id feec464e-f5d5-11e9-beca-bc764e2007e4;
 Wed, 23 Oct 2019 20:45:07 +0000 (UTC)
Received: from hanvin-mobl2.amr.corp.intel.com ([192.55.54.42])
 (authenticated bits=0)
 by mail.zytor.com (8.15.2/8.15.2) with ESMTPSA id x9NKiVNI654501
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NO);
 Wed, 23 Oct 2019 13:44:32 -0700
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com x9NKiVNI654501
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
 s=2019091901; t=1571863478;
 bh=IxSw0En77HLXWyxMsAZA8B4xJrdNJCgIFWutGFFmmRQ=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=Ai7tp2yA8yPU8FUEgNh/Hfr47IbCe0eyYCGmwSZaS5Rws5CAHWcVBinf/nbkpnATG
 AOHwxFokRgB8ciGOBP1AxRsKa7oqSkUtLXN3uSAoEVPRwFU67/ZU1jVGt7j5UlXzE+
 wLtLdmNJ5kMKcGxlWrBiXZ8UEr9h51Sva8epb8OghyHlTTFau9/NMCr2KV4qJy85LE
 18NxuEXX8QnmAOuAn4kc6WVSszp+BfNNZdKtum03l40w/MnLX3P8nZ9UYBmSx2ef0C
 9xhqS4HYTFyV7vJ9gTVsFY6Sg/efL3IRRwCmsMWTVohZow0ckxThLCMouh0DPe8VAh
 Dky+SXXXWz3Yg==
To: Daniel Kiper <daniel.kiper@oracle.com>, linux-efi@vger.kernel.org,
 linux-kernel@vger.kernel.org, x86@kernel.org,
 xen-devel@lists.xenproject.org
References: <20191009105358.32256-1-daniel.kiper@oracle.com>
 <20191016110642.5q3bm73vi6o6gn5r@tomti.i.net-space.pl>
From: "H. Peter Anvin" <hpa@zytor.com>
Message-ID: <781feb2e-a4e1-36f8-ba01-a3c6101f5193@zytor.com>
Date: Wed, 23 Oct 2019 13:44:30 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <20191016110642.5q3bm73vi6o6gn5r@tomti.i.net-space.pl>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v3 0/3] x86/boot: Introduce the kernel_info
 et consortes
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
Cc: jgross@suse.com, eric.snowberg@oracle.com, ard.biesheuvel@linaro.org,
 konrad.wilk@oracle.com, corbet@lwn.net, peterz@infradead.org,
 ross.philipson@oracle.com, dave.hansen@linux.intel.com, mingo@redhat.com,
 bp@alien8.de, Randy Dunlap <rdunlap@infradead.org>, luto@kernel.org,
 boris.ostrovsky@oracle.com, tglx@linutronix.de
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjAxOS0xMC0xNiAwNDowNiwgRGFuaWVsIEtpcGVyIHdyb3RlOgo+IE9uIFdlZCwgT2N0IDA5
LCAyMDE5IGF0IDEyOjUzOjU1UE0gKzAyMDAsIERhbmllbCBLaXBlciB3cm90ZToKPj4gSGksCj4+
Cj4+IER1ZSB0byB2ZXJ5IGxpbWl0ZWQgc3BhY2UgaW4gdGhlIHNldHVwX2hlYWRlciB0aGlzIHBh
dGNoIHNlcmllcyBpbnRyb2R1Y2VzIG5ldwo+PiBrZXJuZWxfaW5mbyBzdHJ1Y3Qgd2hpY2ggd2ls
bCBiZSB1c2VkIHRvIGNvbnZleSBpbmZvcm1hdGlvbiBmcm9tIHRoZSBrZXJuZWwgdG8KPj4gdGhl
IGJvb3Rsb2FkZXIuIFRoaXMgd2F5IHRoZSBib290IHByb3RvY29sIGNhbiBiZSBleHRlbmRlZCBy
ZWdhcmRsZXNzIG9mIHRoZQo+PiBzZXR1cF9oZWFkZXIgbGltaXRhdGlvbnMuIEFkZGl0aW9uYWxs
eSwgdGhlIHBhdGNoIHNlcmllcyBpbnRyb2R1Y2VzIHNvbWUKPj4gY29udmVuaWVuY2UgZmVhdHVy
ZXMgbGlrZSB0aGUgc2V0dXBfaW5kaXJlY3Qgc3RydWN0IGFuZCB0aGUKPj4ga2VybmVsX2luZm8u
c2V0dXBfdHlwZV9tYXggZmllbGQuCj4+Cj4+IERhbmllbAo+Pgo+PiAgRG9jdW1lbnRhdGlvbi94
ODYvYm9vdC5yc3QgICAgICAgICAgICAgfCAxNjggKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrCj4+ICBh
cmNoL3g4Ni9ib290L01ha2VmaWxlICAgICAgICAgICAgICAgICB8ICAgMiArLQo+PiAgYXJjaC94
ODYvYm9vdC9jb21wcmVzc2VkL01ha2VmaWxlICAgICAgfCAgIDQgKy0KPj4gIGFyY2gveDg2L2Jv
b3QvY29tcHJlc3NlZC9rYXNsci5jICAgICAgIHwgIDEyICsrKysrKwo+PiAgYXJjaC94ODYvYm9v
dC9jb21wcmVzc2VkL2tlcm5lbF9pbmZvLlMgfCAgMjIgKysrKysrKysrKysKPj4gIGFyY2gveDg2
L2Jvb3QvaGVhZGVyLlMgICAgICAgICAgICAgICAgIHwgICAzICstCj4+ICBhcmNoL3g4Ni9ib290
L3Rvb2xzL2J1aWxkLmMgICAgICAgICAgICB8ICAgNSArKysKPj4gIGFyY2gveDg2L2luY2x1ZGUv
dWFwaS9hc20vYm9vdHBhcmFtLmggIHwgIDE2ICsrKysrKystCj4+ICBhcmNoL3g4Ni9rZXJuZWwv
ZTgyMC5jICAgICAgICAgICAgICAgICB8ICAxMSArKysrKysKPj4gIGFyY2gveDg2L2tlcm5lbC9r
ZGVidWdmcy5jICAgICAgICAgICAgIHwgIDIwICsrKysrKysrLS0KPj4gIGFyY2gveDg2L2tlcm5l
bC9rc3lzZnMuYyAgICAgICAgICAgICAgIHwgIDMwICsrKysrKysrKystLS0tCj4+ICBhcmNoL3g4
Ni9rZXJuZWwvc2V0dXAuYyAgICAgICAgICAgICAgICB8ICAgNCArKwo+PiAgYXJjaC94ODYvbW0v
aW9yZW1hcC5jICAgICAgICAgICAgICAgICAgfCAgMTEgKysrKysrCj4+ICAxMyBmaWxlcyBjaGFu
Z2VkLCAyOTIgaW5zZXJ0aW9ucygrKSwgMTYgZGVsZXRpb25zKC0pCj4+Cj4+IERhbmllbCBLaXBl
ciAoMyk6Cj4+ICAgICAgIHg4Ni9ib290OiBJbnRyb2R1Y2UgdGhlIGtlcm5lbF9pbmZvCj4+ICAg
ICAgIHg4Ni9ib290OiBJbnRyb2R1Y2UgdGhlIGtlcm5lbF9pbmZvLnNldHVwX3R5cGVfbWF4Cj4+
ICAgICAgIHg4Ni9ib290OiBJbnRyb2R1Y2UgdGhlIHNldHVwX2luZGlyZWN0Cj4gCj4gaHBhLCBw
aW5nPwo+IAoKTG9va3MgcmVhbGx5IGdvb2QgdG8gbWUsIG1vZHVsbyB0aGUgZmVlZGJhY2sgUmFu
ZHkgYWxyZWFkeSBicm91Z2h0IHVwLgoKUmV2aWV3ZWQtYnk6IEguIFBldGVyIEFudmluIChJbnRl
bCkgPGhwYUB6eXRvci5jb20+CgoJLWhwYQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3Rz
LnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0
aW5mby94ZW4tZGV2ZWw=
