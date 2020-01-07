Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B54A1132B4D
	for <lists+xen-devel@lfdr.de>; Tue,  7 Jan 2020 17:46:35 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iorxQ-0007wu-Ra; Tue, 07 Jan 2020 16:43:52 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Heq1=24=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1iorxQ-0007wp-2S
 for xen-devel@lists.xenproject.org; Tue, 07 Jan 2020 16:43:52 +0000
X-Inumbo-ID: dd775c56-316c-11ea-bf56-bc764e2007e4
Received: from mail-wr1-f66.google.com (unknown [209.85.221.66])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id dd775c56-316c-11ea-bf56-bc764e2007e4;
 Tue, 07 Jan 2020 16:43:43 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id j42so65175wrj.12
 for <xen-devel@lists.xenproject.org>; Tue, 07 Jan 2020 08:43:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=BdnwRIvFMCwclwi1yfiFpGf+Qj1oIeYBiApLArwbrNE=;
 b=DI2aKpX2XmHPkXkW4EwLobJEpaBnKDyU97Ez/mUIERLXVUCVPiPgQDMCYQnZUwcEAv
 8x2SqPqN1tMo1jdrMtaGolBhhhdGHCCI4e2OFybN1CbpyqxrGP3gvjzo9zfZsm2uzzHF
 KcXOsHl7q/SKRXoGUGkjorgcxfVKbIgpagTbnSn4TVQAjR2Q7O1mLk5e9g/13ioW3mGT
 1fNVk9ThL1votzJRx32Z2buy9OTja/xgk642eivLrtBjvgsc4R5N7CPcQFpEcUAV0YRK
 MEyAsLF5N5v5lfSKorqWfG/FvUr9X68IrraY3rneSMQ2DCXA23EurekHGzKnMimXjrXv
 NsvQ==
X-Gm-Message-State: APjAAAVdJMhKRDS1zUW5ESrHBYZIKiDgwWTQesGhENfCnK46/UOVlt5B
 5Vi3mdx6DdIZmS8U0CrwkpQ=
X-Google-Smtp-Source: APXvYqyc/AjjI4FRY+AWreFNfUeYDlEtIT3E73GquUNF2AK9+BzeIn4pzOceI6Y9Y7sTKOH+e0rNjQ==
X-Received: by 2002:adf:c145:: with SMTP id w5mr110137312wre.205.1578415422707; 
 Tue, 07 Jan 2020 08:43:42 -0800 (PST)
Received: from debian (38.163.200.146.dyn.plus.net. [146.200.163.38])
 by smtp.gmail.com with ESMTPSA id s15sm520028wrp.4.2020.01.07.08.43.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jan 2020 08:43:42 -0800 (PST)
Date: Tue, 7 Jan 2020 16:43:40 +0000
From: Wei Liu <wl@xen.org>
To: Jan Beulich <jbeulich@suse.com>
Message-ID: <20200107164340.xirwdi5x23dvoicg@debian>
References: <3d085404-ab62-fd67-646b-d539c77080d9@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <3d085404-ab62-fd67-646b-d539c77080d9@suse.com>
User-Agent: NeoMutt/20180716
Subject: Re: [Xen-devel] [PATCH] libxl: don't needlessly report "highmem" in
 use
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
Cc: Anthony Perard <anthony.perard@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVHVlLCBKYW4gMDcsIDIwMjAgYXQgMDM6NTg6MDdQTSArMDEwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gRHVlIHRvIHRoZSB1bmNvbmRpdGlvbmFsIHVwZGF0aW5nIG9mIGRvbS0+aGlnaG1lbV9l
bmQgaW4KPiBsaWJ4bF9fZG9tYWluX2RldmljZV9jb25zdHJ1Y3RfcmRtKCkgSSd2ZSBvYnNlcnZl
ZCBvbiBhIDJHYiBIVk0gZ3Vlc3QKPiB3aXRoIGEgcGFzc2VkIHRocm91Z2ggZGV2aWNlICh3aXRo
b3V0IG92ZXJseSBsYXJnZSBCQVJzLCBhbmQgd2l0aCBubyBSRE0KPiByYW5nZXMgYXQgYWxsKQo+
IAo+IChkMikgUkFNIGluIGhpZ2ggbWVtb3J5OyBzZXR0aW5nIGhpZ2hfbWVtIHJlc291cmNlIGJh
c2UgdG8gMTAwMDAwMDAwCj4gLi4uCj4gKGQyKSBFODIwIHRhYmxlOgo+IChkMikgIFswMF06IDAw
MDAwMDAwOjAwMDAwMDAwIC0gMDAwMDAwMDA6MDAwYTAwMDA6IFJBTQo+IChkMikgIEhPTEU6IDAw
MDAwMDAwOjAwMGEwMDAwIC0gMDAwMDAwMDA6MDAwZDAwMDAKPiAoZDIpICBbMDFdOiAwMDAwMDAw
MDowMDBkMDAwMCAtIDAwMDAwMDAwOjAwMTAwMDAwOiBSRVNFUlZFRAo+IChkMikgIFswMl06IDAw
MDAwMDAwOjAwMTAwMDAwIC0gMDAwMDAwMDA6N2Y4MDAwMDA6IFJBTQo+IChkMikgIEhPTEU6IDAw
MDAwMDAwOjdmODAwMDAwIC0gMDAwMDAwMDA6ZmMwMDAwMDAKPiAoZDIpICBbMDNdOiAwMDAwMDAw
MDpmYzAwMDAwMCAtIDAwMDAwMDAxOjAwMDAwMDAwOiBSRVNFUlZFRAo+IChkMikgIFswNF06IDAw
MDAwMDAxOjAwMDAwMDAwIC0gMDAwMDAwMDE6MDAwMDAwMDA6IFJBTQo+IAo+IGJvdGggb2Ygd2hp
Y2ggYXJlbid0IHJlYWxseSBhcHByb3ByaWF0ZSBpbiB0aGlzIGNhc2UuIEFycmFuZ2UgZm9yIHRo
aXMKPiB0byBub3QgaGFwcGVuLgoKSW5kZWVkLiBXZSBzaG91bGRuJ3QgbmVlZCB0byBtb3ZlIFJB
TSB0byBoaWdoIGFkZHJlc3MgaW4gdGhpcwpjb25maWd1cmF0aW9uLgoKQWNrZWQtYnk6IFdlaSBM
aXUgPHdsQHhlbi5vcmc+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRl
dmVs
