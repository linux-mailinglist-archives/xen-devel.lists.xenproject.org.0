Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C61F7891AF
	for <lists+xen-devel@lfdr.de>; Sun, 11 Aug 2019 14:44:30 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hwn9W-0000pc-S6; Sun, 11 Aug 2019 12:40:50 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=8GhG=WH=gmail.com=wei.liu.linux@srs-us1.protection.inumbo.net>)
 id 1hwlPo-0001Yn-P7
 for xen-devel@lists.xenproject.org; Sun, 11 Aug 2019 10:49:32 +0000
X-Inumbo-ID: b079fab8-bc25-11e9-9934-d3885f46778a
Received: from mail-wr1-f65.google.com (unknown [209.85.221.65])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b079fab8-bc25-11e9-9934-d3885f46778a;
 Sun, 11 Aug 2019 10:49:27 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id t16so11996103wra.6
 for <xen-devel@lists.xenproject.org>; Sun, 11 Aug 2019 03:49:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=E78SJ0Wx+p4WUVJGdn+lRCXRUxyY8ZQuys3hsU4+Pbg=;
 b=gt3yaFNP2NyY2beh32rPdtQ8x+OpKuNr8J2ZwlH7uw4RFn2AfCCcHhF+NGYR2LnS4/
 p3F7JInW4N4UV9B3r+hlFCGT0raj2f/yw1L7cTrFex+bANzyPKn+O9Iym/B9uQCEewvs
 erwPIOC3vbEW2LN2xx5Kjd8EjEAmJmpqZ07IHjOOhTu4YP9xOA/RE5SAwSKBOjpp3FTL
 4b0x0+lag5ZJMqb5QQR8q6I1BUNBIhtsdrqi6OVhbrPEqTnsp1L2zxx8cTSwNIMGo/qM
 zZkkxH04OUGyO3b+a6Vw5aa4XO+wyAdixlCz9ix7y45CQcIilbqUgHk6VAwyAKTvOcRH
 iCiA==
X-Gm-Message-State: APjAAAUhUjJe0sI9CfZdnaephsjQQ8MNFDT4B2XcR3T1oft6f5xNlC+Q
 /OzYFHDEfb5LOa4gsczLhNI=
X-Google-Smtp-Source: APXvYqxSd3h8oHTz6LvtrAtCZl19KIOdEFPI4jkugfz47+BbK2BmVbqu5GEJgHTg0ekVKP29z/vRQQ==
X-Received: by 2002:adf:fcd1:: with SMTP id f17mr22060436wrs.252.1565520566919; 
 Sun, 11 Aug 2019 03:49:26 -0700 (PDT)
Received: from debian (30.163.200.146.dyn.plus.net. [146.200.163.30])
 by smtp.gmail.com with ESMTPSA id 25sm10037491wmi.40.2019.08.11.03.49.26
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Sun, 11 Aug 2019 03:49:26 -0700 (PDT)
Date: Sun, 11 Aug 2019 11:49:24 +0100
From: Wei Liu <wei.liu@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Message-ID: <20190811104924.kzso22ke7jagjvyj@debian>
References: <20190810103108.GA29487@kroah.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190810103108.GA29487@kroah.com>
User-Agent: NeoMutt/20180716
X-Mailman-Approved-At: Sun, 11 Aug 2019 12:40:48 +0000
Subject: Re: [Xen-devel] [PATCH] xen-netback: no need to check return value
 of debugfs_create functions
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
Cc: xen-devel@lists.xenproject.org, Wei Liu <wei.liu@kernel.org>,
 Paul Durrant <paul.durrant@citrix.com>, netdev@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gU2F0LCBBdWcgMTAsIDIwMTkgYXQgMTI6MzE6MDhQTSArMDIwMCwgR3JlZyBLcm9haC1IYXJ0
bWFuIHdyb3RlOgo+IFdoZW4gY2FsbGluZyBkZWJ1Z2ZzIGZ1bmN0aW9ucywgdGhlcmUgaXMgbm8g
bmVlZCB0byBldmVyIGNoZWNrIHRoZQo+IHJldHVybiB2YWx1ZS4gIFRoZSBmdW5jdGlvbiBjYW4g
d29yayBvciBub3QsIGJ1dCB0aGUgY29kZSBsb2dpYyBzaG91bGQKPiBuZXZlciBkbyBzb21ldGhp
bmcgZGlmZmVyZW50IGJhc2VkIG9uIHRoaXMuCj4gCj4gQ2M6IFdlaSBMaXUgPHdlaS5saXVAa2Vy
bmVsLm9yZz4KPiBDYzogUGF1bCBEdXJyYW50IDxwYXVsLmR1cnJhbnRAY2l0cml4LmNvbT4KPiBD
YzogeGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCj4gQ2M6IG5ldGRldkB2Z2VyLmtlcm5l
bC5vcmcKPiBTaWduZWQtb2ZmLWJ5OiBHcmVnIEtyb2FoLUhhcnRtYW4gPGdyZWdraEBsaW51eGZv
dW5kYXRpb24ub3JnPgoKQWNrZWQtYnk6IFdlaSBMaXUgPHdlaS5saXVAa2VybmVsLm9yZz4KCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBt
YWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMu
eGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
