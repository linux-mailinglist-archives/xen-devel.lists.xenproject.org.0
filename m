Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 98F751281AC
	for <lists+xen-devel@lfdr.de>; Fri, 20 Dec 2019 18:51:37 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iiMOx-0001cU-Q2; Fri, 20 Dec 2019 17:49:23 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=YXk5=2K=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1iiMOv-0001bj-Jk
 for xen-devel@lists.xenproject.org; Fri, 20 Dec 2019 17:49:21 +0000
X-Inumbo-ID: 0cfdb8dc-2351-11ea-93b5-12813bfff9fa
Received: from mail-wr1-f65.google.com (unknown [209.85.221.65])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 0cfdb8dc-2351-11ea-93b5-12813bfff9fa;
 Fri, 20 Dec 2019 17:49:21 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id c9so10232088wrw.8
 for <xen-devel@lists.xenproject.org>; Fri, 20 Dec 2019 09:49:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=2nzA81U7BVpKLmDJ5X1W5ii/N18ktTz3fi3elP2ePM4=;
 b=R3pjFDoQIC0CAESWY/ZFqI9t5228cXdN6+k8VLDhZr6NtMGCIJGXjZCfZJyr+gCDsk
 PExlHSIqlK82weYss0wqOWy5Po4HWGK+TuI/IZ3PORjrf/8oydIXDa7nStcDe0CGLvqG
 WQuzlLF4mxMAj7i34Na6AkRn2CbRunLSunfu3OsGXsnbSSURhNUb3JtEPpu9/hBqYANt
 p7uetcP1M8wZGaCv2FgIc0+odVyj+kqtxgRCkej0oUrdAsog76fz+wse3/+nrV/9lZYL
 b30Ff6/BD0Px5baREvM5AM+0JKA4GFfXumr5xU+T9kYP2H9nhTKyGbok67Nv701/fuak
 vL9Q==
X-Gm-Message-State: APjAAAVYFs67OLH9rcaQ5gXuUix2koKPWA8CcmzOVDOOaDQ7cT4S+jX3
 zMG/zrKOT+ZojcPPFVs0N+Y=
X-Google-Smtp-Source: APXvYqxU3lJT75940yxWh4Ux7Qxlua/sgrN68aofdVyKCVDHTHcXmpTwAJcPzultARM5SnUyhv1xew==
X-Received: by 2002:a5d:4651:: with SMTP id j17mr17250658wrs.237.1576864160231; 
 Fri, 20 Dec 2019 09:49:20 -0800 (PST)
Received: from debian (38.163.200.146.dyn.plus.net. [146.200.163.38])
 by smtp.gmail.com with ESMTPSA id o1sm10750844wrn.84.2019.12.20.09.49.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Dec 2019 09:49:19 -0800 (PST)
Date: Fri, 20 Dec 2019 17:49:18 +0000
From: Wei Liu <wl@xen.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <20191220174918.wijpln2svkogxb35@debian>
References: <20191220173502.15615-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191220173502.15615-1-andrew.cooper3@citrix.com>
User-Agent: NeoMutt/20180716
Subject: Re: [Xen-devel] [PATCH] libxc/migration: Drop unimplemneted domain
 types
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
 Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
 Jan Beulich <JBeulich@suse.com>, Ian Jackson <ian.jackson@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gRnJpLCBEZWMgMjAsIDIwMTkgYXQgMDU6MzU6MDJQTSArMDAwMCwgQW5kcmV3IENvb3BlciB3
cm90ZToKPiB4ODYgUFZIIGlzIGNvbXBsZXRlbHkgb2Jzb2xldGUgLSBpdCB3YXMgaW50ZW5kZWQg
Zm9yIGxlZ2FjeSBQVkggYmVmb3JlIHRoYXQKPiBpZGVhIHdhcyBhYmFuZG9uZWQuICBUaGVyZSB3
YXMgYW4gUkZDIHNlcmllcyBmb3IgQVJNIGluIDIwMTUsIGJ1dCB0aGVyZSBpcwo+IHBsZW50eSBv
ZiBvdXRzdGFuZGluZyB3b3JrIHdoaWNoIGhhc24ndCBiZWVuIGRvbmUgeWV0Lgo+IAo+IE5vIGZ1
bmN0aW9uYWwgY2hhbmdlLiAgTmV3IHR5cGVzIGNhbiBiZSAocmUpaW50cm9kdWNlZCB3aXRoIHRo
ZSBjb2RlIHdoaWNoCj4gYWN0dWFsbHkgaW1wbGVtZW50cyB0aGVtLgo+IAo+IFNpZ25lZC1vZmYt
Ynk6IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+CgpBY2tlZC1ieTog
V2VpIExpdSA8d2xAeGVuLm9yZz4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94
ZW4tZGV2ZWw=
