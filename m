Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A4137430C3
	for <lists+xen-devel@lfdr.de>; Fri, 30 Jun 2023 00:53:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.557193.870331 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qF0Vz-0008CP-0w; Thu, 29 Jun 2023 22:53:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 557193.870331; Thu, 29 Jun 2023 22:53:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qF0Vy-00089r-Ta; Thu, 29 Jun 2023 22:53:26 +0000
Received: by outflank-mailman (input) for mailman id 557193;
 Thu, 29 Jun 2023 22:53:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8DWp=CR=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1qF0Vx-000895-CE
 for xen-devel@lists.xenproject.org; Thu, 29 Jun 2023 22:53:25 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03on20621.outbound.protection.outlook.com
 [2a01:111:f400:7eaf::621])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bfd95404-16cf-11ee-8611-37d641c3527e;
 Fri, 30 Jun 2023 00:53:23 +0200 (CEST)
Received: from AS9PR0301CA0013.eurprd03.prod.outlook.com
 (2603:10a6:20b:468::13) by AS2PR08MB8480.eurprd08.prod.outlook.com
 (2603:10a6:20b:55e::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.26; Thu, 29 Jun
 2023 22:53:21 +0000
Received: from AM7EUR03FT005.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:468:cafe::b6) by AS9PR0301CA0013.outlook.office365.com
 (2603:10a6:20b:468::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6544.22 via Frontend
 Transport; Thu, 29 Jun 2023 22:53:21 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT005.mail.protection.outlook.com (100.127.140.218) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6544.22 via Frontend Transport; Thu, 29 Jun 2023 22:53:20 +0000
Received: ("Tessian outbound e2424c13b707:v142");
 Thu, 29 Jun 2023 22:53:20 +0000
Received: from a17138b072e6.3
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 E728C368-C792-44E4-A33D-4107F83D8EC1.1; 
 Thu, 29 Jun 2023 22:53:10 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id a17138b072e6.3
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 29 Jun 2023 22:53:10 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by PAVPR08MB9040.eurprd08.prod.outlook.com (2603:10a6:102:32d::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6544.19; Thu, 29 Jun
 2023 22:53:08 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::1024:cf14:d520:9b38]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::1024:cf14:d520:9b38%7]) with mapi id 15.20.6521.026; Thu, 29 Jun 2023
 22:53:08 +0000
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
X-Inumbo-ID: bfd95404-16cf-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W3O+NPQINfcoHPCY4lAUdpzRJ3KYjwBFVc+9nzp4TtE=;
 b=YGoVrQtkKEp2jdL9DPHhgE/vYtzx4N1Yjgqanw+1X/D5vfGYRhJxJLqeaGrZUx7faqfoqfccin7OCgWuqMHJbqWggT4ULeixAFK3mGbXlnXtXZDwRIxcYLQwbbt0p5JUa9Kaa0w20z4GObw/ySxQgflhF/WMkGUlqrtmiLFqBwA=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TdbK5AAzwRlDO/Zgg0R57IaRTeu7B2LhGk2Wyri3sUk/iYoB7Pc1JNVBIuo0eFUy6CXiAB7gWU0nYYSHZf5zVOFUJHucgK2ZKtXCAlAQNTvU3TWQWt/WpP8+kgeJXIxCbKozbGgpMkCHQKE68/vla2HHfefaAUglQ8r/2sQfAjhlwOm67XAVmauHQxqS3d9PXIh9KOkpxPXRk3fTFnEjd2jOBOpLuthhc1OJ2GbmhCBJragtb1K/52kEgU9VipQ1ZBQiyHEiJ6KwDjnAHk/+G4XMdpMLru15vLsmKCNLXH1uby+emR+xfZXL4ZebzDvXD5VBP30yJz84r9YMWHXnnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W3O+NPQINfcoHPCY4lAUdpzRJ3KYjwBFVc+9nzp4TtE=;
 b=C3kZ5XHWJG6x+GYXwMgSBG4qpV/jtbBSTINuLJRPBsKdxlOq03mUKqNaIgah2aUUh1LrLS00/RPvjdlHTtoViiC0I6dUogwQUUt9LKTM50p1ChLzEuiB4exvST3kB3+b3koFlJh30T7UXAo69cwj2s7nXI3C0CpThEPh/0rctp26VVj7Azy9VXvNlpY2LSiooPHQXB7l8nTDqu6TChHj4KBSQC0+D5GNpC6JPctNeL87Co+VicMXN2gcV59nkU1tTBjSk/gt3hLcxt9TJgbnF16CzM3o/YGYr4CszrOUU4yVTboqCVYNUQAsKw1epRu/E43EmtGrwmVKTQuPZJXXWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W3O+NPQINfcoHPCY4lAUdpzRJ3KYjwBFVc+9nzp4TtE=;
 b=YGoVrQtkKEp2jdL9DPHhgE/vYtzx4N1Yjgqanw+1X/D5vfGYRhJxJLqeaGrZUx7faqfoqfccin7OCgWuqMHJbqWggT4ULeixAFK3mGbXlnXtXZDwRIxcYLQwbbt0p5JUa9Kaa0w20z4GObw/ySxQgflhF/WMkGUlqrtmiLFqBwA=
From: Henry Wang <Henry.Wang@arm.com>
To: Julien Grall <julien@xen.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Luca Fancellu <Luca.Fancellu@arm.com>, "michal.orzel@amd.com"
	<michal.orzel@amd.com>, Julien Grall <jgrall@amazon.com>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, "sstabellini@kernel.org" <sstabellini@kernel.org>
Subject: RE: [v2 4/4] xen/arm: Allow the user to build Xen with UBSAN
Thread-Topic: [v2 4/4] xen/arm: Allow the user to build Xen with UBSAN
Thread-Index: AQHZqsXtbIsbuBfDF0O4wfm2JvsKDK+iYyoQ
Date: Thu, 29 Jun 2023 22:53:08 +0000
Message-ID:
 <AS8PR08MB7991EDCE48422D802DC085569225A@AS8PR08MB7991.eurprd08.prod.outlook.com>
References: <20230629201129.12934-1-julien@xen.org>
 <20230629201129.12934-5-julien@xen.org>
In-Reply-To: <20230629201129.12934-5-julien@xen.org>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 26DDA1731E4ADB49B9567C218C098B69.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7991:EE_|PAVPR08MB9040:EE_|AM7EUR03FT005:EE_|AS2PR08MB8480:EE_
X-MS-Office365-Filtering-Correlation-Id: 7d0419dd-31b1-4fd3-9fde-08db78f3a2e4
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 Bu+MQCdKHNsbmn6oqQjAqZOGagzfeoDNirmg27avWV60/pt1GUJ+Y+mXOsawjiHqK/vTRey6jcqKUGhcLL5RPL85h2cfsFBHAM0kJ+CMMvtX2E/0XCs6xu+75tJI1mI9ogmDAsXB3lNJWBhINBJVDRtQ2OhDHOqYSmt3LqYbTdQ8vCA4JdX2sDhdkSIJ/yXxi9fzg1eprTzBO8H6YdXhwMZ/6lvAw9q/4QiTXD//oofFrxla1XrF8E76+uTkr+hR6V522HfqNIn0ueQRTQ7e7/2B0The9BDjyuGa94pCW/RZUWg8RbQhBMoRpaW6mRYNf+uJjY5L81Ss57dwsXdjpiHYF23AbQYy+rmJAApBtDVwRabSNlrT09g4C14Ja2d1xDH22C5WkEBl2d2OLMdQ9S7X+zgNQlVQgiFo+wW7JHlzpPeHINB5D88G5JOEeso6lw1bc2y3ZVg8YbPnn/cqQ6/cYb14DpmfD+oaZgvNn6rE6Tf++il6DfGidgOGG+CjWvX7NZwiLUTU8OKododcR4Fg497QIM9oOTNWUdtLt+CQK1++y1k10HPOf7Qgh4rAzs+cZmVHbxTAHp4xtrXH95HFfLPMHqCLhoeDvS067aMSXYUWcRxm0cv2M4wwESQ7
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(39860400002)(376002)(366004)(346002)(136003)(451199021)(26005)(186003)(71200400001)(2906002)(4744005)(86362001)(7696005)(55016003)(38070700005)(4326008)(8676002)(8936002)(110136005)(54906003)(316002)(478600001)(122000001)(6506007)(9686003)(38100700002)(5660300002)(33656002)(83380400001)(52536014)(66476007)(66946007)(66556008)(76116006)(64756008)(66446008)(41300700001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR08MB9040
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT005.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	7206b51e-2bca-4b63-670a-08db78f39b58
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	rxyuLWXHVSNIIJrT0kQiUw+97nRjU2OV8pKE7nz5S/jSEMYuIKkJVfAk+1Wfv0+JjJcVIe/hrFD0jyEN44m4z6ESBZHH0R36ToC+BHjnvJ0UCFfNIQMICsbE9jpjHPNRCwU/ahYAPkOydErbqAij/Qo2uT0T3bjGeZ9dkyX9JWXOmmbfuePqc5tOYU1YIe2J0cTSejAPC/HCSC9Yq7IA38pCeAENe9FXoN51F2vL6CeyCK5iEd1G58pTaj8/SvCQVO2HbDNGrGkX4M588YnedBWXN7Hp6S/jc5BwRXWvJnQXbyLHdb3LRb7zXb9jy001OHMG4xl6A9778Xja1sqPCss7E1lu0hunZ3PHWieIqmuZ/QmcrjEL4LS75oWDFnd4z55+A6iwy+ltHsmnxkOOteIFhew35MrttawSjp/UyhROsuWsUQjpGvK2ahn+EM/25lXNdTFhL73KNTv38smWGRROL8Io6GSorqgkNXDMmj5MhEeTMfqJR0JjpKO76xq06eougEVX6evq722/ioeiFQ8RrXsKWtfehqXJ8ZJJIZVF5D0vOG+dSyAT2Smvmi42dJv5GlVs4f1yLgHNxdKL9nQUhWVAzQAqRoZTHtoYJGiHsXJ8QseVA2attCItyTMifYM1OlJNeor+t57EMq4n3N0Mix5Ni0b9+nMv3wi4AT/yN9J3je5imcpGyV/5qy20k9KSQJ6ulY2RRxuXI2Py8c/+LMYVDmBl44im3ZNHunOckX18/c4njyJi7pl6nPY5
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(376002)(136003)(346002)(396003)(39860400002)(451199021)(36840700001)(46966006)(40470700004)(40460700003)(2906002)(186003)(55016003)(7696005)(40480700001)(82310400005)(86362001)(107886003)(9686003)(82740400003)(81166007)(83380400001)(26005)(336012)(6506007)(47076005)(356005)(4744005)(36860700001)(110136005)(41300700001)(54906003)(478600001)(70206006)(316002)(4326008)(33656002)(70586007)(52536014)(5660300002)(8676002)(8936002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jun 2023 22:53:20.7710
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d0419dd-31b1-4fd3-9fde-08db78f3a2e4
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT005.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB8480

Hi Julien,

> -----Original Message-----
> Subject: [v2 4/4] xen/arm: Allow the user to build Xen with UBSAN
>=20
> From: Julien Grall <jgrall@amazon.com>
>=20
> UBSAN has been enabled a few years ago on x86 but was never
> enabled on Arm because the final binary is bigger than 2MB (
> the maximum we can currently handled).
>=20
> With the recent rework, it is now possible to grow Xen over 2MB.
> So there is no more roadblock to enable Xen other than increasing
> the reserved area.
>=20
> On my setup, for arm32, the final binaray was very close to 4MB.
> Furthermore, one may want to enable UBSAN and GCOV which would put
> the binary well-over 4MB (both features require for some space).
> Therefore, increase the size to 8MB which should us some margin.
>=20
> Signed-off-by: Julien Grall <jgrall@amazon.com>

Reviewed-by: Henry Wang <Henry.Wang@arm.com>

Kind regards,
Henry

