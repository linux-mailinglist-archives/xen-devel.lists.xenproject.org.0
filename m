Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AEA06C4067
	for <lists+xen-devel@lfdr.de>; Wed, 22 Mar 2023 03:31:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.513069.793532 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1peoG4-0006Of-Lh; Wed, 22 Mar 2023 02:31:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 513069.793532; Wed, 22 Mar 2023 02:31:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1peoG4-0006MO-Iw; Wed, 22 Mar 2023 02:31:24 +0000
Received: by outflank-mailman (input) for mailman id 513069;
 Wed, 22 Mar 2023 02:31:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UaYW=7O=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1peoG2-0006M0-Oc
 for xen-devel@lists.xenproject.org; Wed, 22 Mar 2023 02:31:22 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on20614.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::614])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a1d54529-c859-11ed-85db-49a42c6b2330;
 Wed, 22 Mar 2023 03:31:21 +0100 (CET)
Received: from DB6PR0202CA0020.eurprd02.prod.outlook.com (2603:10a6:4:29::30)
 by VI1PR08MB5438.eurprd08.prod.outlook.com (2603:10a6:803:12e::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37; Wed, 22 Mar
 2023 02:31:18 +0000
Received: from DBAEUR03FT003.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:29:cafe::41) by DB6PR0202CA0020.outlook.office365.com
 (2603:10a6:4:29::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37 via Frontend
 Transport; Wed, 22 Mar 2023 02:31:17 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT003.mail.protection.outlook.com (100.127.142.89) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6222.17 via Frontend Transport; Wed, 22 Mar 2023 02:31:17 +0000
Received: ("Tessian outbound 55ffa3012b8f:v135");
 Wed, 22 Mar 2023 02:31:17 +0000
Received: from 954c2049bc83.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 F73AEDBB-3EC1-4CBC-80BC-EB90B9D4E540.1; 
 Wed, 22 Mar 2023 02:31:11 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 954c2049bc83.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 22 Mar 2023 02:31:11 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by DU2PR08MB10015.eurprd08.prod.outlook.com (2603:10a6:10:49f::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37; Wed, 22 Mar
 2023 02:31:09 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::f80a:7d16:3c36:8a03]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::f80a:7d16:3c36:8a03%4]) with mapi id 15.20.6178.037; Wed, 22 Mar 2023
 02:31:09 +0000
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
X-Inumbo-ID: a1d54529-c859-11ed-85db-49a42c6b2330
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7jX1oG3+XeOgGd/2zNpMQRzPXLeF5fWkKbcjXabcumg=;
 b=62eSkUr/4zW7hXbChAPEcs1XjZlTm4H/ow+7UrnsmRE9AdjcC3xOGgHCaC330Z6FT19yLsinZZEonRLJg1OzA8WNLY5xmAo8UTPs4Wb2GAsWLkg7FbvZiaOtNuaRqnavJkOFqXiwyENxGt8WOeApfKWpsAneWkK0KR6s4FsUbxI=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=isaYhQaO8WkrY6ptLLPvOE6kKv26qRXGII1aG/WnQ245+4e8Dep6cVs6w+RFX7LzAjybyqDAxejnQH8V39x1WAM9Vh5iiC4wPQgrXDwFlD5PyQlPsOxFj7WcHbowC/7G17dmPuTVUTC8JmOEXLJ1UPvtOCqzC8S8GLty5gkGRhiyd3mZQj9FlDMXTaJRaL7nDpZlb8574+6T0Me9ihRj3fqprNqFUbtjfREZIJJZkFAYCE/XU6Ck/rn5RBx6xEHcJraZzhIqBMMTjhWY8ADNeeNGf05IcIV70PsLi2Cm1xDeMK2G6MKCx1HdzFLjtf9bOWRV+uCunfHIOnUws1Eo1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7jX1oG3+XeOgGd/2zNpMQRzPXLeF5fWkKbcjXabcumg=;
 b=l0ydcZjOjAF8zUDlzClfR7s3aB9hpvLoA5YoSErOg633JM2MjcTJRtiy4t+tucsXXRI/PZSi8MdR0OnJ4lAhTQ8Q2H0QeYR7SvV8BVprKbHFOXRK+Gdu7D/lCR5fRgGJDcie/gbvpaKcEJpM6ucsg1qk+5KW1oKvpAy4JYTbeTwPEKSn/tij8NDx5gihbQpMAjQSywCaXcOzWY/5+80GzmT7/1ZFRmrfQgv6nc18FEQxQesjzJn52SYkfbE6i+cPO2iSFo+JM/bppH+7PMY+Nit61Es3p6z2XEfoNDc9NXm+41UnW99e+cokdSgvRBSWgqA7kiESXLpC9J++XiX43g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7jX1oG3+XeOgGd/2zNpMQRzPXLeF5fWkKbcjXabcumg=;
 b=62eSkUr/4zW7hXbChAPEcs1XjZlTm4H/ow+7UrnsmRE9AdjcC3xOGgHCaC330Z6FT19yLsinZZEonRLJg1OzA8WNLY5xmAo8UTPs4Wb2GAsWLkg7FbvZiaOtNuaRqnavJkOFqXiwyENxGt8WOeApfKWpsAneWkK0KR6s4FsUbxI=
From: Henry Wang <Henry.Wang@arm.com>
To: Julien Grall <julien@xen.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Wei Chen <Wei.Chen@arm.com>,
	Bertrand Marquis <Bertrand.Marquis@arm.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
Subject: RE: [PATCH v2 3/4] xen/arm: Defer GICv2 CPU interface mapping until
 the first access
Thread-Topic: [PATCH v2 3/4] xen/arm: Defer GICv2 CPU interface mapping until
 the first access
Thread-Index: AQHZNGBES9GND13bPU+mzqer9SysH68EWvQAgACL1MCAAMYdAIAAtLIg
Date: Wed, 22 Mar 2023 02:31:09 +0000
Message-ID:
 <AS8PR08MB7991DDECF6CC44096369A1FD92869@AS8PR08MB7991.eurprd08.prod.outlook.com>
References: <20230130040614.188296-1-Henry.Wang@arm.com>
 <20230130040614.188296-4-Henry.Wang@arm.com>
 <e2421c2d-6ae1-bf70-530d-0683d943f519@xen.org>
 <AS8PR08MB799142447DF4749065ABAF5992819@AS8PR08MB7991.eurprd08.prod.outlook.com>
 <d82e7ed7-50d7-0c4c-532a-df50a4801110@xen.org>
In-Reply-To: <d82e7ed7-50d7-0c4c-532a-df50a4801110@xen.org>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: B77AEC499BEBF44987ADA5D54D6E32DB.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7991:EE_|DU2PR08MB10015:EE_|DBAEUR03FT003:EE_|VI1PR08MB5438:EE_
X-MS-Office365-Filtering-Correlation-Id: 53545ef7-c7a8-404e-e107-08db2a7d83dc
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 gIIfy/swsS7doUql+XrGbSvV5CSaStBYBKGCufKj3eDvF3tUdvGNokrVBskxkA3uoAAd/6U+iK9SsbPJYReK6GHxdlO80bausd8xiy1oMR8t4mfxtFz/VE2obJ/tP1OJPiu58rVBTIe+UG7DdD7SVi3lPVMPmKsDkuXdqEG7/rujM/QVtI7StM2T+blDrfMjcfwzOJkPmD9tOaxtGgCTy9ojIzqo6XmknVIMm+f9SeZUuDXbej6xeFg+E6+IF5J9GbHVjLjg3jWpEtLUBlppLXJZzE/00ColL2Lx9VeZwvifgWe9wAE2SNGyuqYccuyx/VxG8nCt7kg9MjCYIU6h5iz/SRA1fg5S6/lxov1vmBmp+NuMM0t8l5xATPernIy/Bn0nxLFRc/INMrQ2xtmFnx0bI7LRE/NPmrFa52mFLxdGIcHSiF3GNXe49mWkMezn55k+FuHwOGKKSu/9GQBffbJK+osk/M0pOwbfd0nPuzqh4BedYYsNmDbZGYSFT8/4i5fzJhMSHcKEUPwXiNomFnjDmYyrW7Llwbek9FzP4+/A973LOEcDFTOA/6vWBO+5eypyskAm+QLS81TNTjNUs7DJNm8b6HF1AA+N1QEGsnwDtc41hyzD6+5FlAPg53jtZIv7EMfyK3ro0ukFk4x0gjvbYWaFPctM0c6QfigoCgdRPaWBpcuaQIa1v4CKHdsMN47wF/SSOCcvziv+hd4JyQ==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(39860400002)(346002)(136003)(366004)(396003)(376002)(451199018)(38100700002)(86362001)(55016003)(71200400001)(7696005)(316002)(54906003)(110136005)(33656002)(66476007)(8676002)(52536014)(66556008)(64756008)(4326008)(8936002)(76116006)(66946007)(5660300002)(66446008)(41300700001)(478600001)(2906002)(83380400001)(122000001)(38070700005)(9686003)(26005)(186003)(6506007);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR08MB10015
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT003.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	e8e14d2a-c6a0-4a4b-8ff7-08db2a7d7f1e
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	F+UztT6UoADv+82NuJp40UaTVhC8AhCV7EA9bH9rDWWukmMc3QaSmH5R1X5exPb4987ur52xZ2lJqMLifPHKUQCXLNGvPEijBa4Rinhgzml4NZO73mTLQKWBF1iFe71Z2q9RIWGICnPe0WO5tb3aPaP8rM6SE032MQnOTbLLyBrh0xefBmUHHY7H/hBUYH7dfx4MaELHNaQHM52UqLfWX+Fmmp0ttIKidvte6B57GN/oubyNwW8CRF+1b6laPwCnCaYl/+10WhfNdee+YR0vUBqpDaIh3rDKvHkKl5I4Sh0HQPRyfwkD7B3aLJveKZU8GVe50wQ1L37QIN/2574bv+nqaa4p6kwdShMGseYhvObCs/SIkJwDro19jbPrNFYnbQhC8Hbyaei0a1TbDVzt8xY07Rv8ycmgshQ0sb4QSdjzVeOWa+Xx26pvmNCP0FRg23OU8ytQZjRhnwKE2jS1dDwtSt8oa2sUSMWUszPTfcSfPSO8qXmiq5mfDjqe8A3CkqFXSxjAAEsCz1nBQ0fgoTBEX0rpoPBrBFOb447K+m3l2OAR0RxWz+pTdOumB0KKazGn1DSLnkeYNEULeFhlp5kooIqKo+K1zwflbh3icTFKBGF2lHKQQb49va9fIkP9yTaHv9ITyXgIUtAd7KE6srR5ooaUU5PtY8P3EgseAQ7CtshkLOcl1G/zkvlXLq3rolFOzJCXgwv5QCinrZTr4Q==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230025)(4636009)(376002)(39860400002)(346002)(396003)(136003)(451199018)(40470700004)(46966006)(36840700001)(86362001)(82310400005)(40460700003)(40480700001)(55016003)(316002)(8676002)(8936002)(70586007)(4326008)(478600001)(54906003)(70206006)(336012)(6506007)(26005)(107886003)(33656002)(110136005)(9686003)(47076005)(7696005)(83380400001)(356005)(186003)(82740400003)(5660300002)(52536014)(36860700001)(41300700001)(2906002)(81166007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Mar 2023 02:31:17.4626
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 53545ef7-c7a8-404e-e107-08db2a7d83dc
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT003.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB5438

SGkgSnVsaWVuLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEp1bGll
biBHcmFsbCA8anVsaWVuQHhlbi5vcmc+DQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjIgMy80XSB4
ZW4vYXJtOiBEZWZlciBHSUN2MiBDUFUgaW50ZXJmYWNlIG1hcHBpbmcgdW50aWwNCj4gdGhlIGZp
cnN0IGFjY2Vzcw0KPg0KPiA+IGdmbl90b19nYWRkcihnZm4pID49IGQtPmFyY2gudmdpYy5jYmFz
ZSB8fA0KPiA+IGdmbl90b19nYWRkcihnZm4pIDwgZC0+YXJjaC52Z2ljLmNiYXNlICsgZC0+YXJj
aC52Z2ljLmNzaXplDQo+IA0KPiAuLi4gdXNlIHRoZSBzaXplIGluIHRoZSBjaGVjay4gV2l0aCB0
aGUgfHwgc3dpdGNoIHRvICYmLCBteSBwcmVmZXJlbmNlDQo+IHdvdWxkIGJlIHRvIHVzZToNCj4g
DQo+ICgoZC0+YXJjaC52Z2ljLmNiYXNlIC0gZ2ZuX3RvX2FkZHIoZ2ZuKSkgPCBkLT5hcmNoLnZn
aWMuY3NpemUpDQo+IA0KPiB0byBhdm9pZCBhIHBvdGVudGlhbCBvdmVyZmxvdyBpbiB0aGUgdW5s
aWtlbHkgY2FzZSB0aGUgQ1BVIGludGVyZmFjZSBpcw0KPiBhdCB0aGUgdG9wIG9mIHRoZSBhZGRy
ZXNzIHNwYWNlLg0KDQpPaCBJIGxpa2UgdGhlIGlkZWEgb2YgdXNpbmcgdGhlICJtaW51cyBhcHBy
b2FjaCIgdG8gYXZvaWQgdGhlIG92ZXJmbG93DQp2ZXJ5IG11Y2guIFRoYW5rcyEgSSB3aWxsIGtl
ZXAgdGhpcyBpbiBtaW5kIGluIG15IGZ1dHVyZSBkZXZlbG9wbWVudC4NCg0KT25lIG1vcmUgcXVl
c3Rpb24sIHNpbmNlIHRoaXMgIm1pbnVzIGFwcHJvYWNoIiBpcyBkaXJlY3RseSBkZXJpdmVkIGZy
b20NCmBnZm5fdG9fZ2FkZHIoZ2ZuKSA8IGQtPmFyY2gudmdpYy5jYmFzZSArIGQtPmFyY2gudmdp
Yy5jc2l6ZWAsDQpzaG91bGRuJ3QgaXQgYmUNCmAoZ2ZuX3RvX2FkZHIoZ2ZuKSAtIGQtPmFyY2gu
dmdpYy5jYmFzZSkgPCBkLT5hcmNoLnZnaWMuY3NpemVgIGluc3RlYWQ/DQoNCk90aGVyd2lzZSBJ
IHRoaW5rIGBkLT5hcmNoLnZnaWMuY2Jhc2UgLSBnZm5fdG9fYWRkcihnZm4pYCB3aWxsIHByb2R1
Y2UNCmEgaHVnZSB1NjQgYW5kIHRoaXMgY2hlY2sgd291bGQgYWx3YXlzIGZhaWw/DQoNCktpbmQg
cmVnYXJkcywNCkhlbnJ5DQoNCj4gDQo+IENoZWVycywNCj4gDQo+IC0tDQo+IEp1bGllbiBHcmFs
bA0K

