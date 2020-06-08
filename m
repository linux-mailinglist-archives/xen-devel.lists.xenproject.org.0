Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DBEF11F1A86
	for <lists+xen-devel@lfdr.de>; Mon,  8 Jun 2020 16:05:24 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jiIOU-00006r-9r; Mon, 08 Jun 2020 14:04:54 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=joD5=7V=gmail.com=rosbrookn@srs-us1.protection.inumbo.net>)
 id 1jiIOT-00006k-6A
 for xen-devel@lists.xenproject.org; Mon, 08 Jun 2020 14:04:53 +0000
X-Inumbo-ID: 05fad58a-a991-11ea-9b55-bc764e2007e4
Received: from mail-qk1-x744.google.com (unknown [2607:f8b0:4864:20::744])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 05fad58a-a991-11ea-9b55-bc764e2007e4;
 Mon, 08 Jun 2020 14:04:52 +0000 (UTC)
Received: by mail-qk1-x744.google.com with SMTP id n11so17298668qkn.8
 for <xen-devel@lists.xenproject.org>; Mon, 08 Jun 2020 07:04:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=WSUcH3AY1CAeUmxIq6nHkTx22mFojaYCOSkSDYmsEzA=;
 b=tsCm9LBrefOefO6Q46HokVVoPtY0lV6pSgq5fJLoNi1p5M2tW8u0kkcGT6Y2tbYEmd
 2nbD2yfeuKd40o8qXFTAl+qO8Sxv+TIhvp5Gon2X8JHsSBSnKUf3nPdLvqB9gJzrmwwh
 zARTpIEehE9mdolRs8rW3tVegddhdZYFxwJY0NeYw61Hxax0pXhYRso/D4fPFSKJpwQI
 u0kDjlumTK5F3ay9TEYZvIujP+EFXLksLLoAdsUPg3zzAQeQZjUyq+lEprKmV14ekONn
 hyYkGiIYBOpUW/N3PCD17rJTyd/L8huAsy3Fkd3KVD2UFTi+/Hmcbo4Czf+c3Ws33mCy
 +YFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=WSUcH3AY1CAeUmxIq6nHkTx22mFojaYCOSkSDYmsEzA=;
 b=kPP4SHZ7nXyPa3DKkfP589eiNFdTYaoEWKG7pVLTkx13GGxK7rPOeI9cN1ieXmTVx+
 6130+udlDBD24rVG+4vZaRtHHJ21hjOpT47czZFo1Dh8EJk2BPpz3N/vlNLP5HG6jtUF
 nQZBYNHCFWIoXNSQa6p6hRwApmZ+PbSRwD1S2oCLt7szPuqJaa+M/trfq0lPmzNECXe4
 HO0G3yyWdCjFYgfetSDiI6m8Bu/DhWgOkKKSKqtQ+qQ0nlVk/2ZHGs7KrqF0y0BejIio
 HkpR26yLsxr+NIvq6/V8lfC/TSsAvw17OfkV3HeDB2D6i1GSRth+O6bJV3r3LT3AVEVd
 c3bw==
X-Gm-Message-State: AOAM531E6ntx86IAhfzpcot7loBJyUuzrQiORDA3O22Fastozuapxd5F
 XZMbBymW5nX2oOoyQUVDKCljUgUNqPw=
X-Google-Smtp-Source: ABdhPJwjY0CDcLq8ZoaRJPr03FOnr1q327zkcmLL9jI1Iz/nrP3IWiuWxnFsFZCN52p/EO5YaSkhtQ==
X-Received: by 2002:a37:ec4:: with SMTP id 187mr21274421qko.124.1591625091983; 
 Mon, 08 Jun 2020 07:04:51 -0700 (PDT)
Received: from FED-nrosbr-BE.crux.rad.ainfosec.com
 (209-217-208-226.northland.net. [209.217.208.226])
 by smtp.gmail.com with ESMTPSA id i3sm7097770qkf.39.2020.06.08.07.04.50
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 08 Jun 2020 07:04:51 -0700 (PDT)
Date: Mon, 8 Jun 2020 10:04:48 -0400
From: Nick Rosbrook <rosbrookn@gmail.com>
To: George Dunlap <George.Dunlap@citrix.com>
Subject: Re: [PATCH for-4.14] golang/xenlight: remove call to go fmt in
 gengotypes.py
Message-ID: <20200608140448.GA420606@FED-nrosbr-BE.crux.rad.ainfosec.com>
References: <20200606161025.19057-1-rosbrookn@ainfosec.com>
 <B9F0A2FB-CF09-46DA-A136-54D6ABA17B4B@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <B9F0A2FB-CF09-46DA-A136-54D6ABA17B4B@citrix.com>
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
Cc: Nick Rosbrook <rosbrookn@ainfosec.com>,
 Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>,
 Ian Jackson <Ian.Jackson@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Mon, Jun 08, 2020 at 11:39:43AM +0000, George Dunlap wrote:
> 
> > On Jun 6, 2020, at 5:10 PM, Nick Rosbrook <rosbrookn@gmail.com> wrote:
> > 
> > Since the golang bindings are now set to be re-generated whenever a
> > change is made to tools/libxl/libxl_types.idl, the call to go fmt in
> > gengotypes.py results in a dirty git tree for users without go
> > installed.
> > 
> > As an immediate fix, just remove the call to go fmt from gengotypes.py.
> > While here, make sure the DO NOT EDIT comment and package declaration
> > remain formatted correctly. All other generated code is left
> > un-formatted for now.
> > 
> > Signed-off-by: Nick Rosbrook <rosbrookn@ainfosec.com>
> 
> Reviewed-by: George Dunlap <george.dunlap@citrix.com>
> 
> With one note: git complains that the resulting patch introduces loads of trailing whitespace.  I went though gengotypes.py and essentially did `s/ \n/\n/g`.  With your permission I’ll fold that (and the resulting patches) into this before checking it in.

Yes, that's fine. Thank you.

-NR

