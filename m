Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4357B141793
	for <lists+xen-devel@lfdr.de>; Sat, 18 Jan 2020 14:02:49 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1isngF-0006f7-En; Sat, 18 Jan 2020 12:58:23 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=s8pn=3H=gmail.com=julien.grall.oss@srs-us1.protection.inumbo.net>)
 id 1isngE-0006f2-AY
 for xen-devel@lists.xenproject.org; Sat, 18 Jan 2020 12:58:22 +0000
X-Inumbo-ID: 2f82d330-39f2-11ea-8e9a-bc764e2007e4
Received: from mail-wr1-f68.google.com (unknown [209.85.221.68])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2f82d330-39f2-11ea-8e9a-bc764e2007e4;
 Sat, 18 Jan 2020 12:58:13 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id q6so25086551wro.9
 for <xen-devel@lists.xenproject.org>; Sat, 18 Jan 2020 04:58:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=v12AX6z2Ylo6Pcvif0UCUFloPDPVe1/+/rEy42EklxE=;
 b=Kw8hlfy7kOLNdbivoPWPT80nHwBioaFvgNjs0RYmVxWgoUTUHPSubeW5ocoir1etmB
 T4F2A72TKIXiWtdvzFa9XRBXe3OW9ln6bhiordvDFeOyzkA3PPnxSwjTKRgh8eyygzyA
 ZpacQftrLpsULg4ekn1K+DZSK1i4F8kuwqdX0zBq8cEvQS819I/LL6fLpRFIKlp3ZpB6
 RielfTxVR0GkixVW6lEANPxZaa2A2gpN40u2yDsC0lxp2IAhTroHLmGUC7OYE9J+Y6BU
 Q2I95Vi128H64BqFX+CK2bIpWVz1j8kwxO9OmuzOxZadqJHNiqyY4RRzpuE1cHlsmZxq
 GhGg==
X-Gm-Message-State: APjAAAXFFVNd8HboT357701WZHLARi4H9Jc4mkC8pT1uTyl+QWS0sEuA
 GYsVYoBEJFqBTuG+AkuNDbs=
X-Google-Smtp-Source: APXvYqyBdTFoxCopVA3F9Rd5emLNUl1eit2MXyc+y7pTqgjCB4kOVNP/EBkM9BmTIU3G9FOBCM0qzA==
X-Received: by 2002:a5d:530e:: with SMTP id e14mr8248200wrv.250.1579352292642; 
 Sat, 18 Jan 2020 04:58:12 -0800 (PST)
Received: from a483e7b01a66.ant.amazon.com (54-240-197-231.amazon.com.
 [54.240.197.231])
 by smtp.gmail.com with ESMTPSA id v83sm14268061wmg.16.2020.01.18.04.58.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 18 Jan 2020 04:58:11 -0800 (PST)
To: Julien Grall <julien.grall@arm.com>, Artem Mygaiev <joculator@gmail.com>, 
 xen-devel@lists.xenproject.org
References: <cover.1570628924.git.artem_mygaiev@epam.com>
 <bfa088ac3fc17b90c2ba953e56294e9b26e8f5cc.1570628924.git.artem_mygaiev@epam.com>
 <b3742f94-8b53-81bd-cf60-fa41318ac21c@arm.com>
From: Julien Grall <julien@xen.org>
Message-ID: <6f83fc13-1d44-43a2-f8ce-347aac443060@xen.org>
Date: Sat, 18 Jan 2020 12:58:10 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <b3742f94-8b53-81bd-cf60-fa41318ac21c@arm.com>
Content-Language: en-GB
Subject: Re: [Xen-devel] [PATCH 2/3] Remove useless ASSERT condition
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
Cc: Artem Mygaiev <artem_mygaiev@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

CgpPbiAwOS8xMC8yMDE5IDE1OjU2LCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4gSGkgQXJ0ZW0sCgpI
aSBBcnRlbSwKCj4gT24gMDkvMTAvMjAxOSAxNToyMCwgQXJ0ZW0gTXlnYWlldiB3cm90ZToKPj4g
Y250IGlzIHVuc2lnbmVkLCBzbyBhbHdheXMgPj0wCj4+Cj4+IENvdmVyaXR5LUlEOiAxMzgxODQ4
Cj4+IFNpZ25lZC1vZmYtYnk6IEFydGVtIE15Z2FpZXYgPGFydGVtX215Z2FpZXZAZXBhbS5jb20+
Cj4gCj4gQWNrZWQtYnk6IEp1bGllbiBHcmFsbCA8anVsaWVuLmdyYWxsQGFybS5jb20+CgpJIHdh
cyBnb2luZyB0aHJvdWdoIG15IHRvZG8gbGlzdCBhbmQgbm90aWNlZCBJIGhhdmUgbmV2ZXIgY29t
bWl0dGVkIHRoaXMgCnBhdGNoLiBBcG9sb2dpZXMgZm9yIHRoYXQuCgpJIGhhdmUgY29tbWl0dGVk
IGl0IHdpdGggYSBzbGlnaHQgY2hhbmdlIGluIHRoZSBjb21taXQgdGl0bGU6CgoieGVuL2NoYXI6
IHNjaWYtdWFydDogUmVtb3ZlIHVzZWxlc3MgQVNTRVJUIGNvbmRpdGlvbiIKCkluIHRoZSBmdXR1
cmUsIHBsZWFzZSB0cnkgdG8gYWRkIHRoZSBjb21wb25lbnQgaW4gdGhlIHRpdGxlIDopLgoKQ2hl
ZXJzLAoKPiAKPj4gLS0tCj4+IMKgIHhlbi9kcml2ZXJzL2NoYXIvc2NpZi11YXJ0LmMgfCAyICst
Cj4+IMKgIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQo+Pgo+
PiBkaWZmIC0tZ2l0IGEveGVuL2RyaXZlcnMvY2hhci9zY2lmLXVhcnQuYyBiL3hlbi9kcml2ZXJz
L2NoYXIvc2NpZi11YXJ0LmMKPj4gaW5kZXggZmEwYjgyNzRjYS4uOWQzZjY2YjU1YiAxMDA2NDQK
Pj4gLS0tIGEveGVuL2RyaXZlcnMvY2hhci9zY2lmLXVhcnQuYwo+PiArKysgYi94ZW4vZHJpdmVy
cy9jaGFyL3NjaWYtdWFydC5jCj4+IEBAIC0yMDUsNyArMjA1LDcgQEAgc3RhdGljIGludCBzY2lm
X3VhcnRfdHhfcmVhZHkoc3RydWN0IHNlcmlhbF9wb3J0IAo+PiAqcG9ydCkKPj4gwqDCoMKgwqDC
oMKgIC8qIENoZWNrIG51bWJlciBvZiBkYXRhIGJ5dGVzIHN0b3JlZCBpbiBUWCBGSUZPICovCj4+
IMKgwqDCoMKgwqAgY250ID0gc2NpZl9yZWFkdyh1YXJ0LCBTQ0lGX1NDRkRSKSA+PiA4Owo+PiAt
wqDCoMKgIEFTU0VSVCggY250ID49IDAgJiYgY250IDw9IHBhcmFtcy0+Zmlmb19zaXplICk7Cj4+
ICvCoMKgwqAgQVNTRVJUKCBjbnQgPD0gcGFyYW1zLT5maWZvX3NpemUgKTsKPj4gwqDCoMKgwqDC
oCByZXR1cm4gKHBhcmFtcy0+Zmlmb19zaXplIC0gY250KTsKPj4gwqAgfQo+Pgo+IAo+IENoZWVy
cywKPiAKCi0tIApKdWxpZW4gR3JhbGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5m
by94ZW4tZGV2ZWw=
