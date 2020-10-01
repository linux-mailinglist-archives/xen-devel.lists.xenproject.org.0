Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B168627FD9D
	for <lists+xen-devel@lfdr.de>; Thu,  1 Oct 2020 12:46:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1182.3925 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kNw6L-0007nm-Kd; Thu, 01 Oct 2020 10:46:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1182.3925; Thu, 01 Oct 2020 10:46:17 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kNw6L-0007nJ-HK; Thu, 01 Oct 2020 10:46:17 +0000
Received: by outflank-mailman (input) for mailman id 1182;
 Thu, 01 Oct 2020 10:46:16 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Tj+q=DI=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1kNw6K-0007n5-Jm
 for xen-devel@lists.xenproject.org; Thu, 01 Oct 2020 10:46:16 +0000
Received: from mail-wr1-f67.google.com (unknown [209.85.221.67])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0f1ec110-1ac2-434a-9b54-392be6bea932;
 Thu, 01 Oct 2020 10:46:15 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id s12so5099502wrw.11
 for <xen-devel@lists.xenproject.org>; Thu, 01 Oct 2020 03:46:15 -0700 (PDT)
Received: from liuwe-devbox-debian-v2 ([51.145.34.42])
 by smtp.gmail.com with ESMTPSA id d9sm7582785wmb.30.2020.10.01.03.46.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Oct 2020 03:46:14 -0700 (PDT)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=Tj+q=DI=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
	id 1kNw6K-0007n5-Jm
	for xen-devel@lists.xenproject.org; Thu, 01 Oct 2020 10:46:16 +0000
X-Inumbo-ID: 0f1ec110-1ac2-434a-9b54-392be6bea932
Received: from mail-wr1-f67.google.com (unknown [209.85.221.67])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 0f1ec110-1ac2-434a-9b54-392be6bea932;
	Thu, 01 Oct 2020 10:46:15 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id s12so5099502wrw.11
        for <xen-devel@lists.xenproject.org>; Thu, 01 Oct 2020 03:46:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=21emveKsZWWUjET4SNbQI/1Lw/S6aESA+s+8y2MW3cw=;
        b=eChJpIxTKecYOsSxO88o1bGu0iCRkXPffk3+VOdVRpfflXK9pdMdjXxUM64JtniZlN
         ZPrXQxVq1vcjOewvdZQpkLZHqj6kiVvgRF3+J1CWMIfsYMy+/6+Pq9+arqWnTX17Klem
         qrDpFfrADT9Y8HbzK0tOoUhB4XSQcFXHjNCHn+GtL4a8Sa69LnIR/HW9QBXPhwHf5QQM
         KvPznqC9/ea1AfGVF/ziz4HryCL8XzvyTc8UViRW1hDXDiLNKNyRYiBQopyalA5SpHLD
         cdiZyXhapTc/xQejeOCWc6t+mTa2sV0uDTNdcDkh6pk0slG5qZJPEc367lRqmjYoxp5P
         MysQ==
X-Gm-Message-State: AOAM532DeMq11o0Cngke+c5IRYKAGzZPt0Wx0RgeKMLUiFmYNTGOgx2/
	5Rr6ptpvHIPBua+YeXuj7uWUVJnt0dU=
X-Google-Smtp-Source: ABdhPJxDEqk44uJT+jSjXi6HdrUAJO+P4d9MWxFvGIepTYDNSLfZZMXfTk8zuLsuAASpMNiTV15Vig==
X-Received: by 2002:adf:f986:: with SMTP id f6mr7836499wrr.270.1601549175229;
        Thu, 01 Oct 2020 03:46:15 -0700 (PDT)
Received: from liuwe-devbox-debian-v2 ([51.145.34.42])
        by smtp.gmail.com with ESMTPSA id d9sm7582785wmb.30.2020.10.01.03.46.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2020 03:46:14 -0700 (PDT)
Date: Thu, 1 Oct 2020 10:46:13 +0000
From: Wei Liu <wl@xen.org>
To: =?utf-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Cc: Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org,
	Ian Jackson <iwj@xenproject.org>
Subject: Re: [PATCH v4 30/31] tools/libs: add option for library names not
 starting with libxen
Message-ID: <20201001104613.az4ylmbaa43u637f@liuwe-devbox-debian-v2>
References: <20200828150747.25305-1-jgross@suse.com>
 <20200828150747.25305-31-jgross@suse.com>
 <20200828160053.b7misof3qmmkskur@liuwe-devbox-debian-v2>
 <aa1b4641-0ce5-9c72-19a0-2e27ff1fe704@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aa1b4641-0ce5-9c72-19a0-2e27ff1fe704@suse.com>
User-Agent: NeoMutt/20180716

On Sat, Aug 29, 2020 at 06:38:40AM +0200, Jürgen Groß wrote:
> On 28.08.20 18:00, Wei Liu wrote:
> > On Fri, Aug 28, 2020 at 05:07:46PM +0200, Juergen Gross wrote:
> > > libxlutil doesn't follow the standard name pattern of all other Xen
> > > libraries, so add another make variable which can be used to allow
> > > other names.
> > > 
> > > Signed-off-by: Juergen Gross <jgross@suse.com>
> > 
> > Is this still needed?
> 
> Yes. Its for the installed files, as those need to stay as they are
> today.

Acked-by: Wei Liu <wl@xen.org>

