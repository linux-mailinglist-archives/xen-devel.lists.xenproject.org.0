Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F2C242A7A
	for <lists+xen-devel@lfdr.de>; Wed, 12 Jun 2019 17:13:23 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hb4tp-0003A4-HD; Wed, 12 Jun 2019 15:10:53 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=7kto=UL=hygon.cn=puwen@srs-us1.protection.inumbo.net>)
 id 1hb4tn-00039z-BQ
 for xen-devel@lists.xenproject.org; Wed, 12 Jun 2019 15:10:51 +0000
X-Inumbo-ID: 3f5b07c6-8d24-11e9-b435-bb10e8ba4130
Received: from spam2.hygon.cn (unknown [110.188.70.11])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 3f5b07c6-8d24-11e9-b435-bb10e8ba4130;
 Wed, 12 Jun 2019 15:10:45 +0000 (UTC)
Received: from MK-FE.hygon.cn ([172.23.18.61])
 by spam2.hygon.cn with ESMTP id x5CFACUh067440;
 Wed, 12 Jun 2019 23:10:12 +0800 (GMT-8)
 (envelope-from puwen@hygon.cn)
Received: from cncheex01.Hygon.cn ([172.23.18.10])
 by MK-FE.hygon.cn with ESMTP id x5CFA8t9059425;
 Wed, 12 Jun 2019 23:10:08 +0800 (GMT-8)
 (envelope-from puwen@hygon.cn)
Received: from [192.168.1.193] (172.23.18.44) by cncheex01.Hygon.cn
 (172.23.18.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1466.3; Wed, 12 Jun
 2019 23:10:12 +0800
From: Pu Wen <puwen@hygon.cn>
To: Andrew Cooper <andrew.cooper3@citrix.com>, <JBeulich@suse.com>
References: <cover.1554382869.git.puwen@hygon.cn>
 <201906070115.x571Fd9j014046@spam1.hygon.cn>
Message-ID: <1f85709e-ebec-5372-aac4-d567f51a9427@hygon.cn>
Date: Wed, 12 Jun 2019 23:10:06 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <201906070115.x571Fd9j014046@spam1.hygon.cn>
Content-Language: en-US
X-Originating-IP: [172.23.18.44]
X-ClientProxiedBy: cncheex01.Hygon.cn (172.23.18.10) To cncheex01.Hygon.cn
 (172.23.18.10)
X-MAIL: spam2.hygon.cn x5CFACUh067440
X-DNSRBL: 
Subject: Re: [Xen-devel] [PATCH v5 00/15] Add support for Hygon Dhyana
 Family 18h processor
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
Cc: xen-devel@lists.xenproject.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjAxOS82LzcgMDozMSwgQW5kcmV3IENvb3BlciB3cm90ZToKPiBJJ3ZlIHJlYmFzZWQgdGhl
IHBhdGNoZXMgb3ZlciBteSBDUFVJRCB3b3JrLCBhbmQgcHVzaGVkIHRoZSBvbmVzIHdoaWNoCj4g
c3RpbGwgYXBwbHkgY2xlYW5seSB0byBzdGFnaW5nLsKgIEhvd2V2ZXIsIHNvbWUgZG9uJ3QgYXBw
bHkgY2xlYW5seSBhbnkKPiBtb3JlLCBzbyBJIGxlZnQgdGhvc2UgYWxvbmUuCj4KPiBQbGVhc2Ug
Y291bGQgeW91IGNoZWNrIHRoZSBjdXJyZW50IHN0YWdpbmcgYnVpbGQgKGFuZCBpbiBwYXJ0aWN1
bGFyLAo+IHRoYXQgSSBkaWRuJ3QgYWNjaWRlbnRhbGx5IGJyZWFrIGFueXRoaW5nIHdpdGggdGhl
IHJlYmFzZSksIGFuZCByZWJhc2UKPiB0aGUgcmVtYWluZGVyIG9mIHRoZSBzZXJpZXMgb250byBz
dGFnaW5nLgoKSSByZWJhc2VkIHRoZSBwYXRjaGVzIHg4Ni9hY3BpIGFuZCB4ODYvcHYgb3ZlciAw
Y2QwNzQxNCAieDg2L2NwdToKUmVudW1iZXIgWDg2X1ZFTkRPUl8qIHRvIGZvcm0gYSBiaXRtYXAi
LCBhbmQgc2VudCB0aGVtIG91dCB3aXRoIHZlcnNpb24KdjYuIEkgZHJvcHBlZCB0aGUgcGF0Y2gg
eDg2L2lvbW11IGZvciBIeWdvbiBiZWNhdXNlIGl0J3Mgbm8gbmVlZGVkIGFueQptb3JlIHNpbmNl
IHRoZSBjb21taXQgMWIzY2M4MDAgIng4Ni9JT01NVTogaW50cm9kdWNlIGluaXQtb3BzIHN0cnVj
dHVyZSIKcmVtb3ZlZCB0aGUgdmVuZG9yIGNoZWNrLgoKSSBzdGlsbCBob2xkIEphbidzIEFja2Vk
LWJ5IHRhZ3MgaG93ZXZlciB0aGUgY29kZSBpcyBjaGFuZ2VkLiBBcmUgdGhlCnRhZ3Mgc3RpbGwg
dmFsaWQ/CgpUaHguCgotLQpSZWdhcmRzLApQdSBXZW4KCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1h
bi9saXN0aW5mby94ZW4tZGV2ZWw=
