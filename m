Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E26548810
	for <lists+xen-devel@lfdr.de>; Mon, 17 Jun 2019 17:57:54 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hctyj-0001dV-DH; Mon, 17 Jun 2019 15:55:29 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=CmRm=UQ=tklengyel.com=bounce+e181d6.cd840-xen-devel=lists.xenproject.org@srs-us1.protection.inumbo.net>)
 id 1hctyh-0001dQ-Tt
 for xen-devel@lists.xenproject.org; Mon, 17 Jun 2019 15:55:27 +0000
X-Inumbo-ID: 519b00ba-9118-11e9-847d-f3b23c52d63c
Received: from rs224.mailgun.us (unknown [209.61.151.224])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 519b00ba-9118-11e9-847d-f3b23c52d63c;
 Mon, 17 Jun 2019 15:55:24 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=tklengyel.com;
 q=dns/txt; 
 s=krs; t=1560786924; h=Content-Type: Cc: To: Subject: Message-ID: Date:
 From: In-Reply-To: References: MIME-Version: Sender;
 bh=6wS922jpG5ZhdLLCO/+YvSEy7m1yJQuylU8my7bdXrw=;
 b=lwRyAPaXdwxyA+KPyoFmmz3ip1N/YkYkEkm4Sm+l2J7iih9fKcwLhXlRCBKPmf5Mj1f6UJ8M
 8EUGRMSGGTi+l1XOTw2r+xZCI8/PoZsa4U9ooSfzqj8XGWGfGNXiywrFUVLlcLMb89AptNQU
 EtNp6PFYSmEB3QqBdi/xg30gscI=
X-Mailgun-Sending-Ip: 209.61.151.224
X-Mailgun-Sid: WyIyYTNmOCIsICJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmciLCAiY2Q4NDAiXQ==
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com
 [209.85.128.41])
 by mxa.mailgun.org with ESMTP id 5d0786b2.7f122e17ce70-smtp-out-n01;
 Mon, 17 Jun 2019 12:25:22 -0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id u8so8885280wmm.1
 for <xen-devel@lists.xenproject.org>; Mon, 17 Jun 2019 05:25:22 -0700 (PDT)
X-Gm-Message-State: APjAAAW8ZNgkR9c/P/N0BmHSYQkp8fzo3/39Q32vQtNrAiDcJptjw6EW
 mvIN3Lwg53cO8LoVr11TvxQOeDzt9YCRLRsnZos=
X-Google-Smtp-Source: APXvYqwzHCJq0QP9NngZ0sKjyPtPJnU+OcBWibdk7TqKyXlUq9ULBQW/ONU+E8eoP1987i843iixvz5WeGFCacsrr0Y=
X-Received: by 2002:a1c:f319:: with SMTP id q25mr17836543wmq.129.1560774321198; 
 Mon, 17 Jun 2019 05:25:21 -0700 (PDT)
MIME-Version: 1.0
References: <20190516213752.1701-1-tamas@tklengyel.com>
 <20190516213752.1701-3-tamas@tklengyel.com>
In-Reply-To: <20190516213752.1701-3-tamas@tklengyel.com>
From: Tamas K Lengyel <tamas@tklengyel.com>
Date: Mon, 17 Jun 2019 14:24:44 +0200
X-Gmail-Original-Message-ID: <CABfawh=j0-ezChbm9ZRUw0MMs5JBQG3a+2tEMSpY6OGFjVeJ9w@mail.gmail.com>
Message-ID: <CABfawh=j0-ezChbm9ZRUw0MMs5JBQG3a+2tEMSpY6OGFjVeJ9w@mail.gmail.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: [Xen-devel] [PATCH v5 3/4] x86/mem_sharing: enable mem_share
 audit mode only in debug builds
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>,
 Jan Beulich <jbeulich@suse.com>, Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVGh1LCBNYXkgMTYsIDIwMTkgYXQgMTE6MzggUE0gVGFtYXMgSyBMZW5neWVsIDx0YW1hc0B0
a2xlbmd5ZWwuY29tPiB3cm90ZToKPgo+IEltcHJvdmVzIHBlcmZvcm1hbmNlIGZvciByZWxlYXNl
IGJ1aWxkcy4KPgo+IFNpZ25lZC1vZmYtYnk6IFRhbWFzIEsgTGVuZ3llbCA8dGFtYXNAdGtsZW5n
eWVsLmNvbT4KClBhdGNoIHBpbmcuIFVuY2xlYXIgd2hvc2UgQWNrIGlzIHN0cmljdGx5IG5lZWRl
ZCBhcyB0aGlzIGlzIG9ubHkKdG91Y2hpbmcgbWVtX3NoYXJpbmcgY29kZSBhbmQgbm90aGluZyBl
bHNlLgoKVGhhbmtzLApUYW1hcwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hl
bi1kZXZlbA==
