Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 70B461245B3
	for <lists+xen-devel@lfdr.de>; Wed, 18 Dec 2019 12:24:00 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ihXNx-0000Vx-SD; Wed, 18 Dec 2019 11:20:57 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=8BSL=2I=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1ihXNw-0000Vs-Gt
 for xen-devel@lists.xenproject.org; Wed, 18 Dec 2019 11:20:56 +0000
X-Inumbo-ID: 74c0ca10-2188-11ea-9060-12813bfff9fa
Received: from mail-wm1-f66.google.com (unknown [209.85.128.66])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 74c0ca10-2188-11ea-9060-12813bfff9fa;
 Wed, 18 Dec 2019 11:20:55 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id d73so1423695wmd.1
 for <xen-devel@lists.xenproject.org>; Wed, 18 Dec 2019 03:20:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=Kk9FmmHlW0myi0lUEHnbCFXHdntIzUpijqseJ4yXXY0=;
 b=hWjUu+3/X5rxTfgEeymWs5X9duTCDdtpXQa5H19SnMo9zRFH4Wvzm5cfCoab5kl7L0
 huB+4iAHFzHYCcuYnxrtC3QwDHx8UCTJs8VtR7aq/xVAktgMJhHNh3ydGSvWuHspLr4J
 juVhycqeXGy1jcFM7SimEyrBjY095083YzzRspH5UujyeUO1JmxvsN7PcKCF/ylqoxGD
 UCB+9IXTqNIzMQr03H4MY4c4FPWq3qbQuYxSuNZ2BTu+8Ubvql5Q319+MmSBtOPMZd4Z
 CRzpK++ZBD+lUm4TSu/sIaEs/u9DPQyVynSEF09CPnYUKAwsQb53S8U4H0hN51zJFNNR
 zRLw==
X-Gm-Message-State: APjAAAXszjKaFIrKdnSihjpEKK2d7sgt2mtDk+2TEEFGO/hbme8avgyc
 UlCt8AizHX3ZclmwY45buAg=
X-Google-Smtp-Source: APXvYqxbSE2Q/jA/EYOsvhGW/Xy66mFNZB4mAVRD0ZmkQOYPLs38Qlb1evhW+LU4SWHu8WAZ9hOj1w==
X-Received: by 2002:a7b:c10f:: with SMTP id w15mr2530732wmi.69.1576668054317; 
 Wed, 18 Dec 2019 03:20:54 -0800 (PST)
Received: from debian (38.163.200.146.dyn.plus.net. [146.200.163.38])
 by smtp.gmail.com with ESMTPSA id q68sm2426969wme.14.2019.12.18.03.20.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Dec 2019 03:20:53 -0800 (PST)
Date: Wed, 18 Dec 2019 11:20:52 +0000
From: Wei Liu <wl@xen.org>
To: Steven Haigh <netwiz@crc.id.au>
Message-ID: <20191218112051.6msrlgtcomhxpndp@debian>
References: <35b942031521f25b63e60634ee86f1b52f504eb3.1576631444.git.netwiz@crc.id.au>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <35b942031521f25b63e60634ee86f1b52f504eb3.1576631444.git.netwiz@crc.id.au>
User-Agent: NeoMutt/20180716
Subject: Re: [Xen-devel] [PATCH] [tools/hotplug] Use ip on systems where
 brctl is not available
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

T24gV2VkLCBEZWMgMTgsIDIwMTkgYXQgMTI6MTU6MjNQTSArMTEwMCwgU3RldmVuIEhhaWdoIHdy
b3RlOgo+IE5ld2VyIGRpc3Ryb3MgbGlrZSBDZW50T1MgOCBkbyBub3QgaGF2ZSBicmN0bCBhdmFp
bGFibGUuIEFzIHN1Y2gsIHdlCj4gY2FuJ3QgdXNlIGl0IHRvIGNvbmZpZ3VyZSBuZXR3b3JraW5n
IGFueW1vcmUuCj4gCj4gVGhpcyBwYXRjaCB3aWxsIGZhbGwgYmFjayB0byAnaXAnIG9yICdicmlk
Z2UnIGNvbW1hbmRzIGlmIGJyY3RsIGlzIG5vdAo+IGF2YWlsYWJsZSBpbiB0aGUgd29ya2luZyBQ
QVRILgo+IAo+IFRoaXMgd291bGQgYmUgYSBsaWtlbHkgYmFja3BvcnQgY2FuZGlkYXRlIHRvIGFu
eSB2ZXJzaW9uIGV4cGVjdGVkIHRvIGJlCj4gYnVpbHQgb24gQ2VudE9TIDggZXRjLgoKQWNrZWQt
Ynk6IFdlaSBMaXUgPHdsQHhlbi5vcmc+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVs
