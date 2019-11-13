Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A65FFB1B0
	for <lists+xen-devel@lfdr.de>; Wed, 13 Nov 2019 14:48:59 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iUsz7-00026X-8P; Wed, 13 Nov 2019 13:47:01 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=SDLk=ZF=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iUsz5-00026L-J5
 for xen-devel@lists.xenproject.org; Wed, 13 Nov 2019 13:46:59 +0000
X-Inumbo-ID: 0f60d1d9-061c-11ea-a230-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 0f60d1d9-061c-11ea-a230-12813bfff9fa;
 Wed, 13 Nov 2019 13:46:58 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 96481AF55;
 Wed, 13 Nov 2019 13:46:57 +0000 (UTC)
To: Boris Ostrovsky <boris.ostrovsky@oracle.com>
References: <a83f42ad-c380-c07f-7d22-7f19107db5d5@suse.com>
 <07358162-1d03-63f5-ad14-95a2e0e23018@suse.com>
 <cd81b75f-bf43-9094-7236-8efa4da27da1@oracle.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <4577bd33-e4b5-9869-3760-c55471382f01@suse.com>
Date: Wed, 13 Nov 2019 14:47:13 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <cd81b75f-bf43-9094-7236-8efa4da27da1@oracle.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 3/3] xen/mcelog: also allow building for
 32-bit kernels
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
Cc: Juergen Gross <jgross@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 lkml <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTMuMTEuMjAxOSAwMToxNSwgQm9yaXMgT3N0cm92c2t5IHdyb3RlOgo+IE9uIDExLzExLzE5
IDk6NDYgQU0sIEphbiBCZXVsaWNoIHdyb3RlOgo+PiBUaGVyZSdzIG5vIGFwcGFyZW50IHJlYXNv
biB3aHkgaXQgY2FuIGJlIHVzZWQgb24gNjQtYml0IG9ubHkuCj4+Cj4+IFNpZ25lZC1vZmYtYnk6
IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KPj4KPj4gLS0tIGEvZHJpdmVycy94ZW4v
S2NvbmZpZwo+PiArKysgYi9kcml2ZXJzL3hlbi9LY29uZmlnCj4+IEBAIC0yODUsNyArMjg1LDcg
QEAgY29uZmlnIFhFTl9BQ1BJX1BST0NFU1NPUgo+PiAgCj4+ICBjb25maWcgWEVOX01DRV9MT0cK
Pj4gIAlib29sICJYZW4gcGxhdGZvcm0gbWNlbG9nIgo+PiAtCWRlcGVuZHMgb24gWEVOX0RPTTAg
JiYgWDg2XzY0ICYmIFg4Nl9NQ0UKPj4gKwlkZXBlbmRzIG9uIFhFTl9ET00wICYmIFg4NiAmJiBY
ODZfTUNFCj4gCj4gQ2FuIHdlIGhhdmUgWDg2X01DRSB3aXRob3V0IFg4Nj8KCkkgZG9uJ3QgdGhp
bmsgd2UgY2FuLiBJcyB0aGlzIGEgcmVxdWVzdCB0byBkcm9wIHRoZSBtaWRkbGUKb3BlcmFuZCBh
bHRvZ2V0aGVyPwoKSmFuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRl
dmVs
