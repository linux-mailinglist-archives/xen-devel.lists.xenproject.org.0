Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C63558D0DB
	for <lists+xen-devel@lfdr.de>; Wed, 14 Aug 2019 12:40:55 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hxqfA-0007KM-Ea; Wed, 14 Aug 2019 10:37:52 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=5qws=WK=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1hxqf8-0007KE-VZ
 for xen-devel@lists.xenproject.org; Wed, 14 Aug 2019 10:37:51 +0000
X-Inumbo-ID: 901399c6-be7f-11e9-b704-db13eca06f99
Received: from mail-wr1-f65.google.com (unknown [209.85.221.65])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 901399c6-be7f-11e9-b704-db13eca06f99;
 Wed, 14 Aug 2019 10:37:50 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id g17so110607346wrr.5
 for <xen-devel@lists.xenproject.org>; Wed, 14 Aug 2019 03:37:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=UnbS0wAzc/lWWb+gPdu1RkJcA3dq0sS2bT3hPte9pSM=;
 b=uCFRfoQwyW749wAaq9NnLcDcPQh0U3ELN2t5IWwiXymoNY0jXEGorCa7qLuiZtB2G0
 V/c1H3SfY+hn8FUkPMeuRkfWEaqSM/lBGWByLymPiHrHAwT71LaEbq9EV3viR4vOhVfj
 jPuJoUZFFd66I+cLZ1uCU/9NvnXS6eyQs21btGmekV+vVnJ5MGk/bA7yRSVGZ4NUyDo5
 1jfKH7FBrmmPZUl1Q4+PkIUcFLgBZCvy0yBt8fHWuuFEueVcT6aOZ8KorJm3TmTEUq2t
 2mJa0ZBXVaDwrf6jdOrZFd5CNNE1p0ajqqeMYDtlMUFiC3FcVuhdvlLWU2JXyt7WTKFM
 I83A==
X-Gm-Message-State: APjAAAVD123TODT22tpjl7/maLrT/Yyoq87MJVmFq53p6F+iIkbOQDJ/
 ynqkZqK7cyAhHvh+3OrQ3Dg=
X-Google-Smtp-Source: APXvYqzzgWajcPVxilX6Tkb/oFEfWDELYTQUkr8rGXgsWfVOWqWNtyJwcC5E0A2Ihrnw4a+r3lP7Tg==
X-Received: by 2002:adf:e94a:: with SMTP id m10mr53255405wrn.245.1565779069629; 
 Wed, 14 Aug 2019 03:37:49 -0700 (PDT)
Received: from
 liuwe-gateway.j3c5onc20sse1dnehy4noqpfcg.zx.internal.cloudapp.net
 ([51.140.50.101])
 by smtp.gmail.com with ESMTPSA id a64sm4730214wmf.1.2019.08.14.03.37.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Aug 2019 03:37:49 -0700 (PDT)
Date: Wed, 14 Aug 2019 10:37:47 +0000
From: Wei Liu <wl@xen.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <20190814103747.ck6uskrkdpbee7ez@liuwe-gateway.j3c5onc20sse1dnehy4noqpfcg.zx.internal.cloudapp.net>
References: <20190813135211.13668-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190813135211.13668-1-andrew.cooper3@citrix.com>
User-Agent: NeoMutt/20180716
Subject: Re: [Xen-devel] [PATCH] tools/xenstat: Fix -Wformat-truncation=
 issue
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
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>,
 Ian Jackson <Ian.Jackson@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVHVlLCBBdWcgMTMsIDIwMTkgYXQgMDI6NTI6MTFQTSArMDEwMCwgQW5kcmV3IENvb3BlciB3
cm90ZToKPiBCdWlsZGluZyB3aXRoIEdDQyA4LjMgb24gQnVzdGVyIGlkZW50aWZpZXM6Cj4gCj4g
ICBzcmMveGVuc3RhdF9saW51eC5jOiBJbiBmdW5jdGlvbiAneGVuc3RhdF9jb2xsZWN0X25ldHdv
cmtzJzoKPiAgIHNyYy94ZW5zdGF0X2xpbnV4LmM6MzA3OjMyOiB3YXJuaW5nOiAnc25wcmludGYn
IG91dHB1dCBtYXkgYmUgdHJ1bmNhdGVkIGJlZm9yZQo+ICAgdGhlIGxhc3QgZm9ybWF0IGNoYXJh
Y3RlciBbLVdmb3JtYXQtdHJ1bmNhdGlvbj1dCj4gICAgIHNucHJpbnRmKGRldk5vQnJpZGdlLCAx
NiwgInAlcyIsIGRldkJyaWRnZSk7Cj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IF4KPiAgIHNyYy94ZW5zdGF0X2xpbnV4LmM6MzA3OjI6IG5vdGU6ICdzbnByaW50Zicgb3V0cHV0
IGJldHdlZW4gMiBhbmQgMTcgYnl0ZXMgaW50bwo+ICAgYSBkZXN0aW5hdGlvbiBvZiBzaXplIDE2
Cj4gICAgIHNucHJpbnRmKGRldk5vQnJpZGdlLCAxNiwgInAlcyIsIGRldkJyaWRnZSk7Cj4gICAg
IF5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn4KPiAKPiBkZXZOb0Jy
aWRnZVtdIG5lZWRzIG9uZSBjaGFyYXRlciBtb3JlIHRoYW4gZGV2QnJpZGdlW10sIHNvIGFsbG9j
YXRlIG9uZSBieXRlCj4gbW9yZS4gIFJlcGxhY2UgYSByYXcgMTYgaW4gdGhlIHNucHJpbnRmKCkg
Y2FsbCB3aXRoIGEgc2l6ZW9mKCkgZXhwcmVzc2lvbgo+IGluc3RlYWQuCj4gCj4gRmluYWxseSwg
bGlieGVuc3RhdCwgdW5saWtlIG1vc3Qgb2YgdGhlIHJlc3Qgb2YgdGhlIFhlbiwgZG9lc24ndCB1
c2UgLVdlcnJvcgo+IHdoaWNoIGlzIHdoeSB0aGlzIGlzc3VlIHdlbnQgdW5ub3RpY2VkIGluIENJ
LiAgRml4IHRoaXMuCj4gCj4gU2lnbmVkLW9mZi1ieTogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNv
b3BlcjNAY2l0cml4LmNvbT4KCkFja2VkLWJ5OiBXZWkgTGl1IDx3bEB4ZW4ub3JnPgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxp
bmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5w
cm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
