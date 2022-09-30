Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 64CA25F0938
	for <lists+xen-devel@lfdr.de>; Fri, 30 Sep 2022 12:38:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.414113.658215 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oeDPE-00060A-Oo; Fri, 30 Sep 2022 10:38:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 414113.658215; Fri, 30 Sep 2022 10:38:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oeDPE-0005yN-M0; Fri, 30 Sep 2022 10:38:08 +0000
Received: by outflank-mailman (input) for mailman id 414113;
 Fri, 30 Sep 2022 10:38:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZrHG=2B=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1oeDPC-0005la-Ik
 for xen-devel@lists.xenproject.org; Fri, 30 Sep 2022 10:38:06 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr130079.outbound.protection.outlook.com [40.107.13.79])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f75a1a21-40ab-11ed-964a-05401a9f4f97;
 Fri, 30 Sep 2022 12:38:05 +0200 (CEST)
Received: from AS9PR06CA0126.eurprd06.prod.outlook.com (2603:10a6:20b:467::25)
 by AS8PR08MB8184.eurprd08.prod.outlook.com (2603:10a6:20b:561::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.19; Fri, 30 Sep
 2022 10:37:48 +0000
Received: from VE1EUR03FT006.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:467:cafe::55) by AS9PR06CA0126.outlook.office365.com
 (2603:10a6:20b:467::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.23 via Frontend
 Transport; Fri, 30 Sep 2022 10:37:48 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT006.mail.protection.outlook.com (10.152.18.116) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5676.17 via Frontend Transport; Fri, 30 Sep 2022 10:37:47 +0000
Received: ("Tessian outbound 937eed45f6ed:v128");
 Fri, 30 Sep 2022 10:37:47 +0000
Received: from db5078d7b243.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 972BF105-8173-4FDC-9B92-E427C1642D86.1; 
 Fri, 30 Sep 2022 10:37:40 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id db5078d7b243.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 30 Sep 2022 10:37:40 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by AS8PR08MB8325.eurprd08.prod.outlook.com (2603:10a6:20b:536::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.23; Fri, 30 Sep
 2022 10:37:39 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::29d8:8cbc:8a55:811a]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::29d8:8cbc:8a55:811a%4]) with mapi id 15.20.5676.023; Fri, 30 Sep 2022
 10:37:39 +0000
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
X-Inumbo-ID: f75a1a21-40ab-11ed-964a-05401a9f4f97
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=ZYZfTYkaZ+g3+e2+bLK4LWBqTSiQaNPl04+WrcNAW7SaY/nrB0FKr7NpmfojnfK3246haIaJ6VUbSfZegkcPUpluN+TBGSSuXBz+OluJsZOQ1EOlcSJaRKt5RqblMA1EbSqRSISpGf1vio7TvGUe++BNxJ4tHleUCcNY2qp6xO1afFtKfzaNxMuY5IskVXuYRm9yNesTxKFZnpvbFAOCCnEou9D+J+jNuNJhqrpGe0k0pg0/vUydnyFLFmMOi2wWRCQaNc3xaOw/2w9M0AmHJkDKoKWLRrWJAsk3eSsK5njpzITjmi1K1v4PLvpJTKG1WrVosY+jVNrn1EtLqNGeng==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nsyBqG8rWrUKKDWdmfQbLNWTbc83X4k6EIjjOXRfDNQ=;
 b=RXV8iFGLvBaeDwM9Tn6wbdocBoMln4nIhPHtqEx8KCgSj9lAyz16JD6XUhRtF70fBiZPLWNIPUNnaZqAJ0OgDM9gOQoe7aFxDuqn4jX7ci6tHvbFhxnoepcXgrEqcMBAfIbRtBqWX7tL2SpIgvFedAEIQPZULMggPtGptROPzquDFNGNqv1FpB51mQHQgx8RwSFYDy4Qe7XWBws+EiCCPo61mOI1HWpCrsAuqzvau3dV7bcl6cn34tuaQqOFKAnW5VGyHXqHa984Xz1T2FXU+rmyIU1+VRLmyMj5AQ2ltX30P9ibVwvYdyo+l+pqJ+JuVmnGGxnNVAo7IvzuK9acHg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nsyBqG8rWrUKKDWdmfQbLNWTbc83X4k6EIjjOXRfDNQ=;
 b=SwG1UaF0HFuo6mV1WemzvdLOSYNx73vT4SL+b/auszmmCSVRG0ogCCj1jq3RRmKQhGv17z27U7vnKeBCsgzOvXYBCeCbpSN0yIJtTbCXA0xs2J3C15uRSORZHT7COjx16Y76UED7NJCJMsTr8R8A3d0QMPvUBHx9XVq4n1B5KEY=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: b9ad60c8fec4493b
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dRpaRtPfmpDj/frVxQySKKt+Y+2QZBqdPELsyIv2Pz6vMUZzrQ2JROcVnmQf0CWp2I+JBh8P9DULc6So9LtjkOejzbEe7sP8U/+vz998GLX1xTGSjEJn4OuTAhX2eUwVM74W5DYUVA4co9D5BUTrvJuJvA3WobfiANXt2pcuUPAEEtSuMLR/zAwyPEuo8XE2BPF3y/ihYcdRNxDtsUZog/lmp9hOEfoP20GPid888hz901s+69zqOwFuZrqwC8fAH96chfJ0m7l8ezW53ukj63UCMhMFRB64cPwtakjcSKpqlg3yU8rwxR6ctra7uAHP4Lg6SCpmldzHaL7zw2oDYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nsyBqG8rWrUKKDWdmfQbLNWTbc83X4k6EIjjOXRfDNQ=;
 b=E3NAgUJeP0JfAGKCLoOjEknDrBwc6pYBMgHKlsO81IBNapHRzcllq/FmZLWM1b+b/rj/MMwR/YAOuizu89Hm/RKz8EJAR4bP6NHJF+lIq5XqeZIHT8hgfsxSkLB14NNoxhx4AmTEYaKIyKBZ+ycBN7jvTLDYnbXF7HTyR3fvQnr1KtT3NEHNehjSavDza2KUXuJdTXja/dFf09eJr/22IiCCI5AGR1dXlIZgN0/amFUOa5cagGW1hSIPCujoxYmdkotwV+rHqhH+tTguaK95tNUNsS/8lZxPabS59c1LTLM4xROIeA8YPNMbG3dcQ8O9xL4iHHyQAh0ZVTlignoo/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nsyBqG8rWrUKKDWdmfQbLNWTbc83X4k6EIjjOXRfDNQ=;
 b=SwG1UaF0HFuo6mV1WemzvdLOSYNx73vT4SL+b/auszmmCSVRG0ogCCj1jq3RRmKQhGv17z27U7vnKeBCsgzOvXYBCeCbpSN0yIJtTbCXA0xs2J3C15uRSORZHT7COjx16Y76UED7NJCJMsTr8R8A3d0QMPvUBHx9XVq4n1B5KEY=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Rahul Singh <Rahul.Singh@arm.com>
CC: Xen developer discussion <xen-devel@lists.xenproject.org>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, Jan
 Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH 1/2] xen: Add static event channel in SUPPORT.md on ARM
Thread-Topic: [PATCH 1/2] xen: Add static event channel in SUPPORT.md on ARM
Thread-Index: AQHYzzwfdk70jfLcAUikH+g7arl1t6330tqA
Date: Fri, 30 Sep 2022 10:37:39 +0000
Message-ID: <34888A16-D236-42A3-B020-ADF873537C14@arm.com>
References: <cover.1663928523.git.rahul.singh@arm.com>
 <02a4499694dec9fd48791a2d0c24a0d450b907ac.1663928523.git.rahul.singh@arm.com>
In-Reply-To:
 <02a4499694dec9fd48791a2d0c24a0d450b907ac.1663928523.git.rahul.singh@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3696.120.41.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3784:EE_|AS8PR08MB8325:EE_|VE1EUR03FT006:EE_|AS8PR08MB8184:EE_
X-MS-Office365-Filtering-Correlation-Id: 42931e8f-113e-4e94-8b12-08daa2cfd13c
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 GXnIaNNsrUtp4Og0UlCWGPfw/sizom/iUb9H87nJiQq1AjpPrCf8vK1Cx0zhvzfwjiko1S+rnDQe7dwIx0UFMuWuNFkywb6zj1kWIdSRdvibGnj1AWB3aENADzVVxRuxU9/ZB44tol5j5rFF3YbQbWHLHBLjfbn90o5q1Ouyx82tbAj4dt6zCpDvZ7q4F5BGwvlDGQ0RqyhN2dcsT5NLBOk2Z1p1sZZWgtC7DpFbFJ146HntWmTeInay4foAlL2nmiCzceTqVjHBlen0NGxBCar6RB8891XiLLyKSINBAfxoVyC54ZxuuSzfkebQX2DWv9urRe6ms25Db4YxGebqj6sMg5ALKdVVH9yJ/R9TUB/x5bmPMpR6xtZIMbieiQ3+kqp0ZU16DCU9bHWYioes8aFyJ+WpIpANJL+kBfTAkSFjTW3/DhToeZtE3hwZ/MDu8uP2seRjTFpXDTjCdLyZBol1qcXxKAvFr2kjWwxZee5Gwj//53NXxXmNKkeWe/1WJFI6reLish3VbikCzK+ccP5mM4jxyY16zcLEzusPGX4IToE/clf11ROGeeuF/1qo9yGLGIW0BhuZxVNjYMlkoijjfLds/zlsKO4yU7yRDRIKNkMH2HaXcB1vs1MBv294hLa9iI27lGwX+U1q1reaVw7GpaKMutlkHVBOWW7rkxqxLsPTNgJrQIwKIzVydCM9Z6cc9J/sVp28EmHQFD/Aluor4EuvDSTpAqk4C32C5kqoPElajaqKGszVYmW9ryGFNI3fvDRnAZ1RvIy3iT5ruqmWmt011lccs5Lz4pEIGJQ=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(376002)(136003)(346002)(366004)(39860400002)(396003)(451199015)(41300700001)(36756003)(122000001)(4744005)(38070700005)(6862004)(8936002)(478600001)(38100700002)(6486002)(2616005)(71200400001)(5660300002)(26005)(186003)(6512007)(6506007)(53546011)(86362001)(66446008)(91956017)(66476007)(66556008)(66946007)(76116006)(8676002)(64756008)(4326008)(83380400001)(37006003)(6636002)(33656002)(316002)(54906003)(2906002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <52C15BF968E4914B8773EA2C86E9410F@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB8325
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT006.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	ecdd3f22-6bf8-475c-5b2f-08daa2cfcc43
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	PXtbwbqVXai4UP5FJxBRi86a5DOGKQ/bw0Zx5IzKQelvVEM7NuEUPgWf6eliBScOj/ySTWvCz8NwpArcDOKebH8hACP4FUUjz2vFAN9Vnd09iijUs6Mp0rBlK7ZbGeFhSCsFC4fi01KsLH0t8lh+MoFPzn1tZFvOPskl4mZiuSE4gB0r7pQ3p0S4T9JG3ixt+L+50uIhGYm/9Jcf3fGxukzb/JJDV2LLXOviobq3dw1ethmpyREPql1kslz/9SLIuJkzQMvDx3flL5mgZlivo49J8eVPTWvi1Ej8WwgjB5ky03eYcsULi68lEl0f5xvNhfEb5FuvIGVT4+ifI97GzgkNff8eyhhK7M0MkApHub2JnSyt0rBKzQfv1fe37OECmTABaYyXCfB6lqXe7spawseqxYbM6llchj5lBXcyJNi3MTR3bpvjR3O/KjCuN02EdnqpxKGqo6xFVyVG6S1dELrXa7D+2w8gC/1qLw7b7uSTwGmgfDIoCa/MK96K2Rv6lGwXMIZ9dTLQdn0WNVSa9asBfbkZiR4MndU8RK6Pba687E8qp9oHwGl1J37fwy5ZqyLDCgmwd92X3PbVGb9nK29zCkjye3FCnQZcIDcPab4FygzRstq6YOCnduC3yiO92KKrfY27KmMQWhRbgF+x0mGZVvjp4k2kXrgCKdqHb9B+zC8EN0KgAiD2XSg8uMUeQk53vSsMGPqrK52CM+6uCojGBz7zUtjSvVIPgCQI0q9gTzAo/3JuAZp3GnrB8/SQTOnBOzzwUSa/OFdPm2sNjw==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(376002)(136003)(396003)(346002)(451199015)(46966006)(36840700001)(40470700004)(6512007)(26005)(54906003)(40460700003)(36756003)(4326008)(356005)(81166007)(36860700001)(6486002)(86362001)(33656002)(316002)(82740400003)(40480700001)(6636002)(70586007)(70206006)(8936002)(6862004)(4744005)(41300700001)(37006003)(8676002)(5660300002)(83380400001)(186003)(2616005)(336012)(82310400005)(2906002)(478600001)(47076005)(6506007)(53546011);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2022 10:37:47.7432
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 42931e8f-113e-4e94-8b12-08daa2cfd13c
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT006.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB8184

Hi Rahul,

> On 23 Sep 2022, at 13:02, Rahul Singh <Rahul.Singh@arm.com> wrote:
>=20
> Static event channel support is tech preview, which shall be documented
> in SUPPORT.md
>=20
> Signed-off-by: Rahul Singh <rahul.singh@arm.com>

Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

Cheers
Bertrand

> ---
> SUPPORT.md | 7 +++++++
> 1 file changed, 7 insertions(+)
>=20
> diff --git a/SUPPORT.md b/SUPPORT.md
> index 8ebd63ad82..29f74ac506 100644
> --- a/SUPPORT.md
> +++ b/SUPPORT.md
> @@ -922,6 +922,13 @@ bootscrub=3Doff are passed as Xen command line param=
eters. (Memory should
> be scrubbed with bootscrub=3Didle.) No XSAs will be issues due to
> unscrubbed memory.
>=20
> +## Static Event Channel
> +
> +Allow to setup the static event channel on dom0less system, enabling dom=
ains
> +to send/receive notifications.
> +
> +    Status, ARM: Tech Preview
> +
> # Format and definitions
>=20
> This file contains prose, and machine-readable fragments.
> --=20
> 2.25.1
>=20
>=20


