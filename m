Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A0FB6C4048
	for <lists+xen-devel@lfdr.de>; Wed, 22 Mar 2023 03:21:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.513066.793521 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1peo6Z-0004jl-Ou; Wed, 22 Mar 2023 02:21:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 513066.793521; Wed, 22 Mar 2023 02:21:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1peo6Z-0004hE-MD; Wed, 22 Mar 2023 02:21:35 +0000
Received: by outflank-mailman (input) for mailman id 513066;
 Wed, 22 Mar 2023 02:21:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UaYW=7O=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1peo6Y-0004h8-9I
 for xen-devel@lists.xenproject.org; Wed, 22 Mar 2023 02:21:34 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on0622.outbound.protection.outlook.com
 [2a01:111:f400:fe0d::622])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4279734b-c858-11ed-85db-49a42c6b2330;
 Wed, 22 Mar 2023 03:21:31 +0100 (CET)
Received: from AM6P192CA0100.EURP192.PROD.OUTLOOK.COM (2603:10a6:209:8d::41)
 by PAWPR08MB8840.eurprd08.prod.outlook.com (2603:10a6:102:339::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37; Wed, 22 Mar
 2023 02:21:28 +0000
Received: from AM7EUR03FT035.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:8d:cafe::a2) by AM6P192CA0100.outlook.office365.com
 (2603:10a6:209:8d::41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37 via Frontend
 Transport; Wed, 22 Mar 2023 02:21:28 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT035.mail.protection.outlook.com (100.127.141.24) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6222.17 via Frontend Transport; Wed, 22 Mar 2023 02:21:26 +0000
Received: ("Tessian outbound f2a8d6d66d12:v135");
 Wed, 22 Mar 2023 02:21:26 +0000
Received: from e467c43e15f7.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 494C51E2-3D69-4FBB-AD05-AF91679B3BE3.1; 
 Wed, 22 Mar 2023 02:21:16 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id e467c43e15f7.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 22 Mar 2023 02:21:16 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by AS8PR08MB9696.eurprd08.prod.outlook.com (2603:10a6:20b:614::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37; Wed, 22 Mar
 2023 02:21:14 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::f80a:7d16:3c36:8a03]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::f80a:7d16:3c36:8a03%4]) with mapi id 15.20.6178.037; Wed, 22 Mar 2023
 02:21:13 +0000
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
X-Inumbo-ID: 4279734b-c858-11ed-85db-49a42c6b2330
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5YANSb+1dILny/uitSvvBZZbQO6b+qpyxq3gSZbc+oM=;
 b=QPfqt3XfxG039k2LS3nn+RGPQEmku0W5MoTJNEy534gQTpWd4wg9nT7v7tY3f1jIX0G21bpOHMTfiitaXtJ9C+dJudrhhfdj3X2Lek3GO7WDyBnZp9uaQiFTjKlvR6cKpvOj9ZFl/WKw/VQVPnLKwyx9mDumaMHcvbRa++UywoM=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jSozDFuifPmER5GxgS95+0O3O3j0UAVDTWKFMLs3FCEaySGLTjZmX/KADh23fBFx2OB+CdKkXV6TMOhuGjojeJBh3rq0ATfLXDVp7yoZvCYTOEBmDdVnhq0naJt4AFJ6H/ebKy0vQvLwriHXk1NGVKB93zS36/zpFSW8Kw8Q3SGQNRBjoPm/+uTXRC672OYMG5HS1yT5EE8gHVsTSP8QaOEEAX0oiyWupm7VWMgni+vCtjRBnsWlC601Ykk+inOdrGCh6bbNUILcOzCmPBieL+oHD9BTr9f83GdsheikuS1TdyDyywq2QqvsoYy32x5CBNwlFpC393pcF5EMqrltUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5YANSb+1dILny/uitSvvBZZbQO6b+qpyxq3gSZbc+oM=;
 b=B3Yynb/OJT7Q07hX2aDvu1cNt/lXEax4mB6eExiXAHKXOyPEA+D+JyijJrFUdQnOTV4791kgxNTSpV44Tafhq0TADuKp1NLEL7k83X3jgMM3xg4NzQWkxCJzeRkwHfMcqGgTHcquN223KzI08wsFmxbdD8mV8YlJee8Qb3hoRAhHkflx6xHmtn0eC/M2RfFeMWeaDjk8vMIB78HTIUnfaPhnZ3woGgTioA65FACFwbA77RSCnLP7pT3IXqb5ZP3QtciqVhJqDP5t/7e979pIsCUBzGhhk+pqOpxgsAHXeTRJxbJHGa6htUdJXqWt+7srzzYJN+MY0af8GXBImUwM7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5YANSb+1dILny/uitSvvBZZbQO6b+qpyxq3gSZbc+oM=;
 b=QPfqt3XfxG039k2LS3nn+RGPQEmku0W5MoTJNEy534gQTpWd4wg9nT7v7tY3f1jIX0G21bpOHMTfiitaXtJ9C+dJudrhhfdj3X2Lek3GO7WDyBnZp9uaQiFTjKlvR6cKpvOj9ZFl/WKw/VQVPnLKwyx9mDumaMHcvbRa++UywoM=
From: Henry Wang <Henry.Wang@arm.com>
To: Julien Grall <julien@xen.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, Michal Orzel <michal.orzel@amd.com>
CC: Stefano Stabellini <sstabellini@kernel.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
Subject: RE: [PATCH v2 4/4] xen/arm: Clean-up in p2m_init() and
 p2m_final_teardown()
Thread-Topic: [PATCH v2 4/4] xen/arm: Clean-up in p2m_init() and
 p2m_final_teardown()
Thread-Index: AQHZNGBFU1FB2zU45UWPsIKl0/PSm68FsPqAgACrD/A=
Date: Wed, 22 Mar 2023 02:21:12 +0000
Message-ID:
 <AS8PR08MB7991321C63BE43F1C54D21E092869@AS8PR08MB7991.eurprd08.prod.outlook.com>
References: <20230130040614.188296-1-Henry.Wang@arm.com>
 <20230130040614.188296-5-Henry.Wang@arm.com>
 <a2287b5b-40b1-aeab-8f07-413853d2484d@xen.org>
In-Reply-To: <a2287b5b-40b1-aeab-8f07-413853d2484d@xen.org>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 70D57D6502E6CC439CE8095EA612E6F5.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7991:EE_|AS8PR08MB9696:EE_|AM7EUR03FT035:EE_|PAWPR08MB8840:EE_
X-MS-Office365-Filtering-Correlation-Id: 207df8a1-d6c2-44c1-5587-08db2a7c23f1
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 w1vhsXnI3WcIsV6EqDC6DGrNvmdSwx6TBniDJNx42WDf4jkYo4mDFUYisJH7gZ8voPjFVcr8LW1vAaucPmvPlo5ZHuLVsTdMtTWF3ShEG1mBHB0ZKUmrQcSIlmNp912XaXZ7bAsS4B8D/wyaN6O4EGdmYUdaLtjIhYMPzz539hAi7y+fDE7G0jjg3stkl2Tpiwe4Kph1i7OXhP/IKPWcCluSC2YOUDrB8c56bEcX6dPH6zRb72kxlMKyPA+zNOgnAXKVuY3AoBiq2gbzskbtocC7zG6m7eytnIC9u6x9qQRO28kDV4wAc70TV5ZPjsi83VJv/PgSa+25v4IkPPiFYLC2TieVn7+Apzcgm8Ae194wcOQbNWbHPAxL9h2ybdi3M2qGidX/uFS20v9ECteE7Pek3sEfpKaoYaEg7b1KpaihwMzOp+xNfUHEaLL5iSd4ZN8qmHdblmDGgprk8GRiVf0YipIMcd5ZDP6f5xZMF1munzGqmeRFsFooGBNUX3pmD6YHqO8Xz14DYiKQPvCQuwCWEmK25QuA47o0iBW+n/+uwD9qoVkM31GreCVbPrmbr2/R3rPHxFHGHFx5myGczFZiMqI4yfEwL8kMoX+asRCLwiqtdoZCLNcNeb2Gmody+QQOan13224C9KTQRcLH0n9V5uQfo/PiBSMfooFBU+dUMP11VpI6H6pXAMx0aSBbsErVhCYN78a9mXLoq+cFlw==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(366004)(376002)(346002)(136003)(39860400002)(396003)(451199018)(110136005)(6506007)(26005)(64756008)(4326008)(52536014)(76116006)(316002)(66556008)(71200400001)(83380400001)(186003)(66476007)(9686003)(66946007)(54906003)(478600001)(8676002)(66446008)(8936002)(5660300002)(122000001)(2906002)(41300700001)(7696005)(38070700005)(38100700002)(86362001)(55016003)(33656002);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB9696
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT035.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	6d4ee0ea-db1c-4266-e4b6-08db2a7c1b93
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Ob8MyBrbpP4kgSIvPoWU0Dv60bKav2bDQLJyTGUuXy0OHHK97d4CZGyAhZTBuA8uE48Xhwu2RxyxU7Upbcgk+M14Bz1b6L1ObKVhdpK3ieP4yGfxCbLqKBdftBe8Zir/inmr8uhrhBvjmOEzTKq0cZS5TqN8aBSCLnTs5Qg1TDmNA+hiCrwBqZYggSg8UgBzBZ6rNHSGRlSJDtTHvfskavG1fF+LKCikXY/42bFp2Z0wS1fYPHj1qoGpMLEcqUmwwmVCZxUrGn/nGAsIzZGE73hqCMPBV7+/rwmY0N/yTk7pJGEByLPl63I5ljyvq5JZ+XQgUE9ksognnVx28jEuRgcUOZYvGePcifDM2Rv5IhFWmL4rde7adXljCzpaCIYMnWVtcCrT5aBwPnkm6wk4NLx95QfzuI8nIKTHM40RCRt2QfVdi+DTXJjkde3xnzL8tpFrGpJ4rfuVRgXWiDkK+gJPIwr9MD5qBbq9JMD1TWF6ap845luGqX6cm9fj2zit4xhXg73V8b+FXKxT88ZdFgt+YzGabTrXVNAHPmENfZ+kQIWtkscStOIZskyd2lgfLM8uhrdo36LgWrUrnYIskxEeRR65dG3eDcfAiZHv+OWTnLqnIayuUjck61EqDANvoqS07YigMNWbK7kSPqBN2bNsa3uuXSiuUj6E4I57pgPm/hgLyAaEqrA59HErs1OJxS8aE8DSUGIT6nuW8ELE9Q==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230025)(4636009)(346002)(396003)(376002)(39860400002)(136003)(451199018)(46966006)(40470700004)(36840700001)(186003)(107886003)(356005)(336012)(6506007)(26005)(9686003)(110136005)(7696005)(40480700001)(316002)(47076005)(81166007)(478600001)(2906002)(86362001)(40460700003)(82740400003)(82310400005)(83380400001)(55016003)(54906003)(33656002)(4326008)(5660300002)(8936002)(41300700001)(8676002)(52536014)(36860700001)(70586007)(70206006);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Mar 2023 02:21:26.9918
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 207df8a1-d6c2-44c1-5587-08db2a7c23f1
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT035.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR08MB8840

SGkgSnVsaWVuLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEp1bGll
biBHcmFsbCA8anVsaWVuQHhlbi5vcmc+DQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjIgNC80XSB4
ZW4vYXJtOiBDbGVhbi11cCBpbiBwMm1faW5pdCgpIGFuZA0KPiBwMm1fZmluYWxfdGVhcmRvd24o
KQ0KPiANCj4gSGkgSGVucnksDQo+IA0KPiA+IC0tLQ0KPiA+IEkgYW0gbm90IGVudGlyZWx5IHN1
cmUgaWYgSSBzaG91bGQgYWxzbyBkcm9wIHRoZSAiVE9ETyIgb24gdG9wIG9mDQo+ID4gdGhlIHAy
bV9zZXRfZW50cnkoKS4gQmVjYXVzZSBhbHRob3VnaCB3ZSBhcmUgc3VyZSB0aGVyZSBpcyBubw0K
PiA+IHAybSBwYWdlcyBwb3B1bGF0ZWQgaW4gZG9tYWluX2NyZWF0ZSgpIHN0YWdlIG5vdywgYnV0
IHdlIGFyZSBub3QNCj4gPiBzdXJlIGlmIGFueW9uZSB3aWxsIGFkZCBtb3JlIGluIHRoZSBmdXR1
cmUuLi5BbnkgY29tbWVudHM/DQo+IA0KPiBJIHdvdWxkIGtlZXAgaXQuDQoNClN1cmUuDQoNCj4g
DQo+ID4gQEAgLTIwMCwxMCArMjAwLDYgQEAgaW50IHAybV9pbml0KHN0cnVjdCBkb21haW4gKmQp
Ow0KPiA+ICAgICogIC0gcDJtX2ZpbmFsX3RlYXJkb3duKCkgd2lsbCBiZSBjYWxsZWQgd2hlbiBk
b21haW4gc3RydWN0IGlzIGJlZW4NCj4gPiAgICAqICAgIGZyZWVkLiBUaGlzICpjYW5ub3QqIGJl
IHByZWVtcHRlZCBhbmQgdGhlcmVmb3JlIG9uZSBzbWFsbA0KPiANCj4gTklUOiBBcyB5b3UgYXJl
IHRvdWNoaW5nIHRoZSBjb21tZW50LCB3b3VsZCB5b3UgbWluZCB0byBmaXggdGhlIHR5cG8NCj4g
cy9vbmUvb25seS8uDQoNCkkgd291bGQgYmUgbW9yZSB0aGFuIGhhcHB5IHRvIGZpeCBpdC4gVGhh
bmtzIGZvciBub3RpY2luZyB0aGlzIDopDQoNCj4gDQo+ID4gLSAgICBCVUdfT04ocDJtX3RlYXJk
b3duKGQsIGZhbHNlKSk7DQo+IA0KPiBXaXRoIHRoaXMgY2hhbmdlLCBJIHRoaW5rIHdlIGNhbiBh
bHNvIGRyb3AgdGhlIHNlY29uZCBwYXJhbWV0ZXIgb2YNCj4gcDJtX3RlYXJkb3duKCkuIFByZWZl
cmFibHkgd2l0aCB0aGlzIGNoYW5nZSBpbiB0aGUgcGF0Y2g6DQoNClllcyBpbmRlZWQsIEkgd2Fz
IGFsc28gdGhpbmtpbmcgb2YgdGhpcyB3aGVuIHdyaXRpbmcgdGhpcyBwYXRjaCBidXQgaW4NCnRo
ZSBlbmQgZGVjaWRlZCB0byBkbyBtaW5pbWFsIGNoYW5nZS4uDQoNCj4gDQo+IEFja2VkLWJ5OiBK
dWxpZW4gR3JhbGwgPGpncmFsbEBhbWF6b24uY29tPg0KDQpUaGFua3MhIEkgYW0gbm90IDEwMCUg
Y29tZm9ydGFibGUgdG8gdGFrZSB0aGlzIHRhZyBiZWNhdXNlIEkgbWFkZQ0Kc29tZSBleHRyYSBj
b2RlIGNoYW5nZSwgYmVsb3cgaXMgdGhlIGRpZmYgdG8gZHJvcCB0aGUgc2Vjb25kIHBhcmFtDQpv
ZiBwMm1fdGVhcmRvd24oKToNCg0KZGlmZiAtLWdpdCBhL3hlbi9hcmNoL2FybS9kb21haW4uYyBi
L3hlbi9hcmNoL2FybS9kb21haW4uYw0KQEAgLTEwMzAsNyArMTAzMCw3IEBAIGludCBkb21haW5f
cmVsaW5xdWlzaF9yZXNvdXJjZXMoc3RydWN0IGRvbWFpbiAqZCkNCiAgICAgICAgIHAybV9jbGVh
cl9yb290X3BhZ2VzKCZkLT5hcmNoLnAybSk7DQoNCiAgICAgUFJPR1JFU1MocDJtKToNCi0gICAg
ICAgIHJldCA9IHAybV90ZWFyZG93bihkLCB0cnVlKTsNCisgICAgICAgIHJldCA9IHAybV90ZWFy
ZG93bihkKTsNCiAgICAgICAgIGlmICggcmV0ICkNCiAgICAgICAgICAgICByZXR1cm4gcmV0Ow0K
DQpkaWZmIC0tZ2l0IGEveGVuL2FyY2gvYXJtL2luY2x1ZGUvYXNtL3AybS5oIGIveGVuL2FyY2gv
YXJtL2luY2x1ZGUvYXNtL3AybS5oDQpAQCAtMjAxLDcgKzIwMSw3IEBAIGludCBwMm1faW5pdChz
dHJ1Y3QgZG9tYWluICpkKTsNCiAgKiAgICBmcmVlZC4gVGhpcyAqY2Fubm90KiBiZSBwcmVlbXB0
ZWQgYW5kIHRoZXJlZm9yZSBvbmx5IHNtYWxsDQogICogICAgcmVzb3VyY2VzIHNob3VsZCBiZSBm
cmVlZCBoZXJlLg0KICAqLw0KLWludCBwMm1fdGVhcmRvd24oc3RydWN0IGRvbWFpbiAqZCwgYm9v
bCBhbGxvd19wcmVlbXB0aW9uKTsNCitpbnQgcDJtX3RlYXJkb3duKHN0cnVjdCBkb21haW4gKmQp
Ow0KIHZvaWQgcDJtX2ZpbmFsX3RlYXJkb3duKHN0cnVjdCBkb21haW4gKmQpOw0KDQpkaWZmIC0t
Z2l0IGEveGVuL2FyY2gvYXJtL3AybS5jIGIveGVuL2FyY2gvYXJtL3AybS5jDQotaW50IHAybV90
ZWFyZG93bihzdHJ1Y3QgZG9tYWluICpkLCBib29sIGFsbG93X3ByZWVtcHRpb24pDQoraW50IHAy
bV90ZWFyZG93bihzdHJ1Y3QgZG9tYWluICpkKQ0KIHsNClsuLi5dDQogICAgICAgICAvKiBBcmJp
dHJhcmlseSBwcmVlbXB0IGV2ZXJ5IDUxMiBpdGVyYXRpb25zICovDQotICAgICAgICBpZiAoIGFs
bG93X3ByZWVtcHRpb24gJiYgIShjb3VudCAlIDUxMikgJiYgaHlwZXJjYWxsX3ByZWVtcHRfY2hl
Y2soKSApDQorICAgICAgICBpZiAoICEoY291bnQgJSA1MTIpICYmIGh5cGVyY2FsbF9wcmVlbXB0
X2NoZWNrKCkgKQ0KDQpJZiB5b3UgYXJlIGhhcHB5LCBJIHdpbGwgdGFrZSB0aGlzIGFja2VkLWJ5
LiBTYW1lIHF1ZXN0aW9uIHRvIE1pY2hhbCBmb3IgaGlzDQpSZXZpZXdlZC1ieS4NCg0KS2luZCBy
ZWdhcmRzLA0KSGVucnkNCg0KPiANCj4gUHJlZmVyYWJseSwgSSB3b3VsZCBsaWtlIHRoaXMgdG8g
aGFwcGVuIGluIHRoaXMgcGF0Y2guDQo+IA0KPiBDaGVlcnMsDQo+IA0KPiAtLQ0KPiBKdWxpZW4g
R3JhbGwNCg==

