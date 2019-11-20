Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 727C41037FC
	for <lists+xen-devel@lfdr.de>; Wed, 20 Nov 2019 11:53:33 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iXNYe-0006Ks-SA; Wed, 20 Nov 2019 10:50:00 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Kz7b=ZM=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1iXNYd-0006Kn-J8
 for xen-devel@lists.xenproject.org; Wed, 20 Nov 2019 10:49:59 +0000
X-Inumbo-ID: 7e7bd6f0-0b83-11ea-a30e-12813bfff9fa
Received: from mail-wm1-f67.google.com (unknown [209.85.128.67])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 7e7bd6f0-0b83-11ea-a30e-12813bfff9fa;
 Wed, 20 Nov 2019 10:49:58 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id z19so7269088wmk.3
 for <xen-devel@lists.xenproject.org>; Wed, 20 Nov 2019 02:49:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=qZOXFqmgK6gyqUmMARhggd2pW7T+BCVoBGrd4wH+5Ws=;
 b=JqOcxCp0pVjXviCb384Vmi6QBMzI1dYgwu3FL2hjoFrQ/X4ePoHqrU7lIrc3oWaPa+
 cGJzxbl4aEiYKJgyiPEqzeZbNWlD0UiFt5zeAVcoDrit9N0jpPwW/ZlDuCQcaCGEEPR0
 Ke9NY+DmZ76wsf9hXOvR9i4NYrM81mvS0vJK4YX9WsevZO45RWCWlSFfWA6TzMS9im9i
 PoW9HouZlFifOUz6wFp+GmSIAqbiV8959RK8+BILwlDVLNYoAAmKrhCCCYwAqZ1gvbvR
 +JUIE5Qfx1qgZNhOVztEJjIx78bWCl4c9asO1ljwPdHJ875c7ll9u2lzeudDkOojrubp
 QPJw==
X-Gm-Message-State: APjAAAVKzxa9MhrVWJPXJSFI7sc+AOQjMRvYOxxkGXGIjaIX/9f+m0x+
 2e/5DucBi7Vk5jC2VDuRPMo=
X-Google-Smtp-Source: APXvYqwX+DYCT6D3th44JqxUsc6I8qDKPDZobhssYPW5FMxgjAXdtGcNFpLDRhoJnLdQzz6StiIfEg==
X-Received: by 2002:a05:600c:410:: with SMTP id
 q16mr2410696wmb.2.1574246997515; 
 Wed, 20 Nov 2019 02:49:57 -0800 (PST)
Received: from debian (74.162.147.147.dyn.plus.net. [147.147.162.74])
 by smtp.gmail.com with ESMTPSA id v184sm6447829wme.31.2019.11.20.02.49.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Nov 2019 02:49:56 -0800 (PST)
Date: Wed, 20 Nov 2019 10:49:55 +0000
From: Wei Liu <wl@xen.org>
To: =?utf-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <20191120104955.2ceq2arqgl722kxr@debian>
References: <20191115161532.1231811-1-anthony.perard@citrix.com>
 <7d61ba64-d278-ec11-bbf7-a91bcd4b50e6@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <7d61ba64-d278-ec11-bbf7-a91bcd4b50e6@suse.com>
User-Agent: NeoMutt/20180716
Subject: Re: [Xen-devel] [XEN PATCH for-4.13] configure: Fix test for python
 3.8
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
Cc: Anthony PERARD <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
 Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wl@xen.org>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gV2VkLCBOb3YgMjAsIDIwMTkgYXQgMTE6NDE6MjRBTSArMDEwMCwgSsO8cmdlbiBHcm/DnyB3
cm90ZToKPiBPbiAxNS4xMS4xOSAxNzoxNSwgQW50aG9ueSBQRVJBUkQgd3JvdGU6Cj4gPiBodHRw
czovL2RvY3MucHl0aG9uLm9yZy8zLjgvd2hhdHNuZXcvMy44Lmh0bWwjZGVidWctYnVpbGQtdXNl
cy10aGUtc2FtZS1hYmktYXMtcmVsZWFzZS1idWlsZAo+ID4gCj4gPiA+IFRvIGVtYmVkIFB5dGhv
biBpbnRvIGFuIGFwcGxpY2F0aW9uLCBhIG5ldyAtLWVtYmVkIG9wdGlvbiBtdXN0IGJlCj4gPiA+
IHBhc3NlZCB0byBweXRob24zLWNvbmZpZyAtLWxpYnMgLS1lbWJlZCB0byBnZXQgLWxweXRob24z
LjggKGxpbmsgdGhlCj4gPiA+IGFwcGxpY2F0aW9uIHRvIGxpYnB5dGhvbikuIFRvIHN1cHBvcnQg
Ym90aCAzLjggYW5kIG9sZGVyLCB0cnkKPiA+ID4gcHl0aG9uMy1jb25maWcgLS1saWJzIC0tZW1i
ZWQgZmlyc3QgYW5kIGZhbGxiYWNrIHRvIHB5dGhvbjMtY29uZmlnCj4gPiA+IC0tbGlicyAod2l0
aG91dCAtLWVtYmVkKSBpZiB0aGUgcHJldmlvdXMgY29tbWFuZCBmYWlscy4KPiA+IAo+ID4gU2ln
bmVkLW9mZi1ieTogQW50aG9ueSBQRVJBUkQgPGFudGhvbnkucGVyYXJkQGNpdHJpeC5jb20+Cj4g
Cj4gUmVsZWFzZS1hY2tlZC1ieTogSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29tPgo+IAoK
VGhhbmtzLgoKVW5mb3J0dW5hdGVseSBJIGZvcmdvdCB0byBhZGQgaW4gdGhpcyB0YWcgd2hlbiBJ
IHB1c2hlZCB0aGUgcGF0Y2guLi4KCldlaS4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3Rz
LnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0
aW5mby94ZW4tZGV2ZWw=
