Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BC2011D4C7F
	for <lists+xen-devel@lfdr.de>; Fri, 15 May 2020 13:22:29 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jZYOY-0001ZR-OE; Fri, 15 May 2020 11:20:50 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OuqU=65=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1jZYOW-0001ZM-G9
 for xen-devel@lists.xenproject.org; Fri, 15 May 2020 11:20:48 +0000
X-Inumbo-ID: 1fc774d8-969e-11ea-b07b-bc764e2007e4
Received: from mail-wm1-x32d.google.com (unknown [2a00:1450:4864:20::32d])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1fc774d8-969e-11ea-b07b-bc764e2007e4;
 Fri, 15 May 2020 11:20:47 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id h4so1925823wmb.4
 for <xen-devel@lists.xenproject.org>; Fri, 15 May 2020 04:20:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:reply-to:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding:content-language:thread-index;
 bh=0cwizCCLnaE80HNj/7XqB5NxVoOetYajCXsROcEIMjQ=;
 b=JRLvdVy/cVUmUynq+6Sd3uhtrci6lh/X4Wk/x/IG3uU7X0Qoxp50CGRLcQbRifi4Gl
 +Uu+tcfgKrAGtyUHI2OP+0EVJj4zMOJvQecy2a2usg37Zo/JNI48mBnIEIz+/WWuJvGv
 fvbOBfGUWUGKdOi4YwDcIQAKocSbYqANhrPvbNOmf80nBP9fgy91yxnacMHmZuDmwhAA
 7Ue0oXgMWlqX/HR2AfUmYphSn0eTS/VA3UxY3la0sbOt/SDsC6nxymEk6BhhY5WcufjH
 cMxv+nI88oeL9KVfAunZAZQZAE+5fSJrQhDzj10kqDTLA7nSaMmkVoB0Qytuf4uuPUUh
 ulNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:reply-to:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding:content-language
 :thread-index;
 bh=0cwizCCLnaE80HNj/7XqB5NxVoOetYajCXsROcEIMjQ=;
 b=cUoF3+yUhgh+RTcrfvhVsItYXEz8nCAESBlMKqna4EkUtoXPiLifIIaEbPB1Su0zI+
 ko29JbcBF5XIspkxkHoQ6n6U1kxC6qM8k5IvCT95SDyAJBOIUEIPUVWtaFrFX8bKrSG6
 7TCtfQ4F0MEv1y3qykUhfc0pKiPad9oQ9OL2gMYTV2RIoCJzHXh19H4ne2gZGBtiOBXN
 2h4y4dhoXsw4fGrZm7f2LRTSipc5gRFOJ76ygDaVs5tIL6G1NrLQk/WaBuqxsa0fK/te
 gNetEJfSluIAzwkttWxxvEkB/F2rVm6/tnHcxqKFdEhncIfBsm123oqMYOW5boLArdTi
 ZE2A==
X-Gm-Message-State: AOAM530OqUtwUQL6vXyHWoC9UT/D7kvOWXuJld7eKZfh4Hhz0qdgNSq+
 1/P/doy1EyiRKOjRtWXRwqI=
X-Google-Smtp-Source: ABdhPJzUAedf2I7qBgP1Ve8uFeDgh1rOXvu08/ZupZz/FO1U3uaI4rqljLksGjVIZuFuj7Xh5/MJ5A==
X-Received: by 2002:a05:600c:d6:: with SMTP id
 u22mr3363779wmm.45.1589541646690; 
 Fri, 15 May 2020 04:20:46 -0700 (PDT)
Received: from CBGR90WXYV0 ([54.239.6.185])
 by smtp.gmail.com with ESMTPSA id h188sm3391735wme.8.2020.05.15.04.20.45
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 15 May 2020 04:20:46 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
To: <xen-devel@lists.xenproject.org>
Subject: Items for CHANGELOG.md in 4.14
Date: Fri, 15 May 2020 12:20:44 +0100
Message-ID: <000401d62aaa$e0eccab0$a2c66010$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-gb
Thread-Index: AdYqqt+yYIZV2cMIQ1mLIcH9/L6gIw==
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Reply-To: paul@xen.org
Cc: 'Roger Pau Monne' <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

All,

  In the last community call I took an ACTION to send a reminder email to submit patches to get CHANGELOG.md up to date. Several
items were mentioned during the call (see minutes at https://cryptpad.fr/pad/#/2/pad/edit/qPQUEQEv3nJJ97clS8b2KdtP/):

- Ability to conditionally compile-out 32-bit PV guests (security attack surface reduction)
- Basic support for AMD Milan CPUS
- Golang binding advances
- x2apic, improvements on tlbflush hypercall
- General improvements in pvshim
- Xen on Hyper-V
- VM-fork

  Roger has already sent a patch for the x2apic/tlbflush improvements (which has not yet been committed). Can those with the
relevant information regarding the other items please send patches a.s.a.p.?

  Thanks,

    Paul Durrant


