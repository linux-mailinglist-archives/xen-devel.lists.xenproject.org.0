Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DDD9476D1
	for <lists+xen-devel@lfdr.de>; Sun, 16 Jun 2019 22:48:50 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hcc2O-0007wc-Rk; Sun, 16 Jun 2019 20:46:04 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=jm3+=UP=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1hcc2N-0007wU-7A
 for xen-devel@lists.xenproject.org; Sun, 16 Jun 2019 20:46:03 +0000
X-Inumbo-ID: c032e5b2-9077-11e9-8980-bc764e045a96
Received: from mail-wm1-f66.google.com (unknown [209.85.128.66])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id c032e5b2-9077-11e9-8980-bc764e045a96;
 Sun, 16 Jun 2019 20:46:01 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id c6so7011410wml.0
 for <xen-devel@lists.xenproject.org>; Sun, 16 Jun 2019 13:46:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=qf1BEb/rZuf+uxsC7A/vy+PawnFDjvO9cQdyB6M5doQ=;
 b=lqG0huYiqjbAkXNYBSKtEK/kNtwueKBqDTuZU9dB5eMKIE9NxgR9I/Uh6k1Zrb1fOq
 r5XUdLzjjfogDkXTruAB6GuqB4X9ADXrX3/HjRDhr4Z9VrBBy7axRZf5OdRGZAP7slXr
 eXcn6cKmqCWdRV2twwo/ka5z7gG1YDWV82g+nZ5pqvlGnzt+wX3sfcL+M4/TAH68O6iT
 vQEeahUNvr97pFLvSLzdEU7v3BJTZxAIC+r+qvI/AqlkurpkY9GRPy+eZP//cw4kfTtW
 ao24SNe12HpnTTNXS8VKNAdq0XomAnRYAbuv6q1eopVP5Mc93gl12AI/GR8feBfyZLlS
 VRmQ==
X-Gm-Message-State: APjAAAXz83FHKTAxzQdnqWcKfL+sLmdze2Vmaa2sv6V7KKaMiYPhmZO6
 JH5Jh9nhK1XyvjqatgdlEzk=
X-Google-Smtp-Source: APXvYqyHitSX1Oj0/RSB7KD3MaKWXWwdI+8wYxvA35tDWgQ3/T3fhIFmKY69/KTCzqfvKstNOxsOvQ==
X-Received: by 2002:a7b:c3d7:: with SMTP id t23mr15463283wmj.94.1560717960871; 
 Sun, 16 Jun 2019 13:46:00 -0700 (PDT)
Received: from debian ([213.31.248.216])
 by smtp.gmail.com with ESMTPSA id o4sm7626731wmh.35.2019.06.16.13.46.00
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Sun, 16 Jun 2019 13:46:00 -0700 (PDT)
Date: Sun, 16 Jun 2019 21:45:58 +0100
From: Wei Liu <wl@xen.org>
To: Roger Pau Monne <roger.pau@citrix.com>
Message-ID: <20190616204558.fzm7o4e26hlsurlk@debian>
References: <20190530144028.54203-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190530144028.54203-1-roger.pau@citrix.com>
User-Agent: NeoMutt/20180716
Subject: Re: [Xen-devel] [PATCH] automation: fix typo in comment
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
Cc: xen-devel@lists.xenproject.org, Doug Goldstein <cardoe@cardoe.com>,
 Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVGh1LCBNYXkgMzAsIDIwMTkgYXQgMDQ6NDA6MjhQTSArMDIwMCwgUm9nZXIgUGF1IE1vbm5l
IHdyb3RlOgo+IFNpZ25lZC1vZmYtYnk6IFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRy
aXguY29tPgoKQWNrZWQtYnk6IFdlaSBMaXUgPHdsQHhlbi5vcmc+CgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3Jn
L21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
