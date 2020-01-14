Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DA9213A9BB
	for <lists+xen-devel@lfdr.de>; Tue, 14 Jan 2020 13:52:37 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1irLda-0007Xr-2W; Tue, 14 Jan 2020 12:49:38 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=eDHu=3D=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1irLdZ-0007Xm-9e
 for xen-devel@lists.xenproject.org; Tue, 14 Jan 2020 12:49:37 +0000
X-Inumbo-ID: 4ef58b6f-36cc-11ea-8391-12813bfff9fa
Received: from mail-wm1-f66.google.com (unknown [209.85.128.66])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 4ef58b6f-36cc-11ea-8391-12813bfff9fa;
 Tue, 14 Jan 2020 12:49:32 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id 20so13553045wmj.4
 for <xen-devel@lists.xenproject.org>; Tue, 14 Jan 2020 04:49:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=NSHo1V26Ded0aRj9cqeoc3w4WpSftS6/s023WdHObGQ=;
 b=BDh5sHCx2JbxmvXa0G4qMX81VzS5AEc20WK7ObOasULwoG4ffLWdZz/I5JN9BQoxj3
 6Tawgqe5HoX7kJyURIuRumVp4WKYUN+VWxWYL5blPWB/t6JirweKiQcg9rSvscb1PWr8
 yt9Pyvho38Kc/oOBB/cQxL/KH30XqII7+8KqCC+ChvIrha2+SpID5JrKfA4yKkkZ7X7I
 HPNWn3naCia7cAvcgNO0EcRcqFAgvrq6XI+QpUsF6yYrSYV1mnpbzWHLb5DXzgIPrqEu
 Jb5YE9uUIJ+4f8OTtkG26A7yvLcdk4Fn0e9C25mknDKwBDxKaBxinvxNfEN0RWL43rrg
 AQCw==
X-Gm-Message-State: APjAAAXj0o/R+gGfCWOpRYv0CnIO7GotejWOaIjOXa+sviPQ/6DmcG/E
 F23IaQrqnRzd1ZaXOnMM9Mw=
X-Google-Smtp-Source: APXvYqwRydWi8ZIktA5g10l+SVbjH3IyqbDmrtI0lLeLAGDwF40ESII/QiDXQdeApexybTh6bociMw==
X-Received: by 2002:a05:600c:21c6:: with SMTP id
 x6mr25942067wmj.177.1579006172159; 
 Tue, 14 Jan 2020 04:49:32 -0800 (PST)
Received: from debian (41.142.6.51.dyn.plus.net. [51.6.142.41])
 by smtp.gmail.com with ESMTPSA id b17sm19134853wrp.49.2020.01.14.04.49.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Jan 2020 04:49:31 -0800 (PST)
Date: Tue, 14 Jan 2020 12:49:29 +0000
From: Wei Liu <wl@xen.org>
To: Juergen Gross <jgross@suse.com>
Message-ID: <20200114124929.g2faxidlfncdcfy7@debian>
References: <20200114123445.17507-1-jgross@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200114123445.17507-1-jgross@suse.com>
User-Agent: NeoMutt/20180716
Subject: Re: [Xen-devel] [PATCH] remove unmodified_drivers directory
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Jan Beulich <jbeulich@suse.com>,
 xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVHVlLCBKYW4gMTQsIDIwMjAgYXQgMDE6MzQ6NDVQTSArMDEwMCwgSnVlcmdlbiBHcm9zcyB3
cm90ZToKPiBIYXZpbmcgTGludXgga2VybmVsIGRyaXZlcnMgZm9yIDIuNiBiYXNlZCBrZXJuZWxz
IGluIHRoZSBYZW4gdHJlZSBpcwo+IG5vdCByZWFsbHkgbmVlZGVkIGFueSBsb25nZXIuIFNvIHJl
bW92ZSB0aGVtIGZyb20gdGhlIHRyZWUuCj4gCj4gSW4gY2FzZSBhbnlvbmUgd2FudHMgdG8gbG9v
ayBhdCB0aGVtIHRoZXkgYXJlIHN0aWxsIGF2YWlsYWJsZSBpbgo+IG9sZGVyIGJyYW5jaGVzLgo+
IAo+IFNpZ25lZC1vZmYtYnk6IEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4KCk5pY2Ug
ZGlmZnN0YXQuIDstKQoKVWx0aW1hdGVseSBJIHRoaW5rIEphbiBpcyB0aGUgb25lIHdobyBuZWVk
cyB0byBhY2sgdGhpcyBwYXRjaC4KCldlaS4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3Rz
LnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0
aW5mby94ZW4tZGV2ZWw=
