Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F02DA16B6
	for <lists+xen-devel@lfdr.de>; Thu, 29 Aug 2019 12:50:43 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i3Hyu-0007YO-FY; Thu, 29 Aug 2019 10:48:44 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=orYF=WZ=gmail.com=jirislaby@srs-us1.protection.inumbo.net>)
 id 1i3Hys-0007YF-3y
 for xen-devel@lists.xenproject.org; Thu, 29 Aug 2019 10:48:42 +0000
X-Inumbo-ID: 89273f6a-ca4a-11e9-ac23-bc764e2007e4
Received: from mail-wr1-f67.google.com (unknown [209.85.221.67])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 89273f6a-ca4a-11e9-ac23-bc764e2007e4;
 Thu, 29 Aug 2019 10:48:29 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id z11so2929977wrt.4
 for <xen-devel@lists.xenproject.org>; Thu, 29 Aug 2019 03:48:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=PsJQhq+Lb1i2V9/rJZmF77p+KpHip5cMLUFV9G3NyZI=;
 b=AFLNIhAoyHpKJDGCKhVEErcrGYY+3NU2MJYNg51kaOuVFDonSrhAOrJy0MixoJZ1il
 1rMtWEblhfLzVvxJ0ltAht6auBdpAtvwGD8qB+3RUhvAZfmpZjiXdC9vQ/mCNnzLoAAh
 /1rMfp7kuKTvtEPN0AwciZ17CJX0WXJuA9fksqxRI/nkAA6hlOUn7K6+p1CxwDSqg14A
 vzEhrUH6FI7WU6+eMvLyaA59y/rnEVM5CdkpbfTpNFzLZq8AXMil/WaBEvi6qvCvnvLP
 s3KQs6RCrviQFdSAOY73qkIcV0rfpRaLsmevEf6VTi/yT8zSJZH/+x2m2qYgRwDE+s1J
 GJLw==
X-Gm-Message-State: APjAAAVjJTL7aCx7M89Cxf38qbEo7J+9iRiR9b4nIiGIepTiCxASreck
 9ApW+O/cAO/q3iQyUl1s+azyRfU+gT8=
X-Google-Smtp-Source: APXvYqz+mwNaosQtXx5CNE3MaHs77+QiSjijuafkqP8enEgtLarYorxtVZZrKCffia9rcNSYWy0hbA==
X-Received: by 2002:a5d:4649:: with SMTP id j9mr6404113wrs.193.1567075708216; 
 Thu, 29 Aug 2019 03:48:28 -0700 (PDT)
Received: from ?IPv6:2a0b:e7c0:0:107::49? ([2a0b:e7c0:0:107::49])
 by smtp.gmail.com with ESMTPSA id a18sm2603027wrt.18.2019.08.29.03.48.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Aug 2019 03:48:26 -0700 (PDT)
To: Borislav Petkov <bp@alien8.de>
References: <20190808103854.6192-1-jslaby@suse.cz>
 <20190808103854.6192-2-jslaby@suse.cz> <20190812170652.GJ23772@zn.tnic>
From: Jiri Slaby <jslaby@suse.cz>
Openpgp: preference=signencrypt
Autocrypt: addr=jslaby@suse.cz; prefer-encrypt=mutual; keydata=
 mQINBE6S54YBEACzzjLwDUbU5elY4GTg/NdotjA0jyyJtYI86wdKraekbNE0bC4zV+ryvH4j
 rrcDwGs6tFVrAHvdHeIdI07s1iIx5R/ndcHwt4fvI8CL5PzPmn5J+h0WERR5rFprRh6axhOk
 rSD5CwQl19fm4AJCS6A9GJtOoiLpWn2/IbogPc71jQVrupZYYx51rAaHZ0D2KYK/uhfc6neJ
 i0WqPlbtIlIrpvWxckucNu6ZwXjFY0f3qIRg3Vqh5QxPkojGsq9tXVFVLEkSVz6FoqCHrUTx
 wr+aw6qqQVgvT/McQtsI0S66uIkQjzPUrgAEtWUv76rM4ekqL9stHyvTGw0Fjsualwb0Gwdx
 ReTZzMgheAyoy/umIOKrSEpWouVoBt5FFSZUyjuDdlPPYyPav+hpI6ggmCTld3u2hyiHji2H
 cDpcLM2LMhlHBipu80s9anNeZhCANDhbC5E+NZmuwgzHBcan8WC7xsPXPaiZSIm7TKaVoOcL
 9tE5aN3jQmIlrT7ZUX52Ff/hSdx/JKDP3YMNtt4B0cH6ejIjtqTd+Ge8sSttsnNM0CQUkXps
 w98jwz+Lxw/bKMr3NSnnFpUZaxwji3BC9vYyxKMAwNelBCHEgS/OAa3EJoTfuYOK6wT6nadm
 YqYjwYbZE5V/SwzMbpWu7Jwlvuwyfo5mh7w5iMfnZE+vHFwp/wARAQABtBtKaXJpIFNsYWJ5
 IDxqc2xhYnlAc3VzZS5jej6JAjgEEwECACIFAk6S6NgCGwMGCwkIBwMCBhUIAgkKCwQWAgMB
 Ah4BAheAAAoJEL0lsQQGtHBJgDsP/j9wh0vzWXsOPO3rDpHjeC3BT5DKwjVN/KtP7uZttlkB
 duReCYMTZGzSrmK27QhCflZ7Tw0Naq4FtmQSH8dkqVFugirhlCOGSnDYiZAAubjTrNLTqf7e
 5poQxE8mmniH/Asg4KufD9bpxSIi7gYIzaY3hqvYbVF1vYwaMTujojlixvesf0AFlE4x8WKs
 wpk43fmo0ZLcwObTnC3Hl1JBsPujCVY8t4E7zmLm7kOB+8EHaHiRZ4fFDWweuTzRDIJtVmrH
 LWvRDAYg+IH3SoxtdJe28xD9KoJw4jOX1URuzIU6dklQAnsKVqxz/rpp1+UVV6Ky6OBEFuoR
 613qxHCFuPbkRdpKmHyE0UzmniJgMif3v0zm/+1A/VIxpyN74cgwxjhxhj/XZWN/LnFuER1W
 zTHcwaQNjq/I62AiPec5KgxtDeV+VllpKmFOtJ194nm9QM9oDSRBMzrG/2AY/6GgOdZ0+qe+
 4BpXyt8TmqkWHIsVpE7I5zVDgKE/YTyhDuqYUaWMoI19bUlBBUQfdgdgSKRMJX4vE72dl8BZ
 +/ONKWECTQ0hYntShkmdczcUEsWjtIwZvFOqgGDbev46skyakWyod6vSbOJtEHmEq04NegUD
 al3W7Y/FKSO8NqcfrsRNFWHZ3bZ2Q5X0tR6fc6gnZkNEtOm5fcWLY+NVz4HLaKrJuQINBE6S
 54YBEADPnA1iy/lr3PXC4QNjl2f4DJruzW2Co37YdVMjrgXeXpiDvneEXxTNNlxUyLeDMcIQ
 K8obCkEHAOIkDZXZG8nr4mKzyloy040V0+XA9paVs6/ice5l+yJ1eSTs9UKvj/pyVmCAY1Co
 SNN7sfPaefAmIpduGacp9heXF+1Pop2PJSSAcCzwZ3PWdAJ/w1Z1Dg/tMCHGFZ2QCg4iFzg5
 Bqk4N34WcG24vigIbRzxTNnxsNlU1H+tiB81fngUp2pszzgXNV7CWCkaNxRzXi7kvH+MFHu2
 1m/TuujzxSv0ZHqjV+mpJBQX/VX62da0xCgMidrqn9RCNaJWJxDZOPtNCAWvgWrxkPFFvXRl
 t52z637jleVFL257EkMI+u6UnawUKopa+Tf+R/c+1Qg0NHYbiTbbw0pU39olBQaoJN7JpZ99
 T1GIlT6zD9FeI2tIvarTv0wdNa0308l00bas+d6juXRrGIpYiTuWlJofLMFaaLYCuP+e4d8x
 rGlzvTxoJ5wHanilSE2hUy2NSEoPj7W+CqJYojo6wTJkFEiVbZFFzKwjAnrjwxh6O9/V3O+Z
 XB5RrjN8hAf/4bSo8qa2y3i39cuMT8k3nhec4P9M7UWTSmYnIBJsclDQRx5wSh0Mc9Y/psx9
 B42WbV4xrtiiydfBtO6tH6c9mT5Ng+d1sN/VTSPyfQARAQABiQIfBBgBAgAJBQJOkueGAhsM
 AAoJEL0lsQQGtHBJN7UQAIDvgxaW8iGuEZZ36XFtewH56WYvVUefs6+Pep9ox/9ZXcETv0vk
 DUgPKnQAajG/ViOATWqADYHINAEuNvTKtLWmlipAI5JBgE+5g9UOT4i69OmP/is3a/dHlFZ3
 qjNk1EEGyvioeycJhla0RjakKw5PoETbypxsBTXk5EyrSdD/I2Hez9YGW/RcI/WC8Y4Z/7FS
 ITZhASwaCOzy/vX2yC6iTx4AMFt+a6Z6uH/xGE8pG5NbGtd02r+m7SfuEDoG3Hs1iMGecPyV
 XxCVvSV6dwRQFc0UOZ1a6ywwCWfGOYqFnJvfSbUiCMV8bfRSWhnNQYLIuSv/nckyi8CzCYIg
 c21cfBvnwiSfWLZTTj1oWyj5a0PPgGOdgGoIvVjYXul3yXYeYOqbYjiC5t99JpEeIFupxIGV
 ciMk6t3pDrq7n7Vi/faqT+c4vnjazJi0UMfYnnAzYBa9+NkfW0w5W9Uy7kW/v7SffH/2yFiK
 9HKkJqkN9xYEYaxtfl5pelF8idoxMZpTvCZY7jhnl2IemZCBMs6s338wS12Qro5WEAxV6cjD
 VSdmcD5l9plhKGLmgVNCTe8DPv81oDn9s0cIRLg9wNnDtj8aIiH8lBHwfUkpn32iv0uMV6Ae
 sLxhDWfOR4N+wu1gzXWgLel4drkCJcuYK5IL1qaZDcuGR8RPo3jbFO7Y
Message-ID: <f077becf-8ea7-cb4b-d704-5e59a8d69c56@suse.cz>
Date: Thu, 29 Aug 2019 12:48:24 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190812170652.GJ23772@zn.tnic>
Content-Language: en-GB
Subject: Re: [Xen-devel] [PATCH v8 01/28] linkage: new macros for assembler
 symbols
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
Cc: linux-arch@vger.kernel.org, Juergen Gross <jgross@suse.com>,
 Peter Zijlstra <a.p.zijlstra@chello.nl>, jpoimboe@redhat.com,
 Len Brown <len.brown@intel.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 linux-pm@vger.kernel.org, x86@kernel.org,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>, linux-kernel@vger.kernel.org,
 Ingo Molnar <mingo@kernel.org>, mingo@redhat.com, Pavel Machek <pavel@ucw.cz>,
 hpa@zytor.com, xen-devel@lists.xenproject.org, tglx@linutronix.de,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Andrew Morton <akpm@linux-foundation.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTIuIDA4LiAxOSwgMTk6MDYsIEJvcmlzbGF2IFBldGtvdiB3cm90ZToKPj4gKyAgQWdhaW4s
IGV2ZXJ5IGBgU1lNX0NPREVfU1RBUlQqYGAgKipzaGFsbCoqIGJlIGNvdXBsZWQgYnkgYGBTWU1f
Q09ERV9FTkRgYC4KPiAKPiBCdHcsIHRoaXMgY291cGxpbmc6IEkgaGF2ZW4ndCBnb25lIHRocm91
Z2ggdGhlIHdob2xlIHBhdGNoc2V0IGJ1dCBkbyB3ZQo+IGhhdmUgYXV0b21hdGljIGNoZWNraW5n
IHdoaWNoIG1ha2VzIHN1cmUgYSBzdGFydGluZyBtYWNybyBpcyBjb3VwbGVkCj4gd2l0aCB0aGUg
Y29ycmVjdCBlbmRpbmcgbWFjcm8/CgpJIGRvLCBidXQgaXQncyBub3QgcGFydCBvZiB0aGlzIHNl
cmllcy4gSXQncyBhIHBpbmNoIG9mIGxpbmstdGltZSBtYWdpYywKYnV0IGl0IHdvcmtzIHJlbGlh
Ymx5IChzZWUgZS5nLiAxY2JlYzM3YjNmOWMpLiBJIHdpbGwgcG9zdCBpdCBpZi9hZnRlcgp0aGlz
IGdldHMgbWVyZ2VkLiBUaGVyZSB3ZXJlIG90aGVyIGFwcHJvYWNoZXMgcHJvcG9zZWQgaW4gdGhl
IHBhc3QgdG9vCi0tIHVzaW5nIG9ianRvb2wgZm9yIHRoYXQgKG5vdCBpbXBsZW1lbnRlZCkuCgo+
PiArT3ZlcnJpZGluZyBNYWNyb3MKPj4gK35+fn5+fn5+fn5+fn5+fn5+Cj4+ICtBcmNoaXRlY3R1
cmUgY2FuIGFsc28gb3ZlcnJpZGUgYW55IG9mIHRoZSBtYWNyb3MgaW4gdGhlaXIgb3duCj4gCj4g
Ik90aGVyIGFyY2hpdGVjdHVyZXMuLi4gIgoKTm90IG9ubHkgIm90aGVyIiwgeDg2IGNhbiBvdmVy
cmlkZSB0aGUgdHlwZXMgaWYgbmVlZCBiZSB0b28uCgo+PiArYGBhc20vbGlua2FnZS5oYGAsIGlu
Y2x1ZGluZyBtYWNyb3Mgc3BlY2lmeWluZyB0aGUgdHlwZSBvZiBhIHN5bWJvbAo+PiArKGBgU1lN
X1RfRlVOQ2BgLCBgYFNZTV9UX09CSkVDVGBgLCBhbmQgYGBTWU1fVF9OT05FYGApLiAgQXMgZXZl
cnkgbWFjcm8KPj4gK2Rlc2NyaWJlZCBpbiB0aGlzIGZpbGUgaXMgc3Vycm91bmRlZCBieSBgYCNp
ZmRlZmBgICsgYGAjZW5kaWZgYCwgaXQgaXMgZW5vdWdoCj4+ICt0byBkZWZpbmUgdGhlIG1hY3Jv
cyBkaWZmZXJlbnRseSBpbiB0aGUgYWZvcmVtZW50aW9uZWQgYXJjaGl0ZWN0dXJlLWRlcGVuZGVu
dAo+PiAraGVhZGVyLgoKdGhhbmtzLAotLSAKanMKc3VzZSBsYWJzCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3Jn
L21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
