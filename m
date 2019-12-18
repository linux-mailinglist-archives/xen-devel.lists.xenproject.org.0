Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D30C12400E
	for <lists+xen-devel@lfdr.de>; Wed, 18 Dec 2019 08:07:11 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ihTNC-0000BY-3Y; Wed, 18 Dec 2019 07:03:54 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=dfmg=2I=davemloft.net=davem@srs-us1.protection.inumbo.net>)
 id 1ihTNA-0000BT-8e
 for xen-devel@lists.xenproject.org; Wed, 18 Dec 2019 07:03:52 +0000
X-Inumbo-ID: 8b090cde-2164-11ea-b6f1-bc764e2007e4
Received: from shards.monkeyblade.net (unknown [2620:137:e000::1:9])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8b090cde-2164-11ea-b6f1-bc764e2007e4;
 Wed, 18 Dec 2019 07:03:50 +0000 (UTC)
Received: from localhost (unknown [IPv6:2601:601:9f00:1c3::3d5])
 (using TLSv1 with cipher AES256-SHA (256/256 bits))
 (Client did not present a certificate)
 (Authenticated sender: davem-davemloft)
 by shards.monkeyblade.net (Postfix) with ESMTPSA id 7CCC015038AB5;
 Tue, 17 Dec 2019 23:03:49 -0800 (PST)
Date: Tue, 17 Dec 2019 23:03:48 -0800 (PST)
Message-Id: <20191217.230348.602638762802229798.davem@davemloft.net>
To: pdurrant@amazon.com
From: David Miller <davem@davemloft.net>
In-Reply-To: <20191217133218.27085-2-pdurrant@amazon.com>
References: <20191217133218.27085-1-pdurrant@amazon.com>
 <20191217133218.27085-2-pdurrant@amazon.com>
X-Mailer: Mew version 6.8 on Emacs 26.1
Mime-Version: 1.0
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.12
 (shards.monkeyblade.net [149.20.54.216]);
 Tue, 17 Dec 2019 23:03:49 -0800 (PST)
Subject: Re: [Xen-devel] [PATCH net-next 1/3] xen-netback: move
 netback_probe() and netback_remove() to the end...
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
Cc: xen-devel@lists.xenproject.org, wei.liu@kernel.org, paul@xen.org,
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RnJvbTogUGF1bCBEdXJyYW50IDxwZHVycmFudEBhbWF6b24uY29tPgpEYXRlOiBUdWUsIDE3IERl
YyAyMDE5IDEzOjMyOjE2ICswMDAwCgo+IC4uLm9mIHhlbmJ1cy5jCj4gCj4gVGhpcyBpcyBhIGNv
c21ldGljIGZ1bmN0aW9uIHJlLW9yZGVyaW5nIHRvIHJlZHVjZSBjaHVybiBpbiBhIHN1YnNlcXVl
bnQKPiBwYXRjaC4gU29tZSBzdHlsZSBmaXgtdXAgd2FzIGRvbmUgdG8gbWFrZSBjaGVja3BhdGNo
LnBsIGhhcHBpZXIuCj4gCj4gTm8gZnVuY3Rpb25hbCBjaGFuZ2UuCj4gCj4gU2lnbmVkLW9mZi1i
eTogUGF1bCBEdXJyYW50IDxwZHVycmFudEBhbWF6b24uY29tPgoKQXBwbGllZC4KCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5n
IGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJv
amVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
