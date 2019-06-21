Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A1FF4E335
	for <lists+xen-devel@lfdr.de>; Fri, 21 Jun 2019 11:17:45 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1heFdP-0005JD-QR; Fri, 21 Jun 2019 09:15:03 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=jygh=UU=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1heFdP-0005J7-0w
 for xen-devel@lists.xenproject.org; Fri, 21 Jun 2019 09:15:03 +0000
X-Inumbo-ID: 09c60d8a-9405-11e9-a70e-a7b28037ec47
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 09c60d8a-9405-11e9-a70e-a7b28037ec47;
 Fri, 21 Jun 2019 09:14:57 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Fri, 21 Jun 2019 03:14:56 -0600
Message-Id: <5D0CA00F0200007800239FEA@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.1 
Date: Fri, 21 Jun 2019 03:14:55 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "Andrew Cooper" <andrew.cooper3@citrix.com>
References: <1560975087-25632-1-git-send-email-andrew.cooper3@citrix.com>
 <1560975087-25632-3-git-send-email-andrew.cooper3@citrix.com>
In-Reply-To: <1560975087-25632-3-git-send-email-andrew.cooper3@citrix.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: Re: [Xen-devel] [PATCH 2/4] xen/link: Link .data.schedulers and
 CONSTRUCTERS in more appropriate locations
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
Cc: xen-devel <xen-devel@lists.xenproject.org>,
 Julien Grall <julien.grall@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>, WeiLiu <wl@xen.org>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Pj4+IE9uIDE5LjA2LjE5IGF0IDIyOjExLCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gTmVpdGhlciBvZiB0aGVzZSBzaG91bGQgbGl2ZSBpbiAuZGF0YQo+IAo+ICAqIC5kYXRh
LnNjaGVkdWxlcnMgaXMgb25seSBldmVyIHJlYWQsIHNvIGlzIG1vdmVkIGludG8gLnJvZGF0YQoK
V2hpY2ggdGhlbiB3b3VsZCBiZXR0ZXIgYmUgLnJvZGF0YS5zY2hlZHVsZXJzLCB3b3VsZG4ndCBp
dD8KU2FtZSB3b3VsZCBhcHBhcmVudGx5IGdvIGZvciAuZGF0YS5wYXJhbS4KCkphbgoKCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFp
bGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhl
bnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
