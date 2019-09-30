Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 22183C23EA
	for <lists+xen-devel@lfdr.de>; Mon, 30 Sep 2019 17:07:46 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iExEU-00079q-Oy; Mon, 30 Sep 2019 15:05:02 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=m4o0=XZ=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1iExET-00079l-RT
 for xen-devel@lists.xenproject.org; Mon, 30 Sep 2019 15:05:01 +0000
X-Inumbo-ID: ac6096c2-e393-11e9-96d6-12813bfff9fa
Received: from mail-wm1-f67.google.com (unknown [209.85.128.67])
 by localhost (Halon) with ESMTPS
 id ac6096c2-e393-11e9-96d6-12813bfff9fa;
 Mon, 30 Sep 2019 15:05:00 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id b24so13115124wmj.5
 for <xen-devel@lists.xenproject.org>; Mon, 30 Sep 2019 08:05:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=IjRf5CfkME1optiOzklY5UdbfVIZCt4G0pZIR5mlX1U=;
 b=RvYGnbtJaDoRYY/H0wL/vkGiyzTePKpCgpNkX/C6BguGJHNmc5Q95tELIh14mmGn1g
 zVYm8HV4SXVl2ilTQUpyZghKKrfJdjtzq7OFm9BLXNBJ75U8pqmUs9gUavLicLdwlbzj
 +sOFEac7qGLnjumzSQ/kSh/zH7TDZDTkf7Frjr0Zizd+RGHRn5i2PfTxAISDrgDRS0Hs
 QD1GGO37QlL5SJWJjns5CEpmS+BLuNZvp5bwnR02uxSz0GEfNReYX0D3oy1IwFLZR5Pi
 lf7puhwsTNWzHKbjidjhE1CvHqD697wojoM8fUqEui/iNAK2X2Y/BIm3jp9uiPLs27CK
 zNfQ==
X-Gm-Message-State: APjAAAWhD/Y/KoJ+AGxZ14KQVWkYbk0kCce6JMM6GAdOXl7gdtG2ppLD
 YEcHNuaPHMm+imAjbwwjOebimfXJEcc=
X-Google-Smtp-Source: APXvYqyD4yW8tnXoCGBNPy9etR++5Y3LSgbu9VpktWUG1EbGEmOp2GZnZHVe0+Chcp/4JodaFAUZcQ==
X-Received: by 2002:a1c:9c96:: with SMTP id f144mr18177778wme.96.1569855899075; 
 Mon, 30 Sep 2019 08:04:59 -0700 (PDT)
Received: from debian (207.148.159.143.dyn.plus.net. [143.159.148.207])
 by smtp.gmail.com with ESMTPSA id d193sm27953138wmd.0.2019.09.30.08.04.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Sep 2019 08:04:58 -0700 (PDT)
Date: Mon, 30 Sep 2019 16:04:56 +0100
From: Wei Liu <wl@xen.org>
To: Xen Development List <xen-devel@lists.xenproject.org>
Message-ID: <20190930150456.mz4dnuyandgjgb4z@debian>
References: <20190930150044.5734-1-liuwe@microsoft.com>
 <20190930150044.5734-10-liuwe@microsoft.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190930150044.5734-10-liuwe@microsoft.com>
User-Agent: NeoMutt/20180716
Subject: Re: [Xen-devel] [PATCH for-next v2 9/9] x86: introduce
 CONFIG_HYPERV and detection code
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
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Michael Kelley <mikelley@microsoft.com>, Jan Beulich <jbeulich@suse.com>,
 Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gTW9uLCBTZXAgMzAsIDIwMTkgYXQgMDQ6MDA6NDNQTSArMDEwMCwgV2VpIExpdSB3cm90ZToK
PiBXZSB1c2UgdGhlIHNhbWUgY29kZSBzdHJ1Y3R1cmUgYXMgd2UgZGllIGZvciBYZW4uCgpVcmdo
LiBUaGVyZSBpcyBhIHJhdGhlciB1bmZvcnR1bmF0ZSB0eXBvLiBObyBzb2Z0d2FyZSBpcyB3b3J0
aCBkeWluZwpmb3IuIDotKQoKV2VpLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L3hlbi1kZXZlbA==
