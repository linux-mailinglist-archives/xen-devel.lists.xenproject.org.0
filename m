Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BBF9172F24
	for <lists+xen-devel@lfdr.de>; Fri, 28 Feb 2020 04:08:33 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j7Vxo-0000Cg-4z; Fri, 28 Feb 2020 03:05:20 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=almA=4Q=zededa.com=roman@srs-us1.protection.inumbo.net>)
 id 1j7Vxm-0000Cb-Dt
 for xen-devel@lists.xenproject.org; Fri, 28 Feb 2020 03:05:18 +0000
X-Inumbo-ID: 260d546a-59d7-11ea-83b0-bc764e2007e4
Received: from mail-qv1-xf2a.google.com (unknown [2607:f8b0:4864:20::f2a])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 260d546a-59d7-11ea-83b0-bc764e2007e4;
 Fri, 28 Feb 2020 03:05:18 +0000 (UTC)
Received: by mail-qv1-xf2a.google.com with SMTP id bo12so676074qvb.13
 for <xen-devel@lists.xenproject.org>; Thu, 27 Feb 2020 19:05:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zededa.com; s=google;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=gSHno/HMtjUOzkY1Wd8ygUHJdam8Gvgx+SxW+WLyF8M=;
 b=dLkLrnr7tqQMAuIql8s/L2HZwtH4RAxGJnnvxSku1HVluZ4TF1qYyZLInvPC1A62A9
 lVRYkp8PMyWWdO3JGqQhSSqbyzYAziQILhwZdQPVrJ3NAiEoY6zblW7DhaMX6Db7/MVn
 uC+G+WgWDp8KihBwDLvvCGPLBQQ/5Y+EM3JmQ4VH9Xjx6YsgEF8T3AF+5edDf0CoWVIh
 9hEG0ItYGDLOzt9f2fxrPfVs/lMC8a1ZM9DWzO36+5U7ML3kNjsm7C5k+h4IZ6RClRAI
 QXPl6WIdhUIlyloUqYPhm47cODUBrQYgRCpg4BmcyUTzc+ANQUPAXvLfzSwCb/ggOWVG
 G6Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=gSHno/HMtjUOzkY1Wd8ygUHJdam8Gvgx+SxW+WLyF8M=;
 b=k6vm3ZxvPntcArPFlli8JORE4Jtm4717iLLUqGObplHBOlFVq6vqguOIOXMTEsb3G4
 quLGo8wpNp2Mws6kMKWs0pAxXUL5O7gx27tuq6hoXJHpQ0x6A1SZbN3m5ibxqqCxYVT5
 S1P7KRToe5puf9t13BUd05RtBvdu+NyM4P4Haw2DIzJomv9YkL7Y2xMljOtbqwNJH3AZ
 UoiqtcV2Zhjs+S1SQ+7ERDh5ydcT9OI3AMJj79j3UT2UQqVJE3M88AltQkAmf/YX7S7b
 F414v0Tp+JK6S/N2M6Hgv8TLeHX9h5so+Apmsko5Ge4mpdMRGzKOJBqza709EkrNxIpj
 IDyg==
X-Gm-Message-State: APjAAAUsmhONfKWiEEoLWe8xqrI9tuIp6v5lVRY5yg3MBL0gw7yUvAzr
 dxl4A08F2t6oeSkIA+krVyW0qU6lrOwO+wfQQlOh2JxV
X-Google-Smtp-Source: APXvYqwAATI9vXTrILlxn+0igP0zbagLRCtiPahA7TOg5yRYjD/zY46OdCUfpVQcxWlBTp57866h0LQkZ9KOzfYDBnY=
X-Received: by 2002:a05:6214:4f0:: with SMTP id
 cl16mr2034666qvb.213.1582859117394; 
 Thu, 27 Feb 2020 19:05:17 -0800 (PST)
MIME-Version: 1.0
From: Roman Shaposhnik <roman@zededa.com>
Date: Thu, 27 Feb 2020 19:05:06 -0800
Message-ID: <CAMmSBy_tX+cM6aE9WO1yO1AJPwVdDYEA-a1HxLE5xczC7WfiLg@mail.gmail.com>
To: xen-devel@lists.xenproject.org
Subject: [Xen-devel] xenfs work
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
Cc: Juergen Gross <jgross@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkhCgpJJ20gcmVhbGx5IGV4Y2l0ZWQgYWJvdXQgYWxsIHRoZSB4ZW5mcyBwYXRjaGVzLCBidXQg
SSdtIHdvbmRlcmluZwppZiB0aGVyZSdzIGEgYnJhbmNoIHRoYXQgdHJhY2tzIHRoYXQgd29yayBJ
IGNhbiBwbGF5IHdpdGg/CgpUaGFua3MsClJvbWFuLgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxA
bGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL3hlbi1kZXZlbA==
