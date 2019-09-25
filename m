Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 725A6BE27C
	for <lists+xen-devel@lfdr.de>; Wed, 25 Sep 2019 18:31:29 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iDA9q-00084H-Ho; Wed, 25 Sep 2019 16:28:50 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=mY+w=XU=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1iDA9p-00084A-0n
 for xen-devel@lists.xenproject.org; Wed, 25 Sep 2019 16:28:49 +0000
X-Inumbo-ID: 8c08f7d0-dfb1-11e9-9638-12813bfff9fa
Received: from mail-wm1-f65.google.com (unknown [209.85.128.65])
 by localhost (Halon) with ESMTPS
 id 8c08f7d0-dfb1-11e9-9638-12813bfff9fa;
 Wed, 25 Sep 2019 16:28:47 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id p7so6445416wmp.4
 for <xen-devel@lists.xenproject.org>; Wed, 25 Sep 2019 09:28:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=hGNJH4sisStBFhxDMmSfHN5KiYaldlg9b42BRJggiBo=;
 b=BXhtEXxlROduohp5jESP7Lom/H6c5ZCnU4bncvi97bkshSTX4NlnZAi7iR02h/GMLe
 0ARADB9O+Xr6/uoo89+J9J8s/TEUKM0QgCbwdNp8W/pt+jxDSZWoslM7pTfe83tZ0wlW
 O2e4rXXXc7BH0u0ES6Ts7N3YoPenu+MUxAfxZ09DDr4mvuS/u6o60C4NKWHjRdT7fX40
 VffvunTJ8KbSOuYU528AHCoP1jWA/u9SxbQNO6x+JX1GTDv1BX02AVmS66vLRnLQdTFd
 rGDHTojYeWlKqkPSeYCs0Tt76h0mk9bNP/VLIvjl7u4r02pa2VcsEkTArntEJC4BcWJo
 1Vjw==
X-Gm-Message-State: APjAAAVa8voM0GeEvsJyYcHHYNz2K0qsVLNzdbxk50Q2yv2IbwLEava0
 WkD9YzTkE9Ua7zb/i0bPTu4=
X-Google-Smtp-Source: APXvYqwm/wYzJN/aaU5BexjZs11kLSVqAfJSWf1Oe8hKAikbMEPIgeEexzdnC9UCgMkm+yAsYxg/4A==
X-Received: by 2002:a1c:1b58:: with SMTP id b85mr8819548wmb.95.1569428927196; 
 Wed, 25 Sep 2019 09:28:47 -0700 (PDT)
Received: from debian (207.148.159.143.dyn.plus.net. [143.159.148.207])
 by smtp.gmail.com with ESMTPSA id o188sm9348183wma.14.2019.09.25.09.28.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Sep 2019 09:28:46 -0700 (PDT)
Date: Wed, 25 Sep 2019 17:28:45 +0100
From: Wei Liu <wl@xen.org>
To: Tamas K Lengyel <tamas.lengyel@intel.com>
Message-ID: <20190925162844.u6ji5whnsm2ma6qh@debian>
References: <cover.1569425745.git.tamas.lengyel@intel.com>
 <bc3ba2d3208e315bf06fa363fd009cac1da71d9a.1569425745.git.tamas.lengyel@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <bc3ba2d3208e315bf06fa363fd009cac1da71d9a.1569425745.git.tamas.lengyel@intel.com>
User-Agent: NeoMutt/20180716
Subject: Re: [Xen-devel] [RFC PATCH for-next 06/18] x86/mem_sharing: drop
 flags from mem_sharing_unshare_page
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
Cc: Wei Liu <wl@xen.org>, George Dunlap <george.dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 xen-devel@lists.xenproject.org,
 Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gV2VkLCBTZXAgMjUsIDIwMTkgYXQgMDg6NDg6NDRBTSAtMDcwMCwgVGFtYXMgSyBMZW5neWVs
IHdyb3RlOgo+IEFsbCBjYWxsZXJzIHBhc3MgMCBpbi4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBUYW1h
cyBLIExlbmd5ZWwgPHRhbWFzLmxlbmd5ZWxAaW50ZWwuY29tPgoKUmV2aWV3ZWQtYnk6IFdlaSBM
aXUgPHdsQHhlbi5vcmc+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRl
dmVs
