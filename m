Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 59F3C1143C3
	for <lists+xen-devel@lfdr.de>; Thu,  5 Dec 2019 16:37:14 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ict9w-0007mA-9j; Thu, 05 Dec 2019 15:35:16 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=4RYm=Z3=gmail.com=rosbrookn@srs-us1.protection.inumbo.net>)
 id 1ict9u-0007m2-H0
 for xen-devel@lists.xenproject.org; Thu, 05 Dec 2019 15:35:14 +0000
X-Inumbo-ID: d4366ee7-1774-11ea-822b-12813bfff9fa
Received: from mail-lj1-f195.google.com (unknown [209.85.208.195])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d4366ee7-1774-11ea-822b-12813bfff9fa;
 Thu, 05 Dec 2019 15:35:13 +0000 (UTC)
Received: by mail-lj1-f195.google.com with SMTP id 21so4127666ljr.0
 for <xen-devel@lists.xenproject.org>; Thu, 05 Dec 2019 07:35:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=1IkFByy7wzsZb+ecf5yS/ZIwQ4XiUzWwfiPVCF4fjco=;
 b=slhAjXN4C56H1nFVco8QH+vJm+adfuzo/qzGdWszxxBSkaWWz47XF59Boj0aYuF5XY
 wx/UZ2S/nQs4rQXPd5g8yRJ+Hc9zx4ltNrppRgSrOIHbERugtrXZ50JYZ1LH7aUzLoFM
 sqgfUPUN8frJp5zq1uBTnI9cH/kFA3pDQQduZhmGLy8TtbtuM7HPH7FF0IG8vr3d4UiZ
 TCqrU3Mo53wRHOvEP+5AFPo/Ej4/tgCsPVY5JPy54wubRYrGRXM5AWQDIxbFaSqsP9HO
 DmiAF3thlQxP01sBcagl5OEzlfdf14/QCCSOE3V3UUrVZzbjHDs4ADVyZUFKGhxY1Es0
 sgIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=1IkFByy7wzsZb+ecf5yS/ZIwQ4XiUzWwfiPVCF4fjco=;
 b=o6fRQOhOFevOBmHjSJytw+SgbggV/ma7DLJqqV3uF60VEmxPCAkw/TFTkIEp1ywv33
 pVkROUsrCFc640ZdIhUxZuA34MVttkSU7PVfUtMtFPwEo4Mj3GnwtMSxSuTG3VtFFnci
 yx32v+z1PlE9ZPo3q57PCH6+4ys1cDvm5ld5uYWXCc04Xq0WhQhgD4vjZEDBlt8a3jFv
 T+6Ly0R9lqw/LDSWKQyZLccRFxv+xGJc0EougM0zjPQnvUkJhpwhd4+9cvrJIu97XH5i
 LN+s+s0D+wbmYoJbboDDdI0VWmqdfrVmuxdTgkVW5Bfp+h71Ve2BMR27av36Zg4lFpOx
 ameQ==
X-Gm-Message-State: APjAAAUOCpsRYqiQS5PrhomswKQRjuWvW5HxDKuhRP7dT1Fiv40ySjau
 Orl6wjpYn5avC/6YnswxAGYH533RlxgoeNHVGhk=
X-Google-Smtp-Source: APXvYqydBsJGXh9leqFOY0b8FweEcgnECL3r0IFeNlne1WjWjd+73Z2SENN13JS3lDAmO3m3Ui4pAJghuI/wdolf7KY=
X-Received: by 2002:a2e:880c:: with SMTP id x12mr5135499ljh.44.1575560112468; 
 Thu, 05 Dec 2019 07:35:12 -0800 (PST)
MIME-Version: 1.0
References: <cover.1573840473.git.rosbrookn@ainfosec.com>
 <3bf4e3167d703d680a6bd6f3226ba394b0ed443f.1573840474.git.rosbrookn@ainfosec.com>
 <1df4ff22-d9cb-e3ed-fb0c-127e941c37d3@citrix.com>
In-Reply-To: <1df4ff22-d9cb-e3ed-fb0c-127e941c37d3@citrix.com>
From: Nick Rosbrook <rosbrookn@gmail.com>
Date: Thu, 5 Dec 2019 10:35:01 -0500
Message-ID: <CAEBZRSe0kR5KQA3HacPwjXX2BqdTJ1X9t66z72xJkKpd7spjDQ@mail.gmail.com>
To: George Dunlap <george.dunlap@citrix.com>
Subject: Re: [Xen-devel] [PATCH v2 12/22] golang/xenlight: re-factor Hwcap
 type implementation
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
 Xen-devel <xen-devel@lists.xenproject.org>, kerriganb@ainfosec.com,
 Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiBTYW1lIHRoaW5nIHdpdGggY2FzdGluZy4KCkFjayBmb3IgYWxsIHN1Y2ggY2FzZXMgb2YgdGhp
cyBjYXN0aW5nLiBUaGF0J3MgYSBnb29kIHdheSB0byBzaW1wbGlmeS4KCi1OUgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcg
bGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9q
ZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
