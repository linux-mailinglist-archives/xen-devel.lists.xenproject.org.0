Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C16512FBB3
	for <lists+xen-devel@lfdr.de>; Fri,  3 Jan 2020 18:44:55 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1inQwu-000791-Ks; Fri, 03 Jan 2020 17:41:24 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=fV2H=2Y=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1inQws-00078w-Vq
 for xen-devel@lists.xenproject.org; Fri, 03 Jan 2020 17:41:23 +0000
X-Inumbo-ID: 3cc689b8-2e50-11ea-a1e1-bc764e2007e4
Received: from mail-wm1-f67.google.com (unknown [209.85.128.67])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3cc689b8-2e50-11ea-a1e1-bc764e2007e4;
 Fri, 03 Jan 2020 17:41:14 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id m24so9041153wmc.3
 for <xen-devel@lists.xenproject.org>; Fri, 03 Jan 2020 09:41:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=o57qHIwuOC8IgfrIQ6htOqeAMBoD+iayzYaaOUxM3Ks=;
 b=HEjXJ4x85TxvzizdXV9ZGz3g/2vF0A9M1sgtieQD6QkUjsPSdK6j9lgodYpxObTli9
 y3XSvjVVrGyzEJaGi+1J6uxfwylS6kCW9mndW8occexYFjPxk3uQP5X9oUDxhAUnHjnu
 4jyUuWaVPmlJ/+ZEcKYn/ZJXQi8cQZYhuZ8zse6/Wphmjop3GJmIo4NG9jb1Jkhp9X8E
 zmmKDqX6u1Eyz/4knYyG3kIwkUugraSXPtvlVt2HGhADgNlYhBx9V6mCHuvolVov1+HH
 3Vcz+gc2mLShsUPdnchIHQLpM3WSnFJkyaRR5R3vVWrRJ/SlxcEK2CAIYfDVQpxdVO8A
 0bFQ==
X-Gm-Message-State: APjAAAWg8EzD/wcZ0WZr0iN3kOOf4JktA0Lr4XuI9UzmOOhcWlnVRbPK
 rXOuvU1G4Cr3hywdPKFeao4=
X-Google-Smtp-Source: APXvYqxb4vi3zFd3MiXsafXzRCXftYZmXGnv8SlyWojpCIEatzCezNDXoX7DLYaI6E59SPjp3V2inw==
X-Received: by 2002:a05:600c:24d1:: with SMTP id
 17mr20330819wmu.136.1578073273750; 
 Fri, 03 Jan 2020 09:41:13 -0800 (PST)
Received: from debian (38.163.200.146.dyn.plus.net. [146.200.163.38])
 by smtp.gmail.com with ESMTPSA id s19sm12704366wmj.33.2020.01.03.09.41.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Jan 2020 09:41:13 -0800 (PST)
Date: Fri, 3 Jan 2020 17:41:11 +0000
From: Wei Liu <wl@xen.org>
To: Roger Pau Monne <roger.pau@citrix.com>
Message-ID: <20200103174111.aupdxzfxepqlpmmj@debian>
References: <20200103172935.66137-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200103172935.66137-1-roger.pau@citrix.com>
User-Agent: NeoMutt/20180716
Subject: Re: [Xen-devel] [PATCH] tools/libxc: disable x2APIC when using
 nested virtualization
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

T24gRnJpLCBKYW4gMDMsIDIwMjAgYXQgMDY6Mjk6MzVQTSArMDEwMCwgUm9nZXIgUGF1IE1vbm5l
IHdyb3RlOgo+IFRoZXJlIGFyZSBpc3N1ZXMgKGFzIHJlcG9ydGVkIGJ5IG9zc3Rlc3QgWzBdKSB3
aGVuIFhlbiBpcyBydW5uaW5nCj4gbmVzdGVkIG9uIGl0c2VsZiBhbmQgdGhlIEwxIFhlbiBpcyB1
c2luZyB4MkFQSUMuIFdoaWxlIHRob3NlIGFyZSBiZWluZwo+IGludmVzdGlnYXRlZCwgZGlzYWJs
ZSBhbm5vdW5jaW5nIHRoZSB4MkFQSUMgZmVhdHVyZSBpbiBDUFVJRCB3aGVuCj4gbmVzdGVkIEhW
TSBtb2RlIGlzIGVuYWJsZWQuCj4gCj4gWzBdIGh0dHA6Ly9sb2dzLnRlc3QtbGFiLnhlbnByb2pl
Y3Qub3JnL29zc3Rlc3QvbG9ncy8xNDU1MDkvCgpQdXR0aW5nIGEgbGluayBoZXJlIGlzIHByb2Jh
Ymx5IG5vdCB2ZXJ5IHVzZWZ1bCBiZWNhdXNlIGl0IHdpbGwgYmUgZ29uZQppbiBubyB0aW1lLgoK
SWYgeW91IGhhdmUgc2VyaWFsIGxvZ3MgdGhhdCB3b3VsZCBiZSBncmVhdC4KCj4gCj4gU2lnbmVk
LW9mZi1ieTogUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+CgpBY2tlZC1i
eTogV2VpIExpdSA8d2xAeGVuLm9yZz4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5m
by94ZW4tZGV2ZWw=
