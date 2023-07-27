Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E9059765E57
	for <lists+xen-devel@lfdr.de>; Thu, 27 Jul 2023 23:41:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.571275.894745 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qP8ik-0001i1-1h; Thu, 27 Jul 2023 21:40:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 571275.894745; Thu, 27 Jul 2023 21:40:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qP8ij-0001fD-Uq; Thu, 27 Jul 2023 21:40:29 +0000
Received: by outflank-mailman (input) for mailman id 571275;
 Thu, 27 Jul 2023 21:40:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=38O5=DN=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1qP8ii-0001f7-Eq
 for xen-devel@lists.xenproject.org; Thu, 27 Jul 2023 21:40:28 +0000
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
 (mail-am0eur02on2061a.outbound.protection.outlook.com
 [2a01:111:f400:fe13::61a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 32343567-2cc6-11ee-b24a-6b7b168915f2;
 Thu, 27 Jul 2023 23:40:26 +0200 (CEST)
Received: from FR0P281CA0220.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:ac::15)
 by VI1PR08MB10146.eurprd08.prod.outlook.com (2603:10a6:800:1cf::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.29; Thu, 27 Jul
 2023 21:40:14 +0000
Received: from VI1EUR03FT022.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:d10:ac:cafe::1) by FR0P281CA0220.outlook.office365.com
 (2603:10a6:d10:ac::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.5 via Frontend
 Transport; Thu, 27 Jul 2023 21:40:14 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VI1EUR03FT022.mail.protection.outlook.com (100.127.144.146) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6631.29 via Frontend Transport; Thu, 27 Jul 2023 21:40:13 +0000
Received: ("Tessian outbound 95df046a2e2c:v145");
 Thu, 27 Jul 2023 21:40:12 +0000
Received: from 4cdbf829b447.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 E7963863-C1F8-42C0-895F-446B5CEBC010.1; 
 Thu, 27 Jul 2023 21:40:05 +0000
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 4cdbf829b447.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 27 Jul 2023 21:40:05 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com (2603:10a6:20b:8f::22)
 by AS4PR08MB8117.eurprd08.prod.outlook.com (2603:10a6:20b:589::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.29; Thu, 27 Jul
 2023 21:40:03 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::4c7d:6a1:e742:3b1a]) by AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::4c7d:6a1:e742:3b1a%4]) with mapi id 15.20.6631.026; Thu, 27 Jul 2023
 21:40:03 +0000
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
X-Inumbo-ID: 32343567-2cc6-11ee-b24a-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xvcdRNJKFcgA7Gw3ycCy8A24id4pk5gEOPgrY70Uw3Q=;
 b=82jWLUPf1FfIgb2PkaCMEVBVX5eZlE9/aKV4dpXZKvnC97CaVclRQ1TO3Mso5gnh6ca3t/C1nGjv2N7TaTu5hug//nAwutGI4inl5CCTWDWYTc64KuhI/cW2AbgyLshdC83+KCqDPo7F8jnoa1Hdy9wqAvvT5C7BxttMNYeuIvE=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 0499229aeb0a088d
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iw4J7plKTO726qlcIuOBWUYqprqJ6eDXiFwUYjkLuUKXxPdS94HVs1DgIp8dLL2GChTFzgALSSmkb/Ex44s+3Y+mQR4FNU8CA3r4+LeO2Sr0YYF7EwL7id+VnzHaVQASu28V6T2PmtR4I5gxSz2WwfXm5tB04JYfKwfNqNDsFySxanRi7J1EsKb40zeNNvyzHpgzceIX4Oh9lt7AFK7QrWJXq+ajTjMWxNssRjg4PduqtXyTvmLHthdb0oqMMH3RNt8JJHkvIcm6rtyTtxg8lHTz9cxdJp3qvzsWZTdnHRpGZK7D3iWn7ebD6U875btLeRbkUkO3ebxNGY5PANH1kA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xvcdRNJKFcgA7Gw3ycCy8A24id4pk5gEOPgrY70Uw3Q=;
 b=QMPPNsLIuSyzE8aoha+63PUi6ZTxJ0lFjlzMDlsPz276QuydCmszc8lVR+Zgw1FYoL2EadVjZiFEzDwJzUS+Vmw8SmWO+PT/ZEqSaCDfte7ycaenWPCKcHq/RS6lIOGejlxDcmh3Tsg077lI1sAft4qACUGfTvDoziM4V+V9yUxGfHyaAL4A9G5cwiE6ozeBJlQWfTyG+dsvlYt1bkkZvfcnDLKfuBqtXfYd/8M8Zz7npS3bqkCPYVj00XKRoQmXMYMUPTVVSTyNuwO7zPkhN/V9d/8hGdvfEEyxS/DJYoUmmj0tzPWhMf0pdJuLQYfA6zGUXVR45iolC4G0W6P6GQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xvcdRNJKFcgA7Gw3ycCy8A24id4pk5gEOPgrY70Uw3Q=;
 b=82jWLUPf1FfIgb2PkaCMEVBVX5eZlE9/aKV4dpXZKvnC97CaVclRQ1TO3Mso5gnh6ca3t/C1nGjv2N7TaTu5hug//nAwutGI4inl5CCTWDWYTc64KuhI/cW2AbgyLshdC83+KCqDPo7F8jnoa1Hdy9wqAvvT5C7BxttMNYeuIvE=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Federico Serafini <federico.serafini@bugseng.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, "consulting@bugseng.com"
	<consulting@bugseng.com>, Tamas K Lengyel <tamas@tklengyel.com>, Alexandru
 Isaila <aisaila@bitdefender.com>, Petre Pircalabu
	<ppircalabu@bitdefender.com>
Subject: Re: [XEN PATCH] xen: change parameter name in monitor_domctl()
 declaration
Thread-Topic: [XEN PATCH] xen: change parameter name in monitor_domctl()
 declaration
Thread-Index: AQHZwKAdkZBLFcaVa0mNCdGLOUG1rK/OJH6A
Date: Thu, 27 Jul 2023 21:40:02 +0000
Message-ID: <B7758406-B190-46E4-9416-F14E7B4C7986@arm.com>
References:
 <6a25e9d729e85ba5712fd00f9c0514a459bb7631.1690471420.git.federico.serafini@bugseng.com>
In-Reply-To:
 <6a25e9d729e85ba5712fd00f9c0514a459bb7631.1690471420.git.federico.serafini@bugseng.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.600.7)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3749:EE_|AS4PR08MB8117:EE_|VI1EUR03FT022:EE_|VI1PR08MB10146:EE_
X-MS-Office365-Filtering-Correlation-Id: 72b81df2-a04e-4a99-f70d-08db8eea0f52
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 LOpE6aRctB09s6R4f28FnqP9D80u4zKmI61GAv7XIhkGKJoS5pZ6QDL5qvMdsKN5QH4t2OIrfFBkL/6qIgXtAagDsfpeZyOcrytHm/XRIHWIZVOF59WDCGTf3OjGyYcECvVoEQIJFTDul5h8bnoEK5okicwOYuyg1KaktkwxYrgXzQJIgDB4hG3UL+LNBa7hFP/S+jB5EEBRP/mUS9A/0jeP9nsFdI6pI9HFdOkKKxJqGvKYlWUsmG5VS7WG6xjrWJ5PMkkGA0hv04my8YiOG2ty5bBje6HwuKCEE9L3qdSNG8EwaRIXRK+/dpdUFDaQ39qLG5sVaTLI+R2z9QyhPOhJS1GXBTodJE9QtCtGEVuhPoBEy47mu1ugrMun+gVDb7x21WIHXIwDM04pXp2YcUmQlIgADqUIi1DRFG0FKjTCMuWmQrRvHPryougmOADXnP2Ed5APt/A5S+HeqtbPQ5P5hpPIOWStPpJc8IZAkhGkL2EwRl0wX59f6AUeHANvggSnzU81Mv51+El1CjwXkNaHpEgV0kXOlPC/YpQrHiCBhcuxHHiRdhR6Ou0VCkkZQZQpt5sPrSGrzfu7eEihBpSoUSEBTHitHDSMUHiI4Strq2UdCnEoh1ilWIKtXMq8uoUAmJaPKiMTbS2IPZ0Lhg==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3749.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(366004)(136003)(346002)(376002)(39860400002)(451199021)(86362001)(33656002)(122000001)(36756003)(38070700005)(4744005)(54906003)(2906002)(478600001)(38100700002)(66556008)(2616005)(26005)(186003)(53546011)(71200400001)(6506007)(66946007)(4326008)(5660300002)(6486002)(6512007)(76116006)(91956017)(66476007)(66446008)(41300700001)(8676002)(64756008)(6916009)(8936002)(316002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <0899EF4CF063EC4286304A0CB3044E42@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR08MB8117
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VI1EUR03FT022.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	737b854b-d4fd-41f2-c5bb-08db8eea0924
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	IZlr2E4Mq6pednZqVvnEViOj4699GTqvWwEqOzd84830QAT5rxNNYqSXdPI/aDw33/nDLVw3yiEBxrQwCYhe/ACTJqvINEsohfo4zK6Qy3tRJU94QyCP2hKc19Bg8mZsoUTRA8V8jocVCYhB18A/HA+U/ETP8j+MWTrsfHIVHfo+lcuAi4KfoCVO1ip5z6U1luqOdS7FOyM9SGkzMK1SGd0oo10RkcCkX/o+8TVaIvKKhafJz4SvcIuh/PiAx5gm11vBO7VOw5s67z00HkqQtez325CXpZ83beWMJD6kzAD1J3C3QuMPehO1d34uAkRG+ZPRUDDvbvJkSSbLO5mYhp/XiJfR73dccpK7iWPMQWiCGvUZSfOAdw9415mYq2OM3cIlcS6n8nG8R3fRgyJvJMVntXYCgPa0+bdfUQUZzNkHGPv8zVjN8J6HS/swX+0xsmFaCjcv91N8ESLDvPMRj1CvWeMJ4MtGvrKe/kB0T2M4AEMxPrgfm9xM/XoaS8jSVwxCI4nltVzYi9kQRhKpFOakI37pRGZ0Rqz/D9I1AbhvTfLVpmIEbNUJJWOyzogUoF+yE4HO05oNgIY9ardo9jq0icmX8ZsSLssuL2LrOXNted+BI089t68Uehi/ovbRVUG+yxuAsWCatBt8gHoq8eX9fKFHF4uIpRiZbs6b1rvRwlFzt/PEsbJ0TeP3E9425NDPSxYao2BCgybBLQ4sL15f4chCf0gom6fvo0x0UUazPjz/1ePydBf92O4oAQ0g
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(396003)(376002)(39860400002)(136003)(346002)(451199021)(82310400008)(40470700004)(46966006)(36840700001)(107886003)(40460700003)(26005)(336012)(186003)(47076005)(8936002)(53546011)(6506007)(2616005)(70206006)(4326008)(316002)(8676002)(5660300002)(6512007)(6486002)(6862004)(36860700001)(41300700001)(70586007)(40480700001)(4744005)(478600001)(2906002)(54906003)(36756003)(33656002)(81166007)(86362001)(82740400003)(356005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2023 21:40:13.2394
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 72b81df2-a04e-4a99-f70d-08db8eea0f52
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VI1EUR03FT022.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB10146



> On 27 Jul 2023, at 16:35, Federico Serafini <federico.serafini@bugseng.co=
m> wrote:
>=20
> Change parameter name in monitor_domctl() declaration for
> consistency with the corresponding definition.
> This addresses a violation of MISRA C:2012 Rule 8.3: "All declarations
> of an object or function shall use the same names and type qualifiers".
>=20
> No functional changes.
>=20
> Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>

Reviewed-by: Luca Fancellu <luca.fancellu@arm.com>


