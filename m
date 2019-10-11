Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EAC3D3C64
	for <lists+xen-devel@lfdr.de>; Fri, 11 Oct 2019 11:32:58 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iIrBu-0002L5-EN; Fri, 11 Oct 2019 09:26:30 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=L6yD=YE=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1iIrBs-0002Kz-JJ
 for xen-devel@lists.xenproject.org; Fri, 11 Oct 2019 09:26:28 +0000
X-Inumbo-ID: 3362bc22-ec09-11e9-9330-12813bfff9fa
Received: from mail-wr1-f66.google.com (unknown [209.85.221.66])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 3362bc22-ec09-11e9-9330-12813bfff9fa;
 Fri, 11 Oct 2019 09:26:27 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id h4so11082157wrv.7
 for <xen-devel@lists.xenproject.org>; Fri, 11 Oct 2019 02:26:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=oNBeJ7EJDIMrg9rGhDGOEtnL+rkd8d2UK4cbmBXqyoQ=;
 b=TfXBnGBwGnAX5M7P3/B3dTuSv5shTMPo8jbqIipXGYOOmRUcbwWk7d3yldVysHFufq
 yHxGo/phm77Q1edu5QrkdKhkZc/SV8OAEyV8B7no7woHCWBZWByoeZ2LI8RXtQnx2SpN
 efH2m9tfV2ud8ppVWq/z/YB9zJct14nlJimErqJFjyaezKSm4/jDWD5qMNO6qP44IHzU
 3UIJ5m45ZeYPVNBrOO7+Hym17tMRQrOs6Su9xkttjVI/1ii908QF9R6SBoFkXTDijk5z
 vfqvvuHwq6ZpJPrGSLeZLdc2YuwLc2ELnvk163Q1patKY/xhrjf+foAAklMrKeyPiLtT
 UtXg==
X-Gm-Message-State: APjAAAUdN/m/3dUD0USVn/sek3zRuPutH5zQVtjUjpbrhhvCyBTXPZWE
 Kwmb+1Cx1n+rqD5awA+JkQ1zIdzQyz0=
X-Google-Smtp-Source: APXvYqxNfmeTIOAChkMNpUi1PEJzj9LZKRmpY8RcONej7pfyDrEh0ArmkXMwAwZ9KdsC5nXIO4DRzg==
X-Received: by 2002:adf:ed52:: with SMTP id u18mr13084175wro.16.1570785986997; 
 Fri, 11 Oct 2019 02:26:26 -0700 (PDT)
Received: from debian (207.148.159.143.dyn.plus.net. [143.159.148.207])
 by smtp.gmail.com with ESMTPSA id b5sm6732958wmj.18.2019.10.11.02.26.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Oct 2019 02:26:26 -0700 (PDT)
Date: Fri, 11 Oct 2019 10:26:24 +0100
From: Wei Liu <wl@xen.org>
To: Ian Jackson <ian.jackson@eu.citrix.com>
Message-ID: <20191011092624.brnnhosylieycdee@debian>
References: <20191010151111.22125-1-ian.jackson@eu.citrix.com>
 <20191010151111.22125-9-ian.jackson@eu.citrix.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191010151111.22125-9-ian.jackson@eu.citrix.com>
User-Agent: NeoMutt/20180716
Subject: Re: [Xen-devel] [XEN PATCH for-4.13 v2 8/9] libxl: create:
 setdefault: Move physinfo into config_setdefault
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

T24gVGh1LCBPY3QgMTAsIDIwMTkgYXQgMDQ6MTE6MTBQTSArMDEwMCwgSWFuIEphY2tzb24gd3Jv
dGU6Cj4gTm8gZnVuY3Rpb25hbCBjaGFuZ2UuICBUaGlzIHdpbGwgbGV0IHVzIHJlZmVyIHRvIGl0
IGluIGNvZGUgd2UgYXJlCj4gYWJvdXQgdG8gYWRkIHRvIHRoaXMgZnVuY3Rpb24uCj4gCj4gU2ln
bmVkLW9mZi1ieTogSWFuIEphY2tzb24gPGlhbi5qYWNrc29uQGV1LmNpdHJpeC5jb20+CgpBY2tl
ZC1ieTogV2VpIExpdSA8d2xAeGVuLm9yZz4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3Rz
LnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0
aW5mby94ZW4tZGV2ZWw=
