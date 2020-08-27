Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B504525440D
	for <lists+xen-devel@lfdr.de>; Thu, 27 Aug 2020 12:57:00 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kBFaQ-0000Zl-OG; Thu, 27 Aug 2020 10:56:54 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cFEh=CF=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1kBFaP-0000ZS-AT
 for xen-devel@lists.xenproject.org; Thu, 27 Aug 2020 10:56:53 +0000
X-Inumbo-ID: 07d0b46f-addf-4dc8-b8be-d37f415a7a39
Received: from mail-wr1-f67.google.com (unknown [209.85.221.67])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 07d0b46f-addf-4dc8-b8be-d37f415a7a39;
 Thu, 27 Aug 2020 10:56:52 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id b18so4921182wrs.7
 for <xen-devel@lists.xenproject.org>; Thu, 27 Aug 2020 03:56:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=TW5ZgJ/TMjz7xPb4RMTS+NAseS/6Rj7P2sQhSgYANCE=;
 b=VVtWUv+l6iy0ZkdpEHvg5BLWhLMuPHVzASKeQrmQdoKT8yoFs2l7Durc66hQvDSCAW
 Ob4SwretSdbWmUpMS6BWm4emQeqf5E2smyy6MDjYlDBgwXon9LHfmzzBTztu4UwUfRqB
 B//3ZIKBMUz4wtyTJ6reYE0t3QKU4oWmzGUpggCgb/FnPbeJMATCANUMKTz7o6SWMmQF
 bwkiKzTeLrI+9vHXtXrRcd0FkU70DXOctm4pvLZjGleTl+1vYfK01JkTc3h9rKtn059L
 rqlB0wzA49GBTRKMv4uKonvIXLkznr2Ol7ZPl8rKmqApgU4ZekGjHsKaiZ05n5Zql9RX
 2SGg==
X-Gm-Message-State: AOAM531YLVwwHAlbSR4IlkGoZQdNKcj1h1f7gwlg8GDGf6k5tAX0gpuH
 YnWhmid43iAmDRX/kVgrbiw=
X-Google-Smtp-Source: ABdhPJxrjXgadLlfCv/rH0igcP4crCM5DDEcYNjjypkKPji2B2RbnViELOw0QBuKm6dV8qEGqNrnRA==
X-Received: by 2002:a5d:5084:: with SMTP id a4mr20394549wrt.191.1598525811305; 
 Thu, 27 Aug 2020 03:56:51 -0700 (PDT)
Received: from liuwe-devbox-debian-v2 ([51.145.34.42])
 by smtp.gmail.com with ESMTPSA id d10sm5482018wrg.3.2020.08.27.03.56.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Aug 2020 03:56:50 -0700 (PDT)
Date: Thu, 27 Aug 2020 10:56:49 +0000
From: Wei Liu <wl@xen.org>
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org, Ian Jackson <ian.jackson@eu.citrix.com>,
 Wei Liu <wl@xen.org>
Subject: Re: [PATCH v3 21/38] tools/libxc: rename libxenguest internal headers
Message-ID: <20200827105649.55pkzjhjpgixiphf@liuwe-devbox-debian-v2>
References: <20200823093519.18386-1-jgross@suse.com>
 <20200823093519.18386-22-jgross@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200823093519.18386-22-jgross@suse.com>
User-Agent: NeoMutt/20180716
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Sun, Aug 23, 2020 at 11:35:02AM +0200, Juergen Gross wrote:
> Rename the header files private to libxenguest from xc_*.h to xg_*.h.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>

Acked-by: Wei Liu <wl@xen.org>

