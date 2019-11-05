Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A3DE0EFC74
	for <lists+xen-devel@lfdr.de>; Tue,  5 Nov 2019 12:34:30 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iRx3z-0003kA-Vy; Tue, 05 Nov 2019 11:31:55 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=xSMy=Y5=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1iRx3z-0003k5-7V
 for xen-devel@lists.xenproject.org; Tue, 05 Nov 2019 11:31:55 +0000
X-Inumbo-ID: ddf623c6-ffbf-11e9-b678-bc764e2007e4
Received: from mail-wr1-f68.google.com (unknown [209.85.221.68])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ddf623c6-ffbf-11e9-b678-bc764e2007e4;
 Tue, 05 Nov 2019 11:31:54 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id f2so12016431wrs.11
 for <xen-devel@lists.xenproject.org>; Tue, 05 Nov 2019 03:31:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=X9so+sQVe5oy8+D/iGhpMfe5jIJBx/XSkmxCvdBFFnU=;
 b=BSjUw6vMm1CMP3EcxfPLoF8/90sP98PFAYin+SQdWkpPdA0M1wt7LRETQJssxYab50
 gxcTey6NTTDYqGjaUS2UJdK9MViYVsNMZHGbSR2imP8WjqAeB1bNxRaVSuZD+lEX455G
 ulmdO3lCoP1Et4cqYwnex6LFQeiXXdt2tJcqUOvj0YglBg9Kms7Re06KZxD4Jt6DGkHU
 mh6nYsbpRXFc8ylVxWJb9xYm0yrq3n24wQ6n1M5uqSOeldmtlRy7dwPNMUTgSBipjGIy
 vvaSYLNJv9Zbdxl5QwHgyMC0OUukPk0lbDgQ+tI7UMLM+5JTajERL8GqphUmxTYgGKhp
 ++Nw==
X-Gm-Message-State: APjAAAUuO9xBZViWz0+T8qyxh8CJq6x5KIWbl+NLPpdWpRA0tFzbcreF
 CDZ94ULkqmexIWDrQULduDs=
X-Google-Smtp-Source: APXvYqzXGFBKeCAjVI6T3qqzdQFpo5C/0n9pC1EzWUdK7Ledvn3PRlFpaXzbkU380eiE3C3bo14GMQ==
X-Received: by 2002:a5d:4a06:: with SMTP id m6mr9789805wrq.162.1572953513647; 
 Tue, 05 Nov 2019 03:31:53 -0800 (PST)
Received: from debian (108.162.147.147.dyn.plus.net. [147.147.162.108])
 by smtp.gmail.com with ESMTPSA id t185sm28354577wmf.45.2019.11.05.03.31.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Nov 2019 03:31:53 -0800 (PST)
Date: Tue, 5 Nov 2019 11:31:51 +0000
From: Wei Liu <wl@xen.org>
To: Anthony PERARD <anthony.perard@citrix.com>
Message-ID: <20191105113151.ylzj7j56li5ilhfe@debian>
References: <20191104153047.568013-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191104153047.568013-1-anthony.perard@citrix.com>
User-Agent: NeoMutt/20180716
Subject: Re: [Xen-devel] [XEN PATCH for-4.13] libxl: Fix setting vncpasswd
 to empty string
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
Cc: =?utf-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>,
 xen-devel@lists.xenproject.org, Ian Jackson <ian.jackson@eu.citrix.com>,
 Wei Liu <wl@xen.org>, Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gTW9uLCBOb3YgMDQsIDIwMTkgYXQgMDM6MzA6NDdQTSArMDAwMCwgQW50aG9ueSBQRVJBUkQg
d3JvdGU6Cj4gQmVmb3JlIDkzZGNjMjIsIGVycm9yIGZyb20gc2V0dGluZyB0aGUgdm5jIHBhc3N3
b3JkIHRvIGFuIGVtcHR5Cj4gc3RyaW5nLCB3aGVuIFFFTVUgd2Fzbid0IGV4cGVjdGVkIGEgcGFz
c3dvcmQsIG5ldmVyIHByZXZlbnRlZCB0aGUgY3JlYXRpb24KPiBvZiBhIGd1ZXN0LCBhbmQgb25s
eSBsb2dnZWQgYW4gZXJyb3IgbWVzc2FnZS4KPiAKPiBSZXBvcnRlZC1ieTogUm9nZXIgUGF1IE1v
bm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+Cj4gRml4ZXM6IDkzZGNjMjJmZTc5OGM5ZmE1Y2Ux
MTdmMWVkNmRiMGQ4YmQ3NzkwMjAKPiBTaWduZWQtb2ZmLWJ5OiBBbnRob255IFBFUkFSRCA8YW50
aG9ueS5wZXJhcmRAY2l0cml4LmNvbT4KCkFja2VkLWJ5OiBXZWkgTGl1IDx3bEB4ZW4ub3JnPgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
