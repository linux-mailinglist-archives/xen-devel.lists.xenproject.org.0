Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 85A0F73D7AF
	for <lists+xen-devel@lfdr.de>; Mon, 26 Jun 2023 08:16:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.555320.867004 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qDfW5-0006lX-5i; Mon, 26 Jun 2023 06:16:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 555320.867004; Mon, 26 Jun 2023 06:16:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qDfW5-0006jQ-2H; Mon, 26 Jun 2023 06:16:01 +0000
Received: by outflank-mailman (input) for mailman id 555320;
 Mon, 26 Jun 2023 06:15:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VCbL=CO=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1qDfW3-0006j1-Bh
 for xen-devel@lists.xenproject.org; Mon, 26 Jun 2023 06:15:59 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on20607.outbound.protection.outlook.com
 [2a01:111:f400:fe1a::607])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e90f4b80-13e8-11ee-8611-37d641c3527e;
 Mon, 26 Jun 2023 08:15:56 +0200 (CEST)
Received: from AM6PR08CA0037.eurprd08.prod.outlook.com (2603:10a6:20b:c0::25)
 by DB9PR08MB6651.eurprd08.prod.outlook.com (2603:10a6:10:26e::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.26; Mon, 26 Jun
 2023 06:15:52 +0000
Received: from AM7EUR03FT008.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:c0:cafe::b7) by AM6PR08CA0037.outlook.office365.com
 (2603:10a6:20b:c0::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.33 via Frontend
 Transport; Mon, 26 Jun 2023 06:15:52 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT008.mail.protection.outlook.com (100.127.141.25) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6544.15 via Frontend Transport; Mon, 26 Jun 2023 06:15:52 +0000
Received: ("Tessian outbound b11b8bb4dfe8:v142");
 Mon, 26 Jun 2023 06:15:52 +0000
Received: from 1717989c256a.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 3360613E-57D4-472E-AF95-C1D121F9736B.1; 
 Mon, 26 Jun 2023 06:15:41 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 1717989c256a.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 26 Jun 2023 06:15:41 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by PAXPR08MB6606.eurprd08.prod.outlook.com (2603:10a6:102:157::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.24; Mon, 26 Jun
 2023 06:15:39 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::1024:cf14:d520:9b38]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::1024:cf14:d520:9b38%7]) with mapi id 15.20.6521.026; Mon, 26 Jun 2023
 06:15:39 +0000
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
X-Inumbo-ID: e90f4b80-13e8-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jeo8+7oEOCBoHb+Ou1kIWqrZIsHIYMZD/l8MLXVWJ1Y=;
 b=mu39aMlEorKmiITccQ8gpNQZWhdO1GfXrtqUEkQjM4+/J+DygHtCTdHAeA0f3h8TN/xKRtS0rNpe7sp67RK0pb7BNzHzE5VdhqP7p8NhMwXxxIb9DkkjARdV1fOjMD4GspUcnKYWalKxM5IJuWAwdwVeBN8Lly6XJdDMP01/Muo=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j2bpVU+w3N73tg1dQYVHMydXKdZ1qX4ieIeJ7bT7mqHQEmFRFhbuRtGNkINkGhWWTh4/e0Jd/ciUeqGDx8vBkmKlIXVqv/haz412peslVYb5DdZYdLBa8ZikLr9gx6GaFMdRu+gL5GF+a8dTklx74SfXzLR707zUuVLYtmMBSvWB8CUbyp/crdtxun7/Y+bqQf5zgOkJLDd5r6kQg8gmr1/OoM2xiiNICtL+zWZXTAofrHYA+S+D9L6d7H6BeeOFylXGd4O+vS592JROD/75sXfbAMponna5pm3auwgBvSnWTqq3SH8xVvKd147PwCelOMCyqEk/KqHYiUpwvNgm6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jeo8+7oEOCBoHb+Ou1kIWqrZIsHIYMZD/l8MLXVWJ1Y=;
 b=Zz40m5K9Qc24FABUlSyMRIDiiZZS/sYJdB8RsIUo1LgidH7Nr7Brwkri7DcNJwmXHOUOG8a9brVlUndXaBQigLuZGCEmvPUxnIiJrbn8BDYFnIGijfJUvYonDjeblFSsamccZxpQDszdwXNWRYhwznxC9VRSB5nP3ogw7ONzHnB69p7r2JcYaFMs5vRjzNQSnKkJP3bdXYkL2JKMuw2XjWgbLkuw8vg3pdR4gme4FcARCn7/NmeJkyeq1Egcc1DGrXS1VGS4iWVaqPoHOQ12o1dOeyUdGo6iDsl7T4aKAnTyxxmVS8Lc8MPiYfdgufv+x02pusPstExxAjIEHd3IBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jeo8+7oEOCBoHb+Ou1kIWqrZIsHIYMZD/l8MLXVWJ1Y=;
 b=mu39aMlEorKmiITccQ8gpNQZWhdO1GfXrtqUEkQjM4+/J+DygHtCTdHAeA0f3h8TN/xKRtS0rNpe7sp67RK0pb7BNzHzE5VdhqP7p8NhMwXxxIb9DkkjARdV1fOjMD4GspUcnKYWalKxM5IJuWAwdwVeBN8Lly6XJdDMP01/Muo=
From: Henry Wang <Henry.Wang@arm.com>
To: Julien Grall <julien@xen.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Luca Fancellu <Luca.Fancellu@arm.com>, "michal.orzel@amd.com"
	<michal.orzel@amd.com>, Stefano Stabellini <sstabellini@kernel.org>, Bertrand
 Marquis <Bertrand.Marquis@arm.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
Subject: RE: [PATCH 1/9] xen/arm: Check Xen size when linking
Thread-Topic: [PATCH 1/9] xen/arm: Check Xen size when linking
Thread-Index: AQHZp6aLOomj+n7mMk6Gpm2cByrsNq+cmVMw
Date: Mon, 26 Jun 2023 06:15:39 +0000
Message-ID:
 <AS8PR08MB799128C9EFC82CBA0151B2009226A@AS8PR08MB7991.eurprd08.prod.outlook.com>
References: <20230625204907.57291-1-julien@xen.org>
 <20230625204907.57291-2-julien@xen.org>
In-Reply-To: <20230625204907.57291-2-julien@xen.org>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 663328E82D655D4A82A267F93F7C0BC3.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7991:EE_|PAXPR08MB6606:EE_|AM7EUR03FT008:EE_|DB9PR08MB6651:EE_
X-MS-Office365-Filtering-Correlation-Id: 7c81c840-cb4b-4113-e15b-08db760ccb4c
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 3X5xYzCwrURogBEXfiZbH3EOZf4wpjGvzYoTUZAcK0+hSsDL3C3fuMUPS1Yu7SAPLgJTwVfPyBSN4wm5T5MxE/q5GHxZ4Y3VDhZm5TTLq5JZSiZwX3ml8b3ENvYPOUPGtdqnHyfMKrsvAF32VXpRP3aAjktYv4FBpiyNj+U7VitaNKnnMeQdF/MVWC3qKa8em0qXyVgoJEiQgbF5Yuqqu4+4EDyVQGr0Mr4oOJFcNJD1NdrBxKBn+lzoHkae8R0h6yIvh3j9kX7TcFFZOow5etfCNx4J/p6+ILci40FVKbsxRnAjuQy6/nRbN4nLbEpwtaUAsFFkCg42B3mebhDDQUypHlpcQH+qtfsLprSoH2pWqm1ohPux2BgnYvH8OhG4FmuyceZd5Kk9HzTvKW5I7fFrrGAANqMVtzuxb+OQkIha+ADKzOfyNmJQLVdvKKVKukUjdgt/217FeibOV/OvfCAxkLLJqi1yfCuCiXewSpjzRNE1vXc/Gyd5WcjBq9EggkpGHrZ1TJJVrEsCsVjyw9a7xL4zLIpRzJ3MvN9NjfI8s+mhe5ZLIdSBscXjydKeaqDw6H2p2/k+IKLVAmPcDxCKjC7sO+X77w88bncxk4o4Un0op9iETXPPaRvAnbMN
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(39860400002)(376002)(346002)(136003)(366004)(451199021)(26005)(2906002)(4744005)(186003)(71200400001)(38100700002)(122000001)(9686003)(6506007)(52536014)(5660300002)(83380400001)(8936002)(41300700001)(76116006)(64756008)(66946007)(66446008)(66556008)(66476007)(8676002)(33656002)(55016003)(38070700005)(54906003)(7696005)(86362001)(478600001)(4326008)(316002)(110136005);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB6606
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT008.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	11663982-5b2e-4b24-7adf-08db760cc34f
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	GNauEhFDo2mteWW+cGyFa2PXED+w9Y2zUhqPyF88eibr77b9OnV0B4CJXsQ+3qbY9F/h8s2FrsMaJSS3b3rJjIKk9iTP5oEYc46wBmmF9QinRBrfwuHn9U7E6LGQakMaA8YTvec7yHZrvP73JPs92ErFim4+UIkMAPlr9P+c3FQSAjZ7Gz3iWHSRV/wmSCI1UsSG3Yt+wI/JjTZCBY7MUvJhRQhuzduC2vMgPfvR6ZeWki7xo4oal0fQmUd9I39P2etdgAFPREooJgDWSo2sqleo/wf8Cw9qSk1Gjsue36H/8Yvw4eEmz+vd5c1Imb2RQfHbHQfianGjDSBSeyjnbdVJdDM5GErkpyZAUdJ1nztPP/Icr8VBmwr13Z9slXkOTgon59AnQHROleF023KVcQr4l+lliwh6Q1z3rEXHPCfaPrnRQlWaF84hDcjjsthQgp/eHNE3YgKZitLd2v5d7l4BCMxQDiLaTCBq6dsN2Y8Aw9NcY/1aCV37MIfbAqC+KfWnl0ogK8D3PIVLbw9Wp+3P1h2n3Ry3yq7Bf8HFdzt4KUvmXFqidHQIr2NMQZJBWwRcq6fOScoa/+Wl+EwN5bc94S0YorLTP8Zm4qcXHd0uIANWuSIwcUKBp1drfDJKXIJeEdsH8OdKp//Xr1H6wuki6fP1ngJ9jf/W3WStkPksBB6NaFhzOCYRN5yLo9bBHOtqV7xKCpeKhjpYVFUBT3dQKxBVgcHOG+p4hVochOm0oACkDTrWHuP7pvxrA4Jw
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(346002)(136003)(396003)(376002)(451199021)(46966006)(36840700001)(40470700004)(81166007)(356005)(82740400003)(47076005)(83380400001)(33656002)(36860700001)(86362001)(478600001)(110136005)(9686003)(54906003)(7696005)(40460700003)(41300700001)(70586007)(55016003)(316002)(8936002)(70206006)(8676002)(336012)(6506007)(4326008)(26005)(107886003)(186003)(2906002)(82310400005)(40480700001)(5660300002)(52536014);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2023 06:15:52.4930
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c81c840-cb4b-4113-e15b-08db760ccb4c
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT008.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB6651

Hi Julien,

> -----Original Message-----
> Subject: [PATCH 1/9] xen/arm: Check Xen size when linking
>=20
> The linker will happily link Xen if it is bigger than what we can handle
> (e.g 2MB). This will result to unexpected failure after boot.

I found this a little bit misleading because when I looked for
XEN_VIRT_SIZE, I am having:

#define XEN_VIRT_SIZE           _AT(vaddr_t, MB(8))

May I please suggest it is better to keep the example in commit message
consistent with the actual value used in code?=20

>=20
> This unexpected failure can be prevented by forbidding linking if Xen is
> bigger than the area we reversed.

I am not sure this is a typo: s/reversed/reserved/, but I find the current
sentence a little bit hard to understand.

>=20
> Signed-off-by: Julien Grall <julien@xen.org>

Both comment above can be fixed on commit, so:

Reviewed-by: Henry Wang <Henry.Wang@arm.com>

I've also tested this patch on top of today's staging by our internal CI,
and I don't see any build error there, hence also:

Tested-by: Henry Wang <Henry.Wang@arm.com>

Kind regards,
Henry

