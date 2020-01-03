Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C86EE12FA33
	for <lists+xen-devel@lfdr.de>; Fri,  3 Jan 2020 17:20:54 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1inPeS-0007Rk-4C; Fri, 03 Jan 2020 16:18:16 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=fV2H=2Y=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1inPeQ-0007Rf-N7
 for xen-devel@lists.xenproject.org; Fri, 03 Jan 2020 16:18:14 +0000
X-Inumbo-ID: 9f89718e-2e44-11ea-a914-bc764e2007e4
Received: from mail-wr1-f65.google.com (unknown [209.85.221.65])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9f89718e-2e44-11ea-a914-bc764e2007e4;
 Fri, 03 Jan 2020 16:18:06 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id b6so42980578wrq.0
 for <xen-devel@lists.xenproject.org>; Fri, 03 Jan 2020 08:18:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=lqDR6ppIJ7CU/0IxexzADdudWuqNRmnYJjFlqUtQe5I=;
 b=tpT4ChMXG4AV5f+LTa948oN4VorgoeDZdf9KZvoMK9QrRyhwK+WlrkGDP+Sz0zHel3
 DMZoq/4RcYH0adFj+eeEDo4kKm0zFBJiRyzZIAtXV6qXWV0Td3LCxVNsEgqSGSf5iOTO
 FPDq7NmstzzkxWQegwK82JCGAPyjK3JndZgslAyw67qFUMqcfF34MDb1XDOiFEwx+Lnc
 mZ+c5faQWgUG79KfT4bbcBw2aTD0Yd5mo0o03iwx18JPLlhytfXgnOIxAtGM4uF57NUw
 XWo5t+qFaP6e7bKMD8/koZBg7Cmt/ol8IFErycaGYq5bCtLqG/aHkRohjfRmopH9goFY
 XQzg==
X-Gm-Message-State: APjAAAUAC4T1CYPDFTdI6m56BmoCAagCTahYmdRrmww3ehLsvmUOIHng
 YEKtN7fVQG3zqLKL4DiAOig=
X-Google-Smtp-Source: APXvYqyHgINTBDcgZ9ZiojTjUJsFtem55QKZ1jwbHHxMzVUw1qtmmlUINAw/l7xwxczSt9YYOeet2Q==
X-Received: by 2002:adf:e40f:: with SMTP id g15mr7200465wrm.223.1578068285499; 
 Fri, 03 Jan 2020 08:18:05 -0800 (PST)
Received: from debian (38.163.200.146.dyn.plus.net. [146.200.163.38])
 by smtp.gmail.com with ESMTPSA id a14sm64969512wrx.81.2020.01.03.08.18.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Jan 2020 08:18:05 -0800 (PST)
Date: Fri, 3 Jan 2020 16:18:03 +0000
From: Wei Liu <wl@xen.org>
To: Jan Beulich <jbeulich@suse.com>
Message-ID: <20200103161803.hno76iob6xmw3kv5@debian>
References: <20191229183341.14877-1-liuwe@microsoft.com>
 <20191229183341.14877-4-liuwe@microsoft.com>
 <a6b69d27-bdfe-2dcb-7a99-47d088050b0f@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <a6b69d27-bdfe-2dcb-7a99-47d088050b0f@suse.com>
User-Agent: NeoMutt/20180716
Subject: Re: [Xen-devel] [PATCH 3/8] x86: rename guest/hypercall.h to
 guest/xen-hypercall.h
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
Cc: Wei Liu <liuwe@microsoft.com>, Wei Liu <wl@xen.org>,
 Paul Durrant <paul@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Michael Kelley <mikelley@microsoft.com>,
 Xen Development List <xen-devel@lists.xenproject.org>,
 Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gRnJpLCBKYW4gMDMsIDIwMjAgYXQgMDU6MTY6NTNQTSArMDEwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gT24gMjkuMTIuMjAxOSAxOTozMywgV2VpIExpdSB3cm90ZToKPiA+IFdlIHdpbGwgcHJv
dmlkZSBhIGhlYWRlciBmaWxlIGZvciBIeXBlci1WIGh5cGVyY2FsbHMuCj4gPiAKPiA+IE5vIGZ1
bmN0aW9uYWwgY2hhbmdlLgo+ID4gCj4gPiBTaWduZWQtb2ZmLWJ5OiBXZWkgTGl1IDxsaXV3ZUBt
aWNyb3NvZnQuY29tPgo+IAo+IEluIHByaW5jaXBsZQo+IEFja2VkLWJ5OiBKYW4gQmV1bGljaCA8
amJldWxpY2hAc3VzZS5jb20+Cj4gYWxiZWl0IC4uLgo+IAo+ID4gLS0tCj4gPiAgeGVuL2luY2x1
ZGUvYXNtLXg4Ni9ndWVzdC5oICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8IDIgKy0K
PiA+ICB4ZW4vaW5jbHVkZS9hc20teDg2L2d1ZXN0L3toeXBlcmNhbGwuaCA9PiB4ZW4taHlwZXJj
YWxsLmh9IHwgMiArLQo+IAo+IC4uLiBjb3VsZCB3ZSBzZXR0bGUgb24gZ3Vlc3QvKi1oY2FsbC5o
IHRvIHNhdmUgb24gZmlsZSBuYW1lCj4gbGVuZ3RoIHdpdGhvdXQgKGhvcGVmdWxseSkgYmVjb21p
bmcgYW1iaWd1b3VzPwoKVGhhdCB3b3JrcyBmb3IgbWUuCgpXZWkuCgo+IAo+IEphbgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxp
bmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5w
cm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
