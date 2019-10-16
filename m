Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C68FCD856F
	for <lists+xen-devel@lfdr.de>; Wed, 16 Oct 2019 03:23:05 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iKXyW-0006JG-Tl; Wed, 16 Oct 2019 01:19:40 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=4P2I=YJ=davemloft.net=davem@srs-us1.protection.inumbo.net>)
 id 1iKXyV-0006JB-Kn
 for xen-devel@lists.xenproject.org; Wed, 16 Oct 2019 01:19:39 +0000
X-Inumbo-ID: 0549f082-efb3-11e9-bbab-bc764e2007e4
Received: from shards.monkeyblade.net (unknown [2620:137:e000::1:9])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0549f082-efb3-11e9-bbab-bc764e2007e4;
 Wed, 16 Oct 2019 01:19:38 +0000 (UTC)
Received: from localhost (unknown [IPv6:2601:601:9f00:1e2::d71])
 (using TLSv1 with cipher AES256-SHA (256/256 bits))
 (Client did not present a certificate)
 (Authenticated sender: davem-davemloft)
 by shards.monkeyblade.net (Postfix) with ESMTPSA id 1873511F5F798;
 Tue, 15 Oct 2019 18:19:37 -0700 (PDT)
Date: Tue, 15 Oct 2019 18:19:36 -0700 (PDT)
Message-Id: <20191015.181936.1206475589133546355.davem@davemloft.net>
To: jgross@suse.com
From: David Miller <davem@davemloft.net>
In-Reply-To: <20191014090910.9701-1-jgross@suse.com>
References: <20191014090910.9701-1-jgross@suse.com>
X-Mailer: Mew version 6.8 on Emacs 26.1
Mime-Version: 1.0
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.12
 (shards.monkeyblade.net [149.20.54.216]);
 Tue, 15 Oct 2019 18:19:37 -0700 (PDT)
Subject: Re: [Xen-devel] [PATCH 0/2] xen/netback: bug fix and cleanup
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
Cc: wei.liu@kernel.org, paul@xen.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RnJvbTogSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29tPgpEYXRlOiBNb24sIDE0IE9jdCAy
MDE5IDExOjA5OjA4ICswMjAwCgo+IE9uZSBidWdmaXggKHBhdGNoIDEpIEkgc3R1bWJsZWQgb3Zl
ciB3aGlsZSBkb2luZyBhIGNsZWFudXAgKHBhdGNoIDIpCj4gb2YgdGhlIHhlbi1uZXRiYWNrIGlu
aXQvZGVpbml0IGNvZGUuCgpQbGVhc2UgZG8gbm90IG1peCBjbGVhbnVwcyBhbmQgZ2VudWluZSBi
dWcgZml4ZXMuCgpTdWJtaXQgdGhlIGJ1ZyBmaXggdGFyZ2V0dGluZyB0aGUgJ25ldCcgR0lUIHRy
ZWUsIGFuZCBvbmNlIHRoYXQgZXZlbnR1YWxseQpnZXRzIG1lcmdlZCBpbnRvICduZXQtbmV4dCcg
eW91IGNhbiBzdWJtaXQgdGhlIGNsZWFudXAgYWdhaW5zdCB0aGF0LgoKVGhhbmtzLgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxp
bmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5w
cm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
