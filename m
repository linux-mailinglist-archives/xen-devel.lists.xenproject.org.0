Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D72E791851
	for <lists+xen-devel@lfdr.de>; Sun, 18 Aug 2019 19:24:44 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hzOr2-0007Wc-5c; Sun, 18 Aug 2019 17:20:32 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=0rab=WO=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1hzOr0-0007WX-TU
 for xen-devel@lists.xenproject.org; Sun, 18 Aug 2019 17:20:30 +0000
X-Inumbo-ID: 79e0ae40-c1dc-11e9-aee9-bc764e2007e4
Received: from mail-wm1-f66.google.com (unknown [209.85.128.66])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 79e0ae40-c1dc-11e9-aee9-bc764e2007e4;
 Sun, 18 Aug 2019 17:20:29 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id v19so1021480wmj.5
 for <xen-devel@lists.xenproject.org>; Sun, 18 Aug 2019 10:20:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=fx1JuKdr6xXkSemhgCFSOZMazw81STCK1VLGlgFebHA=;
 b=Wwymw4OVOibRLq3nc3hRgrcWZbAaoYmuJY4Pi5n6lYGsxaT9BXC/J9z3AzZlRV9WQR
 pz6QgJsK1pdyHomKygMRZPrZhq60igIdwr2x9i5JKF9OIax8c1jMrrkxZ8hL4mLUEH+q
 gOnRcWPcEtJdGagLwrdphXk+Guw7QgXt3FoA32Ax9DVLrVHNy1SdMg7rHw4OpDSHgIUD
 gQ3RvAgxMJNCdrPSmlwMUD6GI8YjO+NTw8wi2mkqeJAxFSzrNlVF2Mk86p4S+4RC85nT
 8xRuGsAlAhRumYESPdh7hd5S1wj0g7EBK4u/rs0Q+ZR8eVsebLHhfVf3lUi5bwbG5iV+
 zX+g==
X-Gm-Message-State: APjAAAUnqL2xeNav/xq6QjL68D9EpTnLkxHNjD05b7rL0l0iXUGzZ7iq
 zokYyKhNbD7PkwS1HAoSqoIvFjUP
X-Google-Smtp-Source: APXvYqzLd0ZOonEGmtg8iiOatNwjjmiR4AwpoBrlQe04qZob+VGDIA9EYNF8+9pJXqK3aC59FTLiHA==
X-Received: by 2002:a05:600c:114e:: with SMTP id
 z14mr15887751wmz.161.1566148829021; 
 Sun, 18 Aug 2019 10:20:29 -0700 (PDT)
Received: from debian (20.149.115.87.dyn.plus.net. [87.115.149.20])
 by smtp.gmail.com with ESMTPSA id x20sm27067625wrg.10.2019.08.18.10.20.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 18 Aug 2019 10:20:28 -0700 (PDT)
Date: Sun, 18 Aug 2019 18:20:26 +0100
From: Wei Liu <wl@xen.org>
To: Olaf Hering <olaf@aepfle.de>
Message-ID: <20190818172026.25jeivjl7gpydynh@debian>
References: <20190621093005.29329-1-olaf@aepfle.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190621093005.29329-1-olaf@aepfle.de>
User-Agent: NeoMutt/20180716
Subject: Re: [Xen-devel] [PATCH v1] docs: substitute XEN_CONFIG_DIR in
 xl.conf.5
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
Cc: xen-devel@lists.xenproject.org, Ian Jackson <ian.jackson@eu.citrix.com>,
 Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gRnJpLCBKdW4gMjEsIDIwMTkgYXQgMTE6MzA6MDVBTSArMDIwMCwgT2xhZiBIZXJpbmcgd3Jv
dGU6Cj4geGwoMSkgb3BlbnMgeGwuY29uZiBpbiBYRU5fQ09ORklHX0RJUi4KPiBTdWJzdGl0dXRl
IHRoaXMgdmFyaWFibGUgYWxzbyBpbiB0aGUgbWFuIHBhZ2UuCj4gCj4gU2lnbmVkLW9mZi1ieTog
T2xhZiBIZXJpbmcgPG9sYWZAYWVwZmxlLmRlPgo+IC0tLQo+ICBkb2NzL21hbi94bC4xLnBvZC5p
biAgICAgIHwgMiArLQo+ICBkb2NzL21hbi94bC5jb25mLjUucG9kLmluIHwgMiArLQo+ICAyIGZp
bGVzIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0t
Z2l0IGEvZG9jcy9tYW4veGwuMS5wb2QuaW4gYi9kb2NzL21hbi94bC4xLnBvZC5pbgo+IGluZGV4
IDNkNjRlYWE1YjIuLmZiMTcxNTM2MzUgMTAwNjQ0Cj4gLS0tIGEvZG9jcy9tYW4veGwuMS5wb2Qu
aW4KPiArKysgYi9kb2NzL21hbi94bC4xLnBvZC5pbgo+IEBAIC01MCw3ICs1MCw3IEBAIHNldHVw
IHRoZSBicmlkZ2UuCj4gIAo+ICBJZiB5b3Ugc3BlY2lmeSB0aGUgYW1vdW50IG9mIG1lbW9yeSBk
b20wIGhhcywgcGFzc2luZyBCPGRvbTBfbWVtPiB0bwo+ICBYZW4sIGl0IGlzIGhpZ2hseSByZWNv
bW1lbmRlZCB0byBkaXNhYmxlIEI8YXV0b2JhbGxvb24+LiBFZGl0Cj4gLUI8L2V0Yy94ZW4veGwu
Y29uZj4gYW5kIHNldCBpdCB0byAwLgo+ICtCPEBYRU5fQ09ORklHX0RJUkAveGwuY29uZj4gYW5k
IHNldCBpdCB0byAwLgo+ICAKPiAgPWl0ZW0gcnVuIHhsIGFzIEI8cm9vdD4KPiAgCj4gZGlmZiAt
LWdpdCBhL2RvY3MvbWFuL3hsLmNvbmYuNS5wb2QuaW4gYi9kb2NzL21hbi94bC5jb25mLjUucG9k
LmluCj4gaW5kZXggMmJlYjIxMTlhOC4uYjE2MDM2YWFlYiAxMDA2NDQKPiAtLS0gYS9kb2NzL21h
bi94bC5jb25mLjUucG9kLmluCj4gKysrIGIvZG9jcy9tYW4veGwuY29uZi41LnBvZC5pbgoKU29y
cnkgZm9yIHRoZSBsYXRlIHJlcGx5LgoKVGhpcyBkb2Vzbid0IGFwcGx5LiBUaGVyZSBpcyBubyBz
dWNoIGZpbGUuCgpXZWkuCgo+IEBAIC0xLDYgKzEsNiBAQAo+ICA9aGVhZDEgTkFNRQo+ICAKPiAt
L2V0Yy94ZW4veGwuY29uZiAtIFhMIEdsb2JhbC9Ib3N0IENvbmZpZ3VyYXRpb24gCj4gK0BYRU5f
Q09ORklHX0RJUkAveGwuY29uZiAtIFhMIEdsb2JhbC9Ib3N0IENvbmZpZ3VyYXRpb24gCj4gIAo+
ICA9aGVhZDEgREVTQ1JJUFRJT04KPiAgCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVs
