Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FBD6BDA49
	for <lists+xen-devel@lfdr.de>; Wed, 25 Sep 2019 10:53:59 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iD30n-0000X1-B2; Wed, 25 Sep 2019 08:51:01 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=8RKo=XU=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iD30m-0000Wu-2y
 for xen-devel@lists.xenproject.org; Wed, 25 Sep 2019 08:51:00 +0000
X-Inumbo-ID: 96f32cb2-df71-11e9-962c-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by localhost (Halon) with ESMTPS
 id 96f32cb2-df71-11e9-962c-12813bfff9fa;
 Wed, 25 Sep 2019 08:50:57 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 42ED3AE16;
 Wed, 25 Sep 2019 08:50:56 +0000 (UTC)
To: Paul Durrant <Paul.Durrant@citrix.com>
References: <20190918104113.3294-1-paul.durrant@citrix.com>
 <013c45a9490e413cb97abb02cef960bc@AMSPEX02CL03.citrite.net>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <dcfdf2ab-8c64-ee63-637f-b0517087e8b5@suse.com>
Date: Wed, 25 Sep 2019 10:50:56 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <013c45a9490e413cb97abb02cef960bc@AMSPEX02CL03.citrite.net>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v13 0/4] add per-domain IOMMU control
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
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 KonradRzeszutek Wilk <konrad.wilk@oracle.com>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>, David Scott <dave@recoil.org>,
 "Tim \(Xen.org\)" <tim@xen.org>, George Dunlap <George.Dunlap@citrix.com>,
 Tamas K Lengyel <tamas@tklengyel.com>, Ian Jackson <Ian.Jackson@citrix.com>,
 Anthony Perard <anthony.perard@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjUuMDkuMjAxOSAxMDo0MCwgUGF1bCBEdXJyYW50IHdyb3RlOgo+IFBpbmc/IEkgZG9uJ3Qg
dGhpbmsgdGhpcyBzZXJpZXMgaXMgYXdhaXRpbmcgYW55IG1vcmUgYWNrcy4KCkkgZGlkIGVudW1l
cmF0ZSB0aGUgb3RoZXIgZGF5IG9uIGlyYyB3aGF0IGlzIHN0aWxsIG1pc3NpbmcgYWNjb3JkaW5n
CnRvIG15IHJlY29yZHMuIFdvdWxkIHlvdSBtaW5kIHBvaW50aW5nIG1lIGF0IGEgbGlieGwgbWFp
bnRhaW5lciBhY2sKZm9yIHBhdGNoIDE/IEkgdGhpbmsgSSd2ZSBtYW5hZ2VkIHRvIHNwb3QgdGhl
IG1pc3Npbmcgb25lIGZvciBwYXRjaCAzLAp3aGljaCBodW5nIG9mZiBhICJSRVBPU1QiIHRocmVh
ZC4gQW5kIEkgcmVhbGl6ZSBJIHdhcyB3cm9uZ2x5IGxvb2tpbmcKZm9yIGEgdG9vbCBzdGFjayBt
YWludGFpbmVyIGFjayBmb3IgcGF0Y2ggNCwgd2hlbiBhIGxpYnhsIG9uZSBpcwpzdWZmaWNpZW50
IGFuZCBhbHJlYWR5IHRoZXJlLgoKSmFuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVs
