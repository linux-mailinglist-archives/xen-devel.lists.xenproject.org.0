Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0984612BCFE
	for <lists+xen-devel@lfdr.de>; Sat, 28 Dec 2019 09:14:55 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1il7Al-0000Yp-02; Sat, 28 Dec 2019 08:10:07 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=e3Ei=2S=gmail.com=julien.grall.oss@srs-us1.protection.inumbo.net>)
 id 1il7Ak-0000SB-08
 for xen-devel@lists.xenproject.org; Sat, 28 Dec 2019 08:10:06 +0000
X-Inumbo-ID: 6fd70f1e-2949-11ea-88e7-bc764e2007e4
Received: from mail-qt1-f196.google.com (unknown [209.85.160.196])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6fd70f1e-2949-11ea-88e7-bc764e2007e4;
 Sat, 28 Dec 2019 08:09:57 +0000 (UTC)
Received: by mail-qt1-f196.google.com with SMTP id l12so26137959qtq.12
 for <xen-devel@lists.xenproject.org>; Sat, 28 Dec 2019 00:09:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=oAnvz1FxNZLxBzdVU03uRuo8LW3Jiw/hTYIT/GcK3FI=;
 b=HNnVtiqsTcdmJ3z9YdBR1aGdcUl4+W4FMqknAAHC9ALS0CiT+I3d9LG8W1M/yMv0IY
 5a5CxCb/j4zaa4fl50hBKDp8wroaYNwhEltLwuxBMfYAkuZ7sfhiGwyBm8dpCKDtu59a
 hvypAgEkgHkGMBweRzJ6Bi4QUZT/kP7XsZv3hrgC9vpjaL8RhpgYQpqW2DZjzzzZPQz1
 p3vT4mvwESgG6FNm3LflktMEipKHSMYDWltKsEs4NhMPGdcinfC332XNGQ0qqsCGTYat
 wsQlBKjVropx1rQO03Sbptz+JTYD4TiaDHBvVXHj1zxCRmxGa3yNJoN0X69bZHqIuYPs
 6UHg==
X-Gm-Message-State: APjAAAWxTRyzpvN/cefq5NsWFa1Z7+NCSlpzp4F58IetyJ6TVM60KytU
 VX+8dCx1x3lR4qaRQcthX/w=
X-Google-Smtp-Source: APXvYqz8aGUHu006PlE8RkWriak/O7fbW+Bz5Yy1jtgzS9GZ5uQ7BmwCzr9YcUxDbHf42GpRstNTWQ==
X-Received: by 2002:ac8:2bb9:: with SMTP id m54mr4915951qtm.150.1577520597062; 
 Sat, 28 Dec 2019 00:09:57 -0800 (PST)
Received: from a483e7b01a66.ant.amazon.com ([54.239.6.177])
 by smtp.gmail.com with ESMTPSA id m27sm11562977qta.21.2019.12.28.00.09.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 28 Dec 2019 00:09:56 -0800 (PST)
To: Wei Xu <xuwei5@hisilicon.com>, Stefano Stabellini
 <sstabellini@kernel.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 xen-devel@lists.xenproject.org
References: <1577498922-192711-1-git-send-email-xuwei5@hisilicon.com>
From: Julien Grall <julien@xen.org>
Message-ID: <e96ddb84-db96-5316-05a7-632fed7dddb8@xen.org>
Date: Sat, 28 Dec 2019 09:09:52 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.3.1
MIME-Version: 1.0
In-Reply-To: <1577498922-192711-1-git-send-email-xuwei5@hisilicon.com>
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
Cc: prime.zeng@hisilicon.com, shameerali.kolothum.thodi@huawei.com,
 linuxarm@huawei.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGksCgpPbiAyOC8xMi8yMDE5IDAzOjA4LCBXZWkgWHUgd3JvdGU6Cj4gVGhpcyBwYXRjaCBmaXhl
cyB0aGUgdHlwbyBhYm91dCB0aGUgYWN0aXZlIHN0YXR1cyByYW5nZSBvZiBhbiBJUlEKPiB2aWEg
R0lDRC4gT3RoZXJ3aXNlIGl0IHdpbGwgYmUgZmFpbGVkIHRvIGhhbmRsZSB0aGUgbW1pbyBhY2Nl
c3MgYW5kCj4gaW5qZWN0IGEgZGF0YSBhYm9ydC4KSSBoYXZlIHNlZW4gYSBwYXRjaCBzaW1pbGFy
IGZyb20gTlhQIGEgbW9udGggYWdvIGFuZCBJIGRpc2FncmVlZCBvbiB0aGUgCmFwcHJvYWNoLgoK
SWYgeW91IGxvb2sgYXQgdGhlIGNvbnRleHQgeW91IG1vZGlmZWQsIGl0IHNheXMgdGhhdCByZWFk
aW5nIEFDVElWRVIgaXMgCm5vdCBzdXBwb3J0ZWQuIFdoaWxlIEkgYWdyZWUgdGhlIGJlaGF2aW9y
IGlzIG5vdCBjb25zaXN0ZW50IGFjY3Jvc3MgCkFDVElWRVIsIGluamVjdGluZyBhIGRhdGEgYWJv
cnQgaXMgYSBwZXJmZWN0bHkgZmluZSBiZWhhdmlvciB0byBtZSAKKHRob3VnaCBub3Qgc3BlYyBj
b21wbGlhbnQpIGFzIHdlIGRvbid0IGltcGxlbWVudCB0aGUgcmVnaXN0ZXJzIGNvcnJlY3RseS4K
CkkgZ3Vlc3MgeW91IGFyZSBzZW5kaW5nIHRoaXMgcGF0Y2gsIGJlY2F1c2UgeW91IHRyaWVkIExp
bnV4IDUuNCAob3IgCmxhdGVyKSBvbiBYZW4sIHJpZ2h0PyBMaW51eCBoYXMgcmVjZW50bHkgYmVn
YW4gdG8gcmVhZCBBQ1RJVkVSIHRvIGNoZWNrIAp3aGV0aGVyIGFuIElSUSBpcyBhY3RpdmUgYXQg
dGhlIEhXIGxldmVsIGR1cmluZyB0aGUgc3luY2hyb25pemluZyBvZiB0aGUgCklSUVMuIEZyb20g
bXkgdW5kZXJzdGFuZGluZywgdGhpcyBpcyB1c2VkIGJlY2F1c2UgdGhlcmUgaXMgYSB3aW5kb3cg
CndoZXJlIHRoZSBpbnRlcnJ1cHQgaXMgYWN0aXZlIGF0IHRoZSBIVyBsZXZlbCBidXQgdGhlIExp
bnV4IElSUSAKc3Vic3lzdGVtIGlzIG5vdCBhd2FyZSBvZiBpdC4KCldoaWxlIHRoZSBwYXRjaCBi
ZWxvdyB3aWxsIGFsbG93IExpbnV4IDUuNCB0byBub3QgY3Jhc2gsIGl0IGlzIG5vdCBnb2luZyAK
dG8gbWFrZSBpdCBmbHkgdmVyeSBmYXIgYmVjYXVzZSBvZiB0aGUgYWJvdmUuIFNvIEkgYW0gcmF0
aGVyIG5vdCBoYXBweSAKd2l0aCBwZXJzdWluZyB3aXRoIHJldHVybmluZyAwLgoKQFN0ZWZhbm8s
IHlvdSBtZW50aW9uIHlvdSB3aWxsIGxvb2sgYXQgaW1wbGVtZW50aW5nIEFDVElWRVIuIFdoYXQn
cyB0aGUgCnN0YXRlPwoKID4KPiBGaXhlczogYTJiODNmOTViZmFkICgieGVuL2FybTogdmdpYzog
UHJvcGVybHkgZW11bGF0ZSB0aGUgZnVsbCByZWdpc3RlciIpCj4gCj4gU2lnbmVkLW9mZi1ieTog
V2VpIFh1IDx4dXdlaTVAaGlzaWxpY29uLmNvbT4KPiAtLS0KPiAgIHhlbi9hcmNoL2FybS92Z2lj
LXYzLmMgfCAyICstCj4gICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRp
b24oLSkKPiAKPiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gvYXJtL3ZnaWMtdjMuYyBiL3hlbi9hcmNo
L2FybS92Z2ljLXYzLmMKPiBpbmRleCA0MjJiOTRmLi5lODAyZjIwIDEwMDY0NAo+IC0tLSBhL3hl
bi9hcmNoL2FybS92Z2ljLXYzLmMKPiArKysgYi94ZW4vYXJjaC9hcm0vdmdpYy12My5jCj4gQEAg
LTcwNiw3ICs3MDYsNyBAQCBzdGF0aWMgaW50IF9fdmdpY192M19kaXN0cl9jb21tb25fbW1pb19y
ZWFkKGNvbnN0IGNoYXIgKm5hbWUsIHN0cnVjdCB2Y3B1ICp2LAo+ICAgICAgICAgICBnb3RvIHJl
YWRfYXNfemVybzsKPiAgIAo+ICAgICAgIC8qIFJlYWQgdGhlIGFjdGl2ZSBzdGF0dXMgb2YgYW4g
SVJRIHZpYSBHSUNEL0dJQ1IgaXMgbm90IHN1cHBvcnRlZCAqLwo+IC0gICAgY2FzZSBWUkFOR0Uz
MihHSUNEX0lTQUNUSVZFUiwgR0lDRF9JU0FDVElWRVIpOgo+ICsgICAgY2FzZSBWUkFOR0UzMihH
SUNEX0lTQUNUSVZFUiwgR0lDRF9JU0FDVElWRVJOKToKPiAgICAgICBjYXNlIFZSQU5HRTMyKEdJ
Q0RfSUNBQ1RJVkVSLCBHSUNEX0lDQUNUSVZFUk4pOgo+ICAgICAgICAgICBnb3RvIHJlYWRfYXNf
emVybzsKPiAgIAo+IAoKQ2hlZXJzLAoKLS0gCkp1bGllbiBHcmFsbAoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApY
ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
