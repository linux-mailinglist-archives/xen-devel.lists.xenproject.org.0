Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BDC5D58C0C4
	for <lists+xen-devel@lfdr.de>; Mon,  8 Aug 2022 03:54:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.382211.617110 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oKrxh-0000UA-Gb; Mon, 08 Aug 2022 01:53:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 382211.617110; Mon, 08 Aug 2022 01:53:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oKrxh-0000RF-CZ; Mon, 08 Aug 2022 01:53:45 +0000
Received: by outflank-mailman (input) for mailman id 382211;
 Mon, 08 Aug 2022 01:53:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2Fnh=YM=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1oKrxf-0000R9-S4
 for xen-devel@lists.xenproject.org; Mon, 08 Aug 2022 01:53:43 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2058.outbound.protection.outlook.com [40.107.22.58])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ec9028d1-16bc-11ed-924f-1f966e50362f;
 Mon, 08 Aug 2022 03:53:41 +0200 (CEST)
Received: from DB8P191CA0029.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:130::39)
 by AM9PR08MB6146.eurprd08.prod.outlook.com (2603:10a6:20b:2db::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.14; Mon, 8 Aug
 2022 01:53:37 +0000
Received: from DBAEUR03FT053.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:130:cafe::71) by DB8P191CA0029.outlook.office365.com
 (2603:10a6:10:130::39) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.14 via Frontend
 Transport; Mon, 8 Aug 2022 01:53:37 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT053.mail.protection.outlook.com (100.127.142.121) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5504.16 via Frontend Transport; Mon, 8 Aug 2022 01:53:36 +0000
Received: ("Tessian outbound 6a3290ff1310:v123");
 Mon, 08 Aug 2022 01:53:36 +0000
Received: from 03f2373c7608.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 759DF1AA-BBB1-4185-AA9E-69BF80CFFD62.1; 
 Mon, 08 Aug 2022 01:53:25 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 03f2373c7608.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 08 Aug 2022 01:53:25 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by DB6PR0801MB1927.eurprd08.prod.outlook.com (2603:10a6:4:75::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.17; Mon, 8 Aug
 2022 01:53:24 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::240a:5b52:7540:5772]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::240a:5b52:7540:5772%3]) with mapi id 15.20.5482.016; Mon, 8 Aug 2022
 01:53:24 +0000
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
X-Inumbo-ID: ec9028d1-16bc-11ed-924f-1f966e50362f
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=DdqxW/bkUgqhvXqvJ8RpM/KzCp3XcJBzadYcoE3j8yJGtwC9yJRN6GJHmuP1N6T681bdTPowNawWdzGLwcia8pcE4hdgTMPsOW5sAmm20jkSXt4wmqFObybrz38+hbvmzjU+tR7WhsYaO2jkssudh4g0a/0slOSOpF1RYaYtqBKDtgMmLFjh5e7PPbX9d0ncRRJ3MiOT1SMFTFWR6eOTI10MvvsoQ+C2VKlv6CBDKh+BSW8BckgkfBqRGej3F+UWIYN9l3xlF2Ei0ayyvz8PfoozeK41e13LkMzh86n8Sj7yUY9gmZ5nzkQNimvkfHqlMcy6LOSdyKmNfkMMcKnJ3Q==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zKO5yEeo8TSbe4p+8dQUr8m9UvRJFhxAYHYGPlJp9Bk=;
 b=WuBOg7urUvpNXoQZtM2cCsxCAQj2Rrevv0DtXrV+6/Kfof8M6BNvXYGLrW7I4Joewv32jIRMGbIkSC47d1NJ2PzksyNuOHate/yI0p7y/coxfmQ50hxeDT/0590wMFZbxmvoSOGLDC9saI2sNNbOAdqqHmY2i4Wq8QfH8XUUhsKSr/RHVrC6ia/jNUb5h4m57s3BRcnJPwSfWk+dTdMSVT+/Md5Bizu5gJVv8uydmZvv9Ge65WqF3r8jJtuidtj6jkypfn0zdZ1f+JddFss5s7wygoUfesS05snrZSNwI46Mx1aG8OQrhBYqlyDfMsjOb/p1dWekAbbrYRtkw0ZpvA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zKO5yEeo8TSbe4p+8dQUr8m9UvRJFhxAYHYGPlJp9Bk=;
 b=C9vF8rlDZ82czCUlt7nphm6QdlZ9Ak1gVta+M4vmYcV596idpw6ISnx66i7Fvv/EATvvt6ZBxQOCnxeTMmUBf4CBrt4TbSP3hH70//6tztHreCwRc5Uwr4Wu3ML4Ywug/+YPFxRc/0cqNcx2NmHoKhYZ+Wp5aauk2HPCG9Mtk7A=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cSg1et7x7afawepOnaA/zWJ3yFRVZRcCFiy+TGRl1Wmdr0rhT8aCE7xWZVc0xIY46ZgDAwnYhQB0wg8PVRpjmClao4bfJLdN6vlRCp/KO4PQaTxDib0Rklgv7f0fX7NAUQYNN2PHmh+VjhofEXuq+FYoH+pahkJLiCFnRZ1B2TVLnv40umwl7zNpxuBJr13XBFbB5aP64Dz+sXm4gMPY/QksBxDcIVSFmjEI/ow2CYnnD8S+tz5mcFerVsTRm6yyR2tv0PnDKn1s/yHGQkVfeZ3PNijVGawDpj0G0BSMQ8OxsrVXV8kgyeZVAMTe03RGC9CFs9jDLsk9teflv2ljJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zKO5yEeo8TSbe4p+8dQUr8m9UvRJFhxAYHYGPlJp9Bk=;
 b=l02m99bWCPRZbpSf3ZAP1xuNY1cMAV0Q8Lj7ouEdaFON079Qo71Lm/VL5btGkil6L6+ZJGPer8LKNqwNgzox/qCmnGCBeDtiT7Ao6/rLz21FTYBPdXbPhB0g9vJUm7ckCrzQUvH2FnzHZ2tR5Kjd4p7KjdKETt3uGZML0b/HtWqwidhdJYA9/DcJY6Yzkk5kc12UsjoMNFdcbaP9vMCmylYlUH43JqMtmdmneGCoKgXrDtgfOx8QI+xt/PfR+B613M2dGw1afkCSXP0bSiMNr5FS662cszsXGLqBi5im6xbI8g5XQCoFOqcpMibpE4Ufeu8sfCFA0qdBKpwP7jBXnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zKO5yEeo8TSbe4p+8dQUr8m9UvRJFhxAYHYGPlJp9Bk=;
 b=C9vF8rlDZ82czCUlt7nphm6QdlZ9Ak1gVta+M4vmYcV596idpw6ISnx66i7Fvv/EATvvt6ZBxQOCnxeTMmUBf4CBrt4TbSP3hH70//6tztHreCwRc5Uwr4Wu3ML4Ywug/+YPFxRc/0cqNcx2NmHoKhYZ+Wp5aauk2HPCG9Mtk7A=
From: Henry Wang <Henry.Wang@arm.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Julien Grall <julien@xen.org>, "sstabellini@kernel.org"
	<sstabellini@kernel.org>, Stefano Stabellini <stefano.stabellini@xilinx.com>,
	Julien Grall <jgrall@amazon.com>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Jan Beulich <jbeulich@suse.com>, Juergen Gross
	<jgross@suse.com>, George Dunlap <george.dunlap@citrix.com>,
	=?iso-8859-1?Q?Roger_Pau_Monn=E9?= <roger.pau@citrix.com>, Anthony PERARD
	<anthony.perard@citrix.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>,
	"christopher.w.clark@gmail.com" <christopher.w.clark@gmail.com>,
	"christopher.clark@starlab.io" <christopher.clark@starlab.io>, Wei Liu
	<wl@xen.org>, "Wei Liu (LSG)" <liuwe@microsoft.com>
Subject: Reminder: Last posting date for Xen 4.17 is Fri Aug 12, 2022 
Thread-Topic: Reminder: Last posting date for Xen 4.17 is Fri Aug 12, 2022 
Thread-Index: AdiqyX5bEXn4ht+4TX+tVkigxIYPBA==
Date: Mon, 8 Aug 2022 01:53:24 +0000
Message-ID:
 <AS8PR08MB7991ACDDB74E72ED11D3E9E692639@AS8PR08MB7991.eurprd08.prod.outlook.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 9B8C80F070239F47BE9A6D2B577990E9.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 95818588-b698-4ebc-d7a8-08da78e0cf03
x-ms-traffictypediagnostic:
	DB6PR0801MB1927:EE_|DBAEUR03FT053:EE_|AM9PR08MB6146:EE_
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 A6PEw5ESe8hrUv20D7yZG1M8MNsUjoITd6kQ96ckvphe3jF7h850COtcp2IrRiJ3hUg7E+YAGMfW2HdjK2e7kBvMfAe61T4Vq7Yb3lx2WVQCp5aZhkvr1L2v0lvNL7Aq5MqlzRw6i4jBbUo3abL19WPQvOzKO6eG6RvsZxMNv432TCuLd5xatSIHBxaERnrr+bgNJJWzysqTR5gMiTx7tJVnfq6c+ZUPNt0wHM+eJl5r+keyDc5Qnk14jpKQNt7H1tmqQzo7g74EgyBguq41t63XecpN7dnhbnmKy/OO6cWTgqo3hE4TgGCZ/31haiU37VunsvxywblLWnKOudU7RanU8FfZHUi+PNdQbwOfkJTgzvZ5ymyvVDtsFIyMDR8VG1Nt5kKGCmmV/0SrwncoacC2b11KSQhCWHyeY3iXKcX4iwvknZeCbkGCR88Lp/1hRkqslTZH8mgFmz/kf1eSWZtvD6bTIW5S32yeRJsuCN+eLBOa7u8U8af415IcIijC2Yd9mF6D5PaMg0vExowZJSnz3Brjv7hWgG0B9O3MKOGeZENkVpCKSn54TsHfIyc6hSs/jxC3PAayQzN5uY5jbRKNG5wwqK+0HbxbkSP/iWj22OZ99MADSLxs7u3fXOp+1gn+j+uj10RPzhsBpcTZeFbPURewM0FhZEhuv7IoguBRByRm8CTuwIEsAWbDVpsl8zAEdD6V/QSyB2sjpAMIrLQAndKGxASUjbbr9xU7pG4UgLt4QOl+MCKsGeVwQgBXJWdRKuatCXXrpCPaE2a/XFl1SgZauW6vuNRM+eQr/+8732CSEAkjnbkNkcuIFyjp
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(376002)(346002)(136003)(396003)(366004)(39850400004)(38100700002)(38070700005)(186003)(478600001)(71200400001)(41300700001)(26005)(4743002)(6506007)(7696005)(9686003)(55016003)(86362001)(4326008)(8676002)(64756008)(66946007)(66446008)(66476007)(66556008)(76116006)(5660300002)(54906003)(316002)(6916009)(2906002)(122000001)(83380400001)(33656002)(558084003)(52536014)(8936002)(7416002);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0801MB1927
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT053.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	407080c7-143f-4d44-8769-08da78e0c7a0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	b9sNGsx7/lfdB+/8ejB8rPkcZYVXX9pahYXmvy63VxsQmyTqLIH48h4jaWiJet1OZ6e4niILoJC5TmNFJhwmB3QEsxwpQOKTBv0shIlbYjIaEZnEvqq2uXpACEleRVojO4Waddk2nxkzonvJYDNeglZI/B44r31jdT0Ad0DEpfTSJ3XuwO66STc+oe1VnPkvoK2sJNUtTf6Ya5c2g9Hku9VmdshY5KZdHom39y0H/qyq9hMfeptoDI0QCKnbttjYbKOzWChy0WlDvvq3yt/osDlgq7ZtSFvE9TNP5jZBkru3K5ZrivwmWsaUEqA/EL/lOQCaeYPQ8+4KzSMS7ixVvlJEYuPLJhxU2oG6SR9lT956edgAcpZ3c8KrxBTh/pucdBcTPMvhd+Nazif7qh3gXMR9z+Kd/Vl4flEvfgC9mbTQHYh3V/B18F9bDo8ya+r2Qq6XTlb8mgvpucIV8kM2iM1o1bD4ff9KYrHsooj9x9OMjAH/YLjFzM9OS+hU3l42ad7Iq/IcDUJNi5j8r9gkKGdPNx0aCrHiPqL14W6GiQebzy8AWXhYtop92592r6eMP2L1z1VO804EZ3KVSFunV81g6x8hBLXlEgh1thSdxMYCwcxdteVb8pigW6brDsRZv5boG3qJyXnzB0rxLSo59jkdt/eZxwIlw9uBdnLRFzSMsofCFnqskTxQ+0gcCFH5YGBqCnXKdliJe0OvlJhjvf2OE2e/6Qmy1I0gfUylqnVuZpdJqLqGXnewd+Hk/XBWzdxC+UXOAs4YMZqjrZR1vA==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(136003)(39850400004)(396003)(346002)(376002)(46966006)(36840700001)(8936002)(52536014)(5660300002)(478600001)(4743002)(558084003)(9686003)(33656002)(7696005)(26005)(6506007)(86362001)(41300700001)(2906002)(36860700001)(82740400003)(55016003)(82310400005)(336012)(186003)(47076005)(356005)(40480700001)(81166007)(107886003)(83380400001)(70206006)(8676002)(70586007)(54906003)(4326008)(316002)(6916009);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Aug 2022 01:53:36.7489
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 95818588-b698-4ebc-d7a8-08da78e0cf03
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT053.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB6146

Hi all,

This email is a weekly reminder about the Xen 4.17 release. The last postin=
g
date for Xen 4.17 is Fri Aug 12, 2022. If you want your features to be incl=
uded
for the release, please make sure they are posted for the first time before
**Fri Aug 12, 2022**.

Kind regards,
Henry

