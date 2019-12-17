Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F2EF1123032
	for <lists+xen-devel@lfdr.de>; Tue, 17 Dec 2019 16:25:13 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ihEgm-0001KS-Gh; Tue, 17 Dec 2019 15:23:08 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=J1Kd=2H=gmail.com=wei.liu.linux@srs-us1.protection.inumbo.net>)
 id 1ihEgk-0001KI-Nl
 for xen-devel@lists.xenproject.org; Tue, 17 Dec 2019 15:23:06 +0000
X-Inumbo-ID: 1e90be9b-20e1-11ea-8ef8-12813bfff9fa
Received: from mail-wr1-f65.google.com (unknown [209.85.221.65])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1e90be9b-20e1-11ea-8ef8-12813bfff9fa;
 Tue, 17 Dec 2019 15:23:05 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id t2so11771397wrr.1
 for <xen-devel@lists.xenproject.org>; Tue, 17 Dec 2019 07:23:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=b3WyKVkMgpCH/40qULLwIPwhylmii2eDFQ3btP1Ui98=;
 b=PhwNXoJMRZeBJBkuee33rDznP36WQYEJw8WMlTMjgdEwkA+bax3dPVufuvtYZo4nD+
 C3iLmquPm89BbLnPQbysKjigqtZppV48QVZdVOzydahy0Miiu4cSs3J2+TuVTelv7ago
 cnLMytCL+Vp5rWcK5/WWlxwmj3pXe3+xdjtxzedLQY5c3jjJiDUQQJmPJzoH7dQqo7V2
 FUF/phalJeQ0acLnFoFN1WwnVyNYfmplWnz4OTaduVUuxJdKi1n8EqbDCUKWFX8e7ZK9
 Z3wMl9NXS8bEPlo1cuaDcLKTUSoHfoJO+SpIZ39lndVm5O+TcyM2LQ7UUHYyTVszmrho
 xTKg==
X-Gm-Message-State: APjAAAVAyjiqA12xBCf1h7ESA0WqMO86rl03Q/g+b1P9cq+cEamxPAAz
 mLJ2dKNvBoFrSmjSrKVVJtI=
X-Google-Smtp-Source: APXvYqzMPuGW1YTYUDf7FTtAnzKOABQxNzRUjTLlFXNh8Hu1qA5HED1iFEzMQpFh8aO9yV6cPWvN2Q==
X-Received: by 2002:a5d:6a8e:: with SMTP id s14mr38758076wru.150.1576596184766; 
 Tue, 17 Dec 2019 07:23:04 -0800 (PST)
Received: from debian (38.163.200.146.dyn.plus.net. [146.200.163.38])
 by smtp.gmail.com with ESMTPSA id o66sm3465489wmo.20.2019.12.17.07.23.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Dec 2019 07:23:04 -0800 (PST)
Date: Tue, 17 Dec 2019 15:23:02 +0000
From: Wei Liu <wei.liu@kernel.org>
To: Paul Durrant <pdurrant@amazon.com>
Message-ID: <20191217152302.i4fp62mevawabwjd@debian>
References: <20191217133218.27085-1-pdurrant@amazon.com>
 <20191217133218.27085-4-pdurrant@amazon.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191217133218.27085-4-pdurrant@amazon.com>
User-Agent: NeoMutt/20180716
Subject: Re: [Xen-devel] [PATCH net-next 3/3] xen-netback: remove
 'hotplug-status' once it has served its purpose
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
Cc: Wei Liu <wei.liu@kernel.org>, Paul Durrant <paul@xen.org>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 xen-devel@lists.xenproject.org, "David S. Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVHVlLCBEZWMgMTcsIDIwMTkgYXQgMDE6MzI6MThQTSArMDAwMCwgUGF1bCBEdXJyYW50IHdy
b3RlOgo+IFJlbW92aW5nIHRoZSAnaG90cGx1Zy1zdGF0dXMnIG5vZGUgaW4gbmV0YmFja19yZW1v
dmUoKSBpcyB3cm9uZzsgdGhlIHNjcmlwdAo+IG1heSBub3QgaGF2ZSBjb21wbGV0ZWQuIE9ubHkg
cmVtb3ZlIHRoZSBub2RlIG9uY2UgdGhlIHdhdGNoIGhhcyBmaXJlZCBhbmQKPiBoYXMgYmVlbiB1
bnJlZ2lzdGVyZWQuCj4gCj4gU2lnbmVkLW9mZi1ieTogUGF1bCBEdXJyYW50IDxwZHVycmFudEBh
bWF6b24uY29tPgoKQWNrZWQtYnk6IFdlaSBMaXUgPHdlaS5saXVAa2VybmVsLm9yZz4KCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWls
aW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVu
cHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
