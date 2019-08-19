Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BFEC791E8B
	for <lists+xen-devel@lfdr.de>; Mon, 19 Aug 2019 10:04:05 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hzccH-0000v9-CG; Mon, 19 Aug 2019 08:02:13 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Zvmd=WP=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1hzccG-0000v0-Jz
 for xen-devel@lists.xenproject.org; Mon, 19 Aug 2019 08:02:12 +0000
X-Inumbo-ID: a61ca48e-c257-11e9-b90c-bc764e2007e4
Received: from mail-wr1-f44.google.com (unknown [209.85.221.44])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a61ca48e-c257-11e9-b90c-bc764e2007e4;
 Mon, 19 Aug 2019 08:02:12 +0000 (UTC)
Received: by mail-wr1-f44.google.com with SMTP id s18so7676032wrn.1
 for <xen-devel@lists.xenproject.org>; Mon, 19 Aug 2019 01:02:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=fkGzr4pzdzOHb01MaE5Q9lpfsESdclRwtINME2n3ejA=;
 b=L7zSyi8IvMOdfWp9h1oSieCBUABkWs9nCiyzlVzMzqE5beIPtp51JKMjyzUqsO+v5y
 2RqheZ/xuPIzthzBToCwZWcFTrHH6QpPwj7Akz0J4NAV4A4eSQLEou+QtGgryZtKGl70
 dZytu5yY5u93QQsY52Zm/hepPckFbU9l31H/x09+tpD3DuIm2L9QGBgQDeqG/3HGQPJV
 VEZZynlpqpqgqUY57AY0ufh72YbMn/Xijrq57cZ48fypGTnnNTYq4gaLdkgLauMXC3ac
 8NHfejUJDCHCW+K+ROknklIvaVl67sdICT8+Oarv6uHL7Px5IoWtJXxQtDxA3uneLeOa
 WINg==
X-Gm-Message-State: APjAAAWMz+1KpJ/WLsecfzkQTiWPReXXGjxO/fRL/++DtLi6vbkv9aNK
 jZoa4bd275IxpGn4oK4je5E=
X-Google-Smtp-Source: APXvYqwfmw8tq2L9w38PU2W+YqQS0+dxhMD4/xAVHNB+B5zJG55oJmJfw2WrPdhR2lyJvM4axVXLwg==
X-Received: by 2002:adf:e50b:: with SMTP id j11mr25416822wrm.65.1566201731415; 
 Mon, 19 Aug 2019 01:02:11 -0700 (PDT)
Received: from
 liuwe-gateway.j3c5onc20sse1dnehy4noqpfcg.zx.internal.cloudapp.net
 ([51.140.50.101])
 by smtp.gmail.com with ESMTPSA id c1sm10165916wmc.40.2019.08.19.01.02.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Aug 2019 01:02:11 -0700 (PDT)
Date: Mon, 19 Aug 2019 08:02:09 +0000
From: Wei Liu <wl@xen.org>
To: Olaf Hering <olaf@aepfle.de>
Message-ID: <20190819080209.ipkvo3jnxejlnm4r@liuwe-gateway.j3c5onc20sse1dnehy4noqpfcg.zx.internal.cloudapp.net>
References: <20190621093005.29329-1-olaf@aepfle.de>
 <20190818172026.25jeivjl7gpydynh@debian>
 <20190819095717.707845d0.olaf@aepfle.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190819095717.707845d0.olaf@aepfle.de>
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

T24gTW9uLCBBdWcgMTksIDIwMTkgYXQgMDk6NTc6MTdBTSArMDIwMCwgT2xhZiBIZXJpbmcgd3Jv
dGU6Cj4gQW0gU3VuLCAxOCBBdWcgMjAxOSAxODoyMDoyNiArMDEwMAo+IHNjaHJpZWIgV2VpIExp
dSA8d2xAeGVuLm9yZz46Cj4gCj4gPiBUaGlzIGRvZXNuJ3QgYXBwbHkuIFRoZXJlIGlzIG5vIHN1
Y2ggZmlsZS4KPiAKPiBNeSBjaGFuZ2VzIG5lZWQgdG8gYmUgYXBwbGllZCBpbiB0aGlzIG9yZGVy
LCBzb21lIG9mIHRoZW0gbWF5IGFwcGx5IGluIGFueSBvcmRlcjoKPiAKPiAyMDE5MDYxOTEyMDYz
My4yNzQ2Ni0xLW9sYWZAYWVwZmxlLmRlCj4gMjAxOTA2MTkxMjE3MTUuMjg1MzItMS1vbGFmQGFl
cGZsZS5kZQo+IDIwMTkwNjE5MTIzODE4LjMwNzQ3LTEtb2xhZkBhZXBmbGUuZGUKPiAyMDE5MDYx
OTEzMDMzNS4zNDU4LTEtb2xhZkBhZXBmbGUuZGUKPiAyMDE5MDYyMTA5Mjk0NC4yOTI0MS0xLW9s
YWZAYWVwZmxlLmRlCj4gMjAxOTA2MjEwOTMwMDUuMjkzMjktMS1vbGFmQGFlcGZsZS5kZQoKVGhh
bmtzLiBJIHdpbGwgdGFrZSBhIGxvb2suCgpXZWkuCgo+IAo+IAo+IE9sYWYKCgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcg
bGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9q
ZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
