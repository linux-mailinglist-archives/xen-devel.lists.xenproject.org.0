Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 978FC116DCF
	for <lists+xen-devel@lfdr.de>; Mon,  9 Dec 2019 14:18:00 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ieIrV-0001EP-Oj; Mon, 09 Dec 2019 13:14:05 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=zX1n=Z7=gmail.com=julien.grall.oss@srs-us1.protection.inumbo.net>)
 id 1ieIrU-0001EK-DO
 for xen-devel@lists.xenproject.org; Mon, 09 Dec 2019 13:14:04 +0000
X-Inumbo-ID: c5730df6-1a85-11ea-88e7-bc764e2007e4
Received: from mail-wr1-f54.google.com (unknown [209.85.221.54])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c5730df6-1a85-11ea-88e7-bc764e2007e4;
 Mon, 09 Dec 2019 13:14:03 +0000 (UTC)
Received: by mail-wr1-f54.google.com with SMTP id b6so16171018wrq.0
 for <xen-devel@lists.xenproject.org>; Mon, 09 Dec 2019 05:14:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:references:cc:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=TtiqVJFnADLHp2cRou0PvrRh122T9UvWda+UOLYLmVY=;
 b=q9wb0s633xExbMZMGKjiTmZ3dOwgsiJhsnwJH5avdgZHSv4pPrVML7xbZRnRgWKYBR
 XDYEtZRyIZBgNjXr6GDLzQc95k28I9493NLLT//7Mt+YSV+y1SWRinz9kOuSyXOCyFgV
 Pb3MNb9ucpnNYCa1pudQJ9VGxhu4Vw4CMQhPFCA6JZasqpPvQJyzhbAqPeozxyTid3CZ
 ZfjnSOCgL0SnCX6DdR3TUM7/U5xhta519mXN7At2nQ75W6elMyRQ30jvrkB8NDOqpqTx
 VjsPQIgr8C14nqKWK9lwv0qXZTlPszAEUV7lYViWiG2mexFrViZ7kFBrpGa0y50tBzm8
 iVMA==
X-Gm-Message-State: APjAAAUgS70GaWjl6DL5JWB2AB5zhc12rztjE/7ndbNT3rO4pxAoYRBE
 lsGLrEm/chZ8FiU93ueAjVhtxgQjzaQ=
X-Google-Smtp-Source: APXvYqziWWBQbwnBnWOa2wKQKmLL1igal6c6WzFB8of69Gl8tZeb49k0HlOIDz/FBFBDeKKsjWseSQ==
X-Received: by 2002:adf:f504:: with SMTP id q4mr1921227wro.299.1575897242588; 
 Mon, 09 Dec 2019 05:14:02 -0800 (PST)
Received: from a483e7b01a66.ant.amazon.com (54-240-197-234.amazon.com.
 [54.240.197.234])
 by smtp.gmail.com with ESMTPSA id o15sm28764377wra.83.2019.12.09.05.14.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Dec 2019 05:14:02 -0800 (PST)
From: Julien Grall <julien@xen.org>
To: Jan Beulich <jbeulich@suse.com>,
 "George.Dunlap@eu.citrix.com" <George.Dunlap@eu.citrix.com>,
 "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, "wl@xen.org" <wl@xen.org>,
 Ian Jackson <ian.jackson@citrix.com>
References: <7a5c3e88-4ec4-422e-f52b-1e8c319e2a00@xen.org>
Message-ID: <3d6bd964-e37d-cbae-181a-0f03bc361203@xen.org>
Date: Mon, 9 Dec 2019 13:14:01 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.3.0
MIME-Version: 1.0
In-Reply-To: <7a5c3e88-4ec4-422e-f52b-1e8c319e2a00@xen.org>
Content-Language: en-GB
Subject: Re: [Xen-devel] XSA-255 and Arm
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

U29ycnkgSSBmb3Jnb3QgdG8gQ0MgeGVuLWRldmVsLgoKT24gMDkvMTIvMjAxOSAxMzoxMywgSnVs
aWVuIEdyYWxsIHdyb3RlOgo+IEhpIGFsbCwKPiAKPiBJIHdhcyBsb29raW5nIGF0IHRoZSBHcmFu
dCBUYWJsZSBjb2RlIG92ZXIgdGhlIHdlZWstZW5kIGFuZCBub3RpY2VkIAo+IHRoYXJ0IFhTQS0y
NTUgWzFdIGludHJvZHVjZWQgc29tZSB1bmludGVuZGVkIGNvbnNlcXVlbmNlcyBvbiBBcm0uCj4g
Cj4gU2luY2UgdGhlIFhTQSwgZ250dGFiX21hcF9mcmFtZSgpIHdpbGwgcmVtb3ZlIHRoZSBwcmV2
aW91cyBtYXBwaW5nIChpZiAKPiBhbnkpIGJlY2F1c2UgbWFwcGluZyB0byB0aGUgbmV3IEdGTi4K
PiAKPiBBcyBvbiBBcm0gd2UgZG9uJ3QgaGF2ZSBhbiBNMlAsIHRoZSBHRk4gaXMgc3RvcmVkIHBl
ciBmcmFtZSBpbiB0aGUgCj4gZ3JhbnQtdGFibGUgY29kZS4gVGhpcyB3aWxsIG5ldmVyIGdldCBj
bGVhcmVkIGR1cmluZyB1bm1hcHBpbmcgKGUuZy4gCj4gWEVOTUVNX3JlbW92ZV9mcm9tX3BoeXNt
YXApIGFuZCB0aGVyZWZvcmUgd2UgbWF5IGVuZCB1cCB0byByZW1vdmUgYSAKPiBtYXBwaW5nIGZy
b20gc29tZW9uZSBkaWZmZXJlbnQgKEFybSBkb2VzIG5vdCBjaGVjayB0aGUgTUZOIGlzIHRoZSAK
PiBjb3JyZWN0IG9uZSBiZWZvcmUgcmVtb3ZpbmcgbWFwcGluZykuCj4gCj4gVGhpcyB3b3JrcyB3
ZWxsIG9uIHg4NiBiZWNhdXNlIHRoZSB0cmFuc2xhdGlvbiBNRk4gdG8gR0ZOIGlzIHVzaW5nIHRo
ZSAKPiBNMlAuIFRoZXJlZm9yZSwgdGhlIHRyYW5zbGF0aW9uIHdpbGwgYmUgaW5kaXJlY3RseSBj
bGVhcmVkIHdoZW4gdGhlIAo+IG1hcHBpbmcgaXMgcmVtb3ZlZCB2aWEgWEVOTUVNX3JlbW92ZV9m
cm9tX3BoeXNtYXAuCj4gCj4gSSBjb3VsZCBmaXggdGhlIFAyTSBjb2RlIHRvIGNoZWNrIHRoZSBN
Rk4gb24gcmVtb3ZhbCwgYnV0IHRoaXMgaXMgb25seSAKPiBmaXhpbmcgb24gcGFydCBvZiB0aGUg
cHJvYmxlbS4gRm9yIGluc3RhbmNlLCAKPiBnbnR0YWJfdW5wb3B1bGF0ZV9zdGF0dXNfZnJhbWUo
KSBpcyBhbHNvIGNoZWNrIHdoZXRoZXIgdGhlIEdGTiBpcyBzdGlsbCAKPiB2YWxpZCBmb3IgZWFj
aCBtYXBwaW5nLgo+IAo+IFdpdGhvdXQgdGhlIE0yUCwgSSBjYW4gb25seSBzZWUgb25lIHNvbHV0
aW9uLiBXZSB3b3VsZCBuZWVkIHRvIGNoZWNrIAo+IHdoZXRoZXIgdGhlIEdGTiBjb3JyZXNwb25k
IHRvIGEgZ3JhbnQgZnJhbWUgYW5kIHVwZGF0ZSB0aGUgYXJyYXkgb24gCj4gcmVtb3ZhbC4gVGhp
cyBvYnZpb3VzbHkgcmVxdWlyZXMgdG8gbG9vcCB0aHJvdWdoIGFuIGFycmF5IHdoaWNoIGlzIG5v
dCAKPiB2ZXJ5IGdyZWF0Lgo+IAo+IEFueSBvdGhlciBpZGVhcz8KPiAKPiBDaGVlcnMsCj4gCj4g
WzFdIGdyYW50IHRhYmxlIHYyIC0+IHYxIHRyYW5zaXRpb24gbWF5IGNyYXNoIFhlbgo+IAoKLS0g
Ckp1bGllbiBHcmFsbAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5v
cmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZl
bA==
