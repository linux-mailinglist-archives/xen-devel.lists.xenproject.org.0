Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FB03227DAC
	for <lists+xen-devel@lfdr.de>; Tue, 21 Jul 2020 12:53:17 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jxptP-0007Ju-BZ; Tue, 21 Jul 2020 10:53:03 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UXjz=BA=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1jxptO-0007Jl-BI
 for xen-devel@lists.xenproject.org; Tue, 21 Jul 2020 10:53:02 +0000
X-Inumbo-ID: 5887512c-cb40-11ea-84fe-bc764e2007e4
Received: from mail-wm1-f67.google.com (unknown [209.85.128.67])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5887512c-cb40-11ea-84fe-bc764e2007e4;
 Tue, 21 Jul 2020 10:53:01 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id g75so2342715wme.5
 for <xen-devel@lists.xenproject.org>; Tue, 21 Jul 2020 03:53:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=TtY/EUxjTY357p9vD0+0PalRi+9Gt05MXt1acyKydgA=;
 b=d3TmV+JI+WUwM4kXN9pgG4oyQ6EXKvOmp0J6BVkSbZHlI0H3iiEypWfW4eXJsw+v6f
 onVbf4n4G9/dbw3r4kQaZnrSj1tIQpxJa0b2QJhwg/RAyBUrsu+vM97bknKD6xnkFPC2
 CVXYv/niPFCpaNYCFhr3irr5DIP7r3/myjynatOWag6A5ZIHFlwvGIO/pHo+DiA1rVKG
 JrF9HXov2X3Yw6+9295w34n/57PD0/UavaKQsWM7gOJoflroR4JYd31Hi29W8nsgeWLK
 Ja9A6y3zEBZz1X54Ky/6EuABgNgpNDubIiHdX9Alc+m3QfmGotFrSeNwOWbqICpGH8O9
 4FcQ==
X-Gm-Message-State: AOAM532HX1OeJg2ugkI+xpptQb0ULGEG4wejG7EckDQ6GuXwFPRi0JBa
 0LLeCSgzqxR7ERtEXcyckOs=
X-Google-Smtp-Source: ABdhPJxlLnaqg94UyZ9i7qYslCi1Gw9YFvh6FM5z9xwxJ4Y9hIuGJl/5fbYmvaBAWMKufi4p7lp9kg==
X-Received: by 2002:a1c:4343:: with SMTP id q64mr3489663wma.20.1595328780849; 
 Tue, 21 Jul 2020 03:53:00 -0700 (PDT)
Received: from liuwe-devbox-debian-v2 ([51.145.34.42])
 by smtp.gmail.com with ESMTPSA id c69sm2698313wmd.41.2020.07.21.03.53.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Jul 2020 03:53:00 -0700 (PDT)
Date: Tue, 21 Jul 2020 10:52:59 +0000
From: Wei Liu <wl@xen.org>
To: =?utf-8?Q?Micha=C5=82_Leszczy=C5=84ski?= <michal.leszczynski@cert.pl>
Subject: Re: [PATCH v4 09/10] tools/libxc: add xc_vmtrace_* functions
Message-ID: <20200721105259.kh4lmtsrjtxaul3v@liuwe-devbox-debian-v2>
References: <cover.1593519420.git.michal.leszczynski@cert.pl>
 <03c751efa273bf2a2b1575b0175219577da42e39.1593519420.git.michal.leszczynski@cert.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <03c751efa273bf2a2b1575b0175219577da42e39.1593519420.git.michal.leszczynski@cert.pl>
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
Cc: xen-devel@lists.xenproject.org, tamas.lengyel@intel.com,
 luwei.kang@intel.com, Ian Jackson <ian.jackson@eu.citrix.com>,
 Wei Liu <wl@xen.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Tue, Jun 30, 2020 at 02:33:52PM +0200, Michał Leszczyński wrote:
> From: Michal Leszczynski <michal.leszczynski@cert.pl>
> 
> Add functions in libxc that use the new XEN_DOMCTL_vmtrace interface.
> 
> Signed-off-by: Michal Leszczynski <michal.leszczynski@cert.pl>

Acked-by: Wei Liu <wl@xen.org>

(Subject to acceptance of hypervisor patches)

