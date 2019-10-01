Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CC6AC3B58
	for <lists+xen-devel@lfdr.de>; Tue,  1 Oct 2019 18:44:32 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iFLDO-0007FL-QR; Tue, 01 Oct 2019 16:41:30 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=emkH=X2=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1iFLDN-0007FG-JG
 for xen-devel@lists.xenproject.org; Tue, 01 Oct 2019 16:41:29 +0000
X-Inumbo-ID: 50bd4cfc-e46a-11e9-9704-12813bfff9fa
Received: from mail-wm1-f67.google.com (unknown [209.85.128.67])
 by localhost (Halon) with ESMTPS
 id 50bd4cfc-e46a-11e9-9704-12813bfff9fa;
 Tue, 01 Oct 2019 16:41:28 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id b24so3967921wmj.5
 for <xen-devel@lists.xenproject.org>; Tue, 01 Oct 2019 09:41:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=YyuAY4w7wyly3cgRKA1eRrtMbnHYvTD6Cu197sjK/Cc=;
 b=BeJ9z8H+8I/jk2aErorGcX0S1fwm/KKv+UcuoAfQWMNXeF/MqTXvLMQ8Yqg8miCs6i
 NwUpaLxG7NJE73sI+f3pdPyQMX9aLBHz75g9ftUgfDPWGNR2vgPvATBNg92k+A3b7Luh
 ef7vIYBddDd4Mk74/6Y08N/5+kLHDQgIHz4aia4cWCtcbg0/4CfKeguwTcs19AdFv2PG
 naWO4GjozkhCV+blvu3jVPLDEp5DXVJt1AVxBAMOU1c7DwgNMetyP8NTOYl9XZdtEOlC
 ZOSyBULVn2HW9A6UnYdM3ScCUGdEdUQ2PR/vQWDZw7vR3TRakOYch8HRM+QnXJKSiBp/
 Ei9A==
X-Gm-Message-State: APjAAAWWEzIZz0lxiW1snWLJJA3yb6RRSe2bRz+DY2BER/y2JoqOJOUg
 Ni++0THIzjaWsjXq3gfekmQ=
X-Google-Smtp-Source: APXvYqykEVJiJbVlbTVAXZhXfBZWTn0BYapfiF9N9C67HYvoWc3G5B79Cxn7D8HnML/I81huONK7OQ==
X-Received: by 2002:a1c:9ecb:: with SMTP id h194mr4330325wme.35.1569948088067; 
 Tue, 01 Oct 2019 09:41:28 -0700 (PDT)
Received: from debian (207.148.159.143.dyn.plus.net. [143.159.148.207])
 by smtp.gmail.com with ESMTPSA id x2sm23036476wrn.81.2019.10.01.09.41.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Oct 2019 09:41:27 -0700 (PDT)
Date: Tue, 1 Oct 2019 17:41:25 +0100
From: Wei Liu <wl@xen.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <20191001164125.vasymydjxrhilffg@debian>
References: <20191001163237.17361-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191001163237.17361-1-andrew.cooper3@citrix.com>
User-Agent: NeoMutt/20180716
Subject: Re: [Xen-devel] [PATCH] x86/Kconfig: Invert the defaults for
 CONFIG_{PVH_GUEST, PV_SHIM}
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
Cc: Juergen Gross <jgross@suse.com>, Xen-devel <xen-devel@lists.xenproject.org>,
 Wei Liu <wl@xen.org>, Jan Beulich <JBeulich@suse.com>,
 Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVHVlLCBPY3QgMDEsIDIwMTkgYXQgMDU6MzI6MzdQTSArMDEwMCwgQW5kcmV3IENvb3BlciB3
cm90ZToKPiBUaGlzIGlzIGEgbWlub3IgVUkgY2hhbmdlLCBidXQgdXNlcnMgd2hpY2ggaGF2ZSBl
bGVjdGVkIHRvIGVuYWJsZQo+IFhFTl9HVUVTVCAod2hpY2ggc3RpbGwgZGVmYXVsdHMgdG8gbm8p
IHdpbGwgZGVmaW5pdGVseSBuZWVkIG9uZSBvZiB0aGVzZQo+IG9wdGlvbnMsIGFuZCB3aWxsIHR5
cGljYWxseSB3YW50IGJvdGguCj4gCj4gU2lnbmVkLW9mZi1ieTogQW5kcmV3IENvb3BlciA8YW5k
cmV3LmNvb3BlcjNAY2l0cml4LmNvbT4KCk1ha2VzIHNlbnNlLiAKCkFja2VkLWJ5OiBXZWkgTGl1
IDx3bEB4ZW4ub3JnPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5v
cmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZl
bA==
