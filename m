Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 90F2CBF3BF
	for <lists+xen-devel@lfdr.de>; Thu, 26 Sep 2019 15:09:31 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iDTSm-0004Z1-Lx; Thu, 26 Sep 2019 13:05:40 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Aa/x=XV=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1iDTSl-0004Yw-7m
 for xen-devel@lists.xenproject.org; Thu, 26 Sep 2019 13:05:39 +0000
X-Inumbo-ID: 559315fa-e05e-11e9-9651-12813bfff9fa
Received: from mail-wm1-f66.google.com (unknown [209.85.128.66])
 by localhost (Halon) with ESMTPS
 id 559315fa-e05e-11e9-9651-12813bfff9fa;
 Thu, 26 Sep 2019 13:05:38 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id 5so2710416wmg.0
 for <xen-devel@lists.xenproject.org>; Thu, 26 Sep 2019 06:05:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=gjqqFV3sRxnzb1DTl0qqgUx0wlqMInKNIL6xFvUxcs8=;
 b=CWCl0WVCnboW0KUr2jPnokDAYuU8DQpCMhm7CvLmZuAkR7Vf/aCWiDo22G099s3lNT
 1qV56lKneP2SI5DJozXRrRDLq8KiF5fs1Bt6VBhNegF63DXZYO4h8XN2a5NNT+rTWe7E
 CqfLMPHbYu1DCK0OLOYKkLax9aoBHimM6WDRzrSeZMo956M8XwzgkttkXKCIWKZKU0Rx
 lyG1av7TBqtrIGq2B44VjT2T3rCJfcZU9tBYeRD5RLoVYmEHRL6TcqNjkrypY46YhQQf
 z+aGHIf7YImNrn9XQunISNHntSJwfI/wfj1919rev4xOi9KwpC5DpDStkpwWUdRXwtlR
 5IRg==
X-Gm-Message-State: APjAAAU7BB29RIBfJSTqQ1YAU4QG53xJ4ZNxlxzOzFzwdzyrtY4Pd5N3
 TpfGu9s8LcduaWMTF/kIUQ4=
X-Google-Smtp-Source: APXvYqwhXAZVIzWoAm2VepCtw+R/kq4WkDf07z+XTuB/OcClmuEW/Uk7NaZZyJjWNNHyn8OLCYfk7w==
X-Received: by 2002:a05:600c:389:: with SMTP id
 w9mr2843152wmd.139.1569503137597; 
 Thu, 26 Sep 2019 06:05:37 -0700 (PDT)
Received: from debian (207.148.159.143.dyn.plus.net. [143.159.148.207])
 by smtp.gmail.com with ESMTPSA id r9sm3427973wra.19.2019.09.26.06.05.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Sep 2019 06:05:37 -0700 (PDT)
Date: Thu, 26 Sep 2019 14:05:35 +0100
From: Wei Liu <wl@xen.org>
To: hongyax@amazon.com
Message-ID: <20190926130535.q6g2l7xeasu6x2v4@debian>
References: <cover.1569489002.git.hongyax@amazon.com>
 <754cbac796a3e4326e2ad6b103d85dbbc3f51ae2.1569489002.git.hongyax@amazon.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <754cbac796a3e4326e2ad6b103d85dbbc3f51ae2.1569489002.git.hongyax@amazon.com>
User-Agent: NeoMutt/20180716
Subject: Re: [Xen-devel] [RFC PATCH 17/84] xxx fixup: avoid shadowing mfn
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
Cc: Wei Liu <wei.liu2@citrix.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 xen-devel@lists.xenproject.org,
 Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVGh1LCBTZXAgMjYsIDIwMTkgYXQgMTA6NDU6NDBBTSArMDEwMCwgaG9uZ3lheEBhbWF6b24u
Y29tIHdyb3RlOgo+IEZyb206IFdlaSBMaXUgPHdlaS5saXUyQGNpdHJpeC5jb20+Cj4gCgpQbGVh
c2Ugc3F1YXNoIHRoaXMgcGF0Y2ggdG8gdGhlIHByZXZpb3VzIHBhdGNoLgoKV2VpLgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxp
bmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5w
cm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
