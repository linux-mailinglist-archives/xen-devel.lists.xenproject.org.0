Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C0B03B5DBB
	for <lists+xen-devel@lfdr.de>; Mon, 28 Jun 2021 14:12:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.147832.272892 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lxq7U-0001jS-7k; Mon, 28 Jun 2021 12:12:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 147832.272892; Mon, 28 Jun 2021 12:12:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lxq7U-0001gw-4V; Mon, 28 Jun 2021 12:12:08 +0000
Received: by outflank-mailman (input) for mailman id 147832;
 Mon, 28 Jun 2021 12:09:31 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZQAJ=LW=amazon.co.uk=prvs=8067dfff9=mahgul@srs-us1.protection.inumbo.net>)
 id 1lxq4x-0000uL-BL
 for xen-devel@lists.xenproject.org; Mon, 28 Jun 2021 12:09:31 +0000
Received: from smtp-fw-9102.amazon.com (unknown [207.171.184.29])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a4230fb2-0ee5-4251-9ce9-d63950e31891;
 Mon, 28 Jun 2021 12:09:30 +0000 (UTC)
Received: from pdx4-co-svc-p1-lb2-vlan3.amazon.com (HELO
 email-inbound-relay-1e-28209b7b.us-east-1.amazon.com) ([10.25.36.214])
 by smtp-border-fw-9102.sea19.amazon.com with ESMTP; 28 Jun 2021 12:09:23 +0000
Received: from EX13D38EUB004.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan3.iad.amazon.com [10.40.159.166])
 by email-inbound-relay-1e-28209b7b.us-east-1.amazon.com (Postfix) with ESMTPS
 id 1D796E16D4
 for <xen-devel@lists.xenproject.org>; Mon, 28 Jun 2021 12:09:22 +0000 (UTC)
Received: from EX13D38EUB003.ant.amazon.com (10.43.166.191) by
 EX13D38EUB004.ant.amazon.com (10.43.166.140) with Microsoft SMTP Server (TLS)
 id 15.0.1497.18; Mon, 28 Jun 2021 12:09:21 +0000
Received: from EX13D38EUB003.ant.amazon.com ([10.43.166.191]) by
 EX13D38EUB003.ant.amazon.com ([10.43.166.191]) with mapi id 15.00.1497.018;
 Mon, 28 Jun 2021 12:09:21 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: a4230fb2-0ee5-4251-9ce9-d63950e31891
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.co.uk; i=@amazon.co.uk; q=dns/txt;
  s=amazon201209; t=1624882171; x=1656418171;
  h=from:to:subject:date:message-id:content-id:
   content-transfer-encoding:mime-version;
  bh=SSEfeS39KWHTHP1X/9TARKyVee/ZR54Rjkov5ecbNGw=;
  b=V24lE1St0TjzrZL7VJQD5UV9q0OfswB8eqdtloyb2XvbQGtSD+jxca0O
   0N56aw4Y7Nc7Fgf0Y5OyAHSp1Ea6IAKpt8JYnrYpapJrdhPOecb9AW39L
   X2Zw43mBdyOJRf3t30xlIWQcI/zEimFLMxQEDJvum0BLSQclFxJyR1Mso
   Q=;
X-IronPort-AV: E=Sophos;i="5.83,305,1616457600"; 
   d="scan'208";a="142486884"
From: "Gul, Mahircan" <mahgul@amazon.co.uk>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Notes from Xen live-update design session
Thread-Topic: Notes from Xen live-update design session
Thread-Index: AQHXbBZtI6tBiV5T9UGRiPDOgClkqg==
Date: Mon, 28 Jun 2021 12:09:21 +0000
Message-ID: <7D9E37A5-3BC4-41E6-8E6F-738CA1CC6305@amazon.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.43.164.215]
Content-Type: text/plain; charset="utf-8"
Content-ID: <38D1345A5B498A4A8F3F062972FEEB92@amazon.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Precedence: Bulk

SGkgYWxsLA0KDQojIyBNaW51dGVzIGZyb20gWGVuIGxpdmUtdXBkYXRlIGRlc2lnbiBzZXNzaW9u
LCAyOHRoIE1heQ0KDQotIFRoZSByZWNvcmRzIGFyZSBhcHBsaWVkIGluIFhlbjIgYXMgaWYgYSBo
eXBlcmNhbGwgd2FzIGV4ZWN1dGVkLiBXZSBleGVjdXRlIHRoZSBoeXBlcmNhbGwgb24gYmVoYWxm
IG9mIHRoZSBkb21haW4sIHJhdGhlciB0aGFuIHRoZSBkb21haW4gKGkuZS4gZG9tMCkgY2FsbGlu
ZyB0aGUgaHlwZXJjYWxsLg0KICAgICAgLSAiSG93IGV4dGVuc2libGUgaXMgdGhhdCBhcHByb2Fj
aD8gVGhpbmdzIHdpbGwgY2hhbmdlLiIgQXMgbG9uZyBhcyB0aGVyZSdzIGNvbXBhdGliaWxpdHkg
d2l0aCBmdXR1cmUgZXh0ZW5zaW9ucywgdGhpcyBpcyBmaW5lLg0KLSBPbmUgcHJvYmxlbSB3aXRo
IGNyZWF0aW5nIGRvbWFpbnMgYW5kIHZDUFVzIGlzOiB0aGVyZSdsbCBiZSBhIHNldF9jcHUgaHlw
ZXJjYWxsIGJldHdlZW4gZG9tYWluX2NyZWF0ZSBhbmQgdmNwdV9jcmVhdGUuIFBsYW4gaXMgdG8g
ZW5mb3JjZSB0aGlzIGFzIGEgaHlwZXJjYWxsIGRlcGVuZGVuY3kuDQotIFJlZHVjaW5nIHRoZSBk
b3dudGltZSB0byBzZXZlcmFsIGh1bmRyZWQgbWlsbGlzZWNvbmRzIHdpdGggYSBiaXQgb2YgY2Fy
ZS4NCi0gUG90ZW50aWFsIGlzc3VlcyB0aGF0IGNhbiBhcmlzZSBkdWUgdG8gZGlmZmVyZW5jZXMg
YmV0d2VlbiBJbnRlbCBhbmQgQU1EOg0KICAgICAgLSBEaWZmZXJlbmNlcyBiZXR3ZWVuIFZNQ1Mg
YW5kIFNWTS4NCiAgICAgIC0gRVBUIGFuZCBNUFQuIERlcGVuZGluZyBvbiBob3cgcDJtIGlzIGhh
bmRsZWQuIEhvd2V2ZXIsIHdlIHRyYW5zZmVyIGl0IGFzIGlzIChwb2ludGVyIHRvIHRoZSB0b3Ap
IGFzIHRoZSBwYWdlcyBtdXN0IGJlIHByZXNlbnQgKGRldmljZXMgY2Fubm90IGJlIHF1aWVzY2Vk
KS4gU28gdGhpcyBtdXN0IGJlIG9rYXkuDQogICAgICAtIE9uIEFNRCwgcDJtIGhhcyBtZXRhZGF0
YSBpbiBkaWZmZXJlbnQgcGxhY2VzLg0KICAgICAgLSBGb3Igc2hhZG93IG1lbW9yeSwgcGFzcyBw
Mm0ganVzdCBhcyBIVk0gZ3Vlc3RzLg0KLSBBcyBhIGZpcnN0IHN0ZXAsIGl0J3Mgb2theSB0byBw
dXNoIHRoZSByZWNvcmRzIHRvIHVwc3RyZWFtIGV2ZW4gaWYgdGhleSB3b24ndCBiZSB1c2VkIGlt
bWVkaWF0ZWx5LiBXZSBrbm93IHRoZSBlbmQgZ29hbC4gVGhpcyBhbGlnbnMgd2l0aCBvdXIgaWRl
YSBvZiBwdXNoaW5nIHRoZSBzcGVjIGFuZCB0aGUgcmVjb3JkIGhlYWRlcnMgZmlyc3QuDQotIEFz
IGEgZm9sbG93IHVwLCB1cHN0cmVhbSB0aGUgcGF0Y2hlcyB0byBiZSBhYmxlIHRvIExVIGRvbTAg
b25seS4NCi0gSU9NTVUgbWFza2luZyAod2hhdCB3ZSBkbykgaXMgdGhlIGNvcnJlY3Qgd2F5IHRv
IHByb2NlZWQuDQotIEFzIGxvbmcgYXMgaW50ZXJydXB0cyBhcmUgbWFza2VkIGFzIHBlbmRpbmcg
b24gdGhlIGV2ZW50IGNoYW5uZWwsIGl0IHNob3VsZCBiZSBva2F5IG9uIHRoZSByZXN0b3JlIHNp
ZGUgZXZlbiBpZiB0aGUgSVJRIHdhcyBpbi1mbGlnaHQgaW4gWGVuMS4NCi0gQSBzZXBhcmF0ZSBt
b250aGx5IGNhbGwgb24gWGVuIExVIChzZXBhcmF0ZSB0aGFuIHRoZSBtb250aGx5IGNhbGwpLg0K
DQotLQ0KTWFoaXINCg0K

