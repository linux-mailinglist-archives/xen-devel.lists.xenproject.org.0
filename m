Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 39AF7E3A85
	for <lists+xen-devel@lfdr.de>; Thu, 24 Oct 2019 20:00:45 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iNhNB-0002D9-7D; Thu, 24 Oct 2019 17:58:09 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ZeBO=YR=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1iNhN9-0002D4-Ui
 for xen-devel@lists.xenproject.org; Thu, 24 Oct 2019 17:58:07 +0000
X-Inumbo-ID: d52410a0-f687-11e9-94ab-12813bfff9fa
Received: from mail-wm1-f68.google.com (unknown [209.85.128.68])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d52410a0-f687-11e9-94ab-12813bfff9fa;
 Thu, 24 Oct 2019 17:58:07 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id q130so3305638wme.2
 for <xen-devel@lists.xenproject.org>; Thu, 24 Oct 2019 10:58:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=jBIvn14szkmK1nmDkLA8I6V5EJqxzTMeb/HukeU96Ck=;
 b=XCdm98ScUZxORMbWr51bwbFkFo0iqH+ORo2K1LaJnvdl0NJ/oDioIBkE8OEqjNjjxG
 i6SfRPi5ugLe2lsM595ZzN5ZBvPaUE7FQ65BPKq+9AfJUZbLPzJcIMRPp44wnt4zhXch
 E2jFRKQEpLu5Bv3u0dKEY+t/0ijrU5D1QKzCPXdeBmuYStQmqNW8Iu/AOJybnTrXaLJp
 w3cacKNUh0DY18tZWnUdP+9vJS17+j92Q+xUi30Iijjsf4SRfTCv4RXAvtW/ty1AvK+h
 fDZSF40KNUUygDywbo3M35ezf0R0cusDC4R0s2Eh3nILz8XdfNAmcAfhnhk3n2OmdKNx
 lUTQ==
X-Gm-Message-State: APjAAAVKjBLgwrG5Uk8WgEPOai6sI2yiF5jTr9cB/qIm8YbwAqK/OTE3
 nYijGeH4RNZ+jscqHF7X90o=
X-Google-Smtp-Source: APXvYqzaezqVng2Y0ou/OeFXmAAVw2WeZTFNe9P/t885T2FUg/C+KF8wEGQmxstTguqIH+ZRvkKfEw==
X-Received: by 2002:a1c:9ec6:: with SMTP id h189mr5677726wme.71.1571939886576; 
 Thu, 24 Oct 2019 10:58:06 -0700 (PDT)
Received: from debian (54.163.200.146.dyn.plus.net. [146.200.163.54])
 by smtp.gmail.com with ESMTPSA id p15sm25430384wrs.94.2019.10.24.10.58.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Oct 2019 10:58:06 -0700 (PDT)
Date: Thu, 24 Oct 2019 18:58:04 +0100
From: Wei Liu <wl@xen.org>
To: Jan Beulich <jbeulich@suse.com>
Message-ID: <20191024175804.bxctnssztpxbsvtx@debian>
References: <073cd4d0-ec28-f6b3-adf0-dcfbfeada8f6@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <073cd4d0-ec28-f6b3-adf0-dcfbfeada8f6@suse.com>
User-Agent: NeoMutt/20180716
Subject: Re: [Xen-devel] [PATCH] MAINTAINERS: correct decription of M:
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
Cc: Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>, Ian Jackson <ian.jackson@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVGh1LCBPY3QgMjQsIDIwMTkgYXQgMDM6NDU6MjBQTSArMDIwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gTGV0J3MgcmVmbGVjdCByZWFsaXR5LCBpdHMgdXNlIGJ5IGFkZF9tYWludGFpbmVycy5w
bCAvIGdldF9tYWludGFpbmVyLnBsLAo+IGFzIHdlbGwgYXMgd2hhdAo+IGh0dHBzOi8vd2lraS54
ZW5wcm9qZWN0Lm9yZy93aWtpL1N1Ym1pdHRpbmdfWGVuX1Byb2plY3RfUGF0Y2hlcyBzYXlzLgo+
IAo+IFNpZ25lZC1vZmYtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KCkFja2Vk
LWJ5OiBXZWkgTGl1IDx3bEB4ZW4ub3JnPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMu
eGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL3hlbi1kZXZlbA==
