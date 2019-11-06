Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 70AB5F15E5
	for <lists+xen-devel@lfdr.de>; Wed,  6 Nov 2019 13:15:00 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iSK9d-0005Nb-Cn; Wed, 06 Nov 2019 12:11:17 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=SfSz=Y6=gmail.com=dunlapg@srs-us1.protection.inumbo.net>)
 id 1iSK9b-0005N4-VW
 for xen-devel@lists.xenproject.org; Wed, 06 Nov 2019 12:11:16 +0000
X-Inumbo-ID: 879e48da-008e-11ea-9631-bc764e2007e4
Received: from mail-ed1-x52c.google.com (unknown [2a00:1450:4864:20::52c])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 879e48da-008e-11ea-9631-bc764e2007e4;
 Wed, 06 Nov 2019 12:11:15 +0000 (UTC)
Received: by mail-ed1-x52c.google.com with SMTP id b72so19155097edf.1
 for <xen-devel@lists.xenproject.org>; Wed, 06 Nov 2019 04:11:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=umich.edu; s=google-2016-06-03;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ktmJy6Nhl9oEQQVD7Ofkk9UHhWrV78x8iCMMRIS3yyM=;
 b=MZ8Yf8U5Kj3pQhveGUnR4DATu+mT9RczEU6DZqYMJUQ/20pLlJLU2ozSB9ZtGTC970
 +4sFEQJt99byVMYPXx1Acqftbc+CFkniEvRvwAvSn9R3AejzhkxENbmeoVYd87zCXdCg
 0t8QMr+IHpAm05dF6mBUEYoylQ1GZWVtNzUVkA03h9mjauIosnC1wldsRvL3AP/XjelL
 QroMQp8D2gctHHf0RYPOAKyg44n4nBqX66FzkK43zLHs4xEhUZejf+sgf3ayVAjbIGvY
 fM8luZFRouigQqaLQGlFoOkcQu56LRPjaBSEcQeIZAP+jwM4BRvnLo2bDS2ctMtlJ2pj
 ajMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ktmJy6Nhl9oEQQVD7Ofkk9UHhWrV78x8iCMMRIS3yyM=;
 b=aTyWZX1y4UCHVZNBGjns3rt8guzR3DEU8Sxxol3baNk7fPt2rD7GpjRajSUd+dWVFV
 bUeA74K+U0gHQjRunrNLm8ybJoXPDVBatTV0x/S2guwZvYCiwP2XrK0MejNKqpeZ3dW+
 IvVdjGXwCuxARJo6clmGhEUL1beH1zq/I1Wugiy8aRYH1V7irayZo/tNuV3dgQeC7N+6
 Uzxti51kWk1WlgaPZHicy1GqVyDHYzfTS2GHo9CGNmJRsE7UVXcaFZLp9zOsbEuV1+2Z
 bPsGxARdzTztBgPyUc5ciMjYAgPNj1rwK3mjl8pk+5Vw4OlR5r5hQEUThy2Csy9hg7wa
 p8yw==
X-Gm-Message-State: APjAAAWn6j/dewALDa0CYiNmXNLXmP1RmO2+M8bAL6qUxqPNzuVR1+mi
 WCrI+Qff8EiFAgGEd78GnQOsV4CBC+G22JIGaLg=
X-Google-Smtp-Source: APXvYqz5hcXmg4eIeO9EZeMbA90AhZ9P73XGw02UptUAKskPz84nvOxkf44QzKUHRvJc6kQ0Mq9wbQZKCez9sWXSA9Q=
X-Received: by 2002:a17:906:49cd:: with SMTP id
 w13mr32341073ejv.311.1573042274596; 
 Wed, 06 Nov 2019 04:11:14 -0800 (PST)
MIME-Version: 1.0
References: <alpine.DEB.2.21.1911051556200.14907@sstabellini-ThinkPad-T480s>
In-Reply-To: <alpine.DEB.2.21.1911051556200.14907@sstabellini-ThinkPad-T480s>
From: George Dunlap <dunlapg@umich.edu>
Date: Wed, 6 Nov 2019 12:11:03 +0000
Message-ID: <CAFLBxZZcS7kt4n_HPHkff_RdH8ZE6Rc4tp4FvghrJr+7Hzxiew@mail.gmail.com>
To: Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [Xen-devel] Urgent for 4.13,
 Was dom0less + sched=null => broken in staging (fwd)
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
Cc: xen-devel <xen-devel@lists.xenproject.org>, jgross@suse.de,
 Dario Faggioli <dfaggioli@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVHVlLCBOb3YgNSwgMjAxOSBhdCAxMTo1OCBQTSBTdGVmYW5vIFN0YWJlbGxpbmkKPHNzdGFi
ZWxsaW5pQGtlcm5lbC5vcmc+IHdyb3RlOgo+Cj4gSGkgRGFyaW8sCj4KPiBJIGp1c3QgY2hlY2tl
ZCBhbmQgdGhlIHBhdGNoIGlzIG5vdCBpbiBzdGFnaW5nIHlldC4gQ2FuIHdlIHBsZWFzZSBtYWtl
Cj4gc3VyZSB0aGUgcGF0Y2ggZ29lcyBpbiBhcyBzb29uIGFzIHBvc3NpYmxlLCBnaXZlbiB0aGUg
bG9vbWluZyByZWxlYXNlPwoKSSB0aGluayBlaXRoZXIgYSBmaXggb3IgYSByZXZlcnQgb2YgdGhl
IG9yaWdpbmFsIHBhdGNoIG5lZWRzIHRvIGJlIGEKcmVsZWFzZSBibG9ja2VyLgoKIC1HZW9yZ2UK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZl
bCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlz
dHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
