Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A61772543DA
	for <lists+xen-devel@lfdr.de>; Thu, 27 Aug 2020 12:37:41 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kBFHi-0006KZ-65; Thu, 27 Aug 2020 10:37:34 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cFEh=CF=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1kBFHg-0006KD-M4
 for xen-devel@lists.xenproject.org; Thu, 27 Aug 2020 10:37:32 +0000
X-Inumbo-ID: f91f39f9-1782-4a6a-b31b-79bdf1cfeb45
Received: from mail-wm1-f67.google.com (unknown [209.85.128.67])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f91f39f9-1782-4a6a-b31b-79bdf1cfeb45;
 Thu, 27 Aug 2020 10:37:32 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id a65so4685176wme.5
 for <xen-devel@lists.xenproject.org>; Thu, 27 Aug 2020 03:37:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=g1ndLx8ROb/olrTsNwz8pf0nqePB4e8fiN0DQ8ZrnCc=;
 b=cYXPaD0RpH7iuEwCuTOM/aWSzE5kXhzL2cCkyujBIr8uNqRjti+yYHG/tiVSssO7Z2
 5ewiD727JdnTNU5Um9MnhG48kT03LmmyGIaSDvrtsJs+TuuUN33LABcKlVwwmzRND5Dn
 74KOabNhvGWE7+Zypm2TcKOcCAf/ybfcmqsFvKDyy8AkDnrBH8+GgNO4/w37GSlOk6qS
 KYhregOd2NEU7mPZ+XEQbC2s1kbyZBCQ5lFfanMyiaWCIHmU6a3PuK6XKjuEJ++Ip7Ta
 9htu7evv6ZnMXsL7jp3cwNeFzDm2y8lkN4IthPcd+n4+8RFlktZDbfZLBHK/zFYO6vn5
 uKzg==
X-Gm-Message-State: AOAM530mZVZkWgIz76kYiAH+1oOEbBlLLOeoruVm26g9Bog2CrtrX+zM
 X4DYgaG1kZtOUxy5HDx7FhA=
X-Google-Smtp-Source: ABdhPJzaIqUYiKIANCF1BM3UXaqwgDrwjtAtz7q/YhbhbrpxeC5qCTCvQjF0N7sTZIZGBbu7GHgtiQ==
X-Received: by 2002:a1c:2002:: with SMTP id g2mr11079121wmg.122.1598524651199; 
 Thu, 27 Aug 2020 03:37:31 -0700 (PDT)
Received: from liuwe-devbox-debian-v2 ([51.145.34.42])
 by smtp.gmail.com with ESMTPSA id n18sm5011307wrp.58.2020.08.27.03.37.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Aug 2020 03:37:30 -0700 (PDT)
Date: Thu, 27 Aug 2020 10:37:29 +0000
From: Wei Liu <wl@xen.org>
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org, Ian Jackson <ian.jackson@eu.citrix.com>,
 Wei Liu <wl@xen.org>
Subject: Re: [PATCH v3 15/38] tools/misc: don't include xg_save_restore.h
 from xen-mfndump.c
Message-ID: <20200827103729.gb7rilgfajspz7tm@liuwe-devbox-debian-v2>
References: <20200823093519.18386-1-jgross@suse.com>
 <20200823093519.18386-16-jgross@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200823093519.18386-16-jgross@suse.com>
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

On Sun, Aug 23, 2020 at 11:34:56AM +0200, Juergen Gross wrote:
> xen-mfndump.c is including the libxc private header xg_save_restore.h.
> Avoid that by moving the definition of is_mapped() to xen-mfndump.c
> (it is used there only) and by duplicating the definition of
> M2P_SIZE() in xen-mfndump.c.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>

Acked-by: Wei Liu <wl@xen.org>

