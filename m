Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 95E0C12E902
	for <lists+xen-devel@lfdr.de>; Thu,  2 Jan 2020 17:58:45 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1in3ku-0004BN-AT; Thu, 02 Jan 2020 16:55:28 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=3gH+=2X=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1in3kt-0004BI-0N
 for xen-devel@lists.xenproject.org; Thu, 02 Jan 2020 16:55:27 +0000
X-Inumbo-ID: a79d6124-2d80-11ea-88e7-bc764e2007e4
Received: from mail-wm1-f68.google.com (unknown [209.85.128.68])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a79d6124-2d80-11ea-88e7-bc764e2007e4;
 Thu, 02 Jan 2020 16:55:18 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id p17so6258967wmb.0
 for <xen-devel@lists.xenproject.org>; Thu, 02 Jan 2020 08:55:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=a87k9xEwQkYkBnA55bE/RbVCSPCJCItuuPfq4a+BXnM=;
 b=PJ8niIj4zMTsRdVmOLDts6aTMIqVAtxqxWrkXIAh4/X3Ssumqc7uiit/AThg7JUVj9
 G7afPpkh4EU1G/Oe/rGCzd0dg1cmJI2zrPFoc5HLbPSZ4zzr4esL8IFlF6iOBzFkPKWc
 OLgE9Dru7QZ9zyp5fDTcN+rtiZySS7gXw2p8qlPLMem1/vftK3ZEwCN9wbBZ47PsddDQ
 rz9bNRxZXDqS/Tp4Ar9cB60pP575jBTRxx3K8q6s2IO2VFsJPjU8mptvgeOoJowu/3Mw
 1ReuXHbnK0JdZCi7LFJrXudK6/9gso7YWJe3qQV4ZSI0oVzS87wDjV9Fkvlhi8KadrfW
 M+CA==
X-Gm-Message-State: APjAAAVtPHo6CdZzXWRgHLHbBzXxjV/8NLKEyHa+eWCmD549ZwJjFF1T
 NDP+k1wL9djiSfmgzOxJ6IU=
X-Google-Smtp-Source: APXvYqw+cuyXAeEwQNknYt0pOsKfgx/vknOxxsU7k0XIuITUnpP8937X4UMV77yQqxqlUFfMxhjJdA==
X-Received: by 2002:a05:600c:145:: with SMTP id
 w5mr16080733wmm.157.1577984117651; 
 Thu, 02 Jan 2020 08:55:17 -0800 (PST)
Received: from debian (38.163.200.146.dyn.plus.net. [146.200.163.38])
 by smtp.gmail.com with ESMTPSA id q11sm55952943wrp.24.2020.01.02.08.55.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Jan 2020 08:55:17 -0800 (PST)
Date: Thu, 2 Jan 2020 16:55:15 +0000
From: Wei Liu <wl@xen.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <20200102165515.4brbqceseurokvp3@debian>
References: <20200102145953.6503-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200102145953.6503-1-andrew.cooper3@citrix.com>
User-Agent: NeoMutt/20180716
Subject: Re: [Xen-devel] [PATCH] x86/boot: Clean up the trampoline
 transition into Long mode
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
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>,
 Jan Beulich <JBeulich@suse.com>,
 Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVGh1LCBKYW4gMDIsIDIwMjAgYXQgMDI6NTk6NTNQTSArMDAwMCwgQW5kcmV3IENvb3BlciB3
cm90ZToKPiBUaGUgam1wIGFmdGVyIHNldHRpbmcgJWNyMCBpcyByZWR1bmRhbnQgd2l0aCB0aGUg
Zm9sbG93aW5nIGxqbXAuCj4gCj4gVGhlIENQVUlEIHRvIHByb3RlY3QgdGhlIGp1bXAgdG8gaGln
aGVyIG1hcHBpbmdzIHdhcyBpbnNlcnRlZCBkdWUgdG8gYW4KPiBhYnVuZGFuY2Ugb2YgY2F1dGlv
bi9wYXJhbm9pYSBiZWZvcmUgU3BlY3RyZSB3YXMgcHVibGljLiAgVGhlcmUgaXMgbm90IGEKPiBt
YXRjaGluZyBwcm90ZWN0aW9uIGluIHRoZSBTMyByZXN1bWUgcGF0aCwgYW5kIHRoZXJlIGlzIG5v
dGhpbmcKPiBpbnRlcmVzdGluZyBpbiBtZW1vcnkgYXQgdGhpcyBwb2ludC4KCldoYXQgZG8geW91
IG1lYW4gYnkgInRoZXJlIGlzIG5vdGhpbmcgaW50ZXJlc3RpbmcgaW4gbWVtb3J5IiBoZXJlPwoK
QXMgZmFyIGFzIEkgY2FuIHRlbGwgaWRlbCBwYWdlIHRhYmxlIGhhcyBiZWVuIGxvYWRlZC4gIER1
cmluZyBBUApicmluZy11cCBpdCBjb250YWlucyBydW50aW1lIGRhdGEsIG5vPwoKV2VpLgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1h
aWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54
ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
