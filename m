Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EC7391155F7
	for <lists+xen-devel@lfdr.de>; Fri,  6 Dec 2019 17:58:18 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1idGt1-0005WI-ML; Fri, 06 Dec 2019 16:55:23 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=y5Gr=Z4=gmail.com=julien.grall.oss@srs-us1.protection.inumbo.net>)
 id 1idGsz-0005W6-Nh
 for xen-devel@lists.xen.org; Fri, 06 Dec 2019 16:55:21 +0000
X-Inumbo-ID: 2fde14c2-1849-11ea-b6f1-bc764e2007e4
Received: from mail-wr1-f48.google.com (unknown [209.85.221.48])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2fde14c2-1849-11ea-b6f1-bc764e2007e4;
 Fri, 06 Dec 2019 16:55:20 +0000 (UTC)
Received: by mail-wr1-f48.google.com with SMTP id g17so8563548wro.2
 for <xen-devel@lists.xen.org>; Fri, 06 Dec 2019 08:55:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=7HwxaX/9hmnJ+Vpk2YvvFnJ8nmKQYPKpHzjUDJOGowY=;
 b=Yw+TOKb2FLPvan3AJVfajhpeP3m/UwqQq7n+H3lxYOmxPsZpjQOE7crUdqOlvCOAxx
 9pHFygeEfVOE2md5U3rt7e44PsaafjnXCoNHSHsYKqJvbx+Q7SKO65Zz/W49kGt2kzbb
 fyKNez+pbLMwSAtjp3KNqLHQdRpgJPHibEJveDO3DFdyP5PWYPrHJEmTvQ+bYlPcqQbL
 fh35ac2QybwVcRQ/PnVDO0oejUzfuzIJkoduYzYA3bHk17TmX3oJSDWjk7iphvjiQQJW
 E66X/OswvIvRt4EPY5ZL8jCB/Jb5Fw7zPSCd5fwQRvuPKJNL7Fr+nTrnOMk+ZCEhtyq2
 q2/w==
X-Gm-Message-State: APjAAAVgz/7+Olk5AzP8QAwrIJgywlD9uN3hmUE7oL+QUcT7Q+6R+jJ9
 a4AbmRsD6wF55krB4nkHkUC6KhthWnU=
X-Google-Smtp-Source: APXvYqxsQRetRBQ1hS4UezsN19Lg7gGQnnWTn7F08MzJPuLWjT4c715zqJUiH78nanjyOuey0Lw1wQ==
X-Received: by 2002:a05:6000:367:: with SMTP id
 f7mr16381578wrf.174.1575651319592; 
 Fri, 06 Dec 2019 08:55:19 -0800 (PST)
Received: from a483e7b01a66.ant.amazon.com (54-240-197-234.amazon.com.
 [54.240.197.234])
 by smtp.gmail.com with ESMTPSA id z64sm4210285wmg.30.2019.12.06.08.55.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 06 Dec 2019 08:55:18 -0800 (PST)
To: Ian Jackson <ian.jackson@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <24042.34323.159917.173963@mariner.uk.xensource.com>
From: Julien Grall <julien@xen.org>
Message-ID: <b199414b-dbe6-2d0d-bd97-e5bafb402c47@xen.org>
Date: Fri, 6 Dec 2019 16:55:18 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <24042.34323.159917.173963@mariner.uk.xensource.com>
Content-Language: en-GB
Subject: Re: [Xen-devel] Problem booting Debian buster on arndale
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
Cc: xen-devel@lists.xen.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgSWFuLAoKT24gMDYvMTIvMjAxOSAxNjo0NywgSWFuIEphY2tzb24gd3JvdGU6Cj4gSGkuICBB
cyB5b3Uga25vdyBJIGFtIHdvcmtpbmcgb24gZ2V0dGluZyBvc3N0ZXN0IHRvIHdvcmsgd2l0aCBE
ZWJpYW4KPiBidXN0ZXIuICBUaGlzIGlzIGltcG9ydGFudCBiZWNhdXNlIERlYmlhbidzIHN1cHBv
cnQgZm9yIG9sZHN0YWJsZQo+ICh3aGljaCBpcyB3aGF0IHN0cmV0Y2ggaXMgbm93KSBpcyBub3Qg
YWx3YXlzIHZlcnkgZ29vZC4gIFJlbHlpbmcgb24KPiB0aGUgTFRTIGNhdXNlZCB1cyBzZXJpb3Vz
IHByb2JsZW1zIGJlZm9yZS4KPiAKPiBPbmUgb2YgdGhlIGlzc3VlcyBJIGVuY291bnRlcmVkIGlz
IHRoYXQgdGhlIFhlbiBhbmQgTGludXggdGhhdCBvc3N0ZXN0Cj4gYnVpbHQsIGRpZCBub3QgYm9v
dCBvbiBhcm5kYWxlOgo+ICAgIGh0dHA6Ly9sb2dzLnRlc3QtbGFiLnhlbnByb2plY3Qub3JnL29z
c3Rlc3QvbG9ncy8xNDQzMTIvdGVzdC1hcm1oZi1hcm1oZi14bC1hcm5kYWxlL2luZm8uaHRtbAo+
IAo+IEl0IHdvcmtzIG9uIGN1YmlldHJ1Y2s6Cj4gICAgaHR0cDovL2xvZ3MudGVzdC1sYWIueGVu
cHJvamVjdC5vcmcvb3NzdGVzdC9sb2dzLzE0NDMxMi90ZXN0LWFybWhmLWFybWhmLXhsLWN1Ymll
dHJ1Y2svaW5mby5odG1sCj4gKFBsZWFzZSBkaXNyZWdhcmQgdGhlIGd1ZXN0LXN0YXJ0IGZhaWx1
cmU7IEkgdGhpbmsgdGhhdCdzIHNvbWV0aGluZwo+IGVsc2UsIGFuZCBhcmNoaXRlY3R1cmUtaW5k
ZXBlbmRlbnQuKQo+IAo+IEl0IHNlZW1zIHRvIGhhdmUgaHVuZyBkdXJpbmcgYm9vdC4gIE5CIHRo
YXQgSSBkb24ndCBrbm93IHdoZXRoZXIgdGhpcwo+IGlzIGEgb25lLW9mZi4KCkxvb2tpbmcgYXQg
WzFdLCBtb3N0IG9mIHRoZSByZWNlbnQgZmxpZ2h0IGhhdmUgbWFuYWdlZCB0byBib290IFhlbiBv
biAKdGhlIGFybmRhbGUuIEhvd2V2ZXIsIEkgc29tZWhvdyBjYW4ndCBmaW5kIHRoZSBmbGlnaHQg
MTQ0MzEyIGluIHRoYXQgCmxpc3QuIERvIHlvdSBoYXZlIGFueSBpZGVhIHdoeT8KCj4gCj4gSSB3
b3VsZCBhcHByZWNpYXRlIGl0IGlmIHNvbWVvbmUgZnJvbSB0aGUgQVJNIGNvbW11bml0eSBjb3Vs
ZCB0YWtlIGEKPiBsb29rLiAgSWYgeW91IHdvdWxkIGxpa2UgbWUgdG8gc2V0IHVwIGEgcmVwcm8g
SSBvbiBvbmUgb2Ygb3VyIGFybmRhbGVzCj4gY2FuIGRvIHRoYXQgZm9yIHlvdS4gIEkgaGF2ZW4n
dCBkb25lIHRoYXQgeWV0IGJlY2F1c2UgaXQgYm9va3MgdGhlCj4gbWFjaGluZSBvdXQgc28gSSB3
YW50IHRvIGRvIGl0IHdoZW4geW91IHNheSB5b3UncmUgcmVhZCBmb3IgaXQuLi4KClRoaXMgc2Vl
bXMgdG8gYmUgYSBvbmUtb2ZmLCBzbyBJIHdvdWxkIHdhaXQgdG8gc2VlIGlmIGl0IGhhcHBlbnMg
YWdhaW4gCmJlZm9yZSBzZXR0aW5nIHVwIGEgcmVwcm8uIEkgd2lsbCBrZWVwIGFuIGV5ZSBvbiBv
c3N0ZXN0IHJlc3VsdC4KCk1lYW53aGlsZSwgY291bGQgeW91IHRyeSBhIG1vcmUgcmVjZW50IGZs
aWdodD8KCkNoZWVycywKClsxXSAKaHR0cDovL2xvZ3MudGVzdC1sYWIueGVucHJvamVjdC5vcmcv
b3NzdGVzdC9yZXN1bHRzL2hpc3RvcnkvdGVzdC1hcm1oZi1hcm1oZi14bC1hcm5kYWxlL3hlbi11
bnN0YWJsZS5odG1sCgotLSAKSnVsaWVuIEdyYWxsCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8veGVuLWRldmVs
