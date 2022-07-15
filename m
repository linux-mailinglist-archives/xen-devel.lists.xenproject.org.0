Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 727F05764C8
	for <lists+xen-devel@lfdr.de>; Fri, 15 Jul 2022 17:57:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.368329.599554 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oCNgi-0000Rc-Gy; Fri, 15 Jul 2022 15:57:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 368329.599554; Fri, 15 Jul 2022 15:57:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oCNgi-0000OY-DQ; Fri, 15 Jul 2022 15:57:08 +0000
Received: by outflank-mailman (input) for mailman id 368329;
 Fri, 15 Jul 2022 15:57:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aDoH=XU=arm.com=Marc.Bonnici@srs-se1.protection.inumbo.net>)
 id 1oCNgg-0000OS-Dx
 for xen-devel@lists.xenproject.org; Fri, 15 Jul 2022 15:57:06 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr140071.outbound.protection.outlook.com [40.107.14.71])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c4e3b67c-0456-11ed-bd2d-47488cf2e6aa;
 Fri, 15 Jul 2022 17:57:03 +0200 (CEST)
Received: from FR0P281CA0044.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:48::7) by
 PR2PR08MB4732.eurprd08.prod.outlook.com (2603:10a6:101:26::15) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5417.23; Fri, 15 Jul 2022 15:56:55 +0000
Received: from VE1EUR03FT006.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:d10:48:cafe::54) by FR0P281CA0044.outlook.office365.com
 (2603:10a6:d10:48::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5458.10 via Frontend
 Transport; Fri, 15 Jul 2022 15:56:55 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT006.mail.protection.outlook.com (10.152.18.116) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5438.12 via Frontend Transport; Fri, 15 Jul 2022 15:56:54 +0000
Received: ("Tessian outbound cc6a8ab50b6b:v123");
 Fri, 15 Jul 2022 15:56:54 +0000
Received: from 046164cbf809.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 08896A65-25DD-41A6-97FD-7926CD3ECACC.1; 
 Fri, 15 Jul 2022 15:56:49 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 046164cbf809.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 15 Jul 2022 15:56:49 +0000
Received: from DB8PR08MB5452.eurprd08.prod.outlook.com (2603:10a6:10:111::10)
 by VI1PR08MB3021.eurprd08.prod.outlook.com (2603:10a6:803:47::27)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.12; Fri, 15 Jul
 2022 15:56:46 +0000
Received: from DB8PR08MB5452.eurprd08.prod.outlook.com
 ([fe80::4f1:335d:1b5f:feed]) by DB8PR08MB5452.eurprd08.prod.outlook.com
 ([fe80::4f1:335d:1b5f:feed%7]) with mapi id 15.20.5438.012; Fri, 15 Jul 2022
 15:56:46 +0000
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
X-Inumbo-ID: c4e3b67c-0456-11ed-bd2d-47488cf2e6aa
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=DIB3r1lm6OGsylITK6rEPq3CWaScUL0/64Cn+QwFzR3J6ww/vfLBI6l1qe70EJ6QngHV54EC2uh87qqJBNdIEdPPMV2HRqONm0QzrPg0LWpAMxrT8EwpSNxLBvBtX7L5liVtHw3I5+yW7wshrnx6TGuIwMF2V6CnEamztsGuPvqoCLN7hnJM/n+oQxK0uaZBHMOFyS2QVMqO8/8gq5zWqFr85P5X0VHd/FFrZKmA6JdpM7l8dcP2mUN/9ZWY1tXpIi9AryNO7pKqLb8MkqGYTG8Bld9xBK9bgPahK3Kgw7DkoEmR1DhGe3+ARlWFy+JDhK6EZrVVHSm1uMfKy9AFMg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d6NyEoGTV5ehoXG7tuaM9ypqXVWZ0zpVIBlCr4aAS3M=;
 b=VA5gXmcpBmvTOhhgvOhU1wr8AOwZGt/T79i0GE4FW5BRLqnn8VGeORi8+lIRhZTHDg8hZZ5l3sVZE5Rl2RhJSFodDwTEE/VobTztLybUrhngpudm6O/+lsrJ5qSAM1mExpOjv0f+d5L3NHIE0zDfAGSeyT0GHg9+hXU0Bv5EGXWgUj7j77VNUz9lFIDf0HUxGZElXoWL8ssYii2q6py9OfXyyKmm26FfFA8Ba5q+z/og7trwPfg8W0MqfFl12ehNAjmWdotV9HRwh3NjZaSjNNYoeNxNBXdBOCbY9Zw8ZJqvz/xklc1TRll3X4d26zRyI7WtmiD0f3mj+agFJL3Msw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d6NyEoGTV5ehoXG7tuaM9ypqXVWZ0zpVIBlCr4aAS3M=;
 b=Rb01hdM6LCRs0aJyxEdAhAbzogUdiLA66bmcLjbLQEgy+FmRv1xhuJyI/ZiGQAcMOpM1PL4C4NCNvdwIDwE+AaLRPJz4SHeIW8ppHD+B5xsWbiJi5381neVcWFs5S2wMV/H4zQF4Jw/gJnj1fsRSjh1Etv9enooVO/pLjRVaBjc=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WyY4yX/gnNnOgPqA2xEbL6pTqIpJGyz15rR0N/CQVEMeqPZziuX86i/MiOmjSgXaplLCJW6lqwHT7yCDR7LDKV12ujdQtHeVhB7QZStQPVBSqYb3GlzKN97qEibZCESmD5reIM504FzyKNhfXQHh845WqRc95bidPa/8D95HC5jBE40pMBKoB4CLxizrQl1qnILNiK7KPGtfatMTrJK9lvhxCWrYQXekbh/rqjmbFWQtVrbdezWOC9XrYXQfA71dI/37NVl5t9d8O/jIrTviVTx17AtFbPtKQS3d6TUy1EVman2OZQf0FG3G16NYMlOJ86iEx6oQ5VGIVPuns3fE5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d6NyEoGTV5ehoXG7tuaM9ypqXVWZ0zpVIBlCr4aAS3M=;
 b=As1orPsb8ZCqGKvLckMU0IuT+jBRxwbkFosSq7lCgoq+nEwTUikp7t/MvUOsta7Yl33K+AHNsB0eBo/c6DSA2JuiczwcngZHxvMsWSXRqIAMGLsxpCYg1hsldWASwyFspPvnE3jOKsk+9y+iGKEqVC5XjLV3B/Ki2r5gZ5P9Co2/IzyN8eaK7/ueY9MOsDKjW4hEaHo8C1OW8dLDh5YCcq+shNejOZz1nK2ZeZemPZdJhM4nm32z+TutohBuu04xrtSmZ45OluPCmxlw/Z6wOiqViXfvFVEspxcIHyvrG8l0n7aUXna5Aahs+6caYBvvVoG1Uq/6TOZItOYoPA48EQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d6NyEoGTV5ehoXG7tuaM9ypqXVWZ0zpVIBlCr4aAS3M=;
 b=Rb01hdM6LCRs0aJyxEdAhAbzogUdiLA66bmcLjbLQEgy+FmRv1xhuJyI/ZiGQAcMOpM1PL4C4NCNvdwIDwE+AaLRPJz4SHeIW8ppHD+B5xsWbiJi5381neVcWFs5S2wMV/H4zQF4Jw/gJnj1fsRSjh1Etv9enooVO/pLjRVaBjc=
From: Marc Bonnici <Marc.Bonnici@arm.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Xen Memory Sharing Query
Thread-Topic: Xen Memory Sharing Query
Thread-Index: AdiXcIvKzj1u3ooYRvOwLKlCsLdCEA==
Date: Fri, 15 Jul 2022 15:56:46 +0000
Message-ID:
 <DB8PR08MB5452C2AEA96D0BB6AECD6618968B9@DB8PR08MB5452.eurprd08.prod.outlook.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: B2E591B8C1A07049A5F2AF3BDD84E2A9.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: f2f72cbe-98b3-4164-0290-08da667aa3de
x-ms-traffictypediagnostic:
	VI1PR08MB3021:EE_|VE1EUR03FT006:EE_|PR2PR08MB4732:EE_
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 kTJp6GzcFw4sm24IQhggHedBp23EFkdlLa/u53lC0PjBXBbd23Qn62EcM1bLXF1eP0mY5kz+eq46emr0gk6SzKiVkweZxN3noCxDeWj/jV+fefLlzyf5hxcRo3qQoRmyGp0oZUHIfekMcxdD3mReBO1kLE1j3XMBFYkdTvRfhwNOeNW7VOa22KFi9D3vjV3mfTSFwTuDHN2viUmo7463q/PjWI28WvhGNevGuBiwJoDxNZoFodnDCBQnI/nANrQoWpyhdGWdbkf5n64L/oCqiVtS1Qa1KkaYURZgBYSxFijorG2eyNqo/8ORfv9wzEJmBk3hvMsL67/1xMhU7QF5EiP7QqEIWaFCPj/SPvYzCPJNTn0mVQgux/Rhu0On5RHqSAQ4PEpc02dMnCJsW19vf1TxxCpodmSEUR/SVvwVNB8tiluI5ygNrY3P6P/rX6n5znKMCQtwKvInqIzTpvhDYkBPq7ix259EVnFQISeoRZ/dqBFZTtoCj+TohfWMVdpkP/Cd+iqQG3Od8i5if367JUB1kc66SgJHRoXnikoBJRkKt2Zm00BNLuJNCWyyo7k77yguVcBOnNUnSVw3sq0ScCDb1Xwn7HeHbWzwPWeg5ozBNN7auw7COhRVBwf24+1hpCSbB5ArUaC2hI7W4nQKFg8PLURDhbJgn5E6GwBz7gG/sEF49lkpG9qpBbNRH8EQHSVxsxGPg54f28ekGJJVYayaUYVdVT2P1wOAVddEAB0ky5WiUsnl2YOtExpIshEJyzuS3Zfibn/f8hSNEw6L0KeCVZBZpjf8T8e3wKo5rwDiXpG5mariwyudV/rFJvTH
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR08MB5452.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(136003)(346002)(396003)(39860400002)(376002)(366004)(38070700005)(186003)(38100700002)(76116006)(2906002)(55016003)(5660300002)(52536014)(33656002)(3480700007)(66446008)(9686003)(8676002)(122000001)(26005)(66556008)(41300700001)(7696005)(478600001)(66476007)(6506007)(83380400001)(6916009)(86362001)(66946007)(64756008)(316002)(71200400001)(8936002);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB3021
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT006.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	41ab6892-4c19-4f3c-8990-08da667a9f10
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	+sNeglGIdpHxDTEEIgc2ZMqm8xWg435jRxBm4U2DCnCGQLf5/KedQF6ZeAMR3vEv64G48Yk9/Hbwem2by3Sf0O87pH6lpQ/vgzga8TmoZXV2V8tDd9NwBk7Uo60rtmdm6UqlQnSFYgJ1lA6wCfP03Get8pYAI/eNH9RQGKBX6bX4a1sNAn8reOj1J4GQkE06RP50CVRmbSztFjjfK7XumtIq9hH3ra+/hgEVHUppm5158Yngi7uoy+ibyH3qhwsyuc6bh2xhT39FmWYQVfUzjQodX4utY5ehUAtDPeDNVjPrTYm3uwuANcDj73yZBWQM8sprANlm9Nqw21EduvVZuOIeeX5QL6acLs861CURkeuhi/CD6sD2kr3E5qyTm95z0uBOtCh7yu1ABg8uF0YG2U5uzq3cCWs2wz4nMTwQz+7l20g4cEaNzaUz7wJ0PhzBJBWfil/YQpwnEeMicsrzkByGgwZde95Xy59SiJFONJXu5O1XVvOSio1d13nJyYm/no+Y30C3MqAZ0zUpuAGIH+4h3zT37ZJcEn1MTL7ho5hoaqs1/0k0aV75MwiRbcX52d9I4I1bO9n9Hxun9HFroT3ThRDFWJuxY42ql5/NhuXtfYkJpmyrUclF6nOrcusNGRm2QfOAj9IucXqal+4zGRK42vQeiu4d4EgfoOdtKB/v9cHoFrBZWVJOJopca7OWsRkLoq0trE3XhRVDVlDVsuhHLLpSRKT4+ELoTJEuBuxGZ8wtatjynxliteoYII3yEdf7XlVkrvmYQxu27OFd15a5q4uT1uWTYjz79f2kEnvoVsFI7sy2K5KLoZDjOGH8
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(346002)(136003)(376002)(396003)(39860400002)(46966006)(36840700001)(40470700004)(8676002)(41300700001)(81166007)(26005)(478600001)(82310400005)(3480700007)(70586007)(40460700003)(47076005)(2906002)(6916009)(5660300002)(83380400001)(70206006)(6506007)(356005)(82740400003)(316002)(9686003)(86362001)(8936002)(55016003)(40480700001)(36860700001)(33656002)(336012)(186003)(52536014)(7696005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2022 15:56:54.6531
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f2f72cbe-98b3-4164-0290-08da667aa3de
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT006.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR2PR08MB4732

Hi All,

I was wondering if someone could help me understand some of the rules of th=
e=20
memory sharing implementation in Xen?

Specifically I'm looking to understand what restrictions Xen places on
granting access from one Dom to another from Xen's perspective, and what ty=
pes=20
of grant requests would be allowed/rejected by Xen?

I.e. How would the situation be handled if the same frame of memory was att=
empted=20
to be shared multiple times?

As an example scenario, DomA shares 1 physical page of memory in a transact=
ion=20
with DomB. And then without releasing any memory, DomA attempts to share
another region of memory, which includes the same physical page of the prev=
ious share
with DomB again. This would result in two concurrent shares containing an o=
verlap.

Apologies if I've missed something but is there any documentation / threat =
model
that would cover these types of scenarios? So far I have been trying to rea=
d through=20
the code but was wondering if there is something else I could refer to help=
 me=20
with my understanding?

Thanks=20

Kind Regards,
Marc Bonnici=20



