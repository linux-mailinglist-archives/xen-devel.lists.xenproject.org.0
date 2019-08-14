Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 81B598D2E1
	for <lists+xen-devel@lfdr.de>; Wed, 14 Aug 2019 14:19:43 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hxsD1-0008Lh-0e; Wed, 14 Aug 2019 12:16:55 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=5qws=WK=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1hxsCz-0008La-LR
 for xen-devel@lists.xenproject.org; Wed, 14 Aug 2019 12:16:53 +0000
X-Inumbo-ID: 662e85a4-be8d-11e9-bb28-377f88b4fe3f
Received: from mail-wr1-f46.google.com (unknown [209.85.221.46])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 662e85a4-be8d-11e9-bb28-377f88b4fe3f;
 Wed, 14 Aug 2019 12:16:53 +0000 (UTC)
Received: by mail-wr1-f46.google.com with SMTP id y8so4933180wrn.10
 for <xen-devel@lists.xenproject.org>; Wed, 14 Aug 2019 05:16:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=3wlALgkMxNqt6sLb9oMd82548ysY171j38r7GvIxeCY=;
 b=IbEN8Dr+6GldJmbK26f5Di69L8LsQMEB7JPtOBS9S4zUlp0V5/6R5p8vLM42QCXB2U
 tY/Tst+qLLOKGQlYZ7SeoQLOab6J1laQl9jrJI4cU7N2uPeXre+llQ16jRhLkEz+ufyb
 YmKqC4yDFrGrdPYNHH0AY8n0uzp7tnn2vzZMjQocHWUfcU8dZzgsLPe2GUwSAAmCCjMt
 rT0BQP05lx/by6G1q0D83xo1tt/QXU5yEAvXN9X43kHf90gQEovJPwYddnuMhf8ZsmLI
 sZRXjMDFz39hDzQ8ga4hKLxLyOCMgmRgAqDu9raAbtlAlYSksBZpjC0qHiA4cs4emwn8
 E1dw==
X-Gm-Message-State: APjAAAXqJOJiFTxOhoRGE2w2sLmoSvT4Z81hsr9rvTPMeN6/ddEKqutl
 rPW66e2dP7tGNSPA00VtGkQ=
X-Google-Smtp-Source: APXvYqxZlmJCaPiupTWKX38wblNuFhB93+ZEKORvhlofoSCsRaAqvqoGO0GJkFXHhNpPz/vOR5W2pg==
X-Received: by 2002:a5d:494d:: with SMTP id r13mr44673591wrs.82.1565785012282; 
 Wed, 14 Aug 2019 05:16:52 -0700 (PDT)
Received: from
 liuwe-gateway.j3c5onc20sse1dnehy4noqpfcg.zx.internal.cloudapp.net
 ([51.140.50.101])
 by smtp.gmail.com with ESMTPSA id u186sm8069385wmu.26.2019.08.14.05.16.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Aug 2019 05:16:51 -0700 (PDT)
Date: Wed, 14 Aug 2019 12:16:50 +0000
From: Wei Liu <wl@xen.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <20190814121650.vpot4tkdj6g7ffzn@liuwe-gateway.j3c5onc20sse1dnehy4noqpfcg.zx.internal.cloudapp.net>
References: <20190813105352.32412-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190813105352.32412-1-andrew.cooper3@citrix.com>
User-Agent: NeoMutt/20180716
Subject: Re: [Xen-devel] [PATCH 0/2] xen: Drop obsolete DOMCTLs
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
Cc: Wei Liu <wl@xen.org>, Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, Rob Hoes <Rob.Hoes@citrix.com>,
 Christian Lindig <christian.lindig@citrix.com>,
 Jan Beulich <JBeulich@suse.com>, Ian Jackson <Ian.Jackson@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 Daniel De Graaf <dgdegra@tycho.nsa.gov>,
 Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVHVlLCBBdWcgMTMsIDIwMTkgYXQgMTE6NTM6NTBBTSArMDEwMCwgQW5kcmV3IENvb3BlciB3
cm90ZToKPiBUaGVzZSBkb21jdGxzIGV4aXN0IHRvIHdvcmsgYXJvdW5kIGJ1Z3MgaW4gb2Jzb2xl
dGUgMzJiaXQgUFYgZ3Vlc3RzLiAgVGhleSBhcmUKPiBubyBsb25nZXIgdXNlZnVsLgo+IAo+IEFu
ZHJldyBDb29wZXIgKDIpOgo+ICAgeGVuOiBEcm9wIFhFTl9ET01DVExfc3VwcHJlc3Nfc3B1cmlv
dXNfcGFnZV9mYXVsdHMKPiAgIHhlbjogRHJvcCBYRU5fRE9NQ1RMX3tnZXQsc2V0fV9tYWNoaW5l
X2FkZHJlc3Nfc2l6ZQoKQWNrZWQtYnk6IFdlaSBMaXUgPHdsQHhlbi5vcmc+CgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBs
aXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2pl
Y3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
