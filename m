Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B24B46C28F3
	for <lists+xen-devel@lfdr.de>; Tue, 21 Mar 2023 05:01:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.512187.791963 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1peTB9-00078l-GQ; Tue, 21 Mar 2023 04:00:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 512187.791963; Tue, 21 Mar 2023 04:00:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1peTB9-00076f-DD; Tue, 21 Mar 2023 04:00:55 +0000
Received: by outflank-mailman (input) for mailman id 512187;
 Tue, 21 Mar 2023 04:00:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=g8nM=7N=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1peTB8-00076Z-DY
 for xen-devel@lists.xenproject.org; Tue, 21 Mar 2023 04:00:54 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03on20623.outbound.protection.outlook.com
 [2a01:111:f400:7eaf::623])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f8b9c3fd-c79c-11ed-87f5-c1b5be75604c;
 Tue, 21 Mar 2023 05:00:52 +0100 (CET)
Received: from DB8PR06CA0004.eurprd06.prod.outlook.com (2603:10a6:10:100::17)
 by GV2PR08MB8100.eurprd08.prod.outlook.com (2603:10a6:150:7a::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37; Tue, 21 Mar
 2023 04:00:48 +0000
Received: from DBAEUR03FT059.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:100:cafe::2) by DB8PR06CA0004.outlook.office365.com
 (2603:10a6:10:100::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37 via Frontend
 Transport; Tue, 21 Mar 2023 04:00:48 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT059.mail.protection.outlook.com (100.127.142.102) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6222.15 via Frontend Transport; Tue, 21 Mar 2023 04:00:48 +0000
Received: ("Tessian outbound 2ba0ed2ebb9f:v135");
 Tue, 21 Mar 2023 04:00:48 +0000
Received: from f9cfb6e5e6ed.3
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 3AEB0655-E32B-435F-B159-DAB447982EF3.1; 
 Tue, 21 Mar 2023 04:00:39 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id f9cfb6e5e6ed.3
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 21 Mar 2023 04:00:39 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by AS8PR08MB8682.eurprd08.prod.outlook.com (2603:10a6:20b:564::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37; Tue, 21 Mar
 2023 04:00:36 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::f80a:7d16:3c36:8a03]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::f80a:7d16:3c36:8a03%4]) with mapi id 15.20.6178.037; Tue, 21 Mar 2023
 04:00:36 +0000
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
X-Inumbo-ID: f8b9c3fd-c79c-11ed-87f5-c1b5be75604c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UJskrjMcZrSEAEGhTrwn91eVNosNnQuC4RXr0Iur/Cs=;
 b=x0p5Jt2WwLJOeH4uaVGorEtRSeFxDOfOGTyXXmuUmtNX4zQjBn9wsH/ePAvpOGE3GRN3YuMFE+fs/02fk/yEJaNExlze2PrgWG/WgwogDnQoNHTp3WuJ5Xg31FBY1TadiABh0CjNYhTV2kFTujjXq2MMXzgqhFRSofAt605tKgY=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZtZq0HTSRuSpWR1P5mG/qVQZTARErncwn2+SgruUDj4aq8h8vrOUyweNsOD4J03ikfkTuPyBXrskGIisJtVQJJDPeXDWMOI8JlKwgJd6W5/OvphIFH7LCU11PzL4zfOqELftmnz8BbWlYCNcN0gEJp5/3XyKnchP8xi7nXvPRuE7DmAVJIDwpyfO7DlFVICqk55M0mTLzkLYe1Hi6VkQviVCbo54DFOdx9h3Dv6bc44cg7WJY3fjqTU0kmg+bzO+r0gSPOhU17sy/s3ioxn5kyPY9cr4/6QzMkn8SVVUTMYMURf5EhojnvgWgUyUBst+oYV2TWgltNSC4uGARyhLpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UJskrjMcZrSEAEGhTrwn91eVNosNnQuC4RXr0Iur/Cs=;
 b=Vz6UBDmKrmbfwOUsOyN9YbxiS4icwcrx5e4MZxqqpnd/v8YA5eG0pGjXGRBP1b+JqCT5vAsoPALy3qpvUIM2gJlLzuUfHPJ4rfEOun7xmrXIxHUF2pzzpYn8FNctS8ntspCq18/XQamEJSNexAMkuQbdq4USaL8fcxI3rdhgd5j+rMpQnmwcHLm4QyquaBFk9Yg7ma+npnPb5czsOBzmFE77TVVCD8W/PQlfuBK0SDPFlZexJiz7+YzYmDYCyu6eoC1M3lT1CY0uwvqFXYDjpH2Lf6nDNvA1B/nnshtDM76wsxo4y/ICQmzkSakyHpXMeVza0fm6RSTuW6qHZtSwMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UJskrjMcZrSEAEGhTrwn91eVNosNnQuC4RXr0Iur/Cs=;
 b=x0p5Jt2WwLJOeH4uaVGorEtRSeFxDOfOGTyXXmuUmtNX4zQjBn9wsH/ePAvpOGE3GRN3YuMFE+fs/02fk/yEJaNExlze2PrgWG/WgwogDnQoNHTp3WuJ5Xg31FBY1TadiABh0CjNYhTV2kFTujjXq2MMXzgqhFRSofAt605tKgY=
From: Henry Wang <Henry.Wang@arm.com>
To: Julien Grall <julien@xen.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Wei Chen <Wei.Chen@arm.com>,
	Bertrand Marquis <Bertrand.Marquis@arm.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Henry Wang <Henry.Wang@arm.com>
Subject: RE: [PATCH v2 3/4] xen/arm: Defer GICv2 CPU interface mapping until
 the first access
Thread-Topic: [PATCH v2 3/4] xen/arm: Defer GICv2 CPU interface mapping until
 the first access
Thread-Index: AQHZNGBES9GND13bPU+mzqer9SysH68EWvQAgACL1MCAAAODEA==
Date: Tue, 21 Mar 2023 04:00:35 +0000
Message-ID:
 <AS8PR08MB7991EBC30CCEACFE7DBEBE3292819@AS8PR08MB7991.eurprd08.prod.outlook.com>
References: <20230130040614.188296-1-Henry.Wang@arm.com>
 <20230130040614.188296-4-Henry.Wang@arm.com>
 <e2421c2d-6ae1-bf70-530d-0683d943f519@xen.org>
 <AS8PR08MB799142447DF4749065ABAF5992819@AS8PR08MB7991.eurprd08.prod.outlook.com>
In-Reply-To:
 <AS8PR08MB799142447DF4749065ABAF5992819@AS8PR08MB7991.eurprd08.prod.outlook.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: FED937253BF12C459DCDE6A0A0D7AF80.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7991:EE_|AS8PR08MB8682:EE_|DBAEUR03FT059:EE_|GV2PR08MB8100:EE_
X-MS-Office365-Filtering-Correlation-Id: 2d1d650b-80e6-4e37-e598-08db29c0db05
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 M48MtzT1jJtld5VNo/oZfoEX6UgVUbjoIVdhDyjSycRtvNyLA9ggWwdbeCPLn5cx0cb715NicRSlspBLDMkOh9X1t1N02r3ByI6VZI8WUdb6Q6nqCyDpWb0UMQ9jp0TFY86Tgrv4EgKezHKARKvQ6CUmU5gUuXzEC1BzZ8aej43heWye3XZ5+s/wgAXIhGUMASVVaj1Lk0l5y/bgsfzngquRApLOBuyLnf7wxpBb+6d0Og2l4s0Hl0HS0UFPVJCigLJwvnAFrq7CQ42SSi4Avlu3XVJtsmiL0G/jCSyiBrsKyiSmOvXrkOqoaStNvDt6kkYLL9KbRwmLJMqJLjV8LyVxRctNUB0MdN1mvUU9KB0nWgsEjphcUPdoS7VdAS1IoADy8Uz0VRT6q7/wPJmYMB1m3w86VnhoFp/ygzr+KlWg6ZOdU1P0lEHPFqXgXrt5wXNnuIPUN36GT8PVp9t5UwCUW6+xY/IL7Zt/nxysXKevp/5CJwdHCDIbcbyupApScRWC4tb3ZvZ/c9N6MroZDeSTcJR0HXmaOWxH0wAsesYx0miX4p2xrBfK7mnabEwXpJB0mI2M7V3beSkLygiiRriHI1ao7h8Fif7DTnAK5Kc0XPgelNOL0ZWRJP5FoaDRMwv7OWNhHVqA81tWLZmwBKsN8pfGPyfe42kUtgTpY89Kbb5hlDqdrgZ/B/Dfl9lxRpQSfwecwM8W/+CBGtxZvw==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(346002)(396003)(366004)(39860400002)(376002)(136003)(451199018)(8936002)(5660300002)(4744005)(41300700001)(52536014)(55016003)(86362001)(38070700005)(33656002)(38100700002)(2906002)(122000001)(4326008)(478600001)(71200400001)(7696005)(2940100002)(186003)(6506007)(26005)(9686003)(54906003)(110136005)(66476007)(316002)(8676002)(66556008)(66946007)(64756008)(76116006)(66446008);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB8682
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT059.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	feebd4f6-7825-4dd1-8e63-08db29c0d364
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	y0XEEpg3R2d4yz2iusLuqU3XlnSya/633Ed6zFDtdUuP+sAywwvUSrbvXh8rkIl/lqsvZm2AfJKo1PCFfRdnqWKuFwCP0kVV/6aXnaew8j1otAMxcPofeG7sUELLujGwYMd+xEE5dw1pIcf9/j4TluFwxJIvcz8MeEQaysyBbCjZmcxLo5fXvRphDhvtWoExYxmUvTVXB26sZPstE5uCbEkPrvw1MXBXwMHBIkD6haHKatW2glJm7smBgLFtJT0wVDjwHhoFtyJpHpF6dzjYZNmobq9SCIW+HoseB4zmOOgaQ14H/urZaZjNgQGDYNkizhSK+CPV0987/OLMTcev4sxQru2K8Q/cBLwlLE/j2RBvrGZc1f/QpHxr8d9Z1lZ0JZgJTyVMsgs/pFuEd9D0VudyjVwI8Pz31QiYODnP2CJG7W3ZDJXaP8R2suslG3rzBJ8XB3Hp3WPBvWlLkbhToWRmKeUpNNzNCPMfug3iqa/kHKfR9yumThwcETOExG/M2/inbazN7KERoNCTTaIw5AzONfg0AkvcHMSKh5GZ/kl44z9huLH1kVjNeMtcmgsH4KXZYxhb5C28fHlL/RJYwmimn6Q0Wlv0/ItlsJmsH2yEWmyKs2c1tdgRWuT3MWXF6Y5mE2NdgW+ok6Oymx7VVMnYuzXIHwF93GLka20Zz9U5PAwDrPFdbAt/furAsE/LG3DRdTIy7D9mCuA08DRXvA==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230025)(4636009)(39860400002)(346002)(376002)(396003)(136003)(451199018)(36840700001)(46966006)(40470700004)(82310400005)(47076005)(2940100002)(86362001)(82740400003)(336012)(81166007)(55016003)(110136005)(356005)(36860700001)(40460700003)(8936002)(4326008)(8676002)(2906002)(70206006)(70586007)(52536014)(41300700001)(40480700001)(4744005)(316002)(5660300002)(26005)(33656002)(478600001)(9686003)(186003)(6506007)(54906003)(7696005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Mar 2023 04:00:48.7957
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d1d650b-80e6-4e37-e598-08db29c0db05
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT059.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR08MB8100

SGksDQoNCj4gQ29uc2lkZXJpbmcgdGhhdCB0aGUgQ1BVIGludGVyZmFjZSBpcyBjb250aW51b3Vz
IChJIHN1cHBvc2UpLCBJIGhhdmUgdHdvDQo+IHdheXMgb2YgcmV3cml0aW5nIHRoZSBnZm4gY2hl
Y2ssIHdlIGNhbiBkbyBlaXRoZXI6DQo+IA0KPiBnZm5fZXEoZ2ZuLCBnYWRkcl90b19nZm4oZC0+
YXJjaC52Z2ljLmNiYXNlKSkgfHwNCj4gZ2ZuX2VxKGdmbiwgZ2ZuX2FkZChnYWRkcl90b19nZm4o
ZC0+YXJjaC52Z2ljLmNiYXNlKSwgMSkpDQo+IA0KPiBvcg0KPiANCj4gZ2ZuX3RvX2dhZGRyKGdm
bikgPj0gZC0+YXJjaC52Z2ljLmNiYXNlIHx8DQo+IGdmbl90b19nYWRkcihnZm4pIDwgZC0+YXJj
aC52Z2ljLmNiYXNlICsgZC0+YXJjaC52Z2ljLmNzaXplDQoNCk9vcHMsIGNvcHkgcGFzdGUgZXJy
b3IsIHRoaXMgc2hvdWxkIGJlIA0KDQpnZm5fdG9fZ2FkZHIoZ2ZuKSA+PSBkLT5hcmNoLnZnaWMu
Y2Jhc2UgJiYNCmdmbl90b19nYWRkcihnZm4pIDwgZC0+YXJjaC52Z2ljLmNiYXNlICsgZC0+YXJj
aC52Z2ljLmNzaXplDQoNCktpbmQgcmVnYXJkcywNCkhlbnJ5DQo=

