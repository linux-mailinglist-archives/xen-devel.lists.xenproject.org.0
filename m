Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DB7C45EB714
	for <lists+xen-devel@lfdr.de>; Tue, 27 Sep 2022 03:47:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.412164.655365 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oczfi-0000SI-Rs; Tue, 27 Sep 2022 01:46:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 412164.655365; Tue, 27 Sep 2022 01:46:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oczfi-0000QY-Ly; Tue, 27 Sep 2022 01:46:06 +0000
Received: by outflank-mailman (input) for mailman id 412164;
 Tue, 27 Sep 2022 01:46:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=a/4/=Z6=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1oczfg-0000QS-MG
 for xen-devel@lists.xenproject.org; Tue, 27 Sep 2022 01:46:04 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr140049.outbound.protection.outlook.com [40.107.14.49])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2354321a-3e06-11ed-9648-05401a9f4f97;
 Tue, 27 Sep 2022 03:46:00 +0200 (CEST)
Received: from AM5P194CA0017.EURP194.PROD.OUTLOOK.COM (2603:10a6:203:8f::27)
 by DBAPR08MB5558.eurprd08.prod.outlook.com (2603:10a6:10:1b3::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.26; Tue, 27 Sep
 2022 01:45:58 +0000
Received: from AM7EUR03FT023.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:203:8f:cafe::ae) by AM5P194CA0017.outlook.office365.com
 (2603:10a6:203:8f::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.25 via Frontend
 Transport; Tue, 27 Sep 2022 01:45:58 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT023.mail.protection.outlook.com (100.127.140.73) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5654.14 via Frontend Transport; Tue, 27 Sep 2022 01:45:58 +0000
Received: ("Tessian outbound 3c27ae03f5ec:v124");
 Tue, 27 Sep 2022 01:45:57 +0000
Received: from efe72351294a.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 3EE40F3E-6F28-49A1-81C9-98CBEE5DF170.1; 
 Tue, 27 Sep 2022 01:45:52 +0000
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id efe72351294a.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 27 Sep 2022 01:45:52 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by GVXPR08MB7872.eurprd08.prod.outlook.com (2603:10a6:150:16::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.25; Tue, 27 Sep
 2022 01:45:50 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::10bf:2915:c966:b45a]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::10bf:2915:c966:b45a%3]) with mapi id 15.20.5654.025; Tue, 27 Sep 2022
 01:45:49 +0000
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
X-Inumbo-ID: 2354321a-3e06-11ed-9648-05401a9f4f97
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=FzhDMaqmYkec3KtXxG62x5eOD2c1YcVzihKmITLtFA5oQ50CL99wQ6TGN9tee+eDZ3TqQEP2/VFY1G/cX6abHWVYoV3QeB9MjbLXrd3ncqtBVk4ZNNhf9vfpXplq2LJpbKlbohN8RYgfBEJPBu7rhY0Q/QDZJiVyTkFArLZ4+qIQlzglMCm36KL+Kp9lw30iEsH3kRXIaRgaWAHlSIS95C7te8831XGUnvc67RP+C7zTTaYiXdvt0Cn3eI97qUZd0lTpf/zzXa3mZRd4KBwf8IVgbAlGJUyf84Fww7sy+1Nr41MwZ3wSL8cWcOP7nZQv/kBFFZ2W3fsgujVWQBhNAw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1jhMw68qTGiVfUuYk86XxcYXY6cZhVZIKwaFt5Cmo/Y=;
 b=ONnOC81dpO0WKub5VnyvWP4LmH5B90PXGtnsmqe4fJBYhb4SC1lKZz/TAaHbXL3Gcj6vh+roZoOxVF7AYHhM4ln9A2VqoHJzZkzKDDepOnCEXKK+YVeh4h/YhGyyusdbMq34B9V9LHBVuBOD7MfQLNck7QIbOkpG1iNwFH0Z5xG/9hONmj0PiHXxsUin7W6ziI7VB4X3WE7dVihwMBriNROj3vdry7YP08hbaCG089HpFKjYdfzcWTq1PdPSgDjggOb3FoW5qAO4MVXCZOP/4gau14AT+VwmpuyruvkskaqYO6wUUgaAps0SFh6iYxuUw2qejFt6oxQCIw2zg0ZGQA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1jhMw68qTGiVfUuYk86XxcYXY6cZhVZIKwaFt5Cmo/Y=;
 b=En/DRlTzyglQF/CCkku9pVCCD3gamBFXBWC41cZ4TXrFkJmYOKRkUmjljR7EOa+ib7KN9mAAzIH2fVpfgGntEbpnis22lpFlVY8L6C1xWh4Zg1mwiIAiX+c7GHdWF95MGFB753ua566SY4rpNAne022OcnHW3Zjo7bN8GEBh4UQ=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N1uaw78JbcVzDLiD8B1eXWbLTCynt4Wx8mw5kSqwFHhZMHcPt6YVUHbz8Rs/nNgpcD5+ybmImfVb5sqyNFOL/38ZeA5K+yGfWzoQdqRGME0zaS4yQgXURruC85gXjR5JwHbY7niXqCE7WK22Y+37tUxYElGMculsfEsqpZ2uzjSV9caIFJVUdYSd9KQTULoPu23X14EaJ3qlHJiAnOSF5718401DanqFBZPsdwWD4gITjW20lpUHAIyV7G06kmu/9GiMEpVPCExuARXPOwOl30kIcYY9wZXGCjU5y5Csh3X6Gv0BNcsBauG/t1n2TL5rnIadOtXPCV43Pg/VCadoJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1jhMw68qTGiVfUuYk86XxcYXY6cZhVZIKwaFt5Cmo/Y=;
 b=APRI6pdQ6Cu3WjednTzf+r+c2tkDeH45LKUX8LdGdM7Av2OLVU/3Qkva11pxdiWS/WGlrASESMF9oz/j9ToushKaJeUzID9cw3PTHHbgxadd117hjM6g/s9yGPXuSy9lO3zbFxe73E4k0Ie8t9UWC/ccfBXZInEEnd60pEYwPxh/o3bfl1YmSx8vRUJR6TEyPmkX82qVWNgcrDopYuh7b0Eef2vRTIbkWzXbdGiErEdqYaVK2jeNBk/olN00HPHE+ExzHToWJZeoQN9qBQuScQJIww3AQ6ZPuzNPwOL5vEa8JbJQ5UwUFPLwymuodWZVsxPXLfY/Hnodn1sW7uTEag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1jhMw68qTGiVfUuYk86XxcYXY6cZhVZIKwaFt5Cmo/Y=;
 b=En/DRlTzyglQF/CCkku9pVCCD3gamBFXBWC41cZ4TXrFkJmYOKRkUmjljR7EOa+ib7KN9mAAzIH2fVpfgGntEbpnis22lpFlVY8L6C1xWh4Zg1mwiIAiX+c7GHdWF95MGFB753ua566SY4rpNAne022OcnHW3Zjo7bN8GEBh4UQ=
From: Henry Wang <Henry.Wang@arm.com>
To: Andrew Cooper <Andrew.Cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>
CC: =?utf-8?B?TWFyZWsgTWFyY3p5a293c2tpLUfDs3JlY2tp?=
	<marmarek@invisiblethingslab.com>, Xen-devel <xen-devel@lists.xenproject.org>
Subject: RE: [PATCH] drivers/char: Fix build when CET-IBT is enabled
Thread-Topic: [PATCH] drivers/char: Fix build when CET-IBT is enabled
Thread-Index: AQHY0ZgHSdurloJVeEibjbWpif9Ypq3xog2AgAAtHwCAALLXUA==
Date: Tue, 27 Sep 2022 01:45:49 +0000
Message-ID:
 <AS8PR08MB7991AA6DDCAC8B1B694366A292559@AS8PR08MB7991.eurprd08.prod.outlook.com>
References: <20220926110547.21287-1-andrew.cooper3@citrix.com>
 <b2bfe781-58dc-06f7-aa7c-0a2ef6af7e03@suse.com>
 <838577ad-dc00-d440-ce96-56a85ff7cb83@citrix.com>
In-Reply-To: <838577ad-dc00-d440-ce96-56a85ff7cb83@citrix.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 497C27302E406846B760B9B6B8B6E83C.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7991:EE_|GVXPR08MB7872:EE_|AM7EUR03FT023:EE_|DBAPR08MB5558:EE_
X-MS-Office365-Filtering-Correlation-Id: 11fb90d4-5a03-4b6f-ff32-08daa02a0664
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 9gthOIguchYbuqrJSXhyQezuM5Fb6Lm2+8O/fZFWDjVHNRmEZGQTExzgABfuPBFD00fSFwtdPjrXDFxbi71wfsD20HccKMWK+YaGJ5fymfS7KWifXs6xrjlyE9ta8pT4CZizrDhYN9ScN5RZMDRvQu/nYt7cFF1aZ9N3X566qUZpI/MY4Jw+nmhfEHF8gm6eQ44D3QHOvxMOxug6X1xXqMp753Pd+nKWdyJGL42kdcsglPXKubKlpDxgVho78KG0SStOLe1BRosjQ7zmk9gQx12Fgg7agHc5KZkdf7nnsy7gKYr36IqtK48Gn6uZ+J/R3TlnbjplTmG1tl60kkpTme+XPpI3rRvSql4spUFi6z8v6/S5M74u+D9xbA0/JYzlKsJMSEiV6EGmxxWHgf4VlplVdXmxOZOz2QHuA8P4H3cZ7cTUoD0X1yJDOOjHVXcbn2yjRhLwJ8resgpum1HRHdBM8++ISWsSx1AkKrrIPgUiA6qtfwT/aRzx8m6Fi1PN+173eV4TpgmDQ0hfVN7AFIpnjTpHtuAndZI3IdAb1T4WHpZEFAj4WaMLE+5ovg9gCW+tfOu7VM54rtj058a1itzj0cRjyA8Q/mrQvB/9nzNGzq/V0A1XEP/MsRZb68sEojRHrG6Gyv39tJV54TunYlrqy3Ux7xnSaXLSP9wKz8YjOm05vZXVqdaeA95L2A2kCAWjsWMdTGBCQH4cLoNKgi2np7e3h/+L04mw1c1uwOSxdq5lZ9jDfbT3w96TAY6whDjaBt10BaOWrfvrb8yrHd9dkQzM7dZGS+meUpaViQE=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(136003)(366004)(39860400002)(346002)(396003)(376002)(451199015)(83380400001)(55016003)(110136005)(86362001)(38100700002)(33656002)(52536014)(9686003)(76116006)(66476007)(38070700005)(66556008)(4744005)(2906002)(64756008)(8936002)(122000001)(66946007)(5660300002)(4326008)(8676002)(66446008)(6506007)(316002)(26005)(54906003)(7696005)(53546011)(186003)(71200400001)(478600001)(41300700001)(966005);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR08MB7872
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT023.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	57bbab1e-6d91-4134-1eb8-08daa02a0153
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Kuy9r9jpjtmq0aWkb8FRtY4o/0v6mE7XTtMF0dq2kBBkMw7w+lilEMZ4vYKs0vBFdIL5cyx7FRDtYhXCITMV/cdUxvwyA2cChEuyL4B3CpUsiyt3wcF9wClQ41cfAFOr5Ip+kTQ3VUI7AQx7usokqChO/GNsfycVSYl7NrlhZFaPOkNvsT3IhRAXhObszwdN0y1i/rBSFahK5kju6TBsfQRQh5XnW9ok/7avMIflaFE3jFQyplcJT0MGhvoggpSrB/5g8DU6+MtXkqEYcc1/RIPXk6eTjBz53dtrr0YPDt8WLgzbG9oepofCTxuZSv1BaLj/8OBPJ3r/5+3DTRViFOu0zyBhtQOEcYo0S58iYMhBojv5vINp0wfaFthb/NNozck0YC8MPzU9pKKJsfDCiwc+RpGsGLOI0Fu6s45yD90SLmB44KybrA9DKsFaiccI46aQnzgqT4kIB0MuhtkB2H5m0fAILWQ+bSiI6eWb1SctHTrUDZWEAlzaDgrl+yDiyFyXYi1IMuABGFAKCmGRrUUkjk1HP4uLLKNLMRjTbzRcw+bMJOglxSh1NcxJqMeK8GTM/xyMC4Sfow5HXYtzRzGp0hGdsV0yuE6YazUDqXa4caEo+fn6RIiSY6YtGiVDGDsrRbuTELjaRUON43H6dhV02Epj/zQ2maln0JYD62lroQHdtXMpB/ygeDUdC4b08r7DD24QzInhoTPqKPo0oaNtqtzW65UeXbtxfGi54Yuw/xQjdcVEWZaaIyR/MYP/ojJNllEWR5uicE/v7CWyk6eCyK49pfal12D9FxT9N6c=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(376002)(396003)(346002)(136003)(451199015)(46966006)(36840700001)(40470700004)(52536014)(2906002)(5660300002)(4744005)(8936002)(478600001)(81166007)(356005)(40460700003)(41300700001)(33656002)(82310400005)(47076005)(6506007)(7696005)(82740400003)(70586007)(966005)(4326008)(53546011)(8676002)(70206006)(55016003)(40480700001)(26005)(54906003)(110136005)(9686003)(86362001)(83380400001)(336012)(36860700001)(316002)(186003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Sep 2022 01:45:58.2074
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 11fb90d4-5a03-4b6f-ff32-08daa02a0664
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT023.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR08MB5558

SGkgSmFuIGFuZCBBbmRyZXcsDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJv
bTogQW5kcmV3IENvb3BlciA8QW5kcmV3LkNvb3BlcjNAY2l0cml4LmNvbT4NCj4gU3ViamVjdDog
UmU6IFtQQVRDSF0gZHJpdmVycy9jaGFyOiBGaXggYnVpbGQgd2hlbiBDRVQtSUJUIGlzIGVuYWJs
ZWQNCj4gDQo+IE9uIDI2LzA5LzIwMjIgMTM6MjIsIEphbiBCZXVsaWNoIHdyb3RlOg0KPiA+IE9u
IDI2LjA5LjIwMjIgMTM6MDUsIEFuZHJldyBDb29wZXIgd3JvdGU6DQo+ID4+IGh0dHBzOi8vZ2l0
bGFiLmNvbS94ZW4tcHJvamVjdC94ZW4vLS9qb2JzLzMwODMwNjg5NTAjTDE3NjMNCj4gPj4NCj4g
Pj4gU2lnbmVkLW9mZi1ieTogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNv
bT4NCj4gPj4gRml4ZXM6IDAyMmU0MGVkZDRkYyAoImRyaXZlcnMvY2hhcjogYWxsb3cgdXNpbmcg
Ym90aCBkYmdwPXhoY2kgYW5kDQo+IGRiZ3A9ZWhjaSIpDQo+ID4gUmV2aWV3ZWQtYnk6IEphbiBC
ZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4NCj4gDQo+IFRoYW5rcy4NCg0KSSB0aGluayB0aGlz
IHBhdGNoIHNob3VsZCBkZWZpbml0ZWx5IGJlIG1lcmdlZCBpbiA0LjE3LCBkbyB5b3UgYWdyZWU/
DQoNCkFueXdheSwgaW4gY2FzZSB0aGUgcmVsZWFzZSBhY2sgdGFnIGlzIG5lZWRlZDoNClJlbGVh
c2UtYWNrZWQtYnk6IEhlbnJ5IFdhbmcgPEhlbnJ5LldhbmdAYXJtLmNvbT4NCg0KS2luZCByZWdh
cmRzLA0KSGVucnkNCg==

