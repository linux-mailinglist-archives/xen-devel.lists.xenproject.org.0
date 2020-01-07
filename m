Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 03CDA13242B
	for <lists+xen-devel@lfdr.de>; Tue,  7 Jan 2020 11:53:57 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iomS3-0005wS-Gx; Tue, 07 Jan 2020 10:51:07 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=HXEJ=24=gmail.com=julien.grall.oss@srs-us1.protection.inumbo.net>)
 id 1iomS2-0005wN-6p
 for xen-devel@lists.xenproject.org; Tue, 07 Jan 2020 10:51:06 +0000
X-Inumbo-ID: 99960c8e-313b-11ea-abc9-12813bfff9fa
Received: from mail-wr1-f65.google.com (unknown [209.85.221.65])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 99960c8e-313b-11ea-abc9-12813bfff9fa;
 Tue, 07 Jan 2020 10:51:04 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id z3so53400042wru.3
 for <xen-devel@lists.xenproject.org>; Tue, 07 Jan 2020 02:51:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=07tTQUDB9gLpCcJNxC/xnunFjt1h8aGy9/f17t2y2T4=;
 b=qGYNNAnyRcKdgpmrUd+M+2GqxndXPhSIC74d+hSyXRXvhY6x1Y6VXp6t5mTjqvIvf2
 nIZrkFIoXxuOs2hzyUOUN2o2lKc4rCI5TFKCAKP98VCbjeaYc446GlrsA4PBjSOmm//0
 ol/1PMFotEoVNP8VLfbOdw6qMTZaycBJad0JA5na4pOIZoLsr5SgBLN4drHAIYjv+4VH
 cXFMSA67ij7DkmKrRuWl+LrUOeWfd6IPZ96kG3maGbZJsayhgqu4AyLyDTGrYXgLhD2p
 HEyD22iDnWa1+9+4uXmiYWbSscixiO/Bl1eIG/zdk5ixPCRKMz4Ap4Ep+q7IngRgb4Y2
 fBvQ==
X-Gm-Message-State: APjAAAUosIzgPXKIkogwVGb/5yM8pIuxNl9cG7cUdw8Xbj6LY2CCepY3
 LzU926nIzWevshRaDzzeDuk=
X-Google-Smtp-Source: APXvYqxKEC5NWW/Rp89wG2BEZQAJ3tnIdFnV5WhUayKMETNy9Cqwyrvep2EgJ1kAEfnlc/7QZkeSCQ==
X-Received: by 2002:adf:fe0e:: with SMTP id
 n14mr107785192wrr.116.1578394263350; 
 Tue, 07 Jan 2020 02:51:03 -0800 (PST)
Received: from a483e7b01a66.ant.amazon.com (54-240-197-236.amazon.com.
 [54.240.197.236])
 by smtp.gmail.com with ESMTPSA id y6sm74572615wrl.17.2020.01.07.02.51.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Jan 2020 02:51:02 -0800 (PST)
To: Wei Xu <xuwei5@hisilicon.com>, Stefano Stabellini <sstabellini@kernel.org>
References: <1577498922-192711-1-git-send-email-xuwei5@hisilicon.com>
 <e96ddb84-db96-5316-05a7-632fed7dddb8@xen.org>
 <5E071910.2070002@hisilicon.com>
 <alpine.DEB.2.21.2001061359580.732@sstabellini-ThinkPad-T480s>
 <5E1443CD.3060908@hisilicon.com>
 <5e39e799-a716-ee84-2061-a295335607e8@xen.org>
 <5E144F54.8000702@hisilicon.com>
From: Julien Grall <julien@xen.org>
Message-ID: <3c34a558-43dc-c6e4-0db2-aa7393e53440@xen.org>
Date: Tue, 7 Jan 2020 10:51:01 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.3.1
MIME-Version: 1.0
In-Reply-To: <5E144F54.8000702@hisilicon.com>
Content-Language: en-GB
Subject: Re: [Xen-devel] [PATCH] xen/arm: vgic-v3: Fix the typo of GICD IRQ
 active status range
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
Cc: xen-devel@lists.xenproject.org,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, prime.zeng@hisilicon.com,
 shameerali.kolothum.thodi@huawei.com, linuxarm@huawei.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

CgpPbiAwNy8wMS8yMDIwIDA5OjI4LCBXZWkgWHUgd3JvdGU6Cj4gSGkgSnVsaWVuLAo+IAo+IE9u
IDIwMjAvMS83IDE3OjEwLCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4+Cj4+Cj4+IE9uIDA3LzAxLzIw
MjAgMDg6MzksIFdlaSBYdSB3cm90ZToKPj4+IEhpIFN0ZWZhbm8sCj4+Pgo+Pj4gT24gMjAyMC8x
LzcgNjowMSwgU3RlZmFubyBTdGFiZWxsaW5pIHdyb3RlOgo+Pj4+IE9uIFNhdCwgMjggRGVjIDIw
MTksIFdlaSBYdSB3cm90ZToKPj4+Pj4gSGkgSnVsaWVuLAo+Pj4+Pgo+Pj4+PiBPbiAyMDE5LzEy
LzI4IDE2OjA5LCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4+Pj4+PiBIaSwKPj4+Pj4+Cj4+Pj4+PiBP
biAyOC8xMi8yMDE5IDAzOjA4LCBXZWkgWHUgd3JvdGU6Cj4+Pj4+Pj4gVGhpcyBwYXRjaCBmaXhl
cyB0aGUgdHlwbyBhYm91dCB0aGUgYWN0aXZlIHN0YXR1cyByYW5nZSBvZiBhbiBJUlEKPj4+Pj4+
PiB2aWEgR0lDRC4gT3RoZXJ3aXNlIGl0IHdpbGwgYmUgZmFpbGVkIHRvIGhhbmRsZSB0aGUgbW1p
byBhY2Nlc3MgYW5kCj4+Pj4+Pj4gaW5qZWN0IGEgZGF0YSBhYm9ydC4KPj4+Pj4+IEkgaGF2ZSBz
ZWVuIGEgcGF0Y2ggc2ltaWxhciBmcm9tIE5YUCBhIG1vbnRoIGFnbyBhbmQgSSBkaXNhZ3JlZWQg
Cj4+Pj4+PiBvbiB0aGUKPj4+Pj4+IGFwcHJvYWNoLgo+Pj4+Pj4KPj4+Pj4+IElmIHlvdSBsb29r
IGF0IHRoZSBjb250ZXh0IHlvdSBtb2RpZmVkLCBpdCBzYXlzIHRoYXQgcmVhZGluZyAKPj4+Pj4+
IEFDVElWRVIgaXMgbm90Cj4+Pj4+PiBzdXBwb3J0ZWQuIFdoaWxlIEkgYWdyZWUgdGhlIGJlaGF2
aW9yIGlzIG5vdCBjb25zaXN0ZW50IGFjY3Jvc3MgCj4+Pj4+PiBBQ1RJVkVSLAo+Pj4+Pj4gaW5q
ZWN0aW5nIGEgZGF0YSBhYm9ydCBpcyBhIHBlcmZlY3RseSBmaW5lIGJlaGF2aW9yIHRvIG1lICh0
aG91Z2ggCj4+Pj4+PiBub3Qgc3BlYwo+Pj4+Pj4gY29tcGxpYW50KSBhcyB3ZSBkb24ndCBpbXBs
ZW1lbnQgdGhlIHJlZ2lzdGVycyBjb3JyZWN0bHkuCj4+Pj4+Pgo+Pj4+Pj4gSSBndWVzcyB5b3Ug
YXJlIHNlbmRpbmcgdGhpcyBwYXRjaCwgYmVjYXVzZSB5b3UgdHJpZWQgTGludXggNS40IAo+Pj4+
Pj4gKG9yIGxhdGVyKQo+Pj4+Pj4gb24gWGVuLCByaWdodD8gTGludXggaGFzIHJlY2VudGx5IGJl
Z2FuIHRvIHJlYWQgQUNUSVZFUiB0byBjaGVjayAKPj4+Pj4+IHdoZXRoZXIgYW4KPj4+Pj4+IElS
USBpcyBhY3RpdmUgYXQgdGhlIEhXIGxldmVsIGR1cmluZyB0aGUgc3luY2hyb25pemluZyBvZiB0
aGUgCj4+Pj4+PiBJUlFTLiBGcm9tIG15Cj4+Pj4+PiB1bmRlcnN0YW5kaW5nLCB0aGlzIGlzIHVz
ZWQgYmVjYXVzZSB0aGVyZSBpcyBhIHdpbmRvdyB3aGVyZSB0aGUgCj4+Pj4+PiBpbnRlcnJ1cHQg
aXMKPj4+Pj4+IGFjdGl2ZSBhdCB0aGUgSFcgbGV2ZWwgYnV0IHRoZSBMaW51eCBJUlEgc3Vic3lz
dGVtIGlzIG5vdCBhd2FyZSBvZiAKPj4+Pj4+IGl0Lgo+Pj4+Pj4KPj4+Pj4+IFdoaWxlIHRoZSBw
YXRjaCBiZWxvdyB3aWxsIGFsbG93IExpbnV4IDUuNCB0byBub3QgY3Jhc2gsIGl0IGlzIG5vdCAK
Pj4+Pj4+IGdvaW5nIHRvCj4+Pj4+PiBtYWtlIGl0IGZseSB2ZXJ5IGZhciBiZWNhdXNlIG9mIHRo
ZSBhYm92ZS4gU28gSSBhbSByYXRoZXIgbm90IAo+Pj4+Pj4gaGFwcHkgd2l0aAo+Pj4+Pj4gcGVy
c3Vpbmcgd2l0aCByZXR1cm5pbmcgMC4KPj4+Pj4+Cj4+Pj4+IFllcywgSSBhbSB1c2luZyBMaW51
eCA1LjUtcmMyIDopCj4+Pj4+IEdvdCBpdCBhbmQgdGhhbmtzIGZvciB0aGUgZXhwbGFuYXRpb24u
Cj4+Pj4+IEkgYW0gbm90IGluc2lzdGVudCBvbiB0aGlzIGFuZCBPSyB0byB3YWl0IGZvciB0aGUg
dXBkYXRlLgo+Pj4+PiBUaGFua3MgYW5kIGhhdmUgYSB2ZXJ5IGhhcHB5IG5ldyB5ZWFyIQo+Pj4+
IEhpIFdlaSwKPj4+Pgo+Pj4+IHdoYXQgZG8geW91IGRvIHRvIHJlcHJvZHVjZSB0aGUgaXNzdWU/
IEFyZSB5b3UganVzdCBib290aW5nIExpbnV4Cj4+Pj4gNS41LXJjMiBhcyBkb20wIGFuZCBzZWVp
bmcgdGhlIGlzc3VlIGR1cmluZyBib290LCBvciBhcmUgeW91IGRvaW5nCj4+Pj4gc29tZXRoaW5n
IHNwZWNpZmljPwo+Pj4+Cj4+Pj4gLgo+Pj4+Cj4+Pgo+Pj4gSSBkaXJlY3RseSB0ZXN0ZWQgdGhl
IG1haW5saW5lIGtlcm5lbCB3aXRoIGRlZmNvbmZpZy4KPj4+IEFuZCB0aGUgNS41LXJjNSBrZXJu
ZWwgYm9vdGluZyBsb2cgaXMgYXMgYmVsb3c6Cj4+Pgo+Pj4gwqDCoMKgwqAgcm9vdEB1YnVudHU6
fiMgZG1lc2cgfCBtb3JlCj4+PiDCoMKgwqDCoCBbwqDCoMKgIDAuMDAwMDAwXSBCb290aW5nIExp
bnV4IG9uIHBoeXNpY2FsIENQVSAweDAwMDAwMDAwMDAgCj4+PiBbMHg0ODFmZDAxMF0KPj4+IMKg
wqDCoMKgIFvCoMKgwqAgMC4wMDAwMDBdIExpbnV4IHZlcnNpb24gNS41LjAtcmM1IChqb3l4QFR1
cmluZy1BcmNoLWIpIChnY2MgCj4+PiB2ZXJzaW9uIDQuOS4xIDIKPj4+IMKgwqDCoMKgIDAxNDA1
MDUgKHByZXJlbGVhc2UpIChjcm9zc3Rvb2wtTkcgbGluYXJvLTEuMTMuMS00LjktMjAxNC4wNSAt
IAo+Pj4gTGluYXJvIEdDQyA0LjktMjAKPj4+IMKgwqDCoMKgIDE0LjA1KSkgIzEzMiBTTVAgUFJF
RU1QVCBUdWUgSmFuIDcgMTU6NDM6MDYgQ1NUIDIwMjAKPj4+IMKgwqDCoMKgIFvCoMKgwqAgMC4w
MDAwMDBdIFhlbiBYRU5fVkVSU0lPTi5YRU5fU1VCVkVSU0lPTiBzdXBwb3J0IGZvdW5kCj4+PiDC
oMKgwqDCoCBbwqDCoMKgIDAuMDAwMDAwXSBlZmk6IEdldHRpbmcgRUZJIHBhcmFtZXRlcnMgZnJv
bSBGRFQ6Cj4+PiDCoMKgwqDCoCBbwqDCoMKgIDAuMDAwMDAwXSBlZmk6IEVGSSB2Mi41MCBieSBY
ZW4KPj4+IMKgwqDCoMKgIFvCoMKgwqAgMC4wMDAwMDBdIGVmaTrCoCBBQ1BJIDIuMD0weDE4MWQw
ZTcwCj4+PiDCoMKgwqDCoCBbwqDCoMKgIDAuMDAwMDAwXSBjbWE6IFJlc2VydmVkIDMyIE1pQiBh
dCAweDAwMDAwMDAwN2UwMDAwMDAKPj4+IMKgwqDCoMKgIFvCoMKgwqAgMC4wMDAwMDBdIEFDUEk6
IEVhcmx5IHRhYmxlIGNoZWNrc3VtIHZlcmlmaWNhdGlvbiBkaXNhYmxlZAo+Pj4gwqDCoMKgwqAg
W8KgwqDCoCAwLjAwMDAwMF0gQUNQSTogUlNEUCAweDAwMDAwMDAwMTgxRDBFNzAgMDAwMDI0ICh2
MDIgSElTScKgICkKPj4+IMKgwqDCoMKgIFvCoMKgwqAgMC4wMDAwMDBdIEFDUEk6IFhTRFQgMHgw
MDAwMDAwMDE4MUQwREIwIDAwMDBCQyAodjAxIEhJU0kgCj4+PiBISVAwOMKgwqDCoCAwMDAwMDAw
Cj4+PiDCoMKgwqDCoCAwwqDCoMKgwqDCoCAwMTAwMDAxMykKPj4KPj4gSXMgdGhhdCB0aGUgZnVs
bCBsb2cgZnJvbSBMaW51eD8gSWYgbm90LCBjYW4geW91IHBvc3QgaXQgaW4gZnVsbD8KPiAKPiBJ
IHdpbGwgcmVwbHkgdGhlIG90aGVyIHF1ZXN0aW9ucyBpbiBhbm90aGVyIG1haWwgc2luY2UgdGhl
IGJlbG93IGxvZyBpcyAKPiB0b28gYmlnLgoKTWF5YmUgSSBhbSBtaXNzaW5nIHNvbWV0aGluZywg
YnV0IExpbnV4IHNlZW1zIHRvIGJlIHJ1bm5pbmcgZmluZSBhbmQgSSAKY2FuJ3Qgc3BvdCBhbnkg
ZXJyb3IgcmVsYXRlZCB0byByZWFkIHRoZSBhY3RpdmUgc3RhdHVzIHJlZ2lzdGVyLiBCeSBhbnkg
CmNoYW5jZSwgZGlkIHlvdSBidWlsZCBYZW4gd2l0aCB5b3VyIHBhdGNoPwoKQ2hlZXJzLAoKLS0g
Ckp1bGllbiBHcmFsbAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5v
cmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZl
bA==
