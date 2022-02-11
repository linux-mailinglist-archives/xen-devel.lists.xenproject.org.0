Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E23F04B2949
	for <lists+xen-devel@lfdr.de>; Fri, 11 Feb 2022 16:45:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.270578.464914 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nIY74-0005p6-0q; Fri, 11 Feb 2022 15:45:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 270578.464914; Fri, 11 Feb 2022 15:45:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nIY73-0005ma-To; Fri, 11 Feb 2022 15:45:33 +0000
Received: by outflank-mailman (input) for mailman id 270578;
 Fri, 11 Feb 2022 15:45:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ixe1=S2=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1nIY72-0005mM-3h
 for xen-devel@lists.xenproject.org; Fri, 11 Feb 2022 15:45:32 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2061c.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::61c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a3973b33-8b51-11ec-8f75-fffcc8bd4f1a;
 Fri, 11 Feb 2022 16:45:30 +0100 (CET)
Received: from AS8PR04CA0173.eurprd04.prod.outlook.com (2603:10a6:20b:331::28)
 by DB7PR08MB3499.eurprd08.prod.outlook.com (2603:10a6:10:4b::31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.12; Fri, 11 Feb
 2022 15:45:26 +0000
Received: from VE1EUR03FT025.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:331:cafe::34) by AS8PR04CA0173.outlook.office365.com
 (2603:10a6:20b:331::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.11 via Frontend
 Transport; Fri, 11 Feb 2022 15:45:26 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT025.mail.protection.outlook.com (10.152.18.74) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4975.11 via Frontend Transport; Fri, 11 Feb 2022 15:45:25 +0000
Received: ("Tessian outbound 18e50a6f0513:v113");
 Fri, 11 Feb 2022 15:45:25 +0000
Received: from 2cea64039e45.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 0691BBB3-C0EC-4B88-8CFE-914A7EC87FD6.1; 
 Fri, 11 Feb 2022 15:45:13 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 2cea64039e45.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 11 Feb 2022 15:45:13 +0000
Received: from VI1PR0801MB2125.eurprd08.prod.outlook.com
 (2603:10a6:800:5b::23) by DB7PR08MB3513.eurprd08.prod.outlook.com
 (2603:10a6:10:4a::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.11; Fri, 11 Feb
 2022 15:45:09 +0000
Received: from VI1PR0801MB2125.eurprd08.prod.outlook.com
 ([fe80::704c:5bce:5b39:136d]) by VI1PR0801MB2125.eurprd08.prod.outlook.com
 ([fe80::704c:5bce:5b39:136d%5]) with mapi id 15.20.4951.019; Fri, 11 Feb 2022
 15:45:09 +0000
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
X-Inumbo-ID: a3973b33-8b51-11ec-8f75-fffcc8bd4f1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Vnyqr+qWkFjFNmaWaLvScoHCIQEIOKeGAKRi94FpXhI=;
 b=t97pgbmKZh6xTM3NJv9/tzyAlT4w0YleFTYyHIjJCzMqFqJnYyL/u3FhjsE7dFFtkvawTsuhzu8qkbSEM/g1fXN61DkYVPjjfMIzlEahLNj3skBM9gi+TuDLinhdwaCjTm+o9+3cRS8SYXX1w5OqjPGBuNzFpSRl85zpaw1wXAg=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 24515c21129a0bce
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=amtLo3Y0G2m0PjIteIHjTBDbBr6Qc8LXjA1LQOMy+8Jv20ObLowWW0pK7EtYbevP5dgTzkHRf1Bz47ES7NkfzzW45gpxdKOr+tndPjcrfvV8WmHwpvpbaYhjkrV8sXcEZCP9FaeDUqCrZb+E1ylfeCA/FOLgQ4h4FEdJ1dzu+WnVuP+ukeEpDOqIxglQuUtHL/upM3Fjgthm9U7VVPn6RhjpXj59fmDL+Eu3XW+A/5cxEvjiKoM2fxj9q2/y8IvP+0eMSZ2HSIhNjPBtwd6dr3F84sEqdafEMip5lNLZ1u6NaXorFBKPNwFhv+8+cJ7cdfPSdw4nouCNC7Ex+djTMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Vnyqr+qWkFjFNmaWaLvScoHCIQEIOKeGAKRi94FpXhI=;
 b=TYI1bbtstGM1vVUaSScwKZ14Lb3a92oe6gm/RcPymV+cmkGED7/+xeqStnm3k9BkbtrGjYneIl9/nj/PZZOgT1UT3BrHzQ5yAVCdXjPki7bJUC45lBO9h3b+iA74gYbvRxVDo8/PfrdUspzDQ/nh3PGZN6PRHheFnnF3B/xqc2N+8q3rDlC4UfgPypS6SG9oRU3p1CNPH3NIBG61m9sGB9Idd9Gk2lCmWHSkpGgQkjxqcKw2QpEFyFnid7Eb5dPXBVNN43IBvWNfOGmZa/331kSUHiDdxpznXizYVPEf/h34kRPziBGvoTvUWxtKmq1fAg+25l0K9WbQjG5d4dzVrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Vnyqr+qWkFjFNmaWaLvScoHCIQEIOKeGAKRi94FpXhI=;
 b=t97pgbmKZh6xTM3NJv9/tzyAlT4w0YleFTYyHIjJCzMqFqJnYyL/u3FhjsE7dFFtkvawTsuhzu8qkbSEM/g1fXN61DkYVPjjfMIzlEahLNj3skBM9gi+TuDLinhdwaCjTm+o9+3cRS8SYXX1w5OqjPGBuNzFpSRl85zpaw1wXAg=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Content-Type: text/plain;
	charset=us-ascii
Subject: Re: [RFC PATCH] arm/vgic-v3: provide custom callbacks for
 pend_lpi_tree radix tree
From: Luca Fancellu <luca.fancellu@arm.com>
In-Reply-To: <81a2f978-9337-2e58-c8b2-86dc7defc2ec@xen.org>
Date: Fri, 11 Feb 2022 15:45:06 +0000
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 wei.chen@arm.com,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <1A16E009-F34C-4C6B-ABF6-FC08E395EABE@arm.com>
References: <20220211150042.11972-1-luca.fancellu@arm.com>
 <81a2f978-9337-2e58-c8b2-86dc7defc2ec@xen.org>
To: Julien Grall <julien@xen.org>
X-Mailer: Apple Mail (2.3693.60.0.1.1)
X-ClientProxiedBy: LO4P123CA0014.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:150::19) To VI1PR0801MB2125.eurprd08.prod.outlook.com
 (2603:10a6:800:5b::23)
MIME-Version: 1.0
X-MS-Office365-Filtering-Correlation-Id: 20d55dae-d292-463e-719f-08d9ed758573
X-MS-TrafficTypeDiagnostic:
	DB7PR08MB3513:EE_|VE1EUR03FT025:EE_|DB7PR08MB3499:EE_
X-Microsoft-Antispam-PRVS:
	<DB7PR08MB3499CFFFC9E943692EC79B1BE4309@DB7PR08MB3499.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 aoSQT2ab/Apu5PFP0t0cmgQXqdjQ7Z9xB/1dxupkz2SWCUXk1W/7oW//iH646Y8tizU2HZEbnn0iAghERe0+FxN6+5zuL6SVgoyZeg4Zfu456YiUqOxq8ix0e94scMrsexhJ3U1+AdyeC71hQdgy5SO1N6hfTPeEt/mEm7ynfOhd3+lgBYszGUpBg9H5j7hPCN1crwLAvM44D9mGgMNs5tPKe3Hq4sH1NnyRYBqVPBcIfHUxj0RFdsmhqacQj50xNxSoj5v6aYJXRWRQVAaG7Gah1DGS51fR40ESemC+K6qA7Ap7vCfHK7apWEsUybiQPbIYKGd/tCHGU3bU3YAvKp+Zp6AhEGGPCbWCM6y8igIfY/uESXeRNSs8dZIrkt076RUH4uazWb/udsscy8Cuhw5IbfV9zC0wuEfL9+VP0QOSb2Nrf1fHEEKIwY2mErKj0YTQei6TWlV19qe8Pm926pOI9syHFbyPjf+pIl86T18gx8zc+rX3g+NVsnQYWbEk3Wy+Hbz3tGKp8j7kYQZu1XGsu3xU+om5D5y3yYekQy1w6hDAf7SYM8TwgujbFz0YmwuvmscKKE3pSrMjcTIdO6tYaiJtg3flVxoaPAiyUDnM0n91STm2qm3/h5x6csoMjafyAee8H7uZkOvkvn5tGERw8KGwHlrax/b7EOS7M/y5ZiuKDbvBCjfiZ4njKFOlhniZHJ+lbIOu7DkKtp5cwcHY9zHVRKdmEKv7TVu/Veg=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR0801MB2125.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(4326008)(186003)(26005)(83380400001)(66556008)(66476007)(66946007)(38100700002)(8936002)(44832011)(86362001)(5660300002)(6916009)(36756003)(6666004)(6486002)(2906002)(6506007)(54906003)(33656002)(508600001)(6512007)(38350700002)(52116002)(2616005)(316002)(53546011)(8676002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3513
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT025.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	2e45bb8d-61d2-41ed-567a-08d9ed757b95
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	fsSOCd5GbBVxJM8TQUXXa7TO9O1HuhVOZuNDAjLXqh8oxpJspdzNAYX3mQs08dpJ6oEkHGAScX3Zwg+OmCeV0CFB1AxsaT9DxEg/XsaYp1aYLkawnyAi1n6ElrGMkrwIS8i2gcLJwnCVTl9fhlWnfG47YqMjj6wFKKhksGRtTpj4M1CZ7SFhHuimlIDCTpfUgJeBGxfXjvXfzyhPrQ8hYmsrYzbxKbI6gl8i3Dd08CTIu2Emn1jGSxVnq+9gdLylrW6WkKJE5YHCh+/J+rRhZrK9HFqIWc8yoVIl8RyLnuej1dL7eMPXSVIio53MFEDiQ/IKn/P2GNy3X+EomxTu70UC9n61yOo14ckvyK/pwxiFqT4U3ARiXPyYE0IRo9iLHJAmBDS1pxpej29aS165x34id8QxQ9UfUHKSPc7FehOCOsNfBbOBdJ3bgJ5u/GTBYBpOlyvxUkVMfPWyU+it8hS2231iit+eLbmUAji7X01r7Ly77DRlWx0JPtilEjWDY58tIe8B0AAk3GHcyN7AdxVFsDtXZ3QfU5CW0RlAwQ2EJUPibXL+Rvd26h6koRqe6dT/EaZRnjS1TZNoRp8y2x9hp8t9iDbzCAaN320HX5maLnRwzfVAjvISroZgPjLvHL7SZMkZEB93HyD9tJHUP5/Ozv58vdpGdrcR2LgCDcTGgDLXzYrd1wvVY3z7pinp
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(46966006)(40470700004)(36840700001)(8676002)(6862004)(4326008)(70586007)(70206006)(53546011)(6512007)(54906003)(8936002)(36860700001)(2906002)(5660300002)(316002)(6506007)(508600001)(86362001)(6486002)(6666004)(40460700003)(47076005)(26005)(2616005)(44832011)(81166007)(356005)(336012)(83380400001)(186003)(82310400004)(36756003)(33656002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Feb 2022 15:45:25.4424
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 20d55dae-d292-463e-719f-08d9ed758573
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT025.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3499



> On 11 Feb 2022, at 15:26, Julien Grall <julien@xen.org> wrote:
>=20
> Hi Luca,
>=20
> On 11/02/2022 15:00, Luca Fancellu wrote:
>> pend_lpi_tree is a radix tree used to store pending irqs, the tree is
>> protected by a lock for read/write operations.
>> Currently the radix tree default function to free items uses the
>> RCU mechanism, calling call_rcu and deferring the operation.
>> However every access to the structure is protected by the lock so we
>> can avoid using the default free function that, by using RCU,
>> increases memory usage and impacts the predictability of the system.
>=20
> I understand goal but looking at the implementation of vgic_v3_lpi_to_pen=
ding() (Copied below for convenience). We would release the lock as soon as=
 the look-up finish, yet the element is returned.
>=20
> static struct pending_irq *vgic_v3_lpi_to_pending(struct domain *d,
>                                                  unsigned int lpi)
> {
>    struct pending_irq *pirq;
>=20
>    read_lock(&d->arch.vgic.pend_lpi_tree_lock);
>    pirq =3D radix_tree_lookup(&d->arch.vgic.pend_lpi_tree, lpi);
>    read_unlock(&d->arch.vgic.pend_lpi_tree_lock);
>=20
>    return pirq;
> }
>=20
> So the lock will not protect us against removal. If you want to drop the =
RCU, you will need to ensure the structure pending_irq is suitably protecte=
d. I haven't check whether there are other locks that may suit us here.
>=20

Hi Julien,

Yes you are right! I missed that, sorry for the noise.

Cheers,
Luca

> Cheers,
>=20
> --=20
> Julien Grall


