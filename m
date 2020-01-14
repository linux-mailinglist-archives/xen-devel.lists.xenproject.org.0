Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BA3213A87C
	for <lists+xen-devel@lfdr.de>; Tue, 14 Jan 2020 12:35:19 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1irKQZ-00010f-9d; Tue, 14 Jan 2020 11:32:07 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=eDHu=3D=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1irKQX-00010Z-Oy
 for xen-devel@lists.xenproject.org; Tue, 14 Jan 2020 11:32:05 +0000
X-Inumbo-ID: 7cbb124a-36c1-11ea-837c-12813bfff9fa
Received: from mail-wr1-f65.google.com (unknown [209.85.221.65])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 7cbb124a-36c1-11ea-837c-12813bfff9fa;
 Tue, 14 Jan 2020 11:32:04 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id w15so11833402wru.4
 for <xen-devel@lists.xenproject.org>; Tue, 14 Jan 2020 03:32:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=f3ZR/eqExIghOVO1p9KrFBD+ozFTfgrGLxmDc2vBjI0=;
 b=g3CaeFOleTF08E3vwQoUaE5eu3oy7CvtYaT7EajTF7h2jy0JohIrxyjpUb03yKi5iw
 f4cIksjiaCJrFhnTXmB/PZFG+XQZ08Ta9qGqVZAc/52x0zVQUiEWK3yIvGGPxMB1aEtt
 kh1x/7CppVBPb+3pXzTddBmAPHbgxZTz5K079JIe4x0dTkrIdqRqzC5sTlhIx+i7dZI2
 erLd5PNiaeEg+Zq6SEZQ79Ogm+u318HJitXhGq/TXPbhwwD/3VEiMbtzMU1haHQ6D7zl
 vGs8s0bb+G2mGP4DiCEWFXexGHjuadZgRBToSELzvbvJTGDX89eVpGo6E2l23dRi6PvB
 xzUg==
X-Gm-Message-State: APjAAAVIUR3grgzwQAmH+G6ZDP9QgB1mS8+LKf7twpFVwDD93Zsj/iJk
 IuQmEDUFN88BBAMubnHQ5I8=
X-Google-Smtp-Source: APXvYqz2e1jjhnumlYd6sMiy004vfYW4YVIpjciu5ksXobvUyAAqrXGUi3v6alyJVPijkNJrLOsEvw==
X-Received: by 2002:adf:dfd2:: with SMTP id q18mr24386899wrn.152.1579001523433; 
 Tue, 14 Jan 2020 03:32:03 -0800 (PST)
Received: from debian (41.142.6.51.dyn.plus.net. [51.6.142.41])
 by smtp.gmail.com with ESMTPSA id x7sm18545266wrq.41.2020.01.14.03.32.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Jan 2020 03:32:02 -0800 (PST)
Date: Tue, 14 Jan 2020 11:32:00 +0000
From: Wei Liu <wl@xen.org>
To: Paul Durrant <pdurrant@amazon.com>
Message-ID: <20200114113200.x75bzzx6urp7hegl@debian>
References: <20200113153217.3419-1-pdurrant@amazon.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200113153217.3419-1-pdurrant@amazon.com>
User-Agent: NeoMutt/20180716
Subject: Re: [Xen-devel] [PATCH v2] Introduce CHANGELOG.md
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Jan Beulich <jbeulich@suse.com>,
 xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gTW9uLCBKYW4gMTMsIDIwMjAgYXQgMDM6MzI6MTdQTSArMDAwMCwgUGF1bCBEdXJyYW50IHdy
b3RlOgo+IEFzIGFncmVlZCBkdXJpbmcgdGhlIDIwMjAtMDEgY29tbXVuaXR5IGNhbGwgWzFdIHRo
aXMgcGF0Y2ggaW50cm9kdWNlcyBhCj4gY2hhbmdlbG9nLCBiYXNlZCBvbiB0aGUgcHJpbmNpcGxl
cyBleHBsYWluZWQgYXQga2VlcGFjaGFuZ2Vsb2cuY29tIFsyXS4KPiBBIG5ldyBNQUlOVEFJTkVS
UyBlbnRyeSBpcyBhbHNvIGFkZGVkLCB3aXRoIG15c2VsZiBhcyAoY3VycmVudGx5IHNvbGUpCj4g
bWFpbnRhaW5lci4KPiAKPiBbMV0gU2VlIEMuMiBhdCBodHRwczovL2NyeXB0cGFkLmZyL3BhZC8j
LzIvcGFkL2VkaXQvRVJadE1ZRDVqNmswc3YtTkc2SHRsLUFKLwo+IFsyXSBodHRwczovL2tlZXBh
Y2hhbmdlbG9nLmNvbS9lbi8xLjAuMC8KPiAKPiBTaWduZWQtb2ZmLWJ5OiBQYXVsIER1cnJhbnQg
PHBkdXJyYW50QGFtYXpvbi5jb20+Cj4gQWNrZWQtYnk6IExhcnMgS3VydGggPGxhcnMua3VydGhA
Y2l0cml4LmNvbT4KCkFja2VkLWJ5OiBXZWkgTGl1IDx3bEB4ZW4ub3JnPgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlz
dApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
