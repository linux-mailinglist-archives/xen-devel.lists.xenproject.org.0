Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 78EA3F1D10
	for <lists+xen-devel@lfdr.de>; Wed,  6 Nov 2019 19:00:53 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iSPYf-0001lM-TI; Wed, 06 Nov 2019 17:57:29 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=LQ6J=Y6=zytor.com=hpa@srs-us1.protection.inumbo.net>)
 id 1iSPYe-0001lH-ID
 for xen-devel@lists.xenproject.org; Wed, 06 Nov 2019 17:57:28 +0000
X-Inumbo-ID: e4775314-00be-11ea-a1b1-12813bfff9fa
Received: from mail.zytor.com (unknown [198.137.202.136])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e4775314-00be-11ea-a1b1-12813bfff9fa;
 Wed, 06 Nov 2019 17:57:27 +0000 (UTC)
Received: from [IPv6:2601:646:8600:3281:adfc:245e:17b7:39c3]
 ([IPv6:2601:646:8600:3281:adfc:245e:17b7:39c3])
 (authenticated bits=0)
 by mail.zytor.com (8.15.2/8.15.2) with ESMTPSA id xA6Huv4Q961810
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NO);
 Wed, 6 Nov 2019 09:57:02 -0800
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com xA6Huv4Q961810
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
 s=2019091901; t=1573063025;
 bh=o6xliq1yN4/+nK8dGGImbCX2PNM/ohBM3dagy4vL754=;
 h=Date:In-Reply-To:References:Subject:To:CC:From:From;
 b=nPgclH4nMtbQ8UfGwygCasCgN6IoeV+EpUy5/3dLimB/x0V+ZOS/1v69nOqvKLjyl
 UVkmYWRjgVm/tTKcbuYFoJsVloKj41EdZJ809hhD5f8GnNLc0EoTOykyJu9LXvBDJx
 egAHsjXTaD8QRl7xOkHrK/R2Cmb2quVJVyJXnMMoZPiqjRikl0dRVC9D4RuI9vED0/
 lZq/abejpSSyvE1WLODo2w9OjR9BfsGRRGBiq9I5nd4NDIjE8g/DXwLfItjrCJX6bD
 fw1bjRVh9jpsFyN7HUXKIsvDS702sx+otdr3QZFgXjtuc9+B6GxF2Eaur+/TQQGZRY
 KEDqPZD/uyQzw==
Date: Wed, 06 Nov 2019 09:56:48 -0800
User-Agent: K-9 Mail for Android
In-Reply-To: <20191106170333.GD28380@zn.tnic>
References: <20191104151354.28145-1-daniel.kiper@oracle.com>
 <20191106170333.GD28380@zn.tnic>
MIME-Version: 1.0
To: Borislav Petkov <bp@alien8.de>, Daniel Kiper <daniel.kiper@oracle.com>
From: hpa@zytor.com
Message-ID: <3EABBAB2-5BEF-4FEE-8BB4-9EB4B0180B10@zytor.com>
Subject: Re: [Xen-devel] [PATCH v5 0/3] x86/boot: Introduce the kernel_info
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
Cc: jgross@suse.com, corbet@lwn.net, linux-efi@vger.kernel.org,
 tglx@linutronix.de, konrad.wilk@oracle.com, ard.biesheuvel@linaro.org,
 peterz@infradead.org, ross.philipson@oracle.com, x86@kernel.org,
 linux-kernel@vger.kernel.org, eric.snowberg@oracle.com, mingo@redhat.com,
 dave.hansen@linux.intel.com, rdunlap@infradead.org, luto@kernel.org,
 xen-devel@lists.xenproject.org, boris.ostrovsky@oracle.com,
 kanth.ghatraju@oracle.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gTm92ZW1iZXIgNiwgMjAxOSA5OjAzOjMzIEFNIFBTVCwgQm9yaXNsYXYgUGV0a292IDxicEBh
bGllbjguZGU+IHdyb3RlOgo+T24gTW9uLCBOb3YgMDQsIDIwMTkgYXQgMDQ6MTM6NTFQTSArMDEw
MCwgRGFuaWVsIEtpcGVyIHdyb3RlOgo+PiBIaSwKPj4gCj4+IER1ZSB0byB2ZXJ5IGxpbWl0ZWQg
c3BhY2UgaW4gdGhlIHNldHVwX2hlYWRlciB0aGlzIHBhdGNoIHNlcmllcwo+aW50cm9kdWNlcyBu
ZXcKPj4ga2VybmVsX2luZm8gc3RydWN0IHdoaWNoIHdpbGwgYmUgdXNlZCB0byBjb252ZXkgaW5m
b3JtYXRpb24gZnJvbSB0aGUKPmtlcm5lbCB0bwo+PiB0aGUgYm9vdGxvYWRlci4gVGhpcyB3YXkg
dGhlIGJvb3QgcHJvdG9jb2wgY2FuIGJlIGV4dGVuZGVkIHJlZ2FyZGxlc3MKPm9mIHRoZQo+PiBz
ZXR1cF9oZWFkZXIgbGltaXRhdGlvbnMuIEFkZGl0aW9uYWxseSwgdGhlIHBhdGNoIHNlcmllcyBp
bnRyb2R1Y2VzCj5zb21lCj4+IGNvbnZlbmllbmNlIGZlYXR1cmVzIGxpa2UgdGhlIHNldHVwX2lu
ZGlyZWN0IHN0cnVjdCBhbmQgdGhlCj4+IGtlcm5lbF9pbmZvLnNldHVwX3R5cGVfbWF4IGZpZWxk
Lgo+Cj5UaGF0J3MgYWxsIGZpbmUgYW5kIGRhbmR5IGJ1dCBJJ20gbWlzc2luZyBhbiBleGFtcGxl
IGFib3V0IHdoYXQgdGhhdCdsbAo+YmUgdXNlZCBmb3IsIGluIHByYWN0aWNlLgo+Cj5UaHguCgpG
b3Igb25lIHRoaW5nLCB3ZSBhbHJlYWR5IGhhdmUgcGVvcGxlIGFza2luZyBmb3IgbW9yZSB0aGFu
IDQgR2lCIHdvcnRoIG9mIGluaXRyYW1mcywgYW5kIGVzcGVjaWFsbHkgd2l0aCBpbml0cmFtZnMg
dGhhdCBodWdlIGl0IHdvdWxkIG1ha2UgYSAqbG90KiBvZiBzZW5zZSB0byBhbGxvdyBsb2FkaW5n
IGl0IGluIGNodW5rcyB3aXRob3V0IGhhdmluZyB0byBjb25jYXRlbmF0ZSB0aGVtLiBJIGhhdmUg
YmVlbiBhc2tpbmcgZm9yIGEgbG9uZyB0aW1lIGZvciBpbml0cmFtZnMgY3JlYXRvcnMgdG8gc3Bs
aXQgdGhlIGtlcm5lbC1kZXBlbmRlbnQgYW5kIGtlcm5lbCBpbmRlcGVuZGVudCBwYXJ0cyBpbnRv
IHNlcGFyYXRlIGluaXRyYW1mcyBtb2R1bGVzLgotLSAKU2VudCBmcm9tIG15IEFuZHJvaWQgZGV2
aWNlIHdpdGggSy05IE1haWwuIFBsZWFzZSBleGN1c2UgbXkgYnJldml0eS4KCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxp
c3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVj
dC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
