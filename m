Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A207CB6BE
	for <lists+xen-devel@lfdr.de>; Fri,  4 Oct 2019 10:59:30 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iGJP4-0000lH-1Z; Fri, 04 Oct 2019 08:57:34 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=qonk=X5=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1iGJP2-0000l7-6e
 for xen-devel@lists.xenproject.org; Fri, 04 Oct 2019 08:57:32 +0000
X-Inumbo-ID: ff4809ee-e684-11e9-9746-12813bfff9fa
Received: from mail-wm1-f46.google.com (unknown [209.85.128.46])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ff4809ee-e684-11e9-9746-12813bfff9fa;
 Fri, 04 Oct 2019 08:57:30 +0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id r19so4946699wmh.2
 for <xen-devel@lists.xenproject.org>; Fri, 04 Oct 2019 01:57:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=k68Jk2unMUzHeo2VCHmxj7My9yOX1Meum7gVeahWNcQ=;
 b=Gp8GQBDZYkUcnYtGFzgtOEm/UdroijnDKiyiMIUpipQoo/qe+AuXlTrrPlOQXaHY66
 RLHjTxn03UG0N788tVXDQC3RQigfNbhj8QUYMOh9V6zblRZSxCqk0sDLNLbzC/DHYXee
 RpFJVTxndPa+H0Lx6yMhFUkkqbMpcSVEF08kYy3CZyJeBE0gK33Mk4DzfvcMvew91ZFF
 tRi9foCdDKdWUjuX5sVbTNUeApBKYUYOAfqaABNfXGTt178yuHDkilQcFcLsHMM/xNQk
 UQA28dxTJliY6BT3w8UsRkoJMUSl87nV4uyiF4JSV7FNzlMgMpzBsvnmORGHdcpFvvLM
 R34A==
X-Gm-Message-State: APjAAAUiuqtjuho5AF0zSJ472uDQ2/5ZpaLrZAVatS8uTxJzdlSCIx4r
 yvIROojdzPeItydRRiTRmRY=
X-Google-Smtp-Source: APXvYqxO9OkUvzXX+CctQns4tuYRKkhrsp2M/M60gUdb0B5D8Ci1MigD7zkJUF4QD8ZR/erZpXrnQA==
X-Received: by 2002:a1c:658b:: with SMTP id
 z133mr10248415wmb.130.1570179450017; 
 Fri, 04 Oct 2019 01:57:30 -0700 (PDT)
Received: from debian (207.148.159.143.dyn.plus.net. [143.159.148.207])
 by smtp.gmail.com with ESMTPSA id r12sm5899412wrq.88.2019.10.04.01.57.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Oct 2019 01:57:29 -0700 (PDT)
Date: Fri, 4 Oct 2019 09:57:28 +0100
From: Wei Liu <wl@xen.org>
To: Lars Kurth <lars.kurth@citrix.com>
Message-ID: <20191004085728.ba4tpw6gfvhcaowz@debian>
References: <EABA07C5-13F3-4D78-BDB9-21A4B5C5772E@citrix.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <EABA07C5-13F3-4D78-BDB9-21A4B5C5772E@citrix.com>
User-Agent: NeoMutt/20180716
Subject: Re: [Xen-devel] [PATCH for-4.13] docs: update all URLs in man pages
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
Cc: "jgross@suse.com" <jgross@suse.com>,
 xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>,
 Ian Jackson <Ian.Jackson@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVGh1LCBPY3QgMDMsIDIwMTkgYXQgMDQ6MTI6MzBQTSArMDAwMCwgTGFycyBLdXJ0aCB3cm90
ZToKPiBTcGVjaWZpY2FsbHkKPiAqIHhlbi5vcmcgdG8geGVucHJvamVjdC5vcmcKPiAqIGh0dHAg
dG8gaHR0cHMKPiAqIFJlcGxhY2VkIHBhZ2VzIHdoZXJlIHBhZ2UgaGFzIG1vdmVkCj4gICAoaW5j
bHVkaW5nIG9uIHhlbiBwYWdlcyBhcyB3ZWxsIGFzIGV4dGVybmFsIHBhZ2VzKQo+ICogUmVtb3Zl
ZCBzb21lIFVSTHMgKGUuZy4gZG93bmxvYWRzIGZvciBMaW51eCBQViBkcml2ZXJzKQo+IAo+IFRl
c3RlZC1ieTogTGFycyBLdXJ0aCA8bGFycy5rdXJ0aEBjaXRyaXguY29tPgo+IFNpZ25lZC1vZmYt
Ynk6IExhcnMgS3VydGggPGxhcnMua3VydGhAY2l0cml4LmNvbT4KCkRvIHlvdSBoYXZlIGEgYnJh
bmNoIGZvciB0aGlzIHBhdGNoPwoKV2VpLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMu
eGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL3hlbi1kZXZlbA==
