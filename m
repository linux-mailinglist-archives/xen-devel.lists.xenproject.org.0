Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F2BCAFE051
	for <lists+xen-devel@lfdr.de>; Fri, 15 Nov 2019 15:43:45 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iVcmy-0007Bm-MF; Fri, 15 Nov 2019 14:41:32 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=1SQg=ZH=gmail.com=rosbrookn@srs-us1.protection.inumbo.net>)
 id 1iVcmx-0007Bh-6d
 for xen-devel@lists.xenproject.org; Fri, 15 Nov 2019 14:41:31 +0000
X-Inumbo-ID: 02b70088-07b6-11ea-b678-bc764e2007e4
Received: from mail-lf1-x142.google.com (unknown [2a00:1450:4864:20::142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 02b70088-07b6-11ea-b678-bc764e2007e4;
 Fri, 15 Nov 2019 14:41:30 +0000 (UTC)
Received: by mail-lf1-x142.google.com with SMTP id j14so8186265lfb.8
 for <xen-devel@lists.xenproject.org>; Fri, 15 Nov 2019 06:41:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=h/rbbDHTAt6TbgatRjVRnQPaqSDr5KAgRjZFfFRHl9c=;
 b=scm7mAJ3TttvE/GFaPx6xE9Jlu+wY+8+CRa2Iq4S7vsfj79OmngGt1R7QeUYzZsJHc
 kJqYJMH8JJbvFFkv2KCNvEDP5R8nDsoK+20w7CQhf6TeIjyCQ+sjKzMDRc785rCs8Siq
 HV3MGFyqQFti7u6TB6oMnk3qvw4ljmHV+sLueVD1l69o7ZXyPYflRNAVtwhlAnO9mZa2
 QRdJSDP2Yp494Fu3WMlukLuHKiaymkY7Emp42DsZwfpoRSU/KtbBrl2dC7s3slz3KyT5
 wSDt4cV++mUAkaRJEyKQK6XojAUhIb5MMxsI+s4FOY2SVmfgklok76qPmIJpPkg8uYvI
 VwCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=h/rbbDHTAt6TbgatRjVRnQPaqSDr5KAgRjZFfFRHl9c=;
 b=hUM42RXO4ntouR2Jebp+HZrqFImwt/zqxHQS0tL14Htz6ocgTdTp/tzKGS4jRbVWx1
 AYq63tQDLvOvrUOkGporbqrSBjnrF8ohis7FG0jDO1ecr64Tr5DltrG5L5cPHTDf5k84
 8I/twKU6ym5CGiO1/ktSEHOerSwOmvyLqnAhzzhfRYXMWTpfJHjK7SyL7c10Re/MwbgZ
 fzJCusTuIPkG8FKfUmYyBtgGTtV9oosFAkW+RQEJfK50QVKs7mPg+n/8e55EocXOFBPF
 UQB6A47F/404PQz7n1fHx27qMYRhGUYSVolt/vbgRAm6K8kt81ucwCe15cLrWkaoLQTc
 Sydw==
X-Gm-Message-State: APjAAAULbu7vfgwEzOBoeepbhaZcuq6kwP/UhAdllZlyPyz8VtF5fojs
 zrK6JoFe+fe8Dk/ZSIce5yX+4dOdzj0Xsbdrb8w=
X-Google-Smtp-Source: APXvYqz8Jfjtk/AEiA4UN+XyaOn3tK5deB4i+Y4JabEqHK7Vz6m1m3fyBHKJI/sgVG1EGvlD1VNirXw883awMADkMJk=
X-Received: by 2002:ac2:498a:: with SMTP id f10mr11588194lfl.170.1573828889470; 
 Fri, 15 Nov 2019 06:41:29 -0800 (PST)
MIME-Version: 1.0
References: <603fd9f6b118b05c68858a9bf93c65d98b7efd9c.1573771485.git.rosbrookn@ainfosec.com>
 <b2005875-1d4e-2231-7704-a14158689e8b@citrix.com>
In-Reply-To: <b2005875-1d4e-2231-7704-a14158689e8b@citrix.com>
From: Nick Rosbrook <rosbrookn@gmail.com>
Date: Fri, 15 Nov 2019 09:41:18 -0500
Message-ID: <CAEBZRScanHBRhJZT=9N6qu-_9seddx65_dHR2ndp+keDAqzXWw@mail.gmail.com>
To: George Dunlap <george.dunlap@citrix.com>
Subject: Re: [Xen-devel] [PATCH] golang/xenlight: add missing arguments to
 libxl_domain_shutdown/reboot
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
Cc: Nick Rosbrook <rosbrookn@ainfosec.com>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiBBY3R1YWxseSB0aGlzIGhhcyBhbHJlYWR5IGJlZW4gc3VibWl0dGVkIGFuZCBSZWxlYXNlLWFj
a2VkIGhlcmU6Cj4KPiBodHRwczovL3BhdGNoZXcub3JnL1hlbi8yMDE5MTAyMzE2MjM1OC43MjIy
LTEtZ2VvcmdlLmR1bmxhcEBjaXRyaXguY29tLwoKQWggdGhhbmtzLCBJIHJlbWVtYmVyIHNlZWlu
ZyB0aGF0IG5vdyBidXQgSSBjb25mdXNlZCBpdCB3aXRoIHRoZQoqdmVyeSogc2ltaWxhciBwYXRj
aCBmb3IgbGlieGxfZG9tYWluX3BhdXNlL3VucGF1c2UuCgotTlIKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVu
LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcv
bWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
