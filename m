Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FD6B183A81
	for <lists+xen-devel@lfdr.de>; Thu, 12 Mar 2020 21:20:01 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jCUHN-0007xr-Ee; Thu, 12 Mar 2020 20:18:05 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=xLcY=45=gmail.com=julien.grall.oss@srs-us1.protection.inumbo.net>)
 id 1jCUHL-0007xh-KQ
 for xen-devel@lists.xenproject.org; Thu, 12 Mar 2020 20:18:03 +0000
X-Inumbo-ID: 92f7999c-649e-11ea-b21d-12813bfff9fa
Received: from mail-ed1-f65.google.com (unknown [209.85.208.65])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 92f7999c-649e-11ea-b21d-12813bfff9fa;
 Thu, 12 Mar 2020 20:18:02 +0000 (UTC)
Received: by mail-ed1-f65.google.com with SMTP id dc19so9092493edb.10
 for <xen-devel@lists.xenproject.org>; Thu, 12 Mar 2020 13:18:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=hLrmv5Qw0HSg4e8myX/Fh/ppLMD8fHptkhUHqW/+ZX4=;
 b=jUxqeHf4WqKgAjDyr5BBNg7ph6PBQ+MbNPvyx2igA7mw8EIase4H9LhB8SZv7sfakN
 4HkTGajxQXG3+H2WAPVzRfVEQCyWZ4hbwjAgkOvLh9TX+ZaS6RKg6uQBYjM+Z+Qc6A93
 o9vacluS6iKUb7L7iubpjAXqoLcef8JO41sTELhOzON+iEDs6dTC7PN1XFWNhVElaWKF
 MXmO7WOWfTJLWD04pT5WgXFDy0CAEI3cmboUucWio6Nx9DRhlRxnghuux6PALc0sOIVa
 JFZWjPIEc9QNVWrpkRrJPFewDTDfv6ejqFatOo7zsw3Py1rt7Nc0ZQOp1KaIJaWsk4bR
 V4tw==
X-Gm-Message-State: ANhLgQ1aB0r8G3LL92wIEQHZLujJfHz/a2M2NbVE4GiTkxapBQ+7Xfjl
 QU9DEPaKNU8FmjLXv9sdeTM=
X-Google-Smtp-Source: ADFU+vt5krnTqtOmoklGIy70Umg3XFWkJfbh+T8GfGUWx+mFO06JDX5AgK+mAPQPSTo1AIPIvf4lmw==
X-Received: by 2002:a17:906:76c6:: with SMTP id
 q6mr8282463ejn.176.1584044281777; 
 Thu, 12 Mar 2020 13:18:01 -0700 (PDT)
Received: from a483e7b01a66.ant.amazon.com (54-240-197-227.amazon.com.
 [54.240.197.227])
 by smtp.gmail.com with ESMTPSA id w12sm754249edx.17.2020.03.12.13.18.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Mar 2020 13:18:01 -0700 (PDT)
To: Anthony PERARD <anthony.perard@citrix.com>
References: <20200309174505.594607-1-anthony.perard@citrix.com>
 <20200309174505.594607-2-anthony.perard@citrix.com>
 <4f26f2b9-b011-9533-60ce-05dd6c101827@xen.org>
 <20200311144631.GI2152@perard.uk.xensource.com>
From: Julien Grall <julien@xen.org>
Message-ID: <ce6e22a2-e9a5-8cf7-b91a-3bd1efe33859@xen.org>
Date: Thu, 12 Mar 2020 20:18:00 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200311144631.GI2152@perard.uk.xensource.com>
Content-Language: en-GB
Subject: Re: [Xen-devel] [XEN PATCH v3 1/2] xen/arm: Rename all early printk
 macro
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
Cc: xen-devel@lists.xenproject.org, Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGksCgpPbiAxMS8wMy8yMDIwIDE0OjQ2LCBBbnRob255IFBFUkFSRCB3cm90ZToKPiBPbiBXZWQs
IE1hciAxMSwgMjAyMCBhdCAwMTo1NzozN1BNICswMDAwLCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4+
IEhpIEFudGhvbnksCj4+Cj4+IE9uIDA5LzAzLzIwMjAgMTc6NDUsIEFudGhvbnkgUEVSQVJEIHdy
b3RlOgo+Pj4gZGlmZiAtLWdpdCBhL3hlbi9hcmNoL2FybS9hcm0zMi9oZWFkLlMgYi94ZW4vYXJj
aC9hcm0vYXJtMzIvaGVhZC5TCj4+PiBpbmRleCBlOWQzNTZmMDVjMmIuLjJiNTkzYzVlZjk5YSAx
MDA2NDQKPj4+IC0tLSBhL3hlbi9hcmNoL2FybS9hcm0zMi9oZWFkLlMKPj4+ICsrKyBiL3hlbi9h
cmNoL2FybS9hcm0zMi9oZWFkLlMKPj4+IEBAIC0zNiw4ICszNiw4IEBACj4+PiAgICAjZGVmaW5l
IFhFTl9GSVJTVF9TTE9UICAgICAgZmlyc3RfdGFibGVfb2Zmc2V0KFhFTl9WSVJUX1NUQVJUKQo+
Pj4gICAgI2RlZmluZSBYRU5fU0VDT05EX1NMT1QgICAgIHNlY29uZF90YWJsZV9vZmZzZXQoWEVO
X1ZJUlRfU1RBUlQpCj4+PiAtI2lmIChkZWZpbmVkIChDT05GSUdfRUFSTFlfUFJJTlRLKSkgJiYg
KGRlZmluZWQgKEVBUkxZX1BSSU5US19JTkMpKQo+Pj4gLSNpbmNsdWRlIEVBUkxZX1BSSU5US19J
TkMKPj4+ICsjaWYgKGRlZmluZWQgKENPTkZJR19FQVJMWV9QUklOVEspKSAmJiAoZGVmaW5lZCAo
Q09ORklHX0VBUkxZX1BSSU5US19JTkMpKQo+Pgo+PiBOSVQ6IEkgd291bGQgYWxzbyB0YWtlIHRo
ZSBvcHBvcnR1bml0eSB0byBjbGVhbi11cCB0aGUgbGluZSBieSByZW1vdmUgdGhlCj4+IGV4dHJh
ICgpIGFuZCB0aGUgc3BhY2UgYmVmb3JlICguIFNvbWV0aGluZyBsaWtlOgo+Pgo+PiAjaWYgZGVm
aW5lKENPTkZJR19FQVJMWV9QUklOVEspICYmIGRlZmluZWQoQ09ORklHX0VBUkxZX1BSSU5US19J
TkMpCj4+Cj4+IFsuLi5dCj4+Cj4+PiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gvYXJtL2FybTY0L2hl
YWQuUyBiL3hlbi9hcmNoL2FybS9hcm02NC9oZWFkLlMKPj4+IGluZGV4IGU1MDE1ZjkzYTJkOC4u
NGQ0NWVhM2RhYzNjIDEwMDY0NAo+Pj4gLS0tIGEveGVuL2FyY2gvYXJtL2FybTY0L2hlYWQuUwo+
Pj4gKysrIGIveGVuL2FyY2gvYXJtL2FybTY0L2hlYWQuUwo+Pj4gQEAgLTQ1LDggKzQ1LDggQEAK
Pj4+ICAgICNkZWZpbmUgX19IRUFEX0ZMQUdTICAgICAgICAgICAgKChfX0hFQURfRkxBR19QQUdF
X1NJWkUgPDwgMSkgfCBcCj4+PiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAo
X19IRUFEX0ZMQUdfUEhZU19CQVNFIDw8IDMpKQo+Pj4gLSNpZiAoZGVmaW5lZCAoQ09ORklHX0VB
UkxZX1BSSU5USykpICYmIChkZWZpbmVkIChFQVJMWV9QUklOVEtfSU5DKSkKPj4+IC0jaW5jbHVk
ZSBFQVJMWV9QUklOVEtfSU5DCj4+PiArI2lmIChkZWZpbmVkIChDT05GSUdfRUFSTFlfUFJJTlRL
KSkgJiYgKGRlZmluZWQgKENPTkZJR19FQVJMWV9QUklOVEtfSU5DKSkKPj4KPj4gU2FtZSBoZXJl
Lgo+IAo+IFRob3NlIGNsZWFuLXVwIHNvdW5kcyBnb29kLgoKSSB3aWxsIGdpdmUgYSBjb3VwbGUg
b2YgZGF5cyBzbyBTdGVmYW5vIGNhbiBoYXZlIGFuIG9wcG9ydHVuaXR5IHRvIApjb21tZW50LiBJ
ZiBJIGRvbid0IGhlYXIgYW55dGhpbmcgYnkgTW9uZGF5LCBJIHdpbGwgY29tbWl0IGl0LgoKPiAK
Pj4gSSBhbSBoYXBweSB0byBmaXggYm90aCBjYXNlcyBvbiBjb21taXQ6Cj4+Cj4+IEFja2VkLWJ5
OiBKdWxpZW4gR3JhbGwgPGpncmFsbEBhbWF6b24uY29tPgo+IAo+IFRoYW5rcywKPiAKCkNoZWVy
cywKCi0tIApKdWxpZW4gR3JhbGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94
ZW4tZGV2ZWw=
