Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D82B2654E
	for <lists+xen-devel@lfdr.de>; Wed, 22 May 2019 16:00:39 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hTRkR-0002Q0-AY; Wed, 22 May 2019 13:57:39 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=3DNt=TW=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hTRkP-0002Pu-RA
 for xen-devel@lists.xenproject.org; Wed, 22 May 2019 13:57:37 +0000
X-Inumbo-ID: 8df8d5aa-7c99-11e9-8980-bc764e045a96
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 8df8d5aa-7c99-11e9-8980-bc764e045a96;
 Wed, 22 May 2019 13:57:36 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Wed, 22 May 2019 07:57:36 -0600
Message-Id: <5CE5554D0200007800231628@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.0 
Date: Wed, 22 May 2019 07:57:33 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: <aisaila@bitdefender.com>
References: <20190520125454.14805-1-aisaila@bitdefender.com>
 <20190520125454.14805-2-aisaila@bitdefender.com>
 <5CE51CBD0200007800231438@prv1-mh.provo.novell.com>
 <608cae57-7a7a-6502-9c9a-439aa0b88f25@bitdefender.com>
 <5CE54FD30200007800231603@prv1-mh.provo.novell.com>
 <b2619cfc-1ee1-c495-40e2-2652b24ad78c@bitdefender.com>
In-Reply-To: <b2619cfc-1ee1-c495-40e2-2652b24ad78c@bitdefender.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: Re: [Xen-devel] [PATCH v4 2/2] x86/emulate: Send vm_event from
 emulate
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
Cc: Tamas K Lengyel <tamas@tklengyel.com>, Wei Liu <wei.liu2@citrix.com>,
 Razvan Cojocaru <rcojocaru@bitdefender.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Paul Durrant <paul.durrant@citrix.com>,
 xen-devel <xen-devel@lists.xenproject.org>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Pj4+IE9uIDIyLjA1LjE5IGF0IDE1OjUwLCA8YWlzYWlsYUBiaXRkZWZlbmRlci5jb20+IHdyb3Rl
Ogo+IElzbid0IGl0IHNhZmVyIHRvIG1vdmUgdGhlIGh2bWVtdWxfc2VuZF92bV9ldmVudCgpIGZv
cm0gCj4gaHZtZW11bF9pbnNuX2ZldGNoKCkgdG8gX19odm1lbXVsX3JlYWQoKT8KClBvc3NpYmx5
IC0gSSBjYW4ndCB0ZWxsIHdoZXRoZXIgdGhhdCdsbCBmaXQgYWxsIHlvdXIgbmVlZHMuIEkgYWxz
bwpkb24ndCByZWNhbGwgd2hldGhlciB0aGlzIHdhcyBwcm9wb3NlZCBiZWZvcmUgYW5kIHRoZXJl
CndlcmUgcmVhc29ucyBzcGVha2luZyBhZ2FpbnN0IGRvaW5nIHNvLgoKSmFuCgoKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5n
IGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJv
amVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
