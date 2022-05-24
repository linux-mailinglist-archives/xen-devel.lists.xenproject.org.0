Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 70079532126
	for <lists+xen-devel@lfdr.de>; Tue, 24 May 2022 04:48:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.336127.560440 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ntKbB-0003qu-11; Tue, 24 May 2022 02:48:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 336127.560440; Tue, 24 May 2022 02:48:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ntKbA-0003oI-UB; Tue, 24 May 2022 02:48:40 +0000
Received: by outflank-mailman (input) for mailman id 336127;
 Tue, 24 May 2022 02:48:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=csW1=WA=arm.com=Jiamei.Xie@srs-se1.protection.inumbo.net>)
 id 1ntKb9-0003oC-L3
 for xen-devel@lists.xenproject.org; Tue, 24 May 2022 02:48:39 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on20609.outbound.protection.outlook.com
 [2a01:111:f400:7d00::609])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 027d7021-db0c-11ec-bd2c-47488cf2e6aa;
 Tue, 24 May 2022 04:48:37 +0200 (CEST)
Received: from DB6P18901CA0022.EURP189.PROD.OUTLOOK.COM (2603:10a6:4:16::32)
 by AM6PR08MB3319.eurprd08.prod.outlook.com (2603:10a6:209:4e::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.13; Tue, 24 May
 2022 02:48:33 +0000
Received: from DBAEUR03FT062.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:16:cafe::38) by DB6P18901CA0022.outlook.office365.com
 (2603:10a6:4:16::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.13 via Frontend
 Transport; Tue, 24 May 2022 02:48:33 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT062.mail.protection.outlook.com (100.127.142.64) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5273.14 via Frontend Transport; Tue, 24 May 2022 02:48:32 +0000
Received: ("Tessian outbound 42cead292588:v119");
 Tue, 24 May 2022 02:48:32 +0000
Received: from 4ce827f12034.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 5EFC986E-A1C3-417A-BF02-4A83025A160C.1; 
 Tue, 24 May 2022 02:48:26 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 4ce827f12034.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 24 May 2022 02:48:26 +0000
Received: from AS8PR08MB7696.eurprd08.prod.outlook.com (2603:10a6:20b:523::11)
 by DB7PR08MB3130.eurprd08.prod.outlook.com (2603:10a6:5:24::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.14; Tue, 24 May
 2022 02:48:23 +0000
Received: from AS8PR08MB7696.eurprd08.prod.outlook.com
 ([fe80::8f2:f748:5da2:6278]) by AS8PR08MB7696.eurprd08.prod.outlook.com
 ([fe80::8f2:f748:5da2:6278%5]) with mapi id 15.20.5273.023; Tue, 24 May 2022
 02:48:23 +0000
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
X-Inumbo-ID: 027d7021-db0c-11ec-bd2c-47488cf2e6aa
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=bugvHtssbj4tgW+zCgBpxDMLUG0FJQIOhok12yNSrVS1q5duKkYiR4JvfQyJ2jVwLFbkiV89iDYGFS8ILTojtLYOQo3R/yqHCtlWtzKXYTlcasTrUApJwzlN69ymc/XP6FY/hAgv/pGkzi9FmcZOBtfc5ejgP+zTrJS3UE28OI8EcHOhcqkfepYuNA1Jq/KnbreEZbfNe1gUU3eniwyu0xt+gy5jJjzEMZZIGny0VqygmimFTt+lJwkYpr+M7HEM0b/5I5/wVESGa0/lrgmcCPWlKhW5Q0i4eh/n1anF9mRAcy9iurv9l3/Fxn7SYLZzAeBodHVoB+xoijtiL2g0hg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TTRk+wrtTgygeKt4VD6Wbky4AhGgyD829LwcQKQ2GnU=;
 b=k2lc7tycDjnlllimdsrsEVi5lKKyX8EgLPXtTs2eQ/qevQtizXfVeYhP6vwpbJa50X0Kv3wlUFF3xIs/UmJysWlDph8mOSvexq62ZHZYieWVfpqEw0WtDk+MVjINBCgUB7otnPpep0HtbqrmCuhGrBdRQtHi5Aw+fMNqJsrSzqXQi8UoQIOtWp5mTM/6V6eL+YLNDteCAR6Z6qXb3BaEO6F4EpZ+UocszZYUMmWZGlkcfExkA8c4Ere/iYJJAtcLDPKmaJVSJ9SIn8nrMxLu1OYSuTBqb6ARKOe+hT1OqwD1zsNHYlIG9Iwt5J0ktZ72aAHxs0OS954smoB7E86wVg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TTRk+wrtTgygeKt4VD6Wbky4AhGgyD829LwcQKQ2GnU=;
 b=tL/ywDNHrhT7n8wbfJ8mmDzZx1dksPbYunOlLLAQbIZ6r4uVJxyHEhhnSMY9NPfbvHu3NNO+ncCdAeYPDOjLQn1/LaCC7I5WQSgzM10nyHju6ovMt9Q/cbhZ54Tpyv11+t67QhWy7zTzwveEYMM4DdG1lI3cyElf7+EZZciF6Mk=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IQB4r2rkk+gcQ45v30mJn5y006EtlDgSYL3xuLufHsTd/X1Darac7dKLP9SkwKp9lLLBOjoV4wHaRyObEOs/ow6JLSGRQWInjQR7ngkLoNLQ4Jo007o5yYmpJw/3Tb8/e8udSX6ufKK4P8QoBQb9C+xm5QHWNepb54R5kCHhiMp+fQKd7TnwJxVnVcQLqMhUw7+qrRK6ls0/k1NkdZ84IoLxU3FYkqjDQLaNDz0Rfy2BDljpOgQ0RKrFXY26e/5Gq/1Xb+kXe1kUGEGOyMjto34ZMeljiSC1CTuicmAnlAM7KGIj4vQaeZe4tKNwIeMqg97gj6N7DFZUevi9y2kqbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TTRk+wrtTgygeKt4VD6Wbky4AhGgyD829LwcQKQ2GnU=;
 b=d5ZEyeV/04PmLu8SgSh64qHxIylWjchQXZFeFNXwQY0omhrdx/Q0psyM39G2kMFEncGZ7KMQrWmfJ59iF6dH4gw2Sj/tk7+LFndgeSjPOQOu7b6sDlAx1Qf8qRFDWw6iXrbraX8cv/9/oiyiNK9mOlP61R0MyJwHdvSzrqmjCOfk7V77yGFa8fydGTNhgLmeHSz4Eyqc9dKrohMhGmx2Td7lRJjg1JR/Smn4yZKyR9fzJYQqpRi8ZSmLaV6staXRAplv9qBEInogihrNZ/1WIBnCjVkExpu8ZV0OUMNEKHpVjZsfI1Cnwdh+7LTzAGuMtpST8dRi7QMPmMOsdUUbwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TTRk+wrtTgygeKt4VD6Wbky4AhGgyD829LwcQKQ2GnU=;
 b=tL/ywDNHrhT7n8wbfJ8mmDzZx1dksPbYunOlLLAQbIZ6r4uVJxyHEhhnSMY9NPfbvHu3NNO+ncCdAeYPDOjLQn1/LaCC7I5WQSgzM10nyHju6ovMt9Q/cbhZ54Tpyv11+t67QhWy7zTzwveEYMM4DdG1lI3cyElf7+EZZciF6Mk=
From: Jiamei Xie <Jiamei.Xie@arm.com>
To: Lin Liu <lin.liu@citrix.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <Bertrand.Marquis@arm.com>, Stefano
 Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Subject: RE: [PATCH v5 6/6] byteorder: Remove byteorder
Thread-Topic: [PATCH v5 6/6] byteorder: Remove byteorder
Thread-Index: AQHYbrSkdBLA7e8+Uk2zs3km3pRUja0tUgJg
Date: Tue, 24 May 2022 02:48:23 +0000
Message-ID:
 <AS8PR08MB76964EE6490531DFADAA07A392D79@AS8PR08MB7696.eurprd08.prod.outlook.com>
References: <cover.1653314499.git.lin.liu@citrix.com>
 <1b9957326f5018c38ce6c523e3e5ab67f012ac00.1653314499.git.lin.liu@citrix.com>
In-Reply-To:
 <1b9957326f5018c38ce6c523e3e5ab67f012ac00.1653314499.git.lin.liu@citrix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: A1F37E1FA9D1A143A28F7E2862DA5396.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 89c6328b-65f7-4c7d-85e2-08da3d2fe422
x-ms-traffictypediagnostic:
	DB7PR08MB3130:EE_|DBAEUR03FT062:EE_|AM6PR08MB3319:EE_
X-Microsoft-Antispam-PRVS:
	<AM6PR08MB3319A345C0AAA5AAAB37615892D79@AM6PR08MB3319.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 qz4POKlAhAxueUohVyvBcLqGvewgICzdF92mLytS+Z9kYuC8aEmVxexpd9cIyC3QkgkB11bdyUrZNZYWEf5mtL3l3WcRXWxh8pWq/dnGAbPEFM6t+O3doaDSCmr+CaRnU9wBxg4pUOOJneGMVp34zVayccHRIZ2hbHlwJ9MJVwQqCsUKLDY93HUyGyPDaTryWfOG4MoeL4DxFP20e3dw0JDe5jUUFiKl0eKx1kfr6iUv46L5AgHG6B0N2a9JaoyJWTOmD96nyMPkodkut6h9IhXVMUJgKrsNxRfpFfbKyIGNGup5/qxdWrj9k1v0uHZ31lD+ljK2pmzEifuhwsF++wmMlO0hSoKcknj+S7odWSScAkgo5G34IJs/C3BlniQSVu78nbn6vKsUsCLNqACh8uO88bO1wbl1t3wXDv4UHw1uZZ7ruMHr7Otd8Abcmo9uVkIrblhQAw/y0vr4MeGhoNGF3KN7BsWErwN/wUXuaz+B9HiopHPGy8zqELJv8T5NFTg2+BHMo67HCYojsmS0gnplRV+cxRkoIw7qwd826MWUFaJlPy1miWehwkDwZW1nAHuGDFWPSMZhdo6OeFNyER7j6IPyno14LykgYWlOAkY+3JcoCD9kHfXYgvTRwuLn8M9dL0OoGNL86xxWR+uuLicAljgyESS34pONKG6vtAZSIm7l9Rqtjapfbghn7Gf//NQpo8wLcMRDwstiZsKu8w==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7696.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(86362001)(76116006)(5660300002)(33656002)(83380400001)(110136005)(64756008)(8676002)(66556008)(4326008)(316002)(186003)(7696005)(66476007)(66446008)(122000001)(6506007)(66946007)(30864003)(38100700002)(54906003)(8936002)(38070700005)(508600001)(26005)(2906002)(53546011)(55016003)(9686003)(71200400001)(52536014);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="iso-2022-jp"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3130
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT062.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	97151f63-4acf-4f49-008c-08da3d2fde81
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	gxBMN+5Z513/N7B9Tc5qleYRto+b3GmXpG3l5V2/34zvMDsBQE3ZytiwU6/mwUJpYloP/AlBfLhGBL9zyfR+bHYJp/QRPRz1xxN5/yJkzEXCcS3WVAF1GsWNqwZDYCvhVwjCm4fN2KwIb8sUswQPQbL2qccaBC5Uyq3PB4Cz0NJDq2W4CL7f4jrDSAnzCX9OeFd7tVDcwvw7YRefd+51a2/vLGicb4JFqp8BMfrKZ22TAasFVudZ42u3Nq+d4uclgx/OxOUgr7ogXo2aKXS3EU0GSJ1LPYlSh8Jsi18fNQJhL4gmvlToDHbziBurSEIkRmDQX+aGldXNWkSw/MQdg6jJM1MTDZBJNXykgCMvUW0pbtcbU7lNyCPy02uw4QDv2ZTv43UF4OkIomdnKdIC4x7K/chAxp+mvW4EcbxNcTnBFqeoef8+viHo0A5r9HsV78RDuJsHtFtDSUJYA82R1DKmcbinDi138u+DiYkdyPZYGMiRsjxJFAm3PB7wkMd/n3F5glJOPljhomVG9WiJdtHsPZbdiYTeamF/L4ROY66vHeZ0Scl+voD8zZIsTL6EcJWeNs1NKwrJeFOoFIojytgekn2hJPweaJx1SlUwvd8qyrMceoKKJbH3wjqyTvb9LJszHOynWPdklvf+x56d+CNDcUAWk3Xo+meTugOlKZtIKLFlVjPSaUYsf4rPRxle
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(46966006)(40470700004)(36840700001)(316002)(54906003)(110136005)(40460700003)(83380400001)(8676002)(356005)(36860700001)(4326008)(82310400005)(70206006)(186003)(70586007)(86362001)(30864003)(9686003)(47076005)(336012)(508600001)(55016003)(26005)(81166007)(8936002)(53546011)(33656002)(6506007)(7696005)(2906002)(52536014)(5660300002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 May 2022 02:48:32.6415
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 89c6328b-65f7-4c7d-85e2-08da3d2fe422
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT062.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3319

Hi Lin,
> -----Original Message-----
> From: Xen-devel <xen-devel-bounces@lists.xenproject.org> On Behalf Of Lin
> Liu
> Sent: 2022=1B$BG/=1B(B5=1B$B7n=1B(B23=1B$BF|=1B(B 22:51
> To: xen-devel@lists.xenproject.org
> Cc: Lin Liu <lin.liu@citrix.com>; Andrew Cooper
> <andrew.cooper3@citrix.com>; George Dunlap <george.dunlap@citrix.com>;
> Jan Beulich <jbeulich@suse.com>; Julien Grall <julien@xen.org>; Bertrand
> Marquis <Bertrand.Marquis@arm.com>; Stefano Stabellini
> <sstabellini@kernel.org>; Wei Liu <wl@xen.org>
> Subject: [PATCH v5 6/6] byteorder: Remove byteorder
>=20
> include/xen/byteswap.h has simplify the interface, just clean
> the old interface
There is a  typo.   s/ simplify/simplified /.

Best wishes
Jiamei Xie
>=20
> No functional change
>=20
> Signed-off-by: Lin Liu <lin.liu@citrix.com>
> Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> Cc: Andrew Cooper <andrew.cooper3@citrix.com>
> Cc: George Dunlap <george.dunlap@citrix.com>
> Cc: Jan Beulich <jbeulich@suse.com>
> Cc: Julien Grall <julien@xen.org>
> Cc: Bertrand Marquis <bertrand.marquis@arm.com>
> Cc: Stefano Stabellini <sstabellini@kernel.org>
> Cc: Wei Liu <wl@xen.org>
> ---
>  xen/include/xen/byteorder/big_endian.h    | 102 ------------
>  xen/include/xen/byteorder/generic.h       |  68 --------
>  xen/include/xen/byteorder/little_endian.h | 102 ------------
>  xen/include/xen/byteorder/swab.h          | 183 ----------------------
>  4 files changed, 455 deletions(-)
>  delete mode 100644 xen/include/xen/byteorder/big_endian.h
>  delete mode 100644 xen/include/xen/byteorder/generic.h
>  delete mode 100644 xen/include/xen/byteorder/little_endian.h
>  delete mode 100644 xen/include/xen/byteorder/swab.h
>=20
> diff --git a/xen/include/xen/byteorder/big_endian.h
> b/xen/include/xen/byteorder/big_endian.h
> deleted file mode 100644
> index 40eb80a390..0000000000
> --- a/xen/include/xen/byteorder/big_endian.h
> +++ /dev/null
> @@ -1,102 +0,0 @@
> -#ifndef __XEN_BYTEORDER_BIG_ENDIAN_H__
> -#define __XEN_BYTEORDER_BIG_ENDIAN_H__
> -
> -#ifndef __BIG_ENDIAN
> -#define __BIG_ENDIAN 4321
> -#endif
> -#ifndef __BIG_ENDIAN_BITFIELD
> -#define __BIG_ENDIAN_BITFIELD
> -#endif
> -
> -#include <xen/types.h>
> -#include <xen/byteorder/swab.h>
> -
> -#define __constant_cpu_to_le64(x) ((__force
> __le64)___constant_swab64((x)))
> -#define __constant_le64_to_cpu(x) ___constant_swab64((__force
> __u64)(__le64)(x))
> -#define __constant_cpu_to_le32(x) ((__force
> __le32)___constant_swab32((x)))
> -#define __constant_le32_to_cpu(x) ___constant_swab32((__force
> __u32)(__le32)(x))
> -#define __constant_cpu_to_le16(x) ((__force
> __le16)___constant_swab16((x)))
> -#define __constant_le16_to_cpu(x) ___constant_swab16((__force
> __u16)(__le16)(x))
> -#define __constant_cpu_to_be64(x) ((__force __be64)(__u64)(x))
> -#define __constant_be64_to_cpu(x) ((__force __u64)(__be64)(x))
> -#define __constant_cpu_to_be32(x) ((__force __be32)(__u32)(x))
> -#define __constant_be32_to_cpu(x) ((__force __u32)(__be32)(x))
> -#define __constant_cpu_to_be16(x) ((__force __be16)(__u16)(x))
> -#define __constant_be16_to_cpu(x) ((__force __u16)(__be16)(x))
> -#define __cpu_to_le64(x) ((__force __le64)__swab64((x)))
> -#define __le64_to_cpu(x) __swab64((__force __u64)(__le64)(x))
> -#define __cpu_to_le32(x) ((__force __le32)__swab32((x)))
> -#define __le32_to_cpu(x) __swab32((__force __u32)(__le32)(x))
> -#define __cpu_to_le16(x) ((__force __le16)__swab16((x)))
> -#define __le16_to_cpu(x) __swab16((__force __u16)(__le16)(x))
> -#define __cpu_to_be64(x) ((__force __be64)(__u64)(x))
> -#define __be64_to_cpu(x) ((__force __u64)(__be64)(x))
> -#define __cpu_to_be32(x) ((__force __be32)(__u32)(x))
> -#define __be32_to_cpu(x) ((__force __u32)(__be32)(x))
> -#define __cpu_to_be16(x) ((__force __be16)(__u16)(x))
> -#define __be16_to_cpu(x) ((__force __u16)(__be16)(x))
> -
> -static inline __le64 __cpu_to_le64p(const __u64 *p)
> -{
> -    return (__force __le64)__swab64p(p);
> -}
> -static inline __u64 __le64_to_cpup(const __le64 *p)
> -{
> -    return __swab64p((__u64 *)p);
> -}
> -static inline __le32 __cpu_to_le32p(const __u32 *p)
> -{
> -    return (__force __le32)__swab32p(p);
> -}
> -static inline __u32 __le32_to_cpup(const __le32 *p)
> -{
> -    return __swab32p((__u32 *)p);
> -}
> -static inline __le16 __cpu_to_le16p(const __u16 *p)
> -{
> -    return (__force __le16)__swab16p(p);
> -}
> -static inline __u16 __le16_to_cpup(const __le16 *p)
> -{
> -    return __swab16p((__u16 *)p);
> -}
> -static inline __be64 __cpu_to_be64p(const __u64 *p)
> -{
> -    return (__force __be64)*p;
> -}
> -static inline __u64 __be64_to_cpup(const __be64 *p)
> -{
> -    return (__force __u64)*p;
> -}
> -static inline __be32 __cpu_to_be32p(const __u32 *p)
> -{
> -    return (__force __be32)*p;
> -}
> -static inline __u32 __be32_to_cpup(const __be32 *p)
> -{
> -    return (__force __u32)*p;
> -}
> -static inline __be16 __cpu_to_be16p(const __u16 *p)
> -{
> -    return (__force __be16)*p;
> -}
> -static inline __u16 __be16_to_cpup(const __be16 *p)
> -{
> -    return (__force __u16)*p;
> -}
> -#define __cpu_to_le64s(x) __swab64s((x))
> -#define __le64_to_cpus(x) __swab64s((x))
> -#define __cpu_to_le32s(x) __swab32s((x))
> -#define __le32_to_cpus(x) __swab32s((x))
> -#define __cpu_to_le16s(x) __swab16s((x))
> -#define __le16_to_cpus(x) __swab16s((x))
> -#define __cpu_to_be64s(x) do {} while (0)
> -#define __be64_to_cpus(x) do {} while (0)
> -#define __cpu_to_be32s(x) do {} while (0)
> -#define __be32_to_cpus(x) do {} while (0)
> -#define __cpu_to_be16s(x) do {} while (0)
> -#define __be16_to_cpus(x) do {} while (0)
> -
> -#include <xen/byteorder/generic.h>
> -
> -#endif /* __XEN_BYTEORDER_BIG_ENDIAN_H__ */
> diff --git a/xen/include/xen/byteorder/generic.h
> b/xen/include/xen/byteorder/generic.h
> deleted file mode 100644
> index 8a0006b755..0000000000
> --- a/xen/include/xen/byteorder/generic.h
> +++ /dev/null
> @@ -1,68 +0,0 @@
> -#ifndef __XEN_BYTEORDER_GENERIC_H__
> -#define __XEN_BYTEORDER_GENERIC_H__
> -
> -/*
> - * Generic Byte-reordering support
> - *
> - * The "... p" macros, like le64_to_cpup, can be used with pointers
> - * to unaligned data, but there will be a performance penalty on
> - * some architectures.  Use get_unaligned for unaligned data.
> - *
> - * The following macros are to be defined by <asm/byteorder.h>:
> - *
> - * Conversion of XX-bit integers (16- 32- or 64-)
> - * between native CPU format and little/big endian format
> - * 64-bit stuff only defined for proper architectures
> - *     cpu_to_[bl]eXX(__uXX x)
> - *     [bl]eXX_to_cpu(__uXX x)
> - *
> - * The same, but takes a pointer to the value to convert
> - *     cpu_to_[bl]eXXp(__uXX x)
> - *     [bl]eXX_to_cpup(__uXX x)
> - *
> - * The same, but change in situ
> - *     cpu_to_[bl]eXXs(__uXX x)
> - *     [bl]eXX_to_cpus(__uXX x)
> - *
> - * See asm-foo/byteorder.h for examples of how to provide
> - * architecture-optimized versions
> - */
> -
> -#define cpu_to_le64 __cpu_to_le64
> -#define le64_to_cpu __le64_to_cpu
> -#define cpu_to_le32 __cpu_to_le32
> -#define le32_to_cpu __le32_to_cpu
> -#define cpu_to_le16 __cpu_to_le16
> -#define le16_to_cpu __le16_to_cpu
> -#define cpu_to_be64 __cpu_to_be64
> -#define be64_to_cpu __be64_to_cpu
> -#define cpu_to_be32 __cpu_to_be32
> -#define be32_to_cpu __be32_to_cpu
> -#define cpu_to_be16 __cpu_to_be16
> -#define be16_to_cpu __be16_to_cpu
> -#define cpu_to_le64p __cpu_to_le64p
> -#define le64_to_cpup __le64_to_cpup
> -#define cpu_to_le32p __cpu_to_le32p
> -#define le32_to_cpup __le32_to_cpup
> -#define cpu_to_le16p __cpu_to_le16p
> -#define le16_to_cpup __le16_to_cpup
> -#define cpu_to_be64p __cpu_to_be64p
> -#define be64_to_cpup __be64_to_cpup
> -#define cpu_to_be32p __cpu_to_be32p
> -#define be32_to_cpup __be32_to_cpup
> -#define cpu_to_be16p __cpu_to_be16p
> -#define be16_to_cpup __be16_to_cpup
> -#define cpu_to_le64s __cpu_to_le64s
> -#define le64_to_cpus __le64_to_cpus
> -#define cpu_to_le32s __cpu_to_le32s
> -#define le32_to_cpus __le32_to_cpus
> -#define cpu_to_le16s __cpu_to_le16s
> -#define le16_to_cpus __le16_to_cpus
> -#define cpu_to_be64s __cpu_to_be64s
> -#define be64_to_cpus __be64_to_cpus
> -#define cpu_to_be32s __cpu_to_be32s
> -#define be32_to_cpus __be32_to_cpus
> -#define cpu_to_be16s __cpu_to_be16s
> -#define be16_to_cpus __be16_to_cpus
> -
> -#endif /* __XEN_BYTEORDER_GENERIC_H__ */
> diff --git a/xen/include/xen/byteorder/little_endian.h
> b/xen/include/xen/byteorder/little_endian.h
> deleted file mode 100644
> index 4955632793..0000000000
> --- a/xen/include/xen/byteorder/little_endian.h
> +++ /dev/null
> @@ -1,102 +0,0 @@
> -#ifndef __XEN_BYTEORDER_LITTLE_ENDIAN_H__
> -#define __XEN_BYTEORDER_LITTLE_ENDIAN_H__
> -
> -#ifndef __LITTLE_ENDIAN
> -#define __LITTLE_ENDIAN 1234
> -#endif
> -#ifndef __LITTLE_ENDIAN_BITFIELD
> -#define __LITTLE_ENDIAN_BITFIELD
> -#endif
> -
> -#include <xen/types.h>
> -#include <xen/byteorder/swab.h>
> -
> -#define __constant_cpu_to_le64(x) ((__force __le64)(__u64)(x))
> -#define __constant_le64_to_cpu(x) ((__force __u64)(__le64)(x))
> -#define __constant_cpu_to_le32(x) ((__force __le32)(__u32)(x))
> -#define __constant_le32_to_cpu(x) ((__force __u32)(__le32)(x))
> -#define __constant_cpu_to_le16(x) ((__force __le16)(__u16)(x))
> -#define __constant_le16_to_cpu(x) ((__force __u16)(__le16)(x))
> -#define __constant_cpu_to_be64(x) ((__force
> __be64)___constant_swab64((x)))
> -#define __constant_be64_to_cpu(x) ___constant_swab64((__force
> __u64)(__be64)(x))
> -#define __constant_cpu_to_be32(x) ((__force
> __be32)___constant_swab32((x)))
> -#define __constant_be32_to_cpu(x) ___constant_swab32((__force
> __u32)(__be32)(x))
> -#define __constant_cpu_to_be16(x) ((__force
> __be16)___constant_swab16((x)))
> -#define __constant_be16_to_cpu(x) ___constant_swab16((__force
> __u16)(__be16)(x))
> -#define __cpu_to_le64(x) ((__force __le64)(__u64)(x))
> -#define __le64_to_cpu(x) ((__force __u64)(__le64)(x))
> -#define __cpu_to_le32(x) ((__force __le32)(__u32)(x))
> -#define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
> -#define __cpu_to_le16(x) ((__force __le16)(__u16)(x))
> -#define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
> -#define __cpu_to_be64(x) ((__force __be64)__swab64((x)))
> -#define __be64_to_cpu(x) __swab64((__force __u64)(__be64)(x))
> -#define __cpu_to_be32(x) ((__force __be32)__swab32((x)))
> -#define __be32_to_cpu(x) __swab32((__force __u32)(__be32)(x))
> -#define __cpu_to_be16(x) ((__force __be16)__swab16((x)))
> -#define __be16_to_cpu(x) __swab16((__force __u16)(__be16)(x))
> -
> -static inline __le64 __cpu_to_le64p(const __u64 *p)
> -{
> -    return (__force __le64)*p;
> -}
> -static inline __u64 __le64_to_cpup(const __le64 *p)
> -{
> -    return (__force __u64)*p;
> -}
> -static inline __le32 __cpu_to_le32p(const __u32 *p)
> -{
> -    return (__force __le32)*p;
> -}
> -static inline __u32 __le32_to_cpup(const __le32 *p)
> -{
> -    return (__force __u32)*p;
> -}
> -static inline __le16 __cpu_to_le16p(const __u16 *p)
> -{
> -    return (__force __le16)*p;
> -}
> -static inline __u16 __le16_to_cpup(const __le16 *p)
> -{
> -    return (__force __u16)*p;
> -}
> -static inline __be64 __cpu_to_be64p(const __u64 *p)
> -{
> -    return (__force __be64)__swab64p(p);
> -}
> -static inline __u64 __be64_to_cpup(const __be64 *p)
> -{
> -    return __swab64p((__u64 *)p);
> -}
> -static inline __be32 __cpu_to_be32p(const __u32 *p)
> -{
> -    return (__force __be32)__swab32p(p);
> -}
> -static inline __u32 __be32_to_cpup(const __be32 *p)
> -{
> -    return __swab32p((__u32 *)p);
> -}
> -static inline __be16 __cpu_to_be16p(const __u16 *p)
> -{
> -    return (__force __be16)__swab16p(p);
> -}
> -static inline __u16 __be16_to_cpup(const __be16 *p)
> -{
> -    return __swab16p((__u16 *)p);
> -}
> -#define __cpu_to_le64s(x) do {} while (0)
> -#define __le64_to_cpus(x) do {} while (0)
> -#define __cpu_to_le32s(x) do {} while (0)
> -#define __le32_to_cpus(x) do {} while (0)
> -#define __cpu_to_le16s(x) do {} while (0)
> -#define __le16_to_cpus(x) do {} while (0)
> -#define __cpu_to_be64s(x) __swab64s((x))
> -#define __be64_to_cpus(x) __swab64s((x))
> -#define __cpu_to_be32s(x) __swab32s((x))
> -#define __be32_to_cpus(x) __swab32s((x))
> -#define __cpu_to_be16s(x) __swab16s((x))
> -#define __be16_to_cpus(x) __swab16s((x))
> -
> -#include <xen/byteorder/generic.h>
> -
> -#endif /* __XEN_BYTEORDER_LITTLE_ENDIAN_H__ */
> diff --git a/xen/include/xen/byteorder/swab.h
> b/xen/include/xen/byteorder/swab.h
> deleted file mode 100644
> index b7e30f0503..0000000000
> --- a/xen/include/xen/byteorder/swab.h
> +++ /dev/null
> @@ -1,183 +0,0 @@
> -#ifndef __XEN_BYTEORDER_SWAB_H__
> -#define __XEN_BYTEORDER_SWAB_H__
> -
> -/*
> - * Byte-swapping, independently from CPU endianness
> - *     swabXX[ps]?(foo)
> - *
> - * Francois-Rene Rideau <fare@tunes.org> 19971205
> - *    separated swab functions from cpu_to_XX,
> - *    to clean up support for bizarre-endian architectures.
> - */
> -
> -/* casts are necessary for constants, because we never know how for sure
> - * how U/UL/ULL map to __u16, __u32, __u64. At least not in a portable w=
ay.
> - */
> -#define ___swab16(x)                                    \
> -({                                                      \
> -    __u16 __x =3D (x);                                    \
> -    ((__u16)(                                           \
> -        (((__u16)(__x) & (__u16)0x00ffU) << 8) |        \
> -        (((__u16)(__x) & (__u16)0xff00U) >> 8) ));      \
> -})
> -
> -#define ___swab32(x)                                            \
> -({                                                              \
> -    __u32 __x =3D (x);                                            \
> -    ((__u32)(                                                   \
> -        (((__u32)(__x) & (__u32)0x000000ffUL) << 24) |          \
> -        (((__u32)(__x) & (__u32)0x0000ff00UL) <<  8) |          \
> -        (((__u32)(__x) & (__u32)0x00ff0000UL) >>  8) |          \
> -        (((__u32)(__x) & (__u32)0xff000000UL) >> 24) ));        \
> -})
> -
> -#define ___swab64(x)                                                    =
   \
> -({                                                                      =
   \
> -    __u64 __x =3D (x);                                                  =
     \
> -    ((__u64)(                                                           =
   \
> -        (__u64)(((__u64)(__x) & (__u64)0x00000000000000ffULL) << 56) |  =
   \
> -        (__u64)(((__u64)(__x) & (__u64)0x000000000000ff00ULL) << 40) |  =
   \
> -        (__u64)(((__u64)(__x) & (__u64)0x0000000000ff0000ULL) << 24) |  =
   \
> -        (__u64)(((__u64)(__x) & (__u64)0x00000000ff000000ULL) <<  8) |  =
   \
> -            (__u64)(((__u64)(__x) & (__u64)0x000000ff00000000ULL) >>  8)=
 | \
> -        (__u64)(((__u64)(__x) & (__u64)0x0000ff0000000000ULL) >> 24) |  =
   \
> -        (__u64)(((__u64)(__x) & (__u64)0x00ff000000000000ULL) >> 40) |  =
   \
> -        (__u64)(((__u64)(__x) & (__u64)0xff00000000000000ULL) >> 56) ));=
   \
> -})
> -
> -#define ___constant_swab16(x)                   \
> -    ((__u16)(                                   \
> -        (((__u16)(x) & (__u16)0x00ffU) << 8) |  \
> -        (((__u16)(x) & (__u16)0xff00U) >> 8) ))
> -#define ___constant_swab32(x)                           \
> -    ((__u32)(                                           \
> -        (((__u32)(x) & (__u32)0x000000ffUL) << 24) |    \
> -        (((__u32)(x) & (__u32)0x0000ff00UL) <<  8) |    \
> -        (((__u32)(x) & (__u32)0x00ff0000UL) >>  8) |    \
> -        (((__u32)(x) & (__u32)0xff000000UL) >> 24) ))
> -#define ___constant_swab64(x)                                           =
 \
> -    ((__u64)(                                                           =
 \
> -        (__u64)(((__u64)(x) & (__u64)0x00000000000000ffULL) << 56) |    =
 \
> -        (__u64)(((__u64)(x) & (__u64)0x000000000000ff00ULL) << 40) |    =
 \
> -        (__u64)(((__u64)(x) & (__u64)0x0000000000ff0000ULL) << 24) |    =
 \
> -        (__u64)(((__u64)(x) & (__u64)0x00000000ff000000ULL) <<  8) |    =
 \
> -            (__u64)(((__u64)(x) & (__u64)0x000000ff00000000ULL) >>  8) |=
 \
> -        (__u64)(((__u64)(x) & (__u64)0x0000ff0000000000ULL) >> 24) |    =
 \
> -        (__u64)(((__u64)(x) & (__u64)0x00ff000000000000ULL) >> 40) |    =
 \
> -        (__u64)(((__u64)(x) & (__u64)0xff00000000000000ULL) >> 56) ))
> -
> -/*
> - * provide defaults when no architecture-specific optimization is detect=
ed
> - */
> -#ifndef __arch__swab16
> -#  define __arch__swab16(x) ({ __u16 __tmp =3D (x) ; ___swab16(__tmp); }=
)
> -#endif
> -#ifndef __arch__swab32
> -#  define __arch__swab32(x) ({ __u32 __tmp =3D (x) ; ___swab32(__tmp); }=
)
> -#endif
> -#ifndef __arch__swab64
> -#  define __arch__swab64(x) ({ __u64 __tmp =3D (x) ; ___swab64(__tmp); }=
)
> -#endif
> -
> -#ifndef __arch__swab16p
> -#  define __arch__swab16p(x) __arch__swab16(*(x))
> -#endif
> -#ifndef __arch__swab32p
> -#  define __arch__swab32p(x) __arch__swab32(*(x))
> -#endif
> -#ifndef __arch__swab64p
> -#  define __arch__swab64p(x) __arch__swab64(*(x))
> -#endif
> -
> -#ifndef __arch__swab16s
> -#  define __arch__swab16s(x) do { *(x) =3D __arch__swab16p((x)); } while=
 (0)
> -#endif
> -#ifndef __arch__swab32s
> -#  define __arch__swab32s(x) do { *(x) =3D __arch__swab32p((x)); } while=
 (0)
> -#endif
> -#ifndef __arch__swab64s
> -#  define __arch__swab64s(x) do { *(x) =3D __arch__swab64p((x)); } while=
 (0)
> -#endif
> -
> -
> -/*
> - * Allow constant folding
> - */
> -#if defined(__GNUC__) && defined(__OPTIMIZE__)
> -#  define __swab16(x) \
> -(__builtin_constant_p((__u16)(x)) ? \
> - ___swab16((x)) : \
> - __fswab16((x)))
> -#  define __swab32(x) \
> -(__builtin_constant_p((__u32)(x)) ? \
> - ___swab32((x)) : \
> - __fswab32((x)))
> -#  define __swab64(x) \
> -(__builtin_constant_p((__u64)(x)) ? \
> - ___swab64((x)) : \
> - __fswab64((x)))
> -#else
> -#  define __swab16(x) __fswab16(x)
> -#  define __swab32(x) __fswab32(x)
> -#  define __swab64(x) __fswab64(x)
> -#endif /* OPTIMIZE */
> -
> -
> -static inline __attribute_const__ __u16 __fswab16(__u16 x)
> -{
> -    return __arch__swab16(x);
> -}
> -static inline __u16 __swab16p(const __u16 *x)
> -{
> -    return __arch__swab16p(x);
> -}
> -static inline void __swab16s(__u16 *addr)
> -{
> -    __arch__swab16s(addr);
> -}
> -
> -static inline __attribute_const__ __u32 __fswab32(__u32 x)
> -{
> -    return __arch__swab32(x);
> -}
> -static inline __u32 __swab32p(const __u32 *x)
> -{
> -    return __arch__swab32p(x);
> -}
> -static inline void __swab32s(__u32 *addr)
> -{
> -    __arch__swab32s(addr);
> -}
> -
> -#ifdef __BYTEORDER_HAS_U64__
> -static inline __attribute_const__ __u64 __fswab64(__u64 x)
> -{
> -#  ifdef __SWAB_64_THRU_32__
> -    __u32 h =3D x >> 32;
> -        __u32 l =3D x & ((1ULL<<32)-1);
> -        return (((__u64)__swab32(l)) << 32) | ((__u64)(__swab32(h)));
> -#  else
> -    return __arch__swab64(x);
> -#  endif
> -}
> -static inline __u64 __swab64p(const __u64 *x)
> -{
> -    return __arch__swab64p(x);
> -}
> -static inline void __swab64s(__u64 *addr)
> -{
> -    __arch__swab64s(addr);
> -}
> -#endif /* __BYTEORDER_HAS_U64__ */
> -
> -#define swab16 __swab16
> -#define swab32 __swab32
> -#define swab64 __swab64
> -#define swab16p __swab16p
> -#define swab32p __swab32p
> -#define swab64p __swab64p
> -#define swab16s __swab16s
> -#define swab32s __swab32s
> -#define swab64s __swab64s
> -
> -#endif /* __XEN_BYTEORDER_SWAB_H__ */
> --
> 2.27.0
>=20


