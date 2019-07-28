Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7219677F1A
	for <lists+xen-devel@lfdr.de>; Sun, 28 Jul 2019 12:59:01 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hrgqA-0000dY-SW; Sun, 28 Jul 2019 10:55:46 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ytr0=VZ=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1hrgq8-0000dT-Ov
 for xen-devel@lists.xenproject.org; Sun, 28 Jul 2019 10:55:44 +0000
X-Inumbo-ID: 3c7f7e6c-b126-11e9-9bdf-c33eebf10f8c
Received: from mail-wm1-f66.google.com (unknown [209.85.128.66])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 3c7f7e6c-b126-11e9-9bdf-c33eebf10f8c;
 Sun, 28 Jul 2019 10:55:39 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id l2so51024062wmg.0
 for <xen-devel@lists.xenproject.org>; Sun, 28 Jul 2019 03:55:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=3vZGJHNhA8A9pCr1LSjvDw8shnx92G6UnbExLHL7HqI=;
 b=Fc2mANLGGpVXMV6QSRyO/1RncZ5O0qEM5rUlg3Vq9X+BBu6f6rjtCa/K+ngSWBMHFk
 E0q7Qwj71KrTc5efBe/som6dLjP29uyoPQNZ7Rn0RKB4JackVRYP2SQHQleUyRb1NfrO
 R363rhUU2eey4Emc4MFHpXgCqUrw4Q4dlq1JuR0aXQ/bOJv7vhx0of/jpyibgdRRzpeM
 C7fZNEGuILSYmhPPtI/Mxtqh2dkLxLHaenUSy4/gTBQC86ShiEvO977XwIm28fR+YIeG
 5IbzaU04ld39ZmeuNaQduQXf02q05ev4eUjVoQk8SmktozpfYWVfRBahpY3DkQ8wdGoR
 SEHQ==
X-Gm-Message-State: APjAAAWPWHuZPrTXdb9R2UhWbCfyE1donP2cGFot2kHkEvv1GN6Qzbz8
 ahTBhwu+YHZPNyeOHtMUc50=
X-Google-Smtp-Source: APXvYqyheURAXjUgOrXEI+IWZIVbVaJwrN6tGf+MUan3OvJG2e1EoZkzgs2KkXg0McfIYE/RNW1EzA==
X-Received: by 2002:a7b:c0c6:: with SMTP id s6mr19431394wmh.115.1564311338886; 
 Sun, 28 Jul 2019 03:55:38 -0700 (PDT)
Received: from debian ([213.31.248.211])
 by smtp.gmail.com with ESMTPSA id k124sm95415050wmk.47.2019.07.28.03.55.38
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Sun, 28 Jul 2019 03:55:38 -0700 (PDT)
Date: Sun, 28 Jul 2019 11:55:36 +0100
From: Wei Liu <wl@xen.org>
To: Dario Faggioli <dfaggioli@suse.com>
Message-ID: <20190728105536.fezkzvqmie7zgdml@debian>
References: <156417922934.29470.16776755402986910394.stgit@Palanthas>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <156417922934.29470.16776755402986910394.stgit@Palanthas>
User-Agent: NeoMutt/20180716
Subject: Re: [Xen-devel] [PATCH] tools: ipxe: update for fixing build with
 GCC9
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
Cc: xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gU2F0LCBKdWwgMjcsIDIwMTkgYXQgMTI6MTM6NDlBTSArMDIwMCwgRGFyaW8gRmFnZ2lvbGkg
d3JvdGU6Cj4gQnVpbGRpbmcgd2l0aCBHQ0M5IChvbiBvcGVuU1VTRSBUdWJtbGV3ZWVkKSBnZW5l
cmF0ZXMgYSBsb3Qgb2YgZXJyb3JzIG9mCj4gdGhlICJ0YWtpbmcgYWRkcmVzcyBvZiBwYWNrZWQg
bWVtYmVyIG9mIC4uLiBtYXkgcmVzdWx0IGluIGFuIHVuYWxpZ25lZAo+IHBvaW50ZXIgdmFsdWUi
IGtpbmQuCj4gCj4gVXBkYXRpbmcgdG8gdXBzdHJlYW0gY29tbWl0IDFkZDU2ZGJkMTEwODIgKCJb
YnVpbGRdIFdvcmthcm91bmQgY29tcGlsYXRpb24KPiBlcnJvciB3aXRoIGdjYyA5LjEiKSBzZWVt
cyB0byBmaXggdGhlIHByb2JsZW0uCj4gCj4gRm9yIG1vcmUgaW5mbywgc2VlOgo+IAo+IGh0dHBz
Oi8vZ2l0LmlweGUub3JnL2lweGUuZ2l0L2NvbW1pdC8xZGQ1NmRiZDExMDgyZmI2MjJjMmVkMjFj
ZmFjZWQ0ZjQ3ZDc5OGE2Cj4gCj4gU2lnbmVkLW9mZi1ieTogRGFyaW8gRmFnZ2lvbGkgPGRmYWdn
aW9saUBzdXNlLmNvbT4KPiAtLS0KPiBDYzogV2VpIExpdSA8d2xAeGVuLm9yZz4KPiAtLS0KPiBI
ZXksIFdlaSwKPiAKPiBJIGhhdmUgbmV2ZXIgcGxheWVkIG11Y2ggd2l0aCBpcHhlLCBzbyBJIGNh
bid0IGJlIDEwMCUgc3VyZSB0aGF0IHRoaXMgaXMKPiB0aGUgYmVzdCBpZGVhLCBhbmQgd2hhdCBj
b3VsZCBiZSB0aGUgcHJvYmxlbXMuCj4gCgpZZXMgdGhpcyBpcyB3aGF0IHdlIG5vcm1hbGx5IGRv
LgoKQWNrZWQtYnk6IFdlaSBMaXUgPHdsQHhlbi5vcmc+CgpGdXJ0aGVyIGltcHJvdmVtZW50IHdv
dWxkIGJlIHRvIHNlcGFyYXRlIGlweGUgZnJvbSB0aGUgYnVpbGQgYW5kIHRyYWNrCnVwc3RyZWFt
IGluIG9zc3Rlc3Qgc2luY2UgdG9vbHMgaXMgbm93IGFibGUgdG8gbG9hZCBhbiBJUFhFIGJpbmFy
eSwgYnV0CnRoaXMgd2lsbCBkby4KCldlaS4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3Rz
LnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0
aW5mby94ZW4tZGV2ZWw=
