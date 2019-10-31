Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 65896EB78A
	for <lists+xen-devel@lfdr.de>; Thu, 31 Oct 2019 19:50:27 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iQFTo-0002pd-4t; Thu, 31 Oct 2019 18:47:32 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=RS8g=YY=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1iQFTm-0002pY-2w
 for xen-devel@lists.xenproject.org; Thu, 31 Oct 2019 18:47:30 +0000
X-Inumbo-ID: e32cd48e-fc0e-11e9-beca-bc764e2007e4
Received: from mail-wm1-f68.google.com (unknown [209.85.128.68])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e32cd48e-fc0e-11e9-beca-bc764e2007e4;
 Thu, 31 Oct 2019 18:47:29 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id n7so7048735wmc.3
 for <xen-devel@lists.xenproject.org>; Thu, 31 Oct 2019 11:47:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=QU2S7oU640jfCWGUZlFdNmNFu44Utfnytf89Ws0GKrI=;
 b=pZmh858fZK/cIIK7jrd5wu7QQpvQ7uwNlwNISBUMrKkCI+WI6hGFCVWKt4ketW/HVk
 R7Wh0QrQMXV2rO5gNEcZ8kAcf1t14f4F8JQB7F2Ep4QIXovvTlQNVHgW+2JW7LCbAqYc
 GmpkQlloD5yAznHDNHfQMcBDzijRS1mcLv/UsF+dA8W48WiEZSwEDXyP5kdYSFyiNJEG
 BvKjP1B/u/ZX4+jVTvsNU10cjz8Xx7eFCxdulKiNo9t6bJ7lWF5zIG3wXa85nP71gJH3
 1nOLeLava2rzMun+TuuGCCHqX4GkrsNl6K8vIdC+mCyYX7stdZcaQ1kcUiN9Iv+eSrYA
 kg4w==
X-Gm-Message-State: APjAAAVd8c8KbULlibmmEiA25RwwQxGCc0gGP4JlPpYMucMsJknEXbkJ
 tjk6x2Tq6Xv8UxFqy+aTq70=
X-Google-Smtp-Source: APXvYqz+xKQNCiUb4vr707hQq9lgHDzlXClVbjCQpE734aFhaR4RLw2B/pUocsVcJc6Y7GOiacvT5A==
X-Received: by 2002:a1c:1d41:: with SMTP id d62mr6515819wmd.32.1572547647994; 
 Thu, 31 Oct 2019 11:47:27 -0700 (PDT)
Received: from debian (30.162.147.147.dyn.plus.net. [147.147.162.30])
 by smtp.gmail.com with ESMTPSA id p13sm5015208wma.41.2019.10.31.11.47.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 31 Oct 2019 11:47:27 -0700 (PDT)
Date: Thu, 31 Oct 2019 18:47:26 +0000
From: Wei Liu <wl@xen.org>
To: Roger Pau Monne <roger.pau@citrix.com>
Message-ID: <20191031184726.htvflwo4afowfbdc@debian>
References: <20191031115829.74378-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191031115829.74378-1-roger.pau@citrix.com>
User-Agent: NeoMutt/20180716
Subject: Re: [Xen-devel] [PATCH for-4.13] x86/shim: copy back the result of
 EVTCHNOP_status
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
Cc: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org,
 Wei Liu <wl@xen.org>, Jan Beulich <jbeulich@suse.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVGh1LCBPY3QgMzEsIDIwMTkgYXQgMTI6NTg6MjlQTSArMDEwMCwgUm9nZXIgUGF1IE1vbm5l
IHdyb3RlOgo+IFRoZSBldmVudCBjaGFubmVsIGRhdGEgd2FzIG5vdCBjb3BpZWQgYmFjayB0byBn
dWVzdCBtZW1vcnksIGZpeCB0aGlzCj4gYnkgZG9pbmcgdGhlIGNvcHkuCj4gCj4gU2lnbmVkLW9m
Zi1ieTogUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+CgpSZXZpZXdlZC1i
eTogV2VpIExpdSA8d2xAeGVuLm9yZz4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5m
by94ZW4tZGV2ZWw=
