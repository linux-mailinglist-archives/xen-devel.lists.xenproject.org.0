Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CB1F91325C6
	for <lists+xen-devel@lfdr.de>; Tue,  7 Jan 2020 13:13:12 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ionhh-0006Oa-Hq; Tue, 07 Jan 2020 12:11:21 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Heq1=24=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1ionhg-0006OV-ME
 for xen-devel@lists.xenproject.org; Tue, 07 Jan 2020 12:11:20 +0000
X-Inumbo-ID: cffaaeb4-3146-11ea-abec-12813bfff9fa
Received: from mail-wr1-f67.google.com (unknown [209.85.221.67])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id cffaaeb4-3146-11ea-abec-12813bfff9fa;
 Tue, 07 Jan 2020 12:11:19 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id c14so53651256wrn.7
 for <xen-devel@lists.xenproject.org>; Tue, 07 Jan 2020 04:11:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=zutyjfUSSDCrCOz71FwUS4/D7EllHHCnXyJIPgQy+Ic=;
 b=FPVm7rhS6R67+zdYQZbAGcoAEYdjoXaQrv0Qrbx2QhQVqU9gQY0IoQFwtbQuYZ/hh3
 t5k9y5C6PtMtyu3c22R76FU6r5G+Z3vRxAXo/p6uFJylcUwHjQ7HZ3cpj3dOO09Tav4X
 zSbbDpH+X7RcKfSS13ieYY5NEXFsqjemTXtchJgB/eW3/TvCBS9klPwaiExDv68dtbRJ
 lcMVrq/5RjMovnZkPzW5a9l2U1uIhPxHRod//x0D1CE2nJ0/I4czTtY5wuaJgYSekIvE
 u00mEm2udvOic7sucwaqpAunifvhRv1W/tjfHVlrrgXsIFM5YUQUMDYmWik9Slj0GxIn
 Y6XQ==
X-Gm-Message-State: APjAAAW+ZHBq/qipv2NrdwonZwcM2aasKcb/RN0LVO/sIEbMUjJa1AkN
 fSeUWOIbzyENEhNPOMVKEU0=
X-Google-Smtp-Source: APXvYqw9rrK/VpN+LwUTXzmvicpF/kgNxzDW0All8WkQXjZqL3aj5rhlxooAVdV9UH3A+dYiTaSthg==
X-Received: by 2002:a5d:4e90:: with SMTP id
 e16mr113133442wru.318.1578399079101; 
 Tue, 07 Jan 2020 04:11:19 -0800 (PST)
Received: from debian (38.163.200.146.dyn.plus.net. [146.200.163.38])
 by smtp.gmail.com with ESMTPSA id m3sm75708258wrs.53.2020.01.07.04.11.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jan 2020 04:11:18 -0800 (PST)
Date: Tue, 7 Jan 2020 12:11:16 +0000
From: Wei Liu <wl@xen.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <20200107121116.7hgur4yjrz3rcn64@debian>
References: <20200103172248.22407-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200103172248.22407-1-andrew.cooper3@citrix.com>
User-Agent: NeoMutt/20180716
Subject: Re: [Xen-devel] [PATCH] tools/restore: Drop unused parameters from
 xc_domain_restore()
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
 Ian Jackson <Ian.Jackson@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gRnJpLCBKYW4gMDMsIDIwMjAgYXQgMDU6MjI6NDhQTSArMDAwMCwgQW5kcmV3IENvb3BlciB3
cm90ZToKPiBUaGUgaHZtIGFuZCBwYWUgcGFyYW1ldGVycyBhcmUgYSByZW1uYW50IG9mIGxlZ2Fj
eSBtaWdyYXRpb24uICBUaGV5IGhhdmUgMAo+IHBhc3NlZCBpbiBmcm9tIGxpYnhsX3N0cmVhbV9y
ZWFkLmMncyBwcm9jZXNzX3JlY29yZCgpLCBhbmQgYXJlIGRpc2NhcmRlZCBpbgo+IHhjX2RvbWFp
bl9yZXN0b3JlKCkuCj4gCj4gV2hpbGUgZHJvcHBpbmcgdGhlc2UsIHVwZGF0ZSB0aGUgZG94eWdl
biBjb21tZW50IHRvIGJlIGFjY3VyYXRlLCBhbmQgc2ltcGxpZnkKPiB0aGUgb3RoZXIgaHZtIHZz
IHB2IGhhbmRsaW5nIGluIHhjX2RvbWFpbl9yZXN0b3JlKCkuCj4gCj4gTm8gZnVuY3Rpb25hbCBj
aGFuZ2UuCj4gCj4gU2lnbmVkLW9mZi1ieTogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNA
Y2l0cml4LmNvbT4KCkFja2VkLWJ5OiBXZWkgTGl1IDx3bEB4ZW4ub3JnPgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlz
dApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
