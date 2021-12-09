Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 84D8A46E67C
	for <lists+xen-devel@lfdr.de>; Thu,  9 Dec 2021 11:20:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.242881.420031 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mvGWr-0001k3-Lg; Thu, 09 Dec 2021 10:19:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 242881.420031; Thu, 09 Dec 2021 10:19:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mvGWr-0001hQ-I7; Thu, 09 Dec 2021 10:19:57 +0000
Received: by outflank-mailman (input) for mailman id 242881;
 Thu, 09 Dec 2021 10:19:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=i/Bx=Q2=arm.com=Rahul.Singh@srs-se1.protection.inumbo.net>)
 id 1mvGWp-0001b4-VS
 for xen-devel@lists.xenproject.org; Thu, 09 Dec 2021 10:19:56 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on0631.outbound.protection.outlook.com
 [2a01:111:f400:fe0d::631])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8bde6dcf-58d9-11ec-a831-37629979565c;
 Thu, 09 Dec 2021 11:19:55 +0100 (CET)
Received: from AS9PR04CA0064.eurprd04.prod.outlook.com (2603:10a6:20b:48b::17)
 by VE1PR08MB5261.eurprd08.prod.outlook.com (2603:10a6:803:10d::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.21; Thu, 9 Dec
 2021 10:19:33 +0000
Received: from VE1EUR03FT048.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:48b:cafe::75) by AS9PR04CA0064.outlook.office365.com
 (2603:10a6:20b:48b::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.13 via Frontend
 Transport; Thu, 9 Dec 2021 10:19:33 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT048.mail.protection.outlook.com (10.152.19.8) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4755.13 via Frontend Transport; Thu, 9 Dec 2021 10:19:32 +0000
Received: ("Tessian outbound 157533e214a9:v110");
 Thu, 09 Dec 2021 10:19:32 +0000
Received: from a6112ec6773c.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 1F488A30-E7D8-46E8-932E-48BBA014EB8C.1; 
 Thu, 09 Dec 2021 10:19:13 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id a6112ec6773c.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 09 Dec 2021 10:19:13 +0000
Received: from AS8PR08MB6919.eurprd08.prod.outlook.com (2603:10a6:20b:39e::10)
 by AM6PR08MB3400.eurprd08.prod.outlook.com (2603:10a6:20b:42::27)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.21; Thu, 9 Dec
 2021 10:19:09 +0000
Received: from AS8PR08MB6919.eurprd08.prod.outlook.com
 ([fe80::8851:be59:208:265e]) by AS8PR08MB6919.eurprd08.prod.outlook.com
 ([fe80::8851:be59:208:265e%6]) with mapi id 15.20.4734.024; Thu, 9 Dec 2021
 10:19:09 +0000
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
X-Inumbo-ID: 8bde6dcf-58d9-11ec-a831-37629979565c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+Fx0DkfBS/XCOBZLLXfq5BqjRt8vzRSZdNNmdlW2A5c=;
 b=hOnqqb5ERA31haOnUKdjJHBnIfndfYvSoj3nzD30qQOdQZXDGaufVdjlEAEwjhUjZiU87sygVPk1EFJXdPe91Evlql2HMbUYik7rC5RwpF271UL1qXjIjwca3k6LRIMQU6kUkmYuElybKCWj28aFgbxrH8ftE65lmzZEjEYzxOU=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 198b7e5e42d4fd91
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FC/eBq00Ss7CSM6f3IjhOHAkxqGcdDy1xrHkkv3deG3N49B5sEqwYRV2HGFiqXkisHlunMmI1HDW1ITb+Gt4hORg/azf2aGiOqhfN7a6I4dp++pV9v01NaNV+/f2KDbgYxpYA8Kf9WbFa8Eq85EqKxaM6ppyPnEjyCU1W8JTB6avi/+R+VgRtlchDXAVjwLdC8y7FCkv5l6I//uJmNpAz/Ist2uwJFGw7pKFfetEAcZ0bPp2Ya6woNSgL8uBzr72uFXxBDFgTd7y22PXveO6V4fQ+5/qe8cLNmLZVvfZDwFu+zE+cwV2p4knUP96A4w6SbKqhgwrYerA48AIRHgNEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+Fx0DkfBS/XCOBZLLXfq5BqjRt8vzRSZdNNmdlW2A5c=;
 b=LcwkZEJmAVxZcXa6hBIt7Nka1Ck6ujxuhZPj3CM9f2a3BNeRbPxd5/lOAZzLaPJ+9sqfrNNLHyhv6Iuyv7hcl7is9ie4E5ahbZkC+F2mslFqXouqfIh/PtqbSZeOgxLr75k8yQVjwj/Owd5qgvaub1w68p6BN4upNXPFyj+Rth+x6xZVmBlvWWvCOerXTDTo1a4+4L9sPfVrAFPake20txP0QqydstaJPlkLeFh9WjLQoQ+lecRwNP+2zVt77BSIs8rHPlhUGGHYMtNHH93SvuuHT/9gO3607nFeLtZdD7xD8GURNwgW5yPDhu4yEgOZJdW2Wed4O+mdeCcpDZ6kFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+Fx0DkfBS/XCOBZLLXfq5BqjRt8vzRSZdNNmdlW2A5c=;
 b=hOnqqb5ERA31haOnUKdjJHBnIfndfYvSoj3nzD30qQOdQZXDGaufVdjlEAEwjhUjZiU87sygVPk1EFJXdPe91Evlql2HMbUYik7rC5RwpF271UL1qXjIjwca3k6LRIMQU6kUkmYuElybKCWj28aFgbxrH8ftE65lmzZEjEYzxOU=
From: Rahul Singh <Rahul.Singh@arm.com>
To: Oleksandr Andrushchenko <andr2000@gmail.com>
CC: xen-devel <xen-devel@lists.xenproject.org>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, "oleksandr_tyshchenko@epam.com"
	<oleksandr_tyshchenko@epam.com>, "volodymyr_babchuk@epam.com"
	<volodymyr_babchuk@epam.com>, "artem_mygaiev@epam.com"
	<artem_mygaiev@epam.com>, Bertrand Marquis <Bertrand.Marquis@arm.com>,
	Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>, Julien Grall
	<jgrall@amazon.com>
Subject: Re: [PATCH v8 3/4] xen/arm: account IO handler for emulated PCI host
 bridge
Thread-Topic: [PATCH v8 3/4] xen/arm: account IO handler for emulated PCI host
 bridge
Thread-Index: AQHX7M6ZJ84IjlvR+0ihD3B1W/9MVKwp8sqA
Date: Thu, 9 Dec 2021 10:19:09 +0000
Message-ID: <168AEE58-0C22-458A-8D81-C2CB9B7A4758@arm.com>
References: <20211209072918.460902-1-andr2000@gmail.com>
 <20211209072918.460902-4-andr2000@gmail.com>
In-Reply-To: <20211209072918.460902-4-andr2000@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 26aed6d3-d6c0-4034-ba0e-08d9bafd647f
x-ms-traffictypediagnostic:
	AM6PR08MB3400:EE_|VE1EUR03FT048:EE_|VE1PR08MB5261:EE_
X-Microsoft-Antispam-PRVS:
	<VE1PR08MB5261862AAB2D1ED9FA78419CFC709@VE1PR08MB5261.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:8273;OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 Cgi4UySHB59XmivmxRTeI/xg01pXn4ESjvP+EDDMHohTFlsVivV5PfgWwMlKQMUNkfcFONdXIrnxMWx1cGQdnmeUDu+9ZY5/4jQmYpVzo6+umLy88HJ6iRAqpg04MHa3RMyfOpY2HrXjaUrsxEIlo3lYpaV/5c7wKG+gjedjiNqYxJM6HvpkBqT5VCQnLNik83lfGH8N9iyuUkxzkIVoD/wIe8fDpPT1ZZwhXCyQnZnW5vfLFg/0miMDdtJEj0qZ2sBC9TMZ1Izy0v1fNudObuSQTQNFnyCLyV1fygCvaR6xZulX4eDLJRH9KHfds1rEGUS4MmAA5FbYuCz57k5DLp7IDBF4ThvOWE8CFl+j0MD3GNoyuHMeuPjEnStkfGnW01ZaGgoGG5McuDHwZI3CIOBD3gkDznloPMpwJoM85XtWSoZLW37DNp8FP315pTX9WF7ETEcOuxNCaSAMIRu41tYbAxCVAAKWuk6opFApAPng01lc0J3Fwpmk4CZk454ZNO6IfNsax+9ftwvrffZLv6VskP886sdN6DH8lUWWZAxYozY4N5kWqwCwzsHX0muCXwFXcTqOLW36Rx0WSnXwj/XF+AdrgIT0aFeMk6rE/auPzyzTsaYvVE5Bm4fYYfkCcQ+5J0NcqpZ3YIx+2rVcPv8D21JlSWiq6AgOylhEB30kdjfzWMdLARcYpOgRL4w4B4dt/4rRvjq8RZfYagH7FuW/EbjQxjU7h4iZZY+2V9g=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB6919.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(91956017)(186003)(54906003)(316002)(76116006)(71200400001)(86362001)(15650500001)(122000001)(6512007)(4326008)(66476007)(66556008)(26005)(66946007)(64756008)(508600001)(66446008)(4744005)(2906002)(38100700002)(38070700005)(83380400001)(53546011)(8936002)(6916009)(6486002)(36756003)(8676002)(6506007)(2616005)(33656002)(5660300002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <FA8FE055E818AA4791E9E97540A09CC0@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3400
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT048.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	c110983f-d128-4d87-ea87-08d9bafd56e8
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	sJdtRz9dUtWWpbUYEfoya3NOyApiG1Kb6OARJrAiI/p8PcBM1RyAghj87pVdpHZN5lcayHyfl5D1ADfo9krfu//Q9hukFYoI2alP/2I0+P1viZ42OUTc093qmbHhOzXAVNaqXyumNBGRhP/e8A+Lla7DoYb6fKswGF/9HLjSZiArm0r5gEpxEPsE4ZDErf7Hnm3PdQ2bhuQ0OlaqTG83VJ+1a7Lp41eYhAvgVl4Twtfa17DQrp9YbU5kmhXuxMCr0zmKiS2zceeNVJutu/XyruxLLbyqP3lj/bqaxKRM0JtHLGxs6qDJnH+b/zChs5Aimf66yKhe+rVivFJYFYAquxq1QyQdOnaSC4bUIkJ5WH+9cmxGaR/8k6QpyZsrTNxyXIEzob9mWAMwNOPZACoF9T6eP4bgU1WR6qRp4HbGZOq+Zb/BXNZGPBd7wfGteKb60FJplDLOSuAJ3AGqulupVnFLS5t8/3dNNMotrYr9tVqZk2rWhbH4TOCXLrEywVhSIlrtugvOVpoYMmBMDBZmdNnU+PyG3O+QY72y1LOA6jP8IwWFd7AA0GoT4gMIDF2/MgV1H+o9joT4ehom9iO/BXZ9hoA15MSEobxorWpgkjNYP6wy6N2gPknSpVVkrhHW6t3gXKC+fwGmRk4L+AJm0fNaHvXq+lBw9P2v3q0XOfHKj7eV7lfhLpk4UcRlaCPfkfo4qx+8/hKYgAgl1DGrQEaltv21bOhG71OvU8MS5KQuiep+vMhJuvzOkkeqiclK4GK0dPNx1SDnY1ECpTMfxQ==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(46966006)(36840700001)(40470700001)(15650500001)(2906002)(47076005)(5660300002)(36860700001)(70586007)(36756003)(316002)(6506007)(70206006)(186003)(26005)(54906003)(4744005)(53546011)(83380400001)(8936002)(6486002)(336012)(4326008)(6512007)(6862004)(508600001)(8676002)(356005)(81166007)(107886003)(40460700001)(86362001)(2616005)(82310400004)(33656002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Dec 2021 10:19:32.3970
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 26aed6d3-d6c0-4034-ba0e-08d9bafd647f
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT048.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB5261

Hi Oleksandr,

> On 9 Dec 2021, at 7:29 am, Oleksandr Andrushchenko <andr2000@gmail.com> w=
rote:
>=20
> From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
>=20
> At the moment, we always allocate an extra 16 slots for IO handlers
> (see MAX_IO_HANDLER). So while adding an IO trap handler for the emulated
> PCI host bridge we are not breaking anything, but we have a latent bug
> as the maximum number of IOs may be exceeded.
> Fix this by explicitly telling that we have an additional IO handler, so =
it is
> accounted.
>=20
> Fixes: d59168dc05a5 ("xen/arm: Enable the existing x86 virtual PCI suppor=
t for ARM")
>=20
> Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> Acked-by: Julien Grall <jgrall@amazon.com>

Reviewed-by: Rahul Singh <rahul.singh@arm.com>
Tested-by: Rahul Singh <rahul.singh@arm.com>

Regards,
Rahul

