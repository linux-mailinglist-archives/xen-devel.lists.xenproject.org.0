Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 96B13156428
	for <lists+xen-devel@lfdr.de>; Sat,  8 Feb 2020 13:15:10 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j0Oyj-0005do-72; Sat, 08 Feb 2020 12:12:53 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=UONU=34=gmail.com=julien.grall.oss@srs-us1.protection.inumbo.net>)
 id 1j0Oyi-0005dj-0k
 for xen-devel@lists.xenproject.org; Sat, 08 Feb 2020 12:12:52 +0000
X-Inumbo-ID: 53c37d00-4a6c-11ea-a759-bc764e2007e4
Received: from mail-wr1-f67.google.com (unknown [209.85.221.67])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 53c37d00-4a6c-11ea-a759-bc764e2007e4;
 Sat, 08 Feb 2020 12:12:51 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id u6so1993169wrt.0
 for <xen-devel@lists.xenproject.org>; Sat, 08 Feb 2020 04:12:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=D7LrXpFaLgcqM5OfNI02YraVLFwTimxPOWKCmHZ9rvo=;
 b=Bmsd+Ets1zzjoqTObazkMVIUx7kYeJ0Ki9U4juMnFFxkX86L+81qXjLbq71do/zQPj
 +ytd72rHA/IFA+zyc5toPgqk5nY6FOwxo3uaACgz/fYr0nFe1vRdTPioe+VJE9Pk5Czj
 CnAtyqUcCbo4/cytpBw9QRsWJ0dmhFfrg1YCMGtRYa9oXBI43qkPC9+ZQF7yBRL12Vqf
 h43juk6+/yi3oBmU9S3uSOL+H1fyWvtT20ra+RXMoF+/zBvd3WLXk0gz1IFaXoCQd4Gl
 O0EMIpuKRiTZ8YrhjKuqim7nx6IH++fFN2v3cwUkSyHpxMN61q5UzrJzXrB7sUW2OGhI
 Vicw==
X-Gm-Message-State: APjAAAWVnwlaRDV/r7MTOlCekPUaipIriT/4Q7WYbd+1G3TTF7KW/5qk
 maTzG2XfWNrcOPaM5aogKgk=
X-Google-Smtp-Source: APXvYqzJOicErmidS1/qy//1VTx96akg72jP/2NxfwzrGtxaqEEsu3x8YyLw8768DwhfsqrSR++AmA==
X-Received: by 2002:adf:e984:: with SMTP id h4mr5241769wrm.275.1581163970694; 
 Sat, 08 Feb 2020 04:12:50 -0800 (PST)
Received: from a483e7b01a66.ant.amazon.com (54-240-197-236.amazon.com.
 [54.240.197.236])
 by smtp.gmail.com with ESMTPSA id b18sm7462836wru.50.2020.02.08.04.12.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 08 Feb 2020 04:12:50 -0800 (PST)
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20200205165056.11734-1-andrew.cooper3@citrix.com>
 <20200205165056.11734-7-andrew.cooper3@citrix.com>
From: Julien Grall <julien@xen.org>
Message-ID: <fe86a3c6-7e32-4d6c-9844-7ffbcaad91d2@xen.org>
Date: Sat, 8 Feb 2020 12:12:48 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <20200205165056.11734-7-andrew.cooper3@citrix.com>
Content-Language: en-GB
Subject: Re: [Xen-devel] [PATCH 6/6] xen/public: Obsolete
 HVM_PARAM_PAE_ENABLED
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Jan Beulich <JBeulich@suse.com>, Anthony PERARD <anthony.perard@citrix.com>,
 Ian Jackson <Ian.Jackson@citrix.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgQW5kcmV3LAoKT24gMDUvMDIvMjAyMCAxNjo1MCwgQW5kcmV3IENvb3BlciB3cm90ZToKPiBk
aWZmIC0tZ2l0IGEveGVuL2FyY2gvYXJtL2h2bS5jIGIveGVuL2FyY2gvYXJtL2h2bS5jCj4gaW5k
ZXggNzZiMjdjOTE2OC4uZjM0MjZmMzdmZSAxMDA2NDQKPiAtLS0gYS94ZW4vYXJjaC9hcm0vaHZt
LmMKPiArKysgYi94ZW4vYXJjaC9hcm0vaHZtLmMKPiBAQCAtNDYsNyArNDYsOCBAQCBsb25nIGRv
X2h2bV9vcCh1bnNpZ25lZCBsb25nIG9wLCBYRU5fR1VFU1RfSEFORExFX1BBUkFNKHZvaWQpIGFy
ZykKPiAgICAgICAgICAgaWYgKCBjb3B5X2Zyb21fZ3Vlc3QoJmEsIGFyZywgMSkgKQo+ICAgICAg
ICAgICAgICAgcmV0dXJuIC1FRkFVTFQ7Cj4gICAKPiAtICAgICAgICBpZiAoIGEuaW5kZXggPj0g
SFZNX05SX1BBUkFNUyApCj4gKyAgICAgICAgaWYgKCBhLmluZGV4ID49IEhWTV9OUl9QQVJBTVMg
fHwKPiArICAgICAgICAgICAgIGEuaW5kZXggPT0gSFZNX1BBUkFNX1BBRV9FTkFCTEVEICkKPiAg
ICAgICAgICAgICAgIHJldHVybiAtRUlOVkFMOwoKRm9yIHRoZSBzbWFsbCBBcm0gcGFydDoKCkFj
a2VkLWJ5OiBKdWxpZW4gR3JhbGwgPGp1bGllbkB4ZW4ub3JnPgoKLS0gCkp1bGllbiBHcmFsbAoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
