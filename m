Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E93113B434
	for <lists+xen-devel@lfdr.de>; Tue, 14 Jan 2020 22:24:23 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1irTdZ-0004x1-J4; Tue, 14 Jan 2020 21:22:09 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=VOhe=3D=gmail.com=julien.grall.oss@srs-us1.protection.inumbo.net>)
 id 1irTdY-0004ww-DM
 for xen-devel@lists.xenproject.org; Tue, 14 Jan 2020 21:22:08 +0000
X-Inumbo-ID: eab0d788-3713-11ea-8475-12813bfff9fa
Received: from mail-wr1-f67.google.com (unknown [209.85.221.67])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id eab0d788-3713-11ea-8475-12813bfff9fa;
 Tue, 14 Jan 2020 21:22:07 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id w15so13709135wru.4
 for <xen-devel@lists.xenproject.org>; Tue, 14 Jan 2020 13:22:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=mubSpjg75EW8TE69qWuIrdpLLAFD1rchP6JmEJOd8cI=;
 b=cYUnaoCaK6VHarAbSmFCkvTF02wdERSg5Q7hctFbCepSesAPFAM/wTqr+O39IIiFiS
 3ewSacgYcXQMgzq9/qgyc+M2qm8bfzVcaDqd9Nlont2OoNSfcYU18dtrr+vsreXSHPyF
 6tuPEwQYWPeI8LYmIuC8WYmCISzZDtOggX7fGzdeGJtVyA6ZdIBRWHQAsKLmZuy7seBW
 YqkOsLynYTqwRpQDrWIZt5K7BnwpLOeM99ayeQfcS1Ukm4JXt+eCMHOoIpmvHNa0xWm3
 oobHfDiJnnFvGPq49UhMJ6hO3DnuyyuPHbCKBIl9NLeG6Y43+UqE8+UDoA+b1HHoV1Mp
 c8Zw==
X-Gm-Message-State: APjAAAVK4Je4UsBRF2252npefQbC+F8xgH537iUZD2QiPqo3d1iQVZzS
 MnuzG/OV+fxlmKEZKY0xFPg=
X-Google-Smtp-Source: APXvYqxUlwEMmJIwdmGJPAvvUVYaPtfg0rYN9NSgKh+Mv12KmD/6LyCTdR3ChhxihiG3ol0lgtX6Bg==
X-Received: by 2002:a05:6000:1288:: with SMTP id
 f8mr27406113wrx.66.1579036926588; 
 Tue, 14 Jan 2020 13:22:06 -0800 (PST)
Received: from a483e7b01a66.ant.amazon.com (54-240-197-228.amazon.com.
 [54.240.197.228])
 by smtp.gmail.com with ESMTPSA id p17sm21405516wrx.20.2020.01.14.13.22.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Jan 2020 13:22:06 -0800 (PST)
To: Brian Woods <brian.woods@xilinx.com>, xen-devel@lists.xenproject.org
References: <1578619590-3661-1-git-send-email-brian.woods@xilinx.com>
 <1578619590-3661-3-git-send-email-brian.woods@xilinx.com>
From: Julien Grall <julien@xen.org>
Message-ID: <4e9c2f08-e502-abcc-2c7d-29ca36bdaf0b@xen.org>
Date: Tue, 14 Jan 2020 21:22:04 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.3.1
MIME-Version: 1.0
In-Reply-To: <1578619590-3661-3-git-send-email-brian.woods@xilinx.com>
Content-Language: en-GB
Subject: Re: [Xen-devel] [RFC 2/2] smmu: add support for generic DT bindings
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
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgQnJpYW4sCgpUaGFuayB5b3UgZm9yIHRoZSBwYXRjaC4KCk9uIDEwLzAxLzIwMjAgMDE6MjYs
IEJyaWFuIFdvb2RzIHdyb3RlOgo+IFJlc3RydWN0dXJlIHNvbWUgb2YgdGhlIGNvZGUgYW5kIGFk
ZCBzdXBwb3J0aW5nIGZ1bmN0aW9ucyBmb3IgYWRkaW5nCj4gZ2VuZXJpYyBkZXZpY2UgdHJlZSAo
RFQpIGJpbmRpbmcgc3VwcG9ydC4gIFRoZSBub3JtYWwgYWRkX2RldmljZSBhbmQKPiBkdF94bGF0
ZSBmdW5jdGlvbnMgYXJlIHdyYXBwZXJzIG9mIHRoZSBsZWdhY3kgZnVuY3Rpb25zIGR1ZSB0byBs
ZWdhY3kKPiBjYWxscyBuZWVkaW5nIG1vcmUgYXJndW1lbnRzIGJlY2F1c2UgdGhlIGZpbmRfc21t
dSBjYW4ndCBhIHNtbXUgdGhhdAo+IGlzbid0IGluaXRpYWxpemVkLgo+IAo+IFNpZ25lZC1vZmYt
Ynk6IEJyaWFuIFdvb2RzIDxicmlhbi53b29kc0B4aWxpbnguY29tPgo+IC0tLQo+IFJGQyBlc3Bl
Y2lhbGx5IG9uOgo+ICAgICAtIENoZWNrcyBmb3IgdGhlOiBhcm1fc21tdV9kdF9hZGRfZGV2aWNl
KiBhbmQgYXJtX3NtbXVfZHRfeGxhdGUqCj4gICAgICAgZnVuY3Rpb25zLgo+IAo+ICAgeGVuL2Ry
aXZlcnMvcGFzc3Rocm91Z2gvYXJtL3NtbXUuYyAgICB8IDExOCArKysrKysrKysrKysrKysrKysr
KysrKysrLS0tLS0tLS0tCj4gICB4ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9kZXZpY2VfdHJlZS5j
IHwgIDE3ICstLS0tCj4gICAyIGZpbGVzIGNoYW5nZWQsIDg3IGluc2VydGlvbnMoKyksIDQ4IGRl
bGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS94ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9hcm0v
c21tdS5jIGIveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvYXJtL3NtbXUuYwo+IGluZGV4IGM1ZGI1
YmUuLjA4Nzg3Y2QgMTAwNjQ0Cj4gLS0tIGEveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvYXJtL3Nt
bXUuYwo+ICsrKyBiL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL2FybS9zbW11LmMKPiBAQCAtMjUx
LDYgKzI1MSw4IEBAIHN0cnVjdCBpb21tdV9ncm91cAo+ICAgCWF0b21pY190IHJlZjsKPiAgIH07
Cj4gICAKPiArc3RhdGljIGNvbnN0IHN0cnVjdCBhcm1fc21tdV9kZXZpY2UgKmZpbmRfc21tdShj
b25zdCBzdHJ1Y3QgZGV2aWNlICpkZXYpOwo+ICsKPiAgIHN0YXRpYyBzdHJ1Y3QgaW9tbXVfZ3Jv
dXAgKmlvbW11X2dyb3VwX2FsbG9jKHZvaWQpCj4gICB7Cj4gICAJc3RydWN0IGlvbW11X2dyb3Vw
ICpncm91cCA9IHh6YWxsb2Moc3RydWN0IGlvbW11X2dyb3VwKTsKPiBAQCAtNzc1LDY0ICs3Nzcs
MTE0IEBAIHN0YXRpYyBpbnQgaW5zZXJ0X3NtbXVfbWFzdGVyKHN0cnVjdCBhcm1fc21tdV9kZXZp
Y2UgKnNtbXUsCj4gICAJcmV0dXJuIDA7Cj4gICB9Cj4gICAKPiAtc3RhdGljIGludCByZWdpc3Rl
cl9zbW11X21hc3RlcihzdHJ1Y3QgYXJtX3NtbXVfZGV2aWNlICpzbW11LAo+IC0JCQkJc3RydWN0
IGRldmljZSAqZGV2LAo+IC0JCQkJc3RydWN0IG9mX3BoYW5kbGVfYXJncyAqbWFzdGVyc3BlYykK
PiArLyoKPiArICogU2luY2Ugc21tdSBpc24ndCBkb25lIGluaXRpYWxpemluZyBiZWZvcmUgdGhp
cyBpcyBydW4gaW4gdGhlIGxlZ2FjeQo+ICsgKiBjYXNlLCBjcmVhdGUgYSBmdW5jdGlvbiB3aGVy
ZSB0aGF0J3MgcGFzc2VkIGFuZCB0aGVuIGhhdmUgdGhlIGdlbmVyaWMKPiArICogZnVuY3Rpb24g
anVzdCBiZSBhIHNpbXBsZSB3cmFwcGVyLgo+ICsgKi8KPiArc3RhdGljIGludCBhcm1fc21tdV9k
dF94bGF0ZV9sZWdhY3koc3RydWN0IGRldmljZSAqZGV2LAo+ICsJCQkJICAgIGNvbnN0IHN0cnVj
dCBvZl9waGFuZGxlX2FyZ3MgKnNwZWMsCj4gKwkJCQkgICAgc3RydWN0IGlvbW11X2Z3c3BlYyAq
ZndzcGVjKQo+ICt7Cj4gKwlpZiAoKHNwZWMtPmFyZ3NfY291bnQgKyBmd3NwZWMtPm51bV9pZHMp
ID4gTUFYX01BU1RFUl9TVFJFQU1JRFMpIHsKPiArCQlkZXZfZXJyKGRldiwKPiArCQkJInJlYWNo
ZWQgbWF4aW11bSBudW1iZXIgKCVkKSBvZiBzdHJlYW0gSURzIGZvciBtYXN0ZXIgZGV2aWNlICVz
XG4iLAo+ICsJCQlNQVhfTUFTVEVSX1NUUkVBTUlEUywgc3BlYy0+bnAtPm5hbWUpOwo+ICsJCXJl
dHVybiAtRU5PU1BDOwo+ICsJfQo+ICsKPiArCS8qIGFkZGluZyB0aGUgaWRzIGhlcmUgKi8KPiAr
CXJldHVybiBpb21tdV9md3NwZWNfYWRkX2lkcyhkZXYsCj4gKwkJCQkgICAgc3BlYy0+YXJncywK
PiArCQkJCSAgICBzcGVjLT5hcmdzX2NvdW50KTsKPiArfQo+ICsKPiArc3RhdGljIGludCBhcm1f
c21tdV9kdF94bGF0ZShzdHJ1Y3QgZGV2aWNlICpkZXYsCj4gKwkJCSAgICAgY29uc3Qgc3RydWN0
IGR0X3BoYW5kbGVfYXJncyAqc3BlYykKPiArewo+ICsJcmV0dXJuIGFybV9zbW11X2R0X3hsYXRl
X2xlZ2FjeShkZXYsCj4gKwkJCQkJc3BlYywKPiArCQkJCQlkZXZfaW9tbXVfZndzcGVjX2dldChk
ZXYpKTsKPiArfQoKVGhlIGxlZ2FjeSBhbmQgZ2VuZXJpYyBiaW5kaW5ncyBhcmUgZnVuZGFtZW50
YWxseSBkaWZmZXJlbnQuCgpJbiB0aGUgY2FzZSBvZiB0aGUgbGVnYWN5IGJpbmRpbmcsIGEgc3Bl
Y2lmaWVyIHdpbGwgY29udGFpbnMgbXVsdGlwbGUgCnN0cmVhbWlkcy4gQnV0IGZvciB0aGUgZ2Vu
ZXJpYyBiaW5kaW5ncywgdGhlIGludGVycHJldGF0aW9uIG9mIHRoZSAKc3BlY2lmaWVyIHdpbGwg
ZGVwZW5kIG9uIHRoZSBudW1iZXIgb2YgYXJndW1lbnRzLgoKSWYgeW91IHdhbnQgdG8gc3BlY2lm
eSBtdWx0aXBsZSBzdHJlYW1JRCwgeW91IHdvdWxkIGVpdGhlciBoYXZlIHRvIHVzZSAKb25lIHNw
ZWNpZmllciBwZXIgc3RyZWFtSUQgb3IgdXNlIHN0cmVhbSBtYXRjaGluZy4gWW91IGFsc28gaGF2
ZSBhbiAKYWRkaXRpb25hbCBwcm9wZXJ0eSB0byB0YWtlIGNhcmUgb2YgKHNlZSAic3RyZWFtLW1h
dGNoLW1hc2siKS4KClBsZWFzZSBoYXZlIGEgbG9vayBhdCB0aGUgYmluZGluZ3MgaW4gTGludXgg
KFsxXSwgWzJdKSBmb3IgbW9yZSBkZXRhaWxzLiAKSSB3b3VsZCBhbHNvIHJlY29tbWVuZCB0byBo
YXZlIGEgbG9vayBhdCB0aGUgU01NVSBkcml2ZXIgaW4gTGludXggYXMgCndlbGwgWzNdLgoKSSB3
b3VsZCBleHBlY3QgdGhpcyB0byBjaGFuZ2UgdGhlIHdheSB0aGUgcGF0Y2ggaXMgc3RydWN0dXJl
LiBTbyBJIGFtIApub3QgZ29pbmcgdG8gcmV2aWV3IHRoZSByZXN0LiBBbHRob3VnaCwgbGV0IG1l
IGtub3cgaWYgeW91IHdhbnQgbWUgdG8gCmxvb2sgYXQgYSBwYXJ0aWN1bGFyIGJpdHMuCgpDaGVl
cnMsCgoKWzFdIERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9pb21tdS9pb21tdS50
eHQKWzJdIERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9pb21tdS9hcm0sc21tdS50
eHQKWzNdIGRyaXZlcnMvaW9tbXUvYXJtLXNtbXUuYwoKLS0gCkp1bGllbiBHcmFsbAoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxp
bmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5w
cm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
