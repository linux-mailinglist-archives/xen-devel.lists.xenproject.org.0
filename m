Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F64B4FF470
	for <lists+xen-devel@lfdr.de>; Wed, 13 Apr 2022 12:10:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.304036.518550 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1neZwm-0004ck-9M; Wed, 13 Apr 2022 10:10:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 304036.518550; Wed, 13 Apr 2022 10:10:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1neZwm-0004am-58; Wed, 13 Apr 2022 10:10:00 +0000
Received: by outflank-mailman (input) for mailman id 304036;
 Wed, 13 Apr 2022 10:09:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VMZD=UX=arm.com=Rahul.Singh@srs-se1.protection.inumbo.net>)
 id 1neZwk-0004ag-5M
 for xen-devel@lists.xenproject.org; Wed, 13 Apr 2022 10:09:58 +0000
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur03on0602.outbound.protection.outlook.com
 [2a01:111:f400:fe08::602])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id de0376cd-bb11-11ec-a405-831a346695d4;
 Wed, 13 Apr 2022 12:09:56 +0200 (CEST)
Received: from DB9PR02CA0028.eurprd02.prod.outlook.com (2603:10a6:10:1d9::33)
 by AS8PR08MB7144.eurprd08.prod.outlook.com (2603:10a6:20b:404::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.29; Wed, 13 Apr
 2022 10:09:53 +0000
Received: from DB5EUR03FT059.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:1d9:cafe::6) by DB9PR02CA0028.outlook.office365.com
 (2603:10a6:10:1d9::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5164.20 via Frontend
 Transport; Wed, 13 Apr 2022 10:09:52 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT059.mail.protection.outlook.com (10.152.21.175) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5164.19 via Frontend Transport; Wed, 13 Apr 2022 10:09:52 +0000
Received: ("Tessian outbound 62985e3c34b6:v118");
 Wed, 13 Apr 2022 10:09:52 +0000
Received: from e19387a17f8a.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 203815F5-64B8-46C7-B69D-BB56B5AE0F84.1; 
 Wed, 13 Apr 2022 10:09:41 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id e19387a17f8a.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 13 Apr 2022 10:09:41 +0000
Received: from AM5PR0801MB2020.eurprd08.prod.outlook.com
 (2603:10a6:203:4c::14) by PA4PR08MB5981.eurprd08.prod.outlook.com
 (2603:10a6:102:e2::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.29; Wed, 13 Apr
 2022 10:09:39 +0000
Received: from AM5PR0801MB2020.eurprd08.prod.outlook.com
 ([fe80::7cce:cf19:817f:57a0]) by AM5PR0801MB2020.eurprd08.prod.outlook.com
 ([fe80::7cce:cf19:817f:57a0%11]) with mapi id 15.20.5164.020; Wed, 13 Apr
 2022 10:09:38 +0000
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
X-Inumbo-ID: de0376cd-bb11-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fZJR5Xmt0cfoBLY7bLnm+UBlr6Y4NafBIQQpOJxvzZc=;
 b=ANgw+7Wqf8FW44RqSxwSbgz4RPp/zE0U21x6pezctJap8jecFvRYQO1Hii2mnZVyjTk+IHGhna2EIymT7o7+/cpB6IvsNYoJwLdFb5aOVX+uHdJHgPFSml9pTDOqUDGbNwqnXtwGRlizK7yIX8EFNUe0KNbvVpIfYCUrdDNXz+E=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 498893f2b231f21c
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WxOF+/cc4fdonXLYnkPBYpyoGXvrk6vCnBGufEYXUtpoGUvpxAEq2Jsy8Z3hTrtiEcVACPJwsRpFNkJGfiG/OT7NYicG3I0FhbKOjB17b2XogriZBfUD7KhjHk5SRGhfTauAvj/Zv7EE6XaTHYPs/0Jq9j/hAjw2bFdtoNxCsmHOVjqfaOucsIXVtCW2Os9AUUZzrmICW700mSDmgPhgUUFF9GDTiK+/pZrt9b30tMxe4351Qxi/acp9EDNgpV81eSyXqGgueX79muAoJnMVR/N/g4HlCGg4e6wehoAgaAlc2nup3cAiMGVj9twMdZrpr5W1q6zfnefFtqaA9ZDpAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fZJR5Xmt0cfoBLY7bLnm+UBlr6Y4NafBIQQpOJxvzZc=;
 b=UvJ5t9bAH5sHT5PGgW2ocLJFyQbYTVsksB4LwtybfWrU4/2tlNJpsSCO7noQV/+TB8AHmKCoYmXOlNa4JLnCJDT4tiWCAGBuG7vmQ96F+6Ai1ahFE7egoIML8+P6zwHMIEj2E/Q777jlxgu/GjOK3PdaZ90IvkEyRfSrlDOXyr/CIwECd/rWycCtudNFlPMDhCCxrEeGONJLWb+hI7QJsdupgvF3pw4Cx5R3DF6t9QIxoV5cKsYYx18sbSPc/arOzrmXrDUIMZ/i8qqLBTrlOn0kO0ycHbtgh0rmQ98dlXoXhhsHnoT++an+2KiBnOEz6jWdT7Gri7qZz6JCmtzDHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fZJR5Xmt0cfoBLY7bLnm+UBlr6Y4NafBIQQpOJxvzZc=;
 b=ANgw+7Wqf8FW44RqSxwSbgz4RPp/zE0U21x6pezctJap8jecFvRYQO1Hii2mnZVyjTk+IHGhna2EIymT7o7+/cpB6IvsNYoJwLdFb5aOVX+uHdJHgPFSml9pTDOqUDGbNwqnXtwGRlizK7yIX8EFNUe0KNbvVpIfYCUrdDNXz+E=
From: Rahul Singh <Rahul.Singh@arm.com>
To: Julien Grall <julien@xen.org>
CC: xen-devel <xen-devel@lists.xenproject.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Andrew Cooper <andrew.cooper3@citrix.com>, George
 Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, Stefano
 Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH] xen/evtchn: Add design for static event channel signaling
 for domUs..
Thread-Topic: [PATCH] xen/evtchn: Add design for static event channel
 signaling for domUs..
Thread-Index: AQHYPsy9MfyfmFhecEGJuSNYyusIgKzrHq6AgAKD34CAABXsgIAABxUA
Date: Wed, 13 Apr 2022 10:09:37 +0000
Message-ID: <8D312C7F-DF7D-4961-BF9A-4D76C8EA91CD@arm.com>
References:
 <4836304496e6fbbea41348ed8cc9fcf6b0f3e893.1648049827.git.rahul.singh@arm.com>
 <0ecf69d2-c496-d18e-1309-f896ec6bbf4c@xen.org>
 <3622A5B1-D64C-43D9-9AA3-2E781C2310B9@arm.com>
 <4f8ae917-d5d6-d93b-b31a-d46b55fa66cd@xen.org>
In-Reply-To: <4f8ae917-d5d6-d93b-b31a-d46b55fa66cd@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 92e3aabf-2312-481c-9e35-08da1d35c05c
x-ms-traffictypediagnostic:
	PA4PR08MB5981:EE_|DB5EUR03FT059:EE_|AS8PR08MB7144:EE_
X-Microsoft-Antispam-PRVS:
	<AS8PR08MB7144604288C4960C003522DDFCEC9@AS8PR08MB7144.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 kopzkQSCIWRyq5QQEUQXXO5DOVicyN8rsu0+swdzEruLL/Q1mTivajcGVsgZFpajuybla2LIDzEyDw8Tly+q9d24w3j5SMz/GgcgMiN3Om96FBuD9UGb3JsDkyIncGAG4ah9ebC9pRCiqtJd7KawIvw1gk0YazRpT72BVAtnYHtxGdG4pZW5+zJY2tNejkci0Uz4mwmS4IWAIRpvzcbb+3CtMxCTJAaK5BwIptPVTzxxUUDn+GxVAxweWXTPY+hD2f/ZLlq7TQoSzN1weuyO2jZIhZl6GmDPxGKwyIE4Ijyx8o9ZH+Cr2wejDVK76e6bMOqs3Yas9EFwezxOnwhMgGfNMsXpTfNJ8nZuRBLAGEfU5uqYU3PFIN52afwi45P1dkMqhwYcqBIGoAJzk/QakmbuZx7W23N3+uJ7ClFPzJ1HHsATFJ/RA805yRaEspfYwytOtnpyvWvDb6xpfmkkK+eZt56Eu9uDXa98K/qGR5sb5EFiTu3qpMg5Jl40rym8QeaiUHbrVi2cXcTQ8A7/M0dTk/nuvrpEgLwkrSy8uoePFtxQaOikhmmX79E+qDvqn3vnjNPE18u4YCTbLr8G0lGJnB9kXZegF9gsXtSXMMnI4n9Prp0K736Li/Zg665t1R9fv+Fh+EaHmX2Uiga+ABdLNSNwU/hpyUSdheAMgWGIWPODl368xWcc1pQaqyFxGGG9g8dY8sN8wXms4baIAHpUAFH/ucBdzvU2IVXmErlBrZINTE3hjhR7c6tskTwg
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM5PR0801MB2020.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(38070700005)(33656002)(54906003)(6916009)(508600001)(38100700002)(8676002)(71200400001)(66476007)(76116006)(64756008)(66556008)(4326008)(91956017)(66946007)(66446008)(6512007)(5660300002)(6506007)(6486002)(36756003)(53546011)(316002)(186003)(122000001)(2616005)(26005)(83380400001)(8936002)(86362001)(2906002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <2E6E57EEE5894A469830A949A30F7748@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB5981
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT059.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	d08e01b5-eea5-4034-0445-08da1d35b823
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	V0t5BkfAW6XTA7YfjyKLRfCLnZNP1oGaRacP5+CenbKRCwq8SmnD7cBjz0+m+Cbv5fn0GVj5l6oWhpQZAo1S3lo/KbaECnUAt6zwN//KQlQWIDRHtL9Wae3rii/wiHaxd9CR2jCqcPaMGCJgDo0xNM97QTutxSFWB4mLGBhfIM4FeSOKHrcTdNpThhoGrgNFs1osrjTBP47jjRuQeGGS8UH0JB54QCJYTq13PV8Lc5D+PVpCbOZijQS8hgWFkUH4Zki7vUZNeybFj+ihcHG+vxLDMJK+DKL1+20lyCTovo2D0AY8+uDOHvC47z35n1SCKcx0nUoZWoS4u+l8shC4bBFhbkvByprQRDPbIlxJOfYEQBPyCVFaEx51jK5pOhA5dTfMLg0DGjW3j5YL8kgNWPpRPiIhj5G5/AAAeTzAlqbifxC3JxvRgfzDRNaK4Q7tDxXISo/U4U4ZWPuq5LXeTjq61eO39uJ9B0UEzuYm21q0ruHyFWskmXcVKQf4gwz09htxACNi/9SX2PgBzFDEzSzG7k/HTolviG5oCgZByERp58aaYIaYZgYFS6AiL9CThFk99aRI0VQRyaOI4moz5vYXhJMPJSwcPEluEusOAZ1RBwVZBb7iNdI5o8HbbCBN0vP8W232vllnAlBO8xD4s7R5UIvbk/M6dN8HC6oVjXZyIX/1VrCv10wq6qIddnIy
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(46966006)(40470700004)(36840700001)(53546011)(6506007)(47076005)(26005)(6512007)(508600001)(6862004)(86362001)(8676002)(316002)(70586007)(54906003)(4326008)(83380400001)(40460700003)(8936002)(6486002)(70206006)(2616005)(186003)(336012)(81166007)(356005)(36860700001)(36756003)(82310400005)(33656002)(2906002)(5660300002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Apr 2022 10:09:52.4009
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 92e3aabf-2312-481c-9e35-08da1d35c05c
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT059.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB7144

SGVsbG8gSnVsaWVuLA0KDQo+IE9uIDEzIEFwciAyMDIyLCBhdCAxMDo0NCBhbSwgSnVsaWVuIEdy
YWxsIDxqdWxpZW5AeGVuLm9yZz4gd3JvdGU6DQo+IA0KPiBIaSBSYWh1bCwNCj4gDQo+IE9uIDEz
LzA0LzIwMjIgMDk6MjUsIFJhaHVsIFNpbmdoIHdyb3RlOg0KPj4+IE9uIDExIEFwciAyMDIyLCBh
dCA3OjAxIHBtLCBKdWxpZW4gR3JhbGwgPGp1bGllbkB4ZW4ub3JnPiB3cm90ZToNCj4+Pj4gU2ln
bmVkLW9mZi1ieTogUmFodWwgU2luZ2ggPHJhaHVsLnNpbmdoQGFybS5jb20+DQo+Pj4+IC0tLQ0K
Pj4+PiBkb2NzL2Rlc2lnbnMvZG9tMGxlc3MtZXZ0Y2huLm1kIHwgOTYgKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrDQo+Pj4+IDEgZmlsZSBjaGFuZ2VkLCA5NiBpbnNlcnRpb25zKCsp
DQo+Pj4+IGNyZWF0ZSBtb2RlIDEwMDY0NCBkb2NzL2Rlc2lnbnMvZG9tMGxlc3MtZXZ0Y2huLm1k
DQo+Pj4+IGRpZmYgLS1naXQgYS9kb2NzL2Rlc2lnbnMvZG9tMGxlc3MtZXZ0Y2huLm1kIGIvZG9j
cy9kZXNpZ25zL2RvbTBsZXNzLWV2dGNobi5tZA0KPj4+PiBuZXcgZmlsZSBtb2RlIDEwMDY0NA0K
Pj4+PiBpbmRleCAwMDAwMDAwMDAwLi42YTFiN2U4YzIyDQo+Pj4+IC0tLSAvZGV2L251bGwNCj4+
Pj4gKysrIGIvZG9jcy9kZXNpZ25zL2RvbTBsZXNzLWV2dGNobi5tZA0KPj4+PiBAQCAtMCwwICsx
LDk2IEBADQo+Pj4+ICsjIFNpZ25hbGluZyBzdXBwb3J0IGJldHdlZW4gdHdvIGRvbVVzIG9uIGRv
bTBsZXNzIHN5c3RlbQ0KPj4+PiArDQo+Pj4+ICsjIyBDdXJyZW50IHN0YXRlOuKAr0RyYWZ0IHZl
cnNpb24NCj4+Pj4gKw0KPj4+PiArIyMgUHJvcG9zZXIocyk6IFJhaHVsIFNpbmdoLCBCZXJ0cmFu
ZCBNYXJxdWlzDQo+Pj4+ICsNCj4+Pj4gKyMjIFByb2JsZW0gU3RhdGVtZW50Og0KPj4+PiArDQo+
Pj4+ICtUaGUgZ29hbCBvZiB0aGlzIHdvcmsgaXMgdG8gZGVmaW5lIGEgc2ltcGxlIHNpZ25hbGlu
ZyBzeXN0ZW0gYmV0d2VlbiBYZW4gZ3Vlc3RzDQo+Pj4+ICtpbiBkb20wbGVzcyBzeXN0ZW1zLg0K
Pj4+PiArDQo+Pj4+ICtJbiBkb20wbGVzcyBzeXN0ZW0sIHdlIGNhbm5vdCBtYWtlIHVzZSBvZiB4
ZW5idXMgYW5kIHhlbnN0b3JlIHRoYXQgYXJlIHVzZWQgaW4NCj4+Pj4gK25vcm1hbCBzeXN0ZW1z
IHdpdGggZHluYW1pYyBWTXMgdG8gY29tbXVuaWNhdGUgYmV0d2VlbiBkb21haW5zIGJ5IHByb3Zp
ZGluZyBhDQo+Pj4+ICtidXMgYWJzdHJhY3Rpb24gZm9yIHBhcmF2aXJ0dWFsaXplZCBkcml2ZXJz
Lg0KPj4+PiArDQo+Pj4+ICtPbmUgcG9zc2libGUgc29sdXRpb24gdG8gaW1wbGVtZW50IHRoZSBz
aWduYWxpbmcgc3lzdGVtIGJldHdlZW4gZG9tVXMgaXMgYmFzZWQNCj4+Pj4gK29uIGV2ZW50IGNo
YW5uZWxzLg0KPj4+PiArDQo+Pj4+ICsjIyBQcm9wb3NhbDoNCj4+Pj4gKw0KPj4+PiArRXZlbnQg
Y2hhbm5lbHMgYXJlIHRoZSBiYXNpYyBwcmltaXRpdmUgcHJvdmlkZWQgYnkgWGVuIGZvciBldmVu
dCBub3RpZmljYXRpb25zLg0KPj4+PiArQW4gZXZlbnQgY2hhbm5lbCBpcyBhIGxvZ2ljYWwgY29u
bmVjdGlvbiBiZXR3ZWVuIDIgZG9tYWlucyAobW9yZSBzcGVjaWZpY2FsbHkNCj4+Pj4gK2JldHdl
ZW4gZG9tMSxwb3J0MSBhbmQgZG9tMixwb3J0MikuIFRoZXkgZXNzZW50aWFsbHkgc3RvcmUgb25l
IGJpdCBvZg0KPj4+PiAraW5mb3JtYXRpb24sIHRoZSBldmVudCBvZiBpbnRlcmVzdCBpcyBzaWdu
YWxsZWQgYnkgdHJhbnNpdGlvbmluZyB0aGlzIGJpdCBmcm9tDQo+Pj4+ICswIHRvIDEuIEFuIGV2
ZW50IGlzIGFuIGVxdWl2YWxlbnQgb2YgYSBoYXJkd2FyZSBpbnRlcnJ1cHQuDQo+Pj4+ICsNCj4+
Pj4gK05vdGlmaWNhdGlvbnMgYXJlIHJlY2VpdmVkIGJ5IGEgZ3Vlc3QgdmlhIGFuIGludGVycnVw
dCBmcm9tIFhlbiB0byB0aGUgZ3Vlc3QsDQo+Pj4+ICtpbmRpY2F0aW5nIHdoZW4gYW4gZXZlbnQg
YXJyaXZlcyAoc2V0dGluZyB0aGUgYml0KS4NCj4+PiANCj4+PiBJIGFtIGEgYml0IGNvbmZ1c2Vk
IHdpdGggdGhlIGRlc2NyaXB0aW9uLiBBcmUgeW91IHRyeWluZyB0byBleHBsYWluIHRoZSBldmVu
dCBjaGFubmVsIGluIGxheW1hbiB0ZXJtPyBJZiBub3QsIHRoZW4gZXZlbnQgY2hhbm5lbCBwcm90
b2NvbCBpcyBtb3JlIGNvbXBsaWNhdGVkIHRoYW4gdGhhdCAoaW4gcGFydGljdWxhciBmb3IgZmlm
bykuDQo+PiBZZXMgSSBhbSB0cnlpbmcgdG8gZXhwbGFpbiB0aGUgZXZlbnQtY2hhbm5lbCBpbiBz
aW1wbGUgdGVybS4NCj4gDQo+IEkgd291bGQgc3VnZ2VzdCB0byBtYWtlIHRoYXQgY2xlYXIgYW5k
IGFsc28gcG9pbnQgdG8gdGhlIGRvY3VtZW50YXRpb24gZm9yIHRoZSBFdmVudCBDaGFubmVsIEFC
SSAod2UgaGF2ZSBhIGRvYyBmb3IgZmlmbyBhdCBsZWFzdCkuDQoNCkFjay4gDQo+IA0KPj4+PiAr
DQo+Pj4+ICtFdmVudCBjaGFubmVsIGNvbW11bmljYXRpb24gd2lsbCBiZSBlc3RhYmxpc2hlZCBz
dGF0aWNhbGx5IGJldHdlZW4gdHdvIGRvbVUNCj4+Pj4gK2d1ZXN0cyBiZWZvcmUgdW5wYXVzaW5n
IHRoZSBkb21haW5zIGFmdGVyIGRvbWFpbiBjcmVhdGlvbi4gRXZlbnQgY2hhbm5lbA0KPj4+PiAr
Y29ubmVjdGlvbiBpbmZvcm1hdGlvbiBiZXR3ZWVuIGRvbVVzIHdpbGwgYmUgcGFzc2VkIHRvIFhF
TiB2aWEgZGV2aWNlIHRyZWUNCj4+Pj4gK25vZGUuDQo+Pj4gDQo+Pj4gV2h5IGFyZSB3ZSBsaW1p
dGluZyBvdXJzZWxmIHRvIGRvbVVzPw0KPj4gQXMgdGhpcyBkZXNpZ24gaXMgZm9yIGEgZG9tMGxl
c3Mgc3lzdGVtIEkgbWVhbiBoZXJlIHRvIGFsbCB0aGUgZG9tYWlucyBvbiB0aGUgZG9tMGxlc3Mg
c3lzdGVtLg0KPj4gV2hhdCBJIHVuZGVyc3RhbmQgaXMgdGhhdCBhbGwgZG9tYWlucyBpbiB0aGUg
ZG9tMGxlc3Mgc3lzdGVtIGFyZSBjYWxsZWQgYXMgZG9tVXMuDQo+IA0KPiBJdCBkZXBlbmRzIG9u
IHdoZXRoZXIgYW4gYWRtaW4gbWF5IGhhdmUgc3BlY2lmaWMgYSBkb20wIGtlcm5lbC4gTG9va2lu
ZyBhdCBQZW5ueSBzZXJpZXMgdG8gaGFuZGxlIHNoYXJlZCBtZW1vcnksIGl0IHdpbGwgYmUgcG9z
c2libGUgdG8gY3JlYXRlIGEgc2hhcmVkIHJlZ2lvbiBiZXR3ZWVuIGRvbTAgYW5kIGEgZG9tMGxl
c3MgZG9tVS4gTW9zdCBsaWtlbHkgdGhlIHVzZXIgd2lsbCBhbHNvIHdhbnQgdG8gcHJvdmlkZSBh
IG5vdGlmaWNhdGlvbiBjb21tdW5pY2F0aW9uLg0KPiANCj4gU28gc2hvdWxkbid0IHdlIGFsc28g
cHJvdmlkZSBhIHdheSB0byBjcmVhdGUgYW4gZXZlbnQgY2hhbm5lbCBiZXR3ZWVuIGRvbTAgYW5k
IGFub3RoZXIgZG9tVT8NCg0KWWVzLCB3ZSBjYW4gY3JlYXRlIHRoZSBldmVudCBjaGFubmVsIGJl
dHdlZW4gZG9tMCBhbmQgZG9tMGxlc3MgZG9tVS4gSSB3aWxsIGFkZCB0aGlzIGluIHRoZSBuZXh0
IGRlc2lnbiBkb2MuDQoNClNvcnJ5IGZvciBub3QgZXhwbGFpbmluZyBpdCBjb3JyZWN0bHkgZWFy
bGllciBJIG1lYW4gdG8gc2F5IHRoYXQgYWxsIGRvbWFpbnMgKCBpbmNsdWRpbmcgdGhlIGRvbTAg
KSBpbiB0aGUgZG9tMGxlc3Mgc3lzdGVtIGNhbg0KaGF2ZSB0aGUgc3RhdGljIGV2ZW50IGNoYW5u
ZWwuICANCg0KUmVnYXJkcywNClJhaHVsDQoNCg==

