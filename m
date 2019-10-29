Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BCD1EE8B99
	for <lists+xen-devel@lfdr.de>; Tue, 29 Oct 2019 16:15:33 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iPTBf-00042H-JA; Tue, 29 Oct 2019 15:13:35 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=hhGJ=YW=gmail.com=julien.grall.oss@srs-us1.protection.inumbo.net>)
 id 1iPTBd-000428-LO
 for xen-devel@lists.xenproject.org; Tue, 29 Oct 2019 15:13:33 +0000
X-Inumbo-ID: aac72f24-fa5e-11e9-9515-12813bfff9fa
Received: from mail-wr1-f66.google.com (unknown [209.85.221.66])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id aac72f24-fa5e-11e9-9515-12813bfff9fa;
 Tue, 29 Oct 2019 15:13:31 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id a15so1785701wrf.9
 for <xen-devel@lists.xenproject.org>; Tue, 29 Oct 2019 08:13:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=WoeiIhlrWtW8gvCu3Eg1Yagbgo0rGPnq5dOuT7hcjHA=;
 b=UV1PaQYi6YmxTPFg2vzH19AbKhbR84d/fkut0Nt0tbKkxuS+AqcVwAectf+TqInSQF
 IQezrXIQ7xAF2z/1PRwwa58QGaVLD3DTgJhhfoEw/MQg2ZUfZ1IlMHMZb3KSIFvEPxOE
 6F6lhnsWFeaJeH6d4lK/iwX4/1VcT3SDPDEg4aqaTEJnB4GOg5pBAOq/HmWl0gGeq4Op
 BrhuJdl2pjuZOrpajWcvNAi/4RxDDQe1lD7ePM0wPjxpja4p9gcFaOjn+NwuVT7Q1t4s
 rheqtVXD2D3TFhU6jNjjnZJaFm3aHt0Gl0BA67kdofSgjOckfT+0xO157OneJVECi0Op
 w30g==
X-Gm-Message-State: APjAAAV8KtWZnpM2qXtO7L8Y2Qgv5toEBLuOd7/3tCx4hTrEoJPPIrbF
 5SKrRtivT1MNLD2d4xZdBNs=
X-Google-Smtp-Source: APXvYqx4gnEsk0NpGzHv54s0UftchGSNoRoTwU25I7o8ds3eWGMbC1ZrGPB8CBhnBES398uDjOiveg==
X-Received: by 2002:a5d:46d2:: with SMTP id g18mr19563180wrs.245.1572362010698; 
 Tue, 29 Oct 2019 08:13:30 -0700 (PDT)
Received: from ?IPv6:::1? ([206.189.23.0])
 by smtp.gmail.com with ESMTPSA id l22sm29433864wrb.45.2019.10.29.08.13.29
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 29 Oct 2019 08:13:30 -0700 (PDT)
To: Oleksandr Grytsov <al1img@gmail.com>, xen-devel@lists.xenproject.org
References: <20191028182216.3882-1-al1img@gmail.com>
 <20191028182216.3882-2-al1img@gmail.com>
From: Julien Grall <julien@xen.org>
Message-ID: <34a525d9-d9e2-b860-d238-7070670599a1@xen.org>
Date: Tue, 29 Oct 2019 15:13:29 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191028182216.3882-2-al1img@gmail.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v1 1/1] libxl/gentypes: add range init to
 array elements in json parsing
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
Cc: anthony.perard@citrix.com, ian.jackson@eu.citrix.com, julien.grall@arm.com,
 Oleksandr Grytsov <oleksandr_grytsov@epam.com>, wl@xen.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGksCgpJIGhhdmUgbWFkZSBzb21lIGNvbW1lbnRzIHJlZ2FyZGluZyB0aGUgcGF0Y2ggaW4gdGhl
IG9yaWdpbmFsIHRocmVhZC4gV2hpbGUgSSBhbSAKbm90IGEgbGlieGwgZXhwZXJ0LCBpdCB3b3Vs
ZCBoYXZlIGJlZW4gbmljZSB0byBhZGRyZXNzIHRoZW0gb3IgYXQgbGVhc3QgZXhwbGFpbiAKd2h5
IHRoZXkgd2VyZW4ndCBhZGRyZXNzZWQuCgpJIHdpbGwgcmVwZWF0IHRoZW0gaGVyZSBmb3IgY29u
dmVuaWVuY2UuCgpPbiAyOC8xMC8yMDE5IDE4OjIyLCBPbGVrc2FuZHIgR3J5dHNvdiB3cm90ZToK
PiBGcm9tOiBPbGVrc2FuZHIgR3J5dHNvdiA8b2xla3NhbmRyX2dyeXRzb3ZAZXBhbS5jb20+Cj4g
Cj4gQWRkIGluaXRpYWxpemF0aW9uIG9mIGFycmF5IGVsZW1lbnRzIGluIHBhcnNlIGpzb24gZnVu
Y3Rpb24uCj4gCj4gQ3VycmVudGx5LCBhcnJheSBlbGVtZW50cyBhcmUgaW5pdGlhbGl6ZWQgd2l0
aCBjYWxsb2MuIFdoaWNoIG1lYW5zCj4gaW5pdGlhbGl6ZSBhbGwgZWxlbWVudCBmaWVsZHMgd2l0
aCB6ZXJvIHZhbHVlcy4gSWYgZW50cmllcyBhcmUgbWlzc2VkIGluCj4ganNvbiBmb3Igc3VjaCBm
aWVsZHMsIGl0IHdpbGwgYmUgZXF1YWwgdG8gemVybyBpbnN0ZWFkIG9mIGRlZmF1bHQgdmFsdWVz
Lgo+IFRoZSBmaXggaXMgdG8gYWRkIHJhbmdlIGluaXQgZnVuY3Rpb24gYmVmb3JlIHBhcnNpbmcg
YXJyYXkgZWxlbWVudCBmb3IKPiBzdHJ1Y3R1cmVzIHdoaWNoIGhhdmUgZGVmaW5lZCByYW5nZSBp
bml0IGZ1bmN0aW9uLgo+IAo+IFNpZ25lZC1vZmYtYnk6IE9sZWtzYW5kciBHcnl0c292IDxvbGVr
c2FuZHJfZ3J5dHNvdkBlcGFtLmNvbT4KPiAtLS0KPiAgIHRvb2xzL2xpYnhsL2dlbnR5cGVzLnB5
IHwgMiArKwo+ICAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKQo+IAo+IGRpZmYgLS1n
aXQgYS90b29scy9saWJ4bC9nZW50eXBlcy5weSBiL3Rvb2xzL2xpYnhsL2dlbnR5cGVzLnB5Cj4g
aW5kZXggNjQxN2M5ZGQ4Yy4uNGZmNWQ4YTJkMCAxMDA2NDQKPiAtLS0gYS90b29scy9saWJ4bC9n
ZW50eXBlcy5weQo+ICsrKyBiL3Rvb2xzL2xpYnhsL2dlbnR5cGVzLnB5Cj4gQEAgLTQ1Niw2ICs0
NTYsOCBAQCBkZWYgbGlieGxfQ190eXBlX3BhcnNlX2pzb24odHksIHcsIHYsIGluZGVudCA9ICIg
ICAgIiwgcGFyZW50ID0gTm9uZSwgZGlzY3JpbWluYQo+ICAgICAgICAgICBzICs9ICIgICAgICAg
IGdvdG8gb3V0O1xuIgo+ICAgICAgICAgICBzICs9ICIgICAgfVxuIgo+ICAgICAgICAgICBzICs9
ICIgICAgZm9yIChpPTA7ICh0PWxpYnhsX19qc29uX2FycmF5X2dldCh4LGkpKTsgaSsrKSB7XG4i
Cj4gKyAgICAgICAgaWYgdHkuZWxlbV90eXBlLmluaXRfZm4gaXMgbm90IE5vbmUgYW5kIHR5LmVs
ZW1fdHlwZS5hdXRvZ2VuZXJhdGVfaW5pdF9mbjoKCk15IGtub3dsZWRnZSBvZiBsaWJ4bCBpcyBx
dWl0ZSBsaW1pdGVkLiBCdXQgSSBkb24ndCB0aGluayB0aGlzIGlzIGNvcnJlY3QsIHlvdQp3YW50
IHRvIGNhbGwgaW5pdF9mbiB3aGV0aGVyIHRoaXMgaGFzIGJlZW4gYXV0b2dlbmVyYXRlZCBvciBu
b3QuCgo+ICsgICAgICAgICAgICBzICs9IGluZGVudCArICIgICAgIisiJXNfaW5pdCgmJXNbaV0p
O1xuIiAlICh0eS5lbGVtX3R5cGUudHlwZW5hbWUsIHYpCgpMb29raW5nIGF0IHRoZSBvdGhlciB1
c2FnZSAobGlrZSBfbGlieGxfQ190eXBlX2luaXQpLCBpbml0X2ZuIGlzIGNhbGxlZCB3aXRoCgog
ICAgICAgICAgICAgIHMgKz0gIiVzKCVzKTtcbiIgJSAodHkuaW5pdF9mbiwgdHkucGFzc19hcmco
diwgcGFyZW50IGlzIE5vbmUpKQoKSSBhbSBhbHNvIG5vdCBlbnRpcmVseSBzdXJlIHdoZXRoZXIg
d2Ugc2hvdWxkIGFsc28gY2F0ZXIgdGhlIHR5LmluaXRfdmFsICE9IE5vbmUKYXMgd2VsbCBoZXJl
LgoKPiAgICAgICAgICAgcyArPSBsaWJ4bF9DX3R5cGVfcGFyc2VfanNvbih0eS5lbGVtX3R5cGUs
ICJ0IiwgdisiW2ldIiwKPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBp
bmRlbnQgKyAiICAgICIsIHBhcmVudCkKPiAgICAgICAgICAgcyArPSAiICAgIH1cbiIKCkNoZWVy
cywKCi0tIApKdWxpZW4gR3JhbGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94
ZW4tZGV2ZWw=
