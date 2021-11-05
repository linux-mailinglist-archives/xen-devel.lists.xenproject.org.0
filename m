Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BB3684466A0
	for <lists+xen-devel@lfdr.de>; Fri,  5 Nov 2021 17:00:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.222520.384760 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mj1d0-0005Td-V3; Fri, 05 Nov 2021 15:59:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 222520.384760; Fri, 05 Nov 2021 15:59:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mj1d0-0005R4-Rj; Fri, 05 Nov 2021 15:59:42 +0000
Received: by outflank-mailman (input) for mailman id 222520;
 Fri, 05 Nov 2021 15:59:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MQ27=PY=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1mj1cz-0005Qy-5c
 for xen-devel@lists.xenproject.org; Fri, 05 Nov 2021 15:59:41 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2062c.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::62c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 619548bb-3e51-11ec-a9d2-d9f7a1cc8784;
 Fri, 05 Nov 2021 16:59:40 +0100 (CET)
Received: from AS9PR05CA0052.eurprd05.prod.outlook.com (2603:10a6:20b:489::10)
 by AM5PR0802MB2402.eurprd08.prod.outlook.com (2603:10a6:203:a1::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.11; Fri, 5 Nov
 2021 15:59:36 +0000
Received: from AM5EUR03FT007.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:489:cafe::4c) by AS9PR05CA0052.outlook.office365.com
 (2603:10a6:20b:489::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.11 via Frontend
 Transport; Fri, 5 Nov 2021 15:59:36 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT007.mail.protection.outlook.com (10.152.16.145) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4649.14 via Frontend Transport; Fri, 5 Nov 2021 15:59:36 +0000
Received: ("Tessian outbound d49ee2bec50d:v108");
 Fri, 05 Nov 2021 15:59:36 +0000
Received: from fcce8ae85782.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 95FBC594-6754-4499-B235-7A3F927FA9CC.1; 
 Fri, 05 Nov 2021 15:59:29 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id fcce8ae85782.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 05 Nov 2021 15:59:29 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by AM5PR0802MB2403.eurprd08.prod.outlook.com (2603:10a6:203:9f::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.11; Fri, 5 Nov
 2021 15:59:28 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::69d7:e26:6610:ebd8]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::69d7:e26:6610:ebd8%4]) with mapi id 15.20.4649.023; Fri, 5 Nov 2021
 15:59:28 +0000
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
X-Inumbo-ID: 619548bb-3e51-11ec-a9d2-d9f7a1cc8784
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZSwQQx6s66SDQWrufre0csSS3wES0mHK2akKgQLxuCc=;
 b=sLkcJy4cmmqj6lk3TvrYcnY5ZsuzZLV23LsIZB/wInNg6jSg2SdhCMJ0XOqwI6Ev3xaiSukFSFcQKoZdJQaN4RQ4O64TGU3y4sPJ4OpyevHgSzYw2rIES/uMJ9QOKHgQ5Lxuq+8B6WCFHPmBN4s12ol3/RVCqf1clT71vECmW+w=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 20b12c2ad44c8d70
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SETyip8QjeINGjHrOzfrEQLTk2d0Q1063N4Yo5GbjxuO7HDiAXgKe8E7puq9XU2YVqdJtA8WY4WwC7L7v3RXxYftDpqs1JLaW/2jPAIMK3aPaGlmlWP4Rqv/ObFhySTBiayrZ9Avt/AYGk4rX1GDYPf33XO/Qf8gNgzGtiMdiWAPPPy6CNJ20pfd9hfIWLULhmPSBdITIqmRrERbb3L3PthtuPPErePZC3WJRyboUyFwRDfRfK08/7QhL8FwcczYB/5yCIXN3gFURVn7NSfAb1Y9+JXTNY5V5Gj3b8VQf0LM3SZbszfNB1LwDvahUWBpRdMVpkibdtaYcLQUDDttAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZSwQQx6s66SDQWrufre0csSS3wES0mHK2akKgQLxuCc=;
 b=SxHJVjVed5T6rI2O9DTQos4Ip1rZYn50KKY7sJIyXqJkiwfB4mzDutBapkv7eyi3YJQfuDXj9WZVwMS3KV6Xo6OBRlY2scEispLnFo1tSyqFRtqW5AflhYSYPtCsIprxQ7euvgEmxrJz2OC3LO2OjUNeaA56BFKsnCtiDlVxbteu1dgLttUKTfK0n6AL5Rxb9EmK4LuS5x0wYDwz+ov2OXjGXSmZttUadHNBQ2Hztz07N1angYemQTGnZpYiQSVdbD7GUpbTyJKEVScurJT6JP+d9zlfUERs0zbHy2mcxhDO3Gfd5T3uSGXDFn1Q1G+FaEmKfB9SuEZDE/iDIHXT8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZSwQQx6s66SDQWrufre0csSS3wES0mHK2akKgQLxuCc=;
 b=sLkcJy4cmmqj6lk3TvrYcnY5ZsuzZLV23LsIZB/wInNg6jSg2SdhCMJ0XOqwI6Ev3xaiSukFSFcQKoZdJQaN4RQ4O64TGU3y4sPJ4OpyevHgSzYw2rIES/uMJ9QOKHgQ5Lxuq+8B6WCFHPmBN4s12ol3/RVCqf1clT71vECmW+w=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Stefano Stabellini <sstabellini@kernel.org>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	"julien@xen.org" <julien@xen.org>, "Volodymyr_Babchuk@epam.com"
	<Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v2] MAINTAINERS: add Bertrand to the ARM reviewers
Thread-Topic: [PATCH v2] MAINTAINERS: add Bertrand to the ARM reviewers
Thread-Index: AQHX0lwUbMqNNPfAlUOn9lEHPYC846v1F4EA
Date: Fri, 5 Nov 2021 15:59:28 +0000
Message-ID: <2725DA19-860D-4A23-AA76-0A1F31256B75@arm.com>
References:
 <alpine.DEB.2.22.394.2111050843450.284830@ubuntu-linux-20-04-desktop>
In-Reply-To:
 <alpine.DEB.2.22.394.2111050843450.284830@ubuntu-linux-20-04-desktop>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3654.120.0.1.13)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 4daa4749-dd66-4854-27b9-08d9a0754432
x-ms-traffictypediagnostic: AM5PR0802MB2403:|AM5PR0802MB2402:
X-Microsoft-Antispam-PRVS:
	<AM5PR0802MB2402A3596755258A356ED9F29D8E9@AM5PR0802MB2402.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:454;OLM:454;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 u1Cj5thrALhPq9HcH5zv0Expi7UyNbUPGBAxV2j56pnOIdJQbg3O1jRWQ4ETEiKAWiahhYqnukSVpQDalyt5w+iCSKwiF7o3goQQz2F47krG7Uoo2v27tHcyMPVLPnhZvTX0F0pKSmFdsToaGhZ+x+ci5BrrV8b9UF5UotaJYkNWp9O3QHdABaOJYdhUVaScXv3b+U88gxPyNQGPAyJlSbkrby+jpaeFKHyRQ6BWBCWuBICYMkGrGc1eK6X0rGAP7Bj8a7LUNgMkci4DS4PhpHGfz5MtifqbZrc+8r2fBaQM9EBYdFHcs6vb6C58/D57kQ2wsqn/L/6dtKZiNrk7k0mmmVLWg6bwcDNlj/Oi9YWSilzYIvNsjYtrpOiMC0JBMR5GvQpL4cV+BTHq8H6YrHHgAnm/PDyOnHY7GEiiXYNtb2UMYyTecgz9lKfpOsu8Nrq7pKQQ3/uJV9hv1jsxhg3f8WNEj2U47NazNjpnqPk9Rd1w19cX3EADZACM0W/SYGyeP8KU3Gyepg/0HbGk+P3Jy4lObb9ZUK41wyGwQAi3dvAkqc5LPFCr8aw0gCBVtZwRVrTAGs9guNNxJJt4xYySyARdt/lImJfppKDUREBmHmW9Z0HtW7cvV0oJREtLh9y2f3kaB7LvW175fKBJ1LVhOsETCtBbiRfIQ3y0xovgXh5xCPyk5+jHWXqfb3su+QHBJQ6e5hkb4PG4+dk5oYTYMTnU/KBK0PHisn0YNyeh7IethuMyCaWVWxnypnxE
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(316002)(38100700002)(26005)(36756003)(4326008)(5660300002)(2906002)(66946007)(91956017)(64756008)(66446008)(66556008)(71200400001)(66476007)(8676002)(122000001)(6916009)(76116006)(53546011)(8936002)(33656002)(54906003)(38070700005)(86362001)(6506007)(6486002)(186003)(2616005)(6512007)(508600001)(4744005)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <A2A3DA0C4A85C746A8275552466A4E53@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0802MB2403
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT007.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	5aafd9d4-470c-4f20-3583-08d9a0753f64
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	DiWFtWzUk+XBJxTNw1PdaW+GvRQCmNGm+j34lQbuiDkvOkkXmJ7HIP2PC8BkrGmt1ahwdUJ2TrnIkGcPIrqxxpoMny73zNbhV8H8QXFzP41w6WcHozgGj+6rw36bFvXECoLsNFT9O6OjBIzXjDK9HazeyouDa6J3mu9YIu2ieXP+70AK5AC8j8r3hZE/YiqiUTDJbM/vaQWj43DM0Uf8A1klMBGud4ikBY0FJ9Hk5050O6dluolZYxSVTCRFscU+Fd2jr85xQqBSrLP+CRTm0bhcxEfEqZVSkJqtwsnfw2eomeDpaTm37Wi8aE5Yhp+36BghxHbwRx1fRt1hPuTp3H3QRqaO3dOiKxb/dGtg3oq7RaOd98jjwx6jKjt5td/YFGfPo0JrBIYZYps81zx6cjZDeKlHnzCHCBrF8WVFG42M3WF75uDLJwh9Onvne28n1gXXOs0zGCvzdo/tkDcL3m4pusmL1uA7C0W8ZNPnWPHu16DamAsD/nGTUuEl0G8gEMvCZP3l6konnRWpyeK8hGKSN7UE46jjnk8SZmYAWs8ArvHEDWIInuYIO6CySvl3BVnEjLngv/KaCWlWFmYXFWGJWxuJProwZV00dxJl9LZGXBB3T9cfYA1LLdxQ5pK56eOVUpIXmpZYQQ4nN3rmTb3k5a4mmbkXIFSr+u66tq9p6JxsTB/TRls4zarwHIqIa7xcmZoMX4Wzonm38ScPgg==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(46966006)(36840700001)(6506007)(316002)(36860700001)(70586007)(6486002)(336012)(36756003)(186003)(26005)(508600001)(33656002)(82310400003)(8676002)(53546011)(356005)(54906003)(8936002)(70206006)(4744005)(47076005)(2906002)(6862004)(107886003)(5660300002)(4326008)(81166007)(6512007)(2616005)(86362001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2021 15:59:36.4851
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4daa4749-dd66-4854-27b9-08d9a0754432
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT007.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0802MB2402

Hi Stefano

> On 5 Nov 2021, at 15:44, Stefano Stabellini <sstabellini@kernel.org> wrot=
e:
>=20
> Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>

Acked-by: Bertrand Marquis <bertrand.marquis@arm.com>

Cheers
Bertrand

>=20
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 9be4ad653a..4956db1011 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -232,6 +232,7 @@ ARM (W/ VIRTUALISATION EXTENSIONS) ARCHITECTURE
> M:	Stefano Stabellini <sstabellini@kernel.org>
> M:	Julien Grall <julien@xen.org>
> R:	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
> +R:	Bertrand Marquis <bertrand.marquis@arm.com>
> S:	Supported
> L:	xen-devel@lists.xenproject.org
> F:	docs/misc/arm/


