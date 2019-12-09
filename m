Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 03185116B26
	for <lists+xen-devel@lfdr.de>; Mon,  9 Dec 2019 11:35:56 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ieGLz-00018X-VK; Mon, 09 Dec 2019 10:33:23 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=zX1n=Z7=gmail.com=julien.grall.oss@srs-us1.protection.inumbo.net>)
 id 1ieGLy-00018R-LA
 for xen-devel@lists.xen.org; Mon, 09 Dec 2019 10:33:22 +0000
X-Inumbo-ID: 510bdcee-1a6f-11ea-87bb-12813bfff9fa
Received: from mail-wr1-f68.google.com (unknown [209.85.221.68])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 510bdcee-1a6f-11ea-87bb-12813bfff9fa;
 Mon, 09 Dec 2019 10:33:21 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id b6so15607077wrq.0
 for <xen-devel@lists.xen.org>; Mon, 09 Dec 2019 02:33:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=FOx+h6HhMq0rQiuPFPDdc/4mQmdNjb4bGQYyq7h8eZA=;
 b=WIITlCFL2v7MfcUXjoqnODMms18EVmRJlXIaoxNRcin/S+lq0Xg91cYLTkcE4ALnO6
 JjrJeGpboE3WpZpaNmA+8Z0eooj5ozmV0oZkH+zPsiVBSxm6phMraGJdqGVmDhD0WN9J
 6wnmEZWCkouOlFhiWZomvlnLfTNFeNo7w+WLhIkClXgIsBD8cJUcktVcH6b2An84qhPc
 5OM8P5VaCG63KdontHpMRcqhrk2w2CEZagtpPPYK1US4b60xjX9jpqRMcCCBL+QTDcZo
 gUvlf6VXI09NwDa1kyE94go+HpeCLUGabj4QCiAET50PuNfxOdc4uWv3IpUaRPW+hg0b
 7zEA==
X-Gm-Message-State: APjAAAUYd7AiOwFjAQgFQeW87OTIes+LOpnsqrjQvhTecBoY11kDp0Xc
 E2UpFuZbrgZiUlZFR7a+oW8blxM7wUE=
X-Google-Smtp-Source: APXvYqygIwcKCC+UT5RLT5T0l9I/En3Ay/tyMD2BCv7fq/NvE53vIOjegwR3CkTXGoUtFh+6tpIjrw==
X-Received: by 2002:a5d:4b88:: with SMTP id b8mr1258960wrt.343.1575887599920; 
 Mon, 09 Dec 2019 02:33:19 -0800 (PST)
Received: from a483e7b01a66.ant.amazon.com (54-240-197-234.amazon.com.
 [54.240.197.234])
 by smtp.gmail.com with ESMTPSA id v3sm26356618wru.32.2019.12.09.02.33.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Dec 2019 02:33:19 -0800 (PST)
To: Ian Jackson <ian.jackson@citrix.com>
References: <24042.34323.159917.173963@mariner.uk.xensource.com>
 <b199414b-dbe6-2d0d-bd97-e5bafb402c47@xen.org>
 <24042.39208.563484.2274@mariner.uk.xensource.com>
From: Julien Grall <julien@xen.org>
Message-ID: <9b0e4402-574e-4d25-c7ee-5c28fe88a448@xen.org>
Date: Mon, 9 Dec 2019 10:33:18 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.3.0
MIME-Version: 1.0
In-Reply-To: <24042.39208.563484.2274@mariner.uk.xensource.com>
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
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 "xen-devel@lists.xen.org" <xen-devel@lists.xen.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGksCgpPbiAwNi8xMi8yMDE5IDE4OjA4LCBJYW4gSmFja3NvbiB3cm90ZToKPiBKdWxpZW4gR3Jh
bGwgd3JpdGVzICgiUmU6IFByb2JsZW0gYm9vdGluZyBEZWJpYW4gYnVzdGVyIG9uIGFybmRhbGUi
KToKPj4gT24gMDYvMTIvMjAxOSAxNjo0NywgSWFuIEphY2tzb24gd3JvdGU6Cj4+PiBJdCBzZWVt
cyB0byBoYXZlIGh1bmcgZHVyaW5nIGJvb3QuICBOQiB0aGF0IEkgZG9uJ3Qga25vdyB3aGV0aGVy
IHRoaXMKPj4+IGlzIGEgb25lLW9mZi4KPj4KPj4gTG9va2luZyBhdCBbMV0sIG1vc3Qgb2YgdGhl
IHJlY2VudCBmbGlnaHQgaGF2ZSBtYW5hZ2VkIHRvIGJvb3QgWGVuIG9uCj4+IHRoZSBhcm5kYWxl
LiBIb3dldmVyLCBJIHNvbWVob3cgY2FuJ3QgZmluZCB0aGUgZmxpZ2h0IDE0NDMxMiBpbiB0aGF0
Cj4+IGxpc3QuIERvIHlvdSBoYXZlIGFueSBpZGVhIHdoeT8KPiAKPiBUaGUgZmxpZ2h0IGluIHF1
ZXN0aW9uIHdhcyBub3Qgb24gdGhlIHhlbi11bnN0YWJsZSAiYnJhbmNoIiwgYW5kIG5vdAo+IG9m
ZmljaWFsbHkgYmxlc3NlZCwgYmVjYXVzZSBpdCdzIHBhcnQgb2YgbXkgYnVzdGVyIHdvcmsuCj4g
Cj4gSSBmb3VuZCBhIHNlY29uZCBpbnN0YW5jZSBpbiB0aGUgc2FtZSBmbGlnaHQ6Cj4gICAgaHR0
cDovL2xvZ3MudGVzdC1sYWIueGVucHJvamVjdC5vcmcvb3NzdGVzdC9sb2dzLzE0NDMxMi90ZXN0
LWFybWhmLWFybWhmLWV4YW1pbmUvaW5mby5odG1sCj4gCj4gSSB0aGluayBpdCBtdXN0IGJlIHNw
ZWNpZmljIHRvIGJ1c3RlciwgYnV0IHRoYXQgaXMgcmF0aGVyIG15c3RlcmlvdXMuCj4gQWZ0ZXIg
YWxsIGl0IGlzIHN1cHBvc2VkIHRvIGJlIHRoZSBzYW1lIGtlcm5lbCBhbmQgWGVuIGFzIHRoZSBj
dXJyZW50Cj4gb3NzdGVzdCBtYWlubGluZSBpcyB1c2luZy4gIE1heWJlIHRoZSBuZXcgY29tcGls
ZXIgaXMgZG9pbmcgc29tZXRoaW5nCj4gdW5leHBlY3RlZC4KCkxvb2tpbmcgYXQgdGhlIGNvbW1h
bmQgbGluZSBmb3IgTGludXgsIHdlIGRvbid0IHBhc3MgY2xrX2lnbm9yZV91bnVzZWQuIApXaXRo
b3V0IGl0LCB0aGUgTGludXggbWF5IGRpc2FibGUgdGhlIGNsb2NrIG9mIHRoZSBVQVJUIGlmIGl0
IHdhc24ndCAKc2hhcmVkIHdpdGggYW5vdGhlciBkZXZpY2UuIFRoaXMgd291bGQgZXhwbGFpbiB0
aGUgc3VkZGVuIGxvc3Mgb2YgdGhlIApjb25zb2xlLgoKVGhlIGZvbGxvd2luZyBsaW5lIGluIE9z
c3Rlc3QvRGViaWFuLnBtIHdvdWxkIG5lZWQgdG8gYmUgdXBkYXRlZDoKCiAgICAgIHB1c2ggQHhl
bmtvcHQsICJjbGtfaWdub3JlX3VudXNlZCIKICAgICAgICAgICAgIGlmICRoby0+e1N1aXRlfSA9
fiBtL3doZWV6eXxqZXNzaWV8c3RyZXRjaC87CgpDaGVlcnMsCgotLSAKSnVsaWVuIEdyYWxsCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwg
bWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3Rz
LnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
