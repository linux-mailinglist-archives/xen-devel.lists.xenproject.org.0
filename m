Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0677276EB06
	for <lists+xen-devel@lfdr.de>; Thu,  3 Aug 2023 15:45:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.576389.902465 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRYdC-0006Yi-Ng; Thu, 03 Aug 2023 13:44:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 576389.902465; Thu, 03 Aug 2023 13:44:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRYdC-0006Wb-Jb; Thu, 03 Aug 2023 13:44:46 +0000
Received: by outflank-mailman (input) for mailman id 576389;
 Thu, 03 Aug 2023 13:44:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3G/A=DU=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1qRYdA-0006WV-Nv
 for xen-devel@lists.xenproject.org; Thu, 03 Aug 2023 13:44:44 +0000
Received: from EUR02-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur02on20620.outbound.protection.outlook.com
 [2a01:111:f400:fe16::620])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e5d62ad1-3203-11ee-8613-37d641c3527e;
 Thu, 03 Aug 2023 15:44:42 +0200 (CEST)
Received: from DUZPR01CA0013.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:3c3::6) by AM8PR08MB5633.eurprd08.prod.outlook.com
 (2603:10a6:20b:1d3::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.20; Thu, 3 Aug
 2023 13:44:39 +0000
Received: from DBAEUR03FT051.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:3c3:cafe::c6) by DUZPR01CA0013.outlook.office365.com
 (2603:10a6:10:3c3::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.43 via Frontend
 Transport; Thu, 3 Aug 2023 13:44:39 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT051.mail.protection.outlook.com (100.127.142.148) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6631.47 via Frontend Transport; Thu, 3 Aug 2023 13:44:39 +0000
Received: ("Tessian outbound 95df046a2e2c:v145");
 Thu, 03 Aug 2023 13:44:39 +0000
Received: from a455a34f525b.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 BB97611D-1219-4BE0-8D5D-AE92427DD36C.1; 
 Thu, 03 Aug 2023 13:44:32 +0000
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id a455a34f525b.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 03 Aug 2023 13:44:32 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com (2603:10a6:20b:8f::22)
 by DBBPR08MB6106.eurprd08.prod.outlook.com (2603:10a6:10:202::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.47; Thu, 3 Aug
 2023 13:44:30 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::4c7d:6a1:e742:3b1a]) by AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::4c7d:6a1:e742:3b1a%4]) with mapi id 15.20.6631.046; Thu, 3 Aug 2023
 13:44:30 +0000
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
X-Inumbo-ID: e5d62ad1-3203-11ee-8613-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G+8rGRNjKxGdiV+gyhWlFDoq2gCSj/NyKItPF4XCZDg=;
 b=dc5CZox9LbKxWGE7dVBUmR43WFAkA/9B9bR0wwgL2MOwVKU/NYL367XQNZoah2cFBWNLqz0RfHdhIBQ6XxLzdg6Aed3xCX6/Zz7bbCjdIkmRJQApyj54P121R5Cst1W3oqa+Yw+cLPZc2f6C6UX/CMuVopKIVEDnka6zTHfeOkA=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 7c9fdae8b09ee7ae
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=keFHdqTiE04cY9q2DgTLNf2s+vjIW/vfUuNNkvl97FAD/iO+GZHGDun/Mj1TYuLwNofQQpYpAd5rbyPb17D0Q2ZgRAUhhSuyaxYEk8UWuSwmNVRWEAxjcmyMcs1Dt3TS4MHPW9BkOLZHXJtqOxKnomppHEqZY+DapRm0cXasg6qnWcXzx5InGJpWuoJbu/nw8j6xiLOEBW9KPmAekZX9bBM/H3iMREvmCfhJmLbrZR2Nxvh0ZMySnx6VKPH89H2cSyHqNzya/JE9gqhE0+U6vUKz77O4qW+5nxX7CXywCYh2dexRIaJmakwUHHn93K6nAlAu95izHqb00CZl2WisGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G+8rGRNjKxGdiV+gyhWlFDoq2gCSj/NyKItPF4XCZDg=;
 b=Tuypze9y+LAGJ3VXvdrZKbTM0uW6dC3gmn4DeVN3iFCsepcBzFGfU4fOph7xy/SbGaEVEmPztx6/WDmhjj6Td2yet15c2A72+3br7EdvFiSRjrObDj5VO0IzkTth8FXWMJYn9sgvBjHfdC0LQdcrVDCSaHcxK5YJx8uylUGeiWpYiRE4RgMQHhIdGufQKy0d3Ac7I9b3gnSWhDW7M1RasevaMYowZ+ekXDskyp44dcIk1EOGlEmeVS1PbYYGcTRFEqoXM+Dx5drJgq80Fl27jo8/DY/JZwbA8AV2vEmWks35vPlKrjooeJ0d4jj8v68nEr1BxONPZZ4zpLA1TRMUiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G+8rGRNjKxGdiV+gyhWlFDoq2gCSj/NyKItPF4XCZDg=;
 b=dc5CZox9LbKxWGE7dVBUmR43WFAkA/9B9bR0wwgL2MOwVKU/NYL367XQNZoah2cFBWNLqz0RfHdhIBQ6XxLzdg6Aed3xCX6/Zz7bbCjdIkmRJQApyj54P121R5Cst1W3oqa+Yw+cLPZc2f6C6UX/CMuVopKIVEDnka6zTHfeOkA=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Simone Ballarin <simone.ballarin@bugseng.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, "consulting@bugseng.com"
	<consulting@bugseng.com>, Gianluca Luparini <gianluca.luparini@bugseng.com>,
	Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
	Bertrand Marquis <Bertrand.Marquis@arm.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
Subject: Re: [XEN PATCH 03/13] xen/arm: address violations of MISRA C:2012
 Rule 7.3
Thread-Topic: [XEN PATCH 03/13] xen/arm: address violations of MISRA C:2012
 Rule 7.3
Thread-Index: AQHZxfSdOEvKJttXMkm/J+fEFT8536/YlUqA
Date: Thu, 3 Aug 2023 13:44:30 +0000
Message-ID: <3B413D0B-A2A8-40FD-A301-D0524B539827@arm.com>
References: <cover.1691053438.git.simone.ballarin@bugseng.com>
 <c39836607097b09119a4f4480c77506295333a55.1691053438.git.simone.ballarin@bugseng.com>
In-Reply-To:
 <c39836607097b09119a4f4480c77506295333a55.1691053438.git.simone.ballarin@bugseng.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.700.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3749:EE_|DBBPR08MB6106:EE_|DBAEUR03FT051:EE_|AM8PR08MB5633:EE_
X-MS-Office365-Filtering-Correlation-Id: 2ecf84e7-c742-4afe-5d37-08db9427c896
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 3pwB/scOQK2wHfAJqst7TNdifhVc6AS//oku9IyCs45CzZhwgfbrQ5ciXU7eBg6CcSdpUbO/O4UNlYkqxkHejwFACxI2M3RpFNKctIm10L6xxGnAG6E1pUq9BQpy45nnUi+9PSA9AqCYaZ8NKNIor1WY5w96H91oep+dTxfJCvxyfo8Gs7V3PFMbSQFAKvgVIp700M0ibPdaJLuLO3g3hnx19P02c9xhbg1NaeW5lrw83QS5JsE2nQy6ckUZZpw5+DQiT6UmCFrVWYKo54zMZbqzTGkB1umEyO3MPC1ThpHKvX2yzgYD52hXsO7TVrNNqccLC4/OUECZBB6BRBu+gPmzNCf79WQ0kNT+97cFIJ13mvOCv+xXKIBX2Go/eJRrrrNiET3aN4ms1JcB5QxpwVZ9l4Dz3uqKq/oySUdQCe1TpWWL8501qBIxVPz1/B44qwkauQpCy6gCM+9vejomIFdJCQ1EfXPv41MkAz6n+Tj4OAkjeGnO6KkDWA7kcptsoFQyO7BWahHHB4VZItpZ208I4bvqktlIOKHTJkCXWcbbR2/LFfHsg8dGySm7NuKyqo54l7fK4NHJQCVUlrcz7EAP4zYAzxOTx6Dgbw/1FmNH3dNHR88gCeAEAQ990s1ASZ00Suh5oXfLEqz/HGHbag==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3749.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(376002)(346002)(136003)(366004)(39860400002)(451199021)(4744005)(41300700001)(66556008)(66446008)(316002)(2906002)(91956017)(4326008)(76116006)(6916009)(64756008)(66946007)(66476007)(8936002)(8676002)(5660300002)(122000001)(38100700002)(33656002)(26005)(36756003)(53546011)(186003)(38070700005)(6506007)(86362001)(2616005)(6512007)(478600001)(54906003)(71200400001)(6486002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <D90AC83B6E391C40B1A6892044207A4C@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB6106
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT051.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	4cb018a0-9b6d-4528-03ec-08db9427c342
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	vZiv4E9sV0ZqhzXLT73+vKoKaXb+W0BWf+5zTR0S4051Mt90Xm206wo6bxRvfp0BF0dEVduK7/mO9cjERkYAzGxNCaXRXf9rIgEX2uIZIla78tN6vMsO7+wJtOvspZj3gULe+sQ6nGnIsMCCp2hKGTcgEMnmIhFRlIQDd+XVzpFKam8vnYlhMhbxlbdNTIkvMVSIjB4juMIwIHAIQsTI7SiUdj6BbT+CyN0HjGNQm7EuOn1ZBlMWPJ5AaT96mBFUos1seX5m4T5bZeOVkjMecKv712+Ox46b61utCATWoE9+u5Tjr2txO/7H5DwZKwhEm9N8NQcZpuhwjxhCH0AsCI9eE4TKwRID5A+9pDHNVyOH6aaY13iHZsmFOZz9SN77FKcw51b+Sn2syhNH3LHMtV/f7DS/QA0JF1H7pw6pMQmgwric21le6+RzFRzGs2Kqmc4guaGJ65qtAqFeyo9Tp+a/u6V9QWIQbKOjU4W5CymjfLIrdrzw0PqPCjTP6OZBSeaOajp07c4mNZxlu/Iu3GSRz8WDsNg7IbUqQ+cbZAFhtrU5ni4pNlyAG2uIiMJyuz58pAcbVrgtiao2m72ZyO6/vGNJ/JADTgvsgrI8pTpyA923HDlGdNp573GP09PN8PMglyZOfBBA5MIsmuQtk8RVm/aMx4/AJImhEXsAN4Iz5kNUhtcn6YTNCXr6cpxoZXM6vvlVakUasvVBrhDfr24J24POh3zDb4rDopzYVNI=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(396003)(346002)(39860400002)(136003)(376002)(451199021)(82310400008)(46966006)(36840700001)(40470700004)(86362001)(36756003)(33656002)(82740400003)(40460700003)(40480700001)(54906003)(478600001)(356005)(81166007)(47076005)(2616005)(6506007)(336012)(186003)(26005)(107886003)(53546011)(8676002)(8936002)(6862004)(41300700001)(6512007)(6486002)(316002)(36860700001)(4744005)(5660300002)(4326008)(70586007)(2906002)(70206006);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Aug 2023 13:44:39.2990
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ecf84e7-c742-4afe-5d37-08db9427c896
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT051.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB5633



> On 3 Aug 2023, at 11:22, Simone Ballarin <simone.ballarin@bugseng.com> wr=
ote:
>=20
> From: Gianluca Luparini <gianluca.luparini@bugseng.com>
>=20
> The xen sources contain violations of MISRA C:2012 Rule 7.3 whose headlin=
e
> states:
> "The lowercase character 'l' shall not be used in a literal suffix".
>=20
> Use the "L" suffix instead of the "l" suffix, to avoid potential ambiguit=
y.
> If the "u" suffix is used near "L", use the "U" suffix instead, for consi=
stency.
>=20
> The changes in this patch are mechanical.
>=20
> Signed-off-by: Gianluca Luparini <gianluca.luparini@bugseng.com>
> Signed-off-by: Simone Ballarin <simone.ballarin@bugseng.com>
> ---

Reviewed-by: Luca Fancellu <luca.fancellu@arm.com>




