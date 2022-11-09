Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C09A6221F9
	for <lists+xen-devel@lfdr.de>; Wed,  9 Nov 2022 03:36:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.440611.694683 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1osawT-00066l-Lo; Wed, 09 Nov 2022 02:35:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 440611.694683; Wed, 09 Nov 2022 02:35:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1osawT-00064U-ID; Wed, 09 Nov 2022 02:35:53 +0000
Received: by outflank-mailman (input) for mailman id 440611;
 Wed, 09 Nov 2022 02:35:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mL0W=3J=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1osawS-00064O-P8
 for xen-devel@lists.xenproject.org; Wed, 09 Nov 2022 02:35:52 +0000
Received: from EUR03-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur03on2045.outbound.protection.outlook.com [40.107.103.45])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 388d945d-5fd7-11ed-8fd1-01056ac49cbb;
 Wed, 09 Nov 2022 03:35:50 +0100 (CET)
Received: from DBBPR09CA0033.eurprd09.prod.outlook.com (2603:10a6:10:d4::21)
 by DB8PR08MB5449.eurprd08.prod.outlook.com (2603:10a6:10:119::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.12; Wed, 9 Nov
 2022 02:35:46 +0000
Received: from DBAEUR03FT034.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:d4:cafe::fa) by DBBPR09CA0033.outlook.office365.com
 (2603:10a6:10:d4::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.27 via Frontend
 Transport; Wed, 9 Nov 2022 02:35:46 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT034.mail.protection.outlook.com (100.127.142.97) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5813.12 via Frontend Transport; Wed, 9 Nov 2022 02:35:45 +0000
Received: ("Tessian outbound aeae1c7b66fd:v130");
 Wed, 09 Nov 2022 02:35:45 +0000
Received: from e1080965f20a.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 657A226F-01EE-4F2D-9205-DA193847025C.1; 
 Wed, 09 Nov 2022 02:35:39 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id e1080965f20a.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 09 Nov 2022 02:35:38 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by PAXPR08MB7492.eurprd08.prod.outlook.com (2603:10a6:102:2b5::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.11; Wed, 9 Nov
 2022 02:35:35 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::5cdc:31ff:2d2d:339]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::5cdc:31ff:2d2d:339%8]) with mapi id 15.20.5813.009; Wed, 9 Nov 2022
 02:35:35 +0000
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
X-Inumbo-ID: 388d945d-5fd7-11ed-8fd1-01056ac49cbb
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=DFrpZ7X+7ei3k43EZdSxzjWTozzt4eYHq7tkG/P11uQw51dmkxIvzwkqS0TF4BzZ0FSp3q9qXgJ5tFnhdlLe7gA2V8vq9ZSzJiqyLOYgVNjfLyFSnPV8ZE6vDG4SxFYxaTEX4tqvLIzdohjtxk6VlNNZmzVVBeZ01gGPGmxNH0kzi/J6phr3Odv3HrjOZTh2ShaxVqWVhFbLOnWZr/+t5bfYBOgDNVp9r9hKFnquYm8cMV15vBfbCo4AIBlrDuw2eSBBvGA/86RGwyr0xgMg7P+5A1+iUNiyzsmG4J1kyYpMDeLiQTqo8Dyz1Tah4qHkDkobjZzYngFZLJKGOzDqjw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B3PC/o3TYLsJajZKfUkhte9Cid8AxmWRBmAkZviQDOM=;
 b=dzm+Oq1Bd0HleQmQ73WmrhOVKh4yDO9qqMOavpWMKvDT7FQd6zEGA/eUvVGFWnbdg3lg9IBFQAyT3epM/0yKN/k9/l8AA9aONHmh/Wx03g7BGff76gz9h+nuFeBwF8YXI7F0xo8AyszTJXwoFr6za/JxEE409HpK/TCBSLUArTQ4tggQAPM2ZmRD9S2Cifp8JiRash3d7G57U14KmWfi2ZoOhXhFMSsqG6kpVnbpPc2CXyq7aBql6QEH7PuaCY/rtgxh/Cv1No5bnlftzvqibPq322XJ65T7ST0O47GPwwJFoeQzoj7nvHHcZXqrCU9t7FTSO5J3GDwDyeOmXW2RVQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B3PC/o3TYLsJajZKfUkhte9Cid8AxmWRBmAkZviQDOM=;
 b=5k4CxVL4TCA86ugm6Yb8kLhwZI/hnlgtG/Dklg0QV7HtCbXYah/Th3n+eM+xjoSFbt68ICsOJ46+8Cr4lhltt1JlEmOtBEZMN8f5+vDJrncdDQ/BlpicxnKVFqH+J+dEC4O+w6i2+zpNwovafhFQqbQ9nU7fgFqIElN0RzeQSc8=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=F0EaeH9WSV0kfVZhYpwlDZyzQqRCTvSc4N50As6qg30JP6RErxHAcjqBxPDuCDEKwOSb6wCeK+BEm/idEm3er5kW8fb6tKWomPs54fpAnYAXQ196HcvUf9FFoGAPD6CSSETnMQIb8TSNeBXZGUYk21osPOs4eTU6AMDyvsrZ/byG+jVd4YXvrZFw49sE9xvCziDCIz5Rh1xigl0xT1AFN5pmpBXjzua3eAzeJP1ch1aNn21Ie3TAS6bbOg8/cXcXtBTnu4MBhADemN2/ZmHpzdeWnCcTIgUY7lNCl02rRwgK0VgWJ3pVordOZ9pN7XaKKElntVdomIxy+MwFrqoEUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B3PC/o3TYLsJajZKfUkhte9Cid8AxmWRBmAkZviQDOM=;
 b=C02QUTcBYi+/SDd/mreSh551czKUY9Am0oXXp1z7HMuRfxWmkMqkqNiLYjPI/QzwcYcm6RwKtvTPvNG5/pCfg8BRJI2E2ApN7wDzr6qOe/9B4TasYmMUd3TvLYF07g/btNVM6n0rUAS9GPnFUjUH8Q8lWtlsTQqTpAj0H9nhA8kyMLIrtfAYVIJleGLgb2XjqA4I2u/geKH0ugw1FWCMbty0mHXmx2/H2t5vbQq0IASEdElwQiIlwicybWxJXgT7Qd+k3mBp08mIPW1eaiCR+RFLgm3Oo2I/pd0kMttPXaZWQrpQEyNmqYflE/gS36kMCSHOxewkaI6lIGUxUVPtQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B3PC/o3TYLsJajZKfUkhte9Cid8AxmWRBmAkZviQDOM=;
 b=5k4CxVL4TCA86ugm6Yb8kLhwZI/hnlgtG/Dklg0QV7HtCbXYah/Th3n+eM+xjoSFbt68ICsOJ46+8Cr4lhltt1JlEmOtBEZMN8f5+vDJrncdDQ/BlpicxnKVFqH+J+dEC4O+w6i2+zpNwovafhFQqbQ9nU7fgFqIElN0RzeQSc8=
From: Henry Wang <Henry.Wang@arm.com>
To: Roger Pau Monne <roger.pau@citrix.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: "ray.huang@amd.com" <ray.huang@amd.com>, "Alexander.Deucher@amd.com"
	<Alexander.Deucher@amd.com>, Jan Beulich <jbeulich@suse.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
Subject: RE: [PATCH for-4.17?] x86/pvh: report ACPI VFCT table to dom0 if
 present
Thread-Topic: [PATCH for-4.17?] x86/pvh: report ACPI VFCT table to dom0 if
 present
Thread-Index: AQHY83nT6azBcos0i0+auAh9IXa2Rq413yzQ
Date: Wed, 9 Nov 2022 02:35:35 +0000
Message-ID:
 <AS8PR08MB7991AEBC3CBAAB8014F8A8AB923E9@AS8PR08MB7991.eurprd08.prod.outlook.com>
References: <20221108135516.62775-1-roger.pau@citrix.com>
In-Reply-To: <20221108135516.62775-1-roger.pau@citrix.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: F03A06513AD16B40A072888DE2B235A8.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7991:EE_|PAXPR08MB7492:EE_|DBAEUR03FT034:EE_|DB8PR08MB5449:EE_
X-MS-Office365-Filtering-Correlation-Id: bf8f1234-16f4-4f3f-3b07-08dac1fb1ae1
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 NPW7iXePIuq8Hy9Kbdv78GgXDyz8q/YRdwKR1Oor/RTKvu+oqRW/pv436IzdRv/aCYqGZ3gJAtgeR5ZCP+Tgia/0GJxDak50e5H7h+FAJWJKcI/cplxWjSkGchh4xf2yogr/JjHBC8sYhv2mNk6nsiV3UZnbB24ygRqa0dmOHdRleRbEoKAZo/JML7/txG76I9C8BVbe+HKjOP1LdnF10rQ9OyUOWnHyQ17ShCuPgNmlQPpZM9aM19/ybvtAGrCq9DSgmxKhUm7z8RrPOsj0zXtJZgO7m9rfGrtaDrXJn6Ol18La3G0PIxWx2KxGddxSrUwd/N2KPvEQ1qUUceQm/KQwcHfuRZnS7a07D88fFTMwDZs2LNnAUUrCIEE3cy+kNLcY4SQqFpT8zyDKVkJno9u6fEm5yGgX/vOumoRE91Xofp0ljZJJDESW6JP3MLSoBciWxTOnJ7FwG+W8Og774LZD1oufHjo1ibioxx8SRqzyr/BuqWVllG6XDlnsoFr5gDwRRc7esNsCMUiGJE4RlHP6opyMTMFtAOOtEqpw6OiwrWGYhaZtaBAR3UeZjgX3Nzeq2JLutpvccRlffhFM+2lHaAy0vz08RKk+tS+hDSUQb4UevlOpMlosP+eDFIIt1vOIgPLKIyr/1GS+0hwkejDt6g96pmN4wXaTex6uWASYlaqKKu2dkBHLa50iFbDZd9bNXQq8F4xeB4JygundidHaQCpCu1X41Qu1GP2B6SUD0ifTntoQcaNyUxwJLiH4UJHEYlvav0RECqyLMI4XmA==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(136003)(396003)(366004)(39860400002)(346002)(376002)(451199015)(6506007)(7696005)(9686003)(26005)(54906003)(110136005)(38070700005)(478600001)(71200400001)(86362001)(55016003)(38100700002)(33656002)(122000001)(186003)(2906002)(83380400001)(316002)(52536014)(8936002)(5660300002)(76116006)(4326008)(8676002)(64756008)(66946007)(66446008)(66476007)(66556008)(41300700001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB7492
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT034.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	4d6ee5ad-2fa6-40ed-22a9-08dac1fb14a7
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	dobK+CkhHDaUzlX1jgg0mSO689w1K+TDSIkjNScBjpGtae7tkAWvZUgzq/h6eCQCoKtTd18k72uFfQ/Y2BVQKRKtsgYPS5HnwJ2BseatvJ0irooP1tn97fGcPeQLA1wNV1fu3/uebYKeqaUgSrwPy5upBja7NB1LML7NOQGKzHKkR/cnEzmj6ADf4LBymLMJQm+2IvoZYUeepk2WtWe0JqVWLREGhvICD963fOAaPjb3RTfoYXvUoJh0RI2pEXnFwIamj6EJrd3Dnw1c/tzBR99iTw9YnZjc7dYu6uDFIy3tu+/IjS0mOvMvykhN6qMxXpf9MFvua65lb/89UBxp1l6z3bfLcgUoTV4NBUHtNihbhhYZWeG13TTMKACmqrNe0V/bXmkryZiYpIVicsEIbfqLIWZHj5tdlXkobwuWbcuTIMaaTdi3h6DeiOO3Of+Korg4p3JDKPwQnFS79y250AuJifIcc5I3w7ejWunw/9Tbc8L6WwOEPEcDiE/IhUf7uAlrrLsb1O10qhWhNQO7sL8n5uGDMht1feuCzwoE0A8u0zkooHSz4P4dn4rxUaX3gDRgjZWGTLan91X28hj490jJ5fBw0fMgbO5fHV5Ckx71SjMmUPZf+MYiua1P3TaTtFhEAvLEWiQutcF4hCrX6u09qqA4e2keElLHoxoJ89ELFFlPxjsSLRX/P7ulP/Ri/R9zDt++Mc7LW8xFchpOmJ3+x+9TOzcERPkA8aiQWG5nocxzgdVDrC89vPXTa8nzYw5+H5RMVimuTHjsPMsW2A==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(346002)(396003)(39860400002)(136003)(376002)(451199015)(40470700004)(46966006)(36840700001)(82740400003)(33656002)(55016003)(81166007)(478600001)(356005)(82310400005)(83380400001)(36860700001)(86362001)(40460700003)(2906002)(186003)(336012)(47076005)(6506007)(7696005)(9686003)(8936002)(40480700001)(70206006)(52536014)(5660300002)(316002)(26005)(54906003)(41300700001)(8676002)(4326008)(70586007)(110136005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Nov 2022 02:35:45.8110
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bf8f1234-16f4-4f3f-3b07-08dac1fb1ae1
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT034.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB5449

SGkgUm9nZXIsDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gU3ViamVjdDogW1BB
VENIIGZvci00LjE3P10geDg2L3B2aDogcmVwb3J0IEFDUEkgVkZDVCB0YWJsZSB0byBkb20wIGlm
DQo+IHByZXNlbnQNCj4gDQo+IFRoZSBWRkNUIEFDUEkgdGFibGUgaXMgdXNlZCBieSBBTUQgR1BV
cyB0byBleHBvc2UgdGhlIHZiaW9zIFJPTSBpbWFnZQ0KPiBmcm9tIHRoZSBmaXJtd2FyZSBpbnN0
ZWFkIG9mIGRvaW5nIGl0IG9uIHRoZSBQQ0kgUk9NIG9uIHRoZSBwaHlzaWNhbA0KPiBkZXZpY2Uu
DQo+IA0KPiBBcyBzdWNoLCB0aGlzIG5lZWRzIHRvIGJlIGF2YWlsYWJsZSBmb3IgUFZIIGRvbTAg
dG8gYWNjZXNzLCBvciBlbHNlDQo+IHRoZSBHUFUgd29uJ3Qgd29yay4NCj4gDQo+IFJlcG9ydGVk
LWJ5OiBIdWFuZyBSdWkgPHJheS5odWFuZ0BhbWQuY29tPg0KPiBTaWduZWQtb2ZmLWJ5OiBSb2dl
ciBQYXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT4NCj4gLS0tDQo+IFRoaXMgaXMgYSBi
dWdmaXgsIGJ1dCBnaXZlbiBQVkggZG9tMCBpcyBzdGlsbCBleHBlcmltZW50YWwgSSdtIG5vdA0K
PiBzdXJlIGl0IHdvdWxkIHF1YWxpZnkgZm9yIHRoZSByZWxlYXNlLiAgT1RPSCBiZWluZyBleHBl
cmltZW50YWwgbWVhbnMNCj4gdGhlcmUgYXJlIG5vIGd1YXJhbnRlZXMgaXQgd2lsbCB3b3JrLCBz
byB0aGUgY2hhbmdlIGlzIHVubGlrZWx5IHRvDQo+IG1ha2UgdGhpcyBhbnkgd29yc2UuDQoNCkZv
bGxvd2luZyB0aGUgZGlzY3Vzc2lvbiBpbiB0aGlzIHRocmVhZCwgSSB0aGluayB0aGlzIGlzIGEg
c2ltcGxlIGVub3VnaA0KcGF0Y2ggd2l0aCBiaWcgZW5vdWdoIGJlbmVmaXQgZ2l2ZW4gUmF5IGhh
cyBhbHJlYWR5IHRlc3RlZCB0aGUgcGF0Y2guDQpJIHdvdWxkbid0IGJsb2NrIHRoaXMgcGF0Y2gg
Zm9yIDQuMTcgcmVsZWFzZSwgYnV0IHdlIG5lZWQgdG8gbWFrZSBzdXJlDQpKYW4gKHRoZSBBQ1BJ
IG1haW50YWluZXIpIGlzIGhhcHB5IHdpdGggdGhlIFZGQ1QgdGFibGUgaW5mb3JtYXRpb24gaW4N
CmNvbW1pdCBtZXNzYWdlLiBUaGVuIGZlZWwgZnJlZSB0byBhZGQgbXk6DQoNClJlbGVhc2UtYWNr
ZWQtYnk6IEhlbnJ5IFdhbmcgPEhlbnJ5LldhbmdAYXJtLmNvbT4NCg0KS2luZCByZWdhcmRzLA0K
SGVucnkNCg==

