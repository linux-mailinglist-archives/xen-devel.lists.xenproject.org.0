Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 10A96A33BF
	for <lists+xen-devel@lfdr.de>; Fri, 30 Aug 2019 11:24:35 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i3d6V-0002qe-S8; Fri, 30 Aug 2019 09:21:59 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=wesd=W2=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1i3d6U-0002qZ-9R
 for xen-devel@lists.xenproject.org; Fri, 30 Aug 2019 09:21:58 +0000
X-Inumbo-ID: 9c80ce74-cb07-11e9-ae7e-12813bfff9fa
Received: from mail-wm1-f67.google.com (unknown [209.85.128.67])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 9c80ce74-cb07-11e9-ae7e-12813bfff9fa;
 Fri, 30 Aug 2019 09:21:56 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id v15so6543772wml.0
 for <xen-devel@lists.xenproject.org>; Fri, 30 Aug 2019 02:21:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=lZOIwJo9I3PmjSPqfzAho6N7s9OTvDX8i9EMoQ8j8p0=;
 b=HlMKbkDzJLkjlngw8iB3vMRJJBk/pEQ63wmQiw3H2cEBKWuNV0C4mULRYGENVXZsFR
 +Mdq0wiFarLK1GDlnJpu/NXbA74U7+lyc9J65viDlx4h8eaQLpfr/KKMnq6CV3mjx0Kg
 wRWuGRdr45nrAIRXiwqcYkOvI0TBw6UAtLoBINbaVCn+h/PTnGFjwAzTuN2AgizTbFfS
 XhcHUZ0jloJGRUVwnvVEYTYFMUqx1Nrb8VEvidM1AKyfBqkAgJHNaHBWisuG4lOmegcf
 b5HeY+9+Hk82M7xxHTJR4pMGRjOF00rQtsQugP0XsSDoSvp8Xo/Ab2JOIXvt/DA9ooAJ
 h+DQ==
X-Gm-Message-State: APjAAAWXj/0V0IcbR9OPLBoiAQ/jZ5n6fUk780wi1VKvpwR3xET3cEvP
 YfJQcCOJc2i5VBLA5xiMqWw=
X-Google-Smtp-Source: APXvYqy/YXtw22aBVzCkx95yvZ6Np/fZSmk47aLv94d9vGR1d5VZOG1qxuO3LkPDyx91XraqUa8+1Q==
X-Received: by 2002:a7b:c952:: with SMTP id i18mr18069477wml.44.1567156915849; 
 Fri, 30 Aug 2019 02:21:55 -0700 (PDT)
Received: from
 liuwe-gateway.j3c5onc20sse1dnehy4noqpfcg.zx.internal.cloudapp.net
 ([51.140.50.101])
 by smtp.gmail.com with ESMTPSA id x6sm8193892wrt.63.2019.08.30.02.21.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Aug 2019 02:21:55 -0700 (PDT)
Date: Fri, 30 Aug 2019 09:21:53 +0000
From: Wei Liu <wl@xen.org>
To: Joseph Komlodi <komlodija@gmail.com>
Message-ID: <20190830092153.alhfguecbufkwqih@liuwe-gateway.j3c5onc20sse1dnehy4noqpfcg.zx.internal.cloudapp.net>
References: <CANv5CpvepXe-2MEivExcX3CyGH1B1MqXeone_hBu=_xFF3SSOw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CANv5CpvepXe-2MEivExcX3CyGH1B1MqXeone_hBu=_xFF3SSOw@mail.gmail.com>
User-Agent: NeoMutt/20180716
Subject: Re: [Xen-devel] Xilinx ARM64 Xen testing
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
Cc: xen-devel@lists.xenproject.org, sstabellini@kernel.org, cardoe@cardoe.com,
 wl@xen.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gV2VkLCBBdWcgMjgsIDIwMTkgYXQgMTE6MzE6NThBTSAtMDcwMCwgSm9zZXBoIEtvbWxvZGkg
d3JvdGU6Cj4gSGkgYWxsLAo+IAo+IEknbSB3b3JraW5nIG9uIEFSTTY0IFhlbiB0ZXN0aW5nIHdp
dGggWGlsaW54LCBhbmQgSSBoYXZlIGEgZmV3Cj4gcXVpY2sgcXVlc3Rpb25zIHRvIGFzay4KPiAK
PiBIb3cgaXMgc3VjY2VzcyB2cyBmYWlsdXJlIGRldGVybWluZWQgd2l0aCB0ZXN0aW5nIHVzaW5n
IEdpdGxhYiBDST8KPiBJdCBsb29rcyBsaWtlIGV2ZXJ5dGhpbmcgZ29lcyBpbnRvIGEgbG9nLCBi
dXQgaXMgdGhlcmUgcGFyc2luZwo+IGRvbmUgYWZ0ZXJ3YXJkcyB0byBtYWtlIHRoZSBvdXRwdXQg
ZWFzaWVyIHRvIGdvIHRocm91Z2g/CgpEbyB3aGF0ZXZlciB5b3Ugd2FudCBpbiB0aGUgc2NyaXB0
OiBwYXJzaW5nIGxvZywgdGVzdGluZyBwcm9jZXNzIGV4aXQKc3RhdHVzLgoKU3VjY2VzcyBvciBm
YWlsdXJlIGlzIGRldGVybWluZWQgYnkgdGhlIHJldHVybiB2YWx1ZSBvZiB0aGUgc2NyaXB0LgoK
PiAKPiBJZiBJIGhhdmUgYSBjb250YWluZXIgb24gRG9ja2VyIEh1YiB3aXRoIGEgUUVNVSBiaW5h
cnkgaW4gaXQsIGNvdWxkCj4gSSB1c2UgaXQgaW4gdGhlIERvY2tlcmZpbGUgZm9yIFhlbiB0ZXN0
aW5nIGFzIG9uZSBvZiB0aGUgRlJPTSBjb250YWluZXJzPwo+IAoKWWVzLgoKUGxlYXNlIHN1Ym1p
dCBhIHBhdGNoIGFnYWluc3QgeGVuLmdpdCB0byBwdXQgdGhlIGRvY2tlcmZpbGUgdW5kZXIKYXV0
b21hdGlvbiBkaXJlY3RvcnkuIEFuZCB0aGVuIGFkZCB5b3VyIGNvbmZpZ3VyYXRpb24gdG8gR2l0
bGFiIENJJ3MgWU1MCmZpbGVzIGluIHhlbi5naXQuCgpPbmNlIHlvdXIgcGF0Y2hlcyBhcmUgcmV2
aWV3ZWQgb3IgYWNrZWQsIHNvbWVvbmUgd2l0aCBwcm9wZXIgcGVybWlzc2lvbnMKd2lsbCBmaXJz
dCBwdXNoIHRoZSBkb2NrZXIgaW1hZ2UgdG8gb3VyIG93biByZXBvc2l0b3J5IGFuZCB0aGVuIHB1
c2ggYWxsCnlvdXIgcGF0Y2hlcyB0byB4ZW4uZ2l0LiBZb3VyIHRlc3QgY2FzZXMgd2lsbCBiZSBy
dW4gYXV0b21hdGljYWxseSBmcm9tCnRoZW4gb24uCgo+IFdoYXQgYXJlIHRoZSBiZXN0IHdheXMg
dG8gZ2V0IGEgYmluYXJ5IGZvciBYZW4/Cj4gRG8gd2UgZG93bmxvYWQgaXQsIG9yIHNob3VsZCB3
ZSBidWlsZCBmcm9tIHNvdXJjZT8KClRoZXJlIGFyZSB0d28gc3RhZ2VzIGluIHRoZSBwaXBlbGlu
ZS4gT25lIGlzIGJ1aWxkLCB0aGUgb3RoZXIgaXMgdGVzdC4KClRoZSB4ZW4gYmluYXJpZXMgYXJl
IGFsd2F5cyBidWlsdCBpbiB0aGUgYnVpbGQgc3RhZ2Ugb2YgdGhlIHBpcGVsaW5lLgpUZXN0IGNh
c2VzIGluIHRlc3Qgc3RhZ2Ugd2lsbCBnZXQgdGhlaXIgYmluYXJpZXMgZnJvbSBidWlsZCBzdGFn
ZS4KCldlaS4KCj4gCj4gVGhhbmtzIQo+IAo+IEpvZQoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxA
bGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL3hlbi1kZXZlbA==
