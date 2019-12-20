Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 48A3B127C76
	for <lists+xen-devel@lfdr.de>; Fri, 20 Dec 2019 15:23:54 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iiJ9P-0004hF-Rd; Fri, 20 Dec 2019 14:21:07 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=YXk5=2K=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1iiJ9O-0004h7-PV
 for xen-devel@lists.xenproject.org; Fri, 20 Dec 2019 14:21:06 +0000
X-Inumbo-ID: f52ad8b0-2333-11ea-9368-12813bfff9fa
Received: from mail-wr1-f65.google.com (unknown [209.85.221.65])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f52ad8b0-2333-11ea-9368-12813bfff9fa;
 Fri, 20 Dec 2019 14:21:05 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id w15so9616507wru.4
 for <xen-devel@lists.xenproject.org>; Fri, 20 Dec 2019 06:21:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=XY9K1tMPkIEVD3ZhPQFv0ipJr6XoFdOaOUV+4YxrRA0=;
 b=LktEbDtsm98r0hP3WDd/JAELyvTuqf9D3S6aI6o904WpCo3WtRUi7lZp9oh2b1dQJl
 qSwSErcLc/r1rZWkvKyRQGx6hJVG/J9x9vkdMVnAC9Qk6A+dxc7ZLQvR4LLQlWlJp6kH
 S2lReqg0d2B7dSrejew2VDcwyG91UzVCg1VQXLpADel518KVIqVLg0AVXAb77g08d2Ny
 +483J7cK3ethiuyeVwNAheJQatE/OFgq02GANiXlSyqHo9zdnhR8YSgqBt/FfnbLGPfV
 TffaVuS1Wy7ATfqK8YvSD28lGINlt8mkAFU6CjSmAM2OzPRo7DjEuWgnB5++YJQve1s4
 CvSw==
X-Gm-Message-State: APjAAAVGFKUX8e/94y56b7NlOL8I9egXa89IFKK+ic57n1GdaX+z4wLT
 /Pq91Dw2pPHI0c/yJ78KLuoqGZhceKE=
X-Google-Smtp-Source: APXvYqzPAS8kIai7Vte5UoG0Dm85BzLr6jLQlR/ZT//xhjide3oft/hLDqFb4ayn6vlaRbSE4VaMRg==
X-Received: by 2002:adf:93c5:: with SMTP id 63mr15769679wrp.236.1576851664714; 
 Fri, 20 Dec 2019 06:21:04 -0800 (PST)
Received: from debian (38.163.200.146.dyn.plus.net. [146.200.163.38])
 by smtp.gmail.com with ESMTPSA id u8sm9528140wmm.15.2019.12.20.06.21.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Dec 2019 06:21:04 -0800 (PST)
Date: Fri, 20 Dec 2019 14:21:02 +0000
From: Wei Liu <wl@xen.org>
To: Xen Development List <xen-devel@lists.xenproject.org>
Message-ID: <20191220142102.56s262knel4rnrl2@debian>
References: <20191217144928.3738-1-wl@xen.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191217144928.3738-1-wl@xen.org>
User-Agent: NeoMutt/20180716
Subject: Re: [Xen-devel] [PATCH] tools: bump library version numbers
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
Cc: pdurrant@amazon.com, Ian Jackson <ian.jackson@eu.citrix.com>,
 Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVHVlLCBEZWMgMTcsIDIwMTkgYXQgMDI6NDk6MjhQTSArMDAwMCwgV2VpIExpdSB3cm90ZToK
PiBTaWduZWQtb2ZmLWJ5OiBXZWkgTGl1IDx3bEB4ZW4ub3JnPgoKVGhpcyBpcyBhIHRyaXZpYWwg
cGF0Y2guIEkgd2lsbCBhcHBseSBpdCBzb29uLWlzaCB1bmxlc3MgSSdtIHRvbGQKb3RoZXJ3aXNl
LgoKV2VpLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
WGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0
cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
