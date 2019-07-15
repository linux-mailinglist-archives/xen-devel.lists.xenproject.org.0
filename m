Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DAEE686A4
	for <lists+xen-devel@lfdr.de>; Mon, 15 Jul 2019 11:51:38 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hmxbW-0007Sw-DD; Mon, 15 Jul 2019 09:49:06 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=2rOe=VM=gmail.com=dunlapg@srs-us1.protection.inumbo.net>)
 id 1hmxbU-0007Sr-NR
 for xen-devel@lists.xenproject.org; Mon, 15 Jul 2019 09:49:04 +0000
X-Inumbo-ID: c7374699-a6e5-11e9-8980-bc764e045a96
Received: from mail-ed1-x530.google.com (unknown [2a00:1450:4864:20::530])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id c7374699-a6e5-11e9-8980-bc764e045a96;
 Mon, 15 Jul 2019 09:49:03 +0000 (UTC)
Received: by mail-ed1-x530.google.com with SMTP id p15so14773961eds.8
 for <xen-devel@lists.xenproject.org>; Mon, 15 Jul 2019 02:49:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=umich.edu; s=google-2016-06-03;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=pi2pHwiX8ivTsz/Uutp82byjz7j/OQYSVcex6JvV8Mw=;
 b=cpevA4Xm5luopxWM3W1rNxUORkUrnivkh/eK1qjR8eC/pJqcdBzBPSKb6M8WHRpar3
 D9KF+dp4ppbtc0X1FtmY2LF/5xaqyQrjg8aDL/8ynCOvri1rxQODsxiC38eTaRGKJOHn
 aTxGUoNAjMbfbV45ML5Ay/UFRpQfJXULJd0eDW0haISnXNJCtC85Row75APB7Nq8QV1q
 Oabdzku3SfmZFkL1MwZ7srFCoeo/B2JYaI6qKOHAjC8mKoiizQDRW5vxw8Z9a4mrTW16
 okfVa4fq61Q/Pve01jVpyu8KiFLOFH/UVkgeAkcRtZadJITlaLN0sXOhchsWoX321ZDt
 Ub7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=pi2pHwiX8ivTsz/Uutp82byjz7j/OQYSVcex6JvV8Mw=;
 b=tGhnT38EvrTDGAzNGrNEhb2p2l8+Lez6CLQTuZZOA/bl2FYqVjVC2Xs47ezvFNYCJi
 onw4qdRVlO4T9HAjD7uGNTkDYD+s386RN7tSFlKjPZK4uiFm3yzDtdOvvhj2j/eSMOBQ
 CuhhQLZtVxZrc45cLU7SBpr2r44i9Fsa6TyCmGKW76VCwMdFwP9bCQh2JjRMvCuGOZIe
 rcmJ/LSpK/rJjlxBo6C/137+GSI0nJVHL64bRFoFnQc127d8Tg9J1gSRN7hTxC+dc0Xk
 weU/3CsZiMRb12KNEoG3IbnWGMJbHwY2D6BIUOX4drpAKwJ9GqCDX8sGjiY/lCsDg2Id
 NfBg==
X-Gm-Message-State: APjAAAWBoXmiVIdIm27B+sTJ6AmoPpT4Mat0TASYwAoEzGTwHnaHSo6e
 wZ8iumlqGHo1DTxWA0n+xPrllFTSk5Wqln0ltLurZSGQrqY=
X-Google-Smtp-Source: APXvYqyYExOXyhi4M1yQ2o4DICgr3pClmxVJ7ZXvtAOq2PyrPamOd01p+N8/hrjgZCx1g62pxgPMG+bL5fM14Y9u3Oo=
X-Received: by 2002:aa7:c509:: with SMTP id o9mr22466069edq.164.1563184142859; 
 Mon, 15 Jul 2019 02:49:02 -0700 (PDT)
MIME-Version: 1.0
References: <23848.65064.511423.772481@mariner.uk.xensource.com>
In-Reply-To: <23848.65064.511423.772481@mariner.uk.xensource.com>
From: George Dunlap <dunlapg@umich.edu>
Date: Mon, 15 Jul 2019 10:48:51 +0100
Message-ID: <CAFLBxZZtRpBu0NojZftUW7D33Fn3cCKS4SJYoYkbjns+ysJ0tg@mail.gmail.com>
To: Ian Jackson <ian.jackson@citrix.com>
Subject: Re: [Xen-devel] Notes from summit design session on branch
 management
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
Cc: xen-devel <xen-devel@lists.xenproject.org>,
 Doug Goldstein <cardoe@cardoe.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gRnJpLCBKdWwgMTIsIDIwMTkgYXQgMTA6NDEgUE0gSWFuIEphY2tzb24gPGlhbi5qYWNrc29u
QGNpdHJpeC5jb20+IHdyb3RlOgo+Cj4gSGVyZSBhcmUgdGhlIHBob3RvcyBJIHRvb2sgb2YgdGhl
IGZsaXBjaGFydDoKPiAgIGh0dHBzOi8veGVuYml0cy54ZW4ub3JnL3Blb3BsZS9pd2ovMjAxOS9z
dW1taXQtY2ktYnJhbmNoLXdvcmtzaG9wLwoKRllJLCBJIGNhbiBzZWUgdGhlIGRpcmVjdG9yeSwg
YnV0IHdoZW4gSSBjbGljayBvbiB0aGUgaW5kaXZpZHVhbAppbWFnZXMsIEkgZ2V0IHRoaXM6CgpZ
b3UgZG9uJ3QgaGF2ZSBwZXJtaXNzaW9uIHRvIGFjY2VzcwovcGVvcGxlL2l3ai8yMDE5L3N1bW1p
dC1jaS1icmFuY2gtd29ya3Nob3AvSU1HXzIwMTkwNzExXzExNTUwNy5qcGcgb24KdGhpcyBzZXJ2
ZXIuCgogLUdlb3JnZQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5v
cmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZl
bA==
