Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CDDCA2A8B
	for <lists+xen-devel@lfdr.de>; Fri, 30 Aug 2019 01:10:45 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i3TTL-0003jI-LN; Thu, 29 Aug 2019 23:04:55 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Qfgp=WZ=eikelenboom.it=linux@srs-us1.protection.inumbo.net>)
 id 1i3TTK-0003jD-0Y
 for xen-devel@lists.xenproject.org; Thu, 29 Aug 2019 23:04:54 +0000
X-Inumbo-ID: 66cf2fb0-cab1-11e9-ac23-bc764e2007e4
Received: from server.eikelenboom.it (unknown [91.121.65.215])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 66cf2fb0-cab1-11e9-ac23-bc764e2007e4;
 Thu, 29 Aug 2019 23:04:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=eikelenboom.it; s=20180706; h=Content-Transfer-Encoding:Content-Type:
 MIME-Version:Date:Message-ID:Cc:To:Subject:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=U54/pu8HaDXdKFs6B/v39w6GnD3EaZlEUTdNDMokO2M=; b=SVSRk7ARcEE9/+2gTWry22M2+8
 f91dj1+ybaQO5+HlzAPPg83LoZ1yXhFZnQMLWrO/ezD34ZMw+OPyHVdDwf26XChlCXFzJWD22TaKa
 E1BrYcZGlJNmkmXvBWiVcqlsKmZAk8RJro9MdDVIV3x06gSKPqNcMNBF+k7Eb8uL960I=;
Received: from ip4da85049.direct-adsl.nl ([77.168.80.73]:60618
 helo=[172.16.1.50]) by server.eikelenboom.it with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <linux@eikelenboom.it>)
 id 1i3TTK-0007eb-Ua; Fri, 30 Aug 2019 01:04:55 +0200
From: Sander Eikelenboom <linux@eikelenboom.it>
To: Chao Gao <chao.gao@intel.com>
Message-ID: <e184002b-f1f9-c1a1-4c58-1d4623538bd0@eikelenboom.it>
Date: Fri, 30 Aug 2019 01:04:54 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
Content-Language: en-US
Subject: [Xen-devel] [Xen-unstable] boot crash while loading AMD microcode
 due to commit "microcode/amd: fix memory leak"
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Jan Beulich <jbeulich@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

TC5TLiwKCldoaWxlIHRlc3RpbmcgeGVuLXVuc3RhYmxlLCBteSBBTUQgc3lzdGVtIGNyYXNoZXMg
ZHVyaW5nIGVhcmx5IGJvb3Qgd2hpbGUgbG9hZGluZyBtaWNyb2NvZGUgd2l0aCBhbiAiRWFybHkg
ZmF0YWwgcGFnZSBmYXVsdCIuClJldmVydGluZyBjb21taXQgZGU0NWUzZmYzN2JiMTYwMjc5NjA1
NGFmYWJmYTYyNmVhNTY2MWM0NSAibWljcm9jb2RlL2FtZDogZml4IG1lbW9yeSBsZWFrIiBmaXhl
cyB0aGUgYm9vdCBpc3N1ZS4KCkF0IHByZXNlbnQgSSBkb24ndCBoYXZlIG15IHNlcmlhbCBjb25z
b2xlIHN0dWZmIGF0IGhhbmQsIGJ1dCBpZiBuZWVkZWQgSSBjYW4gc2VuZCB0aGUgc3RhY2t0cmFj
ZSB0b21vcnJvdy4KCi0tClNhbmRlcgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L3hlbi1kZXZlbA==
