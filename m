Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BFB6549F51
	for <lists+xen-devel@lfdr.de>; Tue, 18 Jun 2019 13:38:13 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hdCOe-0002vX-Qn; Tue, 18 Jun 2019 11:35:28 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=5zPE=UR=redhat.com=philmd@srs-us1.protection.inumbo.net>)
 id 1hdCOd-0002vS-E7
 for xen-devel@lists.xenproject.org; Tue, 18 Jun 2019 11:35:27 +0000
X-Inumbo-ID: 2a04e318-91bd-11e9-b48f-2b6f2c44e9eb
Received: from mail-wr1-f66.google.com (unknown [209.85.221.66])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 2a04e318-91bd-11e9-b48f-2b6f2c44e9eb;
 Tue, 18 Jun 2019 11:35:25 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id n4so5490418wrs.3
 for <xen-devel@lists.xenproject.org>; Tue, 18 Jun 2019 04:35:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=lS6qvJvzkkQKXebfKpOZWeaymyj1AiU1S8MFIcdf/LM=;
 b=A+UIpV/0SefwqyHt4NNK9Wxvn/bmmlIoK5hOwftkbhvvkZq93VRPYtVvmj3o9pQaVm
 HcZKsdPqFPUi53e2kPdME42fJ8jDf+j6RRScYaUdBW/bXZN7jLUYxRJxxL/dj2FLHkv9
 zwDvP8NlHRAt77yc/5T5cXimFT3gn/OOoScL/ix4VO7A8xvO23dDiIJ1on2UNRyjcZBI
 hDWc26gn5Sl8UFbsutulwMnCtt6PxZsqgLLUkPUhqcibUHrHdoK4a1BJEfQPNpHxziPg
 E4LCY4IwVQt8EOA38TDD+nkDHa7zSwXM3Zpfq/6jMJa52dNgyjFc94rWfBWXVuY8Oozc
 hXng==
X-Gm-Message-State: APjAAAX2XU2XM6ZMacVgytqyuJjHr3XtbyIEFVZNQ1kJb6AUvvHfqScz
 mVqe+fbctQQKTLknEuwZhcp7cA==
X-Google-Smtp-Source: APXvYqzVRjSJpYFxNInWulZeE/TIcse4SF6qjM6N0yJVsHcC4Q0fhbVQbn15zeg8IrurLJJBdQAWNw==
X-Received: by 2002:a5d:4841:: with SMTP id n1mr23634326wrs.320.1560857724776; 
 Tue, 18 Jun 2019 04:35:24 -0700 (PDT)
Received: from [192.168.1.38] (183.red-88-21-202.staticip.rima-tde.net.
 [88.21.202.183])
 by smtp.gmail.com with ESMTPSA id a64sm2199018wmf.1.2019.06.18.04.35.23
 (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
 Tue, 18 Jun 2019 04:35:24 -0700 (PDT)
To: Anthony PERARD <anthony.perard@citrix.com>, qemu-devel@nongnu.org
References: <20190618112341.513-1-anthony.perard@citrix.com>
 <20190618112341.513-5-anthony.perard@citrix.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
 url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <47fc71d2-bb77-4744-b709-41b5d476252b@redhat.com>
Date: Tue, 18 Jun 2019 13:35:23 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190618112341.513-5-anthony.perard@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [Qemu-devel] [PATCH v2 4/4] xen: Avoid VLA
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
Cc: xen-devel@lists.xenproject.org, Paul Durrant <paul.durrant@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gNi8xOC8xOSAxOjIzIFBNLCBBbnRob255IFBFUkFSRCB3cm90ZToKPiBBdm9pZCB1c2luZyBh
IHZhcmlhYmxlIGxlbmd0aCBhcnJheS4KPiAKPiBXZSBhbGxvY2F0ZSB0aGUgYGRpcnR5X2JpdG1h
cCcgYnVmZmVyIG9ubHkgb25jZSB3aGVuIHdlIHN0YXJ0IHRyYWNraW5nCj4gZm9yIGRpcnR5IGJp
dHMuCj4gCgpTdWdnZXN0ZWQtYnk6IFBhdWwgRHVycmFudCA8UGF1bC5EdXJyYW50QGNpdHJpeC5j
b20+CgpSZXZpZXdlZC1ieTogUGhpbGlwcGUgTWF0aGlldS1EYXVkw6kgPHBoaWxtZEByZWRoYXQu
Y29tPgoKPiBTaWduZWQtb2ZmLWJ5OiBBbnRob255IFBFUkFSRCA8YW50aG9ueS5wZXJhcmRAY2l0
cml4LmNvbT4KPiAtLS0KPiAKPiBOb3RlczoKPiAgICAgdjI6Cj4gICAgIC0gQWxsb2NhdGUgdGhl
IGJpdG1hcCBidWZmZXIgb25seSBvbmNlIHdoZW4gd2Ugc3RhcnQgdHJhY2tpbmcgZGlydHkgYml0
cy4KPiAgICAgICAoaW5zdGVhZCBvZiBhdCBldmVyeSBmdW5jdGlvbiBjYWxsKQo+ICAgICAKPiAg
ICAgV2FzIHN1Z2dlc3RlZCBieSBQZXRlciBoZXJlOgo+ICAgICA8Q0FGRUFjQTg4K0Eyb0NrUW54
S0RFZHBtZkNaU21QeldNQmcwMXdERFY2OGJNWm9ZNUpnQG1haWwuZ21haWwuY29tPgo+ICAgICAi
c2hvdWxkIHdlIHRyeSB0byBzdG9wIHVzaW5nIHZhcmlhYmxlIGxlbmd0aCBhcnJheXM/Igo+IAo+
ICBody9pMzg2L3hlbi94ZW4taHZtLmMgfCAxNSArKysrKysrKysrKy0tLS0KPiAgMSBmaWxlIGNo
YW5nZWQsIDExIGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBh
L2h3L2kzODYveGVuL3hlbi1odm0uYyBiL2h3L2kzODYveGVuL3hlbi1odm0uYwo+IGluZGV4IGFl
M2RlYjRlZjMuLjQ2OWYxMjYwYTQgMTAwNjQ0Cj4gLS0tIGEvaHcvaTM4Ni94ZW4veGVuLWh2bS5j
Cj4gKysrIGIvaHcvaTM4Ni94ZW4veGVuLWh2bS5jCj4gQEAgLTExOSw2ICsxMTksOCBAQCB0eXBl
ZGVmIHN0cnVjdCBYZW5JT1N0YXRlIHsKPiAgICAgIERldmljZUxpc3RlbmVyIGRldmljZV9saXN0
ZW5lcjsKPiAgICAgIGh3YWRkciBmcmVlX3BoeXNfb2Zmc2V0Owo+ICAgICAgY29uc3QgWGVuUGh5
c21hcCAqbG9nX2Zvcl9kaXJ0eWJpdDsKPiArICAgIC8qIEJ1ZmZlciB1c2VkIGJ5IHhlbl9zeW5j
X2RpcnR5X2JpdG1hcCAqLwo+ICsgICAgdW5zaWduZWQgbG9uZyAqZGlydHlfYml0bWFwOwo+ICAK
PiAgICAgIE5vdGlmaWVyIGV4aXQ7Cj4gICAgICBOb3RpZmllciBzdXNwZW5kOwo+IEBAIC00NjQs
NiArNDY2LDggQEAgc3RhdGljIGludCB4ZW5fcmVtb3ZlX2Zyb21fcGh5c21hcChYZW5JT1N0YXRl
ICpzdGF0ZSwKPiAgICAgIFFMSVNUX1JFTU9WRShwaHlzbWFwLCBsaXN0KTsKPiAgICAgIGlmIChz
dGF0ZS0+bG9nX2Zvcl9kaXJ0eWJpdCA9PSBwaHlzbWFwKSB7Cj4gICAgICAgICAgc3RhdGUtPmxv
Z19mb3JfZGlydHliaXQgPSBOVUxMOwo+ICsgICAgICAgIGdfZnJlZShzdGF0ZS0+ZGlydHlfYml0
bWFwKTsKPiArICAgICAgICBzdGF0ZS0+ZGlydHlfYml0bWFwID0gTlVMTDsKPiAgICAgIH0KPiAg
ICAgIGdfZnJlZShwaHlzbWFwKTsKPiAgCj4gQEAgLTYxNCw3ICs2MTgsNyBAQCBzdGF0aWMgdm9p
ZCB4ZW5fc3luY19kaXJ0eV9iaXRtYXAoWGVuSU9TdGF0ZSAqc3RhdGUsCj4gIHsKPiAgICAgIGh3
YWRkciBucGFnZXMgPSBzaXplID4+IFRBUkdFVF9QQUdFX0JJVFM7Cj4gICAgICBjb25zdCBpbnQg
d2lkdGggPSBzaXplb2YodW5zaWduZWQgbG9uZykgKiA4Owo+IC0gICAgdW5zaWduZWQgbG9uZyBi
aXRtYXBbRElWX1JPVU5EX1VQKG5wYWdlcywgd2lkdGgpXTsKPiArICAgIHNpemVfdCBiaXRtYXBf
c2l6ZSA9IERJVl9ST1VORF9VUChucGFnZXMsIHdpZHRoKTsKPiAgICAgIGludCByYywgaSwgajsK
PiAgICAgIGNvbnN0IFhlblBoeXNtYXAgKnBoeXNtYXAgPSBOVUxMOwo+ICAKPiBAQCAtNjI2LDEz
ICs2MzAsMTQgQEAgc3RhdGljIHZvaWQgeGVuX3N5bmNfZGlydHlfYml0bWFwKFhlbklPU3RhdGUg
KnN0YXRlLAo+ICAKPiAgICAgIGlmIChzdGF0ZS0+bG9nX2Zvcl9kaXJ0eWJpdCA9PSBOVUxMKSB7
Cj4gICAgICAgICAgc3RhdGUtPmxvZ19mb3JfZGlydHliaXQgPSBwaHlzbWFwOwo+ICsgICAgICAg
IHN0YXRlLT5kaXJ0eV9iaXRtYXAgPSBnX25ldyh1bnNpZ25lZCBsb25nLCBiaXRtYXBfc2l6ZSk7
Cj4gICAgICB9IGVsc2UgaWYgKHN0YXRlLT5sb2dfZm9yX2RpcnR5Yml0ICE9IHBoeXNtYXApIHsK
PiAgICAgICAgICAvKiBPbmx5IG9uZSByYW5nZSBmb3IgZGlydHkgYml0bWFwIGNhbiBiZSB0cmFj
a2VkLiAqLwo+ICAgICAgICAgIHJldHVybjsKPiAgICAgIH0KPiAgCj4gICAgICByYyA9IHhlbl90
cmFja19kaXJ0eV92cmFtKHhlbl9kb21pZCwgc3RhcnRfYWRkciA+PiBUQVJHRVRfUEFHRV9CSVRT
LAo+IC0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICBucGFnZXMsIGJpdG1hcCk7Cj4gKyAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIG5wYWdlcywgc3RhdGUtPmRpcnR5X2JpdG1hcCk7
Cj4gICAgICBpZiAocmMgPCAwKSB7Cj4gICNpZm5kZWYgRU5PREFUQQo+ICAjZGVmaW5lIEVOT0RB
VEEgIEVOT0VOVAo+IEBAIC02NDYsOCArNjUxLDggQEAgc3RhdGljIHZvaWQgeGVuX3N5bmNfZGly
dHlfYml0bWFwKFhlbklPU3RhdGUgKnN0YXRlLAo+ICAgICAgICAgIHJldHVybjsKPiAgICAgIH0K
PiAgCj4gLSAgICBmb3IgKGkgPSAwOyBpIDwgQVJSQVlfU0laRShiaXRtYXApOyBpKyspIHsKPiAt
ICAgICAgICB1bnNpZ25lZCBsb25nIG1hcCA9IGJpdG1hcFtpXTsKPiArICAgIGZvciAoaSA9IDA7
IGkgPCBiaXRtYXBfc2l6ZTsgaSsrKSB7Cj4gKyAgICAgICAgdW5zaWduZWQgbG9uZyBtYXAgPSBz
dGF0ZS0+ZGlydHlfYml0bWFwW2ldOwo+ICAgICAgICAgIHdoaWxlIChtYXAgIT0gMCkgewo+ICAg
ICAgICAgICAgICBqID0gY3R6bChtYXApOwo+ICAgICAgICAgICAgICBtYXAgJj0gfigxdWwgPDwg
aik7Cj4gQEAgLTY3Nyw2ICs2ODIsOCBAQCBzdGF0aWMgdm9pZCB4ZW5fbG9nX3N0b3AoTWVtb3J5
TGlzdGVuZXIgKmxpc3RlbmVyLCBNZW1vcnlSZWdpb25TZWN0aW9uICpzZWN0aW9uLAo+ICAKPiAg
ICAgIGlmIChvbGQgJiB+bmV3ICYgKDEgPDwgRElSVFlfTUVNT1JZX1ZHQSkpIHsKPiAgICAgICAg
ICBzdGF0ZS0+bG9nX2Zvcl9kaXJ0eWJpdCA9IE5VTEw7Cj4gKyAgICAgICAgZ19mcmVlKHN0YXRl
LT5kaXJ0eV9iaXRtYXApOwo+ICsgICAgICAgIHN0YXRlLT5kaXJ0eV9iaXRtYXAgPSBOVUxMOwo+
ICAgICAgICAgIC8qIERpc2FibGUgZGlydHkgYml0IHRyYWNraW5nICovCj4gICAgICAgICAgeGVu
X3RyYWNrX2RpcnR5X3ZyYW0oeGVuX2RvbWlkLCAwLCAwLCBOVUxMKTsKPiAgICAgIH0KPiAKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBt
YWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMu
eGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
