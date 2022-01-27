Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 69F4549DDDE
	for <lists+xen-devel@lfdr.de>; Thu, 27 Jan 2022 10:25:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.261355.452430 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nD11u-0005d6-Ja; Thu, 27 Jan 2022 09:25:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 261355.452430; Thu, 27 Jan 2022 09:25:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nD11u-0005ai-G3; Thu, 27 Jan 2022 09:25:22 +0000
Received: by outflank-mailman (input) for mailman id 261355;
 Thu, 27 Jan 2022 09:25:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xPLH=SL=arm.com=Wei.Chen@srs-se1.protection.inumbo.net>)
 id 1nD11t-0005aa-P1
 for xen-devel@lists.xenproject.org; Thu, 27 Jan 2022 09:25:21 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on0605.outbound.protection.outlook.com
 [2a01:111:f400:fe0c::605])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0ba9929b-7f53-11ec-8eb8-a37418f5ba1a;
 Thu, 27 Jan 2022 10:25:20 +0100 (CET)
Received: from AM5PR0601CA0045.eurprd06.prod.outlook.com
 (2603:10a6:203:68::31) by AM6PR08MB3367.eurprd08.prod.outlook.com
 (2603:10a6:20b:44::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.17; Thu, 27 Jan
 2022 09:25:09 +0000
Received: from VE1EUR03FT045.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:203:68:cafe::23) by AM5PR0601CA0045.outlook.office365.com
 (2603:10a6:203:68::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.15 via Frontend
 Transport; Thu, 27 Jan 2022 09:25:09 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT045.mail.protection.outlook.com (10.152.19.51) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4930.15 via Frontend Transport; Thu, 27 Jan 2022 09:25:08 +0000
Received: ("Tessian outbound 341d209a0e52:v113");
 Thu, 27 Jan 2022 09:25:08 +0000
Received: from 7a0b6caa3425.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 4D1068AA-D99B-4291-AF11-F6BF0A08391A.1; 
 Thu, 27 Jan 2022 09:25:02 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 7a0b6caa3425.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 27 Jan 2022 09:25:02 +0000
Received: from PAXPR08MB7420.eurprd08.prod.outlook.com (2603:10a6:102:2b9::9)
 by HE1PR0802MB2507.eurprd08.prod.outlook.com (2603:10a6:3:e1::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.17; Thu, 27 Jan
 2022 09:25:00 +0000
Received: from PAXPR08MB7420.eurprd08.prod.outlook.com
 ([fe80::4463:2795:6645:5dd0]) by PAXPR08MB7420.eurprd08.prod.outlook.com
 ([fe80::4463:2795:6645:5dd0%7]) with mapi id 15.20.4909.017; Thu, 27 Jan 2022
 09:25:00 +0000
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
X-Inumbo-ID: 0ba9929b-7f53-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Eda+o/eaVRL+ux6gK4p5TJDZR21Rzh0PM3SZM2Rf6hM=;
 b=cA9ImlWgYeTmDE+slXxMQo1aMVnu7St6S+IeDYV3EYtD0wPJSHqmEEI9ZEzX5Lgo7xgrX8KPS78rQA53kki2AD1nj493vj6Y0kgiFFARPVLiXi4iHrbovbUl4eIsXunpBP4O4EDwR8Tj4SByswP7E9hU8lwlfH1bJbnMlMpnVRI=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nYoO41eCQQexXx2axcDfqGYecRq+qLpw7yDlt+wAXpfeuU1gxhGPLe6AUcdyxM0FItmzL1BLaHJavd+qmZnDTQWsk2jdhmuTsj+cX1mHWYDG4XXv3CGpJ2LLItXc6S0ynI7noYDAxpSkv8dgW1KIg3iO3NVsEP49kRzwwoF6A5SrKXQXU9qhgz6AX1HIuq51yU+mXJxwF5SRXGutCVVsJVqiKv0Oq4ep9NGDCrMEsJ0GR2cc27Pjmtr78anHqGhmI/ByUL+Da3gLRxTVD99elNCfvwxiqp1Afau4Th7BdwAIAp2yAH0KMkZr4N+aGv88pBRftP6GeakF7gs6wEAHYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Eda+o/eaVRL+ux6gK4p5TJDZR21Rzh0PM3SZM2Rf6hM=;
 b=ZWcu85iMKs3ZRexolBKXz9n8WSUHusObwJCENW6Iy6CGyUsjBAC8CBCfPeMIeYfk6eBU4jyta61rjCqK9kJU8xuWpea9nxH30QNhEF2nrOZaUseBGz2LpoJTbka+QZBbXRdJfrMIS4grZufengv+biv9bmOxsyrm1cfqtOiWbGtnLlf2FRPHmpsMI0WtyvBCfv0zwu1r5596/gIh0d4v7lUlug81wj60kRa9tpyGYVsZINXtdL7omcKbJ0LMgMwAZPbI567hlz/rplo9yNoLzZ5/BGd147nDUAcwCjGCl9X35LHby0jpIAyCXa65o0YjMYbJDSgUyDBDWHQEnXzzJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Eda+o/eaVRL+ux6gK4p5TJDZR21Rzh0PM3SZM2Rf6hM=;
 b=cA9ImlWgYeTmDE+slXxMQo1aMVnu7St6S+IeDYV3EYtD0wPJSHqmEEI9ZEzX5Lgo7xgrX8KPS78rQA53kki2AD1nj493vj6Y0kgiFFARPVLiXi4iHrbovbUl4eIsXunpBP4O4EDwR8Tj4SByswP7E9hU8lwlfH1bJbnMlMpnVRI=
From: Wei Chen <Wei.Chen@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Bertrand Marquis <Bertrand.Marquis@arm.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	"sstabellini@kernel.org" <sstabellini@kernel.org>, "julien@xen.org"
	<julien@xen.org>
Subject: RE: [PATCH 20/37] xen: introduce CONFIG_EFI to stub API for non-EFI
 architecture
Thread-Topic: [PATCH 20/37] xen: introduce CONFIG_EFI to stub API for non-EFI
 architecture
Thread-Index:
 AQHXsHMtR+l18+MmpE6rl/RjSXTBgqx0TXyAgAME0ECAAAH2oIAAA3YAgAAA4bCAAAOtAIAAAa7A
Date: Thu, 27 Jan 2022 09:25:00 +0000
Message-ID:
 <PAXPR08MB74205D98C454993DCFAE4FFC9E219@PAXPR08MB7420.eurprd08.prod.outlook.com>
References: <20210923120236.3692135-1-wei.chen@arm.com>
 <20210923120236.3692135-21-wei.chen@arm.com>
 <d80da027-93ac-4819-ef7a-f3fd8592e443@suse.com>
 <PAXPR08MB7420AC9A05A6118642F544BD9E219@PAXPR08MB7420.eurprd08.prod.outlook.com>
 <PAXPR08MB7420252BFA15D032BDDF2F4A9E219@PAXPR08MB7420.eurprd08.prod.outlook.com>
 <e135adab-8b21-8dc0-2518-e505a59feb9f@suse.com>
 <PAXPR08MB7420EF1360C2E1D63D278A1B9E219@PAXPR08MB7420.eurprd08.prod.outlook.com>
 <b274899d-55f5-1851-82e6-69898d53e726@suse.com>
In-Reply-To: <b274899d-55f5-1851-82e6-69898d53e726@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 023A501837DA2E488AA9C8E468012E82.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 3d78fa60-0bd8-4fb9-2f4e-08d9e176e97d
x-ms-traffictypediagnostic:
	HE1PR0802MB2507:EE_|VE1EUR03FT045:EE_|AM6PR08MB3367:EE_
X-Microsoft-Antispam-PRVS:
	<AM6PR08MB3367C7932B732E0C6BF90D149E219@AM6PR08MB3367.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:10000;OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 p1MxdG7Pvrqok2WbsnIBkVu0I5WJ95fqkZmuu1mHVGpCtuRAi2H7a80qX/2sVsBJo3Md2ti3Jjda97t3k8nS8shvZ2LURkMVtG8F29K6dWGVcZvSghRQvqPS/Gx4jdv6py7uTx3u2MWQzTZsXfLS7XgztclGRbvte6MBAWd0LJiolvBtT1v6VzE/IeJXH//WEq4ySR67Ms8UB6A5VGYhFhGPFzWy7fc6zRzahLDpRsWz1n0uX/2NDr1l3z552UXh9KKDh2ISBjWidoUkAYGJjhyANQZWj9iPegO0qNEtYN2Ve0Erm1aSSwejLi0rM/oe9VLQorT60vvHFM1qdB+U0H6o8UkkD/BOTNxvIqs2PRPgxFbVC3a5oZy4M5UaKvXixvtpptLMYQEi+RB6UiNU1g0WYdb7bFeNN3kFAQ/CNT6zJI/ha582fSh+w812YLW0+VokgxbQRTF0u1vZ48V+d7zA7YEV+DPrP4e+2s+8uumktVEHRs9mzkP/LfPGbsh4p8vEjb7pmKsgc60xtc5BTp4t3SSD5APfmZrNQq90AxB0vH1+rdXp51SeeaPgPxUFOafp3JpMD2zFFObYPBTtbdAHTLMlyLC6Z8uqq5B7egGSVZmqt1jqooWrG/xr1r/nWcqhsPwQ1dIzPF915ZYqphRq3hayQDSM484bXAtxxgE6/bA1XNhCNT4JwsanVtifDnkQuEoiYL06VthwT1aA8w==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB7420.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(71200400001)(54906003)(2906002)(52536014)(53546011)(186003)(26005)(6916009)(33656002)(316002)(9686003)(6506007)(508600001)(7696005)(86362001)(55016003)(66476007)(83380400001)(64756008)(66946007)(66446008)(66556008)(76116006)(4326008)(8936002)(8676002)(122000001)(5660300002)(38100700002)(38070700005)(20210929001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0802MB2507
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT045.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	e96c8a94-d9ee-4ca9-0c76-08d9e176e49b
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	0IdFxb/Ps/K9XlsBCX1dzHwuc1ih5H+0rJ50za8FqnAW+jH2rPq8P2TQzcdZUoY47fMn/oD6Zsh5zrVVO4Fx8QEB2OmgNp+2MDdFlIu74qnQ4f8rOq8T0TO3/buv6T+DMHK44teVcPKQC3aNSsmr5vUZzA+cHpb5BncuYtCwJC1PwZssYXfMEPLcC7UiADZcptzbwC6o9bnD/Pu0hgxMCQVNnXS8MJGtCGBvT9J+fQKY7LSptU1/W5+IuiUeHrWEkXBtrmiJUn5DXtEetjDbGoiDz1CRbjc75+cllXuSChpv9pK5/nKMHgH60cZM/3HYdhPP/fzDMo1g64ADdnI8BwAR+Vfwff77p3e8aDdYIlUo+Qga8l8hcHL64RwPipOiSGjCpyH6Z/h8BsUc9bQtPMMQWEuNS6XCLRcFp+6g12jFcybfjCVERAKY2KZoKTRMpTHSYWRnunB0bvKp46e7LOLZyRt81eL/aBho8/oq6sYCpIjUa8UARoC6IA1cXOi3garll4hocUimTMV5m38qYAqGVlquwjdzrBQvrUcT+ySiWFh8/gA0f82CXtKA5kcgcyuIhZ92L1MXaBj4PK9HFhthMwmBm4c4MyrdwcQHWEWQLVOqh8s94/0E/MY3G+PiUOtHD8AIT4PDyj0eMnJDIyQK3GoEwSEWTi3+tYzcSWclcnooj7h6Qs6FzkjVX4PJ
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(46966006)(40470700004)(36840700001)(316002)(36860700001)(54906003)(82310400004)(70586007)(9686003)(70206006)(81166007)(356005)(5660300002)(508600001)(2906002)(186003)(52536014)(6506007)(7696005)(53546011)(26005)(47076005)(8936002)(40460700003)(4326008)(6862004)(8676002)(33656002)(336012)(86362001)(55016003)(83380400001)(20210929001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2022 09:25:08.7915
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d78fa60-0bd8-4fb9-2f4e-08d9e176e97d
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT045.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3367

SGkgSmFuLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEphbiBCZXVs
aWNoIDxqYmV1bGljaEBzdXNlLmNvbT4NCj4gU2VudDogMjAyMuW5tDHmnIgyN+aXpSAxNzoxNw0K
PiBUbzogV2VpIENoZW4gPFdlaS5DaGVuQGFybS5jb20+DQo+IENjOiBCZXJ0cmFuZCBNYXJxdWlz
IDxCZXJ0cmFuZC5NYXJxdWlzQGFybS5jb20+OyB4ZW4tDQo+IGRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnOyBzc3RhYmVsbGluaUBrZXJuZWwub3JnOyBqdWxpZW5AeGVuLm9yZw0KPiBTdWJqZWN0
OiBSZTogW1BBVENIIDIwLzM3XSB4ZW46IGludHJvZHVjZSBDT05GSUdfRUZJIHRvIHN0dWIgQVBJ
IGZvciBub24tDQo+IEVGSSBhcmNoaXRlY3R1cmUNCj4gDQo+IE9uIDI3LjAxLjIwMjIgMTA6MDks
IFdlaSBDaGVuIHdyb3RlOg0KPiA+PiBGcm9tOiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5j
b20+DQo+ID4+IFNlbnQ6IDIwMjLlubQx5pyIMjfml6UgMTc6MDANCj4gPj4NCj4gPj4gT24gMjcu
MDEuMjAyMiAwOTo1MSwgV2VpIENoZW4gd3JvdGU6DQo+ID4+Pj4gRnJvbTogWGVuLWRldmVsIDx4
ZW4tZGV2ZWwtYm91bmNlc0BsaXN0cy54ZW5wcm9qZWN0Lm9yZz4gT24gQmVoYWxmIE9mDQo+ID4+
IFdlaQ0KPiA+Pj4+IENoZW4NCj4gPj4+PiBTZW50OiAyMDIy5bm0MeaciDI35pelIDE2OjQ1DQo+
ID4+Pj4NCj4gPj4+Pj4gRnJvbTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPg0KPiA+
Pj4+PiBTZW50OiAyMDIy5bm0MeaciDI15pelIDE4OjM1DQo+ID4+Pj4+DQo+ID4+Pj4+IE9uIDIz
LjA5LjIwMjEgMTQ6MDIsIFdlaSBDaGVuIHdyb3RlOg0KPiA+Pj4+Pj4gLS0tIGEveGVuL2NvbW1v
bi9LY29uZmlnDQo+ID4+Pj4+PiArKysgYi94ZW4vY29tbW9uL0tjb25maWcNCj4gPj4+Pj4+IEBA
IC0xMSw2ICsxMSwxNiBAQCBjb25maWcgQ09NUEFUDQo+ID4+Pj4+PiAgY29uZmlnIENPUkVfUEFS
S0lORw0KPiA+Pj4+Pj4gIAlib29sDQo+ID4+Pj4+Pg0KPiA+Pj4+Pj4gK2NvbmZpZyBFRkkNCj4g
Pj4+Pj4+ICsJYm9vbA0KPiA+Pj4+Pj4gKwktLS1oZWxwLS0tDQo+ID4+Pj4+PiArICAgICAgVGhp
cyBvcHRpb24gcHJvdmlkZXMgc3VwcG9ydCBmb3IgcnVudGltZSBzZXJ2aWNlcyBwcm92aWRlZA0K
PiA+Pj4+Pj4gKyAgICAgIGJ5IFVFRkkgZmlybXdhcmUgKHN1Y2ggYXMgbm9uLXZvbGF0aWxlIHZh
cmlhYmxlcywgcmVhbHRpbWUNCj4gPj4+Pj4+ICsgICAgICBjbG9jaywgYW5kIHBsYXRmb3JtIHJl
c2V0KS4gQSBVRUZJIHN0dWIgaXMgYWxzbyBwcm92aWRlZCB0bw0KPiA+Pj4+Pj4gKyAgICAgIGFs
bG93IHRoZSBrZXJuZWwgdG8gYmUgYm9vdGVkIGFzIGFuIEVGSSBhcHBsaWNhdGlvbi4gVGhpcw0K
PiA+Pj4+Pj4gKyAgICAgIGlzIG9ubHkgdXNlZnVsIGZvciBrZXJuZWxzIHRoYXQgbWF5IHJ1biBv
biBzeXN0ZW1zIHRoYXQgaGF2ZQ0KPiA+Pj4+Pj4gKyAgICAgIFVFRkkgZmlybXdhcmUuDQo+ID4+
Pj4+DQo+ID4+Pj4+IFRoZSB3YXkgZW5hYmxpbmcgb2YgKGZ1bGwpIEVGSSBzdXBwb3J0IHdvcmtz
IG9uIHg4NiwgSSBjb25zaWRlciBpdA0KPiA+Pj4+PiB3cm9uZyAvIG1pc2xlYWRpbmcgdG8gcHV0
IHRoZSBvcHRpb24gaW4gY29tbW9uIGNvZGUuIEF0IHRoZSB2ZXJ5DQo+IGxlYXN0DQo+ID4+Pj4+
IHRoZSBoZWxwIHRleHQgd291bGQgbmVlZCB0byBjYWxsIG91dCB0aGUgZXh0cmEgZGVwZW5kZW5j
aWVzLiBQbHVzDQo+IHRoZQ0KPiA+Pj4+PiBoZWxwIHRleHQgb2YgY291cnNlIHRoZW4gbmVlZHMg
dG8gYmUgZ2VuZXJpYyAoaS5lLiBhcHBsaWNhYmxlIHRvDQo+IGJvdGgNCj4gPj4+Pj4gQXJtIGFu
ZCB4ODYpLiBUaGF0J3Mgbm90d2l0aHN0YW5kaW5nIHRoZSBmYWN0IHRoYXQgd2l0aG91dCBhIHBy
b21wdA0KPiA+Pj4+PiB0aGUgaGVscCB0ZXh0IHdvbid0IGV2ZXIgYmUgc2VlbiB3aGlsZSBjb25m
aWd1cmluZyBYZW4uDQo+ID4+Pj4+DQo+ID4+Pj4+IEFsc28gKG5pdCk6IEluZGVudGF0aW9uLiBB
bmQgcGxlYXNlIGRvbid0IHVzZSAtLS1oZWxwLS0tIGFueW1vcmUgaW4NCj4gPj4+Pj4gbmV3IGNv
ZGUuDQo+ID4+Pj4+DQo+ID4+Pj4NCj4gPj4+PiBJIGhhdmUgdXNlZCBDT05GSUdfQVJNX0VGSSB0
byByZXBsYWNlIHRoaXMgY29tbW9uIEVGSSBjb25maWcgaW4gbXkNCj4gPj4+PiBsYXRlc3QgdmVy
c2lvbi4gVGhpcyBLY29uZmlnIG9wdGlvbiBoYXMgYmVlbiByZW1vdmVkLg0KPiA+Pj4+IEFuZCB0
aGFua3MsIEkgd2lsbCBub3QgdXNlIC0taGVscC0tIGFueW1vcmUuDQo+ID4+Pj4NCj4gPj4+Pj4+
IC0tLSBhL3hlbi9pbmNsdWRlL3hlbi9lZmkuaA0KPiA+Pj4+Pj4gKysrIGIveGVuL2luY2x1ZGUv
eGVuL2VmaS5oDQo+ID4+Pj4+PiBAQCAtMjUsNiArMjUsOCBAQCBleHRlcm4gc3RydWN0IGVmaSBl
Zmk7DQo+ID4+Pj4+Pg0KPiA+Pj4+Pj4gICNpZm5kZWYgX19BU1NFTUJMWV9fDQo+ID4+Pj4+Pg0K
PiA+Pj4+Pj4gKyNpZmRlZiBDT05GSUdfRUZJDQo+ID4+Pj4+PiArDQo+ID4+Pj4+PiAgdW5pb24g
eGVucGZfZWZpX2luZm87DQo+ID4+Pj4+PiAgdW5pb24gY29tcGF0X3BmX2VmaV9pbmZvOw0KPiA+
Pj4+Pj4NCj4gPj4+Pj4+IEBAIC00NSw2ICs0Nyw4IEBAIGludCBlZmlfcnVudGltZV9jYWxsKHN0
cnVjdA0KPiB4ZW5wZl9lZmlfcnVudGltZV9jYWxsDQo+ID4+Pj4gKik7DQo+ID4+Pj4+PiAgaW50
IGVmaV9jb21wYXRfZ2V0X2luZm8odWludDMyX3QgaWR4LCB1bmlvbiBjb21wYXRfcGZfZWZpX2lu
Zm8gKik7DQo+ID4+Pj4+PiAgaW50IGVmaV9jb21wYXRfcnVudGltZV9jYWxsKHN0cnVjdCBjb21w
YXRfcGZfZWZpX3J1bnRpbWVfY2FsbCAqKTsNCj4gPj4+Pj4+DQo+ID4+Pj4+PiArI2VuZGlmIC8q
IENPTkZJR19FRkkqLw0KPiA+Pj4+Pg0KPiA+Pj4+PiBJIGNhbiBzZWUgdGhhdCBpbiB0aGUgbGF0
ZXIgcGF0Y2gsIHdoZW4gaW50cm9kdWNpbmcgaW5saW5lIHN0dWJzLA0KPiA+Pj4+PiB5b3Ugd291
bGQgbmVlZCBjb25kaXRpb25hbHMgaGVyZSwgYnV0IEkgZG9uJ3QgdGhpbmsgeW91IG5lZWQgdGhl
bQ0KPiA+Pj4+PiByaWdodCBoZXJlIChvciB5b3UgbWF5IHdhbnQgdG8gaW50cm9kdWNlIHRoZSBz
dHVicyByaWdodCBhd2F5KS4NCj4gPj4+Pj4NCj4gPj4+Pj4gQWxzbyAobml0KTogTWlzc2luZyBi
bGFuayBpbiB0aGUgY29tbWVudC4NCj4gPj4+DQo+ID4+PiBJIGFtIHNvcnJ5LCBJIGhhZCBtaXNz
ZWQgdGhpcyBjb21tZW50LiBJbiBteSBsYXRlc3QgY2hhbmdlcywNCj4gPj4+IEkgaGF2ZSBpbnRy
b2R1Y2VkIGEgc3R1YiBmaWxlIGZvciBub24tRUZJIGFyY2hpdGVjdHVyZXMuDQo+ID4+PiBUaGUg
cmVhc29uIHdoeSB3ZSBkb24ndCB1c2UgYSBtYWNybyB0byBzdHViIHRoZSBoZWxwZXJzDQo+ID4+
PiBpbiBlZmkuaCBpcyB0aGF0LCBzb21lIGFyY2hpdGVjdHVyZXMgaGF2ZSBpbXBsZW1lbnRlZCBz
dHViDQo+ID4+PiBoZWxwZXJzIGluIHRoZWlyIHN0dWIuYy4gSWYgd2UgZGVmaW5lIHN0dWIgaGVs
cGVycyBpbg0KPiA+Pj4gZWZpLmgsIHRoaXMgd2lsbCBjYXVzZSBmdW5jdGlvbiByZWRlZmluaXRp
b24gZXJyb3IuIFdlIG5lZWQNCj4gPj4+IHRvIGZpeCB0aGlzIGVycm9yIGZvciBhbGwgYXJjaGl0
ZWN0dXJlcy4gQW5kIHNvbWUgaGVscGVycw0KPiA+Pj4gaXMgbm90IGVhc3kgdG8gaW1wbGVtZW50
IGFzIGEgaW5saW5lIGZ1bmN0aW9uIGluIGVmaS5oLg0KPiA+Pj4gU28gd2UgdXNlIHN0dWIgZmls
ZSBpbnN0ZWFkIG9mIHN0dWJpbmcgaW4gZWZpLmgNCj4gPj4NCj4gPj4gQnV0IHlvdSByZWFsaXpl
IHdlIGFscmVhZHkgaGF2ZSBzdWNoIGEgc3R1YiBmaWxlIG9uIHg4Nj8NCj4gPj4NCj4gPg0KPiA+
IFllcywgd2UgZm91bmQgdGhlIHJlZGVmaW5pdGlvbiBlcnJvcnMgdGhhdCBhcmUgY2F1c2VkIGJ5
IHg4NiBzdHViIGZpbGUNCj4gPiBhbmQgbmV3IG1hY3JvcyBpbiBzdHViLmguIFdlIGhhZCB0cmll
cyB0byBhZGQ6DQo+ID4gaWZlcSAoJChYRU5fQlVJTERfRUZJKSx5KQ0KPiA+IENGTEFHUy15ICs9
IC1EWEVOX0JVSUxEX0VGSQ0KPiA+IFhFTl9DRkxBR1MgKz0gLURYRU5fQlVJTERfRUZJDQo+ID4g
ZW5kaWYNCj4gPiB4ODYvTWFrZWZpbGUgdG8gZ2F0ZSB0aGVzZSBuZXcgbWFjcm9zLCBidXQgaXQg
c2VlbXMgdGhhdCB3ZSBtYXkgbmVlZA0KPiA+IHRvIGNoYW5nZSBFRkkgYnVpbGQgbG9naWMgZm9y
IHg4Ni4gSXQgd2lsbCBjYXVzZSBtb3JlIHJpc2tzIGZvciBtZS4NCj4gPiBTbyBJIHdhbnQgdG8g
aW50cm9kdWNlIGEgc2ltaWxhciBzdHViLmMgaW4gYXJjaC9hcm0uDQo+IA0KPiBXaGlsZSB0aGF0
J3MgcGVyaGFwcyBmaW5lLCBpZGVhbGx5IGNvbW1vbiBiaXRzIHdvdWxkIGJlIGNvbW1vbi4gSWly
Yw0KPiBhbHJlYWR5IGJhY2sgYXQgdGhlIHRpbWUgSSB3YXMgd29uZGVyaW5nIHdoeSBzdHViLmMg
aGFkIHRvIGJlIHg4Ni0NCj4gb25seS4NCg0KU29tZSBkdW1teSBmdW5jdGlvbnMgaW4gc3R1Yi5j
IGNhbiBiZSBzaGFyZWQgYnkgYXJtIG9yIG90aGVyIGFyY2hpdGVjdHVyZXMuDQpCdXQgc29tZSBm
dW5jdGlvbnMgbGlrZSBlZmlfbXVsdGlib290MiBhcmUgYXJjaGl0ZWN0dXJlIGRlcGVuZGVudC4N
Cg0KPiANCj4gSmFuDQoNCg==

