Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EB850A4586
	for <lists+xen-devel@lfdr.de>; Sat, 31 Aug 2019 19:12:36 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i46qk-0007C0-0I; Sat, 31 Aug 2019 17:07:42 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=iJxP=W3=gmail.com=yefremov.denis@srs-us1.protection.inumbo.net>)
 id 1i46qi-0007BG-MI
 for xen-devel@lists.xenproject.org; Sat, 31 Aug 2019 17:07:40 +0000
X-Inumbo-ID: d61e04e8-cc11-11e9-8980-bc764e2007e4
Received: from mail-ed1-f66.google.com (unknown [209.85.208.66])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d61e04e8-cc11-11e9-8980-bc764e2007e4;
 Sat, 31 Aug 2019 17:07:39 +0000 (UTC)
Received: by mail-ed1-f66.google.com with SMTP id t50so11617078edd.2
 for <xen-devel@lists.xenproject.org>; Sat, 31 Aug 2019 10:07:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Lik2TQFtm24ZeMK7lbOS3RM+iMDhKtG/DlU1Hn/vZvk=;
 b=JmhuDntiBP1815tnHmoZAXLXMaABpiC0Iq2fIeug/kWDAbMU0YNX17O3i4kQuJZDzC
 zPN+n922PF5WTsLCm7GGqv7+GnewbRsBMtXx6vqp8NYwAZ/F3VzpvOK3m/nNla8GTasx
 fc6cPphy8IyGck87mELz5n3xzb98GcRtR2U7UtX2v59F/jvwOd15xDicycg5PFKBE+Za
 Vk6LPuwU7kae4aAE8gSAN2oS0V4L/33uJU2w0P5R3A5nKnHmPsmzVcwfapoxlyQlxfOq
 A9pXYKzz7a1P+NfnkatzXv1+6AcFnJQfSNvQ9/cVI0TFl9Ro0p2JqDPym7mSALBHsHyn
 botQ==
X-Gm-Message-State: APjAAAX01/EWy84vD+P7H8lIiNLoEHc/wab2XUmCj/uwt6LPnJuO0d5b
 DseLCqrEbfNhePrSXPSPBd0=
X-Google-Smtp-Source: APXvYqwYiVn+T/jnXqHdTksQFpnl6eq02sfkOXYISHWm5GobK2D0xg22AxYic/zL89Sp0zVPu8fsxw==
X-Received: by 2002:a50:88c5:: with SMTP id d63mr21674654edd.122.1567271258673; 
 Sat, 31 Aug 2019 10:07:38 -0700 (PDT)
Received: from [10.68.32.192] (broadband-188-32-48-208.ip.moscow.rt.ru.
 [188.32.48.208])
 by smtp.gmail.com with ESMTPSA id i23sm1739594edv.11.2019.08.31.10.07.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 31 Aug 2019 10:07:38 -0700 (PDT)
To: Markus Elfring <Markus.Elfring@web.de>, Joe Perches <joe@perches.com>
References: <20190829165025.15750-1-efremov@linux.com>
 <0d9345ed-f16a-de0b-6125-1f663765eb46@web.de>
 <689c8baf-2298-f086-3461-5cd1cdd191c6@linux.com>
 <493a7377-2de9-1d44-cd8f-c658793d15db@web.de>
From: Denis Efremov <efremov@linux.com>
Message-ID: <c5e4479d-2fb3-b5a5-00c3-b06e5177d869@linux.com>
Date: Sat, 31 Aug 2019 20:07:34 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <493a7377-2de9-1d44-cd8f-c658793d15db@web.de>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v3 01/11] checkpatch: check for nested
 (un)?likely() calls
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
Cc: dri-devel@lists.freedesktop.org, Leon Romanovsky <leon@kernel.org>,
 "Darrick J. Wong" <darrick.wong@oracle.com>, linux-rdma@vger.kernel.org,
 Inaky Perez-Gonzalez <inaky.perez-gonzalez@intel.com>,
 Saeed Mahameed <saeedm@mellanox.com>, linux-input@vger.kernel.org,
 xen-devel@lists.xenproject.org, Boris Pismenny <borisp@mellanox.com>,
 linux-arm-msm@vger.kernel.org, linux-wimax@intel.com,
 Enrico Weigelt <lkml@metux.net>, Alexander Viro <viro@zeniv.linux.org.uk>,
 Andy Whitcroft <apw@canonical.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, Sean Paul <sean@poorly.run>,
 Anton Altaparmakov <anton@tuxera.com>,
 =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>,
 Mike Marciniszyn <mike.marciniszyn@intel.com>,
 linux-ntfs-dev@lists.sourceforge.net, netdev@vger.kernel.org,
 Dennis Dalessandro <dennis.dalessandro@intel.com>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-kernel@vger.kernel.org,
 linux-xfs@vger.kernel.org, Rob Clark <robdclark@gmail.com>,
 =?UTF-8?Q?Pali_Roh=c3=a1r?= <pali.rohar@gmail.com>,
 linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 "David S. Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

CgpPbiAzMS4wOC4yMDE5IDE5OjQ1LCBNYXJrdXMgRWxmcmluZyB3cm90ZToKPj4+PiArIyBuZXN0
ZWQgbGlrZWx5L3VubGlrZWx5IGNhbGxzCj4+Pj4gK8KgwqDCoMKgwqDCoMKgIGlmICgkbGluZSA9
fiAvXGIoPzooPzp1bik/bGlrZWx5KVxzKlwoXHMqIT9ccyooSVNfRVJSKD86X09SX05VTEx8X1ZB
TFVFKT98V0FSTikvKSB7Cj4+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgV0FSTigiTElLRUxZ
X01JU1VTRSIsCj4+Pgo+Pj4gSG93IGRvIHlvdSB0aGluayBhYm91dCB0byB1c2UgdGhlIHNwZWNp
ZmljYXRpb24g4oCcKD86SVNfRVJSKD86Xyg/Ok9SX05VTEx8VkFMVUUpKT98V0FSTinigJ0KPj4+
IGluIHRoaXMgcmVndWxhciBleHByZXNzaW9uPwo+IOKApgo+PiAgICBJU19FUlIKPj4gICAgKD86
XyA8LSBBbm90aGVyIGF0b21pYyBncm91cCBqdXN0IHRvIHNob3cgdGhhdCAnXycgaXMgYSBjb21t
b24gcHJlZml4Pwo+IAo+IFllcy4gLSBJIGhvcGUgdGhhdCB0aGlzIHNwZWNpZmljYXRpb24gZGV0
YWlsIGNhbiBoZWxwIGEgYml0LgoKSSdtIG5vdCBzdXJlIHRoYXQgYW5vdGhlciBwYWlyIG9mIGJy
YWNrZXRzIGZvciBhIHNpbmdsZSBjaGFyIHdvcnRoIGl0LgoKPj4gICAgICAgICAgICBVc3VhbGx5
LCBQZXJsIGludGVycHJldGVyIGlzIHZlcnkgZ29vZCBhdCBvcHRpbWl6aW5nIHN1Y2ggdGhpbmdz
LgoKVGhlIGludGVycHJldGVyIG9wdGltaXplcyBpdCBpbnRlcm5hbGx5OgplY2hvICdJU19FUlJf
T1JfTlVMTCcgfCBwZXJsIC1NcmU9ZGVidWcgLW5lICcvSVNfRVJSKD86X09SX05VTEx8X1ZBTFVF
KT8vICYmIHByaW50JwpDb21waWxpbmcgUkV4ICJJU19FUlIoPzpfT1JfTlVMTHxfVkFMVUUpPyIK
RmluYWwgcHJvZ3JhbToKICAgMTogRVhBQ1QgPElTX0VSUj4gKDQpCiAgIDQ6IENVUkxZWFswXXsw
LDF9ICgxNikKICAgNjogICBFWEFDVCA8Xz4gKDgpICAgICAgPC0tIGNvbW1vbiBwcmVmaXgKICAg
ODogICBUUklFLUVYQUNUW09WXSAoMTUpCiAgICAgICAgPE9SX05VTEw+IAogICAgICAgIDxWQUxV
RT4KLi4uCj4gCj4gV291bGQgeW91IGxpa2UgdG8gaGVscCB0aGlzIHNvZnR3YXJlIGNvbXBvbmVu
dCBieSBvbWl0dGluZyBhIHBhaXIgb2YKPiBub24tY2FwdHVyaW5nIHBhcmVudGhlc2VzIGF0IHRo
ZSBiZWdpbm5pbmc/Cj4gCj4gXGIoPzp1bik/bGlrZWx5XHMqCgpUaGlzIHBhaXIgb2YgYnJhY2tl
dHMgaXMgcmVxdWlyZWQgdG8gbWF0Y2ggInVubGlrZWx5IiBhbmQgaXQncwpvcHRpb25hbCBpbiBv
cmRlciB0byBtYXRjaCAibGlrZWx5Ii4KClJlZ2FyZHMsCkRlbmlzCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3Jn
L21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
