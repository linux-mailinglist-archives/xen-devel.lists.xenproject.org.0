Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AFB713AA09
	for <lists+xen-devel@lfdr.de>; Tue, 14 Jan 2020 14:04:43 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1irLpl-0000mU-Vh; Tue, 14 Jan 2020 13:02:13 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=eDHu=3D=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1irLpj-0000mH-Ud
 for xen-devel@lists.xenproject.org; Tue, 14 Jan 2020 13:02:11 +0000
X-Inumbo-ID: 1192f0a2-36ce-11ea-8395-12813bfff9fa
Received: from mail-wm1-f67.google.com (unknown [209.85.128.67])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1192f0a2-36ce-11ea-8395-12813bfff9fa;
 Tue, 14 Jan 2020 13:02:07 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id b19so13648906wmj.4
 for <xen-devel@lists.xenproject.org>; Tue, 14 Jan 2020 05:02:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=mrXPMbTEIR/YFz+XHmaMrNtnzxarWTZQzfalgW3SE9M=;
 b=ZwkHHk5OBWBx+qWGcaoOVfIzjtC63XfOw4AZBiVpHp/VhANew92WNYoKlFa7Z4y7vt
 RtbUikMmcSYfvSWK6ge2GYeDZJ2KXyRZKEnEB+dCDK005xFWT0GBaiMRaYmCmqnG24LF
 NPkh9S6pZo+oBnaXFH9Cam9HSnC1MfmCXXCYVaXwylWrFHUR+zK+AIgbaNJ5bO3sK0k7
 XkMcsVRy/f24VLdtI+ryfIMV+iYQdmLF1uIWk/gAyuDGuXv5rzCJi7qEOx5/30E1SlfM
 Q6c/+1U5mOC4AxQ2+IRyzp3DehpLctJYIrKaZO9r3gq0VyNUHiUXTuwnLlOeMDSjvITh
 iKXg==
X-Gm-Message-State: APjAAAV+77AL+aQ0IrdH80E6Jbe7v12cTZs6AQDS6Mo80DEfH3VwLacG
 xwSGYj7qGKK4VB0p6Vxo4ZI=
X-Google-Smtp-Source: APXvYqwn5tSMW3JXB5UL2bH6mOVyYu2S5O1i7DEuONCYLWB9t3K/xndjLeUn8JDU1bC8IgrPuNpiVA==
X-Received: by 2002:a05:600c:244:: with SMTP id
 4mr25757339wmj.40.1579006927118; 
 Tue, 14 Jan 2020 05:02:07 -0800 (PST)
Received: from debian (41.142.6.51.dyn.plus.net. [51.6.142.41])
 by smtp.gmail.com with ESMTPSA id i5sm18329955wml.31.2020.01.14.05.02.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Jan 2020 05:02:06 -0800 (PST)
Date: Tue, 14 Jan 2020 13:02:04 +0000
From: Wei Liu <wl@xen.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <20200114130204.5un5vvqvppeq5b42@debian>
References: <20200114123921.30850-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200114123921.30850-1-andrew.cooper3@citrix.com>
User-Agent: NeoMutt/20180716
Subject: Re: [Xen-devel] [PATCH] tools/libxc: Construct 32bit PV guests with
 L3 A/D bits set
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
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Ian Jackson <Ian.Jackson@citrix.com>, Wei Liu <wl@xen.org>,
 Jan Beulich <JBeulich@suse.com>,
 Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVHVlLCBKYW4gMTQsIDIwMjAgYXQgMTI6Mzk6MjFQTSArMDAwMCwgQW5kcmV3IENvb3BlciB3
cm90ZToKPiBXaXRoIHRoZSAzMiBQQUUgYnVpbGQgb2YgWGVuIGdvbmUsIDMyYml0IFBWIGd1ZXN0
cycgdG9wIGxldmVsIHBhZ2V0YWJsZXMgbm8KPiBsb25nZXIgYmVoYXZlIGV4YWN0bHkgbGlrZSBQ
QUUgaW4gaGFyZHdhcmUuCj4gCj4gVGhleSBzaG91bGQgaGF2ZSBBL0QgYml0cyBzZXQsIGZvciB0
aGUgc2FtZSBwZXJmb3JtYW5jZSByZWFzb25zIGFzIGFwcGx5IHRvCj4gb3RoZXIgbGV2ZWxzLiAg
VGhpcyBicmluZ3MgdGhlIGRvbWFpbiBidWlsZGVyIGluIGxpbmUgd2l0aCBob3cgWGVuIGNvbnN0
cnVjdHMKPiBhIDMyYml0IGRvbTAuCj4gCj4gQXMgYSBwdXJlbHkgY29kZSBpbXByb3ZlbWVudCwg
bWFrZSB1c2Ugb2YgcmFuZ2Ugbm90YXRpb24gdG8gaW5pdGlhbGlzZQo+IGlkZW50aWNhbCB2YWx1
ZXMgaW4gYWRqYWNlbnQgYXJyYXkgZWxlbWVudHMuCj4gCj4gU2lnbmVkLW9mZi1ieTogQW5kcmV3
IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4KCkFja2VkLWJ5OiBXZWkgTGl1IDx3
bEB4ZW4ub3JnPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcK
aHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
