Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 465C07AE35A
	for <lists+xen-devel@lfdr.de>; Tue, 26 Sep 2023 03:32:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.608245.946607 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qkwvn-0006Pr-Kh; Tue, 26 Sep 2023 01:32:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 608245.946607; Tue, 26 Sep 2023 01:32:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qkwvn-0006Mo-Hd; Tue, 26 Sep 2023 01:32:07 +0000
Received: by outflank-mailman (input) for mailman id 608245;
 Tue, 26 Sep 2023 01:32:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fQH+=FK=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1qkwvl-0006Mi-IN
 for xen-devel@lists.xenproject.org; Tue, 26 Sep 2023 01:32:05 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on0617.outbound.protection.outlook.com
 [2a01:111:f400:fe0e::617])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7ea8f4ed-5c0c-11ee-9b0d-b553b5be7939;
 Tue, 26 Sep 2023 03:32:03 +0200 (CEST)
Received: from DUZPR01CA0255.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b5::27) by DB9PR08MB6457.eurprd08.prod.outlook.com
 (2603:10a6:10:23e::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.28; Tue, 26 Sep
 2023 01:31:59 +0000
Received: from DBAEUR03FT046.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:4b5:cafe::c4) by DUZPR01CA0255.outlook.office365.com
 (2603:10a6:10:4b5::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.35 via Frontend
 Transport; Tue, 26 Sep 2023 01:31:59 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT046.mail.protection.outlook.com (100.127.142.67) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6838.19 via Frontend Transport; Tue, 26 Sep 2023 01:31:58 +0000
Received: ("Tessian outbound 30c9f5e988c5:v175");
 Tue, 26 Sep 2023 01:31:58 +0000
Received: from c44b214f64ca.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 D459E8B9-78CB-4C1C-8266-15FBC09449D4.1; 
 Tue, 26 Sep 2023 01:31:52 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id c44b214f64ca.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 26 Sep 2023 01:31:52 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by AS8PR08MB5912.eurprd08.prod.outlook.com (2603:10a6:20b:29f::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.28; Tue, 26 Sep
 2023 01:31:48 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::dfff:49d6:ed04:118b]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::dfff:49d6:ed04:118b%6]) with mapi id 15.20.6813.027; Tue, 26 Sep 2023
 01:31:48 +0000
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
X-Inumbo-ID: 7ea8f4ed-5c0c-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3tyNgwotyVLlhIeqL0M5LjYaHhurcldkdof83+3NtfA=;
 b=Z7urO+HX0++i1gji60lDLj+ZqFOng0QboeY90L5FlydOf6wmAD+lLTX+OX2uyXRpaabh697kvdbHDvx6ldQ34+j0vTWniUB2TLkwnMo97GEU3ajOvY/6dbbqnBHlTUYCAgnZhPJUAVYVeaGYUxIplOW3C0Lq5w2aXpTeiwBI7z4=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 234d2496a7e74ea1
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aXgxv1UQ8XHP0pYvvvEmWbMxmpUfxpkwIQb6aqzATciVVU1iIp+XxS9gCzrLV+Otix/2untvw+/1fFnssr3KpL1Te4NaX2kN/vmG5d3vu+PlxtYn6/ThAo1YyBV1ovOUYKsDzz7IWIP91BmuyOLnI27gYQDpWwaFutOxaAsTutYaucmiCFZBON5NDW9z6nhJcqmhd/OWbz5Vzms9xYZm7fKf194hvbVfqSA8Y3SBERlCFcDYbnR2edxEwdkJUSTJe08FOto+xdjqaqXoK2t2iFCPoNNKjfRZHQerVvH4hZ2QTQLBEB5LJ7pIxLZKLpquZ8zOXveeoLU/nBBHG8Ul3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3tyNgwotyVLlhIeqL0M5LjYaHhurcldkdof83+3NtfA=;
 b=Ymlsc3FWpFoBJaa0ugjHplo/hrYPmvmoK4DeEQpgYammiKkv1fR6weIfjTizSJq0pBo6v/DstkKUTxTZmI73V9FDnCkNHbICinC7uy5TFOuA1zwfj417pdrruPKuJvdyPxva1Y53QxQSYPlnapKnDj/cNCANq/Co96FYYoCCJODEk+/4zQFfmJQBa5EuH9NZHp0mlyMPkCpb0d9aD9WrKNrJxiCjFrn2VoShFfkiPbZhFwazOVAMROL/vxm9RDCoi5f5XvQpYVaf58nW5CxhqtzeRixIhpBpEn3WzbZOyNjgwA4KB1KDktrh8ped8yeadi5huZQzpPNgIw1c1h94ag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3tyNgwotyVLlhIeqL0M5LjYaHhurcldkdof83+3NtfA=;
 b=Z7urO+HX0++i1gji60lDLj+ZqFOng0QboeY90L5FlydOf6wmAD+lLTX+OX2uyXRpaabh697kvdbHDvx6ldQ34+j0vTWniUB2TLkwnMo97GEU3ajOvY/6dbbqnBHlTUYCAgnZhPJUAVYVeaGYUxIplOW3C0Lq5w2aXpTeiwBI7z4=
From: Henry Wang <Henry.Wang@arm.com>
To: Julien Grall <julien@xen.org>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Bertrand Marquis <Bertrand.Marquis@arm.com>, Wei
 Chen <Wei.Chen@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Penny Zheng <Penny.Zheng@arm.com>
Subject: Re: [PATCH v6 07/13] xen/arm: Split MMU system SMP MM bringup code to
 mmu/smpboot.c
Thread-Topic: [PATCH v6 07/13] xen/arm: Split MMU system SMP MM bringup code
 to mmu/smpboot.c
Thread-Index: AQHZ2U+b9I6Z5CIUPUulwo5PHkCPq7AsFjSAgABpjwA=
Date: Tue, 26 Sep 2023 01:31:48 +0000
Message-ID: <773AACAB-5390-4455-9733-5EF43160D4D8@arm.com>
References: <20230828013224.669433-1-Henry.Wang@arm.com>
 <20230828013224.669433-8-Henry.Wang@arm.com>
 <d38de2e7-c691-4203-a267-a8c7bd42fe71@xen.org>
In-Reply-To: <d38de2e7-c691-4203-a267-a8c7bd42fe71@xen.org>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.700.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7991:EE_|AS8PR08MB5912:EE_|DBAEUR03FT046:EE_|DB9PR08MB6457:EE_
X-MS-Office365-Filtering-Correlation-Id: 16f66f19-11d3-4bc5-c8ef-08dbbe306078
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 Ca7oo0BtY69/2SwPDYzvpliqdXaADk6J9SMQa6SBJVc9RMdjfvqKQNW8eSVzcDWxbd3imNtE/TOzlfc/u5+JJvpYf1HvO2J9eC5IvRHZreazCVf1J104ARcbDAAbXLiA4gEJP1dpzyx6vhRPdWq57vC1xlviyy26j23EduT8dj+s++eHc6guIgABTvPJkLI2cf2z4qt8kr86ZqELROL0ChFtQn6ushVRbtCaEt6gpk+ph9bCpYKX92Cg48xNSHFaszGkK7fzEESCyPQjiKA8vsnoZTuNmzXyLqshqABJUrUGBZUWkH3WvpfBib0i49Rri9ejYBtQ0mZrFWZ6vWv+QdT4QW0Gr9wryURYJmAPUD2ElmiwTlQPuhIfx3W8bE6ZeHNCIAtX6CGj4CgFuL8ExO2awySdzruWhnkRNv6/pfH5bcPumcKurR0sjuTIFYMJ6Sw/eJg6+USOrPKYLaQ1WXJAf5joDiMBqoTWGlITbTRVKoByCbWyBDWA4CTQl9pk+t6KL3eso0PUkl5LL77qA1KvfIfQHTz+siZ8M+u4etySjAk94+X+dJxbxExm38jD49KqPfWJH2b/LvzdKAz3+4ASJeGhdjEwXYAgF70CQtd+FdvLAvnWFpgTrCe0TDFtD0GZ0oUQQ/pDRX3wOyez4A==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(39860400002)(366004)(346002)(136003)(376002)(230922051799003)(1800799009)(186009)(451199024)(6512007)(6486002)(53546011)(71200400001)(6506007)(83380400001)(122000001)(38100700002)(33656002)(86362001)(38070700005)(36756003)(2616005)(26005)(2906002)(91956017)(8936002)(8676002)(4326008)(41300700001)(76116006)(66446008)(66946007)(66556008)(54906003)(6916009)(316002)(66476007)(64756008)(5660300002)(478600001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <2A8957110081B14392FF4FFDE543745D@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB5912
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT046.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	85542aa4-742d-40aa-7e86-08dbbe305a71
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	lMrIyj7HAiSAXZz0tOhq2U0IjDd4uP8Y5hgo332FZLeJVqAhBJZx8pZ4dxBMcdHjgwyVu3sqkmkp6RUMQr+nBJshl42ZUD7jRvlralJ/BzNs0qGJz4hT4WMGDpMV2dTyCrNcYvsY5Prr+VqSaIle1bPf6CeS8pKAcDuaqxT02Qf8A6bT+1kkuXweu37PI3scudPcFxStgL5C1sAEQj6V6b+xYZjg+Nel6EWq29ZN4IuntOaneLFc0kMQzxUw7T3rIHe0BpLTiXOS09m13iQ9gSjPNSSSSD5P8+t/Ip0Tw4li8SdKV8wx31puUx59vVgueYvXWOEKxajBE+MIx9hKxZw7OST9x1VAJ8bYBuxki+EKgK3oP7zkszcQ+w5yBGN9OyOuEKi78ZlZe9e7NCRNGIRQYdv1C9Rhvm/fvNWUbqgIdGz+1f4yrfulLAXQ32nJlziEkI7/IPuZD9tCduvJ9iyTzQSw7aCE+qHKAixh5Es9StEQ8OqpUymDeIV6CmBIisu5/n9GchbIrjGYzahp8RAuAaUGpI38vQedBQAhi5NhTgaO+tPqQOROf7AZdF9hbaWr+uWvTcBhlw5BXL7oiKWUcIEenmK3hTDbWLeBcaUcyuxEBVhhH3sVo0So767P/c2JFMCwInvNGDKleUJtlxVU4+/Qz7BV8LLv9G0/9QYpT4hHwu+v33exMETQmH8PPZ7zWGWCbDJreP57kiIebOhYcH6pk7zlbOfoapX2tWpxOYzmAaUSJLyKHz+Rg4nq
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(376002)(396003)(39860400002)(346002)(136003)(230922051799003)(186009)(451199024)(1800799009)(82310400011)(46966006)(40470700004)(36840700001)(40480700001)(4326008)(40460700003)(47076005)(83380400001)(26005)(336012)(82740400003)(356005)(6862004)(36860700001)(8676002)(8936002)(316002)(478600001)(41300700001)(6486002)(70586007)(70206006)(54906003)(81166007)(53546011)(5660300002)(2906002)(2616005)(6506007)(6512007)(36756003)(33656002)(86362001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Sep 2023 01:31:58.9293
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 16f66f19-11d3-4bc5-c8ef-08dbbe306078
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT046.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB6457

SGkgSnVsaWVuLA0KDQo+IE9uIFNlcCAyNiwgMjAyMywgYXQgMDM6MTMsIEp1bGllbiBHcmFsbCA8
anVsaWVuQHhlbi5vcmc+IHdyb3RlOg0KPiANCj4gSGkgSGVucnksDQo+IA0KPiBPbiAyOC8wOC8y
MDIzIDAyOjMyLCBIZW5yeSBXYW5nIHdyb3RlOg0KPj4gTW92ZSB0aGUgY29kZSByZWxhdGVkIHRv
IHNlY29uZGFyeSBwYWdlIHRhYmxlIGluaXRpYWxpemF0aW9uLCBjbGVhcg0KPj4gYm9vdCBwYWdl
IHRhYmxlcyBhbmQgdGhlIGdsb2JhbCB2YXJpYWJsZSBkZWZpbml0aW9ucyBvZiB0aGVzZSBib290
DQo+PiBwYWdlIHRhYmxlcyBmcm9tIGFyY2gvYXJtL21tLmMgdG8gYXJjaC9hcm0vbW11L3NtcGJv
b3QuYw0KPj4gRHJvcCB0aGUgInN0YXRpYyIgYXR0cmlidXRlIG9mIGFybTMyIGdsb2JhbCB2YXJp
YWJsZSBjcHUwX3BndGFibGUsDQo+PiBhbmQgZGVjbGFyZSBpdCBpbiB0aGUgYXJtMzIgbW0uaCBo
ZWFkZXIsIGJlY2F1c2UgdGhpcyB2YXJpYWJsZQ0KPj4gd2lsbCBiZSB1c2VkIGJ5IGJvdGggYXJj
aC9hcm0vbW0uYyBhbmQgYXJjaC9hcm0vbW11L3NtcGJvb3QuYy4NCj4gDQo+IEkgZG9uJ3QgdGhp
bmsgeW91IG5lZWQgdG8gZXhwb3J0IGNwdTBfcGd0YWJsZS4gWW91IGNhbiBpbnN0ZWFkIHJlcGxh
Y2UgdXNlIHdpdGggcGVyX2NwdSh4ZW5fcGd0YWJsZSwgMCkuDQoNCllvdSBtZWFuIHVzaW5nDQpg
YGANCm1lbWNweShmaXJzdCwgcGVyX2NwdSh4ZW5fcGd0YWJsZSwgMCksIFBBR0VfU0laRSk7DQpg
YGANCmluIHRoZSBhcm0zMiBpbXBsZW1lbnRhdGlvbiBvZiBwcmVwYXJlX3NlY29uZGFyeV9tbSgp
IGluIG1tdS9zbXBib290LmM/DQoNClRoYXQgc291bmRzIGdvb2QgdG8gbWUgYW5kIEkgd2lsbCBm
aXggaW4gdjcuDQoNCj4gDQo+PiArICovDQo+PiArREVGSU5FX0JPT1RfUEFHRV9UQUJMRShib290
X3BndGFibGUpOw0KPj4gKyNpZmRlZiBDT05GSUdfQVJNXzY0DQo+PiArREVGSU5FX0JPT1RfUEFH
RV9UQUJMRShib290X2ZpcnN0KTsNCj4+ICtERUZJTkVfQk9PVF9QQUdFX1RBQkxFKGJvb3RfZmly
c3RfaWQpOw0KPj4gKyNlbmRpZg0KPj4gK0RFRklORV9CT09UX1BBR0VfVEFCTEUoYm9vdF9zZWNv
bmRfaWQpOw0KPj4gK0RFRklORV9CT09UX1BBR0VfVEFCTEUoYm9vdF90aGlyZF9pZCk7DQo+PiAr
REVGSU5FX0JPT1RfUEFHRV9UQUJMRShib290X3NlY29uZCk7DQo+PiArREVGSU5FX0JPT1RfUEFH
RV9UQUJMRVMoYm9vdF90aGlyZCwgWEVOX05SX0VOVFJJRVMoMikpOw0KPiANCj4gU3RyaWN0bHkg
c3BlYWtpbmcsIGJvb3RfKiBhcmUgYWxzbyB1c2VkIGZvciBDUFUwIGJ1dCBub3QgaW4gQyBjb2Rl
LiBUaGF0IHNhaWQsIEkgYW0gb2sgaWYgdGhlcmUgYXJlIG1vdmVkIGhlcmUuDQo+IA0KPiBJbiB0
aGUgbG9uZ2VyIHRlcm0sIEkgd291bGQgYWN0dWFsbHkgbGlrZSB0byByZW1vdmUgYm9vdF8qLiBU
aGlzIHNob3VsZCBhbHJlYWR5IGJlIHBvc3NpYmxlIGZvciBhcm02NCAoaW4gZmFjdCB0aGV5IGFy
ZSBub3QgdXNlZCBmb3Igc2Vjb25kYXJ5IENQVSBicmluZy11cCkuIEZvciBhcm0zMiwgaXQgcmVx
dWlyZXMgYSBiaXQgbW9yZSB3b3JrLg0KPiANCj4gQW55d2F5LCB0aGF0J3Mgbm90IGEgcmVxdWVz
dCBmb3IgeW91ciBzZXJpZXMuIDopDQoNCkxldOKAmXMgc2VlIGlmIHdlIGNhbiBkbyB0aGF0IGlu
IDQuMTkgZGV2IGN5Y2xlIHRoZW4gOikNCg0KPiANCj4+ICsgICAgLyogU2V0IGluaXRfdHRiciBm
b3IgdGhpcyBDUFUgY29taW5nIHVwICovDQo+PiArICAgIGluaXRfdHRiciA9IF9fcGEoZmlyc3Qp
Ow0KPiANCj4gaW5pdF90dGJyIHdpbGwgb25seSBiZSB1c2VkIGJ5IHNtcGJvb3QuYyBhbmQgYXNz
ZW1ibHkgY29kZS4gU28gSSB0aGluayB0aGUgZGVjbGFyYXRpb24gbmVlZHMgdG8gYWxzbyBiZSBt
b3ZlZCBhbmQgdGhlIHByb3RvdHlwZSBtb3ZlZCB0byBtbXUvbW0uaC4NCg0KT2ssIHdpbGwgZG8g
aW4gdjcuDQoNCktpbmQgcmVnYXJkcywNCkhlbnJ5DQoNCj4gDQo+IENoZWVycywNCj4gDQo+IC0t
IA0KPiBKdWxpZW4gR3JhbGwNCg0K

