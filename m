Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9365310C6D2
	for <lists+xen-devel@lfdr.de>; Thu, 28 Nov 2019 11:37:09 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iaH85-0000ps-UJ; Thu, 28 Nov 2019 10:34:33 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=C34r=ZU=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1iaH84-0000pn-IH
 for xen-devel@lists.xenproject.org; Thu, 28 Nov 2019 10:34:32 +0000
X-Inumbo-ID: a9a76d42-11ca-11ea-9db0-bc764e2007e4
Received: from mail-wm1-f67.google.com (unknown [209.85.128.67])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a9a76d42-11ca-11ea-9db0-bc764e2007e4;
 Thu, 28 Nov 2019 10:34:32 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id g206so10415567wme.1
 for <xen-devel@lists.xenproject.org>; Thu, 28 Nov 2019 02:34:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=ZmSxAesmMDVBSIl7IaIeyq6d3t4hoLsiOYLQsAHuuEc=;
 b=JQbR4B17QK6ofuUsBW8Dti8BSq7K1aAY7UCWcEYa+RVuJihwAmiy1QHf1+2J7mIC9J
 UywvKgDBEbbaHcZ5pAh665yBjmI06adEORR7r5KzsM190Ev0p2UgcALIXJ/8JFU9irsD
 a11MH/PUgR7Fgh4FGrtTeuZS0R3ZTqrM9pwHKAjMellqkpI2qqbP/E890eLMnMcsnYNH
 fWKaBpa2XbsebT6xNePdHln2mWTsgukUMyUHL77hLval72gxNuVe4Yw60eQEd9dIlJmU
 N60/NQHqnanKERUX84u26/KcROh9mkVnCnSiIKCtZau2ter5cyTfEwDUGvTClEEL6RBz
 YyNQ==
X-Gm-Message-State: APjAAAXxi0iMwRtuEFs1dLCNDwBjIYkBFEmoErZeTYsLOluFZ7+JNpnR
 2qd1UHvIKqt/AI+opJNpxzM=
X-Google-Smtp-Source: APXvYqx7Pnv9pvs6jRGZgExIlM1Glpz2wVCLmqxB3nLc98NjlkdqueC0rFSchbHvJjzutyJ8Sf192Q==
X-Received: by 2002:a1c:b7c4:: with SMTP id h187mr3142905wmf.105.1574937271181; 
 Thu, 28 Nov 2019 02:34:31 -0800 (PST)
Received: from debian (122.163.200.146.dyn.plus.net. [146.200.163.122])
 by smtp.gmail.com with ESMTPSA id s19sm5647304wmc.4.2019.11.28.02.34.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Nov 2019 02:34:30 -0800 (PST)
Date: Thu, 28 Nov 2019 10:34:29 +0000
From: Wei Liu <wl@xen.org>
To: =?utf-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <20191128103429.27pr4mbmlxdsjb63@debian>
References: <20191128022458.4428-1-sstabellini@kernel.org>
 <20191128101505.fo7slsccphjr3qih@debian>
 <a2d324a4-5501-f654-d95a-a05a3f636f4f@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <a2d324a4-5501-f654-d95a-a05a3f636f4f@suse.com>
User-Agent: NeoMutt/20180716
Subject: Re: [Xen-devel] [PATCH] tools/arm: include xen-tools/libs.h from
 libxl_arm_acpi.c
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, julien@xen.org,
 Wei Liu <wl@xen.org>, ian.jackson@eu.citrix.com, anthony.perard@citrix.com,
 xen-devel@lists.xenproject.org,
 Stefano Stabellini <stefano.stabellini@xilinx.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVGh1LCBOb3YgMjgsIDIwMTkgYXQgMTE6MzA6MzRBTSArMDEwMCwgSsO8cmdlbiBHcm/DnyB3
cm90ZToKPiBPbiAyOC4xMS4xOSAxMToxNSwgV2VpIExpdSB3cm90ZToKPiA+IE9uIFdlZCwgTm92
IDI3LCAyMDE5IGF0IDA2OjI0OjU4UE0gLTA4MDAsIFN0ZWZhbm8gU3RhYmVsbGluaSB3cm90ZToK
PiA+ID4gbGlieGxfYXJtX2FjcGkuYyBpcyB1c2luZyBCVUlMRF9CVUdfT04gYnV0IGl0IGlzIG5v
dCBpbmNsdWRpbmcKPiA+ID4geGVuLXRvb2xzL2xpYnMuaCB0aGF0IGRlZmluZXMgaXQuCj4gPiA+
IAo+ID4gPiBTaWduZWQtb2ZmLWJ5OiBTdGVmYW5vIFN0YWJlbGxpbmkgPHN0ZWZhbm8uc3RhYmVs
bGluaUB4aWxpbnguY29tPgo+ID4gCj4gPiBBY2tlZC1ieTogV2VpIExpdSA8d2xAeGVuLm9yZz4K
PiA+IAo+ID4gSnVlcmdlbiwgdGhpcyBpcyBhIHRyaXZpYWwgcGF0Y2guIEkgdGhpbmsgaXQgY2Fu
IGdvIGluIDQuMTMuCj4gCj4gV2h5IGlzIHRoaXMgcGF0Y2ggbmVlZGVkPwo+IAo+IHRvb2xzL2xp
YnhsL2xpYnhsX2FybV9hY3BpLmMgaW5jbHVkZXMgbGlieGxfYXJtLmgsIHdoaWNoIGluY2x1ZGVz
Cj4gbGlieGxfaW50ZXJuYWwuaCwgd2hpY2ggaW5jbHVkZXMgeGVuLXRvb2xzL2xpYnMuaC4KCk9o
IEkgbWlzc2VkIHRoYXQuCgpJbiB0aGF0IGNhc2UgSSBkb24ndCB0aGluayB0aGlzIHBhdGNoIGlz
IHJlcXVpcmVkIGZvciA0LjEzLgoKU3RlZmFubywgZGlkIHlvdSBzZWUgYSBidWlsZCBlcnJvciBv
ciBzb21ldGhpbmc/CgpXZWkuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVu
LWRldmVs
