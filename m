Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AB4431251F5
	for <lists+xen-devel@lfdr.de>; Wed, 18 Dec 2019 20:34:45 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ihf2a-0006jS-GS; Wed, 18 Dec 2019 19:31:24 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=8BSL=2I=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1ihf2Z-0006jN-AT
 for xen-devel@lists.xenproject.org; Wed, 18 Dec 2019 19:31:23 +0000
X-Inumbo-ID: f8d4c60a-21cc-11ea-90f1-12813bfff9fa
Received: from mail-wm1-f67.google.com (unknown [209.85.128.67])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f8d4c60a-21cc-11ea-90f1-12813bfff9fa;
 Wed, 18 Dec 2019 19:31:22 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id 20so3074206wmj.4
 for <xen-devel@lists.xenproject.org>; Wed, 18 Dec 2019 11:31:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=XaHgiJECCyLtFj4grj+m/0tN5Zx4i1rGP2rlxZGX0s8=;
 b=PKpES+BzOzCUjCJd51tjhPHAZTEUon03uGVv+hMnx7iPTEtFHRTGfimvi5BSH67vsc
 sRphkD41V7et3LPviy9D4F2/g2CcEdp2lH9SkYSzcaHoBmLZQoVQzyqzk+vTEWgmo2sR
 VFMIx+jIAA4VDO4G04mko1n9R4OGYgrNOG6/koF9WBTUvT3GAo2JUn4SDei9DGarUw/s
 PQve7tkfaM0QANRLYpJ3QU/yx8Z6MUx+WsJd9+ZaxS8XvdMHr+6UT4NnLe+MMlLIbz3k
 lpov0/iaptZtE9jNwrIBIJHQQ833Om+HJ/+996oP2DvwHfd/8pBI75jJVQ0VahrE1rAs
 7j7g==
X-Gm-Message-State: APjAAAWKPDh6Rk0Ep0QBemy+GiRaWnzJvQx1nIr+YzUHfbPU28lhvaHF
 qMHhIaSrBsE3DHR7z5Eg49Q=
X-Google-Smtp-Source: APXvYqyaxttD1vVeJrqzkOZUa60omZkeAQAacFwD8UtRQKnpxcM2Q6baPdx1OIFZJ2f/NqF3dGu09Q==
X-Received: by 2002:a7b:c7d4:: with SMTP id z20mr5571077wmk.42.1576697481711; 
 Wed, 18 Dec 2019 11:31:21 -0800 (PST)
Received: from debian (38.163.200.146.dyn.plus.net. [146.200.163.38])
 by smtp.gmail.com with ESMTPSA id q8sm3411507wmq.3.2019.12.18.11.31.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Dec 2019 11:31:21 -0800 (PST)
Date: Wed, 18 Dec 2019 19:31:19 +0000
From: Wei Liu <wl@xen.org>
To: Paul Durrant <pdurrant@amazon.com>
Message-ID: <20191218193119.mdl7vfu6ishbbjos@debian>
References: <20191218160926.12538-1-pdurrant@amazon.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191218160926.12538-1-pdurrant@amazon.com>
User-Agent: NeoMutt/20180716
Subject: Re: [Xen-devel] [PATCH] x86/save: reserve HVM save record numbers
 that have been consumed...
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
Cc: xen-devel@lists.xenproject.org,
 Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
 Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gV2VkLCBEZWMgMTgsIDIwMTkgYXQgMDQ6MDk6MjVQTSArMDAwMCwgUGF1bCBEdXJyYW50IHdy
b3RlOgo+IC4uLmZvciBwYXRjaGVzIG5vdCAoeWV0KSB1cHN0cmVhbS4KPiAKPiBUaGlzIHBhdGNo
IGlzIHNpbXBseSByZXNlcnZpbmcgc2F2ZSByZWNvcmQgbnVtYmVyIHNwYWNlIHRvIGF2b2lkIHRo
ZQo+IHJpc2sgb2YgY2xhc2hlcyBiZXR3ZWVuIGV4aXN0ZW50IGRvd25zdHJlYW0gY2hhbmdlcyBt
YWRlIGJ5IEFtYXpvbiBhbmQKPiBmdXR1cmUgdXBzdHJlYW0gY2hhbmdlcyB3aGljaCBtYXkgYmUg
aW5jb21wYXRpYmxlLgo+IAo+IFNpZ25lZC1vZmYtYnk6IFBhdWwgRHVycmFudCA8cGR1cnJhbnRA
YW1hem9uLmNvbT4KClJldmlld2VkLWJ5OiBXZWkgTGl1IDx3bEB4ZW4ub3JnPgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcg
bGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9q
ZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
