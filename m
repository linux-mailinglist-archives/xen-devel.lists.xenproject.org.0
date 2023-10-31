Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E76097DD120
	for <lists+xen-devel@lfdr.de>; Tue, 31 Oct 2023 17:03:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.625927.975719 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qxrCC-0008DE-Cu; Tue, 31 Oct 2023 16:02:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 625927.975719; Tue, 31 Oct 2023 16:02:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qxrCC-00089t-A3; Tue, 31 Oct 2023 16:02:24 +0000
Received: by outflank-mailman (input) for mailman id 625927;
 Tue, 31 Oct 2023 16:02:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kxST=GN=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1qxrCA-00089n-Sl
 for xen-devel@lists.xenproject.org; Tue, 31 Oct 2023 16:02:22 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on20626.outbound.protection.outlook.com
 [2a01:111:f400:7d00::626])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id dee00a84-7806-11ee-9b0e-b553b5be7939;
 Tue, 31 Oct 2023 17:02:20 +0100 (CET)
Received: from AS4P190CA0048.EURP190.PROD.OUTLOOK.COM (2603:10a6:20b:656::21)
 by GV2PR08MB9208.eurprd08.prod.outlook.com (2603:10a6:150:dc::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.27; Tue, 31 Oct
 2023 16:02:12 +0000
Received: from AM3PEPF0000A79C.eurprd04.prod.outlook.com
 (2603:10a6:20b:656:cafe::9f) by AS4P190CA0048.outlook.office365.com
 (2603:10a6:20b:656::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.29 via Frontend
 Transport; Tue, 31 Oct 2023 16:02:11 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM3PEPF0000A79C.mail.protection.outlook.com (10.167.16.107) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6954.19 via Frontend Transport; Tue, 31 Oct 2023 16:02:11 +0000
Received: ("Tessian outbound 7c4ecdadb9e7:v228");
 Tue, 31 Oct 2023 16:02:11 +0000
Received: from c72088653c95.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 DA8A7AA7-7141-4002-85F6-233496A65715.1; 
 Tue, 31 Oct 2023 16:02:04 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id c72088653c95.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 31 Oct 2023 16:02:04 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by PAXPR08MB6413.eurprd08.prod.outlook.com (2603:10a6:102:de::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.22; Tue, 31 Oct
 2023 16:01:57 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::ae6e:f96c:f2f3:efc9]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::ae6e:f96c:f2f3:efc9%4]) with mapi id 15.20.6933.028; Tue, 31 Oct 2023
 16:01:57 +0000
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
X-Inumbo-ID: dee00a84-7806-11ee-9b0e-b553b5be7939
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=TZpGPwpVN/6sftwhEK1SXSowJInuWJ9EPW9fVp59TtYw+tfwcrwrIe2QR+h1v974KY/PfvcImt4+9QzUHOK/4+BVgDCIeLjWKiaSKTr5TtUrpAKpSS3FHczdkWUmfyRlHxUQ1z59AWwyPYFfHknV7VT8ChCuKpM5qJQAfRzCbmqdE5OQjBG/cGUz+4gtNrxcmL5vLGTMrWgC9cusBwQZfjmrvCJvdbKE/3O5DP/C8uVIJ8yJ4piMDzGyZjAQGfoVpJxfVvt/1Ir/My9yYpMPIf28C4Irvv84ZTyS4u/Mg9vTJMEH0oaT0fekiZZX7N8YPT6CcU616K/KgTqAYimzjQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e/N8U2k6gmElyQft17Xfa3CcbHOjrXr3IN728jbkEZ0=;
 b=NOzSm8Wl+qNG6iBSwW5c/+MpCHKNZaJzUqTLjaF7VYsIVis0xayxeym3x+FYs3Ve2oNhJxVBe0oD6ubKYTw/0hEkcQznW7Xs+6qM/lq+6taenWRuJ7AwzEMvEGfZOMh8yzkivuc5o7qqW6xAJOiuTrh8hScfRv0Qk78z8ICOqV0e0Bxta7E2cUhx4C+lDkdpfYLvj71hya2BLbmCGcHlrFTN8SCIuyWUrFFo0sgB3p+YKY81ZJg2KeekgsK4KL3QMLaYTMIeObmfLjPUZMcgPTeXD3n3S04Bh/K5+99N9IWrpnI6jVIG5u/1RUpoSTtL0YAOQlxsxybS4UCMtNp6RQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e/N8U2k6gmElyQft17Xfa3CcbHOjrXr3IN728jbkEZ0=;
 b=k2YP292ieJp84jKXDOS5488ciREsT6DKW7AHhCbRM1U9uFcX8lPkJI0WBmGOxL5bCQEenkryH8arJWJgQCcEM7xSB/o61yL0aotc5lycG/urM6UT6my6abKTPg9arBaqW/GtC+RGaxE6BOjIN54ggucVVxgzM/NOR2Ff9/hAgow=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: f695cc5151706297
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=agNU9u84z0XW0jPVC09RJgYPwAlDuwQYJZtQvcd7DJOxzMxYOvCRLubCHh5ciXG8GCmJMCuUGEmse8JJwQwTeQ30PAHqcnp29M9ykokrXfK90RMM+1w1FWMyBqCbhat0km7NopsxWxcScYrme6lj8UFEraR2b2hFD6cIvrBxGHpwYh2PJEOB5P1Jza0dErEOhLRjOBwoDUDNgCD03z4ObpzXog8l5soNVwOOGZ4ir9vxtKTy5gmZP6rCr4IHSydAIWsGb8HLEw9mMEtjkEdVijQX10ViVC6LS11hYKGJi4FtCBs0AJ8TwVOj2jdR97cP36ZxNLtVipX2fCB2pvotUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e/N8U2k6gmElyQft17Xfa3CcbHOjrXr3IN728jbkEZ0=;
 b=QsVBGE7LJo8g/dsr5E1nEO9m45guNbUVFnhft2g/C/YC6BS3zf6Dp20A1gsEijjBxa7fPR1LIWNG6mUVpVMjPRpSJNUWAayZvcxOTQQmKtB25xfIZu8/xIaPbASnP+JsJr1/2vH0L8zlD7AXh5ZvUb91UBWQXEhZViRUaM80t9zdXbHj2dB7PayXBjWgBc26BZoyLnD/2rqLLT7NM4U6XovNTMFLVfwU3ext7YStDAwlMK/HUAnoZhuYfjggwDATssrH3/EdMUOBzuxX8PTffLMwF/valnLL1EnzbL660ustjsj9peZg/ZRoMJVi2yUotM7oMIVYtHEbFhvmRZ7RnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e/N8U2k6gmElyQft17Xfa3CcbHOjrXr3IN728jbkEZ0=;
 b=k2YP292ieJp84jKXDOS5488ciREsT6DKW7AHhCbRM1U9uFcX8lPkJI0WBmGOxL5bCQEenkryH8arJWJgQCcEM7xSB/o61yL0aotc5lycG/urM6UT6my6abKTPg9arBaqW/GtC+RGaxE6BOjIN54ggucVVxgzM/NOR2Ff9/hAgow=
From: Henry Wang <Henry.Wang@arm.com>
To: "committers@xenproject.org" <committers@xenproject.org>, Xen-devel
	<xen-devel@lists.xenproject.org>
CC: Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Jan Beulich <jbeulich@suse.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>,
	Community Manager <community.manager@xenproject.org>
Subject: Re: Commit moratorium for branching 4.18
Thread-Topic: Commit moratorium for branching 4.18
Thread-Index: AQHaByyrPO+3wCfL+UGXB2cQc11Ty7BkGL6A
Date: Tue, 31 Oct 2023 16:01:57 +0000
Message-ID: <6AA9BF50-8717-437C-9C09-4D81234A8BFB@arm.com>
References: <E63E9C8C-471E-4524-A61B-EB5BA4618288@arm.com>
In-Reply-To: <E63E9C8C-471E-4524-A61B-EB5BA4618288@arm.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.700.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7991:EE_|PAXPR08MB6413:EE_|AM3PEPF0000A79C:EE_|GV2PR08MB9208:EE_
X-MS-Office365-Filtering-Correlation-Id: c22fbe2b-26ef-4e91-80f5-08dbda2abe2b
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 ZT7miL3AYjWYTzbRQB+SrUnenaczTAJTWF6HmPAThkh30B09+wwYW6ibd+1VSpMs+3GQnGppROSTpMJZmHwRFTJoujZlgLMuUfGAwQEJKVvF6OPAtPHSuYvfZRhGxeBYD3Vunxcu042kS64pOKCEUzj39XOkq42s9VCAHhCb1cXT5kLEgvwoaCiQeiF9gFg5yZpUCPv0He4ktolJNR4LYjsTIrg4aVSSuOvOYZ2sLLWgibwkvdGiAhojHgePCAuUgTnqLqagU8dz29H3Y45pBtEeezEQaEkc1JJ6SJZ/F5A+mlJ1DKs9abbomcHXeblTsgEWXPbH/E8xIuLElo4XK2E/MU+GJNis64MHb1egGDIlFvWq5ezLCkIV30umGNZ92qLEVwalR1YDUTjdku9LJc4XEtBiyaHQShgac5qXaWQLMgHr5Qz4Dt6ZOXKqWfwOgIRsriCflWrPom0DOIp6tLnblQYPbzFgErZmBBv3b6AXsTSxAndjRMr/9ewszr5ZdqGACe0ddakOJRnlM/pyhCj9FZ9zDmHjFEZL4TM75Tek8/pZwKH02dLXOFOy04zk5igRwMwUJC+8K4v/9m/gWb+QOqyXwBoOURLQYpWqXxeV0xW/FwvjoOPV9gKlyMVO9IrPyOq38qoXlXrAZrwnBw==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(376002)(396003)(136003)(366004)(39860400002)(230922051799003)(186009)(1800799009)(64100799003)(451199024)(71200400001)(83380400001)(91956017)(4744005)(41300700001)(110136005)(86362001)(33656002)(2906002)(26005)(36756003)(5660300002)(2616005)(38100700002)(122000001)(38070700009)(66446008)(6486002)(6512007)(66946007)(54906003)(53546011)(76116006)(66556008)(64756008)(8936002)(66476007)(4326008)(316002)(478600001)(8676002)(6506007)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <5311B3A7C984374BAFC2CE74D9FEC479@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB6413
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM3PEPF0000A79C.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	551b6500-c07a-488a-0ebf-08dbda2ab57d
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ks4CUsc/fkLdPE8M11ZUSOTmSSg4QnEbVbC3vvVUFHLhOIQH0seZBEBeuK0HyoHcnuV5UXUeTATcGj9dZuNTmV+1Y9V7Bv7KjbYDJJg2dTRiLaJjd5t0fB8ThgTZxzFDszKiUafLqPQhBdq/fFKQnkyrnto4+yZ5RuERwHtVIxT5HUDpKFbZ0T//5+YTRijYnYStG7djKpz8jJq8lcs86pWWA3dL8Wm40FsG0S0qC4S7HdfR+Pqa/6pFqP5vjtspNeUad89n/4EHMa0cwGPBxAcj/dsT4AiEe6A2RiLqn+I2Ybi0+2NC7k5mZNq1EeUEXJWpjARIxUusUzckvQcfO+BmAuOhKDOz+oKcCHYS0lwkKIHx8QKdYOIxY6cfnfzO8CdCT/LiALo84YOpfNHiFRXxnRTAghSgomkVMWv680EV93zHkqWhBbbtXKdm4FVNt6uz6CdmtJsq6FE64+VG7rqfQYo88XkYanncQkVjTEeOLoYihh2WkVoTNPWun8I1RJsUB6428qX92HtG5hlbW4XOCNCvTfRYeL5+K37uN6HpVGOxbhNdC6cMoPm44Jkzfp8LPgnEKr7DMMMK18nnbKTrqfEQZF9d/vX9n9fKtdoVyrC9gpV1dxfc/0OcjzgNPFrMO5dLW1OXUXZtaXd4Nj6p7oGm5rD/Gj4UrO+J8qkk7jfAIXK17tVtvcMZ2MZO1UTNEJd82MolmMm7mONeVknU75s9Or9Zf52JTDz1taUKovhfbTmR6LqKA9fc/xdk
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(136003)(376002)(346002)(396003)(39860400002)(230922051799003)(64100799003)(451199024)(1800799009)(82310400011)(186009)(36840700001)(46966006)(40470700004)(6512007)(6506007)(47076005)(40480700001)(478600001)(6486002)(36756003)(336012)(70586007)(82740400003)(70206006)(26005)(316002)(2616005)(356005)(36860700001)(83380400001)(53546011)(54906003)(81166007)(8676002)(4326008)(8936002)(40460700003)(5660300002)(4744005)(33656002)(110136005)(86362001)(2906002)(41300700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Oct 2023 16:02:11.6592
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c22fbe2b-26ef-4e91-80f5-08dbda2abe2b
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM3PEPF0000A79C.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR08MB9208

Hi,

> On Oct 25, 2023, at 18:18, Henry Wang <Henry.Wang@arm.com> wrote:
>=20
> Hi committers,
>=20
> We will be branching the tree for Xen 4.18 in the next few days. Please=20
> avoid committing any new patches to staging until further notice.

The branching has been finished. The staging is reopened for 4.19 developme=
nt.

Thanks.

Kind regards,
Henry

>=20
> Kind regards,
> Henry


