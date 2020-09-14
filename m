Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B192C26886D
	for <lists+xen-devel@lfdr.de>; Mon, 14 Sep 2020 11:32:51 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kHkqe-00083e-Hf; Mon, 14 Sep 2020 09:32:32 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/hQe=CX=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1kHkqc-00083Z-QP
 for xen-devel@lists.xenproject.org; Mon, 14 Sep 2020 09:32:30 +0000
X-Inumbo-ID: e359aae1-dbc1-49c5-8499-9f95448ea6c3
Received: from mail-wr1-f67.google.com (unknown [209.85.221.67])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e359aae1-dbc1-49c5-8499-9f95448ea6c3;
 Mon, 14 Sep 2020 09:32:20 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id c18so17890329wrm.9
 for <xen-devel@lists.xenproject.org>; Mon, 14 Sep 2020 02:32:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=t6tCsbaqMKRqp8Viht/tN7mjbmsbnSdhfec8ed5BsW8=;
 b=qw0yXt8E1zo2Pgi7WsN+bqfn5EkvX33ZMv7GjrZsoRd2f1I7LjzFCE1QRBFIwO3Elw
 L5Ti2tsSs+Pos66WsuJKonSdz3qTh0cgkpC4TchDxfDNeabezeQ5V3e+DsZCb1jtQAQr
 OIFf8kJNHvOwe7fqEfudSTBKB9WiXhB5vfS5dBkEHJQ8GKkLZ2bQxcxAn0h5OXmkyIO9
 xqkLAXmQHE9WwEs/Y5Ap3RHq+kSX1MzB2bNNPSwvpzriKMwXEBQTR7Oh7gc775JrIG+s
 0zfLKv1cvJENwwRk975DK0nX0bPMMITOVQEQZBKc+oEIya1DugZE4rBRuARkOOzS/Z4c
 yZiQ==
X-Gm-Message-State: AOAM531PDxt5FfO8ovkq/SVIOtzZR+W27fDI1gP+F+xAubWdsVBVgCtl
 0VzRiWCjQ3YHXRtNOC2e+4c=
X-Google-Smtp-Source: ABdhPJwKrbCJByJNLOYpzry/BBFxGBoC+TIuuMeZwFHCZnZR1I2jzF6WqHl312wPZQJHxB0wfb8LIw==
X-Received: by 2002:adf:8544:: with SMTP id 62mr14811576wrh.262.1600075939432; 
 Mon, 14 Sep 2020 02:32:19 -0700 (PDT)
Received: from liuwe-devbox-debian-v2 ([51.145.34.42])
 by smtp.gmail.com with ESMTPSA id a11sm17541879wmm.18.2020.09.14.02.32.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Sep 2020 02:32:18 -0700 (PDT)
Date: Mon, 14 Sep 2020 09:32:17 +0000
From: Wei Liu <wl@xen.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Juergen Gross <jgross@suse.com>,
 Ian Jackson <Ian.Jackson@citrix.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH 1/2] tools/libs/vchan: Don't run the headers check
Message-ID: <20200914093217.pgwb72zxjbva4omf@liuwe-devbox-debian-v2>
References: <20200914092420.20900-1-andrew.cooper3@citrix.com>
 <20200914092420.20900-2-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200914092420.20900-2-andrew.cooper3@citrix.com>
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

On Mon, Sep 14, 2020 at 10:24:19AM +0100, Andrew Cooper wrote:
> There was never a headers check previously, and CentOS 6 can't cope with the
> anonymous union in struct libxenvchan.
> 
>   cc1: warnings being treated as errors
>   ... tools/include/libxenvchan.h:75: error: declaration does not declare anything
>   make[6]: *** [headers.chk] Error 1
> 
> Fixes: 8ab2429f12 ("tools: split libxenvchan into new tools/libs/vchan directory")
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Acked-by: Wei Liu <wl@xen.org>

