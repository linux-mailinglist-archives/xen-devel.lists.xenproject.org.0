Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A4C0F68C002
	for <lists+xen-devel@lfdr.de>; Mon,  6 Feb 2023 15:26:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.490489.759210 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pP2Rw-0000dQ-GM; Mon, 06 Feb 2023 14:26:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 490489.759210; Mon, 06 Feb 2023 14:26:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pP2Rw-0000ak-CV; Mon, 06 Feb 2023 14:26:28 +0000
Received: by outflank-mailman (input) for mailman id 490489;
 Mon, 06 Feb 2023 14:26:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vzyl=6C=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1pP2Rv-0000aK-9T
 for xen-devel@lists.xenproject.org; Mon, 06 Feb 2023 14:26:27 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on20631.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::631])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3c3b400f-a62a-11ed-93b5-47a8fe42b414;
 Mon, 06 Feb 2023 15:26:25 +0100 (CET)
Received: from DU2PR04CA0247.eurprd04.prod.outlook.com (2603:10a6:10:28e::12)
 by AS2PR08MB9319.eurprd08.prod.outlook.com (2603:10a6:20b:599::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.34; Mon, 6 Feb
 2023 14:26:18 +0000
Received: from DBAEUR03FT013.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:28e:cafe::94) by DU2PR04CA0247.outlook.office365.com
 (2603:10a6:10:28e::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.34 via Frontend
 Transport; Mon, 6 Feb 2023 14:26:18 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT013.mail.protection.outlook.com (100.127.142.222) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6064.34 via Frontend Transport; Mon, 6 Feb 2023 14:26:18 +0000
Received: ("Tessian outbound 43b0faad5a68:v132");
 Mon, 06 Feb 2023 14:26:17 +0000
Received: from f3dc730642bd.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 C6AB8BD7-1BD1-42AB-B0E6-D790B2390E0E.1; 
 Mon, 06 Feb 2023 14:26:07 +0000
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id f3dc730642bd.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 06 Feb 2023 14:26:07 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com (2603:10a6:20b:8f::22)
 by DB9PR08MB6425.eurprd08.prod.outlook.com (2603:10a6:10:261::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.34; Mon, 6 Feb
 2023 14:26:05 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::b14f:1c13:afa:4eda]) by AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::b14f:1c13:afa:4eda%3]) with mapi id 15.20.6064.034; Mon, 6 Feb 2023
 14:26:05 +0000
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
X-Inumbo-ID: 3c3b400f-a62a-11ed-93b5-47a8fe42b414
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=53/wvQ0s8QaVe90HQ1X8qbCO97kGb2IAOzWaQMThuW8=;
 b=tDnJPb+W+ZiNN4eHFIfgIm/tTHvnTuDMtRnny+ZQBd3O8/HImfnwLTG1sdbDKXL0vJH0aN0sVs/RXple2hA4bdKzWuXLqQkOfufpS9qjJRH8PQH6HVtmLBtil13SQI66MaQn8EjZGDbGiXbgmA7TUcbJzeuOpyBOtwRVKVc1O0U=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 49ed8747c6c46321
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dIo3Uf6ZmgFtmSQSMrORWouiQqD6KMHWPYPfL+VsxArC6sVkM8c0BGtqjKFEcmYUOeFp3IE/MTkifIBYiyHm8cLC9qAdfcchNEQQDgEQnVFA+R1JS/cNCwOcHbo73vWTQv8ULl9MsVLwrqG/dNiE+v1UhtTZ7vMUngQjJkSHSw0myPiiLRFul5NM6SJhYzBr+quWpTJr6bph33yKTSeQxK+MF3BBl57d8ONJl7O363P/vmJuHQyu7uV1s72Rwak+MZnJZh2Z8K4Cyz10LJ3helJjt2Iqy4MmoWk5MVbjk2S79oQ3V+vCmgP+zgJVRAjMi3F/cngdOsrrRrauW3JzFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=53/wvQ0s8QaVe90HQ1X8qbCO97kGb2IAOzWaQMThuW8=;
 b=esXnx3NjCKgUOe3KY+PrGU9E7h9gxQYTn0i0v7hi2SUnMShgfYMIoW21cGI5DjDDL7TBceD1VnzNQAPynyOYS6OBkqEFONGKnVvZjUmJSFyNooSx56EJikkeEutsUL8Zko0yk9kGhni1Boo33gBZlcsydqdpoWbbVDhwXnF2HvJJR3Txo/rqgenkWEgQ0WK26Gz2VN0Y4TZtXFNCc2BlBsHOKngyTVRNhL1ojQL3Bhj/vJBl+hIT1EBOFANAb9TvBI5A1RC6mB3AHgBOHagACTU2grZCuGS00XhCrfmGG8r3G41SF5YpsbG47wN5Fd3oKO2HCEjfqCV3Uf1MhB4H9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=53/wvQ0s8QaVe90HQ1X8qbCO97kGb2IAOzWaQMThuW8=;
 b=tDnJPb+W+ZiNN4eHFIfgIm/tTHvnTuDMtRnny+ZQBd3O8/HImfnwLTG1sdbDKXL0vJH0aN0sVs/RXple2hA4bdKzWuXLqQkOfufpS9qjJRH8PQH6HVtmLBtil13SQI66MaQn8EjZGDbGiXbgmA7TUcbJzeuOpyBOtwRVKVc1O0U=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Michal Orzel <michal.orzel@amd.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH] xen/arm: Print return code from domain_create and
 construct_dom{0,U} on panic
Thread-Topic: [PATCH] xen/arm: Print return code from domain_create and
 construct_dom{0,U} on panic
Thread-Index: AQHZOivabZ9Ut2J3Nka3T18Z2Kyz4q7B+X8A
Date: Mon, 6 Feb 2023 14:26:05 +0000
Message-ID: <C11A0BC1-5D51-46C3-8586-3F1C0BCD5DC8@arm.com>
References: <20230206130528.22401-1-michal.orzel@amd.com>
In-Reply-To: <20230206130528.22401-1-michal.orzel@amd.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.400.51.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3749:EE_|DB9PR08MB6425:EE_|DBAEUR03FT013:EE_|AS2PR08MB9319:EE_
X-MS-Office365-Filtering-Correlation-Id: 1b4e0907-2dfb-46df-2639-08db084e1c73
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 g036i+S5Tv9IMkHXVpc9Gs/wsHVbMFu7d18MlMTn9pUBzHGxa/8dQ7JPUeNG9wMaxQvFwFN0NPINOWFj7Mstv4dnEA7AUe0qIHILPnWM8E9FFA/z0mU3/tlQGdtNpkVy9tI+Zqrqrn/TrGR35Kvm8iIr7AsU7iBmq7R84weLrZh8el7xu+TL2uYl2k/qsA8LI/uS6IuMkFK0u1f7UjXyck5FG8BZKuGwQ1FyIyhCyEL0nvCpTInGivk6TVupe/PI1O6DC/04HSNaYKjS5xvQ5xCenB6KKqccWExQTnM8g4aij2pOiNJfWuwU7oiUIJCVMNqpgvfEzSiQRK7P86rQsB8IN4056zyk2hS+nYpqb1zdW7W674DNyDT5h9hHwrxm2BqpJMHp7/hapiSZfzmc9Aj2kI4iYj5wb0tchrTL1e6abC1QibVJzgPn5LXiP8fWPyJsQNyUeYGUNVUDafuQAGFmd0WTrAelWvLJr5YghiyJ1oUkRN1f6/M4EJY6BERZX/lgidjfUFPClitQ3stp/4i6u96UUykmvc9QdB/qzgAJ3OW0Ok/6dKIZccUGWLj1MEuzuEfkdUlPeqrJ9evBnaSSAb/xsFGTsCNLNe904af60tenWQv1KjIA28Wo/bonHA+cOPyCNKtV1xX0cG8rUsm/KMEcQwWOwy7TpQX+txC/4/azdR/4BIEnVWWzGVAiDUFw/A69lzt/8Jp5s93KoKwg2sNulMwpYRPQDL+Gs20=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3749.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(366004)(136003)(346002)(39860400002)(376002)(396003)(451199018)(64756008)(66446008)(6916009)(53546011)(6506007)(478600001)(6486002)(2616005)(8676002)(6512007)(186003)(26005)(91956017)(4326008)(66946007)(66556008)(316002)(66476007)(76116006)(71200400001)(54906003)(38070700005)(33656002)(36756003)(38100700002)(122000001)(86362001)(83380400001)(5660300002)(4744005)(41300700001)(8936002)(2906002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <28966DE46E485E4A82154302AB367E2C@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB6425
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT013.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	d25f8cfd-87a8-4e50-b590-08db084e14dd
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	qzGukflAk1FABKkc/hDEAqzaK1KVrNV0ATdpiwZm3pMdI1qlmj8e/MFq+6tU/k1GLUbMNBXCkT7NDuFDwWffxogJvn37joRXxRO0tJuausBsfZJp8RW2tC4ZECjFe1l3ka4+c32v/fLK0QF/AHd07AaZfKNtZf0jobKh7y1Pj4Sd8tuWerMC5u0qGKYttbSkStCv5WF6M73EcqlUJQEOLNCWylomDiAmMJpwdncLi7QFF5z7YsK3rMlbsS4/1Vuv2PJ9s55teZl3rcOoZTD6qVSsAVN5k10UTZOS9jJUPcLTDoyGKveBu/UUVbKrcWmySsJFyFPI1hnEi37sJ4bBP5679kqO35NaawAeSgPuHFXbNumvzvREdfoxx9N0UWNmcAZDPVXkZD9CZZ0SpiP3Rn/kNOQXP/uYv4Rqqh0NdFaP/0FE9HOPEmus5QOw+vgXYkrQEzR1VMQ9H4X3MPyegW64MjOL/6U/+HcfS0De3MCBTCIqFo9IVKF/byFsiQwrHC4bTibrfnvEOoK+9pk7KliGZquCPATuM5G0+hO1Mef1a65N417buVIjk5mZcMc7X1ase4u5bKRMjau00hJRn/1x71eiqYerbfiWRgZvZiDaSfXfNqW+/tCoEDS5uwQHVjxRVaq700p/ONRHal3H5vV05HdHZZPNXeJP99CipmCaOsGyxQT8gEIwN8hOvCebWi7j86+uTElbpeMZHPKwQA==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230025)(4636009)(136003)(376002)(396003)(39860400002)(346002)(451199018)(46966006)(36840700001)(40470700004)(70206006)(54906003)(316002)(4326008)(8676002)(70586007)(8936002)(41300700001)(6862004)(40460700003)(81166007)(36756003)(33656002)(86362001)(356005)(82740400003)(107886003)(53546011)(6512007)(26005)(186003)(6506007)(6486002)(2906002)(47076005)(36860700001)(40480700001)(4744005)(82310400005)(478600001)(83380400001)(5660300002)(336012)(2616005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2023 14:26:18.0836
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b4e0907-2dfb-46df-2639-08db084e1c73
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT013.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB9319



> On 6 Feb 2023, at 13:05, Michal Orzel <michal.orzel@amd.com> wrote:
>=20
> This might be helpful in providing additional debugging information (in
> most cases, at least to distinguish -EINVAL from -ENOMEM), so modify the
> code to include printing return code in panic message. In create_dom0,
> move the call to alloc_dom0_vcpu0() to a separate condition and call a
> meaningful panic message.
>=20
> Signed-off-by: Michal Orzel <michal.orzel@amd.com>
> ---

Hi Michal,

The code looks good to me

Reviewed-by: Luca Fancellu <luca.fancellu@arm.com>



