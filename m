Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 44E52E2A4
	for <lists+xen-devel@lfdr.de>; Mon, 29 Apr 2019 14:30:44 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hL5OB-0005zt-Vq; Mon, 29 Apr 2019 12:28:07 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=C3NY=S7=citrix.com=prvs=015693d2f=ross.lagerwall@srs-us1.protection.inumbo.net>)
 id 1hL5OA-0005zi-Db
 for xen-devel@lists.xen.org; Mon, 29 Apr 2019 12:28:06 +0000
X-Inumbo-ID: 3c89497c-6a7a-11e9-843c-bc764e045a96
Received: from SMTP03.CITRIX.COM (unknown [162.221.156.55])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 3c89497c-6a7a-11e9-843c-bc764e045a96;
 Mon, 29 Apr 2019 12:28:05 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,409,1549929600"; d="scan'208";a="84632917"
To: Pawel Wieczorkiewicz <wipawel@amazon.de>, <xen-devel@lists.xen.org>
References: <20190408083224.104802-1-wipawel@amazon.de>
From: Ross Lagerwall <ross.lagerwall@citrix.com>
Message-ID: <4c3c4926-4d11-b27b-d106-f86e1bcb0ecb@citrix.com>
Date: Mon, 29 Apr 2019 13:27:30 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <20190408083224.104802-1-wipawel@amazon.de>
Content-Language: en-US
Subject: Re: [Xen-devel] [livepatch-build-tools 1/4] livepatch-gcc: Allow
 toolchain command with versions
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
Cc: mpohlack@amazon.de, konrad.wilk@oracle.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gNC84LzE5IDk6MzIgQU0sIFBhd2VsIFdpZWN6b3JraWV3aWN6IHdyb3RlOgo+IFhlbiBidWls
ZCBzeXN0ZW0gbWF5IGVuZm9yY2UgcGFydGljdWxhciBnY2MgdmVyc2lvbiAoZS5nLiBnY2M3Miku
Cj4gTWFrZSBzdXJlIHRoZSBsaXZlcGF0Y2gtZ2NjIHNjcmlwdCBhY2NlcHRzIGFsbCBpbnB1dCB0
b29sY2hhaW4gZ2NjCj4gY29tbWFuZHMgd2l0aCBvciB3aXRob3V0IHZlcnNpb24gc3BlY2lmaWVk
Lgo+IAo+IFNpZ25lZC1vZmYtYnk6IFBhd2VsIFdpZWN6b3JraWV3aWN6IDx3aXBhd2VsQGFtYXpv
bi5kZT4KPiBSZXZpZXdlZC1ieTogTWFydGluIE1hemVpbiA8YW1hemVpbkBhbWF6b24uZGU+Cj4g
UmV2aWV3ZWQtYnk6IEJqb2VybiBEb2ViZWwgPGRvZWJlbEBhbWF6b24uZGU+ClJldmlld2VkLWJ5
OiBSb3NzIExhZ2Vyd2FsbCA8cm9zcy5sYWdlcndhbGxAY2l0cml4LmNvbT4KCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxp
c3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVj
dC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
