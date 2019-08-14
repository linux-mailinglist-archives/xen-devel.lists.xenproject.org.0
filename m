Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D65A48D0D8
	for <lists+xen-devel@lfdr.de>; Wed, 14 Aug 2019 12:40:29 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hxqfX-0007NP-NH; Wed, 14 Aug 2019 10:38:15 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=5qws=WK=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1hxqfV-0007NC-VV
 for xen-devel@lists.xenproject.org; Wed, 14 Aug 2019 10:38:14 +0000
X-Inumbo-ID: 9c63faf4-be7f-11e9-acbf-6fea119af870
Received: from mail-wr1-f68.google.com (unknown [209.85.221.68])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 9c63faf4-be7f-11e9-acbf-6fea119af870;
 Wed, 14 Aug 2019 10:38:11 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id t16so20491088wra.6
 for <xen-devel@lists.xenproject.org>; Wed, 14 Aug 2019 03:38:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=OR9l2PeWH1KJQfLZZEfmRxLKr1JOXMhDcsgJirTywn0=;
 b=V1wKgfuu3kq5/7GpMMdubf+BLtqlCpLaOS3rTc7IunLmSiyeZnBVZ4ZairKxH+0eep
 aYy3fK/IAUgiRYVUnrVCy2VaWusmeCJUmtyyIPA+uKaY/xm0vq6U6DAULeegdtxrh4YL
 7to/r8L3Hgc5SHKPFlzj6upOhOOs4cyxf7+zKhHusZcwHg474qvyQJBHJR49lYylhPQV
 mpBX+YoGADc/TuETxkTjxvGBvvldelAg0kL30bpgjBQnoWPwA+Qa8TJCRA+SP/thARWY
 vacK1eHB4xs1hZiGxEFMsWwx1vFZOiBqozJ/95/GKMo0EWtXAQwcMK0wKSw1lOgsBD8Z
 ahdQ==
X-Gm-Message-State: APjAAAW+DF1AKur9jNzUICD9O4NHU9OTZAXOGLAWkdqQ2KD771relx2h
 x1IRYK1blRjfBTIFOtaYWKdj3FPsvts=
X-Google-Smtp-Source: APXvYqxLVl3zm1D2Dm7CMRWnBXIEQ+T6emhTD1if2USJ+89XYO5PMslADGyL+81Rpz1HIzv8c5jN/A==
X-Received: by 2002:adf:fc03:: with SMTP id i3mr26517196wrr.48.1565779090316; 
 Wed, 14 Aug 2019 03:38:10 -0700 (PDT)
Received: from
 liuwe-gateway.j3c5onc20sse1dnehy4noqpfcg.zx.internal.cloudapp.net
 ([51.140.50.101])
 by smtp.gmail.com with ESMTPSA id v3sm13780157wrq.34.2019.08.14.03.38.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Aug 2019 03:38:09 -0700 (PDT)
Date: Wed, 14 Aug 2019 10:38:08 +0000
From: Wei Liu <wl@xen.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <20190814103808.oickny5tu62mrswo@liuwe-gateway.j3c5onc20sse1dnehy4noqpfcg.zx.internal.cloudapp.net>
References: <20190813135211.13668-1-andrew.cooper3@citrix.com>
 <20190813142128.18551-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190813142128.18551-1-andrew.cooper3@citrix.com>
User-Agent: NeoMutt/20180716
Subject: Re: [Xen-devel] [PATCH 2/1] toos/xenstat: Fix -Wunused-function
 issue
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
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>,
 Ian Jackson <Ian.Jackson@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVHVlLCBBdWcgMTMsIDIwMTkgYXQgMDM6MjE6MjhQTSArMDEwMCwgQW5kcmV3IENvb3BlciB3
cm90ZToKPiBXaGVuIGNvbXBpbGluZyB4ZW5zdGF0IHdpdGggLVdlcnJvciwgQ2xhbmcgY29tcGxh
aW5zOgo+IAo+ICAgc3JjL3hlbnN0YXQuYzoxMzQ6MzQ6IGVycm9yOiB1bnVzZWQgZnVuY3Rpb24g
J3BhcnNlJyBbLVdlcnJvciwtV3VudXNlZC1mdW5jdGlvbl0KPiAgIHN0YXRpYyBpbmxpbmUgdW5z
aWduZWQgbG9uZyBsb25nIHBhcnNlKGNoYXIgKnMsIGNoYXIgKm1hdGNoKQo+ICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgXgo+ICAgMSBlcnJvciBnZW5lcmF0ZWQuCj4gCj4gRHJv
cCB0aGUgZnVuY3Rpb24uICBJdCByZWFsbHkgaXMgdW51c2VkLgo+IAo+IFNwb3R0ZWQgYnkgVHJh
dmlzLUNJLgo+IAo+IFNpZ25lZC1vZmYtYnk6IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIz
QGNpdHJpeC5jb20+CgpBY2tlZC1ieTogV2VpIExpdSA8d2xAeGVuLm9yZz4KCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxp
c3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVj
dC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
