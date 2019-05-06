Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DF75914B15
	for <lists+xen-devel@lfdr.de>; Mon,  6 May 2019 15:42:00 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hNdqC-0004cu-8i; Mon, 06 May 2019 13:39:36 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=+Gz0=TG=citrix.com=prvs=022e014eb=roger.pau@srs-us1.protection.inumbo.net>)
 id 1hNdqA-0004cp-Va
 for xen-devel@lists.xenproject.org; Mon, 06 May 2019 13:39:35 +0000
X-Inumbo-ID: 5b52677c-7004-11e9-9aaf-33b27049e037
Received: from SMTP.EU.CITRIX.COM (unknown [185.25.65.24])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 5b52677c-7004-11e9-9aaf-33b27049e037;
 Mon, 06 May 2019 13:39:23 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,438,1549929600"; d="scan'208";a="89670856"
Date: Mon, 6 May 2019 15:39:13 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <JBeulich@suse.com>
Message-ID: <20190506133913.br7gp6fvt75j6y77@Air-de-Roger>
References: <5CC6DD090200007800229E80@prv1-mh.provo.novell.com>
 <5CC6DF520200007800229EC2@prv1-mh.provo.novell.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <5CC6DF520200007800229EC2@prv1-mh.provo.novell.com>
User-Agent: NeoMutt/20180716
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH 7/9] x86/IRQ: drop redundant cpumask_empty()
 from move_masked_irq()
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
Cc: xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wei.liu2@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gTW9uLCBBcHIgMjksIDIwMTkgYXQgMDU6MjY6MTBBTSAtMDYwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gVGhlIHN1YnNlcXVlbnQgY3B1bWFza19pbnRlcnNlY3RzKCkgY292ZXJzIHRoZSAiZW1w
dHkiIGNhc2UgcXVpdGUgZmluZS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBKYW4gQmV1bGljaCA8amJl
dWxpY2hAc3VzZS5jb20+CgpSZXZpZXdlZC1ieTogUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1
QGNpdHJpeC5jb20+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9y
ZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
