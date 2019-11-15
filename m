Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DE05FDB68
	for <lists+xen-devel@lfdr.de>; Fri, 15 Nov 2019 11:30:16 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iVYoI-000215-Fy; Fri, 15 Nov 2019 10:26:38 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=SiVl=ZH=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1iVYoH-000210-3y
 for xen-devel@lists.xenproject.org; Fri, 15 Nov 2019 10:26:37 +0000
X-Inumbo-ID: 6544a71b-0792-11ea-a264-12813bfff9fa
Received: from mail-wm1-f65.google.com (unknown [209.85.128.65])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 6544a71b-0792-11ea-a264-12813bfff9fa;
 Fri, 15 Nov 2019 10:26:34 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id l17so9102759wmh.0
 for <xen-devel@lists.xenproject.org>; Fri, 15 Nov 2019 02:26:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=7RcmcdiDobednvhDntIr7nc+DwvsTQqBXTXvuDt2lz4=;
 b=mX5DDv/IBwT/cgT3xe3i5KS/qE43XnHUJuZ20kKf8VESjSV7azyPtqtLKOVqdI51J3
 lr0dc4osc8tG4Heq6UbRazMt/XXsq0FLiuHyLVV5TOsLtqCpSsXSjtoJJ3ug0LRpRP0T
 Cs2lzFFqe6To+epqU9ZayiF0HvW16s3RVV6eMUXqplC5m9ME3wELqSCEgPX4imhdiGCT
 DU8cGTGAhOkf9tTbI39fcrUKeq353sjWAUegJqyTyCXwCli7pyVUiB8SY9FiwYRs7noj
 szgi2ObJv7yMJV186FzhYq6Jwaarx4xNuPl3Tqztj6qMhAM/QFCYMdfaSpVRcOmgE3rd
 CA5Q==
X-Gm-Message-State: APjAAAVhzKQFiXHlNx9pREYcNuxr/MlSsfspQs7xero78lPLDHLfdKv5
 KEq8vyLU/CqPzHxGzDDpAeQ=
X-Google-Smtp-Source: APXvYqzb5TzblwEPvASJhpXfZNtB4dg0Qd0UhLHauHIRS5v75rOL3TkEUHVoGuaEp6YW3AvRSLz91w==
X-Received: by 2002:a05:600c:2105:: with SMTP id
 u5mr13225898wml.47.1573813594032; 
 Fri, 15 Nov 2019 02:26:34 -0800 (PST)
Received: from debian (74.162.147.147.dyn.plus.net. [147.147.162.74])
 by smtp.gmail.com with ESMTPSA id u18sm10969151wrp.14.2019.11.15.02.26.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Nov 2019 02:26:33 -0800 (PST)
Date: Fri, 15 Nov 2019 10:26:31 +0000
From: Wei Liu <wl@xen.org>
To: Juergen Gross <jgross@suse.com>
Message-ID: <20191115102631.poifbgjw4jhgav72@debian>
References: <20191115070414.3862-1-jgross@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191115070414.3862-1-jgross@suse.com>
User-Agent: NeoMutt/20180716
Subject: Re: [Xen-devel] [PATCH for-4.13] libxl: fix device model timeout in
 libxl__dm_resume()
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
Cc: Anthony PERARD <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
 Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gRnJpLCBOb3YgMTUsIDIwMTkgYXQgMDg6MDQ6MTRBTSArMDEwMCwgSnVlcmdlbiBHcm9zcyB3
cm90ZToKPiBsaWJ4bF9fZG1fcmVzdW1lKCkgaXMgdXNpbmcgYSB3cm9uZyB0aW1lb3V0IGZvciB0
aGUgc3RhcnQgb2YgdGhlCj4gZGV2aWNlIG1vZGVsLiBJbnN0ZWFkIG9mIDYwIHNlY29uZHMgdGhl
IHRpbWVvdXQgaXMgc2V0IHRvIDYwCj4gbWlsbGlzZWNvbmRzLgo+IAo+IFJlcG9ydGVkLWJ5OiBS
b21hbiBTaGFwb3NobmlrIDxyb21hbkB6ZWRlZGEuY29tPgo+IEZpeGVzOiA2Mjk4ZjBlYjhmNDQz
NyAoImxpYnhsOiBSZS1pbnRyb2R1Y2UgbGlieGxfX2RvbWFpbl9yZXN1bWUiKQo+IFNpZ25lZC1v
ZmYtYnk6IEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4KCkFja2VkLWJ5OiBXZWkgTGl1
IDx3bEB4ZW4ub3JnPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5v
cmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZl
bA==
