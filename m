Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3501A1321F9
	for <lists+xen-devel@lfdr.de>; Tue,  7 Jan 2020 10:12:33 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ioksQ-0005Yk-4A; Tue, 07 Jan 2020 09:10:14 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=HXEJ=24=gmail.com=julien.grall.oss@srs-us1.protection.inumbo.net>)
 id 1ioksO-0005YW-A1
 for xen-devel@lists.xenproject.org; Tue, 07 Jan 2020 09:10:12 +0000
X-Inumbo-ID: 81d62f06-312d-11ea-abb9-12813bfff9fa
Received: from mail-wm1-f66.google.com (unknown [209.85.128.66])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 81d62f06-312d-11ea-abb9-12813bfff9fa;
 Tue, 07 Jan 2020 09:10:11 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id f129so18480308wmf.2
 for <xen-devel@lists.xenproject.org>; Tue, 07 Jan 2020 01:10:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=pPiRb9p0vhbhjJZyCY+NmhxFop2/owmkPGMgACUxEYQ=;
 b=evgTwWjnR62+iYyFv8OiV0zsI/JC5/KibZRD7slDPF+JTJe1D9sz8SwjmFrJQ6yoTZ
 y3rvJfQzw+fonftoLU9viU+6Zpyf6qXU7HA72m0BIr7+ctwZ19dOyl3XkgvdKcUCqkpC
 llYZi3as+l0PuNk0Uq30SkPQgTeAchLpX7uCg/Q8c/Lz4eW6UWRv4lvpxSSsReEnlEyU
 cW+cOHVLJDs4vLyWMqrtkVYv0QbOVFMliONGrB8PkdKs/r9r5UzR+xmco5ZeNbUyMhgB
 VbRFpc5dcOUhVUV6UmqJbrVTzYGTbqirwul7ZVQbNUhS8amOpVqO4cmJu/NUzlEyaycQ
 8LnQ==
X-Gm-Message-State: APjAAAULFlGDpCORTougYp39mDIDtsY4TGI0iYoeAqmw0EgEDN/8DxF0
 AF1/Rnj+phhhHIuyL5/lyJs=
X-Google-Smtp-Source: APXvYqxHQGvUSBrNoVRGDxNrl94K9L+r4W4Dhl2VTbGi0uLJfT1ixk4ORxiw1h057iVQRrQOZ8fo1A==
X-Received: by 2002:a1c:4b0a:: with SMTP id y10mr40608304wma.78.1578388210389; 
 Tue, 07 Jan 2020 01:10:10 -0800 (PST)
Received: from a483e7b01a66.ant.amazon.com (54-240-197-232.amazon.com.
 [54.240.197.232])
 by smtp.gmail.com with ESMTPSA id s128sm26396752wme.39.2020.01.07.01.10.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Jan 2020 01:10:09 -0800 (PST)
To: Wei Xu <xuwei5@hisilicon.com>, Stefano Stabellini <sstabellini@kernel.org>
References: <1577498922-192711-1-git-send-email-xuwei5@hisilicon.com>
 <e96ddb84-db96-5316-05a7-632fed7dddb8@xen.org>
 <5E071910.2070002@hisilicon.com>
 <alpine.DEB.2.21.2001061359580.732@sstabellini-ThinkPad-T480s>
 <5E1443CD.3060908@hisilicon.com>
From: Julien Grall <julien@xen.org>
Message-ID: <5e39e799-a716-ee84-2061-a295335607e8@xen.org>
Date: Tue, 7 Jan 2020 09:10:08 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.3.1
MIME-Version: 1.0
In-Reply-To: <5E1443CD.3060908@hisilicon.com>
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

CgpPbiAwNy8wMS8yMDIwIDA4OjM5LCBXZWkgWHUgd3JvdGU6Cj4gSGkgU3RlZmFubywKPiAKPiBP
biAyMDIwLzEvNyA2OjAxLCBTdGVmYW5vIFN0YWJlbGxpbmkgd3JvdGU6Cj4+IE9uIFNhdCwgMjgg
RGVjIDIwMTksIFdlaSBYdSB3cm90ZToKPj4+IEhpIEp1bGllbiwKPj4+Cj4+PiBPbiAyMDE5LzEy
LzI4IDE2OjA5LCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4+Pj4gSGksCj4+Pj4KPj4+PiBPbiAyOC8x
Mi8yMDE5IDAzOjA4LCBXZWkgWHUgd3JvdGU6Cj4+Pj4+IFRoaXMgcGF0Y2ggZml4ZXMgdGhlIHR5
cG8gYWJvdXQgdGhlIGFjdGl2ZSBzdGF0dXMgcmFuZ2Ugb2YgYW4gSVJRCj4+Pj4+IHZpYSBHSUNE
LiBPdGhlcndpc2UgaXQgd2lsbCBiZSBmYWlsZWQgdG8gaGFuZGxlIHRoZSBtbWlvIGFjY2VzcyBh
bmQKPj4+Pj4gaW5qZWN0IGEgZGF0YSBhYm9ydC4KPj4+PiBJIGhhdmUgc2VlbiBhIHBhdGNoIHNp
bWlsYXIgZnJvbSBOWFAgYSBtb250aCBhZ28gYW5kIEkgZGlzYWdyZWVkIG9uIHRoZQo+Pj4+IGFw
cHJvYWNoLgo+Pj4+Cj4+Pj4gSWYgeW91IGxvb2sgYXQgdGhlIGNvbnRleHQgeW91IG1vZGlmZWQs
IGl0IHNheXMgdGhhdCByZWFkaW5nIEFDVElWRVIgCj4+Pj4gaXMgbm90Cj4+Pj4gc3VwcG9ydGVk
LiBXaGlsZSBJIGFncmVlIHRoZSBiZWhhdmlvciBpcyBub3QgY29uc2lzdGVudCBhY2Nyb3NzIAo+
Pj4+IEFDVElWRVIsCj4+Pj4gaW5qZWN0aW5nIGEgZGF0YSBhYm9ydCBpcyBhIHBlcmZlY3RseSBm
aW5lIGJlaGF2aW9yIHRvIG1lICh0aG91Z2ggCj4+Pj4gbm90IHNwZWMKPj4+PiBjb21wbGlhbnQp
IGFzIHdlIGRvbid0IGltcGxlbWVudCB0aGUgcmVnaXN0ZXJzIGNvcnJlY3RseS4KPj4+Pgo+Pj4+
IEkgZ3Vlc3MgeW91IGFyZSBzZW5kaW5nIHRoaXMgcGF0Y2gsIGJlY2F1c2UgeW91IHRyaWVkIExp
bnV4IDUuNCAob3IgCj4+Pj4gbGF0ZXIpCj4+Pj4gb24gWGVuLCByaWdodD8gTGludXggaGFzIHJl
Y2VudGx5IGJlZ2FuIHRvIHJlYWQgQUNUSVZFUiB0byBjaGVjayAKPj4+PiB3aGV0aGVyIGFuCj4+
Pj4gSVJRIGlzIGFjdGl2ZSBhdCB0aGUgSFcgbGV2ZWwgZHVyaW5nIHRoZSBzeW5jaHJvbml6aW5n
IG9mIHRoZSBJUlFTLiAKPj4+PiBGcm9tIG15Cj4+Pj4gdW5kZXJzdGFuZGluZywgdGhpcyBpcyB1
c2VkIGJlY2F1c2UgdGhlcmUgaXMgYSB3aW5kb3cgd2hlcmUgdGhlIAo+Pj4+IGludGVycnVwdCBp
cwo+Pj4+IGFjdGl2ZSBhdCB0aGUgSFcgbGV2ZWwgYnV0IHRoZSBMaW51eCBJUlEgc3Vic3lzdGVt
IGlzIG5vdCBhd2FyZSBvZiBpdC4KPj4+Pgo+Pj4+IFdoaWxlIHRoZSBwYXRjaCBiZWxvdyB3aWxs
IGFsbG93IExpbnV4IDUuNCB0byBub3QgY3Jhc2gsIGl0IGlzIG5vdCAKPj4+PiBnb2luZyB0bwo+
Pj4+IG1ha2UgaXQgZmx5IHZlcnkgZmFyIGJlY2F1c2Ugb2YgdGhlIGFib3ZlLiBTbyBJIGFtIHJh
dGhlciBub3QgaGFwcHkgCj4+Pj4gd2l0aAo+Pj4+IHBlcnN1aW5nIHdpdGggcmV0dXJuaW5nIDAu
Cj4+Pj4KPj4+IFllcywgSSBhbSB1c2luZyBMaW51eCA1LjUtcmMyIDopCj4+PiBHb3QgaXQgYW5k
IHRoYW5rcyBmb3IgdGhlIGV4cGxhbmF0aW9uLgo+Pj4gSSBhbSBub3QgaW5zaXN0ZW50IG9uIHRo
aXMgYW5kIE9LIHRvIHdhaXQgZm9yIHRoZSB1cGRhdGUuCj4+PiBUaGFua3MgYW5kIGhhdmUgYSB2
ZXJ5IGhhcHB5IG5ldyB5ZWFyIQo+PiBIaSBXZWksCj4+Cj4+IHdoYXQgZG8geW91IGRvIHRvIHJl
cHJvZHVjZSB0aGUgaXNzdWU/IEFyZSB5b3UganVzdCBib290aW5nIExpbnV4Cj4+IDUuNS1yYzIg
YXMgZG9tMCBhbmQgc2VlaW5nIHRoZSBpc3N1ZSBkdXJpbmcgYm9vdCwgb3IgYXJlIHlvdSBkb2lu
Zwo+PiBzb21ldGhpbmcgc3BlY2lmaWM/Cj4+Cj4+IC4KPj4KPiAKPiBJIGRpcmVjdGx5IHRlc3Rl
ZCB0aGUgbWFpbmxpbmUga2VybmVsIHdpdGggZGVmY29uZmlnLgo+IEFuZCB0aGUgNS41LXJjNSBr
ZXJuZWwgYm9vdGluZyBsb2cgaXMgYXMgYmVsb3c6Cj4gCj4gIMKgwqDCoCByb290QHVidW50dTp+
IyBkbWVzZyB8IG1vcmUKPiAgwqDCoMKgIFvCoMKgwqAgMC4wMDAwMDBdIEJvb3RpbmcgTGludXgg
b24gcGh5c2ljYWwgQ1BVIDB4MDAwMDAwMDAwMCBbMHg0ODFmZDAxMF0KPiAgwqDCoMKgIFvCoMKg
wqAgMC4wMDAwMDBdIExpbnV4IHZlcnNpb24gNS41LjAtcmM1IChqb3l4QFR1cmluZy1BcmNoLWIp
IChnY2MgCj4gdmVyc2lvbiA0LjkuMSAyCj4gIMKgwqDCoCAwMTQwNTA1IChwcmVyZWxlYXNlKSAo
Y3Jvc3N0b29sLU5HIGxpbmFyby0xLjEzLjEtNC45LTIwMTQuMDUgLSAKPiBMaW5hcm8gR0NDIDQu
OS0yMAo+ICDCoMKgwqAgMTQuMDUpKSAjMTMyIFNNUCBQUkVFTVBUIFR1ZSBKYW4gNyAxNTo0Mzow
NiBDU1QgMjAyMAo+ICDCoMKgwqAgW8KgwqDCoCAwLjAwMDAwMF0gWGVuIFhFTl9WRVJTSU9OLlhF
Tl9TVUJWRVJTSU9OIHN1cHBvcnQgZm91bmQKPiAgwqDCoMKgIFvCoMKgwqAgMC4wMDAwMDBdIGVm
aTogR2V0dGluZyBFRkkgcGFyYW1ldGVycyBmcm9tIEZEVDoKPiAgwqDCoMKgIFvCoMKgwqAgMC4w
MDAwMDBdIGVmaTogRUZJIHYyLjUwIGJ5IFhlbgo+ICDCoMKgwqAgW8KgwqDCoCAwLjAwMDAwMF0g
ZWZpOsKgIEFDUEkgMi4wPTB4MTgxZDBlNzAKPiAgwqDCoMKgIFvCoMKgwqAgMC4wMDAwMDBdIGNt
YTogUmVzZXJ2ZWQgMzIgTWlCIGF0IDB4MDAwMDAwMDA3ZTAwMDAwMAo+ICDCoMKgwqAgW8KgwqDC
oCAwLjAwMDAwMF0gQUNQSTogRWFybHkgdGFibGUgY2hlY2tzdW0gdmVyaWZpY2F0aW9uIGRpc2Fi
bGVkCj4gIMKgwqDCoCBbwqDCoMKgIDAuMDAwMDAwXSBBQ1BJOiBSU0RQIDB4MDAwMDAwMDAxODFE
MEU3MCAwMDAwMjQgKHYwMiBISVNJwqAgKQo+ICDCoMKgwqAgW8KgwqDCoCAwLjAwMDAwMF0gQUNQ
STogWFNEVCAweDAwMDAwMDAwMTgxRDBEQjAgMDAwMEJDICh2MDEgSElTSSAKPiBISVAwOMKgwqDC
oCAwMDAwMDAwCj4gIMKgwqDCoCAwwqDCoMKgwqDCoCAwMTAwMDAxMykKCklzIHRoYXQgdGhlIGZ1
bGwgbG9nIGZyb20gTGludXg/IElmIG5vdCwgY2FuIHlvdSBwb3N0IGl0IGluIGZ1bGw/Cgo+IAo+
IEJ1dCB0byBib290IHdpdGggQUNQSSBvbiBvdXIgaGFyZHdhcmUsIGV4Y2VwdCBhYm92ZSBjaGFu
Z2UgSSBoYXZlIGFsc28gCj4gZG9uZSBzb21lIGhhY2tpbmcgYmFzZWQgb24KPiBYRU4gNC4xMyBh
cyBiZWxvdzoKCkkgaGF2ZW4ndCBib290ZWQgWGVuIG9uIGFueSBBQ1BJIHN5c3RlbXMgcmVjZW50
bHkgc28gdGhlcmUgbWlnaHQgYmUgYnVncyAKaW4gdGhlIGNvZGUuIFlvdXIgY2hhbmdlcyBiZWxv
dyBpcyBkZWZpbml0ZWx5IGEgY2FsbCB0byBsb29rIG1vcmUgaW50byAKZGV0YWlscyB3aGF0J3Mg
d3JvbmcuCgo+IAo+ICDCoMKgwqAgZGlmZiAtLWdpdCBhL3hlbi9hcmNoL2FybS90cmFwcy5jIGIv
eGVuL2FyY2gvYXJtL3RyYXBzLmMKPiAgwqDCoMKgIGluZGV4IGQwMjhlYzkuLjIxNWEyOTEgMTAw
NjQ0Cj4gIMKgwqDCoCAtLS0gYS94ZW4vYXJjaC9hcm0vdHJhcHMuYwo+ICDCoMKgwqAgKysrIGIv
eGVuL2FyY2gvYXJtL3RyYXBzLmMKPiAgwqDCoMKgIEBAIC0xODU2LDggKzE4NTYsOCBAQCBzdGF0
aWMgYm9vbCB0cnlfbWFwX21taW8oZ2ZuX3QgZ2ZuKQo+ICDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgcmV0dXJuIGZhbHNlOwo+IAo+ICDCoMKgwqDCoMKgwqDCoMKgIC8qIFRoZSBoYXJkd2FyZSBk
b21haW4gY2FuIG9ubHkgbWFwIHBlcm1pdHRlZCBNTUlPIHJlZ2lvbnMgKi8KPiAgwqDCoMKgIC3C
oMKgwqAgaWYgKCAhaW9tZW1fYWNjZXNzX3Blcm1pdHRlZChkLCBtZm5feChtZm4pLCBtZm5feCht
Zm4pICsgMSkgKQo+ICDCoMKgwqAgLcKgwqDCoMKgwqDCoMKgIHJldHVybiBmYWxzZTsKPiAgwqDC
oMKgICvCoMKgwqAgLyogaWYgKCAhaW9tZW1fYWNjZXNzX3Blcm1pdHRlZChkLCBtZm5feChtZm4p
LCBtZm5feChtZm4pICsgMSkgCj4gKSAqLwo+ICDCoMKgwqAgK8KgwqDCoCAvKsKgwqDCoMKgIHJl
dHVybiBmYWxzZTsgKi8KCkRvbTAgc2hvdWxkIGJlIGFibGUgdG8gbWFwIG5lYXJseSBhbGwgdGhl
IGFkZHJlc3Mgc3BhY2UgdGhyb3VnaCB0aGlzIApmdW5jdGlvbi4gVGhlIG9ubHkgdGhpbmcgbm90
IGFsbG93ZWQgaXMgdGhlIEdJQyBhbmQgVUFSVCAoc2VlIAphY3BpX2lvbWVtX2RlbnlfYWNjZXNz
KS4KClNvIHdoeSBkbyB5b3Ugd2FudCB0aGlzIGNoYW5nZT8gV2hhdCBzb3J0IG9mIGFkZHJlc3Mg
RG9tMCBpcyB0cnlpbmcgdG8gCm1hcCBhbmQgZmFpbD8KCj4gCj4gIMKgwqDCoMKgwqDCoMKgwqAg
cmV0dXJuICFtYXBfcmVnaW9uc19wMm10KGQsIGdmbiwgMSwgbWZuLCBwMm1fbW1pb19kaXJlY3Rf
Yyk7Cj4gIMKgwqDCoMKgIH0KPiAKPiAKPiAgwqDCoMKgIGRpZmYgLS1naXQgYS94ZW4vYXJjaC9h
cm0vbW0uYyBiL3hlbi9hcmNoL2FybS9tbS5jCj4gIMKgwqDCoCBpbmRleCA0ZDZjOTcxLi5jNjI2
ZjllIDEwMDY0NAo+ICDCoMKgwqAgLS0tIGEveGVuL2FyY2gvYXJtL21tLmMKPiAgwqDCoMKgICsr
KyBiL3hlbi9hcmNoL2FybS9tbS5jCj4gIMKgwqDCoCBAQCAtMTA5NSw3ICsxMDk1LDcgQEAgc3Rh
dGljIGJvb2wgeGVuX3B0X2NoZWNrX2VudHJ5KGxwYWVfdCBlbnRyeSwgCj4gbWZuX3QgbWZuLCB1
bnNpZ25lZCBpbnQgZmxhZ3MpCj4gIMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB7Cj4gIMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIG1tX3ByaW50aygiQ2hhbmdpbmcgTUZOIGZvciBh
IHZhbGlkIGVudHJ5IGlzIG5vdCAKPiBhbGxvd2VkICglIyJQUklfbWZuIiAtPiAlIyJQUklfbWZu
IikuXG4iLAo+ICDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgIG1mbl94KGxwYWVfZ2V0X21mbihlbnRyeSkpLCBtZm5feChtZm4pKTsKPiAgwqDCoMKg
IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHJldHVybiBmYWxzZTsKPiAgwqDCoMKgICvCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgIHJldHVybiB0cnVlOwoKVGhlcmUgaXMgYSBwcmV0dHkgZ29vZCByZWFz
b24gdG8gcHJldmVudCBtb2RpZnlpbmcgdGhlIE1GTiBvbiBhIHZhbGlkIAplbnRyeS4gSW5kZWVk
LCB0aGUgUFQgY29kZSBpcyBub3QgaGFuZGxpbmcgb2YgdGhlIEJyZWFrLUJlZm9yZS1NYWtlIApz
ZXF1ZW5jZSAocmVxdWlyZXMgd2hlbiB1cGRhdGluZyBjZXJ0YWluIGVudHJ5KSBhcyB0aGlzIGlz
IGEgY2FuIG9mIHdvcm1zLgoKSG93ZXZlciwgZHVyaW5nIG15IHRlc3RpbmcgSSBuZXZlciBmb3Vu
ZCBhIHBsYWNlIHdoZXJlIGFuIHZhbGlkIGVudHJ5IGlzIAptb2RpZmllZCAob3RoZXIgdGhhbiB0
aGUgcGVybWlzc2lvbnMgcGFydCkuIFNvIGNhbiB5b3UgZ2l2ZSBtb3JlIGRldGFpbHMgCmhvdyB5
b3UgY2FtZSB1cCBoZXJlPwoKPiAgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIH0KPiAgwqDCoMKg
wqDCoMKgwqDCoCB9Cj4gIMKgwqDCoMKgwqDCoMKgwqAgLyogU2FuaXR5IGNoZWNrIHdoZW4gcmVt
b3ZpbmcgYSBwYWdlLiAqLwo+IAo+IAo+ICDCoMKgwqAgZGlmZiAtLWdpdCBhL3hlbi9hcmNoL2Fy
bS9zZXR1cC5jIGIveGVuL2FyY2gvYXJtL3NldHVwLmMKPiAgwqDCoMKgIGluZGV4IDNjODk5Y2Qu
LjFlODMzNTEgMTAwNjQ0Cj4gIMKgwqDCoCAtLS0gYS94ZW4vYXJjaC9hcm0vc2V0dXAuYwo+ICDC
oMKgwqAgKysrIGIveGVuL2FyY2gvYXJtL3NldHVwLmMKPiAgwqDCoMKgIEBAIC04NTIsNyArODUy
LDggQEAgdm9pZCBfX2luaXQgc3RhcnRfeGVuKHVuc2lnbmVkIGxvbmcgCj4gYm9vdF9waHlzX29m
ZnNldCwKPiAgwqDCoMKgwqDCoMKgwqDCoCBlbHNlCj4gIMKgwqDCoMKgwqDCoMKgwqAgewo+ICDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcHJpbnRrKCJCb290aW5nIHVzaW5nIEFDUElcbiIpOwo+
ICDCoMKgwqAgLcKgwqDCoMKgwqDCoMKgIGRldmljZV90cmVlX2ZsYXR0ZW5lZCA9IE5VTEw7Cj4g
IMKgwqDCoCArwqDCoMKgwqDCoMKgwqAgZGV2aWNlX3RyZWVfZmxhdHRlbmVkID0gcmVsb2NhdGVf
ZmR0KGZkdF9wYWRkciwgZmR0X3NpemUpOwo+ICDCoMKgwqAgK8KgwqDCoMKgwqDCoMKgIGR0X3Vu
ZmxhdHRlbl9ob3N0X2RldmljZV90cmVlKCk7CgpXaGVuIHVzaW5nIEFDUEksIHRoZSBEVCBzaG91
bGQgbm90IGJlIHVzZWQuIFNvIHdoeSBkbyB5b3UgbmVlZCB0aGlzPwoKQ2hlZXJzLAoKLS0gCkp1
bGllbiBHcmFsbAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcK
aHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
