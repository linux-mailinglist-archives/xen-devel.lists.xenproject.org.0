Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4727AF4B55
	for <lists+xen-devel@lfdr.de>; Fri,  8 Nov 2019 13:20:01 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iT3Cj-0006Id-8l; Fri, 08 Nov 2019 12:17:29 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=BnoG=ZA=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1iT3Ch-0006IY-QO
 for xen-devel@lists.xenproject.org; Fri, 08 Nov 2019 12:17:27 +0000
X-Inumbo-ID: ba10fa30-0221-11ea-9631-bc764e2007e4
Received: from mail-wr1-f66.google.com (unknown [209.85.221.66])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ba10fa30-0221-11ea-9631-bc764e2007e4;
 Fri, 08 Nov 2019 12:17:27 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id i10so6807911wrs.7
 for <xen-devel@lists.xenproject.org>; Fri, 08 Nov 2019 04:17:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=fhNmM1A/9SlWXZfoe6Mob7kfK0C8L8kPpm4NnU3Uc3w=;
 b=kV4fG1CN/Jm1hcuzMUyL1EMH9sVm1azsJrwOrS4gcUUK375g63eCTvm9qqv8XbFSpY
 DZPp2NtYI6705WnhpmXnJQvL6lLRsQI5PWS2fuBuecoKYN4O8yiUlaLkWy/J64zEb61/
 wyP7TCAYSDujJ+LdyRkrxfZYUX1r3RhZF/W77aHhKd4f7eQud9QB7xEL9RfQ3LHfu+Vk
 M417CpV+1VKJdXvHJNGhfGuJNm4y2Sz34Pin0q9VttM5D/zv+7SjgKc3donHNzfNNJn2
 H+kawndjw+BYMg0kcHiJYSP9qZbIuA/wKCrRwIGGAbVA0Tn/s4ITz8f2Ii0U8ftb/Uvg
 n1Gg==
X-Gm-Message-State: APjAAAXgE2z4OzfCkYwP9oK2Z1ykiFVvCvGJ3XXSdwgXDrTQuSMg1qeL
 n91qefJW/QDesRKfSFWNRnY=
X-Google-Smtp-Source: APXvYqyYwlLr/em3MQxtonpXDasRXkITJ9JS0oFt5eYKyH3Lvqfu+BOwA17c4Zq/eaWCqEXECOiNLA==
X-Received: by 2002:adf:e602:: with SMTP id p2mr8481312wrm.348.1573215446372; 
 Fri, 08 Nov 2019 04:17:26 -0800 (PST)
Received: from debian (108.162.147.147.dyn.plus.net. [147.147.162.108])
 by smtp.gmail.com with ESMTPSA id c24sm11245064wrb.27.2019.11.08.04.17.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Nov 2019 04:17:25 -0800 (PST)
Date: Fri, 8 Nov 2019 12:17:24 +0000
From: Wei Liu <wl@xen.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <20191108121724.bmhbibka7fl477ea@debian>
References: <20191031115829.74378-1-roger.pau@citrix.com>
 <5e3ed175-bc9b-054b-8bb5-1a8ce0b55a06@suse.com>
 <20191108115502.lpc2dhlztllfldm2@debian>
 <4db8cc9c-6dde-f106-7d3d-288523a50db0@citrix.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <4db8cc9c-6dde-f106-7d3d-288523a50db0@citrix.com>
User-Agent: NeoMutt/20180716
Subject: Re: [Xen-devel] [PATCH for-4.13] x86/shim: copy back the result of
 EVTCHNOP_status
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
Cc: =?utf-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>,
 xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>,
 Wei Liu <wl@xen.org>, Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gRnJpLCBOb3YgMDgsIDIwMTkgYXQgMTI6MDc6MDhQTSArMDAwMCwgQW5kcmV3IENvb3BlciB3
cm90ZToKPiBPbiAwOC8xMS8yMDE5IDExOjU1LCBXZWkgTGl1IHdyb3RlOgo+ID4gT24gRnJpLCBO
b3YgMDEsIDIwMTkgYXQgMDc6MTc6NTdBTSArMDEwMCwgSsO8cmdlbiBHcm/DnyB3cm90ZToKPiA+
PiBPbiAzMS4xMC4xOSAxMjo1OCwgUm9nZXIgUGF1IE1vbm5lIHdyb3RlOgo+ID4+PiBUaGUgZXZl
bnQgY2hhbm5lbCBkYXRhIHdhcyBub3QgY29waWVkIGJhY2sgdG8gZ3Vlc3QgbWVtb3J5LCBmaXgg
dGhpcwo+ID4+PiBieSBkb2luZyB0aGUgY29weS4KPiA+Pj4KPiA+Pj4gU2lnbmVkLW9mZi1ieTog
Um9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+Cj4gPj4gUmVsZWFzZS1hY2tl
ZC1ieTogSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29tPgo+ID4gSmFuPyBBbmRyZXc/Cj4g
Cj4gV2hhdHMgdXA/IGMvcyAwZjQ1YmJiYzQwIG5vdCBnb29kIGVub3VnaD8KCk9oLCBJIG1pc3Nl
ZCB0aGF0LiBTb3JyeSBmb3IgdGhlIG5vaXNlLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3hlbi1kZXZlbA==
