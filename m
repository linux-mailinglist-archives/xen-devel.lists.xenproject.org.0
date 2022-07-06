Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F975567FD9
	for <lists+xen-devel@lfdr.de>; Wed,  6 Jul 2022 09:30:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.361836.591579 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o8zUV-0004pl-VJ; Wed, 06 Jul 2022 07:30:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 361836.591579; Wed, 06 Jul 2022 07:30:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o8zUV-0004ma-QM; Wed, 06 Jul 2022 07:30:31 +0000
Received: by outflank-mailman (input) for mailman id 361836;
 Wed, 06 Jul 2022 07:30:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uO3f=XL=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1o8zUU-0004kS-G3
 for xen-devel@lists.xenproject.org; Wed, 06 Jul 2022 07:30:30 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2077.outbound.protection.outlook.com [40.107.20.77])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 824d763c-fcfd-11ec-bd2d-47488cf2e6aa;
 Wed, 06 Jul 2022 09:30:28 +0200 (CEST)
Received: from DB7PR05CA0024.eurprd05.prod.outlook.com (2603:10a6:10:36::37)
 by AS4PR08MB7805.eurprd08.prod.outlook.com (2603:10a6:20b:518::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.21; Wed, 6 Jul
 2022 07:30:26 +0000
Received: from DBAEUR03FT024.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:36:cafe::4c) by DB7PR05CA0024.outlook.office365.com
 (2603:10a6:10:36::37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.15 via Frontend
 Transport; Wed, 6 Jul 2022 07:30:26 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT024.mail.protection.outlook.com (100.127.142.163) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5417.15 via Frontend Transport; Wed, 6 Jul 2022 07:30:26 +0000
Received: ("Tessian outbound 190453a6d737:v122");
 Wed, 06 Jul 2022 07:30:22 +0000
Received: from 2e3c473d5b9b.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 7F5B1429-CE04-42A0-BD26-EFCF42EF5F0A.1; 
 Wed, 06 Jul 2022 07:30:17 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 2e3c473d5b9b.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 06 Jul 2022 07:30:17 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by PR2PR08MB4731.eurprd08.prod.outlook.com (2603:10a6:101:18::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.15; Wed, 6 Jul
 2022 07:30:14 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::502f:a77a:aba1:f3ee]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::502f:a77a:aba1:f3ee%6]) with mapi id 15.20.5395.020; Wed, 6 Jul 2022
 07:30:14 +0000
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
X-Inumbo-ID: 824d763c-fcfd-11ec-bd2d-47488cf2e6aa
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=Y0zGq8sAHJ2yvA22E3YRtsvPbXThvZNgs4RLrQuQczgILBsbam3FJ78aBdkeGlVxfS4ZtvSGfzAaA/OFMfXrl6mAOmhnxLLAI0Xv+XMy5g0C7tcUhvsZ7yeikJgn6mpOlkJ4U91IlNNxhmMVg6FJWfE55EysRe03L+aHudPE13aNj0dxvyc5AdPi41rKVyr6ugDXHH0gCfBPXkvsHk2T4r8kIUm03pvEawTH9ow1S4Jgu0kP7uZGt6ZVgENCmxcoCmnQ7E+vzYJi376FzjVLq3d5jmr44eiFMqBNzWBEZQtELYjdDrHQA2Ou/7QY2+FqrEsgyZROiAW3ekk3LrvOJA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xUxwgRynfVWRyyO6V5Lw4277BR0PPP6KDUF6z3x4pMY=;
 b=YiWhVVdFzbstVYlWKPhhxiWq8qVwSoeus/uJJjGrwvKgfh5YPgIhIWzWaQcXD2kwURtHTvmIOE6ngcgSTVO4+YmXiE/zdGZtsqWDiK2QEy7eb7WP+QMHp9lO/bBjvDAtPu2nFAUmDxLof1oZobP4aUw+BOICdIOv4lYRbX8QdY3UDZNtqwcdR9im6xkL0ckJtDJ/SNhkBEy+yWgqkAkub+DoZwOvEUZZI4HrDcynRGAFYrxkN68qA0B2vDqoE0pht0QjQjzKYxTfnmeQRSpWvp7T8H6UtpSLOCQVmopxvjrFCpPV8+yMUYFkDuRNVluADSrl50i2TQBIgjUStYhaHA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xUxwgRynfVWRyyO6V5Lw4277BR0PPP6KDUF6z3x4pMY=;
 b=tl0N4ZGDq+Ft50WFQIX4t8K3E1uzPbzodBqQVAFtrbj4YYQHAhxH6o0JS7/+1Uz3HAuqTYU41XJj99VSffLUfz/bumVnllXWdBVXvsVeCEi7Jq6liQcSiQBFQZ4rIJKs53kezP+sH8It0PfDnwItUewaDxFHJEc0Ium1q0q2e4w=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XYQIerRdI8dnm8ma1hhtOwK2eU4OM8ygiklWGOQMpjsUYlQ7dbFHuCXVi+g3w9grA5MNsFpdFfRCzhHKOfovdv0+H/4S6reO08J4k3LNmNz+uDRzODAJEGLQF+ySp30cyGTEoG1sESoh+r8cWPF9GIy+ZWQHXVD9W1CAVb0yFpS9SGCsIeIIDBTHEqq2m5kU5z0IAjaCXUL/RV7XSskx552CD3yG5gOjtD4ujl/9Onw1RpdPVJ42NxsOt593EdpWI0YirHIU9gfKnV8qSMytesPUESIYTnSUIGXHFnj0ipFxTS3YsAFQBKHvPe3gz2W4JEhK6gExINJJDO3sSAafJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xUxwgRynfVWRyyO6V5Lw4277BR0PPP6KDUF6z3x4pMY=;
 b=eko2ZzTNQ9muOiDdnq5r/MwbQWi64yh68bANIp4dAq/h0YbcKft+nKvw7PF1wxdLz6bIunEzaodzU/EgXMz+FBN0J+Sf2ttwvonrvLVjjNbBA8atUYiRbbc9oVY/KmwykrpxWkG+muuYvUzQoxj4a78mULqLtufkbxGG7VILg0ZMJqVlGX55q110Rqt1HjLb7pTdqnYEtpcPQhJgrlba4rVdBqc5ABjYjRt4137JIi+QN9GhWWfe2xTf94rdL5+XoM1jaCm/X9XXCOHmii6kBDhHvDvD4gAQ/m1nLd08aSW0xJvFQ0SqxB8SOsgXOA/QfZYvsNrWMk2/KTA99bgGjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xUxwgRynfVWRyyO6V5Lw4277BR0PPP6KDUF6z3x4pMY=;
 b=tl0N4ZGDq+Ft50WFQIX4t8K3E1uzPbzodBqQVAFtrbj4YYQHAhxH6o0JS7/+1Uz3HAuqTYU41XJj99VSffLUfz/bumVnllXWdBVXvsVeCEi7Jq6liQcSiQBFQZ4rIJKs53kezP+sH8It0PfDnwItUewaDxFHJEc0Ium1q0q2e4w=
From: Henry Wang <Henry.Wang@arm.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Matias Ezequiel Vara Larsen <matias.vara@vates.fr>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Matias Ezequiel Vara Larsen
	<matiasevara@gmail.com>, George Dunlap <george.dunlap@citrix.com>, Jan
 Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Subject: RE: [RFC PATCH] xen/docs: Document acquire resource interface
Thread-Topic: [RFC PATCH] xen/docs: Document acquire resource interface
Thread-Index: AQHYb2Bcb8YJXiCzsUWjw/st9fAs9q1xKIAQ
Date: Wed, 6 Jul 2022 07:30:14 +0000
Message-ID:
 <AS8PR08MB799159AD378BB7ACA4E253BF92809@AS8PR08MB7991.eurprd08.prod.outlook.com>
References:
 <324b2ea5b95ef5233202aa8eed2085c665259753.1653390261.git.matias.vara@vates.fr>
In-Reply-To:
 <324b2ea5b95ef5233202aa8eed2085c665259753.1653390261.git.matias.vara@vates.fr>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: B742414786C5DE46B53B18E613BCF0F5.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 9bab420d-55be-476b-9106-08da5f21654e
x-ms-traffictypediagnostic:
	PR2PR08MB4731:EE_|DBAEUR03FT024:EE_|AS4PR08MB7805:EE_
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 kdpppQVgZC7kyiuC7h8nbP4XsQ3MIkFWx88d5V6c7bTe4FCuzE2m17i9sEmCYfFWzxI8SlLGuDve5Lqv9B4SY8pyESoBcVRTqLLxCPU4ghZZ/uzyDl9YaAb5ZAWP8BDJRWWsbm04V/MT4htfEsB25svQBVLufWuEQzWo25b4CsPnL2Jkmy3di/rmJ484+F3kHc6osTkdYJ+cjFmO/H/5993DECNyFGl80bK4UZiQqGpceuphKDOy7qk7Ygg2d64PXNKl9imhqleD/Ky+6DS5eRR02VOHZyG6CW0cJWO0deQMEV9z3EGAGso1q/M/vbwVEIVKXJJ6Kr1zgnATmseX1YerQIUhwcxplxT9SrXB67fyRZxR4NLIzxo10s6+J1a9z3NkV8aPJexH631qVKj5UVW5V+niVMsM6OJf4wU4k1sDAQeMFWYGWuiGkLucrJDdVRFs4QotmWhjcuCkV+cEDhze/nxEPsNdyUmn1IFM2rC4tn0frGlzj3ouEv/ZOFQweGXpiHYBcRchVtdX/fhWmPNg9+m57HceCnvv7m0uqXDMlkwIjCtdqB5RLuErejOc/+32dwNDyFG5OpVdZadMyjxK71mVwe7lBhwFDHjIrEbOLLvW7Hu2oJES0r8ePyKJkFsKbpArvfg4iD61IbSISO7M4e5/yYXff6rlUVhS5e1FDg6T1/MN6po35kd+ozIzgKUJ+pC+awzGRzqh5Szsu0ZxJhJccRZblxJr9obeFrbM/TkFjoyLJkgTVuP8ecu2VtYuAWD0DZkH5zUOdsaoutpIqyuHOFo8LgRQXg25uUURyODZ2amBf7DkdJ1u8m3SrofaBZhXrp/bPh9bFMvJXTPSKp7wFNZjHBoe9hJ7Vho=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(136003)(39860400002)(396003)(376002)(366004)(346002)(83380400001)(41300700001)(52536014)(186003)(8936002)(30864003)(6506007)(7696005)(86362001)(5660300002)(2906002)(38070700005)(66556008)(966005)(478600001)(55016003)(8676002)(33656002)(38100700002)(4326008)(64756008)(66446008)(66476007)(76116006)(66946007)(9686003)(26005)(316002)(71200400001)(54906003)(122000001)(6916009);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR2PR08MB4731
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT024.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	263e9cec-9442-4f95-4eaf-08da5f215e54
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	VC49y8N3bVI1cnx2RUsxjmZfh0DmQBIOWxrKnIrKYQsIJvuk23dYMIRq8inDgnAvl4ke92QwD49n9fyFGyUMKxm0RFtSBljsif8NvHGHh7OvEhk19UN6xQlMUl7TkDa5XqSES8yV3brGVU0uqUnvk8SfxkSwNd0ovjTXgTFbkWhUwotKD0jufntqWlmPm0D1JLcmCzJsV2boHeM9ccj+vtVzXVPcMe5oCVRSi9if+9NQCGstAm1PGvrRD/Vo3oJQwR9iGWMTaf/EuJnFEBoGGlqQpgcKnkijpf5aYZpeWJkxtOFblM9ps3L4EbILkIbXYp3MUaZ7EnBaJhQkj0LKO0YVrP0TpbV3N+GnJld943vUzMdg3J64iatRBWflfH2/EupALm9506VfAxHccWlmnnv8XazgLrh8aAiDgxmSMAmtuqJ0EgVWaStgvZ492XTNYAuvpIfRk7seF+Gl1bMxS5j/I3QiYkANgLOsrFUg+jI37z1hFLpuSAeKsqiUiCRpp423KsBLgArmh9e1ilrtwA2489MEdEqjE7xPedGkn08qLFm+A30D1JsSSWZ2xxoBOKgMEL+4Rl0snekfQAA1Z1bCXwYWKGLfL1ogUiPFcAHyGbsZ5G7/1RVcNbV6gKNL51fjL/Mt1cuSNAzxV1dIDOyqK7RVrTcdVafyTUJxmilnalLKk5jhoUOeB9B1VWRpn4cM6H6EqJBjJIQ9KIFb0GrtM5AU1BoigvxrXw7Cy0in7c4AiMxVI89yWU8Lvy39qFz4f1jUEa2/3qG0BUhnukaeuQkUSKtP5ytjmExfb01kuPeeizJKDevOFLjlg4dmMovYYpnE6I9sjHPad998UtuSSbA50K6slH+Y3n0EiEs=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(136003)(396003)(346002)(376002)(39860400002)(40470700004)(36840700001)(46966006)(478600001)(966005)(2906002)(82310400005)(356005)(86362001)(316002)(8676002)(4326008)(52536014)(70206006)(70586007)(81166007)(82740400003)(36860700001)(40480700001)(40460700003)(6916009)(54906003)(8936002)(5660300002)(30864003)(55016003)(26005)(33656002)(41300700001)(9686003)(336012)(186003)(7696005)(47076005)(83380400001)(6506007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2022 07:30:26.4553
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9bab420d-55be-476b-9106-08da5f21654e
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT024.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR08MB7805

Hi,

It seems that this patch has been stale for more than a month. From my
understanding, it is closely related to [1] and feedbacks from maintainers
are needed. So I am sending this email as a gentle reminder about that.
Thanks!

Kind regards,
Henry=20

[1] https://patchwork.kernel.org/project/xen-devel/list/?series=3D642393

> -----Original Message-----
> Subject: [RFC PATCH] xen/docs: Document acquire resource interface
>=20
> This commit creates a new doc to document the acquire resource interface.
> This
> is a reference document.
>=20
> Signed-off-by: Matias Ezequiel Vara Larsen <matias.vara@vates.fr>
> ---
> RFC: The current document still contains TODOs. I am not really sure why
> different resources are implemented differently. I would like to understa=
nd it
> better so I can document it and then easily build new resources. I struct=
ured
> the document in two sections but I am not sure if that is the right way t=
o do
> it.
>=20
> ---
>  .../acquire_resource_reference.rst            | 337 ++++++++++++++++++
>  docs/hypervisor-guide/index.rst               |   2 +
>  2 files changed, 339 insertions(+)
>  create mode 100644 docs/hypervisor-guide/acquire_resource_reference.rst
>=20
> diff --git a/docs/hypervisor-guide/acquire_resource_reference.rst
> b/docs/hypervisor-guide/acquire_resource_reference.rst
> new file mode 100644
> index 0000000000..a9944aae1d
> --- /dev/null
> +++ b/docs/hypervisor-guide/acquire_resource_reference.rst
> @@ -0,0 +1,337 @@
> +.. SPDX-License-Identifier: CC-BY-4.0
> +
> +Acquire resource reference
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D
> +
> +Acquire resource allows you to share a resource between a domain and a
> dom0 pv
> +tool.  Resources are generally represented by pages that are mapped into
> the pv
> +tool memory space. These pages are accessed by Xen and they may or may
> not be
> +accessed by the DomU itself. This document describes the api to build pv
> tools.
> +The document also describes the software components required to create
> and
> +expose a domain's resource. This is not a tutorial or a how-to guide. It
> merely
> +describes the machinery that is already described in the code itself.
> +
> +.. warning::
> +
> +    The code in this document may already be out of date, however it may
> +    be enough to illustrate how the acquire resource interface works.
> +
> +
> +PV tool API
> +-----------
> +
> +This section describes the api to map a resource from a pv tool. The api=
 is
> based
> +on the following functions:
> +
> +* xenforeignmemory_open()
> +
> +* xenforeignmemory_resource_size()
> +
> +* xenforeignmemory_map_resource()
> +
> +* xenforeignmemory_unmap_resource()
> +
> +The ``xenforeignmemory_open()`` function gets the handler that is used b=
y
> the
> +rest of the functions:
> +
> +.. code-block:: c
> +
> +   fh =3D xenforeignmemory_open(NULL, 0);
> +
> +The ``xenforeignmemory_resource_size()`` function gets the size of the
> resource.
> +For example, in the following code, we get the size of the
> +``XENMEM_RESOURCE_VMTRACE_BUF``:
> +
> +.. code-block:: c
> +
> +    rc =3D xenforeignmemory_resource_size(fh, domid,
> XENMEM_resource_vmtrace_buf, vcpu, &size);
> +
> +The size of the resource is returned in ``size`` in bytes.
> +
> +The ``xenforeignmemory_map_resource()`` function maps a domain's
> resource. The
> +function is declared as follows:
> +
> +.. code-block:: c
> +
> +    xenforeignmemory_resource_handle
> *xenforeignmemory_map_resource(
> +        xenforeignmemory_handle *fmem, domid_t domid, unsigned int type,
> +        unsigned int id, unsigned long frame, unsigned long nr_frames,
> +        void **paddr, int prot, int flags);
> +
> +The size of the resource is in number of frames. For example, **QEMU**
> uses it
> +to map the ioreq server between the domain and QEMU:
> +
> +.. code-block:: c
> +
> +    fres =3D xenforeignmemory_map_resource(xen_fmem, xen_domid,
> XENMEM_resource_ioreq_server,
> +         state->ioservid, 0, 2, &addr, PROT_READ | PROT_WRITE, 0);
> +
> +
> +The third parameter corresponds with the resource that we request from
> the
> +domain, e.g., ``XENMEM_resource_ioreq_server``. The seventh parameter
> returns a
> +point-to-pointer to the address of the mapped resource.
> +
> +Finally, the ``xenforeignmemory_unmap_resource()`` function unmaps the
> region:
> +
> +.. code-block:: c
> +    :caption: tools/misc/xen-vmtrace.c
> +
> +    if ( fres && xenforeignmemory_unmap_resource(fh, fres) )
> +        perror("xenforeignmemory_unmap_resource()");
> +
> +Sharing a resource with a pv tool
> +---------------------------------
> +
> +In this section, we describe how to build a new resource and share it wi=
th a
> pv
> +too. Resources are defined in ``xen/include/public/memory.h``. In Xen-4.=
16,
> +there are three resources:
> +
> +.. code-block:: c
> +    :caption: xen/include/public/memory.h
> +
> +    #define XENMEM_resource_ioreq_server 0
> +    #define XENMEM_resource_grant_table 1
> +    #define XENMEM_resource_vmtrace_buf 2
> +
> +The ``resource_max_frames()`` function returns the size of a resource. T=
he
> +resource may provide a handler to get the size. This is the definition o=
f the
> +``resource_max_frame()`` function:
> +
> +.. code-block:: c
> +    :linenos:
> +    :caption: xen/common/memory.c
> +
> +    static unsigned int resource_max_frames(const struct domain *d,
> +                                            unsigned int type, unsigned =
int id)
> +    {
> +        switch ( type )
> +        {
> +        case XENMEM_resource_grant_table:
> +            return gnttab_resource_max_frames(d, id);
> +
> +        case XENMEM_resource_ioreq_server:
> +            return ioreq_server_max_frames(d);
> +
> +        case XENMEM_resource_vmtrace_buf:
> +            return d->vmtrace_size >> PAGE_SHIFT;
> +
> +        default:
> +            return -EOPNOTSUPP;
> +        }
> +    }
> +
> +The ``_acquire_resource()`` function invokes the corresponding handler t=
hat
> maps
> +the resource. The handler relies on ``type`` to select the right handler=
:
> +
> +.. code-block:: c
> +    :linenos:
> +    :caption: xen/common/memory.c
> +
> +    static int _acquire_resource(
> +        struct domain *d, unsigned int type, unsigned int id, unsigned i=
nt frame,
> +        unsigned int nr_frames, xen_pfn_t mfn_list[])
> +    {
> +        switch ( type )
> +        {
> +        case XENMEM_resource_grant_table:
> +            return gnttab_acquire_resource(d, id, frame, nr_frames, mfn_=
list);
> +
> +        case XENMEM_resource_ioreq_server:
> +            return acquire_ioreq_server(d, id, frame, nr_frames, mfn_lis=
t);
> +
> +        case XENMEM_resource_vmtrace_buf:
> +            return acquire_vmtrace_buf(d, id, frame, nr_frames, mfn_list=
);
> +
> +        default:
> +            return -EOPNOTSUPP;
> +        }
> +    }
> +
> +Note that if a new resource has to be added, these two functions need to=
 be
> +modified. These handlers have the common declaration:
> +
> +.. code-block:: c
> +    :linenos:
> +    :caption: xen/common/memory.c
> +
> +    static int acquire_vmtrace_buf(
> +        struct domain *d, unsigned int id, unsigned int frame,
> +        unsigned int nr_frames, xen_pfn_t mfn_list[])
> +    {
> +
> +The function returns in ``mfn_list[]`` a number of ``nr_frames`` of poin=
ters
> to
> +mfn pages. For example, for the ``XENMEM_resource_vmtrace_buf``
> resource, the
> +handler is defined as follows:
> +
> +.. code-block:: c
> +    :linenos:
> +    :caption: xen/common/memory.c
> +
> +    static int acquire_vmtrace_buf(
> +        struct domain *d, unsigned int id, unsigned int frame,
> +        unsigned int nr_frames, xen_pfn_t mfn_list[])
> +    {
> +        const struct vcpu *v =3D domain_vcpu(d, id);
> +        unsigned int i;
> +        mfn_t mfn;
> +
> +        if ( !v )
> +            return -ENOENT;
> +
> +        if ( !v->vmtrace.pg ||
> +             (frame + nr_frames) > (d->vmtrace_size >> PAGE_SHIFT) )
> +            return -EINVAL;
> +
> +        mfn =3D page_to_mfn(v->vmtrace.pg);
> +
> +        for ( i =3D 0; i < nr_frames; i++ )
> +            mfn_list[i] =3D mfn_x(mfn) + frame + i;
> +
> +        return nr_frames;
> +    }
> +
> +Note that the handler only returns the mfn pages that have been previous=
ly
> +allocated in ``vmtrace.pg``. The allocation of the resource happens duri=
ng
> the
> +instantiation of the vcpu. A set of pages is allocated during the instan=
tiation
> +of each vcpu. For allocating the page, we use the domheap with the
> +``MEMF_no_refcount`` flag:
> +
> +.. What do we require to set this flag?
> +
> +.. code-block:: c
> +
> +    v->vmtrace.pg =3D alloc_domheap_page(s->target, MEMF_no_refcount);
> +
> +To access the pages in the context of Xen, we are required to map the pa=
ge
> by
> +using:
> +
> +.. code-block:: c
> +
> +    va_page =3D __map_domain_page_global(page);
> +
> +The ``va_page`` pointer is used in the context of Xen. The function that
> +allocates the pages runs the following verification after allocation. Fo=
r
> +example, the following code is from ``vmtrace_alloc_buffer()`` that allo=
cates
> +the page for vmtrace for a given vcpu:
> +
> +.. Why is this verification required after allocation?
> +
> +.. code-block:: c
> +
> +    for ( i =3D 0; i < (d->vmtrace_size >> PAGE_SHIFT); i++ )
> +        if ( unlikely(!get_page_and_type(&pg[i], d, PGT_writable_page)) =
)
> +            /*
> +             * The domain can't possibly know about this page yet, so fa=
ilure
> +             * here is a clear indication of something fishy going on.
> +             */
> +            goto refcnt_err;
> +
> +The allocated pages are released by first using ``unmap_domheap_page()``
> and
> +then using ``free_domheap_page()`` to finally release the page. Note tha=
t
> the
> +releasing of these resources may vary depending on how there are
> allocated.
> +
> +Acquire Resources
> +-----------------
> +
> +This section briefly describes the resources that rely on the acquire re=
source
> +interface. These resources are mapped by pv tools like QEMU.
> +
> +Intel Processor Trace (IPT)
> +```````````````````````````
> +
> +This resource is named ``XENMEM_resource_vmtrace_buf`` and its size in
> bytes is
> +set in ``d->vmtrace_size``. It contains the traces generated by the IPT.=
 These
> +traces are generated by each vcpu. The pages are allocated during
> +``vcpu_create()``. The pages are stored in the ``vcpu`` structure in
> +``sched.h``:
> +
> +.. code-block:: c
> +
> +   struct {
> +        struct page_info *pg; /* One contiguous allocation of d->vmtrace=
_size
> */
> +    } vmtrace;
> +
> +During ``vcpu_create()``, the pg is allocated by using the per-domain he=
ap:
> +
> +.. code-block:: c
> +
> +    pg =3D alloc_domheap_pages(d, get_order_from_bytes(d->vmtrace_size),
> MEMF_no_refcount);
> +
> +For a given vcpu, the page is loaded into the guest at
> +``vmx_restore_guest_msrs()``:
> +
> +.. code-block:: c
> +    :caption: xen/arch/x86/hvm/vmx/vmx.c
> +
> +    wrmsrl(MSR_RTIT_OUTPUT_BASE, page_to_maddr(v->vmtrace.pg));
> +
> +The releasing of the pages happens during the vcpu teardown.
> +
> +Grant Table
> +```````````
> +
> +The grant tables are represented by the ``XENMEM_resource_grant_table``
> +resource. Grant tables are special since guests can map grant tables. Do=
m0
> also
> +needs to write into the grant table to set up the grants for xenstored a=
nd
> +xenconsoled. When acquiring the resource, the pages are allocated from
> the xen
> +heap in ``gnttab_get_shared_frame_mfn()``:
> +
> +.. code-block:: c
> +    :linenos:
> +    :caption: xen/common/grant_table.c
> +
> +    gt->shared_raw[i] =3D alloc_xenheap_page()
> +    share_xen_page_with_guest(virt_to_page(gt->shared_raw[i]), d,
> SHARE_rw);
> +
> +Then, pages are shared with the guest. These pages are then converted
> from virt
> +to mfn before returning:
> +
> +.. code-block:: c
> +    :linenos:
> +
> +    for ( i =3D 0; i < nr_frames; ++i )
> +         mfn_list[i] =3D virt_to_mfn(vaddrs[frame + i]);
> +
> +Ioreq server
> +````````````
> +
> +The ioreq server is represented by the ``XENMEM_resource_ioreq_server``
> +resource. An ioreq server provides emulated devices to HVM and PVH
> guests. The
> +allocation is done in ``ioreq_server_alloc_mfn()``. The following code
> partially
> +shows the allocation of the pages that represent the ioreq server:
> +
> +.. code-block:: c
> +    :linenos:
> +    :caption: xen/common/ioreq.c
> +
> +    page =3D alloc_domheap_page(s->target, MEMF_no_refcount);
> +
> +    iorp->va =3D __map_domain_page_global(page);
> +    if ( !iorp->va )
> +        goto fail;
> +
> +    iorp->page =3D page;
> +    clear_page(iorp->va);
> +    return 0;
> +
> +The function above is invoked from ``ioreq_server_get_frame()`` which is
> called
> +from ``acquire_ioreq_server()``. For acquiring, the function returns the
> +allocated pages as follows:
> +
> +.. code-block:: c
> +
> +    *mfn =3D page_to_mfn(s->bufioreq.page);
> +
> +The ``ioreq_server_free_mfn()`` function releases the pages as follows:
> +
> +.. code-block:: c
> +    :linenos:
> +    :caption: xen/common/ioreq.c
> +
> +    unmap_domain_page_global(iorp->va);
> +    iorp->va =3D NULL;
> +
> +    put_page_alloc_ref(page);
> +    put_page_and_type(page);
> +
> +.. TODO: Why unmap() and free() are not used instead?
> diff --git a/docs/hypervisor-guide/index.rst b/docs/hypervisor-
> guide/index.rst
> index e4393b0697..961a11525f 100644
> --- a/docs/hypervisor-guide/index.rst
> +++ b/docs/hypervisor-guide/index.rst
> @@ -9,3 +9,5 @@ Hypervisor documentation
>     code-coverage
>=20
>     x86/index
> +
> +   acquire_resource_reference
> --
> 2.25.1
>=20


