Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AECAF86F14
	for <lists+xen-devel@lfdr.de>; Fri,  9 Aug 2019 03:05:29 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hvtIO-0002DA-3O; Fri, 09 Aug 2019 01:02:16 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=2pXQ=WF=davemloft.net=davem@srs-us1.protection.inumbo.net>)
 id 1hvtIM-0002D5-4e
 for xen-devel@lists.xenproject.org; Fri, 09 Aug 2019 01:02:14 +0000
X-Inumbo-ID: 52783fc6-ba41-11e9-8980-bc764e045a96
Received: from shards.monkeyblade.net (unknown [2620:137:e000::1:9])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 52783fc6-ba41-11e9-8980-bc764e045a96;
 Fri, 09 Aug 2019 01:02:13 +0000 (UTC)
Received: from localhost (unknown [IPv6:2601:601:9f80:35cd::d71])
 (using TLSv1 with cipher AES256-SHA (256/256 bits))
 (Client did not present a certificate)
 (Authenticated sender: davem-davemloft)
 by shards.monkeyblade.net (Postfix) with ESMTPSA id 8922214254DF3;
 Thu,  8 Aug 2019 18:02:12 -0700 (PDT)
Date: Thu, 08 Aug 2019 18:02:12 -0700 (PDT)
Message-Id: <20190808.180212.865026468498688254.davem@davemloft.net>
To: ross.lagerwall@citrix.com
From: David Miller <davem@davemloft.net>
In-Reply-To: <20190805153434.12144-1-ross.lagerwall@citrix.com>
References: <20190805153434.12144-1-ross.lagerwall@citrix.com>
X-Mailer: Mew version 6.8 on Emacs 26.1
Mime-Version: 1.0
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.12
 (shards.monkeyblade.net [149.20.54.216]);
 Thu, 08 Aug 2019 18:02:12 -0700 (PDT)
Subject: Re: [Xen-devel] [PATCH] xen/netback: Reset nr_frags before freeing
 skb
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
Cc: netdev@vger.kernel.org, wei.liu@kernel.org, paul.durrant@citrix.com,
 xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RnJvbTogUm9zcyBMYWdlcndhbGwgPHJvc3MubGFnZXJ3YWxsQGNpdHJpeC5jb20+CkRhdGU6IE1v
biwgNSBBdWcgMjAxOSAxNjozNDozNCArMDEwMAoKPiBBdCB0aGlzIHBvaW50IG5yX2ZyYWdzIGhh
cyBiZWVuIGluY3JlbWVudGVkIGJ1dCB0aGUgZnJhZyBkb2VzIG5vdCB5ZXQKPiBoYXZlIGEgcGFn
ZSBhc3NpZ25lZCBzbyBmcmVlaW5nIHRoZSBza2IgcmVzdWx0cyBpbiBhIGNyYXNoLiBSZXNldAo+
IG5yX2ZyYWdzIGJlZm9yZSBmcmVlaW5nIHRoZSBza2IgdG8gcHJldmVudCB0aGlzLgo+IAo+IFNp
Z25lZC1vZmYtYnk6IFJvc3MgTGFnZXJ3YWxsIDxyb3NzLmxhZ2Vyd2FsbEBjaXRyaXguY29tPgoK
QXBwbGllZCBhbmQgcXVldWVkIHVwIGZvciAtc3RhYmxlLgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2
ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
