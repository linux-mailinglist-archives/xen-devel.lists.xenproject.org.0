Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C945D13FB6D
	for <lists+xen-devel@lfdr.de>; Thu, 16 Jan 2020 22:29:04 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1isCe5-0004ZM-Ij; Thu, 16 Jan 2020 21:25:41 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=03Je=3F=gmail.com=julien.grall.oss@srs-us1.protection.inumbo.net>)
 id 1isCe3-0004ZH-U6
 for xen-devel@lists.xenproject.org; Thu, 16 Jan 2020 21:25:39 +0000
X-Inumbo-ID: bd69eabe-38a6-11ea-87da-12813bfff9fa
Received: from mail-wr1-f66.google.com (unknown [209.85.221.66])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id bd69eabe-38a6-11ea-87da-12813bfff9fa;
 Thu, 16 Jan 2020 21:25:38 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id y17so20656968wrh.5
 for <xen-devel@lists.xenproject.org>; Thu, 16 Jan 2020 13:25:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=18+Y4WQCwuMxbXqBat8+x7xtGUdEl9UafjK3VQMnNq4=;
 b=aBcWf3hBMefTtFAIptPxYZ4GVjyUCsWWMttCLh4rEKHKjfkx+U+iXfh+mVOmagKSmh
 AG0cAHzmctPi1vHmNKdAUeeB7ephxYwse2h4P9dt4ftXLoefl7tA1VLvs7fEemC9wqYl
 jn/LF0jjylIp7G82XCZpCJ2gqaK2QgTcT3iZPa3FViFsLyo17EjFjIKuK1CHzF7uM1XC
 i/PRJTlRfskayqFxCm7njDp9f8ivpfkO+1VMDf8G+WvyxMpv4ZnUb63yXmWFIezpSS1g
 VjdsoZnhcnu3dAdGxF3OaGo5VHpcMJyUhVoD4YiADcsdRnPXCCD5ydmA1FoTLI5RhVTo
 5v1w==
X-Gm-Message-State: APjAAAVuNRgioQlIMdybMkUZkrLBRZVKgbewyIOMFzSmYjqukv0U+SSC
 6ncb94XTBGh4aIJy1ReJmbs=
X-Google-Smtp-Source: APXvYqxcZfpyzjlq7/Oefekx8dyRgLnESbFYerWsDDM/LFob95Gh7Owh8AFfsAooKuaJXifBmQznfA==
X-Received: by 2002:adf:814c:: with SMTP id 70mr5334951wrm.157.1579209937759; 
 Thu, 16 Jan 2020 13:25:37 -0800 (PST)
Received: from a483e7b01a66.ant.amazon.com (54-240-197-226.amazon.com.
 [54.240.197.226])
 by smtp.gmail.com with ESMTPSA id c195sm1346592wmd.45.2020.01.16.13.25.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Jan 2020 13:25:36 -0800 (PST)
To: Jeff Kubascik <jeff.kubascik@dornerworks.com>,
 xen-devel@lists.xenproject.org
References: <20191211211302.117395-1-jeff.kubascik@dornerworks.com>
From: Julien Grall <julien@xen.org>
Message-ID: <443204d2-5766-6d36-3105-196528a4dd73@xen.org>
Date: Thu, 16 Jan 2020 21:25:35 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20191211211302.117395-1-jeff.kubascik@dornerworks.com>
Content-Language: en-GB
Subject: Re: [Xen-devel] [PATCH v3 0/2] xen/arm: physical timer improvements
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
Cc: Stewart Hildebrand <Stewart.Hildebrand@dornerworks.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgSmVmZiwKCkRvIHlvdSBwbGFuIHRvIHJlc2VuZCB0aGUgc2VyaWVzPyBJZiBub3QsIEkgYW0g
aGFwcHkgdG8gcmVzcGluIHRoZSAKc2VyaWVzIGZvciB5b3UuCgpCZXN0IHJlZ2FyZHMsCgpPbiAx
MS8xMi8yMDE5IDIxOjEzLCBKZWZmIEt1YmFzY2lrIHdyb3RlOgo+IFRoaXMgcGF0Y2ggc2V0IGlt
cHJvdmVzIHRoZSBlbXVsYXRpb24gb2YgdGhlIHBoeXNpY2FsIHRpbWVyIGJ5IHJlbW92aW5nIHRo
ZQo+IHBoeXNpY2FsIHRpbWVyIG9mZnNldCBhbmQgc2lnbiBleHRlbmQgdGhlIFRpbWVyVmFsdWUg
dG8gYmV0dGVyIG1hdGNoIHRoZQo+IGJlaGF2aW9yIGRlc2NyaWJlZCBpbiB0aGUgQVJNdjggUmVm
ZXJlbmNlIE1hbnVhbCAoQVJNIERESSAwNDg3RS5hKSwgc2VjdGlvbgo+IEQxMS4yLjQuCj4gCj4g
Q2hhbmdlcyBpbiB2MjoKPiAtIFVwZGF0ZSBjb21taXQgbWVzc2FnZSB0byBzcGVjaWZ5IHJlZmVy
ZW5jZSBtYW51YWwgdmVyc2lvbiBhbmQgc2VjdGlvbgo+IC0gQ2hhbmdlIHBoeXNpY2FsIHRpbWVy
IGN2YWwgdG8gaG9sZCBoYXJkd2FyZSB2YWx1ZQo+IC0gTWFrZSBzdXJlIHRvIHNpZ24gZXh0ZW5k
IFRpbWVyVmFsdWUgb24gd3JpdGVzLiBUaGlzIHdhcyBkb25lIGJ5IGZpcnN0Cj4gICAgY2FzdGlu
ZyB0aGUgciBwb2ludGVyIHRvIChpbnQzMl90ICopLCBkZXJlZmVyZW5jaW5nIGl0LCB0aGVuIGNh
c3RpbmcKPiAgICB0byB1aW50NjRfdC4gUGxlYXNlIGxldCBtZSBrbm93IGlmIHRoZXJlIGlzIGEg
bW9yZSBjb3JyZWN0IHdheSB0byBkbwo+ICAgIHRoaXMKPiAKPiBDaGFuZ2VzIGluIHYzOgo+IC0g
U3BsaXQgVGltZXJWYWx1ZSBzaWduIGV4dGVuc2lvbiBmaXggaW50byBzZXBhcmF0ZSBwYXRjaAo+
IC0gVXBkYXRlIGNvbW1pdCBtZXNzYWdlIHRvIG1lbnRpb24gcGh5c2ljYWwgdGltZXIgY2xlYW51
cAo+IC0gUmVtb3ZlZCBwaHlzaWNhbCB0aW1lciBjdmFsIGluaXRpYWxpemF0aW9uIGxpbmUKPiAt
IENoYW5nZWQgVGltZXJWYWx1ZSBzaWduIGV4dGVuc2lvbiB0byAodWludDY0X3QpKGludDMyX3Qp
KnIKPiAtIEFjY291bnQgZm9yIGNvbmRpdGlvbiB3aGVyZSBjdmFsIDwgYm9vdF9jb3VudAo+IAo+
IEplZmYgS3ViYXNjaWsgKDIpOgo+ICAgIHhlbi9hcm06IHJlbW92ZSBwaHlzaWNhbCB0aW1lciBv
ZmZzZXQKPiAgICB4ZW4vYXJtOiBzaWduIGV4dGVuZCB3cml0ZXMgdG8gVGltZXJWYWx1ZQo+IAo+
ICAgeGVuL2FyY2gvYXJtL3Z0aW1lci5jICAgICAgICB8IDM0ICsrKysrKysrKysrKysrKysrKy0t
LS0tLS0tLS0tLS0tLS0KPiAgIHhlbi9pbmNsdWRlL2FzbS1hcm0vZG9tYWluLmggfCAgMyAtLS0K
PiAgIDIgZmlsZXMgY2hhbmdlZCwgMTggaW5zZXJ0aW9ucygrKSwgMTkgZGVsZXRpb25zKC0pCj4g
CgotLSAKSnVsaWVuIEdyYWxsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVu
LWRldmVs
