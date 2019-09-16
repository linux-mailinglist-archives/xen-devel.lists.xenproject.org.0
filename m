Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EE98BB37E1
	for <lists+xen-devel@lfdr.de>; Mon, 16 Sep 2019 12:16:40 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i9nzo-00085S-SS; Mon, 16 Sep 2019 10:12:36 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=bDyh=XL=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1i9nzn-00085J-KX
 for xen-devel@lists.xenproject.org; Mon, 16 Sep 2019 10:12:35 +0000
X-Inumbo-ID: 80749650-d86a-11e9-a337-bc764e2007e4
Received: from mail-wr1-f66.google.com (unknown [209.85.221.66])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 80749650-d86a-11e9-a337-bc764e2007e4;
 Mon, 16 Sep 2019 10:12:34 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id i1so37642257wro.4
 for <xen-devel@lists.xenproject.org>; Mon, 16 Sep 2019 03:12:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=1DBt7w3PEhEyPg/wu1FQjuAbqUD0ZgP03yXuKtqKh6U=;
 b=eDxKwwXhVOkqCjX2ASmVyBVPHDRYg0fwXCw1fnJ0SMPH+7FdJ4K/xqy0hfFJL14QEA
 lP2ZDUSCL3H1Ls01fxuvw4o+CMGFiP03uTqi+2FOC0a09Tm/T8QeH8eGpGjsCLnQOD4p
 kPKT3UBFUzrFhP4lEo6F0OJJ5SccSa8HtU6YxZ8zJC/ZKr1EGt2hR/EpTNaPTIzUrr7T
 iophgUEyTJGpX1AAw2iKJDa5MpbFxM2kLT/RCrxMvHjNRTtHGUokP4GGD63tvTrRDUeK
 L2ObDdnEb36hJdnbqeHg2uxpL01RR9oKGZ2LvQuC7RDFyStG6o99TesaiklBZSwHszH+
 23yw==
X-Gm-Message-State: APjAAAViZwNYzRqVkwafff2Hfy7fza3/161uStaN0ukNcLX1hqOtcIrG
 tJ9T1pdLfx5lCkcHWKfN5oI=
X-Google-Smtp-Source: APXvYqz1Wiz/1a/OdOid4xmEksJ1G/XVnHztQT4vHr6k8mR740O5ytp9wPaQssK58vYtF+XR3SPyDA==
X-Received: by 2002:a5d:63c6:: with SMTP id c6mr8290335wrw.117.1568628754208; 
 Mon, 16 Sep 2019 03:12:34 -0700 (PDT)
Received: from
 liuwe-gateway.j3c5onc20sse1dnehy4noqpfcg.zx.internal.cloudapp.net
 ([51.140.50.101])
 by smtp.gmail.com with ESMTPSA id e17sm7238962wma.15.2019.09.16.03.12.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Sep 2019 03:12:33 -0700 (PDT)
Date: Mon, 16 Sep 2019 10:12:32 +0000
From: Wei Liu <wl@xen.org>
To: Juergen Gross <jgross@suse.com>
Message-ID: <20190916101232.fqtcpyvzerrrkeli@liuwe-gateway.j3c5onc20sse1dnehy4noqpfcg.zx.internal.cloudapp.net>
References: <20190906124103.8535-1-jgross@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190906124103.8535-1-jgross@suse.com>
User-Agent: NeoMutt/20180716
Subject: Re: [Xen-devel] [PATCH v2] tools/libs: put common Makefile parts
 into new libs.mk
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

T24gRnJpLCBTZXAgMDYsIDIwMTkgYXQgMDI6NDE6MDNQTSArMDIwMCwgSnVlcmdlbiBHcm9zcyB3
cm90ZToKPiBUaGUgTWFrZWZpbGUgYmVsb3cgdG9vbHMvbGlicyBoYXZlIGEgbG90IGluIGNvbW1v
bi4gUHV0IHRob3NlIGNvbW1vbgo+IHBhcnRzIGludG8gYSBuZXcgbGlicy5tayBhbmQgaW5jbHVk
ZSB0aGF0IGZyb20gdGhlIHNwZWNpZmljIE1ha2VmaWxlcy4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBK
dWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+Cj4gLS0tCj4gVjI6Cj4gLSBpbmNsdWRlIGNv
bW1vbiBNYWtlZmlsZSB2aWEgYWJzb2x1dGUgcGF0aCBmb3Igbm90IGJyZWFraW5nIHN0dWJkb20K
Ck9oLCB2MiBpcyBoZXJlLiBJIHRoaW5rIHJlZHVjaW5nIHJlcGV0aXRpdmVuZXNzIGlzIGEgZ29v
ZCB0aGluZyBpbgpnZW5lcmFsLCBzbyBteSBhY2sgc3RpbGwgc3RhbmRzLgoKV2VpLgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxp
bmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5w
cm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
