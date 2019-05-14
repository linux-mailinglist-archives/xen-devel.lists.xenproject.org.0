Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 620A91CA07
	for <lists+xen-devel@lfdr.de>; Tue, 14 May 2019 16:06:39 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hQY1i-0006LM-DW; Tue, 14 May 2019 14:03:30 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=pH1X=TO=citrix.com=prvs=030624cdf=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1hQY1h-0006LG-5N
 for xen-devel@lists.xenproject.org; Tue, 14 May 2019 14:03:29 +0000
X-Inumbo-ID: 0a368bea-7651-11e9-8313-f7619ff1652d
Received: from SMTP03.CITRIX.COM (unknown [162.221.156.55])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 0a368bea-7651-11e9-8313-f7619ff1652d;
 Tue, 14 May 2019 14:03:25 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,468,1549929600"; d="scan'208";a="85440536"
Date: Tue, 14 May 2019 15:03:22 +0100
From: Wei Liu <wei.liu2@citrix.com>
To: Roger Pau Monne <roger.pau@citrix.com>
Message-ID: <20190514140322.GD2798@zion.uk.xensource.com>
References: <20190514135922.57629-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190514135922.57629-1-roger.pau@citrix.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Subject: Re: [Xen-devel] [PATCH v2] pvshim: make PV shim build selectable
 from configure
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
Cc: xen-devel@lists.xenproject.org, Ian Jackson <ian.jackson@eu.citrix.com>,
 Wei Liu <wei.liu2@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVHVlLCBNYXkgMTQsIDIwMTkgYXQgMDM6NTk6MjJQTSArMDIwMCwgUm9nZXIgUGF1IE1vbm5l
IHdyb3RlOgo+IFNvIGEgdXNlciBjYW4gZGVjaWRlIHdoZXRoZXIgdG8gY29tcGlsZSBhIFBWIHNo
aW0gYXMgcGFydCBvZiB0aGUgdG9vbHMKPiBidWlsZC4gTm90ZSB0aGF0IHRoZSBkZWZhdWx0IGJl
aGF2aW9yIGlzIHByZXNlcnZlZCwgd2hpY2ggaXMgdG8gYnVpbGQKPiBhIFBWIHNoaW0gd2hlbiB0
aGUgdGFyZ2V0IG9yIGhvc3QgKGlmIHRhcmdldCBpcyB1bnNldCkgYXJjaGl0ZWN0dXJlIGlzCj4g
NjRiaXQgeDg2Lgo+IAo+IFJlcXVlc3RlZC1ieTogT2xhZiBIZXJpbmcgPG9sYWZAYWVwZmxlLmRl
Pgo+IFNpZ25lZC1vZmYtYnk6IFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRyaXguY29t
Pgo+IC0tLQo+IE5PVEU6IHJ1biBhdXRvZ2VuLnNoIGFmdGVyIGFwcGx5aW5nLgoKTm90ZWQuCgpB
Y2tlZC1ieTogV2VpIExpdSA8d2VpLmxpdTJAY2l0cml4LmNvbT4KCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVu
LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcv
bWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
