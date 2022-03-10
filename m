Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 34A914D5026
	for <lists+xen-devel@lfdr.de>; Thu, 10 Mar 2022 18:24:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.288539.489313 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nSMW2-0007Qb-8B; Thu, 10 Mar 2022 17:23:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 288539.489313; Thu, 10 Mar 2022 17:23:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nSMW2-0007OS-4E; Thu, 10 Mar 2022 17:23:54 +0000
Received: by outflank-mailman (input) for mailman id 288539;
 Thu, 10 Mar 2022 17:23:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UgV8=TV=amazon.de=prvs=06149a43a=doebel@srs-se1.protection.inumbo.net>)
 id 1nSMW0-0007FA-MH
 for xen-devel@lists.xenproject.org; Thu, 10 Mar 2022 17:23:52 +0000
Received: from smtp-fw-80006.amazon.com (smtp-fw-80006.amazon.com
 [99.78.197.217]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d9662771-a096-11ec-853a-5f4723681683;
 Thu, 10 Mar 2022 18:23:51 +0100 (CET)
Received: from pdx4-co-svc-p1-lb2-vlan3.amazon.com (HELO
 email-inbound-relay-pdx-2c-9ec26c6c.us-west-2.amazon.com) ([10.25.36.214])
 by smtp-border-fw-80006.pdx80.corp.amazon.com with ESMTP;
 10 Mar 2022 17:23:25 +0000
Received: from EX13D03EUC002.ant.amazon.com
 (pdx1-ws-svc-p6-lb9-vlan2.pdx.amazon.com [10.236.137.194])
 by email-inbound-relay-pdx-2c-9ec26c6c.us-west-2.amazon.com (Postfix) with
 ESMTPS id E7BC241D5A; Thu, 10 Mar 2022 17:23:21 +0000 (UTC)
Received: from [192.168.12.40] (10.43.164.135) by EX13D03EUC002.ant.amazon.com
 (10.43.164.60) with Microsoft SMTP Server (TLS) id 15.0.1497.32;
 Thu, 10 Mar 2022 17:23:20 +0000
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
X-Inumbo-ID: d9662771-a096-11ec-853a-5f4723681683
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.de; i=@amazon.de; q=dns/txt; s=amazon201209;
  t=1646933032; x=1678469032;
  h=message-id:date:mime-version:to:cc:references:from:
   in-reply-to:content-transfer-encoding:subject;
  bh=4J05hkN6PUyYitnjc70uysTJgw/K2IYClOWPuN9u/Rs=;
  b=E5v1PfqoLAitYrYnbLvtswQjb3hGAmejsT+i0jO+wyTXU5i8+Cyif0Hf
   fXVZIdY/GKSwhnjme6VhkYaG4sXdl4AN/4yM00rMlXQyIN5vMRz/drgsU
   q2Mz03VXXS5qa2m5Bm7pNvUL3yKarE1yFQRXyFsDcsps3BaGSej2JRtzi
   I=;
X-IronPort-AV: E=Sophos;i="5.90,171,1643673600"; 
   d="scan'208";a="69705549"
Subject: Re: [PATCH 2/3] livepatch: add extra efi/ objects to be ignored
Message-ID: <7f8c3908-67c6-fd6d-a8c6-8f86562625d6@amazon.de>
Date: Thu, 10 Mar 2022 18:23:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.6.2
Content-Language: en-US
To: Roger Pau Monne <roger.pau@citrix.com>, <xen-devel@lists.xenproject.org>
CC: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, Ross Lagerwall
	<ross.lagerwall@citrix.com>
References: <20220310150834.98815-1-roger.pau@citrix.com>
 <20220310150834.98815-3-roger.pau@citrix.com>
From: "Doebel, Bjoern" <doebel@amazon.de>
In-Reply-To: <20220310150834.98815-3-roger.pau@citrix.com>
X-Originating-IP: [10.43.164.135]
X-ClientProxiedBy: EX13D53EUC001.ant.amazon.com (10.43.164.183) To
 EX13D03EUC002.ant.amazon.com (10.43.164.60)
Precedence: Bulk
Content-Type: text/plain; charset="utf-8"; format="flowed"
Content-Transfer-Encoding: base64

CgpPbiAxMC4wMy4yMiAxNjowOCwgUm9nZXIgUGF1IE1vbm5lIHdyb3RlOgo+IENBVVRJT046IFRo
aXMgZW1haWwgb3JpZ2luYXRlZCBmcm9tIG91dHNpZGUgb2YgdGhlIG9yZ2FuaXphdGlvbi4gRG8g
bm90IGNsaWNrIGxpbmtzIG9yIG9wZW4gYXR0YWNobWVudHMgdW5sZXNzIHlvdSBjYW4gY29uZmly
bSB0aGUgc2VuZGVyIGFuZCBrbm93IHRoZSBjb250ZW50IGlzIHNhZmUuCj4gCj4gCj4gCj4gVGhl
IGNvbnRlbnRzIG9mIHRoaXMgb2JqZWN0cyBpcyBpbml0IG9ubHksIGFuZCBjYW5ub3QgYmUgcGF0
Y2hlZC4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0
cml4LmNvbT4KPiAtLS0KPiAgIGxpdmVwYXRjaC1nY2MgfCAyICsrCj4gICAxIGZpbGUgY2hhbmdl
ZCwgMiBpbnNlcnRpb25zKCspCj4gCj4gZGlmZiAtLWdpdCBhL2xpdmVwYXRjaC1nY2MgYi9saXZl
cGF0Y2gtZ2NjCj4gaW5kZXggZmU3ODJlMC4uYjBiOWNlNCAxMDA3NTUKPiAtLS0gYS9saXZlcGF0
Y2gtZ2NjCj4gKysrIGIvbGl2ZXBhdGNoLWdjYwo+IEBAIC02Niw2ICs2Niw4IEBAIGVsaWYgW1sg
IiRUT09MQ0hBSU5DTUQiID1+ICRPQkpDT1BZX1JFIF1dIDsgdGhlbgo+ICAgICAgICAgICB2ZXJz
aW9uLm98XAo+ICAgICAgICAgICBkZWJ1Zy5vfFwKPiAgICAgICAgICAgY2hlY2sub3xcCj4gKyAg
ICAgICAgYm9vdC5vfFwKPiArICAgICAgICAqLmluaXQub3xcCj4gICAgICAgICAgIC4qLm8pCj4g
ICAgICAgICAgICAgICA7Owo+ICAgICAgICAgICAqLm8pCj4gLS0KPiAyLjM0LjEKPiAKClJldmll
d2VkLWJ5OiBCam9lcm4gRG9lYmVsIDxkb2ViZWxAYW1hem9uLmRlPgoKCgpBbWF6b24gRGV2ZWxv
cG1lbnQgQ2VudGVyIEdlcm1hbnkgR21iSApLcmF1c2Vuc3RyLiAzOAoxMDExNyBCZXJsaW4KR2Vz
Y2hhZWZ0c2Z1ZWhydW5nOiBDaHJpc3RpYW4gU2NobGFlZ2VyLCBKb25hdGhhbiBXZWlzcwpFaW5n
ZXRyYWdlbiBhbSBBbXRzZ2VyaWNodCBDaGFybG90dGVuYnVyZyB1bnRlciBIUkIgMTQ5MTczIEIK
U2l0ejogQmVybGluClVzdC1JRDogREUgMjg5IDIzNyA4NzkKCgo=


