Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EB941C8C7E
	for <lists+xen-devel@lfdr.de>; Thu,  7 May 2020 15:37:08 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jWghd-0003rX-Kj; Thu, 07 May 2020 13:36:41 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kxRa=6V=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1jWghb-0003rM-Ij
 for xen-devel@lists.xenproject.org; Thu, 07 May 2020 13:36:39 +0000
X-Inumbo-ID: c6af4b50-9067-11ea-9f1a-12813bfff9fa
Received: from mail-wr1-f67.google.com (unknown [209.85.221.67])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c6af4b50-9067-11ea-9f1a-12813bfff9fa;
 Thu, 07 May 2020 13:36:38 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id g13so6416594wrb.8
 for <xen-devel@lists.xenproject.org>; Thu, 07 May 2020 06:36:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=aqfwh8LlbsD879/cOAoWdiZy98LeMnr8OnnCE7r4Kz0=;
 b=bBiqCnM3FeJ3Lc9Pc/j77/XSCjrqfVOxfQkFpfAqsVACQSLJK6fbrodgYIXli+Cw4C
 ZQzlZhokdZiM7a7fD2gRjqAv6k2Ga6HDwK1ZJ5pBCG+MKFBe6/C229mcKeag+ng9thjM
 U82dMF12wcsNviyf8eMq36KWIF6FfmtCDMfdpUEewQJQEVKZEedp14wJWV+lk7TjLGy/
 LGguP3xT+YeTbXirzh8ssxNWE59F2xkIOzGxxlxGClx5u1KxZyAWboV+PSY7yUaM195r
 sBmJwKdtUhlsIvefe4ZACgPS7/8H0v1Fe352BsKrxiVCwi8tPdmYvY5M51bS24m4HTZ6
 CtPQ==
X-Gm-Message-State: AGi0PuYEGX55ybQgSWIBDvS/nk9/J7RQoPUEHGL/gbRp1uHTkuhNcbRp
 9kycAP3G05CzW8KojarVhoI=
X-Google-Smtp-Source: APiQypIdMbXwteHL7OjI77bEv0/7jEvRMW9TAmtFHoh85TYk2qOD5+ZN9zlZ5t37PTaqSaOrE3bhLQ==
X-Received: by 2002:adf:f4c4:: with SMTP id h4mr16269863wrp.142.1588858597404; 
 Thu, 07 May 2020 06:36:37 -0700 (PDT)
Received: from
 liuwe-devbox-debian-v2.j3c5onc20sse1dnehy4noqpfcg.zx.internal.cloudapp.net
 ([51.145.34.42])
 by smtp.gmail.com with ESMTPSA id a10sm4487353wrp.0.2020.05.07.06.36.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 May 2020 06:36:36 -0700 (PDT)
Date: Thu, 7 May 2020 13:36:35 +0000
From: Wei Liu <wl@xen.org>
To: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Subject: Re: [PATCH] libxl: update libxlu_disk_l.[ch]
Message-ID: <20200507133635.tgcufdk7mepfuxv4@liuwe-devbox-debian-v2.j3c5onc20sse1dnehy4noqpfcg.zx.internal.cloudapp.net>
References: <20200506165018.32209-1-wl@xen.org>
 <20200507090030.GG1353@Air-de-Roger>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200507090030.GG1353@Air-de-Roger>
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
Cc: Anthony PERARD <anthony.perard@citrix.com>,
 Xen Development List <xen-devel@lists.xenproject.org>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wl@xen.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Thu, May 07, 2020 at 11:00:30AM +0200, Roger Pau Monné wrote:
> On Wed, May 06, 2020 at 05:50:18PM +0100, Wei Liu wrote:
> > Use flex 2.6.4 that is shipped in Debian Buster.
> > 
> > Signed-off-by: Wei Liu <wl@xen.org>
> > ---
> > Do this because Roger posted a patch to fix clang build, which requires
> > updating the same files. I don't want bury his changes in unrelated
> > ones.
> 
> Hm, I'm not sure it's helpful, but all I can do is Ack this:
> 
> Acked-by: Roger Pau Monné <roger.pau@citrix.com>
> 
> Thanks, Roger.

Thanks.

I will commit this on Friday if I don't hear objection.

Wei.

