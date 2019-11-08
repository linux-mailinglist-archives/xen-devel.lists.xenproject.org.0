Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 101EBF487D
	for <lists+xen-devel@lfdr.de>; Fri,  8 Nov 2019 12:57:56 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iT2r6-00046C-2d; Fri, 08 Nov 2019 11:55:08 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=BnoG=ZA=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1iT2r4-000467-35
 for xen-devel@lists.xenproject.org; Fri, 08 Nov 2019 11:55:06 +0000
X-Inumbo-ID: 9a6a9752-021e-11ea-984a-bc764e2007e4
Received: from mail-wm1-f67.google.com (unknown [209.85.128.67])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9a6a9752-021e-11ea-984a-bc764e2007e4;
 Fri, 08 Nov 2019 11:55:05 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id b11so5880477wmb.5
 for <xen-devel@lists.xenproject.org>; Fri, 08 Nov 2019 03:55:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=0AH5vCl7me2IJpewzmR9taii1fdcTjKxqD0viCdEYl8=;
 b=YTlfH+1fZKfVzxparvZ0zuLzxoj4kVKJQPIf8uMDBlUAjVpA5wnXWam3FmYCoQI6VV
 0K5X3A6mO6hMV/H+LJd/Fdx7QlxLX4guNTeL0IjbYOG5um9C1yaZm0Lty49IS9C0i/SI
 I0DOpiDmUhtRPcHgmd7fnddZxLlKUq+6+j3KkEq+4QiwtGumehu1Pf7LJQ5XlvGVLSTa
 oCPpq+0MgEaR4DTR6YcVdWc/tLhM7+MOgfG4IEBRSdYCVhMKdK6WLLLI7Q3c4SjYuM2S
 sGN2P3MemRIfnmGoOZE/K7+NISfWx1mpuf+clANX+VWejqrhbXIboWGaATqrz1slpEw4
 LBDg==
X-Gm-Message-State: APjAAAW4k0NjQg+hBCSwjDlAsf0l6WHXyn6RQh3sJZlgf9X/7Pv/pbTu
 WxxfGmMOzlzq5lovhDk7AMs=
X-Google-Smtp-Source: APXvYqxZoaCsslIWsbFM6GI44pmmd9cvWGXfAx3x9fDp51x7/tnuNADfvK2Up4SvAKs9+NH1mFtOFA==
X-Received: by 2002:a1c:7d95:: with SMTP id y143mr8204495wmc.143.1573214104830; 
 Fri, 08 Nov 2019 03:55:04 -0800 (PST)
Received: from debian (108.162.147.147.dyn.plus.net. [147.147.162.108])
 by smtp.gmail.com with ESMTPSA id b66sm6006258wmh.39.2019.11.08.03.55.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Nov 2019 03:55:04 -0800 (PST)
Date: Fri, 8 Nov 2019 11:55:02 +0000
From: Wei Liu <wl@xen.org>
To: =?utf-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <20191108115502.lpc2dhlztllfldm2@debian>
References: <20191031115829.74378-1-roger.pau@citrix.com>
 <5e3ed175-bc9b-054b-8bb5-1a8ce0b55a06@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <5e3ed175-bc9b-054b-8bb5-1a8ce0b55a06@suse.com>
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
Cc: xen-devel@lists.xenproject.org, Andrew Cooper <andrew.cooper3@citrix.com>,
 Wei Liu <wl@xen.org>, Jan Beulich <jbeulich@suse.com>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gRnJpLCBOb3YgMDEsIDIwMTkgYXQgMDc6MTc6NTdBTSArMDEwMCwgSsO8cmdlbiBHcm/DnyB3
cm90ZToKPiBPbiAzMS4xMC4xOSAxMjo1OCwgUm9nZXIgUGF1IE1vbm5lIHdyb3RlOgo+ID4gVGhl
IGV2ZW50IGNoYW5uZWwgZGF0YSB3YXMgbm90IGNvcGllZCBiYWNrIHRvIGd1ZXN0IG1lbW9yeSwg
Zml4IHRoaXMKPiA+IGJ5IGRvaW5nIHRoZSBjb3B5Lgo+ID4gCj4gPiBTaWduZWQtb2ZmLWJ5OiBS
b2dlciBQYXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT4KPiAKPiBSZWxlYXNlLWFja2Vk
LWJ5OiBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+CgpKYW4/IEFuZHJldz8KCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWls
aW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVu
cHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
