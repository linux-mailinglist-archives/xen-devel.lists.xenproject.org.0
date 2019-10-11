Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C3421D3C4E
	for <lists+xen-devel@lfdr.de>; Fri, 11 Oct 2019 11:29:27 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iIrBp-0002Ko-3h; Fri, 11 Oct 2019 09:26:25 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=L6yD=YE=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1iIrBn-0002Kg-TV
 for xen-devel@lists.xenproject.org; Fri, 11 Oct 2019 09:26:23 +0000
X-Inumbo-ID: 30cde626-ec09-11e9-beca-bc764e2007e4
Received: from mail-wr1-f67.google.com (unknown [209.85.221.67])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 30cde626-ec09-11e9-beca-bc764e2007e4;
 Fri, 11 Oct 2019 09:26:23 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id q9so11061540wrm.8
 for <xen-devel@lists.xenproject.org>; Fri, 11 Oct 2019 02:26:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=FfsBc9GrT9TEzUtDq0V7dkiVH6U6e2eBoKIwvDme/sQ=;
 b=S1xyhYOpXY23yoAsogi8FgNFgcgOWzTA5fFaV55lT6I1lEx31JbNnHUT9wP9kybuOz
 5h1/w4LIsdkh8onoRKQ5UmH1KLEnA8FPRM5jXbheRjLrKza2aXhnlG135+GSjOCBN9Uj
 dPgj6iVZ5Y/d97r8kwiZb3LgyfljeKg+54FbfnTBhDosrceXxqFRqYDh43LDWZLQJU7U
 sQ8+xSMUfUMO4vw4PcxKAT20E/bRSEVA2ZHmqdrxpgOo74MPv3E8hW0XUq+XeL0TgGB+
 ZXxTCx1TO4gXpDtvTwwi0qAga8XBycbJpygdYPsOISduKx4UC3CxXv1WV98tw0V8kWNf
 BrFQ==
X-Gm-Message-State: APjAAAXAFdMAZXInBrZDq9DU8solITYozb761AQXqY3wsH7kWNjp/9Bf
 PhXVi1b4Xt5wat6L8LjrE6I=
X-Google-Smtp-Source: APXvYqyxkhvk18PxitcQfsfIDzis5YDT9++QBz7RgTjSLNsIpLQiyKjuZExvngwQm2j4ZvQ7MRB8/g==
X-Received: by 2002:adf:dbd2:: with SMTP id e18mr12285114wrj.268.1570785982664; 
 Fri, 11 Oct 2019 02:26:22 -0700 (PDT)
Received: from debian (207.148.159.143.dyn.plus.net. [143.159.148.207])
 by smtp.gmail.com with ESMTPSA id q19sm18678277wra.89.2019.10.11.02.26.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Oct 2019 02:26:22 -0700 (PDT)
Date: Fri, 11 Oct 2019 10:26:20 +0100
From: Wei Liu <wl@xen.org>
To: Ian Jackson <ian.jackson@eu.citrix.com>
Message-ID: <20191011092620.bzlv4jobru2t56vd@debian>
References: <20191010151111.22125-1-ian.jackson@eu.citrix.com>
 <20191010151111.22125-8-ian.jackson@eu.citrix.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191010151111.22125-8-ian.jackson@eu.citrix.com>
User-Agent: NeoMutt/20180716
Subject: Re: [Xen-devel] [XEN PATCH for-4.13 v2 7/9] libxl: create:
 setdefault: Make libxl_physinfo info[1]
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
Cc: Wei Liu <wl@xen.org>, Andrew Cooper <Andrew.Cooper3@citrix.com>,
 Paul Durrant <pdurrant@gmail.com>, Jan Beulich <jbeulich@suse.com>,
 Anthony PERARD <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVGh1LCBPY3QgMTAsIDIwMTkgYXQgMDQ6MTE6MDlQTSArMDEwMCwgSWFuIEphY2tzb24gd3Jv
dGU6Cj4gTm8gZnVuY3Rpb25hbCBjaGFuZ2UuICBUaGlzIHdpbGwgbGV0IHVzIG1ha2UgaXQgaW50
byBhIHBvaW50ZXIgd2l0aG91dAo+IHRleHR1YWwgY2hhbmdlIG90aGVyIHRoYW4gdG8gdGhlIGRl
ZmluaXRpb24uCj4gCj4gV2hpbGUgd2UgYXJlIGhlcmUsIGZpeCBzb21lIHN0eWxlIGVycm9ycyAo
bWlzc2luZyB7IH0pLgo+IAo+IFNpZ25lZC1vZmYtYnk6IElhbiBKYWNrc29uIDxpYW4uamFja3Nv
bkBldS5jaXRyaXguY29tPgoKCkFja2VkLWJ5OiBXZWkgTGl1IDx3bEB4ZW4ub3JnPgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxp
bmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5w
cm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
