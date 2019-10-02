Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BF3BC4AEE
	for <lists+xen-devel@lfdr.de>; Wed,  2 Oct 2019 12:00:04 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iFbNd-0001NL-Lk; Wed, 02 Oct 2019 09:57:09 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=uMoo=X3=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1iFbNb-0001NE-IC
 for xen-devel@lists.xenproject.org; Wed, 02 Oct 2019 09:57:07 +0000
X-Inumbo-ID: fe03e0e8-e4fa-11e9-bf31-bc764e2007e4
Received: from mail-wm1-f65.google.com (unknown [209.85.128.65])
 by localhost (Halon) with ESMTPS
 id fe03e0e8-e4fa-11e9-bf31-bc764e2007e4;
 Wed, 02 Oct 2019 09:57:07 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id r17so4537263wme.0
 for <xen-devel@lists.xenproject.org>; Wed, 02 Oct 2019 02:57:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=gSrWgbnwhDUpyx0sjhnnz19c73fBLcuFgj9lH1LaGq4=;
 b=ooq3lU35JBpkTeIdLOKieeLSYumdr3xX1D1YlXENmBZYXUgY+B4Pf8td9u0ycglJy+
 SSv3vq0kER/fmmBwutvwPuSpVZpU2i1Y5IDwN0iGCryIZJi52NWGXSLrDUwPvOzA2p3P
 VDzwXoSYM7UMHAvytd3Udsmv4VcPmm9/rx7x/L4WHYSeljJRgJJGm5r23jDjR7XcIrb9
 SOaQ+rjloR6F0nJzmFI+H3EW4YSiSv1RIBVQ2vWH8CMs5PJkBlzJaE8GwooFzs4T7+DP
 R2e4AOG4qG9/p9nFCWxGE6IlxtBqsdnVlzlhtB1i/CnFn3/zx41k+8FHHREBh1cuu61o
 pJPw==
X-Gm-Message-State: APjAAAURnJPVwZrepyrhxJrpUX/mfN3MzIbLeWFpkbMiLVlg7MHfUzwm
 OcQLfSzToeftX/Ql0bP0QEE=
X-Google-Smtp-Source: APXvYqxxpL9cBxvkkr6J50NWLtkq47zYfNhkBnyISUrtcWhofXTFy6BRgpORMmzwdEqTvrH6p0aPdw==
X-Received: by 2002:a1c:cfc9:: with SMTP id f192mr2040772wmg.85.1570010226344; 
 Wed, 02 Oct 2019 02:57:06 -0700 (PDT)
Received: from debian (207.148.159.143.dyn.plus.net. [143.159.148.207])
 by smtp.gmail.com with ESMTPSA id l4sm2601778wrw.6.2019.10.02.02.57.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Oct 2019 02:57:05 -0700 (PDT)
Date: Wed, 2 Oct 2019 10:57:04 +0100
From: Wei Liu <wl@xen.org>
To: Jan Beulich <jbeulich@suse.com>
Message-ID: <20191002095704.yz6dtkpyvgrq5w33@debian>
References: <9cfa35b6-697c-5be1-f846-0bb8288a8708@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <9cfa35b6-697c-5be1-f846-0bb8288a8708@suse.com>
User-Agent: NeoMutt/20180716
Subject: Re: [Xen-devel] [PATCH 0/2] tools/xen-cpuid: two small adjustments
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
Cc: Juergen Gross <jgross@suse.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gV2VkLCBPY3QgMDIsIDIwMTkgYXQgMDk6Mjc6MDdBTSArMDIwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gMTogTUFJTlRBSU5FUlM6IGFkZCB0b29scy9taXNjL3hlbi1jcHVpZCB0byAiWDg2IEFS
Q0hJVEVDVFVSRSIKPiAyOiB0b29scy94ZW4tY3B1aWQ6IGF2b2lkIHByb2R1Y2luZyBib2d1cyBv
dXRwdXQKPiAKPiBUaGV5J3JlIG5vdCBvdmVybHkgaW1wb3J0YW50IHRvIGhhdmUgZm9yIDQuMTMs
IGJ1dCB0aGV5J3JlIGFsc28gcmF0aGVyCj4gbG93IHJpc2ssIHNvIEkgdGhpbmsgdGhleSdyZSB3
b3J0aHdoaWxlIGNvbnNpZGVyaW5nIGF0IHRoaXMgcG9pbnQgaW4KPiB0aW1lLgoKQWNrZWQtYnk6
IFdlaSBMaXUgPHdsQHhlbi5vcmc+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5w
cm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8v
eGVuLWRldmVs
