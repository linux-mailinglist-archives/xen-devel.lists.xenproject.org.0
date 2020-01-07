Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 96CB813249B
	for <lists+xen-devel@lfdr.de>; Tue,  7 Jan 2020 12:15:46 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iomnS-000809-86; Tue, 07 Jan 2020 11:13:14 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=HXEJ=24=gmail.com=julien.grall.oss@srs-us1.protection.inumbo.net>)
 id 1iomnQ-000804-Qk
 for xen-devel@lists.xenproject.org; Tue, 07 Jan 2020 11:13:12 +0000
X-Inumbo-ID: b04a024a-313e-11ea-abd3-12813bfff9fa
Received: from mail-wm1-f67.google.com (unknown [209.85.128.67])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b04a024a-313e-11ea-abd3-12813bfff9fa;
 Tue, 07 Jan 2020 11:13:12 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id q9so18504623wmj.5
 for <xen-devel@lists.xenproject.org>; Tue, 07 Jan 2020 03:13:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Jy1IX1szOQBxbzQSosQ0qrYnYfDt0MblWIZbMNQkfv8=;
 b=Z2EkO7v8+EaVVpsenPtXgPAFFM/Cf0LIzWjFCwwd+dTMX1LxMhoqouXHC/wCDTR2rf
 jo9qvBXakm0TQaIfc2J1uHRf+OHPVfDkS6SOue2BGh2EyYQBg6i9M2m6ju8sNwQAkaI2
 OXyhu2IfgTzUqXzgcKl+VpBZM0c8f3vW46E6H4sI+6yhPzXlF73Kqo+CZkwzYCcr9K+M
 MIsqpUPDYWC7gRm3MTbhsFwrYLkeCC0iQuWDT/aR+l783bPM2iK/cEF3wEWqKRVoNYMu
 cOOyX9EoQnPDkUkaHgPnIm8qlIhAeTONUCrnm2a+cXidi4hPW0d0e3FdzNgxXrtoK5hW
 DuTw==
X-Gm-Message-State: APjAAAUp6Ebzn35P/R8jKzP0P4NcH+y3alLvy5He6X2P6MUsFqTdck9p
 iY9L85mzP/NaR2b4HKeF8yw=
X-Google-Smtp-Source: APXvYqzUwhMGQI/PxqisAqaO/a5FLLWhpbZkBtgm8BPK20y1k9s95h9QJ5ZNfOLISj36S8yQPSmApA==
X-Received: by 2002:a1c:628b:: with SMTP id w133mr38795396wmb.25.1578395591218; 
 Tue, 07 Jan 2020 03:13:11 -0800 (PST)
Received: from a483e7b01a66.ant.amazon.com (54-240-197-236.amazon.com.
 [54.240.197.236])
 by smtp.gmail.com with ESMTPSA id b68sm26246975wme.6.2020.01.07.03.13.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Jan 2020 03:13:10 -0800 (PST)
To: Wei Xu <xuwei5@hisilicon.com>, Stefano Stabellini <sstabellini@kernel.org>
References: <1577498922-192711-1-git-send-email-xuwei5@hisilicon.com>
 <e96ddb84-db96-5316-05a7-632fed7dddb8@xen.org>
 <5E071910.2070002@hisilicon.com>
 <alpine.DEB.2.21.2001061359580.732@sstabellini-ThinkPad-T480s>
 <5E1443CD.3060908@hisilicon.com>
 <5e39e799-a716-ee84-2061-a295335607e8@xen.org>
 <5E144F54.8000702@hisilicon.com>
 <3c34a558-43dc-c6e4-0db2-aa7393e53440@xen.org> <5E1463D6.50108@hisilicon.com>
From: Julien Grall <julien@xen.org>
Message-ID: <9a69f001-be35-dbae-2a74-9da36aa85171@xen.org>
Date: Tue, 7 Jan 2020 11:13:09 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.3.1
MIME-Version: 1.0
In-Reply-To: <5E1463D6.50108@hisilicon.com>
Content-Language: en-GB
Subject: Re: [Xen-devel] [PATCH] xen/arm: vgic-v3: Fix the typo of GICD IRQ
 active status range
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
Cc: xen-devel@lists.xenproject.org,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, prime.zeng@hisilicon.com,
 shameerali.kolothum.thodi@huawei.com, linuxarm@huawei.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

CgpPbiAwNy8wMS8yMDIwIDEwOjU2LCBXZWkgWHUgd3JvdGU6Cj4+IE1heWJlIEkgYW0gbWlzc2lu
ZyBzb21ldGhpbmcsIGJ1dCBMaW51eCBzZWVtcyB0byBiZSBydW5uaW5nIGZpbmUgYW5kIEkgCj4+
IGNhbid0IHNwb3QgYW55IGVycm9yIHJlbGF0ZWQgdG8gcmVhZCB0aGUgYWN0aXZlIHN0YXR1cyBy
ZWdpc3Rlci4gQnkgCj4+IGFueSBjaGFuY2UsIGRpZCB5b3UgYnVpbGQgWGVuIHdpdGggeW91ciBw
YXRjaD8KPj4KPiAKPiBZZXMsIEkgYnVpbHQgWGVuIHdpdGggbXkgcGF0Y2guCgpUaGUgcmVhc29u
IEkgYXNrZWQgdGhlIGxvZyBpcyB0byBzZWUgd2hhdCBpcyB0aGUgc3BsYXQgeW91IHJlY2VpdmUg
ZnJvbSAKTGludXggd2l0aG91dCB5b3VyIHBhdGNoLiBTbyBjYW4geW91IHNlbmQgdGhlIHNwbGF0
IHlvdSBoYXZlIHdpdGhvdXQgCnlvdXIgcGF0Y2g/CgpDaGVlcnMsCgotLSAKSnVsaWVuIEdyYWxs
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2
ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xp
c3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
