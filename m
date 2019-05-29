Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EBF5C2DC6C
	for <lists+xen-devel@lfdr.de>; Wed, 29 May 2019 14:06:30 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hVxJG-00057c-Er; Wed, 29 May 2019 12:03:58 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=9SAg=T5=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hVxJF-00057X-Lb
 for xen-devel@lists.xenproject.org; Wed, 29 May 2019 12:03:57 +0000
X-Inumbo-ID: d52147b4-8209-11e9-94dc-b71abfe459d8
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d52147b4-8209-11e9-94dc-b71abfe459d8;
 Wed, 29 May 2019 12:03:56 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Wed, 29 May 2019 06:03:53 -0600
Message-Id: <5CEE7527020000780023368F@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.1 
Date: Wed, 29 May 2019 06:03:51 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "Volodymyr Babchuk" <volodymyr_babchuk@epam.com>
References: <20190529113534.23213-1-volodymyr_babchuk@epam.com>
 <5CEE710F0200007800233646@prv1-mh.provo.novell.com>
 <874l5d8oly.fsf@epam.com>
In-Reply-To: <874l5d8oly.fsf@epam.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: Re: [Xen-devel] [PATCH] get_maintainer: Improve patch recognition
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, WeiLiu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>, xypron.glpk@gmx.de, joe@perches.com,
 xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Pj4+IE9uIDI5LjA1LjE5IGF0IDEzOjUyLCA8Vm9sb2R5bXlyX0JhYmNodWtAZXBhbS5jb20+IHdy
b3RlOgo+IEphbiBCZXVsaWNoIHdyaXRlczoKPj4+Pj4gT24gMjkuMDUuMTkgYXQgMTM6MzUsIDxW
b2xvZHlteXJfQmFiY2h1a0BlcGFtLmNvbT4gd3JvdGU6Cj4+PiBGcm9tOiBKb2UgUGVyY2hlcyA8
am9lQHBlcmNoZXMuY29tPgo+Pj4gCj4+PiBGcm9tOiBKb2UgUGVyY2hlcyA8am9lQHBlcmNoZXMu
Y29tPgo+Pj4gCj4+PiBUaGVyZSBhcmUgbW9kZSBjaGFuZ2UgYW5kIHJlbmFtZSBvbmx5IHBhdGNo
ZXMgdGhhdCBhcmUgdW5yZWNvZ25pemVkCj4+PiBieSB0aGUgZ2V0X21haW50YWluZXIucGwgc2Ny
aXB0Lgo+Pj4gCj4+PiBSZWNvZ25pemUgdGhlbS4KPj4+Cj4gCj4gIFsgVXBzdHJlYW0gY29tbWl0
IDA0NTVjNzQ3ODhmZDVhYWQ0Mzk5ZjAwZTNmYmJiN2U4NzQ1MGNhNTggXQoKcy9VcHN0cmVhbS9M
aW51eC8sIGJ1dCB0aGFua3MuCgpKYW4KCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMu
eGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL3hlbi1kZXZlbA==
