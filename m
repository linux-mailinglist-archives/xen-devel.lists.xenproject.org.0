Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F66D763B5E
	for <lists+xen-devel@lfdr.de>; Wed, 26 Jul 2023 17:41:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.570557.892433 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qOgdU-0004Po-Ec; Wed, 26 Jul 2023 15:41:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 570557.892433; Wed, 26 Jul 2023 15:41:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qOgdU-0004NN-By; Wed, 26 Jul 2023 15:41:12 +0000
Received: by outflank-mailman (input) for mailman id 570557;
 Wed, 26 Jul 2023 15:41:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jA8X=DM=arm.com=Rahul.Singh@srs-se1.protection.inumbo.net>)
 id 1qOgdT-0004NH-7m
 for xen-devel@lists.xenproject.org; Wed, 26 Jul 2023 15:41:11 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on20627.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::627])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d6b0bf32-2bca-11ee-b242-6b7b168915f2;
 Wed, 26 Jul 2023 17:41:08 +0200 (CEST)
Received: from DB9PR02CA0021.eurprd02.prod.outlook.com (2603:10a6:10:1d9::26)
 by AM9PR08MB5907.eurprd08.prod.outlook.com (2603:10a6:20b:2da::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.29; Wed, 26 Jul
 2023 15:41:05 +0000
Received: from DBAEUR03FT021.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:1d9:cafe::a6) by DB9PR02CA0021.outlook.office365.com
 (2603:10a6:10:1d9::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.29 via Frontend
 Transport; Wed, 26 Jul 2023 15:41:05 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT021.mail.protection.outlook.com (100.127.142.184) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6631.29 via Frontend Transport; Wed, 26 Jul 2023 15:41:04 +0000
Received: ("Tessian outbound f9124736ff4f:v145");
 Wed, 26 Jul 2023 15:41:04 +0000
Received: from 586bf998e5a3.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 BD2ED1A4-EB80-426A-8863-B6F2807F1993.1; 
 Wed, 26 Jul 2023 15:40:58 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 586bf998e5a3.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 26 Jul 2023 15:40:58 +0000
Received: from AS8PR08MB7158.eurprd08.prod.outlook.com (2603:10a6:20b:404::24)
 by AS8PR08MB8897.eurprd08.prod.outlook.com (2603:10a6:20b:5b8::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.29; Wed, 26 Jul
 2023 15:40:55 +0000
Received: from AS8PR08MB7158.eurprd08.prod.outlook.com
 ([fe80::845:4a4f:5c99:2788]) by AS8PR08MB7158.eurprd08.prod.outlook.com
 ([fe80::845:4a4f:5c99:2788%3]) with mapi id 15.20.6631.026; Wed, 26 Jul 2023
 15:40:55 +0000
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
X-Inumbo-ID: d6b0bf32-2bca-11ee-b242-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HiPVImh54WcPda150a82xUPDrANFLQnSjE/Im/HPrG0=;
 b=7zk8GFdixmwbFe7OFyHimdPJmFKr+iMQJ6eUpQ4o0/VwXWKIUsNF78I03DBY48YvRC6wC+1fik9DbbUchf6FgzQu8NNPN5MJj9jhNekoOthKNOzFx/kaMgP3dzrsKLdLEJ+JfXZ2eWM1dHoCTV0Y07X95pP40ZibrCSDX3Fusmo=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 332b62812d23cc47
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QF/9jetbFdYsieSnTr1edlWQ3egXewbEtoIem1C2o3JELysK3UZjb15K22ukVretBqY4yEBNpiDd0a/w6R10pyHCMJXJfFs36Tp0lBxNX/7MEc1sx64lCTYmyrTpIFDnLT2Z3yH6DxEdMJhVA7JN5CO8sqknSXjAfhJLW0b0lzaP4qLdl5FiX+/pqpwtQ3aowmajvXBOAL6YV3Rb0PIGX8hkLpAH3rcpBbwtpkvmdVFbqAkH2NJLWuZNWTBq8nlVNPuJ5WoaBVy3BU+nJpbARQhFNB4+E/UfmwZiKQbaruzlsPce/YiAIG+7Ycr8kAmWQYbbbOmEqWGMhBesMPMQIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HiPVImh54WcPda150a82xUPDrANFLQnSjE/Im/HPrG0=;
 b=DdglyCVn4DAuEd5TXszERbHFwqr9QiR7q/U7Uy9FijnQpYghTTb4gRmA+qWlW5Yzb3b2/8xYfDs2j1vG/dULgS6Z/cIlMyBBYQh3DgMXCEh/z4nUPifZDs+hIYpK8WQskb/yrG/JneiJCms/e9e59VVW00qMUVWUjpA/jLVeT8d3QIquuXPLG2CeNW+tiYyMZdQu8z/yNM7iBZxKWfHlEA/nng44DPhEteEo5VfmvybrdJuzNJPlBZb6xw0X4O/nM44kiAeOAZgxqkBtttBqiNCualyaXABUzOyk9IibVHGclbUdDIsPy4lRaeqXrAx+cFQqCb8N3LLC5/cLv4Jh2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HiPVImh54WcPda150a82xUPDrANFLQnSjE/Im/HPrG0=;
 b=7zk8GFdixmwbFe7OFyHimdPJmFKr+iMQJ6eUpQ4o0/VwXWKIUsNF78I03DBY48YvRC6wC+1fik9DbbUchf6FgzQu8NNPN5MJj9jhNekoOthKNOzFx/kaMgP3dzrsKLdLEJ+JfXZ2eWM1dHoCTV0Y07X95pP40ZibrCSDX3Fusmo=
From: Rahul Singh <Rahul.Singh@arm.com>
To: Roger Pau Monne <roger.pau@citrix.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Jan Beulich
	<jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu
	<wl@xen.org>, "Daniel P. Smith" <dpsmith@apertussolutions.com>
Subject: Re: [PATCH v2] vpci: add permission checks to map_range()
Thread-Topic: [PATCH v2] vpci: add permission checks to map_range()
Thread-Index: AQHZv8pFQRXFGkDWd0GJKKtbGNV896/ML4QA
Date: Wed, 26 Jul 2023 15:40:55 +0000
Message-ID: <CEA89699-7807-4949-BA03-2819FA0D89F7@arm.com>
References: <20230726140132.80151-1-roger.pau@citrix.com>
In-Reply-To: <20230726140132.80151-1-roger.pau@citrix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7158:EE_|AS8PR08MB8897:EE_|DBAEUR03FT021:EE_|AM9PR08MB5907:EE_
X-MS-Office365-Filtering-Correlation-Id: edbcf8ff-3bf4-4727-a8e4-08db8deeb8fa
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 NRV5NsmrAFxZMOQRObXMnYk70VpabaQkq2Ky15pGMfCdEVDdvMPYE1HFVVFhkD4CBT4o+qfEWMjDTKpMqhBeWLmpzMaWG196iKkMvB10dVLAblkAfKX9fIrJRWYWRae5ydZkX3MX/pfaBb6iF6eKys8V+DvjDLHFmmvL9lOB+CP7iCbqNeIzBoQlfujZkcni31V5Er5+vyfz4mDxUA70g3oJLb1uFGFUFuqbZHYpzl6P+Ob+rSviTOoQHhazleAnhhXcUEs9BYHfade6VIzRTTa8OcHIF+qSWZgEXMDtTMj4727/BdB+gfDiH7dEbdcZRLvz9G4Gg86PHATZeADKgtVtsLuXAoQF9R9O9eA25zm6BqvHs2tYW0tuyQ3EFkGMWY1bHhxVbrq/ERzFDGAS1oqNj46lciPE5z2TA7wUFvRtbYV9CDVBGhZQBYCD2I8sZPX8xbUY8OdhvFSpzbc+/EIHm/enozVTBBsvsRlS9oieA+zKQvi6jGhxpahfktzt0V+CzoAiV/L6RgVYHP+Xae5ozsbXvAwoUtLnTfjjjkObREQCUYiyMBvtlS3P4GJkbtU7GwXhUHyQAswiSLjaAP7sjZwqFyH0Ep0GAQdeTENbsFNPhQaanJ3pbdES5LgYvdwmw5EuC1fQU5T9uBi51w==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7158.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(366004)(376002)(39860400002)(396003)(136003)(451199021)(8676002)(5660300002)(2616005)(186003)(33656002)(26005)(6506007)(53546011)(86362001)(8936002)(71200400001)(6916009)(4326008)(316002)(6486002)(38070700005)(64756008)(41300700001)(66556008)(66946007)(66446008)(6512007)(66476007)(76116006)(478600001)(4744005)(91956017)(122000001)(54906003)(2906002)(38100700002)(36756003)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <AEDB3B9B7D01D74280E1E569E58F3F9C@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB8897
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT021.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	361c74d7-308c-492f-eccc-08db8deeb385
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	0K/qTPoHHHo0HEMJgkI/iRujPxVrwbmJ9tMoIcXDi8OH7njyNfhYcWk90AA1stLj1T8UH9riCw+2AHNpWdP0thzEkyyHyo7JM4xZxQtUlqmr81KC0dAyUn6dEsBOGuWuhixodMBbY77OvqYkbWC4tkMnrLwgsXj3kLIIM/yW/qoTOnMCSBqX54YP7EhmDPWID8oBi+cAetWXZsUBHIOzx83+YEB2jMEdd0QHjj5I9M0ijbu69589QFiE2AySzXzB0Dbc1Iquz0v1MLNlnHL4Fg6X0qUqZC65mypnpDzhIRr32G3Ze3Q7IE+I5DqZizAY0tOFoEIR6IGvdflLiK7G2ZFmqABgqbvcEFqy1QDqG9QBvtCISrt1yQ4DRU2g1xaUWqhcO5qtq/gl9IH+ojcakds6LSsibVcO9wcxcI8BuvM52YmfFN2zgxgoyL0fmnVD7d9zbOzOz5kvmKUqa5drXaLlSR69xtjHj5KTg2R2igtVUETThcpvHStnjScQp8eaeWzHAglC8hWK2Xhe0/A2ZU9UcR80rH+W9xqnsjO2zyAraJ5MoW9wQPMkQThtsnbdLUrW+jQoeqosUOinNO/wYcOUOOLI6EA2g0AmP8vfy9aAZ0sQHfANZneTc6dhZhrqZUXA5WzZ6ApNsUgM5yp69NXUPKZwntM+z8UvxIVraRZHZBAnPomODP2agLPqJ8N2hfWHaen1Ndjy1/vUQjIa5/wl0uQKuJbYoavWB7+q3m2j1+WW1lr0Bq/NeD8GHfW5
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(396003)(39860400002)(346002)(376002)(136003)(451199021)(82310400008)(36840700001)(40470700004)(46966006)(6486002)(356005)(82740400003)(478600001)(47076005)(53546011)(6506007)(107886003)(6512007)(26005)(4326008)(81166007)(54906003)(70206006)(70586007)(336012)(186003)(36860700001)(2616005)(5660300002)(8676002)(6862004)(8936002)(33656002)(40460700003)(4744005)(316002)(41300700001)(2906002)(40480700001)(86362001)(36756003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jul 2023 15:41:04.8068
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: edbcf8ff-3bf4-4727-a8e4-08db8deeb8fa
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT021.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB5907

SGkgUm9nZXIsDQoNCj4gT24gMjYgSnVsIDIwMjMsIGF0IDM6MDEgcG0sIFJvZ2VyIFBhdSBNb25u
ZSA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdyb3RlOg0KPiANCj4gSnVzdCBsaWtlIGl0J3MgZG9u
ZSBmb3IgdGhlIFhFTl9ET01DVExfbWVtb3J5X21hcHBpbmcgaHlwZXJjYWxsLCBhZGQNCj4gdGhl
IHBlcm1pc3Npb25zIGNoZWNrcyB0byB2UENJIG1hcF9yYW5nZSgpLCB3aGljaCBpcyB1c2VkIHRv
IG1hcCB0aGUNCj4gQkFScyBpbnRvIHRoZSBkb21haW4gcDJtLg0KPiANCj4gQWRkaW5nIHRob3Nl
IGNoZWNrcyByZXF1aXJlcyB0aGF0IGZvciB4ODYgUFZIIGhhcmR3YXJlIGRvbWFpbiBidWlsZGVy
DQo+IHRoZSBwZXJtaXNzaW9ucyBhcmUgc2V0IGJlZm9yZSBpbml0aWFsaXppbmcgdGhlIElPTU1V
LCBvciBlbHNlDQo+IGF0dGVtcHRzIHRvIGluaXRpYWxpemUgdlBDSSBkb25lIGFzIHBhcnQgb2Yg
SU9NTVUgZGV2aWNlIHNldHVwIHdpbGwNCj4gZmFpbCBkdWUgdG8gbWlzc2luZyBwZXJtaXNzaW9u
cyB0byBjcmVhdGUgdGhlIEJBUiBtYXBwaW5ncy4NCj4gDQo+IFdoaWxlIG1vdmluZyB0aGUgY2Fs
bCB0byBkb20wX3NldHVwX3Blcm1pc3Npb25zKCkgY29udmVydCB0aGUgcGFuaWMoKQ0KPiB1c2Vk
IGZvciBlcnJvciBoYW5kbGluZyB0byBhIHByaW50aywgdGhlIGNhbGxlciB3aWxsIGFscmVhZHkg
cGFuaWMgaWYNCj4gcmVxdWlyZWQuDQo+IA0KPiBGaXhlczogOWMyNDRmZGVmN2U3ICgndnBjaTog
YWRkIGhlYWRlciBoYW5kbGVycycpDQo+IFNpZ25lZC1vZmYtYnk6IFJvZ2VyIFBhdSBNb25uw6kg
PHJvZ2VyLnBhdUBjaXRyaXguY29tPg0KDQpJIHRlc3RlZCB0aGUgcGF0Y2ggb24gQVJNIGJvYXJk
IHdpdGggdlBDSSBlbmFibGVkIGV2ZXJ5dGhpbmcgd29ya3MuDQoNClJldmlld2VkLWJ5OiBSYWh1
bCBTaW5naCA8cmFodWwuc2luZ2hAYXJtLmNvbT4NClRlc3RlZC1ieTogUmFodWwgU2luZ2ggPHJh
aHVsLnNpbmdoQGFybS5jb20+DQoNClJlZ2FyZHMsDQpSYWh1bA0KDQo=

