Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A92DBE115
	for <lists+xen-devel@lfdr.de>; Wed, 25 Sep 2019 17:20:44 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iD93T-0004b9-Ns; Wed, 25 Sep 2019 15:18:11 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=mY+w=XU=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1iD93S-0004b3-IP
 for Xen-devel@lists.xenproject.org; Wed, 25 Sep 2019 15:18:10 +0000
X-Inumbo-ID: ae8bb4da-dfa7-11e9-9636-12813bfff9fa
Received: from mail-wr1-f66.google.com (unknown [209.85.221.66])
 by localhost (Halon) with ESMTPS
 id ae8bb4da-dfa7-11e9-9636-12813bfff9fa;
 Wed, 25 Sep 2019 15:18:09 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id b9so7423720wrs.0
 for <Xen-devel@lists.xenproject.org>; Wed, 25 Sep 2019 08:18:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=pK9Oq+eaH+GDJGMUn77MB/VDzJyl8GMwkSth8PBvojU=;
 b=cky9yp3I+py2NmXGFieM3/gc1FfvzP9ceobfQ9nbgOHG5wFdX8/FOg5eZ4yb90ECXA
 HBiD2rLYSl4cbyjyLN0RsOC7SzLv+bbx6wqLKOJ+KXgigVJaslcO+hXVbhaPeW5B4Nd1
 32kLnpv4uI1LMKRso/K5u//tIcL1ebsrkzVm4K46Y10vA/SbEGerU2jpx/V94SAhMKae
 /MIVKaBpzuIN/wS55y1FteVa3HuSTrSw293LSq9ljZ11uIcPR6PVmDMgfa5vCyag6Ysr
 dQZJG8uAmNe5ewmqgqtLkxuEF+Li/88ABbTsGV0p5Zoulvn+mkNnnzKOj4EUr6rIWduf
 HkAQ==
X-Gm-Message-State: APjAAAU2gOBbFx7noAy4py1BRuZiViFP5gHE3FgbRh26o2wlvFLE7NCl
 p+pgdqDhatpBQOA1ZY6JOKw=
X-Google-Smtp-Source: APXvYqzfHACsXWffO6hPhgu2FX24YK4KZ1MqObsp+TKGj1UvwkF0bVy84ENO/VzgivfgzZ0fX02jLg==
X-Received: by 2002:adf:9dd1:: with SMTP id q17mr10104160wre.176.1569424688982; 
 Wed, 25 Sep 2019 08:18:08 -0700 (PDT)
Received: from debian (207.148.159.143.dyn.plus.net. [143.159.148.207])
 by smtp.gmail.com with ESMTPSA id o188sm8991678wma.14.2019.09.25.08.18.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Sep 2019 08:18:08 -0700 (PDT)
Date: Wed, 25 Sep 2019 16:18:06 +0100
From: Wei Liu <wl@xen.org>
To: Hongyan Xia <hongyax@amazon.com>
Message-ID: <20190925151806.pnm3yecc2a6cthxa@debian>
References: <20190925143410.26661-1-hongyax@u9d785c4ba99158.ant.amazon.com>
 <20190925143410.26661-18-hongyax@u9d785c4ba99158.ant.amazon.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190925143410.26661-18-hongyax@u9d785c4ba99158.ant.amazon.com>
User-Agent: NeoMutt/20180716
Subject: Re: [Xen-devel] [PATCH 17/84] xxx fixup: avoid shadowing mfn
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
Cc: Xen-devel@lists.xenproject.org, wl@xen.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gV2VkLCBTZXAgMjUsIDIwMTkgYXQgMDM6MzM6MDNQTSArMDEwMCwgaG9uZ3lheCB3cm90ZToK
PiBGcm9tOiBXZWkgTGl1IDx3ZWkubGl1MkBjaXRyaXguY29tPgo+IAo+IC0tLQo+ICB4ZW4vYXJj
aC94ODYvbW0uYyB8IDI1ICsrKysrKysrKysrKystLS0tLS0tLS0tLS0KPiAgMSBmaWxlIGNoYW5n
ZWQsIDEzIGluc2VydGlvbnMoKyksIDEyIGRlbGV0aW9ucygtKQo+IAoKVGhpcyBwYXRjaCBzaG91
bGQgaGF2ZSBiZWVuIHNxdWFzaGVkIGludG8gdGhlIHByZXZpb3VzIHBhdGNoLgoKV2VpLgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1h
aWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54
ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
