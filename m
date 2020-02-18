Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A79A162262
	for <lists+xen-devel@lfdr.de>; Tue, 18 Feb 2020 09:28:55 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j3yD0-0001Be-6X; Tue, 18 Feb 2020 08:26:22 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=7Tum=4G=gmail.com=anastassios.nanos@srs-us1.protection.inumbo.net>)
 id 1j3yCx-0001BZ-Vn
 for Xen-devel@lists.xenproject.org; Tue, 18 Feb 2020 08:26:20 +0000
X-Inumbo-ID: 56519cfa-5228-11ea-bc8e-bc764e2007e4
Received: from mail-wm1-x329.google.com (unknown [2a00:1450:4864:20::329])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 56519cfa-5228-11ea-bc8e-bc764e2007e4;
 Tue, 18 Feb 2020 08:26:19 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id a5so1812530wmb.0
 for <Xen-devel@lists.xenproject.org>; Tue, 18 Feb 2020 00:26:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=MyAp1pJdrjilhjI8FRzjoWj6hVYcDcdZIr3+eLy6X7o=;
 b=i8FG02nFOrezo9Nn11aoytCihOtvEQ9q72R+WRhAYrGRKXe6QI716zj8wiXum2mE1f
 LoJEtEULyRzrCyKQ6ntaAovzWWsu0JxVfCPvByMlmWsK4FYSyBkZVCGyjo3G90uXm1dc
 jIAl40xIfIPxIO17kfWBIF6KxF0D1AtJgY5I42aCPvpAjaBU4Z1cPqRiUlh1qimAzVLH
 IY22zmWnE8uE10xYBiObTy43rE293YAjjuYGylYNdk7dhNG+cjIL9cjI4ClQHc+phNps
 g4JEDRMW3BuEKBcjaH0NwzFtLyAtboA6vUaLIAg+1iyGIDSJVDZZs3Cbq7zCwffJFRl5
 r6KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=MyAp1pJdrjilhjI8FRzjoWj6hVYcDcdZIr3+eLy6X7o=;
 b=jlSUu4+UXZAFMCApTDz7186whuS25bEY0ALucfP9v/CRRZtnPPGWZ/RT8pEN7MrzEf
 fQl3WCJJx/ga57UvovVsoU1WRVum7OgyHGg1PHPp4dGIzWO/L/kRpFgxRi8oAd4VT8mD
 NPD7S3Iz+07wgeLxiarJZPDYA46CviS18QxlViNpW0nXDhoAAFRmr3aZRUuc5fhNd/pE
 5QwV0Z0IYbk3dxsG9HeO0uFXJinLcRREtRM5SCaLtfFFq/mBSFVzosQjY5P5SvJZgUqZ
 zyXdIPNj+y/uymxwiga8QuzO8nxZHGUiqR5NW62eTTDo7NnS1vof6ucumpcLsPhsHj8T
 bP7g==
X-Gm-Message-State: APjAAAVR+mwIyqF41nV8O+K2MQjACXuYXEngyNZRtZw6Dl7msTk5nfma
 1iOyg8a2Jw6IH5fLWXPpOOIPN3vJd1fNeUhYYpMFEoDIvho=
X-Google-Smtp-Source: APXvYqyLqZKfwkKGqfPYUJAZDix5Y83AqLVq3xvzq0vJtPKYTPufQdMAcAFsR/v9acgDbK4iHFhiPf6jp7ysPAttBzI=
X-Received: by 2002:a1c:bc08:: with SMTP id m8mr1731643wmf.189.1582014378160; 
 Tue, 18 Feb 2020 00:26:18 -0800 (PST)
MIME-Version: 1.0
From: Anastassios Nanos <anastassios.nanos@gmail.com>
Date: Tue, 18 Feb 2020 08:26:06 +0000
Message-ID: <CALRTab99=Cf2C1qzCUkJGqVYsi9_SQ8kurasVn=v8f6=u34Ktg@mail.gmail.com>
To: xen-devel <Xen-devel@lists.xenproject.org>
Subject: [Xen-devel] CfP VHPC 2020
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgYWxsLAoKSSB0aGluayB0aGF0IGl0IG1pZ2h0IGJlIG9mIGludGVyZXN0IHRvIHRoaXMgbGlz
dCwgc28gSSdtIHNlbmRpbmcgYQpicmllZiBkZXNjcmlwdGlvbiBvZiBvdXIgd29ya3Nob3AncyBz
Y29wZSwgVmlydHVhbGl6YXRpb24gaW4KSGlnaC1wZXJmb3JtYW5jZSBDbG91ZCBjb21wdXRpbmcg
KFZIUEMsIGh0dHBzOi8vdmhwYy5vcmcpLCBhbgphY2FkZW1pYy9pbmR1c3RyeSB3b3Jrc2hvcCBo
ZWxkIGluIGNvbmp1bmN0aW9uIHdpdGggSVNDLUhQQwooaHR0cHM6Ly9pc2MtaHBjLmNvbSkgaW4g
RnJhbmtmdXJ0LCBKdW5lIDI1dGguIFdlIGhhdmUgYmVlbiBydW5uaW5nCnRoaXMgcXVpdGUgc29t
ZSB0aW1lLCBhbmQgd2Ugd291bGQgYmUgcmVhbGx5IGdsYWQgaWYgeW91IGNvbnNpZGVyZWQKc3Vi
bWl0dGluZyBhbnkgd29yayB5b3UgbWlnaHQgaGF2ZSBvbiB0aGUgdG9waWMuCgpJIHRoaW5rIHRo
ZSBtb3N0IHJlbGV2YW50IHN1YnRvcGljcyB0byBwZW9wbGUgcmVhZGluZyB0aGlzIGxpc3QgYXJl
OgpsaWdodHdlaWdodCB2aXJ0dWFsaXphdGlvbiwgcHJvY2Vzc29yIHZpcnR1YWxpemF0aW9uLCBh
bmQgbGliT1MgLwp1bmlrZXJuZWxzLgoKQWRkaXRpb25hbGx5LCB3ZSBlbmNvdXJhZ2UgcGVvcGxl
IHRvIHN1Ym1pdCB3b3JrcyByZWxhdGVkIHRvCkhpZ2gtUGVyZm9ybWFuY2UgQ29tcHV0aW5nIChI
UEMpLCBzdWNoIGFzIHdvcmtsb2FkIG9yY2hlc3RyYXRpb24sIEdQVQp2aXJ0dWFsaXphdGlvbiwg
YWNjZWxlcmF0aW9uIGluIGdlbmVyYWwsIGFuZCBuZXR3b3JraW5nL3N0b3JhZ2UKaGFuZGxpbmcg
aW4gVk1zIGZvciBIUEMuCgpUaGUgc3VibWlzc2lvbiBkZWFkbGluZSBpcyBvbiBBcHIgNXRoLCAy
MDIwLCB3aXRoIGEgcm9sbGluZyBhYnN0cmFjdCBzdWJtaXNzaW9uLgoKVGhhbmtzIGZvciB5b3Vy
IHRvbGVyYW5jZSBvbiB0aGUgc29tZWhvdyBvZmYtdG9waWMgcG9zdC4gUGxlYXNlIHZpc2l0Cmh0
dHBzOi8vdmhwYy5vcmcgZm9yIG1vcmUgaW5mbyBhbmQgdGhlIGZ1bGwgbGlzdCBvZiB0b3BpY3Ms
IHN1Ym1pc3Npb24KaW5mb3JtYXRpb24gZXRjLgoKdGhhbmtzIQpBLgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApY
ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
