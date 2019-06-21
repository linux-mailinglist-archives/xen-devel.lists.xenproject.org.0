Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 00ED84E3B1
	for <lists+xen-devel@lfdr.de>; Fri, 21 Jun 2019 11:37:35 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1heFwJ-0007Qu-Gk; Fri, 21 Jun 2019 09:34:35 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=jygh=UU=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1heFwI-0007Qn-6D
 for xen-devel@lists.xenproject.org; Fri, 21 Jun 2019 09:34:34 +0000
X-Inumbo-ID: c458886a-9407-11e9-a87e-a35682db457d
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c458886a-9407-11e9-a87e-a35682db457d;
 Fri, 21 Jun 2019 09:34:29 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Fri, 21 Jun 2019 03:34:27 -0600
Message-Id: <5D0CA49E020000780023A024@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.1 
Date: Fri, 21 Jun 2019 03:34:22 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "Andrew Cooper" <andrew.cooper3@citrix.com>
References: <1560975087-25632-1-git-send-email-andrew.cooper3@citrix.com>
 <1560975087-25632-5-git-send-email-andrew.cooper3@citrix.com>
In-Reply-To: <1560975087-25632-5-git-send-email-andrew.cooper3@citrix.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: Re: [Xen-devel] [PATCH 4/4] xen/link: Misc cleanup
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

ID4+PiBPbiAxOS4wNi4xOSBhdCAyMjoxMSwgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+IHdy
b3RlOgo+ICogRHJvcCAuZ251Lndhcm5pbmcuICBYZW4sIG5vdCBiZWluZyBhIGxpYnJhcnksIGhh
cyBubyBuZWVkIGZvcgo+ICAgIF9fYXR0cmlidXRlX18oKF9fd2FybmluZ19fKCJzdHIiKSkpIGFu
ZCBpc24ndCBsaWFibGUgdG8gZXZlciBnYWluIHN1Y2gKPiAgICBhbm5vdGF0aW9ucyBmb3IgbGlu
ayB0aW1lIHdhcm5pbmdzLgo+ICAqIEFkanVzdCB0aGUgaW5kZW50YXRpb24gb2YgdGhlIHN0YXJ0
IG9mIEFSTSdzIC5yb2RhdGEgc2VjdGlvbi4KPiAgKiBEaXNjYXJkIC5kaXNjYXJkIG9uIEFSTS4K
PiAKPiBTaWduZWQtb2ZmLWJ5OiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXgu
Y29tPgoKeDg2OgpBY2tlZC1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgoKSmFu
CgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1k
ZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8v
bGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
