Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6958A3DEA26
	for <lists+xen-devel@lfdr.de>; Tue,  3 Aug 2021 11:58:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.163350.299254 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mArBP-0000OL-JV; Tue, 03 Aug 2021 09:57:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 163350.299254; Tue, 03 Aug 2021 09:57:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mArBP-0000LW-F9; Tue, 03 Aug 2021 09:57:59 +0000
Received: by outflank-mailman (input) for mailman id 163350;
 Tue, 03 Aug 2021 09:57:58 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xZZ2=M2=arm.com=Bertrand.Marquis@srs-us1.protection.inumbo.net>)
 id 1mArBN-0000LQ-Uv
 for xen-devel@lists.xenproject.org; Tue, 03 Aug 2021 09:57:58 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:7e1a::626])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8def236c-17fa-4ffb-a007-5dc93af13fe8;
 Tue, 03 Aug 2021 09:57:55 +0000 (UTC)
Received: from DB6P192CA0004.EURP192.PROD.OUTLOOK.COM (2603:10a6:4:b8::14) by
 AM0PR08MB4932.eurprd08.prod.outlook.com (2603:10a6:208:162::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.15; Tue, 3 Aug
 2021 09:57:54 +0000
Received: from DB5EUR03FT053.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:b8:cafe::f4) by DB6P192CA0004.outlook.office365.com
 (2603:10a6:4:b8::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.18 via Frontend
 Transport; Tue, 3 Aug 2021 09:57:54 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT053.mail.protection.outlook.com (10.152.21.119) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4373.18 via Frontend Transport; Tue, 3 Aug 2021 09:57:54 +0000
Received: ("Tessian outbound 7b804b1d9bbf:v101");
 Tue, 03 Aug 2021 09:57:53 +0000
Received: from aa581bb14073.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 CB1C4DF6-E563-4177-9A64-AF9D3BF8A234.1; 
 Tue, 03 Aug 2021 09:57:47 +0000
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id aa581bb14073.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 03 Aug 2021 09:57:47 +0000
Received: from PAXPR08MB6446.eurprd08.prod.outlook.com (2603:10a6:102:12d::10)
 by PAXPR08MB6768.eurprd08.prod.outlook.com (2603:10a6:102:13c::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.21; Tue, 3 Aug
 2021 09:57:45 +0000
Received: from PAXPR08MB6446.eurprd08.prod.outlook.com
 ([fe80::3184:5465:27b6:f27d]) by PAXPR08MB6446.eurprd08.prod.outlook.com
 ([fe80::3184:5465:27b6:f27d%9]) with mapi id 15.20.4373.026; Tue, 3 Aug 2021
 09:57:45 +0000
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
X-Inumbo-ID: 8def236c-17fa-4ffb-a007-5dc93af13fe8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+nzahrXByzpGYbIMpYSOk+iXtYtRQynxLBch6t8F2ag=;
 b=ePBWExkUDV9qyHs2Apa88C98x4Hv4jRqTbW9PccDYf+KPkbAeXecYnHJZLK3iMc11eNk0Ps3SHoTrCF6C8Q7dXBev6fJhCBdaEGFKahoMtkykVzTq/90/iISxm0pgEaI3y1pHV84Qau1CtITigl6ySdcPaCli3c13Ne2cg9z1Xo=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: f73d070dfd558942
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AwWMbUJrZW66iNCjAF6O2Mh/Jgy86ulmyTG+hpJVBbO+BW4Uftnr81myUbULyZfcYkZZrGaEy6ZU6WSBFkjFYMq7BEuwn7makyScZtuIJ6sgxZ5w7Us1nmS3oLeuW+gSBqu3PqwxYvdIRZZ743jyeQNFM0EJ8LWDzwAGoVNfLqjVJq0c0C7FUXz4xcHZCeDHsPc+wWT3z8qg/DusHmqOoHFl6Lay3fmXCiRQCoLTO1N9t+FmkffG6sS7aW1EY4iaEhJenU7Nqjmp6LMo+zYXHmhizx/DiX6n3BY7KrN6FbAcGS2Hn0kBRkUQZrjOqfatQFncD2Wyaa8ovf85lpptMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+nzahrXByzpGYbIMpYSOk+iXtYtRQynxLBch6t8F2ag=;
 b=AkZGJXd3oI4aZ8mBfDgoaViAEmlrBux8BoXiQpR99qt+5X5ILXRh3plBCnmZBUGvM4nKOheTSh6kJipsBEb/arj4LWs5wBmexBcLVQJRnCI4b7GGJ30VOHGAE2jkuPKiqFdlGusoPFo0n803xSl8WpGIui6K4SzqDU/dsXhPGFL9qxzWpoTVEIu0nHkM1xf5kCCMQDG2oRv+m7xd/Vust2iMFgfQ9kAdYaO5LSu05tmD7IecheZJWyJZCew/Y9mhBtmSC4R3nRp2ofg06Hb2xoASrpdd3qzqU2LAc7YzwdN9Y5ti1sQ8J0BfWZl73k4hquzzx6rhAvPX5Q6EbT1Tjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+nzahrXByzpGYbIMpYSOk+iXtYtRQynxLBch6t8F2ag=;
 b=ePBWExkUDV9qyHs2Apa88C98x4Hv4jRqTbW9PccDYf+KPkbAeXecYnHJZLK3iMc11eNk0Ps3SHoTrCF6C8Q7dXBev6fJhCBdaEGFKahoMtkykVzTq/90/iISxm0pgEaI3y1pHV84Qau1CtITigl6ySdcPaCli3c13Ne2cg9z1Xo=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Julien Grall <julien@xen.org>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Stefano Stabellini
	<sstabellini@kernel.org>
Subject: Re: [RFC PATCH 3/4] xen/arm: Sanitize cpuinfo ID registers fields
Thread-Topic: [RFC PATCH 3/4] xen/arm: Sanitize cpuinfo ID registers fields
Thread-Index: AQHXbQmqqZ2dUoMblUy//wgHf+AX8qs/M8QAgAa+XICABCxbgIAXo3WA
Date: Tue, 3 Aug 2021 09:57:45 +0000
Message-ID: <51F735B0-A008-4A12-B53D-2CE3A88D9274@arm.com>
References: <cover.1624974370.git.bertrand.marquis@arm.com>
 <b9c86a28df2bddca095ae02511ced09585dce164.1624974370.git.bertrand.marquis@arm.com>
 <4014ca20-b3b6-cd39-9b26-d1dd8e9b568c@xen.org>
 <A8304A17-E59A-4C40-A9FA-6EF49B58AC54@arm.com>
 <144614cf-575c-9580-065e-31792e350359@xen.org>
In-Reply-To: <144614cf-575c-9580-065e-31792e350359@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3654.120.0.1.13)
Authentication-Results-Original: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 6abf6499-8dd7-4b1e-022f-08d9566529a7
x-ms-traffictypediagnostic: PAXPR08MB6768:|AM0PR08MB4932:
X-Microsoft-Antispam-PRVS:
	<AM0PR08MB4932D88BD60844DD828C9AC89DF09@AM0PR08MB4932.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:285;OLM:285;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 7Ne69aPQq/QKfEQZFPUK+8c64ZRHGm0w+HgnID2XPFk3urya0GiK92STXyOnjUfUAsZh3ZElo53uDVc/Y/7kjXJu3y8/iy4kQj4hH8l21jV8Bz3xR6dUZh+EtAXn6UKNhRUmd75vvCOLW11q7oBTmjP0aYxKg4taBAdVYhV45/89DofzpcW/xOxfy4AN5+Dllsr0jmOZkXMGuc9ZQ0DQzHHHGR6oZ5Ac7eYAAMc3YXBymrEwam8Bdhz5VzzvuFrGKR7ghTHpEF5MmSB9wXZP2vLA9M4SkgdqijSXCBD3qxvWJBZsJtS45h7czwe+l8mN06nKBreStCksRPrAkmiR70O3FdlR+PIG88MfaR+Thn8uwv1n2FrHjbuHAjLGTF2vAAFwILhcTdmjjwNJ7koZvPUObyY2RKEno5Zyof0AvmJNvT6Sv714ibl+x/aH3xX6483deH6g8TLvZt5ic+SqjlDH4sGko0DXKm9H3402JSKF3hqZ915vr5m87Y16Ggvvpg1ui7Ae8XvAYy5oxDKDUcoT6Wt5602DxZrANOYmY92JBl6RIi4mnqeJQKzR1n71c5UeXnrEj9ETcX+Ams6guy6UFmCIAhsZRBG+614RvvCXjcirRbhNhCJm2z9eetXPrWwh30p/VkR2QzuAOrCtlPEtvHedQCJgsI4SrjsHpudAI56peDVOrLA1pIdgoXTZFd/tjHUL1yfrNQNS5AgNwS//9T4lvklK/c+pRnnZWPEIbVH6i1GBSOlzrZPL8NYv
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB6446.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(376002)(346002)(366004)(396003)(136003)(76116006)(91956017)(36756003)(54906003)(8936002)(6512007)(6486002)(6506007)(53546011)(86362001)(66446008)(64756008)(122000001)(66556008)(66476007)(66946007)(478600001)(8676002)(316002)(2616005)(38100700002)(186003)(26005)(33656002)(38070700005)(5660300002)(6916009)(83380400001)(4326008)(71200400001)(2906002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?a2xOcytDZktGZ0REWHFVWFRsblRjb0prd0NZUmszekVhc2NEZHFGQlowNUtH?=
 =?utf-8?B?R1ZtWFVYMW9idlVyb1VqUE5LRXdBeXRqWU9MQkRlS3dtMG52alV5bmZuVzBX?=
 =?utf-8?B?WWhndG9yU1ZQUlNHNnlVOW9NRDVlTm1RUm51aWNUSmhWV2VIVytTd0NDMVdz?=
 =?utf-8?B?RFZBdjA3MndqNzBrTHJpUEFPeFpFQVhSaCtDWGdnR2lCL2txV3lNV1RNRHYw?=
 =?utf-8?B?eTU2QnRGUjBTZjlVdmhNWE5FVnNuSC9pUFRNNWNQL0djK0Z5a2pGcXdxUnFQ?=
 =?utf-8?B?WGF0MkVoNHllWnY2N1kzU1lVd3VoZnVqeDhhZUVTRWlsRkxmVEI0RlVDb0NI?=
 =?utf-8?B?VTlJMmtIVGZIL2s2elQ2aVRrZVJYem1Mall6SWhKMjE3MTFJdjhBV2lhOGdW?=
 =?utf-8?B?cjBBYVE4aFZCclV0ZG51S0oxekFxQVhFRmZQL2FnQ29CVGVZSFQrNmJ5alRl?=
 =?utf-8?B?RGRwNGl5YXpDaTJTZ3doR0NEQXJTa2hhUE81L0U5OER2NEVlSnk5dDdyWXpa?=
 =?utf-8?B?ZkczNDhibk43VzhaL2xaYmoyMXliOUdiWnlLNXoyV0oxSlFHV2dBS3hBcndo?=
 =?utf-8?B?RFNDcnN5WnhRS1A4VnRIRFBnbGE5VUtaOXd1RlNNZGQwMHZYdUtQMUUxK3BW?=
 =?utf-8?B?cmN5SENPVU9uZTZGVWxtUzNUWmtyNlQ0Y1hxN1NQbE9WdHo4c1A5UG1YYXRY?=
 =?utf-8?B?K05uWHVSWGhUczNlRHhEaktiRXhFejBZTEhna1Mvd0hCM2xpaEJ0RVVVNmFF?=
 =?utf-8?B?NzZXVUpPNzAxODh0UkJRSTdjRGdVZUdUUms5UmsvbXo1bDRSTkJoRnVqUXZh?=
 =?utf-8?B?dTgxV1c1U3FURHB4Sk1yR0p4T1FSVjZ1TEVMbjJrdm5FZzJPbWllWGNuMGhQ?=
 =?utf-8?B?NS82MXVoZGw5VDN2eHMwMmRpUENHQ3JSWTZWdlk1TmUzQlRsWTBNVEEwUFZP?=
 =?utf-8?B?c2hWNHZnVDlhSVdVVEVUVEd2T0tBaUxYN2ZyRGRFdytJR0w5T3paRng0NlIz?=
 =?utf-8?B?T254aVFZak10L2Y2UCttZjZ4TmZ2c1UxUS93YU1OTDNwMUd2dm5ycmJqNVBC?=
 =?utf-8?B?b3RCdlNWa0hYTy9HWVBvWGNIbE5Dc3ZsK2FIV1ZRTndqRGdjdDlOSXp3ZEZw?=
 =?utf-8?B?R2xkTGNaOC9iRlZmTjhSVWRpSTFPY2VPSjRnWUs2bi9MeTNGMEhjaU1SSFJp?=
 =?utf-8?B?aHdGR2xCQ1hNZjZQNndPVWQzZk1jRmRWY0prOEZER1MwclR6TW5DY2lMN3JJ?=
 =?utf-8?B?eElkR092WjVNQVgwSk9mcXhJMWhVWE9rd2dXUWZvS254eWp2M0luUjhBbkdS?=
 =?utf-8?B?aG1TdWJ5emhlZVJCeHVaeFQ5NXZ3Rk8yN2VjL2V6VGxZd3l6cFJaVlFTY2pL?=
 =?utf-8?B?OXd0cTNablUyZTZUSERnZlJtRWl1Q1BmOFdTd2Z3cGhzK0ZJeUU5N2RYVG9T?=
 =?utf-8?B?WmNEdUl3UDF2cHh0WGViMHNuR2N2V2Nrek0vcXRYdEVvUHA4R1FHOVFMWGZh?=
 =?utf-8?B?MVNPajRSRmlUSDJ6cjBEZGZ0ZjdMZGxPMnIwVUc2TU1TME5zdWFlejVsUHJS?=
 =?utf-8?B?RFpKcmVnRWxMUGxZQjhmaU1xSkpzWnlwVGNzRUovU3JCL2p5UjZ0UXhPanM0?=
 =?utf-8?B?MWFWa1ZxdUpKeDBEZS93MVdUNE9OT2p3SFpUbDd6KzZUYWVXbUlZeXJIQjFF?=
 =?utf-8?B?YkFLYXFXTmpveXBQWkExRGJjZUJjaHpBTEFTM0FFV1NMa3VmS0tOZEFGK3Js?=
 =?utf-8?Q?9njwUCZMFMrkGEqCeMokd5czEdsS8wZ84ks+KHU?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <AD891259A0B34A4491662EA919986A8C@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB6768
Original-Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT053.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	fae2af79-dd88-4934-3961-08d9566524b6
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	J2LPrIPT5F+03LqGrwlUxNBZoriOKNqswclH5qAgjL2KNOzlBpeEHLmbqPlodJmNQ90VHZy6kon3wa/yXrNkNcy2mojstLGBZNEdGm+oc4M+O1gCDK6CdQfADAt1f1ZDyma4hW0817Ur8V+bgCwWFq5iAatsGqjX2//yKhhTXS+VnOrpuYCJ8PTTkV6b4nLixA93CoBtlvq+dWqYLwBXbzHHgg8mH5p0lPWYYhFwN6Jye0TFdqHb1IgHpfei8bla3z/qvKEtknr/d+1ZaexJjrSCvm/g+tOVo5n3iAEb2aOByF9/DG0ntA42jA3HqegwZ15S4oD1gVaH3+KqmrNWPL/TICq2QUHm/1uSpEFSqL2VN0NGxQAdoiE/dXdVh4OZSIqJazWwoiTwubGqlVsbk3HQ72c99bUEvB38z7V+gTKdZX+95RLNQ7E+od8i0thLdfdLODiUTWwx1UKXlJyXrnPxZJxHeYDuvNNsvrcmmqNvP0PQ+J9P83Ki+Zo1RSI6ks6N5I8fm/HeXKybhFutq9GmOiZzqc2UwrUXrXfLAP269uw/PN3r2HtMPlMo932Xx1ZASQFxkeYoryJ/V1DzQH6IYDDi1SZnuUoZZGxw4tODif9B63pCJfbAaalzJenXy12x4zWY3Mh2V0j9GaumgagQg8GBXT5RONV/2Mbn0CicF5gCCheQ5er8ET7oGroHjzicKrKj9nlh9OGNMTfACw==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(46966006)(36840700001)(82310400003)(6862004)(83380400001)(186003)(47076005)(356005)(70206006)(2616005)(107886003)(54906003)(2906002)(316002)(36860700001)(70586007)(6486002)(33656002)(4326008)(6506007)(6512007)(86362001)(336012)(81166007)(26005)(36756003)(5660300002)(8936002)(508600001)(8676002)(53546011);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Aug 2021 09:57:54.0062
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6abf6499-8dd7-4b1e-022f-08d9566529a7
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT053.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB4932

SGkgSnVsaWVuLA0KDQo+IE9uIDE5IEp1bCAyMDIxLCBhdCAwOTo1OCwgSnVsaWVuIEdyYWxsIDxq
dWxpZW5AeGVuLm9yZz4gd3JvdGU6DQo+IA0KPiANCj4gDQo+IE9uIDE2LzA3LzIwMjEgMTg6MTQs
IEJlcnRyYW5kIE1hcnF1aXMgd3JvdGU6DQo+PiBIaSBKdWxpZW4NCj4gDQo+IEhpIEJlcnRyYW5k
LA0KPiANCj4+IFvigKZdDQo+Pj4+IA0KPj4+PiArDQo+Pj4+ICsgICAgaWYgKCBvbGRfcmVnICE9
IG5ld19yZWcgKQ0KPj4+PiArICAgICAgICBwcmludGsoWEVOTE9HX0RFQlVHICJTQU5JVFkgRElG
OiAlcyAweCUiUFJJeDY0IiAtPiAweCUiUFJJeDY0IlxuIiwNCj4+Pj4gKyAgICAgICAgICAgICAg
IHJlZ19uYW1lLCBvbGRfcmVnLCBuZXdfcmVnKTsNCj4+Pj4gKyAgICBpZiAoIG9sZF9yZWcgIT0g
KmN1cl9yZWcgKQ0KPj4+PiArICAgICAgICBwcmludGsoWEVOTE9HX0RFQlVHICJTQU5JVFkgRklY
OiAlcyAweCUiUFJJeDY0IiAtPiAweCUiUFJJeDY0IlxuIiwNCj4+Pj4gKyAgICAgICAgICAgICAg
IHJlZ19uYW1lLCBvbGRfcmVnLCAqY3VyX3JlZyk7DQo+Pj4+ICsNCj4+Pj4gKyAgICBpZiAoIHRh
aW50ICkNCj4+Pj4gKyAgICB7DQo+Pj4+ICsgICAgICAgIHByaW50ayhYRU5MT0dfV0FSTklORyAi
U0FOSVRZIENIRUNLOiBVbmV4cGVjdGVkIHZhcmlhdGlvbiBpbiAlcy5cbiIsDQo+Pj4+ICsgICAg
ICAgICAgICAgICAgcmVnX25hbWUpOw0KPj4+PiArICAgICAgICBhZGRfdGFpbnQoVEFJTlRfQ1BV
X09VVF9PRl9TUEVDKTsNCj4+Pj4gKyAgICB9DQo+Pj4+ICt9DQo+Pj4+ICsNCj4+Pj4gKw0KPj4+
PiArLyoNCj4+Pj4gKyAqIFRoaXMgZnVuY3Rpb24gc2hvdWxkIGJlIGNhbGxlZCBvbiBzZWNvbmRh
cnkgY29yZXMgdG8gc2FuaXRpemUgdGhlIGJvb3QgY3B1DQo+Pj4+ICsgKiBjcHVpbmZvLg0KPj4+
IA0KPj4+IENhbiB3ZSByZW5hbWVkIGJvb3RfY3B1X2RhdGEgdG8gc3lzdGVtX2NwdWluZm8gKG9y
IHNvbWV0aGluZyBzaW1pbGFyKT8gVGhpcyB3b3VsZCBtYWtlIGNsZWFyIHRoaXMgaXMgbm90IG9u
bHkgdGhlIGZlYXR1cmVzIGZvciB0aGUgYm9vdCBDUFU/DQo+PiBXaGlsZSBsb29raW5nIGF0IHRo
aXMgcmVxdWVzdCwgSSBjaGVja2VkIGEgYml0IGhvdyBib290X2NwdV9kYXRhIGFuZCBjcHVfZGF0
YSBvdmVyYWxsIGFyZSB1c2VkOg0KPj4gLSBib290X2NwdV9kYXRhIGlzIG9ubHkgdXNlZCBpbiBz
ZXR1cC5jLCBieSBib290X2NwdV9mZWF0dXJlcyBtYWNyb3MsIGluIHNtcGJvb3QgdG8gcmV0cmll
dmUgdGhlIGJvb3RjcHUgbWlkciwgaW4gcDJtIGFuZCBieSBjcHVmZWF0dXJlcw0KPj4gLSBjcHVf
ZGF0YVtdIGlzIHVzZWQgaW4gc21wYm9vdCwgaW4gZXJyYXRhIGhhbmRsaW5nIHRvIHRlc3QgZm9y
IGNzdjIsIGFuZCBpbiB2Y3ByZWcgdG8gYWNjZXNzIHRoZSBtaWRyDQo+PiBTbyB3ZSBoYXZlIGEg
YnVuY2ggb2YgY3B1aW5mbyBzdHJ1Y3R1cmVzIGFzIGdsb2JhbCB2YXJpYWJsZXMgYnV0IG1vc3Qg
b2YgdGhlbSBhcmUgbm90IHJlYWxseSB1c2VkIG9yIGRpZCBJIG1pc3Mgc29tZXRoaW5nID8NCj4g
DQo+IFdoaWxlIEkgYWdyZWUgdGhpcyBpcyBub3QgdXNlZnVsIHRvZGF5LCB0aGUgaWRlYSBpcyB3
ZSBjYW4gZmluZCBlYXNpbHkgd2hhdCBmZWF0dXJlcyBlYWNoIHByb2Nlc3NvciBzdXBwb3J0cy4g
VGhpcyBjb3VsZCBiZSB1c2VmdWwgaWYgd2Ugd2FudGVkIHRvIGV4cG9zZSBiaWcuTElUVExFIHRv
IHRoZSBndWVzdC4NCj4gDQo+IEZvciBpbnN0YW5jZSwgaW1hZ2luZSB5b3UgaGF2ZSBhIHN5c3Rl
bSB3aGVyZSBzb21lIHByb2Nlc3NvciBtYXkgc3VwcG9ydCAzMi1iaXQgRUwxIG9ubHkgb24gc29t
ZSBwcm9jZXNzb3IuIFdpdGggYSBnbG9iYWwgYXBwcm9hY2gsIHdlIHdvdWxkIHNheSAiMzItYml0
IEVMMSBpcyBub3Qgc3VwcG9ydGVkIi4gVGhhdCB3b3VsZCBwcmV2ZW50IGEgdXNlciB0byB1c2Ug
dGhlIHN5c3RlbSB0byBpdHMgZnVsbCBhZHZhbnRhZ2UuDQo+IA0KPiBOb3RlIHRoYXQgSSBhbSBu
b3QgYXNraW5nIHRvIGltcGxlbWVudCBzdWNoIHRoaW5ncyB0b2RheS4uLiBUaGlzIGlzIG1vcmUg
dG8gc2hvdyB0aGF0IHdlIHdpbGwgbGlrZWx5IHdhbnQgdG8ga2VlcCB0aGUgcGVyLUNQVSBpbmZv
IGFyb3VuZC4NCj4gDQo+IFRoZSBzeXN0ZW1fY3B1aW5mbyBjb3VsZCBiZSB1c2VkIGZvciBzeXN0
ZW0gd2lkZSBkZWNpc2lvbiBpbiBYZW4gKGUuZy4gUDJNIHNpemUsIGNhY2hlbGluZSBzaXplLi4u
Likgd2hpbGUgdGhlIHBlci1DUFUgY291bGQgYmUgdXNlZCB0byBlbmFibGUgZmVhdHVyZXMgb25s
eSB1c2VkIGJ5IGEgY291cGxlIG9mIENQVXMuDQoNCkkgdW5kZXJzdGFuZCB0aGUgcG90ZW50aWFs
IG5lZWQgKGV2ZW4gdGhvdWdoIHN1cHBvcnRpbmcgdG8gYXNzaWduIGd1ZXN0IENQVXMgZGVwZW5k
aW5nIG9uIGZlYXR1cmVzIG5lZWRlZCB3b3VsZCBiZSBzb21ldGhpbmcgY29tcGxleCB0byBhY2hp
ZXZlKS4NCg0KPiANCj4+IFNvIEkgYW0gd29uZGVyaW5nIGlmIHdlIHNob3VsZCBub3QgcmVkdWNl
IGEgYml0IHRoZSBhbW91bnQgb2YgZ2xvYmFsIGRhdGEgYW5kOg0KPiANCj4gSG93IG11Y2ggYXJl
IHdlIHRhbGtpbmc/DQoNCldlIGFyZSBkZWNsYXJpbmcgY3B1aW5mbyBmb3IgYWxsIHBvc3NpYmxl
IGNvcmVzIGluIHNtcGJvb3Q6DQpzdHJ1Y3QgY3B1aW5mb19hcm0gY3B1X2RhdGFbTlJfQ1BVU107
DQpBbmQgZGVmYXVsdCB2YWx1ZSBmb3IgTlJfQ1BVUyBpcyAxMjggc28gdGhhdCBtYWtlcyBhcm91
bmQgOWsgb2YgZGF0YS4NCg0KVGhpcyBpcyBub3QgdGhhdCBtdWNoIEkgYWdyZWUuDQoNCg0KPiAN
Cj4+IC0gaW50cm9kdWNlIGEgZ2xvYmFsIHN5c3RlbV9jcHVpbmZvDQo+PiAtIHJlbW92ZSBjcHVf
ZGF0YVtdIGFuZCB1c2UgYSB0ZW1wIHN0cnVjdHVyZSBpbiB0aGUgc3RhY2sgb2YgdGhlIGNwdSBi
b290aW5nDQo+PiAtIHJlYWQgbWlkciBkaXJlY3RseSBpbiB2Y3ByZWcNCj4+IC0gdXNlIGJvb3Rf
Y3B1X2RhdGEgaW4gZXJyYXRhIGZvciBjc3YyDQo+IA0KPiBUaGlzIHdvdWxkIG5vdCBiZSBxdWl0
ZSB0aGUgc2FtZS4gWW91IG1heSBoYXZlIGEgc3lzdGVtIHdoZXJlIG5vdCBhbGwgcHJvY2Vzc29y
cyBoYXZlIElEX0FBNjRQRlIwX0VMMS5DU1YyIGlzIHNldCwgeWV0IHdlIHdhbnQgdG8gYXZvaWQg
c2V0dGluZyB0aGUgaGFyZGVuaW5nIHZlY3RvciBvbiBwcm9jZXNzIHdpdGggdGhlIGJpdCBzZXQg
dG8gcmVkdWNlIHRoZSBvdmVyaGVhZC4NCg0KQWdyZWUgYW5kIHdpdGggdGhlIGFjdHVhbCBzaXpl
IHJlZHVjdGlvbiBiZWluZyBxdWl0ZSBzbWFsbCB0aGlzIGRvZXMgbm90IG1ha2Ugc2Vuc2UuDQoN
ClRoYW5rcyBhIGxvdCBmb3IgdGhlIGZlZWRiYWNrLCBJIHdpbGwgZ28gb24gd2l0aCB0aGUgc3lz
dGVtX2NwdWluZm8gYW5kIGlzLg0KDQpDaGVlcnMNCkJlcnRyYW5kDQoNCj4gDQo+IENoZWVycywN
Cj4gDQo+IC0tIA0KPiBKdWxpZW4gR3JhbGwNCg0K

