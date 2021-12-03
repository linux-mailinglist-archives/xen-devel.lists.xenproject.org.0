Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CA22B4674A6
	for <lists+xen-devel@lfdr.de>; Fri,  3 Dec 2021 11:20:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.237261.411472 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mt5fA-0005hZ-Q2; Fri, 03 Dec 2021 10:19:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 237261.411472; Fri, 03 Dec 2021 10:19:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mt5fA-0005eP-Ld; Fri, 03 Dec 2021 10:19:32 +0000
Received: by outflank-mailman (input) for mailman id 237261;
 Fri, 03 Dec 2021 10:19:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aSTI=QU=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1mt5f9-0005e0-FZ
 for xen-devel@lists.xenproject.org; Fri, 03 Dec 2021 10:19:31 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on0602.outbound.protection.outlook.com
 [2a01:111:f400:fe0c::602])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 80177962-5422-11ec-b1df-f38ee3fbfdf7;
 Fri, 03 Dec 2021 11:19:30 +0100 (CET)
Received: from DU2PR04CA0261.eurprd04.prod.outlook.com (2603:10a6:10:28e::26)
 by PR3PR08MB5642.eurprd08.prod.outlook.com (2603:10a6:102:8b::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.23; Fri, 3 Dec
 2021 10:19:28 +0000
Received: from DB5EUR03FT015.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:28e:cafe::a7) by DU2PR04CA0261.outlook.office365.com
 (2603:10a6:10:28e::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.17 via Frontend
 Transport; Fri, 3 Dec 2021 10:19:28 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT015.mail.protection.outlook.com (10.152.20.145) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4755.13 via Frontend Transport; Fri, 3 Dec 2021 10:19:27 +0000
Received: ("Tessian outbound a33f292be81b:v110");
 Fri, 03 Dec 2021 10:19:27 +0000
Received: from dbd1ffe578a3.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 E1528ECF-E8CE-4B34-97BA-762E6A5571DA.1; 
 Fri, 03 Dec 2021 10:19:21 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id dbd1ffe578a3.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 03 Dec 2021 10:19:21 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by AS8PR08MB6469.eurprd08.prod.outlook.com (2603:10a6:20b:33c::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.24; Fri, 3 Dec
 2021 10:19:20 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::69d7:e26:6610:ebd8]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::69d7:e26:6610:ebd8%4]) with mapi id 15.20.4734.028; Fri, 3 Dec 2021
 10:19:20 +0000
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
X-Inumbo-ID: 80177962-5422-11ec-b1df-f38ee3fbfdf7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yg2MfwRaiITANGB5KvOSAQ1TcjDjGwifxAg8X1H07L0=;
 b=pZH6TwEb5iMcwyfU5yJj3jjFH38UACxwqgsG55QVP1DIpmSroT1gWC/FkyZ5ijQ8drTd/vjIadQc/jIPWbOuP5T6qoFqdYisOY9qp9gzv0Q3RKMpfNYVo0xOsAaCQ6Lvtz+61/Yh3jKlJLi7eHBBFVbfPSWPCuWApd66Us4M5R8=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: c89b3d562d2e8ab1
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JhET4dgClnO1loAkV+hE1BL/IRRNgVx7vHcnxBGMGq5VCWdgdZeHhtahSk7PAP3EV79iY6WCFvmqaV358m2yQE/CvjJHjGaleEcDq8JlogSZabSKhGZ6tvw8Fe0GBrgSDIudJCx7RMcNUUM7b1iD3BZbfhrExZPOx3y/hzbAhnX2IjP1I+0t0oaMuef8e63GfBLpkeyiCbfLB+dq5W+2ZYgEylNdc6t5bHGtFwewobKczDBqD+XMj5BUkg1cCTssdE2uluSwKQw2GI0D681/d1ovSwoIp/GFjvcdwtDIFPg54sgP3E+tiMBhMWdpPpT53TCwsDix02CiH5N9UNesiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yg2MfwRaiITANGB5KvOSAQ1TcjDjGwifxAg8X1H07L0=;
 b=ZT73GQVPC9h4L7JOOs+hmBZFrm8ZRMFTd3KLOn1GBM+Xz4QL7NmM9dsKJvXWn3ljqT378/ERwOD9ggSyw2IiFcG9qt1rDeiSiSxKwVvLmLgr0J6N9faZsD1e94M8g75HpZceLVPIvtJtUDl8adj6raz+QvNKVEQbpa1S74mpjhOSiB0pzqaL+2JmuQZrR42c/QxsuEEWd1eqSHS+hpaCeseGS9VEBpC8jGvUbOmWBOp8oQ53A2dhPBqL+vaYfIE+/Njs9FhWMh0W15W/shQFHMnPJpXBBPvQWlE/GDSFaX7JBMLL1tyf50i0AgAm7uBBimvfEVXvEnCBNCcYm/m+bA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yg2MfwRaiITANGB5KvOSAQ1TcjDjGwifxAg8X1H07L0=;
 b=pZH6TwEb5iMcwyfU5yJj3jjFH38UACxwqgsG55QVP1DIpmSroT1gWC/FkyZ5ijQ8drTd/vjIadQc/jIPWbOuP5T6qoFqdYisOY9qp9gzv0Q3RKMpfNYVo0xOsAaCQ6Lvtz+61/Yh3jKlJLi7eHBBFVbfPSWPCuWApd66Us4M5R8=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Michal Orzel <Michal.Orzel@arm.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH] arm/vgic: Fix reference to a non-existing function
Thread-Topic: [PATCH] arm/vgic: Fix reference to a non-existing function
Thread-Index: AQHX6CxjOPaugM9lo0aVspePzsZYTqwgjh6A
Date: Fri, 3 Dec 2021 10:19:20 +0000
Message-ID: <B3D7A1CC-6CEB-45C9-914C-6BF5540EA1BE@arm.com>
References: <20211203095837.20394-1-michal.orzel@arm.com>
In-Reply-To: <20211203095837.20394-1-michal.orzel@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3654.120.0.1.13)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 52ce8533-271c-4b46-96b7-08d9b6466327
x-ms-traffictypediagnostic: AS8PR08MB6469:|PR3PR08MB5642:
X-Microsoft-Antispam-PRVS:
	<PR3PR08MB5642700B0EA51E1710BA1AED9D6A9@PR3PR08MB5642.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:8273;OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 eQJ9SaA1rGA7kZ7orCBiE6D7tA1XNVxM5LXgRb8FkrrsBBpcWebTm63ufhTjF7FA1UHRxJjl8cL10eTN/6ETpbmunlr0pmV/GRqGjGnNbaPemkv/fmKEAHi4sFxqwvou1vlU+nSN91F/pKn1LyENhSx6aNLCwT4Ey83S5wFEt+usRrq1753iXhipfZe6hiklztJ7WWK0nMH5a6gyDLxzb0HFOu9p8l/iyVe+GbUT5IPJRh6NmJqsEIt46D4b02+CwGrneuoR7hMmGdQc9d0CNfl0sGwhNepmKtVRMIQ0A3Ggj1jY0n/AqTGdBDqUZBTUWgI917u0v7UChZS0DZw0FLDLcVuR4IllV8+waU35x/Awb7y4IUVDK05uzQnNLqglU8JgkYSoC/ji0l5Yzo6fECUTTkNWLzssZT85doBfkSI3JlLlrggap04JAEExYrB0m2XGVjKKdTs3B0z5lk6wDyKBTyKYPqdrY5/aNzDYPRbRsIt85lH/PePmcZEitK8o5c4A0DEo8BVd30WG5kHzpKrpG4/GqAfKBgktzH2NnHnDnOe1mKh4mhqEs2qGRDSHizj/MHkRjJTOQYUkUbYXxSA+mIvb4VNRWU7fgl9QQXwDl3oEsLned5/jCDUw25fKwIzwkqwgJ1XsyXxG4mGBHdGPMAvPpKGU+zOBJ0w0vHuWhX61wHx6XrIFl8MhHreeTWooRbmH8tZNVwiQjqEpixKnYMsWDL2ePLououikwVKhOQqQs+A0R9sb+peBXayk
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(6512007)(36756003)(2616005)(26005)(38100700002)(6862004)(64756008)(186003)(38070700005)(2906002)(37006003)(8936002)(508600001)(33656002)(76116006)(53546011)(71200400001)(86362001)(4326008)(6486002)(8676002)(66556008)(122000001)(316002)(66446008)(54906003)(5660300002)(66946007)(91956017)(83380400001)(66476007)(6636002)(6506007)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <13E2B0937144BD4F881638B62B88C2FB@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6469
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT015.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	36dfc9a7-c59b-4fd5-c10f-08d9b6465ed3
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	dDJKcU9TifBxf1rhjBZCjABMrWaHWyW7yrjsl0uBx3yWUMRECHyHvxMEVGrUBwaU3OpSAsOsQqnA6AAJO16UO8nTWc5hm8qZgghNilJElspuncF0AY7X1buqsFeb5foUVCGnSMICHnEUcC3xFNjwDe6Nh18AMEsqlaYgYVPuPy1P+2Sw0jMIdF6zqgeSC76yLilxYhLUk0w+6wz0JYr7nXMj58QiOu/0dEZqghBRg16EDBhKJ+Q4xp38Twnb5kErlHvrsTaxX+H7UKUJ5BGV2gMA25RjCOP2s87X1oTCpaJKPx7g67My64hp0QQk6oL1cXqeNYqtEa9avSk5Z8wQqwl3rOAsoZbw8ESSWmwUwQTNbsJqmYMhQRD8B6Kp50q/NkpSy042RZqL4ebsALd6pEM8f06UBD/4V/lnS8npQ9WLjAVXvoq2JOyDlBDXWwHbwfGhuDLd8P88eb50Z04+w+mGh3hQelSpcJGub5BPSudeuVVTjCOJew61RTMlJ3D1LHb509Pz1UsswyEksUnTYn1e90aR9mlLfua7GhHWgctRVNd8YKH2c5VkN2hQrM+trW9+N9aBn+azKZ5nmtUpo216Q3Bsi3d+UYK8OxSUFi/cadPB9MkEDbBi7Pakw8mqWAu9fIb4bqvBkH0ERBGteohvE467mdLrnsjPhqOQrHzNKcRN318OxuD81gYRQ+kXtH2wEw84mWUd1aujTkR1ow==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(46966006)(36840700001)(8676002)(83380400001)(36860700001)(37006003)(82310400004)(54906003)(508600001)(47076005)(316002)(2616005)(81166007)(8936002)(26005)(86362001)(36756003)(33656002)(4326008)(6486002)(336012)(6862004)(107886003)(53546011)(6506007)(356005)(6512007)(70586007)(5660300002)(186003)(70206006)(6636002)(2906002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2021 10:19:27.7070
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 52ce8533-271c-4b46-96b7-08d9b6466327
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT015.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR08MB5642

Hi Michal,

> On 3 Dec 2021, at 09:58, Michal Orzel <Michal.Orzel@arm.com> wrote:
>=20
> Commit 68dcdf942326ad90ca527831afbee9cd4a867f84
> (xen/arm: s/gic_set_guest_irq/gic_raise_guest_irq)
> forgot to modify a comment about lr_pending list,
> referring to a function that has been renamed.
> Fix that.
>=20
> Fixes: 68dcdf942326ad90ca527831afbee9cd4a867f84
> Signed-off-by: Michal Orzel <michal.orzel@arm.com>
Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

Thanks for that

Cheers
Bertrand

> ---
> xen/include/asm-arm/vgic.h | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/xen/include/asm-arm/vgic.h b/xen/include/asm-arm/vgic.h
> index e69a59063a..ade427a808 100644
> --- a/xen/include/asm-arm/vgic.h
> +++ b/xen/include/asm-arm/vgic.h
> @@ -195,7 +195,7 @@ struct vgic_cpu {
>      * corresponding LR it is also removed from this list. */
>     struct list_head inflight_irqs;
>     /* lr_pending is used to queue IRQs (struct pending_irq) that the
> -     * vgic tried to inject in the guest (calling gic_set_guest_irq) but
> +     * vgic tried to inject in the guest (calling gic_raise_guest_irq) b=
ut
>      * no LRs were available at the time.
>      * As soon as an LR is freed we remove the first IRQ from this
>      * list and write it to the LR register.
> --=20
> 2.29.0
>=20


