Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 889C45FC5F2
	for <lists+xen-devel@lfdr.de>; Wed, 12 Oct 2022 15:08:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.421148.666336 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oibSg-0001Rc-0W; Wed, 12 Oct 2022 13:07:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 421148.666336; Wed, 12 Oct 2022 13:07:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oibSf-0001Ot-TB; Wed, 12 Oct 2022 13:07:49 +0000
Received: by outflank-mailman (input) for mailman id 421148;
 Wed, 12 Oct 2022 13:07:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TAAv=2N=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1oibSe-0001On-SY
 for xen-devel@lists.xenproject.org; Wed, 12 Oct 2022 13:07:48 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on2076.outbound.protection.outlook.com [40.107.104.76])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id dd41839b-4a2e-11ed-91b4-6bf2151ebd3b;
 Wed, 12 Oct 2022 15:07:46 +0200 (CEST)
Received: from AM6P192CA0093.EURP192.PROD.OUTLOOK.COM (2603:10a6:209:8d::34)
 by AS2PR08MB9642.eurprd08.prod.outlook.com (2603:10a6:20b:609::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5709.15; Wed, 12 Oct
 2022 13:07:42 +0000
Received: from VE1EUR03FT028.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:8d:cafe::38) by AM6P192CA0093.outlook.office365.com
 (2603:10a6:209:8d::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5709.21 via Frontend
 Transport; Wed, 12 Oct 2022 13:07:42 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT028.mail.protection.outlook.com (10.152.18.88) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5709.10 via Frontend Transport; Wed, 12 Oct 2022 13:07:41 +0000
Received: ("Tessian outbound 7761be2ecf00:v128");
 Wed, 12 Oct 2022 13:07:41 +0000
Received: from 0af00bf121f5.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 8BEBB238-F119-470C-A705-1CAC72510A2B.1; 
 Wed, 12 Oct 2022 13:07:34 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 0af00bf121f5.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 12 Oct 2022 13:07:34 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by PAWPR08MB8888.eurprd08.prod.outlook.com (2603:10a6:102:33c::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5709.21; Wed, 12 Oct
 2022 13:07:33 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::5cdc:31ff:2d2d:339]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::5cdc:31ff:2d2d:339%7]) with mapi id 15.20.5709.015; Wed, 12 Oct 2022
 13:07:33 +0000
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
X-Inumbo-ID: dd41839b-4a2e-11ed-91b4-6bf2151ebd3b
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=NJlunwqiYToYGUmwn5fDGH8QBc1utnRGsO7+tPnCCiA5hf+gPK44l753Z4USMZWHxw8m8NtBicmfcmB92FtHXnuy1QXzX4O9DOqqU7frfMUx5oJKPmiFBy9bL3gzYXyzEIAEgZH6I8XUmt4piYcs3omkDyfc73soKD2H0YM4h5kV439aD7lKcXPovvLQ9zwU8zDvJ2HbEK8s2xcuquSq+Q2U9sLSDumdMm8mikmDbvopTo1T5uRYtlsP76mtIUouxj4m8WFcisyCwG+cB34vgC+t0g3uN1Nfg0fv+KInzP+7VkGAZmKuT8O9SWPjkfvaY9UAeKZzeW3G0XDLDwhMPQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AkGbKIG4JPb9t+41eWW+cdl8K3bOYyJ6hqUvvd78PnY=;
 b=kA6YCLcC97fHFrHKp7epKqUYQr4OfFP6dlqREPPBCulH61NmhZGNPhXYyCoG74cAwkvlQTs+qphNKqclBo4nDqX36OMsS3VdPHYQF/YtrBMWzS8D09m/S3/GNpVshSVcVfR7hNxFu7mPLWqP6Hlwl3dR8+p61Qs3hYS8wcIWm2I7QjIjBzV9OeNTtY3TcgoQGWwKBlYyQsgRXD8wKkQLCF/ZfmkCNBLkuHKN7hdDpQWznOPX6V8igd+6pRRqFheqIh4JisKLPr8vbpPdeE+/QPaBcvccjHyTlopuzh51tnqMPI6bnKbQWcVvcR9B/CCZl8aZNZ9/SIWFErDAUiC1lg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AkGbKIG4JPb9t+41eWW+cdl8K3bOYyJ6hqUvvd78PnY=;
 b=5xu6Oh4OWMvVL4+dglqJDOFzzM0+TZLBy42Bbw26T8AHZEJTEt0SMHpuqwZN8eqtnW6VfRhYLnZqPKlmi4VooW7/qYW0aL1Yc0Mq7kU/kpugu7O0+NOyrDaj2Me9EHIwLg726uKrHJ5c2jzGM2dacZXEqhKzrb8W0sv2tTpa9cM=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=R/fnWCzFdAs9cisjKHCD31Z4dSwDLxHPMPYtgFVTxTkoEAOGJaMfOvaSF6tUfFXmCZcdAS5eKUllFN9UVBzyfY+M9BO1e6/3xqWdlp5QnN21TVQsp76xK5O/1wWeBILIAbChnqpVjTlmtjEfzD/ZsDl3PHuXoYEhl7H+WMhAysq1QwKPph54tU0bBp92tWio2BEyDCkq0cbSFz5Aef4Q1aLpv4Iwi+2KdxzfeBWGXOWKK/Cmoc3VQg+2251+QTqvEmlCH+WhjOiUqQ9l/dOl1En2gD+3aqIgt4lHi9nBs7i69zO/9OlB+iCuDx0A5KLp1HCkJxI/M7RrFmEl/6FREQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AkGbKIG4JPb9t+41eWW+cdl8K3bOYyJ6hqUvvd78PnY=;
 b=Pyb2hJ9N4yK3fL4An/SO22ZoTyG8BmVUkK+riGXNubwWBeVARYQpmHgHeJhTz+sUDWUG/GYtk2qwP0TbVL/q+zxntRAawPjR8vbzAf125UW55yTzdXv0pMYNFSy5x6d7YWfGLaGY6RaxpUWKRbvChfi+3c0SN+TNXlFxNn9rB8o1yYtLaNu5Pdex2j/B1l+NcbXbpfVJfvhENN6adVFBwd/33OcjduI2tikcxe3GtCX/wjUxeCNvZ0AU57RxL8fYmnwfBbm0lOz7T2hHQSInJ4wq9FvV9T8so7BNgcPbRF6uDWEo0HWChc/LYiM2HcN3JaXcf6id3wxR429Y5SQ80g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AkGbKIG4JPb9t+41eWW+cdl8K3bOYyJ6hqUvvd78PnY=;
 b=5xu6Oh4OWMvVL4+dglqJDOFzzM0+TZLBy42Bbw26T8AHZEJTEt0SMHpuqwZN8eqtnW6VfRhYLnZqPKlmi4VooW7/qYW0aL1Yc0Mq7kU/kpugu7O0+NOyrDaj2Me9EHIwLg726uKrHJ5c2jzGM2dacZXEqhKzrb8W0sv2tTpa9cM=
From: Henry Wang <Henry.Wang@arm.com>
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Julien Grall <julien@xen.org>, Anthony Perard <anthony.perard@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: RE: [PATCH][4.15] libxl/Arm: correct xc_shadow_control() invocation
 to fix build
Thread-Topic: [PATCH][4.15] libxl/Arm: correct xc_shadow_control() invocation
 to fix build
Thread-Index: AQHY3jtPuivbdxpwvESMJg2+jrcZsa4Kukrg
Date: Wed, 12 Oct 2022 13:07:33 +0000
Message-ID:
 <AS8PR08MB7991025777286F904D3FB6F192229@AS8PR08MB7991.eurprd08.prod.outlook.com>
References: <805d66fe-e116-254f-015a-59a760639653@suse.com>
In-Reply-To: <805d66fe-e116-254f-015a-59a760639653@suse.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 84D7BB2E0CAA1841BD17E2F1EA857CA0.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7991:EE_|PAWPR08MB8888:EE_|VE1EUR03FT028:EE_|AS2PR08MB9642:EE_
X-MS-Office365-Filtering-Correlation-Id: 69bcfb94-2729-47d0-3584-08daac52bee3
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 4YWg/NJIAnDXv9yMYPq6HkEheXha/HSxJiuhoAHHXqJ+PJgOhlgqORi4034BQUnewuXFVf7PCnHasF+Rt4E6nQfo2sfWeamzkWHne1WooJfXGcEwhufwvC5R+McTkGkg0XDiY3jAiNgXyv67G/aWfL2QcmnPtlBq4g3qN4mk8F9X8Sh8MQy0fIyzB6caXCTF+1Pz0O+0CutaLILeJuySKxtRFxJCSpt0MmhWfJlTutmE7MEY6bXefj6vOSCJncPeX2cBx5B36411kT+r6dZo1dmQhnQNg93aWJeVy/cbP34mN3399LP3I+Sbmt0tctsz+hqih1I2z5Zc94qBdGUXEUy8F0RfZGFk7GUWw2t89SXwvp/sx0IGUfUw/nT1a2lCsRQBMHyy7eWbp74wwYzPIcpWrL4f3ql59qvjNsJ/owHq/fFxgzVxXvYJYKvf0xlD9uXGjdxK2RsOwBOvTB2w2iQw6XM7kg7HKcu+1a6NooY35afuiAJE0BtaWVi9/RV2s4P3YKT0wovisCI2ldb5iZ8m1B1J0wwClYB81wAQh6CCJYIozwKaYVUBSFc1PsCoNjdpYNF2DJ3Wde/RtyJwqfu4jZzi+MXd9fHQKj7Hnp9Zk8loZI9OUoRY4GJhGkySytEIEbT2VSsH5siEwUeZr7YubLkk0mj/k/CYWSpRMFTW4iA76JW7gERxBfOdnCMjjoh5ALVJz9Q4btslqGZ7ID7RnyhOgOA1D2kBw0DqReW1tvAd0hbMaawVrHOACOZ1VjBVAX7LpzNdm71TnBXBSg==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(376002)(366004)(136003)(396003)(39860400002)(346002)(451199015)(4744005)(86362001)(83380400001)(55016003)(316002)(8676002)(2906002)(71200400001)(5660300002)(122000001)(4326008)(6506007)(8936002)(64756008)(66476007)(66946007)(66446008)(52536014)(66556008)(76116006)(33656002)(9686003)(110136005)(38070700005)(38100700002)(7696005)(41300700001)(478600001)(54906003)(186003);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR08MB8888
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT028.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	7d3ac9f8-4554-452f-cad9-08daac52b9f2
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	0xpj/Tx5MAI9zkgFRkiyLJn/rqyH5KntJlakYcJD67yC1S1JNcwuk4AyOa32kV7Q97XfCG9sp9+Ga/suGS+UDeg2C3OcBB9oHbDYblGfSElOwBwBWqqpQp4lt4lJ29CtsPZCxUkXnnH8e3AuLGUVNEilxwQR/Q7+qH8Wt62Fvr+0Z3aDv1+QgN4v4qS3atP5dxXgEsOUSMCdPRrCXvI/VgLfrnKamgL/uaYUS7ESMqX7ex1I7t5IuOCxFLaHGHfkHXvc4rHxh2Gf0cubJW6UMcrk8Mafy2JYw9tjdBFsGr87GccObjd/zuUkcPfrKxyYi/b4FYUqHQK71VMRL+eUr63qUzzbY0C5efVGmQ/ieAyNvuiWvmR86rcJ+ztK51OOHAGB6mhTpkd+3gFxU6gy24xEipGeXuzJAjfsAqYpHPAWxV5ha6R2RoZwp3Cj+heLlvNI7Onqf0KuzuavhB7O0ZDr07BX3pwXqmvvRXYxSZJmooTrdeKAukcXkF7Pd2dBzebuVXFeVYQLgKIm2QNvic5nFSD8WTI6zhjKeXaFHVVezT86Gs3YrIliy7fTqEz16wn0j36CKbpKED94DoPt2yQAnGWBzsN0G2dpkJdXz93CxGJm25hR4raqmAHfOD6/ea1iiEMdRpA+pAGkQwRzeatKLawvhxfcqfThuo4n2F2u4d0+p22lMCrDX/twqwyS7P6eNp6Lf/odVFV/H2++fYOVugjXtS4ZDt0Ym+55r/1s2SJjAgd1dMSOJMK/FMuvW6vPdAYOD0LnU/20BnycYA==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(136003)(39860400002)(396003)(346002)(376002)(451199015)(36840700001)(40470700004)(46966006)(83380400001)(8936002)(8676002)(52536014)(54906003)(33656002)(82310400005)(40460700003)(107886003)(47076005)(4326008)(110136005)(26005)(70586007)(70206006)(478600001)(356005)(36860700001)(81166007)(7696005)(41300700001)(6506007)(40480700001)(82740400003)(86362001)(55016003)(2906002)(316002)(186003)(336012)(5660300002)(9686003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2022 13:07:41.4797
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 69bcfb94-2729-47d0-3584-08daac52bee3
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT028.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB9642

SGkgSmFuLA0KDQpJIHRob3VnaHQgdG8gc2VuZCBteSBwYXRjaCBmb3IgZml4aW5nIHRoaXMgaXNz
dWUgdG9tb3Jyb3csIGJ1dCBzaW5jZSB5b3UgYXJlDQpzZW5kaW5nLi4uDQoNCj4gLS0tLS1Pcmln
aW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29t
Pg0KPiBTdWJqZWN0OiBbUEFUQ0hdWzQuMTVdIGxpYnhsL0FybTogY29ycmVjdCB4Y19zaGFkb3df
Y29udHJvbCgpIGludm9jYXRpb24gdG8NCj4gZml4IGJ1aWxkDQo+IA0KPiBUaGUgYmFja3BvcnQg
ZGlkbid0IGFkYXB0IHRvIHRoZSBlYXJsaWVyIGZ1bmN0aW9uIHByb3RvdHlwZSB0YWtpbmcgbW9y
ZQ0KPiAodW51c2VkIGhlcmUpIGFyZ3VtZW50cy4NCj4gDQo+IEZpeGVzOiBjNTIxNTA0NDU3OGUg
KCJ4ZW4vYXJtLCBsaWJ4bDogSW1wbGVtZW50IFhFTl9ET01DVExfc2hhZG93X29wDQo+IGZvciBB
cm0iKQ0KPiBTaWduZWQtb2ZmLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+DQo+
IC0tLQ0KPiBBbHNvIGFwcGxpY2FibGUgdG8gNC4xNCBhbmQgNC4xMy4NCj4gDQo+IC0tLSBhL3Rv
b2xzL2xpYnMvbGlnaHQvbGlieGxfYXJtLmMNCj4gKysrIGIvdG9vbHMvbGlicy9saWdodC9saWJ4
bF9hcm0uYw0KPiBAQCAtMTM2LDcgKzEzNiw3IEBAIGludCBsaWJ4bF9fYXJjaF9kb21haW5fY3Jl
YXRlKGxpYnhsX19nYyAqZ2MsDQo+IA0KDQpUaGUgZGVmaW5pdGlvbiBvZiBzaGFkb3dfbWIgc2hv
dWxkIGFsc28gYmUgY2hhbmdlZCB0byB1bnNpZ25lZCBsb25nLA0KYW5kLi4uDQoNCj4gICAgICBp
bnQgciA9IHhjX3NoYWRvd19jb250cm9sKGN0eC0+eGNoLCBkb21pZCwNCj4gICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIFhFTl9ET01DVExfU0hBRE9XX09QX1NFVF9BTExPQ0FUSU9OLA0K
PiAtICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgJnNoYWRvd19tYiwgMCk7DQo+ICsgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICBOVUxMLCAwLCAmc2hhZG93X21iLCAwLCBOVUxMKTsN
Cj4gICAgICBpZiAocikgew0KPiAgICAgICAgICBMT0dFRChFUlJPUiwgZG9taWQsDQo+ICAgICAg
ICAgICAgICAgICJGYWlsZWQgdG8gc2V0ICV1IE1pQiBzaGFkb3cgYWxsb2NhdGlvbiIsIHNoYWRv
d19tYik7DQoNCi4uLmhlcmUgc2hvdWxkIGJlICVsdS4NCg0KS2luZCByZWdhcmRzLA0KSGVucnkN
Cg==

