Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A76E4709AFE
	for <lists+xen-devel@lfdr.de>; Fri, 19 May 2023 17:14:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.537151.836003 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q01o8-000087-DT; Fri, 19 May 2023 15:14:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 537151.836003; Fri, 19 May 2023 15:14:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q01o8-00005p-An; Fri, 19 May 2023 15:14:16 +0000
Received: by outflank-mailman (input) for mailman id 537151;
 Fri, 19 May 2023 15:14:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7Umm=BI=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1q01o7-00005j-62
 for xen-devel@lists.xenproject.org; Fri, 19 May 2023 15:14:15 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on062a.outbound.protection.outlook.com
 [2a01:111:f400:fe0c::62a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cfe74c93-f657-11ed-b22d-6b7b168915f2;
 Fri, 19 May 2023 17:14:13 +0200 (CEST)
Received: from AM6P191CA0010.EURP191.PROD.OUTLOOK.COM (2603:10a6:209:8b::23)
 by AS8PR08MB9148.eurprd08.prod.outlook.com (2603:10a6:20b:57f::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.21; Fri, 19 May
 2023 15:14:11 +0000
Received: from AM7EUR03FT032.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:8b:cafe::3f) by AM6P191CA0010.outlook.office365.com
 (2603:10a6:209:8b::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.21 via Frontend
 Transport; Fri, 19 May 2023 15:14:11 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT032.mail.protection.outlook.com (100.127.140.65) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6433.7 via Frontend Transport; Fri, 19 May 2023 15:14:10 +0000
Received: ("Tessian outbound 5154e9d36775:v136");
 Fri, 19 May 2023 15:14:09 +0000
Received: from eb3788c04473.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 440772C1-C3E7-488C-9937-2BBDF32D0B2B.1; 
 Fri, 19 May 2023 15:13:58 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id eb3788c04473.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 19 May 2023 15:13:58 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com (2603:10a6:20b:8f::22)
 by AM8PR08MB6545.eurprd08.prod.outlook.com (2603:10a6:20b:368::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.21; Fri, 19 May
 2023 15:13:54 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::362c:56c7:5ea4:422e]) by AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::362c:56c7:5ea4:422e%7]) with mapi id 15.20.6411.019; Fri, 19 May 2023
 15:13:53 +0000
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
X-Inumbo-ID: cfe74c93-f657-11ed-b22d-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nz/EAoLLiHuYxeS/yb49OuErXbPQ6y/GQYH2gzgWFyE=;
 b=NVPYi4uSQU+y3uKOmf8kdOuJSbaOF/e+3FJVvoQ62g4SlM2INO6xyhhnGXJLksS71d3SpXKtH2GaqnC6B6agdSUVygOpFApqYzkTsBYas/nr3ODr0fgR61zq+QU09RC5o0PzSE+e9NUhygov764wW+4q+Kr2yu3n240+ViLvQp0=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 5c1cffdfff0bf19a
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RCWrhkqXqmkCGF5WPs78yifEPl1IAzea/YJ+I3NTYl9nJoRzeUWjA186ZfVixhde9+lh6qy0jylMw3FbJSltl9jU75J3vDz1b6AQl4CRl0cAq17FSTpg1LlyrTSbe8tn3NIisXh/JkS4tl/yTmkp4iRRG7KDGS/UanKwc+yv0PWS87dx7rvfiWsZLwhnFFrNlfutHJJsjmYO92/JRMwfhR8Mqf+5UOZ9WdAqygdze8qffZeoCy3lzAqOf4ffvfimNtMdOUxiWNrrM5Hw7noWW8Ir+Be9/uT7nPFj/Tx3AZA4l2pu+DFJUrhXS2A3uMcSftTkTKgmkb/bV31hFdQNcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nz/EAoLLiHuYxeS/yb49OuErXbPQ6y/GQYH2gzgWFyE=;
 b=IZRR4i4wD1m2ZOPUoOi1NQLdSjQMgxsAoDEzIzMq2+O7BrdPqDr48C3IG3BmsUg//jgh/S5KC5mBfEmtwQPqtnQ7RWQsotNtWwksh75DcImaPeZIuYRuo6I7me8p+A94hf6+QD1/77GodI7paP84VX6AU5PHk0H8iHt2hZo451bccy9bkSP5ZBcEkgkdy8M/oX2zv8G0flUa3qvUi5V3aZIuHu0gXe7Gafw0qaO4iXgjdBV5XDuiu0PZrwUQGFF0ushP4qx1K5vDHQAwAU5qfB7/z9uRixUJFqH296sFhseL1Lv8P8qhHoiJnusI8VByOeH/FiH7EiQkZPPoEAlEBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nz/EAoLLiHuYxeS/yb49OuErXbPQ6y/GQYH2gzgWFyE=;
 b=NVPYi4uSQU+y3uKOmf8kdOuJSbaOF/e+3FJVvoQ62g4SlM2INO6xyhhnGXJLksS71d3SpXKtH2GaqnC6B6agdSUVygOpFApqYzkTsBYas/nr3ODr0fgR61zq+QU09RC5o0PzSE+e9NUhygov764wW+4q+Kr2yu3n240+ViLvQp0=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Julien Grall <julien@xen.org>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v6 01/12] xen/arm: enable SVE extension for Xen
Thread-Topic: [PATCH v6 01/12] xen/arm: enable SVE extension for Xen
Thread-Index:
 AQHZdnKBJmFHv6Wq8kSjvXctD+zlI69f6zCAgAHjioCAAAXEgIAAAV4AgAACogCAAAOZAA==
Date: Fri, 19 May 2023 15:13:51 +0000
Message-ID: <13FF90CF-22ED-4A7E-AAEB-633FF8CAF999@arm.com>
References: <20230424060248.1488859-1-luca.fancellu@arm.com>
 <20230424060248.1488859-2-luca.fancellu@arm.com>
 <1fb3c4a2-8bc7-45e4-7ccf-803157f1b3b1@xen.org>
 <86D7B5C8-2671-4359-A48D-E7D52B06565C@arm.com>
 <2f14dad9-25f5-7ac7-4ff5-d756e6f55718@xen.org>
 <AAE00F7D-612B-47AC-82F9-BEEE9CB17804@arm.com>
 <b7bb99fb-c8d5-8852-9f35-3430a61d39b7@xen.org>
In-Reply-To: <b7bb99fb-c8d5-8852-9f35-3430a61d39b7@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.500.231)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3749:EE_|AM8PR08MB6545:EE_|AM7EUR03FT032:EE_|AS8PR08MB9148:EE_
X-MS-Office365-Filtering-Correlation-Id: de587e3c-628c-4b7a-de0e-08db587bb27d
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 pIi+lgMRpIhEcpWMM7jvwCLxnzewmAA4GYWFs2zahqDlbBOKGlsiJDNifVa2OAl0Hb1yL89j46HX1gomqWPhoushRPDNWMgyAi2/xxRHNN/qdPFhW9onV3sxSL8ZrKgYSuUkOGZcPotxETWNgJ8/cgswolGts814vAEljeOBDQw8n4bAsCbvqYJc/YqUBkafjQs2v/YeA2rsEEEYDoRFWKRBQAwvqWZsuCphdzcrMVCcaiWF8wvxRAuScaMYs1+fs97o5KGx8ADWiUbL/Z2kQdNzMG0D6Esy/n3ODbP7I1nzBEV49ZMbvZ8yixytJXtznpCGvu8llPo3Nje+y3T7XLDc/VqLqZUqQglwf9VtrztC7k/Nc4CsOS6e0fA1dXsZNJAu7zs0Fa4TcPhlGfdT7ZBDGy4pRFbIJyxCgcgNkKVsvtmKZg8DJiF9AVDvJrMpG79w8Zmkg3k4sQfXp/rpYts/yHvqNu8aA7iFMhrQV+EzEsLdqcIUhOQWHMXFkWiOKehjTMRgTd+3b/leYa8obfif3l2e+a3u6/v02oVhsLWidXAiEsj7nkw70GCtjWf0eeCAFXnfJIJAast6RJRBlOiRyQPfT6hoPnXTlDWlOjt3EoTC3qzDtMmS3RDwjPF97U7ikBIvAtPsVQ356wiLdw==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3749.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(136003)(346002)(366004)(396003)(376002)(451199021)(66556008)(66476007)(66446008)(76116006)(2906002)(64756008)(8936002)(8676002)(5660300002)(6916009)(91956017)(316002)(4326008)(66946007)(41300700001)(86362001)(2616005)(54906003)(478600001)(36756003)(6486002)(26005)(71200400001)(6512007)(6506007)(186003)(33656002)(53546011)(83380400001)(38070700005)(122000001)(38100700002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <BDE669DC3F704A4C80CEACAAC70802F9@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB6545
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT032.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	fe20f238-d2df-4642-2bdd-08db587ba77f
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	HB6e6e72divxtP8SDpD01ug5y1ASgFJse/4DUU/E2ReRwXyvGz1YvO8aSgLI1VoaWyG39nGiAfHGw3MWD9kDvUVSQcm1JCz9Tq82gPwmL3nuGu5UKGBMQK+1BhAkX0PnxZNqhgG5fb1OpKx4Ldo/zo2Rk0GcJLP4svUCEJ8orYYhaUbSMzic95sXMoTmR3VC4cCz3WjEqk8Qz64rQzpyCB2epVya7fB8a8JDUmWsVuwnghBj5OaEpHeWR9zTNkwl+N0aFE8kgwQ3rVckAK4vPxxlYm8cLsM6lIJYUZpLifneBP2noLBRdDgoIESYv7/pc1rwdv2bpyx3rGbyOjyhl+j/kY3RPJ82bkV1Ya/WqpvGK3i9I1U4sKX9Hgr73Ptlc/4AaCesvLwC4lsqI1Zki/WNkSBsX4YiNJePlO3e6e5EFf+APeVrvKNVL67EHD3KkhMhwy8AQCAXSgt4eFww8aOs5jCwrl3RR+P+tdxtFgSC1JRzeHFU9hSNgBwX+2sCDZiFUc4WbxbngLZBG2FQ0S7YY2J2N9mT47Xv8AIXdZVebdF9Y9hBGzfTvw2hXGTc7QucpWczKY0p3/6XdJ9pJQKua5+nS4XREBoU9SPgsWRqqg4355R3wDhumEQMQ85SRw6Y60pdlLMyqRYFmVwE6JCPq0yVwLeYexgTrPTFVETCIv+2JbHSAsXAZZ2BET8KCvxu6eSlsRIt8H6x5mx1cQd0vj2tbrVsXHnIqc0HQQgjL6As0XVDV39N8gOaAzFR
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(346002)(396003)(39860400002)(376002)(136003)(451199021)(36840700001)(40470700004)(46966006)(40460700003)(4326008)(70206006)(478600001)(70586007)(54906003)(316002)(33656002)(36756003)(86362001)(83380400001)(47076005)(107886003)(26005)(2616005)(186003)(336012)(36860700001)(6506007)(6512007)(53546011)(5660300002)(8676002)(6862004)(8936002)(2906002)(6486002)(82310400005)(40480700001)(41300700001)(81166007)(82740400003)(356005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2023 15:14:10.1403
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: de587e3c-628c-4b7a-de0e-08db587bb27d
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT032.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB9148



> On 19 May 2023, at 16:00, Julien Grall <julien@xen.org> wrote:
>=20
>=20
>=20
> On 19/05/2023 15:51, Luca Fancellu wrote:
>> /* Control Registers */
>> /*
>> * CPTR_EL2 needs to be written before calling vfp_restore_state, a
>> * synchronization instruction is expected after the write (isb)
>> */
>> WRITE_SYSREG(n->arch.cptr_el2, CPTR_EL2);
>> WRITE_SYSREG(n->arch.cpacr, CPACR_EL1);
>> /*
>> * This write to sysreg CONTEXTIDR_EL1 ensures we don't hit erratum
>> * #852523 (Cortex-A57) or #853709 (Cortex-A72).
>> * I.e DACR32_EL2 is not correctly synchronized.
>> */
>> WRITE_SYSREG(n->arch.contextidr, CONTEXTIDR_EL1);
>> WRITE_SYSREG(n->arch.tpidr_el0, TPIDR_EL0);
>> WRITE_SYSREG(n->arch.tpidrro_el0, TPIDRRO_EL0);
>> WRITE_SYSREG(n->arch.tpidr_el1, TPIDR_EL1);
>> if ( is_32bit_domain(n->domain) && cpu_has_thumbee )
>> {
>> WRITE_SYSREG(n->arch.teecr, TEECR32_EL1);
>> WRITE_SYSREG(n->arch.teehbr, TEEHBR32_EL1);
>> }
>> #ifdef CONFIG_ARM_32
>> WRITE_CP32(n->arch.joscr, JOSCR);
>> WRITE_CP32(n->arch.jmcr, JMCR);
>> #endif
>> isb();
>> /* VFP - call vfp_restore_state after writing on CPTR_EL2 + isb */
>> vfp_restore_state(n);
>> Maybe I misunderstood your preference, do you want me to put the write t=
o CPTR_EL2
>> right before the isb() that precedes vfp_restore_state?
>=20
> Yes please. Unless there is a reason to keep it "far away". The comments =
look good to me.

Ok, a question regarding README.LinuxPrimitives, is it some file taken from=
 an automated tool?
Because I see there is some kind of structure, how can I know if my syntax =
is correct?

>=20
> Cheers,
>=20
> --=20
> Julien Grall



