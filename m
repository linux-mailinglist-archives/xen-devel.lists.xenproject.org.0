Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F22A1CE65
	for <lists+xen-devel@lfdr.de>; Tue, 14 May 2019 19:55:49 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hQbZu-0002MS-LD; Tue, 14 May 2019 17:51:02 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=lzk1=TO=cardoe.com=cardoe@srs-us1.protection.inumbo.net>)
 id 1hQbZt-0002MN-7c
 for xen-devel@lists.xenproject.org; Tue, 14 May 2019 17:51:01 +0000
X-Inumbo-ID: d538870b-7670-11e9-8980-bc764e045a96
Received: from mail-yw1-xc43.google.com (unknown [2607:f8b0:4864:20::c43])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id d538870b-7670-11e9-8980-bc764e045a96;
 Tue, 14 May 2019 17:50:59 +0000 (UTC)
Received: by mail-yw1-xc43.google.com with SMTP id t5so70412ywf.10
 for <xen-devel@lists.xenproject.org>; Tue, 14 May 2019 10:50:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cardoe.com; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=4i/ZROasR4IeCSwkgn7hc++DLSrI7g2l0IABSUvDVIA=;
 b=DynbeWHWyeKX5rQZx4tonc8HSFIm7JRUS54/MGBWn2+1V/tZwk9IUpZ10Yu1dRL9ov
 JnosLhtrAzHAZmE/8jWU5UG/xl37h8W0bw89umjO1U5vGLSvM7RkkKhy/WYiYRsOnKyG
 ePQp7QKsTzzbGE3Oh++BppxSgu6VJJDhUaxw8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to:user-agent;
 bh=4i/ZROasR4IeCSwkgn7hc++DLSrI7g2l0IABSUvDVIA=;
 b=I0Nich2zCZLK8iRK2OoxAFs1rO9uLbyb2phlcxOXkp0eBmTKB+as9lhDoC86r3syrF
 E+GZI9lnH2iLjvfFsO8lDagyatEjYwYFRrPqZf8hoDAhZFuTvPDuv7jJ7+xoZpQZkq9I
 I5f2rzPvvCK7Jlc880F20Arff56LNPjJ+sOlK9WRScC7+5/GaLZfXl/gQneRRLmTUMlP
 iB3wxCNKzcb9/W3pGcV1DFTpVYQJAIABa4hECen7hiRU/xZzD7oYmyxq2ihLIdgNTAnA
 9FqzI+SOcahgAAdKI1JsHBO8SaxjA+JEwv6UQti2uSRnYt0gk3sTtC2SZO/6YlalkJ16
 7O+Q==
X-Gm-Message-State: APjAAAWtyz4gXVXE8mA4LcLjAmYO+r/qQn5Z/aLakx4ZZtFB7UtfgVow
 4j2bpmmUGo48a0NrHpR6FOT5XA==
X-Google-Smtp-Source: APXvYqza+31ehBa7TjRU8eDVmMxZWACmtG9VL8mDNBz5LyB0HSUJWbWRzLvEni/tDW04TtghjSOJgQ==
X-Received: by 2002:a81:49d6:: with SMTP id w205mr7226272ywa.263.1557856259429; 
 Tue, 14 May 2019 10:50:59 -0700 (PDT)
Received: from MacBook-Pro.localdomain
 ([2600:1700:7b90:52f0:d48c:fa38:7cd8:6419])
 by smtp.gmail.com with ESMTPSA id n12sm1199605ywn.81.2019.05.14.10.50.58
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 14 May 2019 10:50:58 -0700 (PDT)
Date: Tue, 14 May 2019 12:50:58 -0500
From: Doug Goldstein <cardoe@cardoe.com>
To: Wei Liu <wei.liu2@citrix.com>
Message-ID: <20190514175058.7mvtv5mh3dwyx3wh@MacBook-Pro.localdomain>
Mail-Followup-To: Wei Liu <wei.liu2@citrix.com>, xen-devel@lists.xenproject.org
References: <20190416072139.490-1-wei.liu2@citrix.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190416072139.490-1-wei.liu2@citrix.com>
User-Agent: NeoMutt/20180716
Subject: Re: [Xen-devel] [PATCH] gitlab-ci: allow specifying base and tip in
 build test
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
Cc: xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVHVlLCBBcHIgMTYsIDIwMTkgYXQgMDg6MjE6MzlBTSArMDEwMCwgV2VpIExpdSB3cm90ZToK
PiBXZSB3aWxsIHNvb24gcHJvdmlkZSB0aGlzIG5ldyBjYXBhYmlsaXR5IHRvIGh1bWFucyBhbmQg
YXV0b21hdGVkCj4gc3lzdGVtcy4KPiAKPiBUaGUgZGVmYXVsdCBiZWhhdmlvdXIgaXMgcmV0YWlu
ZWQ6IHRpcCBhbmQgYmFzZSBhcmUgcGFzc2VkIGJ5IEdpdGxhYgo+IENJLgo+IAo+IFNpZ25lZC1v
ZmYtYnk6IFdlaSBMaXUgPHdlaS5saXUyQGNpdHJpeC5jb20+CgpTd29yZSBJIHJlcGxpZWQgdG8g
dGhpcyBhbHJlYWR5LiBJIGFwb2xvZ2l6ZS4KCkFja2VkLWJ5OiBEb3VnIEdvbGRzdGVpbiA8Y2Fy
ZG9lQGNhcmRvZS5jb20+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRl
dmVs
