Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B610D10C682
	for <lists+xen-devel@lfdr.de>; Thu, 28 Nov 2019 11:17:02 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iaGpK-00066X-Pc; Thu, 28 Nov 2019 10:15:10 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=C34r=ZU=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1iaGpI-00066S-VZ
 for xen-devel@lists.xenproject.org; Thu, 28 Nov 2019 10:15:09 +0000
X-Inumbo-ID: f3f475c8-11c7-11ea-a3cd-12813bfff9fa
Received: from mail-wm1-f68.google.com (unknown [209.85.128.68])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f3f475c8-11c7-11ea-a3cd-12813bfff9fa;
 Thu, 28 Nov 2019 10:15:08 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id n5so11035255wmc.0
 for <xen-devel@lists.xenproject.org>; Thu, 28 Nov 2019 02:15:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=ZD8cTDfc/cmlhIGQltCPiGE0nYH+Uc1k5nbo6tJEB9w=;
 b=gOmfk804lb/zLcw39v1HMTBKiyzpBYS0wGBDlnZq7z2/k7ONKSwIf+95PWEN/4B74F
 mERwgskgprqzKiWEQ2cDUyarsqDLS0VcokjEm0KK0wpYrHCGWMMU2jkLzGIR3owN+SQT
 jPyP5pdZpDNiC2Z09sm8K6ZtP+S2nZhhXLde4e4NXVld87ZvH1xExWnPVSxDkJu1r15z
 WkvMMKUYBBz273Wos9GC1bKsqLsW4I+ZbsewXHCObMuykn94JxU0bhyDesCit9Oo7W6i
 +5UknpXJgaNqseRvPl/u7D1/czSrJyv8vx2A5kkQigeMQYeLT1jxbPXMRL9BDTnAIG3y
 /i1Q==
X-Gm-Message-State: APjAAAW1p4ec306HCDXa25jwBkHe5O9hYOj5U1ykiCgYAORpMPZsJZUQ
 XmNeFPh1k9uj7KBpPkykvIg=
X-Google-Smtp-Source: APXvYqz+5/pCAQ7skkarCM9QuJSROxbcU+R6d2kCdKUnqUUqj2+fBXo821vrQ/1K0iR4pwYIRl+Mmg==
X-Received: by 2002:a05:600c:218e:: with SMTP id
 e14mr8280454wme.22.1574936107347; 
 Thu, 28 Nov 2019 02:15:07 -0800 (PST)
Received: from debian (122.163.200.146.dyn.plus.net. [146.200.163.122])
 by smtp.gmail.com with ESMTPSA id z6sm23741732wro.18.2019.11.28.02.15.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Nov 2019 02:15:06 -0800 (PST)
Date: Thu, 28 Nov 2019 10:15:05 +0000
From: Wei Liu <wl@xen.org>
To: Stefano Stabellini <sstabellini@kernel.org>
Message-ID: <20191128101505.fo7slsccphjr3qih@debian>
References: <20191128022458.4428-1-sstabellini@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191128022458.4428-1-sstabellini@kernel.org>
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
Cc: Juergen Gross <jgross@suse.com>, julien@xen.org, wl@xen.org,
 ian.jackson@eu.citrix.com, anthony.perard@citrix.com,
 xen-devel@lists.xenproject.org,
 Stefano Stabellini <stefano.stabellini@xilinx.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gV2VkLCBOb3YgMjcsIDIwMTkgYXQgMDY6MjQ6NThQTSAtMDgwMCwgU3RlZmFubyBTdGFiZWxs
aW5pIHdyb3RlOgo+IGxpYnhsX2FybV9hY3BpLmMgaXMgdXNpbmcgQlVJTERfQlVHX09OIGJ1dCBp
dCBpcyBub3QgaW5jbHVkaW5nCj4geGVuLXRvb2xzL2xpYnMuaCB0aGF0IGRlZmluZXMgaXQuCj4g
Cj4gU2lnbmVkLW9mZi1ieTogU3RlZmFubyBTdGFiZWxsaW5pIDxzdGVmYW5vLnN0YWJlbGxpbmlA
eGlsaW54LmNvbT4KCkFja2VkLWJ5OiBXZWkgTGl1IDx3bEB4ZW4ub3JnPgoKSnVlcmdlbiwgdGhp
cyBpcyBhIHRyaXZpYWwgcGF0Y2guIEkgdGhpbmsgaXQgY2FuIGdvIGluIDQuMTMuCgpXZWkuCgo+
IC0tLQo+ICB0b29scy9saWJ4bC9saWJ4bF9hcm1fYWNwaS5jIHwgMSArCj4gIDEgZmlsZSBjaGFu
Z2VkLCAxIGluc2VydGlvbigrKQo+IAo+IGRpZmYgLS1naXQgYS90b29scy9saWJ4bC9saWJ4bF9h
cm1fYWNwaS5jIGIvdG9vbHMvbGlieGwvbGlieGxfYXJtX2FjcGkuYwo+IGluZGV4IGJhODc0YzNk
MzIuLjUyYzQ3NmZmNjUgMTAwNjQ0Cj4gLS0tIGEvdG9vbHMvbGlieGwvbGlieGxfYXJtX2FjcGku
Ywo+ICsrKyBiL3Rvb2xzL2xpYnhsL2xpYnhsX2FybV9hY3BpLmMKPiBAQCAtMTksNiArMTksNyBA
QAo+ICAjaW5jbHVkZSAibGlieGxfYXJtLmgiCj4gIAo+ICAjaW5jbHVkZSA8c3RkaW50Lmg+Cj4g
KyNpbmNsdWRlIDx4ZW4tdG9vbHMvbGlicy5oPgo+ICAKPiAgLyogQmVsb3cgdHlwZWRlZnMgYXJl
IHVzZWZ1bCBmb3IgdGhlIGhlYWRlcnMgdW5kZXIgYWNwaS8gKi8KPiAgdHlwZWRlZiB1aW50OF90
IHU4Owo+IC0tIAo+IDIuMTcuMQo+IAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L3hlbi1kZXZlbA==
