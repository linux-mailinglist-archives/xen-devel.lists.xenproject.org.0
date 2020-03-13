Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 72022184470
	for <lists+xen-devel@lfdr.de>; Fri, 13 Mar 2020 11:09:28 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jChCm-0007Ey-Gx; Fri, 13 Mar 2020 10:06:12 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=/r42=46=mail.xenproject.org=aliasfile-bounces@srs-us1.protection.inumbo.net>)
 id 1jChCk-0007Et-F3
 for xen-devel@lists.xenproject.org; Fri, 13 Mar 2020 10:06:10 +0000
X-Inumbo-ID: 4336f668-6512-11ea-a6c1-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4336f668-6512-11ea-a6c1-bc764e2007e4;
 Fri, 13 Mar 2020 10:06:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID
 :Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID
 :Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:
 Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe
 :List-Post:List-Owner:List-Archive;
 bh=keLd0X8pdXjLT0BZ1JAWYNr9Y6Fy/TxTpOutJTJXnTc=; b=WqCiaVxxF3QWa7PsYFu1pKMHey
 P+qjfYS4fJMraBvrYSMz7dmcRVKBqGsR0NY7T+Za4ACkqJ6i/eoJIeoawx1tzt7/DAicqwJbcZlOA
 ZZ9JidjcP1FpT8NqoGvbwIRVJSNVIQgvBOIZtUP+jJyoYQYxTwvB6Xr4IvdL3ngSCrIQ=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <aliasfile-bounces@mail.xenproject.org>)
 id 1jChCj-0000zj-Kh; Fri, 13 Mar 2020 10:06:09 +0000
Received: from 41.142.6.51.dyn.plus.net ([51.6.142.41] helo=debian)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <wl@xen.org>)
 id 1jChCj-0006Zh-B8; Fri, 13 Mar 2020 10:06:09 +0000
Date: Fri, 13 Mar 2020 10:06:06 +0000
From: Wei Liu <wl@xen.org>
To: julien@xen.org
Message-ID: <20200313100606.5w2ojsapjrm5vnti@debian>
References: <20200312202407.1154-1-julien@xen.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200312202407.1154-1-julien@xen.org>
User-Agent: NeoMutt/20180716
Subject: Re: [Xen-devel] [PATCH] tools/helpers: xen-init-dom0: Mark
 clear_domid_history() static
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
Cc: xen-devel@lists.xenproject.org, Julien Grall <jgrall@amazon.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wl@xen.org>, paul@xen.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVGh1LCBNYXIgMTIsIDIwMjAgYXQgMDg6MjQ6MDdQTSArMDAwMCwganVsaWVuQHhlbi5vcmcg
d3JvdGU6Cj4gRnJvbTogSnVsaWVuIEdyYWxsIDxqZ3JhbGxAYW1hem9uLmNvbT4KPiAKPiB4ZW4t
aW5pdC1kb20wIGlzIGEgc3RhbmRhbG9uZSBiaW5hcnksIHNvIGFsbCB0aGUgZnVuY3Rpb25zIGJ1
dCB0aGUKPiBtYWluKCkgc2hvdWxkIGJlIHN0YXRpYy4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBKdWxp
ZW4gR3JhbGwgPGpncmFsbEBhbWF6b24uY29tPgoKQWNrZWQtYnk6IFdlaSBMaXUgPHdsQHhlbi5v
cmc+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4t
ZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczov
L2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
