Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DCBE4EBC1
	for <lists+xen-devel@lfdr.de>; Fri, 21 Jun 2019 17:18:55 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1heLGZ-00051s-CE; Fri, 21 Jun 2019 15:15:51 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=jygh=UU=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1heLGX-00051n-UQ
 for xen-devel@lists.xenproject.org; Fri, 21 Jun 2019 15:15:49 +0000
X-Inumbo-ID: 72ce1f44-9437-11e9-8980-bc764e045a96
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 72ce1f44-9437-11e9-8980-bc764e045a96;
 Fri, 21 Jun 2019 15:15:48 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Fri, 21 Jun 2019 09:15:47 -0600
Message-Id: <5D0CF49F020000780023A3B6@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.1 
Date: Fri, 21 Jun 2019 09:15:43 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "Tamas K Lengyel" <tamas@tklengyel.com>
References: <1560434447-14363-1-git-send-email-rcojocaru@bitdefender.com>
 <CABfawhnyFohstOVKZT6+AA4kLDXUaQ2WpKtfB4v+tzU3TEhGaw@mail.gmail.com>
In-Reply-To: <CABfawhnyFohstOVKZT6+AA4kLDXUaQ2WpKtfB4v+tzU3TEhGaw@mail.gmail.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: Re: [Xen-devel] [PATCH RESEND] MAINTAINERS: hand over vm_event
 maintainership
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
Cc: Petre Pircalabu <ppircalabu@bitdefender.com>,
 Stefano Stabellini <sstabellini@kernel.org>, WeiLiu <wl@xen.org>,
 Razvan Cojocaru <rcojocaru@bitdefender.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>, aisaila@bitdefender.com,
 xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Pj4+IE9uIDEzLjA2LjE5IGF0IDE3OjExLCA8dGFtYXNAdGtsZW5neWVsLmNvbT4gd3JvdGU6Cj4g
T24gVGh1LCBKdW4gMTMsIDIwMTkgYXQgODowMSBBTSBSYXp2YW4gQ29qb2NhcnUKPiA8cmNvam9j
YXJ1QGJpdGRlZmVuZGVyLmNvbT4gd3JvdGU6Cj4+Cj4+IFJlbW92ZSBteXNlbGYgYXMgdm1fZXZl
bnQgbWFpbnRhbmVyLCBhZGQgQWxleGFuZHJ1IGFuZCBQZXRyZSBhcwo+PiBCaXRkZWZlbmRlciB2
bV9ldmVudCBtYWludGFpbmVycy4KPj4KPj4gU2lnbmVkLW9mZi1ieTogUmF6dmFuIENvam9jYXJ1
IDxyY29qb2NhcnVAYml0ZGVmZW5kZXIuY29tPgo+IAo+IEFja2VkLWJ5OiBUYW1hcyBLIExlbmd5
ZWwgPHRhbWFzQHRrbGVuZ3llbC5jb20+CgpJJ2xsIHRha2UgdGhlIGxpYmVydHkgYW5kIGFwcGx5
IHRoaXMgdG8gdGhlIHJldmlzZWQgKGRlc2lnbmF0ZWQgcmV2aWV3ZXIpCmFkZGl0aW9ucy4KCkph
bgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4t
ZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczov
L2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
