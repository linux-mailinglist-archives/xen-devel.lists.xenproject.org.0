Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BB37F8D18
	for <lists+xen-devel@lfdr.de>; Tue, 12 Nov 2019 11:43:53 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iUTci-0003Vq-0B; Tue, 12 Nov 2019 10:42:12 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=RWbO=ZE=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1iUTcg-0003Vi-Bz
 for xen-devel@lists.xenproject.org; Tue, 12 Nov 2019 10:42:10 +0000
X-Inumbo-ID: 13f288f6-0539-11ea-9631-bc764e2007e4
Received: from mail-wm1-f65.google.com (unknown [209.85.128.65])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 13f288f6-0539-11ea-9631-bc764e2007e4;
 Tue, 12 Nov 2019 10:42:09 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id u18so2541922wmc.3
 for <xen-devel@lists.xenproject.org>; Tue, 12 Nov 2019 02:42:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=GnF18ifx9wD1qNylOWs+dA7+dl+lnNZzkQSAAP5jnwc=;
 b=O/sYf5UBUL196vyakMPv7fd8S+qnoIs53hEqpEweDKpaRj3KttxBYRm+78eSJ0kbAh
 51ONRbWr+izW3HWM0re4uhwOMRXaFJZuz0y2/cz1r+NZZHZ0p4Hce8EgHbRROo/zBc4v
 d4w7DxvPpOAeO+p3F4AA9ZWEyOzQ4pXDReybEnPlwc4O4d6RXuZ4IYOPMBJ6xDoxrDkd
 pUacxZZ/ei8kTtOpRfFDFluEdXo6UjMP4upg/ZhaERusSXEAHypAPT1XsnMke/2fyySS
 S05zYPhCLfwOqhoOPV1qnHBSvyvLIZXJ6ymisYm9ZR092u6kFhF1inrtiIgx1R1nWVt0
 uaPA==
X-Gm-Message-State: APjAAAWnGdyiuAVP9FD4eeSSKrdvTzI7/oeeReFWXaQjPOmVtm5mIu8z
 5ZWyBN03Ae8dXLHDRBkOYFg=
X-Google-Smtp-Source: APXvYqw+MmmxOM93E0e+BrnpDbZ0Hh4qniU9X27b/AiuHm0BQWpB2tFkMoPkyh5yAUHwHFFfA2mtkw==
X-Received: by 2002:a1c:3cc4:: with SMTP id j187mr3367172wma.95.1573555329159; 
 Tue, 12 Nov 2019 02:42:09 -0800 (PST)
Received: from debian (63.149.115.87.dyn.plus.net. [87.115.149.63])
 by smtp.gmail.com with ESMTPSA id 36sm25921219wrj.42.2019.11.12.02.42.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Nov 2019 02:42:08 -0800 (PST)
Date: Tue, 12 Nov 2019 10:42:07 +0000
From: Wei Liu <wl@xen.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <20191112104207.yacyxgkiyvjg6mzj@debian>
References: <20191111202443.7154-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191111202443.7154-1-andrew.cooper3@citrix.com>
User-Agent: NeoMutt/20180716
Subject: Re: [Xen-devel] [PATCH for-4.13] xen: Drop bogus BOOLEAN
 definitions, TRUE and FALSE
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
Cc: Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Jan Beulich <JBeulich@suse.com>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gTW9uLCBOb3YgMTEsIDIwMTkgYXQgMDg6MjQ6NDNQTSArMDAwMCwgQW5kcmV3IENvb3BlciB3
cm90ZToKPiBhY3R5cGVzLmggYW5kIGVmaWRlZi5oIGJvdGggZGVmaW5lIEJPT0xFQU4gYXMgdW5z
aWduZWQgY2hhciwgd2hpY2ggaXMgYnVnZ3kgaW4KPiBjb21iaW5hdGlvbiB3aXRoIGxvZ2ljIHN1
Y2ggYXMgIkJPT0xFQU4gYiA9IChhICYgMHgxMDApOyIgIFJlZGVmaW5lIEJPT0xFQU4gYXMKPiBi
b29sIGluc3RlYWQsIHdoaWNoIGRvZXNuJ3QgdHJ1bmNhdGUuCj4gCj4gQm90aCBhbHNvIGRlZmlu
ZSBUUlVFIGFuZCBGQUxTRSwgd2l0aCBhY3R5cGVzLmggYmVpbmcgZXh0cmEgcnVkZSBhbmQgcmVw
bGFjaW5nCj4gd2hhdGV2ZXIgZXhpc3RzIHRodXMgZmFyLiAgRHJvcCBhbGwgdXNlcyBvZiBUUlVF
IGFuZCBGQUxTRSwgcmVwbGFjaW5nIHRoZW0KPiB3aXRoIHRydWUvZmFsc2UgcmVzcGVjdGl2ZWx5
LCBhbmQgZHJvcCB0aGUgZGVjbGFyYXRpb25zLgo+IAo+IEFsc28gZHJvcCB0aGUgcG9pbnRsZXNz
IGNvbmRpdGlvbmFsIGRlY2xhcmF0aW9uIG9mIE5VTEwgd2hpbGUgY2xlYW5pbmcgdGhpcwo+IHVw
Lgo+IAo+IEZpbmFsbHksIGNvcnJlY3QgYWxsIHRoZSBjb21tZW50cyB3aGljaCB3aGljaCB3ZXJl
IGZvdW5kIGJ5IHNlZC4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcu
Y29vcGVyM0BjaXRyaXguY29tPgoKUmV2aWV3ZWQtYnk6IFdlaSBMaXUgPHdsQHhlbi5vcmc+Cgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwg
bWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3Rz
LnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
