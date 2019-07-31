Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B08637C08B
	for <lists+xen-devel@lfdr.de>; Wed, 31 Jul 2019 13:55:28 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hsn9H-0004SJ-9k; Wed, 31 Jul 2019 11:52:03 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=/NdB=V4=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1hsn9G-0004SE-H0
 for xen-devel@lists.xenproject.org; Wed, 31 Jul 2019 11:52:02 +0000
X-Inumbo-ID: 99f8c674-b389-11e9-adb4-bb3ee82b4e2e
Received: from mail-lj1-f178.google.com (unknown [209.85.208.178])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 99f8c674-b389-11e9-adb4-bb3ee82b4e2e;
 Wed, 31 Jul 2019 11:51:59 +0000 (UTC)
Received: by mail-lj1-f178.google.com with SMTP id i21so65306932ljj.3
 for <xen-devel@lists.xenproject.org>; Wed, 31 Jul 2019 04:51:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=wp/DJY0i2sKnh+6aQSkFig7LzkgmeqDGRC1Ma3Agzvs=;
 b=rj4O//DLq/56owhV0/8mGGIbP7GfXvsJooXJbG+yaOLlA5bf/KNiUU79JtQNsdeU7c
 EAHKFSZV5sWRUQnYX6I3Zgrg3zOfa3YbLuX0NXEQWmw/Ak+Eidojizv38XttXB8l+/uD
 HOaIg5PTdiTaCcFp5q4JSim0w9RifSHDymdpZe7D/CMms6c3a170aAfIkqrrfsTQuvXL
 JQFgaPEFUThL/UMx8+ggUu4ipjenCAYhy2AYgmEsreb+zotXZCWm6yeT98d3Icx/3oY/
 imuExwqp1O0PAKEAIZdLTUrxmfViaD13JUlr+TjPpieJHgfoZAteMIOaJNBEaGnzYIqA
 duVw==
X-Gm-Message-State: APjAAAURK88PBTocxt968Ik2oMOJlhb0w10lr0qxxs9y3x6tcivD0jB1
 QiSt3GRw3C9a2k1SJHMv0A0YQo59KHw=
X-Google-Smtp-Source: APXvYqyC+cH3iZiCa6GJVYDyACXFQ4qGYK9p61BAnS+Jv1zaoli1C232OA6Is+I0wd9WFujm9iOhFg==
X-Received: by 2002:a2e:87d0:: with SMTP id v16mr5595661ljj.24.1564573918151; 
 Wed, 31 Jul 2019 04:51:58 -0700 (PDT)
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com.
 [209.85.208.177])
 by smtp.gmail.com with ESMTPSA id e87sm16020819ljf.54.2019.07.31.04.51.57
 for <xen-devel@lists.xenproject.org>
 (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
 Wed, 31 Jul 2019 04:51:57 -0700 (PDT)
Received: by mail-lj1-f177.google.com with SMTP id m23so65221338lje.12
 for <xen-devel@lists.xenproject.org>; Wed, 31 Jul 2019 04:51:57 -0700 (PDT)
X-Received: by 2002:a2e:63cd:: with SMTP id s74mr63271379lje.164.1564573917717; 
 Wed, 31 Jul 2019 04:51:57 -0700 (PDT)
MIME-Version: 1.0
References: <CACJ1ZNsXOP-NHHhVTvxnsLvMx1FdJQgEibTsH4nj01b0WrO7fA@mail.gmail.com>
In-Reply-To: <CACJ1ZNsXOP-NHHhVTvxnsLvMx1FdJQgEibTsH4nj01b0WrO7fA@mail.gmail.com>
From: Wei Liu <wl@xen.org>
Date: Wed, 31 Jul 2019 12:51:42 +0100
X-Gmail-Original-Message-ID: <CAK9nU=qhH+zxNqwdT1fQoNwJTTuO=Q5VUpkmkTU57ZqK3TgXZQ@mail.gmail.com>
Message-ID: <CAK9nU=qhH+zxNqwdT1fQoNwJTTuO=Q5VUpkmkTU57ZqK3TgXZQ@mail.gmail.com>
To: Olivier Lambert <lambert.olivier@gmail.com>
Subject: Re: [Xen-devel] [RFC] XCP-ng subproject proposal
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
Cc: xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

KzEgZnJvbSBtZS4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
Cmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
