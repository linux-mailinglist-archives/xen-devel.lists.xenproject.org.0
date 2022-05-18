Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8120752B8E3
	for <lists+xen-devel@lfdr.de>; Wed, 18 May 2022 13:34:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.332034.555675 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nrHwX-0005Nq-UQ; Wed, 18 May 2022 11:34:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 332034.555675; Wed, 18 May 2022 11:34:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nrHwX-0005Kv-RY; Wed, 18 May 2022 11:34:17 +0000
Received: by outflank-mailman (input) for mailman id 332034;
 Wed, 18 May 2022 11:34:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=p3vY=V2=citrix.com=prvs=130e47117=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1nrHwW-0005Kp-0s
 for xen-devel@lists.xenproject.org; Wed, 18 May 2022 11:34:16 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 70ed8d22-d69e-11ec-bd2c-47488cf2e6aa;
 Wed, 18 May 2022 13:34:14 +0200 (CEST)
Received: from mail-bn8nam12lp2173.outbound.protection.outlook.com (HELO
 NAM12-BN8-obe.outbound.protection.outlook.com) ([104.47.55.173])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 18 May 2022 07:34:09 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by CY4PR03MB3078.namprd03.prod.outlook.com (2603:10b6:910:5b::37)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.13; Wed, 18 May
 2022 11:34:08 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::ac51:a410:14d4:de37]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::ac51:a410:14d4:de37%6]) with mapi id 15.20.5250.018; Wed, 18 May 2022
 11:34:07 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: 70ed8d22-d69e-11ec-bd2c-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1652873654;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=Kr8WqZ1XN6M2i3dml6O22rlME34Dkh62jD+RCBBQlVw=;
  b=LcWTtADQ7o96+oBKQb+hNpKBwnd51qRx7SPhJVtlGytNCpg39xyqcCip
   o4a+GrWV+hmAEsnAwLOcXKnhDHiGHw8jdSG1dvCQEprVPqjRSNKYoeyRx
   yTq+pJIPoEhuEd5sxy/CMnQeP/vssM5VeGBo9G7PqqO1sp/M3xwU9tDLt
   A=;
X-IronPort-RemoteIP: 104.47.55.173
X-IronPort-MID: 70958368
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:hObT8q71slpheg8QMfs+ZgxRtFPGchMFZxGqfqrLsTDasY5as4F+v
 jZNWG+Ab62DZDb2eNpzOYS0808PsZGHmtBhS1c5+3tkHi5G8cbLO4+Ufxz6V8+wwmwvb67FA
 +E2MISowBUcFyeEzvuVGuG96yE6j8lkf5KkYAL+EnkZqTRMFWFw0HqPp8Zj2tQy2YXgU1vU0
 T/Pi5a31GGNimYc3l08s8pvmDs31BglkGpF1rCWTakjUG72zxH5PrpGTU2CByKQrr1vNvy7X
 47+IISRpQs1yfuP5uSNyd4XemVSKlLb0JPnZnB+A8BOiTAazsA+PzpS2FPxpi67hh3Q9+2dx
 umhurTtVwINYfePqt8UVjZCGi1aYKNA57nIdC3XXcy7lyUqclPK6tA3VgQcG91d/ex6R2ZT6
 fYfNTYBKAiZgP67y666Te8qgdk/KM7sP8UUvXQIITPxVK56B8ycBfiXo4YHh1/chegXdRraT
 +MfZSBic1LrZBpXN01MIJk/gP2plj/0dDgwRFe9+vJmvjiIklwZPL7FIeTZS8CVa9dprGnb+
 Fvf2VTjIxsdHYnKodaC2jf27gPVpgvfRYkbUpOx8PVnhFmO7mUJDVsdUl7Tiem0jAuyVsxSL
 2QQ+zEytu4i+UqzVN7/Uhak5nmesXYht8F4FuQ77ESHzPrS6gPAXGwcFGceM5ohqdM8QiEs2
 hmRhdT1CDdzsbqTD3WA6rOTqjD0Mi8QRYMfWRI5ocI+y4GLiOkOYtjnF76PzIbdYgXJJAzN
IronPort-HdrOrdr: A9a23:iWTtta0z3UUrH3XoJ5FAwAqjBetxeYIsimQD101hICG9Lfb0qy
 n+pp4mPEHP4wr5AEtQ4uxpOMG7MBDhHQYc2/hcAV7QZnidhILOFvAs0WKC+UysJ8SazIJgPM
 hbAs9D4bHLbGSSyPyKmDVQcOxQjuVvkprY49s2pk0FJW4FV0gj1XYBNu/xKDwVeOAyP+tcKH
 Pq3Lsjm9PPQxQqR/X+IkNAc/nIptXNmp6jSwUBHQQb5A6Hii7twKLmEjCDty1uEw9n8PMHyy
 zoggb57qKsv7WQ0RnHzVLe6JxQhZ/I1sZDPsqRkcIYQw+cyTpAJb4RGYFqjgpF5N1H22xa1+
 UkZC1Qefib3kmhO11dZyGdgjUIngxes0MKgmXo/EcL6faJOA7STfAxxL6xOyGplXbJ9rtHod
 129nPcuJxNARzamiPho9DOShFxj0Kx5WEviOgJkhVkIMMjgZJq3PoiFXluYd499ePBmfIaOf
 grCNuZ6OddcFucYXyctm5zwMa0VnB2GhudWEANtsGczjATxRlCvgEl7d1amm1F+IM2SpFC6e
 iBOqN0lKtWRstTaa5mHu8OTca+F2SISxPRN2CZJ0jhCcg8Sjnwgo+y5K9w6PCheZQOwpd3kJ
 PdUElAvWp3YE7qAd3m5uw9zvkMehTIYd3A8LAv23EigMyMeFPCC1zxdHk+1829vv4YHsrXH/
 6uJZM+OY6XEVfT
X-IronPort-AV: E=Sophos;i="5.91,234,1647316800"; 
   d="scan'208";a="70958368"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PqgWM9yu8Q2GqfHRd3FXEnksF5LkqRWHEV6jC/1ZvbHNa9kf/FluyQdqKSLN+himCfG1JVGhSl47inL8J282WB9fvHUtPNRHWBCPNq9fqCPy40cPnmUxwY6aEeuZVLicjCZa2Zovfs5SlTS99/CXJWV8eSmEvuQsEnuj5fOLH8xYlFvL2qT26hYmhuW6JLhlhbEA44grpZ6hn26AVY1FDGB5n+uI6pwX24iHTei1TgBuXAWRFshhXhf8o08dlIDK04G8mYsJknPrVgxRixTF9rg0PRXf7H+jrE/obBn7TTNjh65W3qk1wTiY37BTkVE4QwCG8Q2FsWCBIDzkuUMgbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Kr8WqZ1XN6M2i3dml6O22rlME34Dkh62jD+RCBBQlVw=;
 b=XGWGqR77YubtC1wQOIWFGdikz4bUcEYdnYhXNlQgl2V3amQLv5kc4n945zyPVYFxPrxMnGGAr2gcSqMiS2NqBkRUiCTqxHk3C2R3tr5ZIMb8q+xQWs6EPOGyM6F4vi5X2F+i7n+xCtOWpRYpqMFZeQKIokOPgg+IRRVcN0kkygw/VqgkP8IdZJ3Iru13m58aVEyIZgVHzAqh1Pl/ejeXQzCB68ylocUr3Z1Q2SgIaObjD6llvDAFrIDprEN1GDq3IdBZNurYSwcWfWvO2pMKH94hVXjxyB5KfHxyGMUSrlM6bh1AKq/KbF+GUbehVvqDm6AhZuDp5gSejN7Vv2Z9vw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Kr8WqZ1XN6M2i3dml6O22rlME34Dkh62jD+RCBBQlVw=;
 b=eTreDGU4g/KPnJSv0g8PQ5srDjhqhCjMr8Rfi910dhMXRT4/bHUP1Aa4pf+xke8Q/N+5RlwoB1z4A9lquD1Mw6D78/liIjJ0Ob5/iT2+zvAiTqSO2BGD3Vqfnn1ivEUGmRudVFI/BuNLh1cQOiAJZ7/Q/1AIJ4AYGe7ST5HnFR8=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Luca Fancellu <Luca.Fancellu@arm.com>
CC: Edwin Torok <edvin.torok@citrix.com>, Xen-devel
	<xen-devel@lists.xenproject.org>, Christian Lindig
	<christian.lindig@citrix.com>
Subject: Re: [PATCH 2/2] tools/ocaml: Fix stubs the introduction of
 domain_create.cpupool_id
Thread-Topic: [PATCH 2/2] tools/ocaml: Fix stubs the introduction of
 domain_create.cpupool_id
Thread-Index: AQHYaiYkF2Fwt7YEY0iLRkyR5qKZ760kZYcAgAAF1QCAAATZgIAAEdyA
Date: Wed, 18 May 2022 11:34:07 +0000
Message-ID: <c82af9e0-db35-53b5-f00f-64bcb20c1791@citrix.com>
References: <20220517194113.2574-1-andrew.cooper3@citrix.com>
 <20220517194113.2574-3-andrew.cooper3@citrix.com>
 <987CBBF2-D9EE-4644-96DF-5DA89D96921A@citrix.com>
 <db69a8a8-d6a1-b94b-388e-b0c851b1d9c8@citrix.com>
 <107B2C8E-59DF-4D7B-A6E1-E136E702AB96@arm.com>
In-Reply-To: <107B2C8E-59DF-4D7B-A6E1-E136E702AB96@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 19063613-34f3-4f75-26f2-08da38c25224
x-ms-traffictypediagnostic: CY4PR03MB3078:EE_
x-microsoft-antispam-prvs:
 <CY4PR03MB3078AD0060B6500C2B85FD26BAD19@CY4PR03MB3078.namprd03.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 g8kryGNRi6YYoIHaSznDnnK9KgnM9rtd9rbiTYsnBMm/wwhwM9oLRMUNEibiBe7sFr54E0il0v+5qkpz4GkT99Jzf6VgDmwr1NGy6DIxBurCz2oXbnbLWf+3vF4c15Bd+MMM8J+YxiaZQ01pfs/1UvoV9GKDx6cz6Y3xeVI51rEaDtOMESI/i88xLdqIgOYvS+TwVY+lyXUV2/dzq7/phkAw7437J64rQsD5oJ8L+B92x6UPaloSEfcJXswEiCPi+EY8/uNJIOm/iJJECNd1tTAc4dU/i9FoMJzUM7yJL8V/7fqPk1MM0dm+FzIwyQaAFv0PgPlBZARn5m9RBrB3RK0S316326e4ZR5pPSttkDeO3IUcWlQtjfbPZ+ZfrcrGn5yxW88QI9E6eQlmIxT3WWexsdE4owHsWNICylOrfNdTAagKq5lkCeGzvlA5DR96O/DKUhTlkMqwXJDzacVk2VIG1F//4C7RBtq3GLPJO6vlzhmkq4NFrRZCZ8MiNZmIrFQ8mgNA7rkahByU5i7lavE3zspwtHUpMD7cSmm2plThgWeZvxUkHc538QYDHV6KnhaGZEqftgPcB1QJyo7bqYdwHo9Xz52zRoeZrDoqOiPCrsji04sMeknNClN8p7u5ZhQNOG/yGmN7kOEhuNqcHUmdALKgWPSS4BPugAEru3ItKm/cCenrbVUckOY37oHiIuFVY/mMwWWp3wQk8AOfANXRuPBWkucHcAFBgiIdontT9kGqPvGmsLMmL0PuoCQENZZqKnkXHt/DmLUWHOqddQ==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(8676002)(91956017)(4326008)(186003)(316002)(54906003)(66446008)(66556008)(64756008)(6512007)(66476007)(2616005)(66946007)(76116006)(31686004)(6916009)(36756003)(26005)(55236004)(53546011)(107886003)(71200400001)(6486002)(31696002)(6506007)(38070700005)(38100700002)(8936002)(5660300002)(86362001)(122000001)(2906002)(508600001)(82960400001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?RVBuc3J4eDdUQnhCaWRvdDVneEx2elhxdTFZWnA4LzBKeVJzNzlrYy91UW40?=
 =?utf-8?B?MytBZnBRV1JSbE1OcjM2c25kYnFzNWZMM2g4NTVlZit2bEVVUGFoWFF0ekRi?=
 =?utf-8?B?RzdaQ0VxTDMwZ3NYU3cxdUFzUlZEczJSUDhuTHFmbU9lL0dtTXduQ0ljT01i?=
 =?utf-8?B?RXdXdG8zbGVQS01IcWVOMHo1RTBIdHFob2x3a3htV3hYOEZ6cXZScStoTHJq?=
 =?utf-8?B?OU41SzBSSElidXc1a3JxRnZNR0E5UkxPeGIzSjJSR2dXOGQ3d1B6bjRIMGxh?=
 =?utf-8?B?TGFVQVV0ZndCQ01leEsyR1Y2ODJ6Y1hoWUs4TzFMQ3lwNS9tNTIwazNVdkpZ?=
 =?utf-8?B?VHBnUlREbkxGbnVBM1JReFlYY0RVRjQvK2RrY3VzNnNvNW1NYnRMQkJLc3p2?=
 =?utf-8?B?MG5rZmpzcGNTbEN3b3dJUzRGTUhUa2Y0VkNiRnMvRHl3bTZna0FBUjdiLzVy?=
 =?utf-8?B?SFBvSHdYMjBzYVozYXJoVXVxQ29qdGVVYU1nMERJTzB3ZWMwMkx5UjdsbDFF?=
 =?utf-8?B?NTZkV3JVSldCK2FHd21JUkZDVjRMMXNQSkx6OWk4NjhSTmtBYlJnS1lUVDAv?=
 =?utf-8?B?eXlMcjhkZlVxRzdKOU5pNzFnbUpPaEx6R3VzNm41TU1wTVFscXJ3ODVuUmQ3?=
 =?utf-8?B?aVd0VkswZjBWdC9ma205SG8yL1h0Y2x2K1Vja0k5QkprRVJWYkUvYVJGYnBP?=
 =?utf-8?B?enNHbUVvRkFmbUZpdWI4VTFTcXo0dXhjbHJOdVlaU3hPS21hU0RlK0VSQ1E3?=
 =?utf-8?B?cU1YQVdOVTB5KzBpWDk5YTZPRW9UWWJaLzJGWUtOK1NPWjE5TFRSWS9HaXpU?=
 =?utf-8?B?RmxoTExweFZSVmpPTVBtWGNOekZtbEJVOEM2Tm96WnExc24vK3NOR2dSV1VW?=
 =?utf-8?B?cGYxcHpGRmlBNHZIM0Qxekt6d1kvTDBNVmhlY3lXTy8rbVcrOGxKcThkdnhy?=
 =?utf-8?B?S3F5MU0ySHJDcERVNVBSaWZHRk9NZmlnR2hsMFdRc1FWb3VTdG0yN2NJR0RD?=
 =?utf-8?B?dEJZTEV3OWphdWo1Ris0SWNuLzF1K0U4Z0l0dWt5cE95WjJEdnFRRTEreUc5?=
 =?utf-8?B?cU5GdytMRjFIQldRSFJ6bnppUGNkTjBZZ2ZQeUdVOGZNM25MdURjY3pJZFM5?=
 =?utf-8?B?R1YweGViQ0pxNGs2TkQ2SkZ1WWdIR2FvQkFPVitSdUVLZDlEZ3B4akJ3Szlq?=
 =?utf-8?B?WExaTWtTYzJFcGZ5MFVRZG1CaHp6K3B0Y3pzcEROWEYvdDBzdllVam54L2FE?=
 =?utf-8?B?TXRVd04yalUyR0QzQVBWbGlZSXBOS3ZjWFhrNzZMNlV4U0trdUNlSWROdldz?=
 =?utf-8?B?VXM2NERmbWpxV25EQWMwS1M0MWxCM1oyaTVPQi85dnByRGlwWVJDUWxySkFV?=
 =?utf-8?B?MkZySnJXRnZvZmpjV25BS1R1amc0RGdxNERLZnk0aDNVOXhIV0w0SzNDQnVs?=
 =?utf-8?B?UHhvZ3ZvUExUdlVIcnovZVdhMzJKMmlQa3FoY09wMzg1eDlEeHlvRGsxTUF4?=
 =?utf-8?B?b3pQczFUM1NKenR4Um1JUlZQOE9NeDJ5YWpnd2h4YVF1Z2VGdHRCRktTNFd5?=
 =?utf-8?B?ODhPWmV4K1FYb2R6Qnh5SmY2UWJsbW1qUXVtNjRYQVN0cEhidHp1R1BYbEJs?=
 =?utf-8?B?Z2VkK3pzYjZjeXBGZ2hQMHgyMFYycVhPZjRFcTVXNTQwVWx4ajZ4Qzk2NHdW?=
 =?utf-8?B?cFhNbUhUZmx6Q1dLbGtNaThiaytuMUZGSEo3OXNnTWpWdzR3VnF5aDFkYUda?=
 =?utf-8?B?SmczWWhTb0V1V2FLY0dnZEg3R0M3eEZiSGE4alpoa3c3Z3NGVXBkbG5aNm4z?=
 =?utf-8?B?NlV4Z1NrbzdtNnZaZFYwWmplT2YxbnRqRVdWZDluT2JwWWUzaUlPazNRNEVE?=
 =?utf-8?B?SXRBN0wvQlF1NXNycVZnWlRyZDZFR1pIN0xVendVdXBjUVRJaUhUSWtkM1A3?=
 =?utf-8?B?RzRyeWVybjVKZzlhVFFDN1Q4b0NqOVFrU2JiejV5VFQ4RlMyNDJQSjBwa2Zv?=
 =?utf-8?B?dmFZWTgwMEtHTElSb2R3M1FhNWNwQVVGZEFhMS9aMDdNMHpWTGRRbHpXY2Ir?=
 =?utf-8?B?ME1odmtsUzkvekxoRnRYMjhISEpsREd3M0wxMTVycmxJM20yKzlyRDZwekpu?=
 =?utf-8?B?TzlDeExCcHMxYUQ0dElCbjlhc0ZaUTVEQU0yRDluYU16bGR1SWJGTjl3YnFt?=
 =?utf-8?B?NDVZL1JUb3M1L1VwSUxKZ1ZwdCtIY3lDR0VJWmNrUVZ0NHhDbmNXNzkySGNO?=
 =?utf-8?B?cHlwdWVaMnoybFB6WEd1SEdGUG1GbTVabFBaaSs5aTZ1dTNZN01ZOVJqSVJG?=
 =?utf-8?B?eWdPaHBDTmlpQXQ4ZTQzWjBBWmZnY3hsUEo4Y0FHMHJwdkZCUkpuUT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <3F1A8348B8B5E049A1E435928D9D5C86@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 19063613-34f3-4f75-26f2-08da38c25224
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 May 2022 11:34:07.8789
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fznrF875zVSTHwRu0IhTWV1m2klPdOPwBS+xRwZ+VWtoc8/+g6/1woY3qSYR9Z6CBqHb21yKvxD84WIpYnKYXKGzSo/PrllhoD8IlPWeGAk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR03MB3078

T24gMTgvMDUvMjAyMiAxMTozMCwgTHVjYSBGYW5jZWxsdSB3cm90ZToNCj4+IE9uIDE4IE1heSAy
MDIyLCBhdCAxMToxMiwgQW5kcmV3IENvb3BlciA8QW5kcmV3LkNvb3BlcjNAY2l0cml4LmNvbT4g
d3JvdGU6DQo+Pg0KPj4gT24gMTgvMDUvMjAyMiAxMDo1MSwgRWR3aW4gVG9yb2sgd3JvdGU6DQo+
Pj4+IGRpZmYgLS1naXQgYS90b29scy9vY2FtbC9saWJzL3hjL3hlbmN0cmwubWwgYi90b29scy9v
Y2FtbC9saWJzL3hjL3hlbmN0cmwubWwNCj4+Pj4gaW5kZXggNzUwMzAzMWQ4ZjYxLi44ZWFiNmY2
MGViMTQgMTAwNjQ0DQo+Pj4+IC0tLSBhL3Rvb2xzL29jYW1sL2xpYnMveGMveGVuY3RybC5tbA0K
Pj4+PiArKysgYi90b29scy9vY2FtbC9saWJzL3hjL3hlbmN0cmwubWwNCj4+Pj4gQEAgLTg1LDYg
Kzg1LDcgQEAgdHlwZSBkb21jdGxfY3JlYXRlX2NvbmZpZyA9DQo+Pj4+IAltYXhfZ3JhbnRfZnJh
bWVzOiBpbnQ7DQo+Pj4+IAltYXhfbWFwdHJhY2tfZnJhbWVzOiBpbnQ7DQo+Pj4+IAltYXhfZ3Jh
bnRfdmVyc2lvbjogaW50Ow0KPj4+PiArCWNwdXBvb2xfaWQ6IGludDMyOw0KPj4+IFdoYXQgYXJl
IHRoZSB2YWxpZCB2YWx1ZXMgZm9yIGEgQ1BVIHBvb2wgaWQsIGluIHBhcnRpY3VsYXIgd2hhdCB2
YWx1ZSBzaG91bGQgYmUgcGFzc2VkIGhlcmUgdG8gZ2V0IGJhY2sgdGhlIGJlaGF2aW91ciBwcmlv
ciB0byB0aGVzZSBjaGFuZ2VzIGluIFhlbj8NCj4+PiAoaS5lLiB3b3VsZCBpdCBiZSBjcHUgcG9v
bCBpZCAwIG9yIC0xIGlmIGNwdSBwb29scyBhcmVuJ3Qgb3RoZXJ3aXNlIGV4cGxpY2l0bHkgY29u
ZmlndXJlZCBvbiB0aGUgc3lzdGVtKQ0KPj4gY3B1cG9vbHMgYXJlIGEgbm9uLW9wdGlvbmFsIGNv
bnN0cnVjdCBpbiBYZW4uDQo+Pg0KPj4gQnkgZGVmYXVsdCwgb25lIGNwdXBvb2wgZXhpc3RzLCB3
aXRoIHRoZSBpZCAwLCB1c2luZyB0aGUgZGVmYXVsdA0KPj4gc2NoZWR1bGVyIGNvdmVyaW5nIGFs
bCBwQ1BVcywgYW5kIGRvbTAgaXMgY29uc3RydWN0ZWQgaW4gdGhpcyBjcHVwb29sLg0KPj4NCj4+
IFBhc3NpbmcgMCBoZXJlIGlzIHRoZSBiYWNrd2FyZHMgY29tcGF0aWJsZSBvcHRpb24uDQo+Pg0K
Pj4gQW5kIG9uIHRoYXQgbm90ZSwgTHVjYSwgeW91IG91Z2h0IHRvIHBhdGNoIHhsL2xpYnhsIHRv
IGFwcGx5IHRoZSBwb29sPQ0KPj4gc2V0dGluZyBkaXJlY3RseSBkdXJpbmcgZG9tYWluIGNyZWF0
ZSwgcmF0aGVyIHRoYW4gZGVwZW5kaW5nIG9uIGNwdXBvb2wNCj4+IDAgZXhpc3RpbmcgYW5kIG1v
dmluZyB0aGUgZG9tYWluIGxhdGVyLg0KPiBJcyBpdCBhbiBlbmhhbmNlbWVudCBvciBhIGJ1ZyBm
aXg/DQoNClRoaXMgaXNuJ3QgYSBiaW5hcnkgb3B0aW9uLg0KDQpZb3VyIHNlcmllcyBhZGRlZCBh
biBvcHRpbWlzYXRpb24gdG8gRE9NQ1RMX2NyZWF0ZWRvbWFpbiwgdGhlbiBkaWRuJ3QNCmFkanVz
dCBsaWJ4bCB0byB1c2UgdGhlIG9wdGltaXNhdGlvbiAod2hpY2ggd291bGQgaGF2ZSByZWR1Y2Vk
IHRoZQ0KbnVtYmVyIG9mIGh5cGVyY2FsbHMgdG8gY3JlYXRlIHRoZSBkb21haW4sIGFuZCByZWR1
Y2UgdGhlIG51bWJlciBvZg0KZHluYW1pYyBtZW1vcnkgYWxsb2NhdGlvbnMgaW4gdGhlIGh5cGVy
dmlzb3IuwqAgTWFyZ2luYWwsIGNlcnRhaW5seSwgYnV0DQpjbGVhcmx5IGEgbmljZS10by1oYXZl
KS4NCg0KVGhlcmVmb3JlLCB5b3UgY3JlYXRlZCB0ZWNobmljYWwgZGVidCwgd2hpY2ggaXMgb3B0
aW9uIDMuDQoNCkJ5IGRlZmF1bHQsIGFzIHRoZSBjb250cmlidXRvciwgeW91IGFyZSBleHBlY3Rl
ZCB0byBhZGRyZXNzIHRoZQ0KdGVjaG5pY2FsIGRlYnQsIGJlY2F1c2UgaXQgaXMgYW4gaW1wb3J0
YW50IGRpZmZlcmVuY2UgYmV0d2VlbiBoYWNraW5nIGENCmZlYXR1cmUgdXAgZm9yIHlvdXJzZWxm
LCBhbmQgaW50ZWdyYXRpbmcgdGhlIGZlYXR1cmUgbmljZWx5IGZvciBldmVyeW9uZS4NCg0KWW91
IGNhbiBvZiBjb3Vyc2UgbmVnb3RpYXRlIHdpdGggdGhlIHRvb2xzIG1haW50YWluZXIgdG8gc2Vl
IGlmIHRoZXkNCmNhcmUsIGFuZCByaWdodCBub3cgdGhhdCdzIGEgYml0IGRpZmZpY3VsdC7CoCBJ
dCdzIHF1aXRlIHBvc3NpYmxlIHRoYXQNCm5vb25lIG90aGVyIHRoYW4gbWUgY2FyZXMsIGFuZCBJ
J20gbm90IGxpYnhsIG1haW50YWluZXIuDQoNCkVpdGhlciB5b3UgbmVlZCB0byBwYXkgb2ZmIHRo
ZSB0ZWNobmljYWwgZGVidCwgb3Igc29tZW9uZSBlbHNlIHdpbGwgaGF2ZQ0KdG8uwqAgU29tZW9u
ZSBlbHNlIGlzIGdvaW5nIHRvIGhhdmUgdG8gc3RhcnQgd2l0aCBkaWdnaW5nIGludG8gc291cmNl
DQpoaXN0b3J5LCB3aGljaCBtZWFucyBpdCdzIG1vcmUgZXhwZW5zaXZlIHRoYW4geW91IGRvaW5n
IGl0IG5vdy4NCg0KQXQgYW4gYWJzb2x1dGUgbWluaW11bSwgeW91IG5lZWQgdG8gYmUgYXdhcmUg
b2Ygd2hlcmUvd2hlbiB5b3UgYXJlDQpjcmVhdGluZyB0ZWNobmljYWwgZGVidC4NCg0KPiAgRnJv
bSB3aGF0IEkga25vdywgcGxlYXNlIGNvcnJlY3QgbWUgaWYgSeKAmW0gd3JvbmcsIGNwdXBvb2ww
DQo+IElzIGFsd2F5cyBwcmVzZW50LCBzbyB0aGVyZSB3b27igJl0IGJlIHByb2JsZW0gb24gYXNz
dW1pbmcgaXRzIGV4aXN0ZW5jZQ0KDQpGcm9tIHdoYXQgSSBjYW4gc2VlLCB5b3VyIHNlcmllcyBo
YXMgcmVkdWNlZCB0aGUgbWFnaWMgaW52b2x2ZWQgd2l0aA0KY3B1cG9vbDAsIHdoaWNoIGlzIGdv
b2QuDQoNCkJ1dCB0aGUgZmFjdCB0aGF0IGl0IHN0aWxsIGhhcyBtYWdpYyBwcm9wZXJ0aWVzIGlz
IHN0aWxsIHRlY2huaWNhbCBkZWJ0DQp0aGF0IHNvbWVvbmUgaXMgZ29pbmcgdG8gaGF2ZSB0byBw
YXkgb2ZmIGV2ZW50dWFsbHkuDQoNCn5BbmRyZXcNCg==

